
local mod_name = "Super Mario and the Marvel Adventure"

local course_names = {{"Sunset","Shore"},{"Dusty","Desert"},{"Frostburn","Cavern"},{"Haunted","Forest"},{"Rugged","Moonbase"}}

local function layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_BBH do
        add_text(layout,{text = course_names[i][1],x = 4.5,y = 3*i-2,center = true})
        add_text(layout,{text = course_names[i][2],x = 4.5,y = 3*i-1,center = true})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+1.5,y = 3*i,center = true})
        end
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    add_text(layout,{text = "OW1 Toad",x = 0,y = 1})
    add_star(layout,{course = COURSE_NONE,star_num = 0,x = 6,y = 1})
    add_text(layout,{text = "Cap Island",x = 0,y = 2})
    add_star(layout,{course = COURSE_NONE,star_num = 0,x = 0,y = 3})
    add_star(layout,{course = COURSE_NONE,star_num = 1,x = 1,y = 3})
    add_cap_switch(layout,{switch_color="red",x = 2,y = 3})
    add_cap_switch(layout,{switch_color="blue",x = 3,y = 3})
    add_cap_switch(layout,{switch_color="green",x = 4,y = 3})
    add_text(layout,{text = "B1",x = 0,y = 5})
    add_star(layout,{star_num = 0,course = COURSE_BITFS,x = 2,y = 5})
    add_star(layout,{star_num = 1,course = COURSE_BITFS,x = 3,y = 5})
    add_star(layout,{star_num = 2,course = COURSE_BITFS,x = 4,y = 5})
    add_key(layout,{key_num = 1,collected = (SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR),x = 5,y = 5})
    add_text(layout,{text = "B2",x = 0,y = 6})
    add_star(layout,{star_num = 0,course = COURSE_BITS,x = 2,y = 6})
    add_star(layout,{star_num = 1,course = COURSE_BITS,x = 3,y = 6})
    add_star(layout,{star_num = 2,course = COURSE_BITS,x = 4,y = 6})

    add_text(layout,{text = "OW2 Toad",x = 0,y = 8})
    add_star(layout,{course = COURSE_NONE,star_num = 1,x = 6,y = 8})
    add_text(layout,{text = "Forest Den",x = 0,y = 9})
    add_star(layout,{star_num = 0,course = COURSE_PSS,x = 7,y = 9})
    add_text(layout,{text = "Fire Burrow",x = 0,y = 10})
    add_star(layout,{star_num = 0,course = COURSE_COTMC,x = 7,y = 10})
    add_text(layout,{text = "Dark Riddle",x = 0,y = 11})
    add_star(layout,{star_num = 0,course = COURSE_WMOTR,x = 7,y = 11})
    add_text(layout,{text = "Sky Race",x = 0,y = 12})
    add_star(layout,{star_num = 2,course = COURSE_TOTWC,x = 7,y = 12})
    add_text(layout,{text = "Cyberspace",x = 0,y = 13})
    add_star(layout,{star_num = 0,course = COURSE_BITDW,x = 7,y = 13})

    add_text(layout,{text = "The End",x = 0,y = 15})
    add_star(layout,{star_num = 0,course = COURSE_CAKE_END,x = 6, y = 15})
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