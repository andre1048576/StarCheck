
local mod_name = "Super Mario Rainbow Road"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_LLL do
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    return layout
end

local function layout_page_2()
    local layout = {}
    local cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    local switch_names = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y = 2
        local x =  3*(i-COURSE_COTMC)
        table.insert(layout,{type = "cap_switch",switch_color = switch_names[i],x = x+2,y = y})
        table.insert(layout,{type = "text",text = cap_text[i],x = x,y = y})
        table.insert(layout,{type = "star",course = i,star_num = 0,x = x,y = y + 1})
    end
    table.insert(layout,{type = "text",text = "Fiery Fortress",x = 0,y = 4})
    table.insert(layout,{type = "text",text = "Cap Courses",x = 0,y = 1})
    local y_end = 6
    local x_key = 1
    if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 54 then
        y_end = 8
        x_key = 2
        table.insert(layout,{type = "text",text = "Galaxy Palace",x = 0,y = 6})
        table.insert(layout,{type = "star",course = COURSE_BITS,star_num = 0,x = 0,y = 7})
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 1,y = 7})
        table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 1,x = 1,y = 5})
        table.insert(layout,{type = "star",course = COURSE_COTMC,star_num = 1,x = 1,y = 3})
        table.insert(layout,{type = "star",course = COURSE_TOTWC,star_num = 1,x = 4,y = 3})
        table.insert(layout,{type = "star",course = COURSE_VCUTM,star_num = 1,x = 7,y = 3})
    end
    table.insert(layout,{type = "key",key_num = 1,x=x_key,y=5})
    table.insert(layout,{type = "text",text = "End",x = 0,y = y_end})
    table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 0,x = 0,y = 5})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = y_end + 1})
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