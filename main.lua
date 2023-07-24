-- name: Star Check
-- description: shows what stars are available in each area and which have been collected. Compatible with romhacks that include a template file!

local current_page = 1
local star_check_max_pages = -1
local STAR_CHECK_SCALE = 0.75
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
    STAR_CHECK_SCALE = num/100
    return true
end

function set_max_pages(pages)
    star_check_max_pages = pages
end

local function render_page(pageNum,xOffset)
    list_to_generate = load_format(pageNum)
    scale = STAR_CHECK_SCALE
    if type(list_to_generate) == "table" then
        for _,v in pairs(list_to_generate) do
            --has coordinates, so multiply them by their grid sizes
            if v.x then
                v.x = v.x * pt
                v.y = v.y * rowHeight
            end
            if v.type == "text" then
                --font_menu should be smaller than the rest
                if curr_font == FONT_MENU then
                    djui_hud_print_text(v.text,v.x * scale + xOffset,v.y * scale,scale/3)
                else
                    djui_hud_print_text(v.text,v.x * scale + xOffset,v.y * scale,scale)
                end
            elseif v.type == "star" then
                local starFlags = save_file_get_star_flags(get_current_save_file_num() - 1, v.course - 1)
                if (starFlags & (1 << v.star_num) ~= 0) then
                    djui_hud_render_texture(gTextures.star, xOffset + v.x * scale, v.y * scale, scale, scale)
                else
                    djui_hud_print_text("x", v.x * scale + xOffset, v.y * scale, scale)
                end
            elseif v.type == "font" then
                curr_font = v.font
                djui_hud_set_font(curr_font)
            elseif v.type == "color" then
                djui_hud_set_color(v.r,v.g,v.b,v.a)
            end
        end
        if star_check_max_pages > 2 then
            djui_hud_set_font(FONT_MENU)
            msg = "<- Page " .. current_page .. " ->"
            textScale = scale/3
            djui_hud_print_text(msg,djui_hud_get_screen_width()/2 - djui_hud_measure_text(msg)*textScale/2,rowHeight,textScale)
        end
    else
        djui_hud_set_font(FONT_MENU)
        djui_hud_print_text(list_to_generate,140,100,0.2)
    end
end

local function on_hud_render()
    if not is_game_paused() then confirm = 0 return end

    djui_hud_set_resolution(RESOLUTION_N64)
    curr_font = FONT_HUD
    djui_hud_set_font(curr_font)
    left = 10
    right = djui_hud_get_screen_width() - 10*15*STAR_CHECK_SCALE
    djui_hud_set_color(255, 255, 255, 255)
    render_page(current_page,left)
    if current_page < star_check_max_pages then
        render_page(current_page+1,right)
        
    end
end
---@param m MarioState
local function page_control(m)
    if not is_game_paused() then confirm = 0 return end
    if star_check_max_pages <= 2 then return end
    if m.controller.buttonPressed & L_JPAD ~= 0 then
        --if you would underflow
        if current_page <= 1 then
            current_page = star_check_max_pages - 1
        else
            current_page = current_page - 1
        end
    elseif m.controller.buttonPressed & R_JPAD ~= 0 then
        --if you would overflow
        if star_check_max_pages - current_page <= 1 then
            current_page = 1
        else
            current_page = current_page + 1
        end
    end
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
hook_chat_command('scale', "[1 - 100] - adjust the scale of star check (75 is default)", change_scale)

hook_event(HOOK_MARIO_UPDATE,page_control)