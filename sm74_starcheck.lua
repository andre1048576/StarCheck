---@diagnostic disable: undefined-global

local mod_name = "Super Mario 74 (+EE)"
local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function sm74_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        local y =  i
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = y})
        for s = 0,6 do
            local x = (s+2)
            table.insert(layout,{type = "star",course = i,star_num = s,x = x,y = y})
        end
    end
    return layout
end


local function sm74_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "text",text = "OW1",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "OW2",x = 0, y = 2})
    table.insert(layout,{type = "text",text = "OW3",x = 0, y = 3})
    table.insert(layout,{type = "text",text = "MC",x = 0, y = 5})
    table.insert(layout,{type = "text",text = "WC",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "VC",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "B1",x = 0, y = 9})
    table.insert(layout,{type = "text",text = "B2",x = 0, y = 10})
    table.insert(layout,{type = "text",text = "B3",x = 0, y = 11})
    table.insert(layout,{type = "text",text = "Frozen Slide",x = 0, y = 12})
    table.insert(layout,{type = "text",text = "Champ C.",x = 0, y = 14})
    table.insert(layout,{type = "text",text = "151st",x = 9, y = 14,right_align = true})
    --OW1
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 3,y = 1})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 4,y = 1})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 5,y = 1})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 6,y = 1})

    --OW2
    for s = 0,5 do
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = s,x = s+3,y = 2})
    end

    --OW3
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 3,y = 3})
    
    --CAPS
    local cap_colors = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    local cap_stars = {[COURSE_COTMC] = 4,[COURSE_TOTWC] = 2,[COURSE_VCUTM] = 5}
    for i = COURSE_COTMC,COURSE_VCUTM do
        local y = i-15
        for s = 0,cap_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = y})
        end
        table.insert(layout,{type = "cap_switch",switch_color = cap_colors[i],x = cap_stars[i]+3,y = y})
    end

    --BOWSER
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  i - 7
        if i < COURSE_BITS then
            table.insert(layout,{type = "key",key_num = i - COURSE_BITDW+1,x= i-10,y=y})
        end
        for s = 0,(i-13) do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = y})
        end
    end

    for s = 0,3 do
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = s,x = s,y = 13})
    end

    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 15})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 2,x = 9,y = 15,right_align = true})
    return layout
end

local function sm74EE_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "text",text = "OW1",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "OW2",x = 0, y = 2})
    table.insert(layout,{type = "text",text = "OW3",x = 0, y = 3})
    table.insert(layout,{type = "text",text = "MC",x = 0, y = 5})
    table.insert(layout,{type = "text",text = "WC",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "VC",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "B1",x = 0, y = 9})
    table.insert(layout,{type = "text",text = "B2",x = 0, y = 10})
    table.insert(layout,{type = "text",text = "B3",x = 0, y = 11})
    table.insert(layout,{type = "text",text = "Supply Slide",x = 0, y = 12})
    table.insert(layout,{type = "text",text = "Triarch Bridge",x = 0, y = 14})
    --OW1
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 3,y = 1})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 4,y = 1 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 5,y = 1 })

    --OW2
    for s = 0,5 do
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = s,x = s+3,y = 2 })
    end

    --OW3
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 3,y = 3 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 4,y = 3 })

    --CAPS
    local cap_colors = {[COURSE_COTMC] = "green",[COURSE_TOTWC] = "red",[COURSE_VCUTM] = "blue"}
    local cap_stars = {[COURSE_COTMC] = 5,[COURSE_TOTWC] = 2,[COURSE_VCUTM] = 5}
    for i = COURSE_COTMC,COURSE_VCUTM do
        local y = i-15
        for s = 0,cap_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = y})
        end
        table.insert(layout,{type = "cap_switch",switch_color = cap_colors[i],x = cap_stars[i]+3,y = y})
    end

    --BOWSER
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  i - 7
        if i < COURSE_BITS then
            table.insert(layout,{type = "key",key_num = i - COURSE_BITDW+1,x= i-10,y=y})
        end
        for s = 0,(i-13) do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = y})
        end
    end

    --SUPPLY SLIDE
    for s = 0,3 do
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = s,x = s,y = 13})
    end

    --TRIARCH BRIDGE
    for s = 0,6 do
        table.insert(layout,{type = "star",course = COURSE_SA,star_num = s,x = s,y = 15})
    end
    return layout
end


local pages = {sm74_layout_page_1,sm74_layout_page_2}
local pagesEE = {sm74_layout_page_1,sm74EE_layout_page_2}

local function generate_sm74_layout(pageNum)
    if gNetworkPlayers[0].currAreaIndex ~= 1 then
        return pagesEE[pageNum]()
    else
        return pages[pageNum]()
    end
end

if star_check_layouts and mod_name ~= "template" then
    star_check_layouts[mod_name] = {pages = generate_sm74_layout,page_count = #pages}
end