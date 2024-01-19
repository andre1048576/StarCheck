local mod_name = "The Phantom's Call"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local course_names = {{"Penguin","Promenade"},{"Sugarsweet","Bakery"},{"Silent","Cistern"},{"Blizzbreak","Industries"}}

local function layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_CCM do
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
    add_text(layout,{text = "Cap Dilemma",x = 4.5,y = 1,center = true})
    add_star(layout,{course = COURSE_TOTWC,star_num = 0,x = 4.5,y = 2,center = true})
    add_text(layout,{text = "Koopa Race",x = 4.5,y = 4,center = true})
    add_star(layout,{course = COURSE_BITDW,star_num = 0,x = 3,y = 5,center = true})
    add_cap_switch(layout,{switch_color = "red",x = 4,y = 5,center = true})
    add_cap_switch(layout,{switch_color = "green",x = 5,y = 5,center = true})
    add_cap_switch(layout,{switch_color = "blue",x = 6,y = 5,center = true})
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