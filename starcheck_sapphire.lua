
local mod_name = "sapphire"

local course_names = {{"Maple","Meadow"},{"Polar","Peaks"},{"Lush","Lagoon"},{"Torchlight","Temple"},{"Supersonic","Slide"}}

local function layout_page_1()
    local layout = {}
    local currY = 1
    for i = 1,5 do
        add_text(layout,{text = course_names[i][1],x = 4.5, y = currY,center = true})
        currY = currY + 1
        add_text(layout,{text = course_names[i][2],x = 4.5, y = currY,center = true})
        currY = currY + 1
        if i == 5 then break end
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+1.5,y = currY,center = true})
        end
        currY = currY + 1
    end
    add_star(layout,{course = COURSE_PSS,star_num = 0,x = 2.5,y = currY,center = true})
    add_cap_switch(layout,{switch_color = "red",x = 3.5,y = currY,center = true})
    add_cap_switch(layout,{switch_color = "blue",x = 4.5,y = currY,center = true})
    add_cap_switch(layout,{switch_color = "green",x = 5.5,y = currY,center = true})
    add_star(layout,{course = COURSE_PSS,star_num = 1,x = 6.5,y = currY,center = true})
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