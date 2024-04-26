
local mod_name = "castle"

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
    add_text(layout,{text = "Midnight City Sky",x = 4.5,y = 1,center = true})
    add_star(layout,{course = COURSE_TOTWC,star_num = 0,x = 4,y = 2,center = true})
    add_cap_switch(layout,{switch_color = "red",x = 5,y = 2,center = true})
    add_text(layout,{text = "Magma Chamber",x = 4.5,y = 3,center = true})
    add_star(layout,{course = COURSE_COTMC,star_num = 0,x = 3.5,y = 4,center = true})
    add_star(layout,{course = COURSE_COTMC,star_num = 1,x = 4.5,y = 4,center = true})
    add_cap_switch(layout,{switch_color = "green",x = 5.5,y = 4,center = true})
    add_text(layout,{text = "Faded Forest",x = 4.5,y = 5,center = true})
    add_star(layout,{course = COURSE_VCUTM,star_num = 0,x = 3,y = 6,center = true})
    add_star(layout,{course = COURSE_VCUTM,star_num = 1,x = 4,y = 6,center = true})
    add_star(layout,{course = COURSE_VCUTM,star_num = 2,x = 5,y = 6,center = true})
    add_cap_switch(layout,{switch_color = "blue",x = 6,y = 6,center = true})
    add_text(layout,{text = "Busy Road",x = 4.5,y = 7,center=true})
    add_star(layout,{course = COURSE_SA,star_num = 0,x = 4,y = 8,center = true})
    add_star(layout,{course = COURSE_SA,star_num = 1,x = 5,y = 8,center = true})
    add_text(layout,{text = "Oil Rig",x = 4.5,y = 9,center=true})
    add_star(layout,{course = COURSE_PSS,star_num = 0,x = 4,y = 10,center=true})
    add_star(layout,{course = COURSE_PSS,star_num = 1,x = 5,y = 10,center=true})
    add_text(layout,{text = "Seasonal Void",x = 4.5,y = 11,center=true})
    add_star(layout,{course = COURSE_PSS,star_num = 0,x = 4,y = 12,center=true})
    add_star(layout,{course = COURSE_PSS,star_num = 1,x = 5,y = 12,center=true})
    for i = COURSE_BITDW,COURSE_BITS do
        local y = 13
        if i < COURSE_BITS then
            add_key(layout,{key_num = i-COURSE_BITDW+1,x=3*(i-COURSE_BITDW)+1,y=y+1})
        end
        add_text(layout,{text = "B" .. i-COURSE_BITDW+1,x =  3*(i-COURSE_BITDW),y = y})
        local extra = 0
        if i == COURSE_BITS then
            extra = 0.5
        end
        add_star(layout,{course = i,star_num = 0,x =  3*(i-COURSE_BITDW) + extra,y = y + 1})
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