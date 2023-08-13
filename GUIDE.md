# What are templates?

Templates are how stars are displayed based on the currently loaded romhack. They consist of multiple pages and headers and specify how the pages are loaded (view sm74_starcheck's generate_sm74_layout for reference on how this can be done). Templates are added within star_check_layouts using the romhack's name as an index and have a number of parameters included.

parameters:  
pages : function  
headers : function  
page_count : integer  

pages is a function that returns a table as described in the "What are pages" section.   
headers is a function that returns a table as described in the "What are headers" section.  
page_count defaults to #pages and should be untouched 99% of the time.  

# What are pages?

Pages are the core building blocks that form a template. Each page can be displayed on the left and right of the screen by default. Pages are represented as a table with various possible entries. These potential entires will be listed below. Pages are dynamically updated and can access any lua code in order to be modified (see the star road template page 2 for an example using total star count). Pages should occupy vertical indices **1-15 at most (y = 1 to 15)**, and horizontal indices **0-8 at most (x = 0 to 8)**. 

# What are headers?

Headers can be views as smaller pages displayed in the top middle of the screen. They are useful for displaying information about pages such as which overworld pages are in or data such as switches pressed. Headers should occupy vertical indices **0-3 (y = 0 to 3)**, and horizontal indices **0-9 at most (x = 0 to 9)**. Horizontal index 4.5 represents the middle of the screen, which can be helpful.

# Tell me about alignment

Text, textures, and stars can be aligned using two optional parameters right_align and center. Enabling them will cause the sprite to be displaced such that it will either center or be written from the right. An example image has been provided below
![image](https://github.com/andre1048576/StarCheckTemplates/assets/55166043/33948b84-0f34-4d1a-b7d3-848305b97e8f)  
all stars are at x = 4
from top to bottom:  
no alignment  
center alignment  
right alignment  

![image](https://github.com/andre1048576/StarCheckTemplates/assets/55166043/2c1854ec-b896-445b-babb-152249b89dd0)  
all text is at x = 4
from top to bottom:  
no alignment  
center alignment  
right alignment  

# What can I put in a page / header?

There are currently 6 main values you can put into a page/header:

## type = "text"  
parameters:  
text : string  
x : number  
y : number  

optional parameters:  
color : rgba table  
right_align : bool  
center : bool  

example : {type = "text",text = "Vanish Cap", x = 0, y = 3,center = true}

This will display text at the position (x,y) using the current font, which can be changed using type = "font" below

## type = "star"
parameters:  
course : COURSE_INDEX  
star_num : integer  
x : number  
y : number  

optional parameters:  
right_align : bool  
center : bool  

example : {type = "star", course = COURSE_BOB, star_num = 5, x = 2,y = 1}

This will display a star at the displayed position if the corresponding star has been collected. If the represented star has not been collected, then an X will be displayed instead. a star_num of 0 represents the first star, while 6 represents the 100 coin star. NOTE THAT THIS CAN ONLY BE DISPLAYED WHILE USING FONT_HUD, explained below.

## type = "font"
parameters:  
font = either FONT_HUD or FONT_MENU  

example : {type = "font", font = FONT_HUD}

This will change the font used to display upcoming items. note that stars can only be displayed in FONT_HUD, and that certain letters do not exist in FONT_HUD, so design your layout accordingly.

## type = "color"
optional parameters:  
r : byte  
g : byte  
b : byte  
a : byte  

example : {type = "color",r = 255, g = 0,b = 127, a = 255}

This will change the color used to display the upcoming items. a = 255 means it is entirely opaque, with a = 0 meaning it's completely transparent (invisible). Generally, you will want to leave 'a' blank. stars will also be colored by type = "color", so be sure to set the color to white (all 255) before displaying stars. If a value is not provided, it will default to 255, so {type = "color"} will set the color to white. This also applies for any rgba table parameters.

## type = "rect"  
parameters:  
x : number  
y : number  
width : number  
height : number  

optional parameters:  
color : rgba table  

example : {type = "rect", x = 2, y = 0, width = 6, height = 15, color = {g = 0,a = 127}}

## type = "texture"  
parameters:  
texture : string  
x : number  
y : number  

optional parameters:  
scaleX : number  
scaleY : number  
right_align : bool  
center : bool  

this will display a texture loaded from the texture parameter at the position x and y. It can be scaled in the X and Y directions using scaleX and scaleY, which will multiply the final scale (example: texture of 24px width and 1/3 scaleX -> 24*(1/3) = 8px final width)
