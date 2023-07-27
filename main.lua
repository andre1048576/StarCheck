-- name: Star Check
-- description: shows what stars are available in each area and which have been collected. Compatible with romhacks that include a template file!

local current_page = 1
local star_check_max_pages = -1
local page_increment = 1
local scale = 0.75 * 6
local pt = 15
local rowHeight = 19
local function change_scale(msg)
    if not tonumber(msg) then
        return false
    end
    num = tonumber(msg)
    if num < 1 or num > 100 then
        return false
    end
    scale = num/100 * 6
    return true
end
---@param color table
local function color_defaults(color)
    color.r = color.r or 255
    color.g = color.g or 255
    color.b = color.b or 255
    color.a = color.a or 255
    return color
end

function set_max_pages(pages)
    star_check_max_pages = pages
end

function set_double_flip(double_flip)
    if double_flip then
        page_increment = 2
    end
end

local function render_text(v,xOffset,yOffset)
    if v.color then
        c = color_defaults(v.color)
        djui_hud_set_color(c.r,c.g,c.b,c.a)
    end
    used_scale = scale
    if curr_font == FONT_MENU then
        used_scale = scale/3
    end
    if v.center then
        xOffset = xOffset - (djui_hud_measure_text(v.text)/2 * used_scale)
    elseif v.right_aligned then
        xOffset = xOffset - (djui_hud_measure_text(v.text) * used_scale)
    end
    djui_hud_print_text(v.text,v.x + xOffset,v.y + yOffset,used_scale)
    djui_hud_set_color(curr_color.r,curr_color.g,curr_color.b,curr_color.a)
end

local function render_star(v,xOffset, yOffset)
    local starFlags = save_file_get_star_flags(get_current_save_file_num() - 1, v.course - 1)
    if v.center then
        xOffset = xOffset - gTextures.star.width/2*scale
    elseif v.right_aligned then
        xOffset = xOffset - gTextures.star.width*scale
    end
    if (starFlags & (1 << v.star_num) ~= 0) then
        djui_hud_render_texture(gTextures.star, xOffset + v.x, v.y + yOffset, scale, scale)
    else
        djui_hud_print_text("x", v.x + xOffset, v.y + yOffset, scale)
    end
end

local function render_texture(v,xOffset,yOffset)
    texture = get_texture_info(v.texture)
    if v.center then
        xOffset = xOffset - texture.width/2*scale
    elseif v.right_aligned then
        xOffset = xOffset - texture.width*scale
    end
    v.scaleX = v.scaleX or 1
    v.scaleY = v.scaleY or 1
    djui_hud_render_texture(texture,v.x + xOffset,v.y + yOffset,scale * v.scaleX,scale * v.scaleY)
end

local function render_font(v)
    curr_font = v.font
    djui_hud_set_font(curr_font)
end

local function render_color(v)
    curr_color = color_defaults(v)
    djui_hud_set_color(v.r,v.g,v.b,v.a)
end

local function render_rect(v,xOffset,yOffset)
    if v.color then
        c = color_defaults(v.color)
        djui_hud_set_color(c.r,c.g,c.b,c.a)
    end
    v.width = v.width * pt * scale
    v.height = v.height * rowHeight * scale
    djui_hud_render_rect(v.x + xOffset, v.y + yOffset,v.width,v.height)
    djui_hud_set_color(curr_color.r,curr_color.g,curr_color.b,curr_color.a)
end

value_handler = {text = render_text,star = render_star,font = render_font,color = render_color,rect = render_rect,texture = render_texture}

local function render_page(pageNum,xOffset)
    list_to_generate = load_pages(pageNum)
    for _,v in pairs(list_to_generate) do
        --has coordinates, so multiply them by their grid sizes
        if v.x then
            v.x = v.x * pt * scale
            v.y = v.y * rowHeight * scale
        end
        value_handler[v.type](v,xOffset,0)
    end
    if star_check_max_pages > 2 then
        djui_hud_set_font(FONT_MENU)
        local msg
        if page_increment == 2 then
            msg = "<- Page " .. (current_page+1)//2 .. " ->"
        else
            msg = "<- Page " .. current_page .. " ->"
        end
        textScale = scale/3
        djui_hud_print_text(msg,djui_hud_get_screen_width()/2 - djui_hud_measure_text(msg)*textScale/2,100 - rowHeight*scale,textScale)
    end
end

local function render_header(headerNum,xOffset,yOffset)
    header = load_header(headerNum)
    if not header then return end
    for _,v in pairs(header) do
        if v.x then
            v.x = v.x * pt * scale
            v.y = v.y * rowHeight * scale
        end
        value_handler[v.type](v,xOffset,yOffset)
    end
end

local function on_hud_render()
    if not is_game_paused() then confirm = 0 return end

    djui_hud_set_resolution(RESOLUTION_DJUI)
    curr_font = FONT_HUD
    curr_color = {a = 255,r = 255, g = 255, b = 255}
    djui_hud_set_font(curr_font)
    left = 20
    right = djui_hud_get_screen_width() - 10*pt*scale
    djui_hud_set_color(255, 255, 255, 255)
    render_page(current_page,left)
    if current_page < star_check_max_pages then
        render_page(current_page+1,right)
    end
    render_header(current_page,djui_hud_get_screen_width()/2 - 5*scale*pt,100)
end

---@param m MarioState
local function page_control(m)
    if not is_game_paused() then confirm = 0 return end
    if star_check_max_pages <= 2 then return end
    if m.controller.buttonPressed & L_JPAD ~= 0 then
        --if you would underflow
        if current_page == 1 then
            current_page = star_check_max_pages - 1
        else
            current_page = current_page - page_increment
        end
    elseif m.controller.buttonPressed & R_JPAD ~= 0 then
        --if you would overflow
        if star_check_max_pages - current_page == 1 then
            current_page = 1
        else
            current_page = current_page + page_increment
        end
    end
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
hook_chat_command('scale', "[1 - 100] - adjust the scale of star check (75 is default)", change_scale)

hook_event(HOOK_MARIO_UPDATE,page_control)