-- none 0 as basement star 
-- metal cap 0-2 and switch of course
-- all the caps
-- key 1 and bowser 1 as expected
-- same for b2 =D

-- course 12 only has 3 stars and is in ow1
-- same as course 11
-- and course 13 but in ow2 and 14

-- raging clue = none 1 (also ow2)

-- none 2 in ow2 as well


--courses 1-5 are ow1
--courses 6-9 are ow2
--course 10 is ow3
--11 and 12 are ow1
--13 and 14 are ow2
--15 is ow3
--metal cap in ow1
--others are ow2
--none 0 is ow1
--others are ow2
-- bowser 1 through 3 are in their respective groups


local mod_name = "Eureka"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    add_text(layout,{text = "OW1",x = 3,y = 1})
    add_star(layout,{course = COURSE_NONE, star_num = 0,x = 5.5,y = 1})
    for i = 1,5 do
        add_text(layout,{text = format_number(i),x = 0,y = i+1})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i+1})
        end
    end
    for i = 11,12 do
        add_text(layout,{text = format_number(i),x = 0,y = i-4})
        for s = 0,2 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i-4})
        end
    end
    add_text(layout, {text = "MC",x = 0,y = 9})
    for s = 0,2 do
        add_star(layout,{course = COURSE_COTMC,star_num = s,x = s+2,y = 9})
    end
    add_cap_switch(layout,{switch_color = "green",x = 5,y = 9})
    add_text(layout, {text = "B1",x = 0,y = 10})
    add_star(layout, {course = COURSE_BITDW,star_num = 0,x = 2,y = 10})
    add_key(layout,{key_num=1,x = 3,y = 10})


    add_text(layout,{text = "OW3",x = 4.5,y=12,center=true})
    add_text(layout,{text = "10",x = 0,y = 13})
    for s = 0,6 do
        add_star(layout,{course = 10,star_num = s,x = s+2,y = 13})
    end
    add_text(layout,{text = "15",x = 0,y = 14})
    for s = 0,2 do
        add_star(layout,{course = 15,star_num = s,x = s+2,y = 14})
    end
    add_text(layout,{text = "B3",x = 0,y = 15})
    add_star(layout,{course=COURSE_BITS,star_num=0,x = 2,y = 15})
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text = "OW2",x = 2.5,y = 1})
    add_star(layout,{course = COURSE_NONE, star_num = 1,x = 5,y = 1})
    add_star(layout,{course = COURSE_NONE, star_num = 2,x = 6,y = 1})
    for i = 6,9 do
        add_text(layout,{text = format_number(i),x = 0,y = i-4})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i-4})
        end
    end
    for i = 13,14 do
        add_text(layout,{text = format_number(i),x = 0,y = i-7})
        for s = 0,2 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i-7})
        end
    end
    add_text(layout, {text = "VC",x = 0,y = 8})
    for s = 0,2 do
        add_star(layout,{course = COURSE_VCUTM,star_num = s,x = s+2,y = 8})
    end
    add_cap_switch(layout,{switch_color = "blue",x = 5,y = 8})
    add_text(layout, {text = "WC",x = 0,y = 9})
    for s = 0,2 do
        add_star(layout,{course = COURSE_TOTWC,star_num = s,x = s+2,y = 9})
    end
    add_cap_switch(layout,{switch_color = "red",x = 5,y = 9})
    add_text(layout, {text = "B2",x = 0,y = 10})
    add_star(layout, {course = COURSE_BITFS,star_num = 0,x = 2,y = 10})
    add_key(layout,{key_num=2,x = 3,y = 10})
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