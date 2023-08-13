
local mod_name = "Star Road"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function star_road_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do 
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do 
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    return layout
end

local function star_road_layout_page_2()
    local layout = {}
    for i = COURSE_BITDW,COURSE_BITS do
        local y = 2
        if i < COURSE_BITS then
            xUsed = 1
            if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 121 then
                xUsed = 2
            end
            table.insert(layout,{type = "key",key_num = i-COURSE_BITDW+1,x=3*(i-COURSE_BITDW)+xUsed,y=3})
        end
        table.insert(layout,{type = "text",text = "B" .. i-COURSE_BITDW+1,x =  3*(i-COURSE_BITDW),y = y}) 
        table.insert(layout,{type = "star",course = i,star_num = 0,x =  3*(i-COURSE_BITDW),y = y + 1})
    end
    local cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    local switch_names = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y = 5
        local x =  3*(i-COURSE_COTMC)
        local xUsed = 1
        if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 121 then
            xUsed = 2
        end
        table.insert(layout,{type = "cap_switch",switch_color = switch_names[i],x = x+xUsed,y = y+1})
        table.insert(layout,{type = "text",text = cap_text[i],x = x,y = y}) 
        table.insert(layout,{type = "star",course = i,star_num = 0,x = x,y = y + 1})
    end

    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 9})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 1,x =  1,y = 9})

    --PSS
    local y = 11
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 0,y = y})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x =  1,y = y})


    y = 13
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_NONE,star_num = s,x =  s ,y = y})
    end
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x =  7 ,y = y})


    y = 15
    table.insert(layout,{type = "star",course = COURSE_CAKE_END,star_num = 1,x = 0,y = y})
 

    table.insert(layout,{type = "text",text = "Bowser Courses",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "Cap Switches",x = 0, y = 4})
    table.insert(layout,{type = "text",text = "Secret Stars",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "Sandy Slide",x = 0, y = 8})
    table.insert(layout,{type = "text",text = "Mushroom Town",x = 0, y = 10})
    table.insert(layout,{type = "text",text = "Toads",x = 0, y = 12})
    table.insert(layout,{type = "text",text = "Mips",x =  6, y = 12})
    table.insert(layout,{type = "text",text = "End",x = 0, y = 14})


    if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 120 then
        table.insert(layout,{type = "text",text = "H Palace",x =  4, y = 14}) 
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 0,x =  6,y = 15})
    end
    if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 121 then
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 5,x =  7,y = 15})
        for i = COURSE_BITDW,COURSE_BITS do
            table.insert(layout,{type = "star",course = i,star_num = i-13,x =  3*(i-COURSE_BITDW) + 1,y = 3})
        end
        cap_star_nums = {[COURSE_COTMC] = 4,[COURSE_TOTWC] = 5,[COURSE_VCUTM] = 5}
        for i = COURSE_COTMC,COURSE_VCUTM do
            table.insert(layout,{type = "star",course = i,star_num = cap_star_nums[i],x =  3*(i-COURSE_COTMC) + 1,y = 6})
        end
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 5,x =  2,y = 11})
        table.insert(layout,{type = "star",course = COURSE_SA,star_num = 5,x =  2,y = 9})
    end
    return layout
end
local pages = {star_road_layout_page_1,star_road_layout_page_2}

local function generate_star_road_layout(pageNum)
    return pages[pageNum]()
end

---@diagnostic disable-next-line: undefined-global
if star_check_layouts and mod_name ~= "template" then
    ---@diagnostic disable-next-line: undefined-global
    star_check_layouts[mod_name] = {pages = generate_star_road_layout,page_count = #pages}
end