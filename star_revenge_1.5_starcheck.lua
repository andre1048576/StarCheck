
local mod_name = "Star Revenge 1.5 - Star Takeover Redone"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function sr1_5_layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_TTM do
        local y =  i
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = y})
        for s = 0,6 do
            local x = (s+2)
            table.insert(layout,{type = "star",course = i,star_num = s,x = x,y = y})
        end
    end
    table.insert(layout,{type = "text",text = "DBV",x = 0, y = 14})
    for s = 0,6 do
        table.insert(layout,{type = "star",course = COURSE_THI,star_num = s,x = s,y = 15})
    end

    return layout
end

local function sr1_5_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "text",text = "OW1",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "OW2",x = 0, y = 3})
    table.insert(layout,{type = "text",text = "MC",x = 9, y = 1,right_align = true})
    table.insert(layout,{type = "text",text = "WC",x = 9, y = 3,right_align = true})
    table.insert(layout,{type = "text",text = "VC",x = 9, y = 5,right_align = true})
    table.insert(layout,{type = "text",text = "B1",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "B2",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "B3",x = 0, y = 8})
    table.insert(layout,{type = "text",text = "SSH",x = 0, y = 9})
    table.insert(layout,{type = "text",text = "Frozen Slide",x = 0, y = 11})
    table.insert(layout,{type = "text",text = "Weegee",x = 0, y = 13})
    table.insert(layout,{type = "text",text = "1-1",x = 9, y = 13,right_align = true})
    table.insert(layout,{type = "text",text = "PP",x = 9, y = 15,right_align = true})
    table.insert(layout,{type = "text",text = "TOTSS",x = 0, y = 15})

    --frozen slide
    for s = 0,3 do
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = s,x = s,y = 12})
    end

    --weegee
    table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 0,x = 4,y = 13})

    --bowser 1
    table.insert(layout,{type = "star",course = COURSE_BITFS,star_num = 0,x = 2,y = 6})
    table.insert(layout,{type = "key",x = 3,y = 6,key_num = 1})

    --bowser 2
    table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 0,x = 2,y = 7})
    table.insert(layout,{type = "key",x = 3,y = 7,key_num = 2})

    --bowser 3
    for s = 0,3 do
        table.insert(layout,{type = "star",course = COURSE_BITS,star_num = s,x = s + 2,y = 8})
    end

    --wing cap
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_TOTWC,star_num = s,x = s + 6,y = 4})
    end
    table.insert(layout,{type = "cap_switch",x = 5,y = 4,switch_color = "red"})

    --metal cap
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_COTMC,star_num = s,x = s + 6,y = 2})
    end
    table.insert(layout,{type = "cap_switch",x = 5,y = 2,switch_color = "green"})

    --vanish cap
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_VCUTM,star_num = s,x = s + 6,y = 6})
    end
    table.insert(layout,{type = "cap_switch",x = 5,y = 6,switch_color = "blue"})

    --pp
    table.insert(layout,{type = "star",course = COURSE_CAKE_END,star_num = 0,x = 4,y = 15})

    --totss
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 1,x = 6,y = 15})

    --ssh
    for s = 0,4 do
        table.insert(layout,{type = "star",course = COURSE_RR,star_num = s,x = s + 3,y = 9})
    end
    table.insert(layout,{type = "star",course = COURSE_RR,star_num = 6,x = 8,y = 9})

    --1-1
    table.insert(layout,{type = "star",course = COURSE_TTC,star_num = 0,x = 6,y = 13})

    --ow1
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 0,y = 2})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 5,x = 1,y = 2})
    --ow2
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 0,y = 4})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 1,y = 4})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 6,x = 2,y = 4})
    return layout
end

local pages = {sr1_5_layout_page_1,sr1_5_layout_page_2}
local function generate_sr1_5_layout(pageNum)
    return pages[pageNum]()
end

hook_event(HOOK_ON_PLAYER_CONNECTED,function ()
    ---@diagnostic disable-next-line: undefined-global
    if star_check_layouts and mod_name ~= "template" then
        ---@diagnostic disable-next-line: undefined-global
        star_check_layouts[mod_name] = {pages = generate_sr1_5_layout,page_count = #pages}
    end
end)