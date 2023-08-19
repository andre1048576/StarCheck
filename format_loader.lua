
---@type table<string,Template>
_G.star_check_layouts = _G.star_check_layouts or {}


---@type string
local cached_romhack

function find_romhack()
    if not cached_romhack then
        for _,mods in pairs(gActiveMods) do
            if mods.incompatible == "romhack" then
                cached_romhack = mods.name
            end
        end
    end
    return cached_romhack
end

find_romhack()

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function vanilla_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        local y =  i
        add_text(layout,{text = format_number(i),x = 0, y = y})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = y})
        end
    end
    return layout
end

local function vanilla_layout_page_2()
    layout = {}
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  2
        if i ~= COURSE_BITS then
            add_key(layout,{type = "key",key_num = i-COURSE_BITDW+1,x=3*(i-COURSE_BITDW)+1,y=y+1})
        end
        add_text(layout,{text = "B" .. i-COURSE_BITDW+1,x = 3*(i-COURSE_BITDW),y = y})
        add_star(layout,{course = i,star_num = 0,x = 3*(i-COURSE_BITDW),y = y + 1})
    end
    cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    cap_colors = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y =  5
        local x = 3*(i-COURSE_COTMC)
        add_cap_switch(layout,{switch_color = cap_colors[i],x = x+1,y = y+1})
        add_text(layout,{text = cap_text[i],x = x,y = y})
        add_star(layout,{course = i,star_num = 0,x = x,y = y + 1})
    end
    
    add_star(layout,{course = COURSE_SA,star_num = 0,x = 0,y = 9})
    
    add_star(layout,{course = COURSE_PSS,star_num=0,x=0,y=11})
    add_star(layout,{course = COURSE_PSS,star_num=1,x=1,y=11})
    
    add_star(layout,{course = COURSE_WMOTR,star_num=0,x=0,y=13})
    
    for s = 0,2 do
        add_star(layout,{course = COURSE_NONE,star_num=s,x=s,y=15})
    end

    add_star(layout,{course = COURSE_NONE,star_num=3,x=6,y=15})
    add_star(layout,{course = COURSE_NONE,star_num=4,x=7,y=15})
    add_text(layout,{text = "Bowser Courses",x=0,y=1})
    add_text(layout,{text = "Cap Switches",x=0,y=4})
    add_text(layout,{text = "Secret Stars",x=0,y=7})
    add_text(layout,{text = "Aquarium",x=0,y=8})
    add_text(layout,{text = "Slide",x=0,y=10})
    add_text(layout,{text = "WMotR",x=0,y=12})
    add_text(layout,{text = "Toads",x=0,y=14})
    add_text(layout,{text = "Mips",x=8,y=14,right_align = true})
    return layout
end
local pagesVanilla = {vanilla_layout_page_1,vanilla_layout_page_2}

local function generate_vanilla_layout(pageNum)
    return pagesVanilla[pageNum]()
end

---@return Configuration[]
local function default_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        local y =  i
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = y})
        for s = 0,6 do
            local x = (s+2) 
            table.insert(layout,{type = "star",course = i,star_num = s,x = x,y = y})
        end
    end
    return layout
end

---@return Configuration[]
local function default_layout_page_2()
    ---@type Configuration[]
    local layout = {}
    local switch_names = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    local course_names = {"B1","B2","B3","SS","MC","WC","VC","WM","SA","CE","EN"}
    for i = COURSE_BITDW,COURSE_END do
        adj_i = i-COURSE_BITDW+1
        add_text(layout,{text = course_names[adj_i],x = 0,y = adj_i})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = adj_i})
        end
        if i <= COURSE_BITFS then
            add_key(layout,{key_num = i-COURSE_BITDW+1,x=-1,y = adj_i})
        end
        if i >= COURSE_COTMC and i <= COURSE_VCUTM then
            add_cap_switch(layout,{switch_color = switch_names[i],x = -1,y = adj_i})
        end
    end
    add_text(layout,{text = "NO",x = 0,y = 12})
    for s = 0,6 do
        add_star(layout,{course = LEVEL_NONE,star_num = s,x = s+2,y = 12})
    end
    return layout
end

---@type fun(): Configuration[]
local pages = {default_layout_page_1,default_layout_page_2}

---@param pageNum integer
---@return Configuration[]
local function generate_default_layout(pageNum)
    return pages[pageNum]()
end

--#region layout insertion code

---never use this in a template
---@param layout Configuration[]
---@param parameters Configuration
local function add_to_layout(layout,parameters)
    table.insert(layout, parameters)
end

---@param layout Configuration[]
---@param star_parameters StarRenderable
function add_star(layout, star_parameters)
    star_parameters.type = "star"
    add_to_layout(layout, star_parameters)
end

---@param layout Configuration[]
---@param key_parameters KeyRenderable
function add_key(layout, key_parameters)
    key_parameters.type = "key"
    add_to_layout(layout, key_parameters)
end

---@param layout Configuration[]
---@param cap_switch_parameters CapSwitchRenderable
function add_cap_switch(layout, cap_switch_parameters)
    cap_switch_parameters.type = "cap_switch"
    add_to_layout(layout, cap_switch_parameters)
end

---@param layout Configuration[]
---@param rect_parameters RectRenderable
function add_rect(layout, rect_parameters)
    rect_parameters.type = "rect"
    add_to_layout(layout, rect_parameters)
end

---@param layout Configuration[]
---@param texture_parameters TextureRenderable
function add_texture(layout, texture_parameters)
    texture_parameters.type = "texture"
    add_to_layout(layout, texture_parameters)
end

---@param layout Configuration[]
---@param text_parameters TextRenderable
function add_text(layout, text_parameters)
    text_parameters.type = "text"
    add_to_layout(layout, text_parameters)
end

---@param layout Configuration[]
---@param font_parameters FontConfiguration
function add_font(layout, font_parameters)
    font_parameters.type = "font"
    add_to_layout(layout, font_parameters)
end

---@param layout Configuration[]
---@param color_parameters ColorConfiguration
function add_color(layout, color_parameters)
    color_parameters.type = "color"
    add_to_layout(layout, color_parameters)
end

--#endregion layout insertion code




---@return Configuration[]
function load_pages(pageNum)
    romhack = find_romhack()
    if not romhack then
        set_max_pages(2)
        return generate_vanilla_layout(pageNum)
    elseif star_check_layouts[romhack] then
        set_double_flip(star_check_layouts[romhack].double_flip)
        set_max_pages(star_check_layouts[romhack].page_count)
        return star_check_layouts[romhack].pages(pageNum)
    else
        set_max_pages(2)
        return generate_default_layout(pageNum)
    end
end

---@return Configuration[]?
function load_header(headerNum)
    romhack = find_romhack()
    if not romhack then
        return nil
    elseif star_check_layouts[romhack] then
        if star_check_layouts[romhack].headers then
            return star_check_layouts[romhack].headers(headerNum)
        end
    end
    return nil
end