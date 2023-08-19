local mod_name = "Despair Mario's Gambit"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    local yOffset = 0
    for i = COURSE_BOB,13 do
        if i == 11 then
            yOffset = 1
            goto continue
        end
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i + yOffset})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i + yOffset})
        end
        if i == 2 then
            yOffset = 2
            table.insert(layout,{type = "text",text = "Int.",x = 0, y = 3})
            table.insert(layout,{type = "text",text = "Cath.",x = 0, y = 4})
            --order in logical order (single stars first, 
            --followed by double stars and ending with an easy single again to help players identify doubles easier)
            inside_stars = {[0] = 2,6,1,4,3,5,0}
            for s = 0,6 do
                table.insert(layout,{type = "star",course = COURSE_SA,star_num = inside_stars[s],x = s+2,y = 3})
            end
            for s = 0,4 do
                table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = s,x = s+4,y = 4})
            end
        end
        ::continue::
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    table.insert(layout,{type = "text",text = "Overworld Stars",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "OW1",x = 0, y = 2})
    table.insert(layout,{type = "text",text = "OW2",x = 0, y = 3})
    table.insert(layout,{type = "text",text = "OW3",x = 0, y = 4})
    table.insert(layout,{type = "text",text = "Cap Courses",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "MC",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "WC",x = 0, y = 8})
    table.insert(layout,{type = "text",text = "VC",x = 0, y = 9})
    table.insert(layout,{type = "text",text = "Bowser Courses",x = 0, y = 11})
    table.insert(layout,{type = "text",text = "B1",x = 0, y = 12})
    table.insert(layout,{type = "text",text = "B2",x = 0, y = 13})
    table.insert(layout,{type = "text",text = "End",x = 0, y = 15})
    
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 3,y = 2})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 4,y = 2})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 5,y = 2})
    
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 3,y = 3})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 4,y = 3})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 6,x = 3,y = 4})
    
    local cap_colors = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    for i = COURSE_COTMC,COURSE_VCUTM do
        local y = i-COURSE_COTMC + 7
        for s = 0,4 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = y})
        end
        table.insert(layout,{type = "cap_switch",switch_color = cap_colors[i],x = 7,y = y})
    end
    for i = COURSE_BITDW,COURSE_BITFS do
        local y =  i - COURSE_BITDW + 12
        table.insert(layout,{type = "key",key_num = i-COURSE_BITDW+1,x=3,y=y})
        table.insert(layout,{type = "star",course = i,star_num = 0,x = 2,y = y})
    end

    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 4,x = 2,y = 15})
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
