
local mod_name = "moonshine"

local function layout_page_1()
    local layout = {}
    add_text(layout,{text = "Archipelago's",x = 4.5,y = 1,center = true})
    add_text(layout,{text = "Waterfalls",x = 4.5,y = 2,center = true})
    for s = 0,6 do
        add_star(layout,{course = COURSE_BOB,star_num = s,x = s+1.5,y = 3,center = true})
    end
    add_text(layout,{text = "Down Street",x = 4.5,y = 4,center = true})
    for s = 0,6 do
        add_star(layout,{course = COURSE_WF,star_num = s,x = s+1.5,y = 5,center = true})
    end
    add_text(layout,{text = "Melted Ice",x = 4.5,y = 6,center = true})
    for s = 0,6 do
        add_star(layout,{course = COURSE_CCM,star_num = s,x = s+0.5 + s//3,y = 7,center = true})
    end
    add_text(layout,{text = "Skyland Fortress",x = 4.5,y = 8,center = true})
    for s = 0,6 do
        add_star(layout,{course = COURSE_HMC,star_num = s,x = s+1.5,y = 9,center = true})
    end
    add_text(layout,{text = "Forest Valley",x = 4.5,y = 10,center = true})
    for s = 0,1 do
        add_star(layout,{course = COURSE_PSS,star_num = s,x = s + 4,y = 11,center = true})
    end
    add_text(layout,{text = "Purple Swamp",x = 4.5,y = 12,center = true})
    for s = 0,1 do
        add_star(layout,{course = COURSE_BITFS,star_num = s,x = s + 4,y = 13,center = true})
    end
    add_text(layout,{text = "Green Plains",x = 4.5,y = 14,center = true})
    local starNum
    for s = 0,4 do
        starNum = (s ~= 4) and s or 6
        add_star(layout,{course = 11,star_num = starNum,x = s + 2.5,y = 15,center = true})
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text = "Castle Interior",x = 4.5,y = 1,center = true})
    add_star(layout,{course = COURSE_NONE,star_num = 1,x = 4,y = 2,center = true})
    add_cap_switch(layout,{switch_color = "red",x = 5,y = 2,center = true})
    add_text(layout,{text = "Green Woods",x = 4.5,y = 4,center = true})
    for s = 0,6 do
        add_star(layout,{course = COURSE_BBH,star_num = s,x = s+1,y = 5,center = true})
    end
    add_cap_switch(layout,{switch_color = "blue",x = 8,y = 5,center = true})
    add_text(layout,{text = "Sweet Sweet",x = 4.5,y = 7,center = true})
    add_text(layout,{text = "Rush",x = 4.5,y = 8,center = true})
    add_star(layout,{course = 7,star_num = 0,x = 3.5,y = 9,center = true})
    add_star(layout,{course = 7,star_num = 1,x = 4.5,y = 9,center = true})
    add_star(layout,{course = 7,star_num = 6,x = 5.5,y = 9,center = true})
    add_text(layout,{text = "Moonshine",y = 11,x = 4.5,center = true})
    add_star(layout,{course = COURSE_BITS,star_num = 0,x = 4,center = true,y = 12})
    add_star(layout,{course = COURSE_BITS,star_num = 1,x = 5,center = true,y = 12})
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