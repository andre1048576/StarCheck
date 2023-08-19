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

You add configurations to a template. These can be anything from a star to a rectangle to some text or an icon.  
Helper functions have been created to add every configuration, as listed below  
- `add_star`  
- `add_key`  
- `add_cap_switch`  
- `add_rect`  
- `add_texture`  
- `add_text`  
- `add_font`  
- `add_color`  

each of these accepts their respective configuration viewed from annotation.lua  
Please work from the StarCheck folder to generate your template as it will allow VS Code to automatically inform you of any errors in the template.