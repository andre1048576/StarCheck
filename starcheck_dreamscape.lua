
local mod_name = "Dreamscape"

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

    local text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    local switch_names = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y = i-COURSE_COTMC+1
        add_text(layout,{text = text[i],x = 0,y = y})
        for s = 0,3 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = y})
        end
        add_cap_switch(layout,{switch_color=switch_names[i],x=6,y=y})
    end

    add_text(layout,{text="B1",x=0,y=4})
    add_text(layout,{text="B2",x=0,y=5})
    add_text(layout,{text="B3",x=0,y=6})
    for i = COURSE_BITDW,COURSE_BITS do
        for s = 0,3 do
            add_star(layout,{star_num = s,course = i,x = s+2,y = i-COURSE_BITDW+4})
        end
    end
    add_text(layout,{text="OW",x=0,y=7})
    add_star(layout,{course = LEVEL_NONE,star_num = 3,x = 2,y = 7})
    add_star(layout,{course = LEVEL_NONE,star_num = 4,x = 3,y = 7})
    add_star(layout,{course = LEVEL_NONE,star_num = 0,x = 5,y = 7})
    add_star(layout,{course = LEVEL_NONE,star_num = 2,x = 7,y = 7})
    add_text(layout,{text="VZ",x=0,y=8})
    for s = 0,3 do
        add_star(layout,{star_num = s,course = COURSE_SA,x = s+2,y = 8})
    end
    add_text(layout,{text="Ao",x=0,y=9})
    for s = 0,3 do
        add_star(layout,{star_num = s,course = COURSE_WMOTR,x = s+2,y = 9})
    end
    add_text(layout,{text="- Endings -",x=4.5,y=11,center=true})
    add_text(layout,{text="Positive",x=0,y=12})
    add_star(layout,{course = COURSE_PSS,star_num = 0,x = 9,y = 12,right_align = true})
    add_text(layout,{text="Completionist",x=0,y=13})
    add_star(layout,{course = COURSE_PSS,star_num = 5,x = 9,y = 13,right_align = true})
    add_text(layout,{text="Nightmare",x=0,y=14})
    add_star(layout,{course = COURSE_PSS,star_num = 2,x = 9,y = 14,right_align = true})
    add_text(layout,{text="Frozen",x=0,y=15})
    add_star(layout,{course = COURSE_PSS,star_num = 1,x = 9,y = 15,right_align = true})
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