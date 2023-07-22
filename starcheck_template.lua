
local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function modded_layout_page_1()
    layout = {}
    for i = COURSE_BOB,COURSE_RR do
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s + 2,y = i})
        end
    end
    return layout
end


local function modded_layout_page_2()
    local layout = {}
    return layout
end

local pages = {modded_layout_page_1,modded_layout_page_2}

local function generate_modded_layout(pageNum)
    return pages[pageNum]()
end

function on_join(m)
    if type(_G.star_check_layouts) == "table" then
        --change the "Romhack" to the name of the romhack as stored in the main.lua --name parameter
        --also change the function name to something that fits your mod
        _G.star_check_layouts["Romhack"] = generate_modded_layout
        _G.star_check_max_pages = #pages
    end
end

--hook_event(HOOK_ON_PLAYER_CONNECTED,on_join)
