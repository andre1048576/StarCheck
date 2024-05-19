
--gray block gp is in course 6
--wall jump in course 8
--fire badge in course 10
-- ultra badge in course 11
--triple in course 12


-- mips is none 3 and 4
--b1 includes vanish cap
--b2 includes metal cap (also make it yellow)
-- mountain slide is pss 0 and 1 V
-- 100 coins on dreamy island is mc 0 V
--toad in ow1 as none 2
--toad in ow3 as none 1
--brodute race is wmotr 1 and has red switch
--tower is SA 0-2 and B3 0 V
-- 1-1 is wc 0 V
local mod_name = "sr7-coop-port"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function layout_page_1()
    local layout = {}
    for i = COURSE_BOB,COURSE_RR do
        add_text(layout,{text = format_number(i),x = 0,y = i})
        for s = 0,6 do
            add_star(layout,{course = i,star_num = s,x = s+2,y = i})
        end
    end
    --star revenge 7 is special because this also renders text below the badges
    local x = djui_hud_get_screen_width()/2 - (djui_hud_measure_text("BADGES")/2 * 1)
    local y = djui_hud_get_screen_height()/2 - 65
    djui_hud_print_text("12", x + 56, y, .25)
    djui_hud_print_text("08", x + 73, y, .25)
    djui_hud_print_text("06", x + 90, y, .25)
    djui_hud_print_text("11", x + 107, y, .25)
    djui_hud_print_text("10", x + 124, y, .25)
    return layout
end

local function layout_page_2()
    local layout = {}
    local y = 1
    add_text(layout,{text = "Mountain Slide",x=0,y=y})
    add_star(layout,{course=COURSE_PSS,star_num=0,x=0,y=y+1})
    add_star(layout,{course=COURSE_PSS,star_num=1,x=1,y=y+1})
    local y = 3
    add_text(layout,{text = "Dreamy Island",x=0,y=y})
    add_star(layout,{course=COURSE_COTMC,star_num=0,x=8,y=y})
    local y = 6
    add_text(layout,{text = "1-1",x=0,y=y})
    add_star(layout,{course=COURSE_TOTWC,star_num=0,x=2,y=y})

    add_text(layout,{text = "Wakati Tower",x=0,y=4})
    add_star(layout,{course=COURSE_SA,star_num=0,x=0,y=5})
    add_star(layout,{course=COURSE_SA,star_num=1,x=1,y=5})
    add_star(layout,{course=COURSE_SA,star_num=2,x=2,y=5})
    add_star(layout,{course=COURSE_BITS,star_num=0,x=3,y=5})
    add_text(layout,{text = "Toad",x=0,y=7})
    add_star(layout,{course=COURSE_NONE,star_num=1,x=3,y=7})
    add_star(layout,{course=COURSE_NONE,star_num=2,x=4,y=7})
    add_text(layout,{text = "Mips",x=0,y=8})
    add_star(layout,{course=COURSE_NONE,star_num=3,x=3,y=8})
    add_star(layout,{course=COURSE_NONE,star_num=4,x=4,y=8})

    add_text(layout,{text = "Boss 1",x=0,y=10})
    add_star(layout,{course=COURSE_BITDW,star_num=0,x=4,y=10})
    add_key(layout,{key_num=1,x=5,y=10})
    add_cap_switch(layout,{switch_color="blue",x=6,y=10})
    
    add_text(layout,{text = "Boss 2",x=0,y=11})
    add_star(layout,{course=COURSE_BITFS,star_num=0,x=4,y=11})
    add_key(layout,{key_num=2,x=5,y=11})
    add_cap_switch(layout,{switch_color={r=255,g=255,b=0,a=255},pressed=save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0,x=6,y=11})
    
    add_text(layout,{text = "Brodute",x=0,y=12})
    add_star(layout,{course=COURSE_WMOTR,star_num=1,x=5,y=12})
    add_cap_switch(layout,{switch_color="red",x=6,y=12})
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