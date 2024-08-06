
local mod_name = "fallen-stars"

local course_names = {{"Bob-omb","Harbor"},{"Skydice","Garden"},{"Moon Night","Bay"}}

local function layout_page_1()
    local layout = {}
    local cap_colors = {"blue","green","red"}
    add_text(layout,{text = "Overworld",x = 4.5,y = 1,center = true})
    for i,v in pairs({1,2,5}) do
        add_cap_switch(layout,{switch_color = cap_colors[i],x = 2.5 + i,y = 2,center = true})
        add_text(layout,{text = course_names[i][1],x = 4.5,y = 3*i,center = true})
        add_text(layout,{text = course_names[i][2],x = 4.5,y = 3*i+1,center = true})
        for s = 0,6 do
            add_star(layout,{course = v,star_num = s,x = 1.5 + s,y = 3*i+2,center = true})
        end
    end
    add_text(layout,{text = "Bowser's Icy",x = 0,y = 12})
    add_text(layout,{text = "Mountain",x = 0,y = 13})
    add_star(layout,{star_num = 0,course = COURSE_BITDW,x = 5.5,y = 13})
    add_star(layout,{star_num = 1,course = COURSE_BITDW,x = 6.5,y = 13})

    add_text(layout,{text = "The End",x = 0,y = 15})
    add_star(layout,{star_num = 0,course = COURSE_WMOTR,x = 5.5,y = 15})
    return layout
end

local pages = {layout_page_1}

local function generate_layout(pageNum)
    return pages[pageNum]()
end


if mod_name ~= "template" then
    _G.star_check_layouts = _G.star_check_layouts or {}
    star_check_layouts[mod_name] = {pages = generate_layout,page_count = #pages}
end