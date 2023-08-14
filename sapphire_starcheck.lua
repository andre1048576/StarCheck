
local mod_name = "SM64 \\#0f52ba\\Sapphire\\#ffffff\\ v1.1"

local course_names = {{"Maple","Meadow"},{"Polar","Peaks"},{"Lush","Lagoon"},{"Torchlight","Temple"},{"Supersonic","Slide"}}

local function sapphire_layout_page_1()
    local layout = {}
    local currY = 1
    for i = 1,5 do
        table.insert(layout,{type = "text",text = course_names[i][1],x = 4.5, y = currY,center = true})
        currY = currY + 1
        table.insert(layout,{type = "text",text = course_names[i][2],x = 4.5, y = currY,center = true})
        currY = currY + 1
        if i == 5 then break end
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+1.5,y = currY,center = true})
        end
        currY = currY + 1
    end
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 2.5,y = currY,center = true})
    table.insert(layout,{type = "cap_switch",switch_color = "red",x = 3.5,y = currY,center = true})
    table.insert(layout,{type = "cap_switch",switch_color = "blue",x = 4.5,y = currY,center = true})
    table.insert(layout,{type = "cap_switch",switch_color = "green",x = 5.5,y = currY,center = true})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x = 6.5,y = currY,center = true})
    return layout
end


local pages = {sapphire_layout_page_1}

local function generate_sapphire_layout(pageNum)
    return pages[pageNum]()
end

if star_check_layouts and mod_name ~= "template" then
    star_check_layouts[mod_name] = {pages = generate_sapphire_layout,page_count = #pages}
end