
local mod_name = "SM64: The Green Stars"

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
    table.insert(layout,{type = "text",text = "Bowser",x =  0,y = 1})
    table.insert(layout,{type = "text",text = "Caps",x =  5,y = 1})
    local bowser_stars = {[COURSE_BITDW] = 2, [COURSE_BITFS] = 3,[COURSE_BITS] = 3}
    for i = COURSE_BITDW,COURSE_BITS do
        local y = 2 + (i-COURSE_BITDW)*3
        if i < COURSE_BITS then
            table.insert(layout,{type = "key",key_num = i - COURSE_BITDW + 1,x=2,y=y})
        end
        table.insert(layout,{type = "text",text = "B" .. i-COURSE_BITDW+1,x =  0,y = y})
        for s = 0,bowser_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x =  s,y = y + 1})
        end
    end
    
    local cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC"}
    local cap_colors = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red"}
    local cap_stars = {[COURSE_COTMC] = 2,[COURSE_TOTWC] = 1}
    for i = COURSE_COTMC, COURSE_TOTWC do
        local y = 2 + 3*(i-COURSE_COTMC)
        table.insert(layout,{type = "cap_switch",switch_color = cap_colors[i],x = 5,y = y})
        table.insert(layout,{type = "text",text = cap_text[i],x = 8,y = y, right_align = true})
        for s = 0,cap_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x = 7 - cap_stars[i] + s,y = y + 1})
        end
    end
    table.insert(layout,{type = "text",text = "Toads",x = 8,y = 8,right_align = true})
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_NONE,star_num = s,x = 5 + s,y = 9})
    end
    table.insert(layout,{type = "text",text = "Ancient Temple",x = 0,y = 11})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 12})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 1,x = 1,y = 12})
    table.insert(layout,{type = "text",text = "Nostalgia Slide",x = 0,y = 14})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 0,y = 15})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x = 1,y = 15})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 2,x = 2,y = 15})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 3,x = 3,y = 15})
    return layout
end
local pages = {template_layout_page_1,template_layout_page_2}

local function generate_template_layout(pageNum)
    return pages[pageNum]()
end

if star_check_layouts and mod_name ~= "template" then
    star_check_layouts[mod_name] = {pages = generate_template_layout,page_count = #pages}
end