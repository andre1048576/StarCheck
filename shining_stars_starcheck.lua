
local mod_name = "\\#ffffff\\Shining Stars"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        add_text(layout,{text = format_number(i),x = 0,y = i})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i})
        end
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text = "OW1",x = 0, y = 1})
    add_text(layout,{text = "OW2",x = 3, y = 1})
    add_text(layout,{text = "OW3",x = 6, y = 1})
    add_text(layout,{text = "DD",x = 0, y = 4})
    add_text(layout,{text = "SC",x = 0, y = 5})
    add_text(layout,{text = "ST",x = 0, y = 6})
    add_text(layout,{text = "SS",x = 0, y = 7})
    add_text(layout,{text = "B1",x = 0, y = 9})
    add_text(layout,{text = "B2",x = 0, y = 10})
    add_text(layout,{text = "B3",x = 0, y = 11})
    add_text(layout,{text = "New Shine City",x = 0, y = 12})
    add_text(layout,{text = "Star Temple",x = 0, y = 14})

    add_star(layout,{star_num = 3,course = COURSE_NONE,x = 0,y = 2})
    add_star(layout,{star_num = 2,course = COURSE_NONE,x = 3,y = 2})
    add_star(layout,{star_num = 4,course = COURSE_NONE,x = 4,y = 2})
    add_star(layout,{star_num = 1,course = COURSE_NONE,x = 6,y = 2})
    local cap_colors = {"blue","green","red"}
    for i = COURSE_COTMC,COURSE_VCUTM do
        for s = 0,4 do
            add_star(layout,{star_num = s,course = i,x = s+2,y = i-COURSE_COTMC+4})
        end
        add_cap_switch(layout,{switch_color = cap_colors[i-COURSE_COTMC+1],x = 7,y = i-COURSE_COTMC+4})
    end

    add_star(layout,{star_num = 0,course = COURSE_PSS,x = 2,y = 7})
    add_star(layout,{star_num = 1,course = COURSE_PSS,x = 3,y = 7})
    add_star(layout,{star_num = 3,course = COURSE_PSS,x = 4,y = 7})

    for i = COURSE_BITDW,COURSE_BITS do
        for s = 0,3 do
            add_star(layout,{star_num = s,course = i,x = s+2,y = i-COURSE_BITDW+9})
        end
        if i ~= COURSE_BITS then
            add_key(layout,{key_num = i-COURSE_BITDW + 1,y = i-COURSE_BITDW+9,x = 6})
        end
    end

    for s = 0,5 do
        add_star(layout,{star_num = s,course = COURSE_WMOTR,x = s,y = 13})
        add_star(layout,{star_num = s,course = COURSE_SA,x = s,y = 15})
    end

    return layout
end
local pages = {layout_page_1,layout_page_2}

local function generate_layout(pageNum)
    return pages[pageNum]()
end


if mod_name ~= "template" then
    _G.star_check_layouts = _G.star_check_layouts or {}
    star_check_layouts[mod_name] = {pages = generate_layout,page_count = #pages}
end