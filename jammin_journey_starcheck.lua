
local mod_name = "Super Mario's Jammin Journey"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function template_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,8 do
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    table.insert(layout,{type = "text",text = "OW1 Reds",y = 10, x = 0})
    table.insert(layout,{type = "text",text = "OW1 Mips",y = 11, x = 0})
    table.insert(layout,{type = "text",text = "OW1 Toad",y = 12, x = 0})
    table.insert(layout,{type = "text",text = "OW2 Toad",y = 13, x = 0})
    table.insert(layout,{type = "text",text = "OW3 Toad",y = 14, x = 0})

    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 6,y = 10})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 6,y = 11})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 6,y = 12})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 6,y = 13})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 6,y = 14})
    return layout
end

local function template_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "text",text = "Bowser Courses",y = 1, x = 0})
    table.insert(layout,{type = "text",text = "B1",y = 2, x = 0})
    table.insert(layout,{type = "text",text = "B2",y = 2, x = 9,right_align = true})
    table.insert(layout,{type = "text",text = "Cap Courses",y = 4, x = 0})
    table.insert(layout,{type = "text",text = "WC",y = 5, x = 0})
    table.insert(layout,{type = "text",text = "MC",y = 6, x = 0})
    table.insert(layout,{type = "text",text = "VC",y = 7, x = 0})
    table.insert(layout,{type = "text",text = "Peach Portrait",y = 9, x = 0})
    table.insert(layout,{type = "text",text = "Crystal Cavern",y = 12, x = 0})
    table.insert(layout,{type = "text",text = "Toad Tunnel",y = 14, x = 0})

    table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 0,x = 2,y = 2})
    table.insert(layout,{type = "star",course = COURSE_BITS,star_num = 0,x = 7,y = 2,right_align = true})
    table.insert(layout,{type = "star",course = COURSE_TOTWC,star_num = 0,x = 2,y = 5})
    table.insert(layout,{type = "star",course = COURSE_COTMC,star_num = 0,x = 2,y = 6})
    table.insert(layout,{type = "star",course = COURSE_VCUTM,star_num = 0,x = 2,y = 7})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x = 0,y = 10})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 2,x = 1,y = 10})
    table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 0,x = 0,y = 13})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 15})

    table.insert(layout,{type = "key",key_num = 1,x=3,y=2})
    table.insert(layout,{type = "key",key_num = 2,x=6,y=2,right_align=true})

    table.insert(layout,{type = "cap_switch",switch_color = "red",x = 3,y = 5})
    table.insert(layout,{type = "cap_switch",switch_color = "green",x = 3,y = 6})
    table.insert(layout,{type = "cap_switch",switch_color = "blue",x = 3,y = 7})
    
    return layout
end

local pages = {template_layout_page_1,template_layout_page_2}

local function generate_template_layout(pageNum)
    return pages[pageNum]()
end

hook_event(HOOK_ON_PLAYER_CONNECTED,function ()
    ---@diagnostic disable-next-line: undefined-global
    if star_check_layouts and mod_name ~= "template" then
        ---@diagnostic disable-next-line: undefined-global
        star_check_layouts[mod_name] = {pages = generate_template_layout,page_count = #pages}
    end
end)