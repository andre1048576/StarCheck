---@meta

---@class Template
---@field headers function? shows additional information when a particular page is on the left on the top middle of the screen
---@field pages function a function that returns an array of configurations aka a page
---@field page_count integer how many pages there are
---@field double_flip boolean? assuming there are multiple pages, should they be toggled in groups of 1 or 2



---@class Configuration
---@field type string what configuration was loaded. you don't need to worry about this if you use the add_ helper functions


---@class FontConfiguration : Configuration
---@field font DjuiFontType which font to use

---@class ColorConfiguration : Configuration
---@field r integer? red 0-255
---@field g integer? green 0-255
---@field b integer? blue 0-255
---@field a integer? alpha 0-255 (255 is opaque,0 is invisible)

---@class TextureRenderable : Configuration
---@field texture string which texture to render
---@field scaleX number? how much bigger the texture should be horizontally
---@field scaleY number? how much bigger the texture should be vertically
---@field x number x position of the texture in grid sizes
---@field y number y position of the texture in grid sizes
---@field center boolean? whether to align the texture horizontally to be to the left of the coordinate
---@field right_align boolean? whether to align the texture horizontally to be to the left of the coordinate

---@class TextRenderable : Configuration
---@field color {a: integer?,r: integer?,g: integer?,b:integer?}? array comprising of rgba values between 0-255
---@field text string what text to render
---@field x number x position of the text in grid sizes
---@field y number y position of the text in grid sizes
---@field center boolean? whether to center the text horizontally on the selected coordinate
---@field right_align boolean? whether to align the text horizontally to be to the left of the coordinate

---@class StarRenderable : Configuration
---@field course integer what course the star came from
---@field star_num integer what star number it is. note that star_nums in a course are indexed from 0 (0-6)
---@field x number x position of the star in grid sizes
---@field y number y position of the star in grid sizes
---@field center boolean? whether to center the star horizontally on the selected coordinate
---@field right_align boolean? whether to align the star horizontally to be to the left of the coordinate

---@class CapSwitchRenderable : Configuration
---@field pressed boolean? whether the switch is pressed. can be omitted if a default switch color is used
---@field switch_color "blue"|"red"|"green"|{a: integer?,r: integer?,g: integer?,b:integer?} which switch this is. will automatically check if it's collected and use the correct icon
---@field x number x position of the cap switch in grid sizes
---@field y number y position of the cap switch in grid sizes
---@field center boolean? whether to center the cap switch horizontally on the selected coordinate
---@field right_align boolean? whether to align the cap switch horizontally to be to the left of the coordinate

---@class KeyRenderable : Configuration
---@field collected boolean? whether or not the key is collected. can be omitted if using the standard key 1 or 2 checks
---@field key_num integer which key this is. will automatically check if it's collected and use the correct key icon if 1 or 2 is input
---@field x number x position of the key in grid sizes
---@field y number y position of the key in grid sizes
---@field center boolean? whether to center the key horizontally on the selected coordinate
---@field right_align boolean? whether to align the key horizontally to be to the left of the coordinate

---@class RectRenderable : Configuration
---@field color {a: integer?,r: integer?,g: integer?,b:integer?}? array comprising of rgba values between 0-255
---@field width number width of the rectangle in grid sizes
---@field height number height of the rectangle in grid sizes
---@field x number x position of the rectangle in grid sizes
---@field y number y position of the rectangle in grid sizes
---@field center boolean? whether to center the rectangle horizontally on the selected coordinate
---@field right_align boolean? whether to align the rectangle horizontally to be to the left of the coordinate