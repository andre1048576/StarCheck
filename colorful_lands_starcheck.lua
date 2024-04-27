
local mod_name = "Mario In The Colorful Lands"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    for i = 1,8 do
        add_text(layout,{text = format_number(i),x = 0,y = i+1})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i+1})
        end
    end
    add_text(layout,{text = "OW",x = 0,y = 11})
    for s = 0,4 do
        add_star(layout,{course = LEVEL_NONE,star_num = s,x = s+2,y = 11})
    end
    local text = {[COURSE_COTMC] = "IC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    local switch_names = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y = i-COURSE_COTMC+12
        add_text(layout,{text = text[i],x = 0,y = y})
        for s = 0,4 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = y})
        end
        add_cap_switch(layout,{switch_color=switch_names[i],x=7,y=y})
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text="Hidden Hedge",x=4.5,y=1,center=true})
    add_text(layout,{text="Maze",x=4.5,y=2,center=true})
    for s = 0,4 do
        add_star(layout,{course = COURSE_SA,star_num = s,x = s+2.5,y = 3,center = true})
    end
    add_text(layout,{text="Colorful",x=4.5,y=4,center=true})
    add_text(layout,{text="Blocks",x=4.5,y=5,center=true})
    for s = 0,4 do
        add_star(layout,{course = COURSE_WMOTR,star_num = s,x = s+2.5,y = 6,center = true})
    end
    add_text(layout,{text="Bowser's",x=4.5,y=7,center=true})
    add_text(layout,{text="Colorful Castle",x=4.5,y=8,center=true})
    for s = 0,4 do
        add_star(layout,{course = COURSE_BITS,star_num = s,x = s+2.5,y = 9,center = true})
    end

    add_text(layout,{text="Cake Island",x=4.5,y=11,center=true})
    add_star(layout,{course = COURSE_PSS,star_num = 4,x = 4.5,y = 12,center = true})
    add_text(layout,{text="Bonus Quiz!",x=4.5,y=13,center=true})
    add_star(layout,{course = COURSE_BITDW,star_num = 4,x = 4.5,y = 14,center = true})
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