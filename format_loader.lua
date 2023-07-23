
_G.star_check_layouts = {}
local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function vanilla_layout_page_1()
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

local function vanilla_layout_page_2()
    layout = {}
    key_checks = {[COURSE_BITDW] = SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_UNLOCKED_BASEMENT_DOOR, [COURSE_BITFS] = SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR}
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  2
        table.insert(layout,{type = "font",font = FONT_MENU})
        if key_checks[i] and save_file_get_flags() & key_checks[i] ~= 0 then
            table.insert(layout,{type = "color",r = 0, g = 255,b = 0, a = 255})
        else
            table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        end
        table.insert(layout,{type = "text",text = "B" .. i-COURSE_BITDW+1,x = 3*(i-COURSE_BITDW),y = y})
        table.insert(layout,{type = "font",font = FONT_HUD})
        table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        table.insert(layout,{type = "star",course = i,star_num = 0,x = 3*(i-COURSE_BITDW),y = y + 1})
    end
    cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    cap_checks = {[COURSE_COTMC] = SAVE_FLAG_HAVE_METAL_CAP,[COURSE_TOTWC] = SAVE_FLAG_HAVE_WING_CAP,[COURSE_VCUTM] = SAVE_FLAG_HAVE_VANISH_CAP}
    cap_colors = {[COURSE_COTMC] = {type = "color", r = 0, g = 255, b = 0, a = 255},[COURSE_TOTWC] = {type = "color", r = 255, g = 0, b = 0, a = 255},[COURSE_VCUTM] = {type = "color", r = 0, g = 0, b = 255, a = 255}}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y =  5
        local x = 3*(i-COURSE_COTMC) 
        if save_file_get_flags() & cap_checks[i] ~= 0 then
            table.insert(layout,cap_colors[i])
        else
            table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = cap_text[i],x = x,y = y})
        table.insert(layout,{type = "font",font = FONT_HUD})
        table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        table.insert(layout,{type = "star",course = i,star_num = 0,x = x,y = y + 1})
    end

    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 9})


    y =  11
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 0,y = y})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x = 1,y = y})

    y =  13
    table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 0,x = 0,y = y})

    y =  15
    for s = 0,2 do
        table.insert(layout,{type = "star",course = COURSE_NONE,star_num = s,x = s ,y = y})
    end
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 6 ,y = y})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 7 ,y = y})

    table.insert(layout,{type = "font",font = FONT_MENU})

    table.insert(layout,{type = "text",text = "Bowser Courses",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "Cap Switches",x = 0, y = 4})
    table.insert(layout,{type = "text",text = "Secret Stars",x = 0, y = 7})
    table.insert(layout,{type = "text",text = "Aquarium",x = 0, y = 8})
    table.insert(layout,{type = "text",text = "Slide",x = 0, y = 10})
    table.insert(layout,{type = "text",text = "WMotR",x = 0, y = 12})
    table.insert(layout,{type = "text",text = "Toads",x = 0, y = 14})
    table.insert(layout,{type = "text",text = "Mips",x = 6, y = 14})
    return layout
end
local pages = {vanilla_layout_page_1,vanilla_layout_page_2}

local function generate_vanilla_layout(pageNum)
    return pages[pageNum]()
end


function find_romhack()
    for _,mods in pairs(gActiveMods) do
        if mods.incompatible == "romhack" then
            return mods.name
        end
    end
end

---@return table|string
function load_format(pageNum)
    romhack = find_romhack()
    if not romhack then
        set_max_pages(2)
        return generate_vanilla_layout(pageNum)
    elseif star_check_layouts[romhack] then
        set_max_pages(star_check_layouts[romhack].page_count)
        return star_check_layouts[romhack].pages(pageNum)
    else
        return "STARCHECK UNAVAILABLE FOR ROMHACK"
    end
    --]]
end

