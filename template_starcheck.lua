
local mod_name = "template"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function template_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    return layout
end

local function template_layout_page_2()
    local layout = {}
    return layout
end
local pages = {template_layout_page_1,template_layout_page_2}

local function generate_template_layout(pageNum)
    return pages[pageNum]()
end

local function on_connect()
    ---@diagnostic disable-next-line: undefined-global
    if star_check_layouts and mod_name ~= "template" then
        ---@diagnostic disable-next-line: undefined-global
        star_check_layouts[mod_name] = {pages = generate_template_layout,page_count = #pages}
    end
end

hook_event(HOOK_ON_PLAYER_CONNECTED,on_connect)