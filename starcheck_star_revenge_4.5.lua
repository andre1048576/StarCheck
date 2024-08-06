
local mod_name = "Star Revenge 4.5"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    local stars_per_course = {4,4,4,4,5,4,3,3,5,4,2,4,4,3,4}
    for i = COURSE_BOB,COURSE_RR do
        add_text(layout,{text = format_number(i),x = 0,y = i})
        for s = 0,stars_per_course[i] do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i})
        end
        add_star(layout,{course = i,star_num = 6,x = 8,y = i})
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text = "OW",x = 0,y = 1})
    add_star(layout,{course = COURSE_NONE,star_num=1,x=2,y=1})
    add_star(layout,{course = COURSE_NONE,star_num=3,x=4,y=1})
    add_star(layout,{course = COURSE_NONE,star_num=4,x=5,y=1})
    add_text(layout,{text = "MC",x = 0,y = 3})
    add_star(layout,{course = COURSE_VCUTM,star_num=0,x=2,y=3})
    add_cap_switch(layout,{switch_color="green",x=3,y=3})
    add_text(layout,{text = "VC",x = 0,y = 4})
    add_star(layout,{course = COURSE_VCUTM,star_num=1,x=2,y=4})
    add_cap_switch(layout,{switch_color="blue",x=3,y=4})
    add_text(layout,{text="Blue Realm",x=0,y=6})
    add_star(layout,{course = LEVEL_ENDING,star_num=0,x=8,y=6})
    add_text(layout,{text="Sky Fortress",x=0,y=7})
    add_star(layout,{course = COURSE_WMOTR,star_num=0,x=8,y=7})

    add_text(layout,{text="Boss 1",x=0,y=9})
    add_text(layout,{text="Boss 2",x=0,y=10})
    add_text(layout,{text="Boss 3",x=0,y=11})
    add_text(layout,{text="Boss 4",x=0,y=12})
    add_text(layout,{text="Boss 5",x=0,y=13})
    add_text(layout,{text="Boss 6",x=0,y=14})
    add_star(layout,{course = COURSE_BITDW,star_num=0,x=4,y=9})
    add_star(layout,{course = COURSE_BITFS,star_num=0,x=4,y=10})
    add_key(layout,{key_num=1,x=5,y=9})
    add_key(layout,{key_num=2,x=5,y=10})
    add_star(layout,{course = COURSE_SA,star_num=2,x=4,y=12})
    add_cap_switch(layout,{switch_color={r=198,b=255,g=138,a=255},x=5,y=12,pressed=save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0})
    add_star(layout,{course = COURSE_COTMC,star_num=0,x=4,y=13})
    add_star(layout,{course = COURSE_BITS,star_num=0,x=4,y=14})
    add_star(layout,{course = COURSE_TOTWC,star_num=0,x=5,y=14})
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
