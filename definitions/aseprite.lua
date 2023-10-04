---@meta


---@type unknown
local undefined


---The `app` global namespace.
---@NOTE app.theme still needs to be defined. Depends on Theme object?
app = {
    ---Gets the API version.
    apiVersion = undefined --[[@as number]],

    ---Gets or sets the background color.
    bgColor = undefined --[[@as Color]],

    ---Gets or sets the active brush.
    brush = undefined --[[@as Brush]],

    ---Gets or sets the active cel.
    ---`nil` when no sprite is active or when the active layer is a group.
    cel = undefined --[[@as Cel|nil]],

    ---Gets or sets the default palette.
    defaultPalette = undefined --[[@as Palette|nil]],

    ---Gets the active editor.
    ---`nil` when no sprite is active.
    editor = undefined --[[@as Editor|nil]],

    ---Gets the `Events` object so as to add listener methods.
    events = undefined --[[@as Events]],

    ---Gets or sets the foreground color.
    fgColor = undefined --[[@as Color]],

    ---Gets or sets the active frame.
    ---`nil` when no sprite is active.
    ---Setter accepts an integer frame number.
    frame = undefined --[[@as Frame|nil]],

    ---Gets or sets the active image.
    ---`nil` when no sprite is active or when the active layer is a group.
    image = undefined --[[@as Image|nil]],

    ---Whether the UI is available.
    isUIAvailable = undefined --[[@as boolean]],

    ---Gets or sets the active layer.
    ---`nil` when no sprite is active.
    layer = undefined --[[@as Layer|nil]],

    ---A table with parameters specified as `--script-param key=value` in the
    ---CLI or as `<param>` in `user.aseprite-keys` or `gui.xml` file.
    params = undefined --[[@as {[string]: string}]],

    ---Gets the range of elements chosen in the timeline or palette bar.
    range = undefined --[[@as Range]],

    ---Gets the active site.
    site = undefined --[[@as Site]],

    ---Gets or sets the active sprite.
    sprite = undefined --[[@as Sprite|nil]],

    ---Gets an array of sprites open in the application.
    sprites = undefined --[=[@as Sprite[]]=],

    ---Gets the active tag.
    ---`nil` when no sprite is active.
    tag = undefined --[[@as Tag|nil]],

    ---Gets or sets the active tool.
    ---@NOTE Unlike frame, this accepts string bc there's no clear alternative.
    tool = undefined --[[@as Tool|string]],

    ---Gets the UI Elements scaling specified in Preferences,
    ---e.g., 1 for 100%, 2 for 200%.
    uiScale = undefined --[[@as integer]],

    ---Gets the Aseprite version.
    version = undefined --[[@as Version]],

    ---Gets the main window.
    window = undefined --[[@as Window]],

    ---Displays an alert message.
    ---If `buttons` are not specified, shows the OK button only.
    ---@param text string
    ---@overload fun(options: {title: string, text: string|string[], buttons: string|string[]}): integer
    ---@return integer buttonIndex The selected button, e.g., 1 if the first button was clicked.
    alert = function(text)
    end,

    ---Closes the application.
    exit = function()
    end,

    ---Loads and opens a sprite from the given filename.
    ---@param filename string
    ---@return Sprite|nil
    open = function(filename)
    end,

    ---Redoes the latest operation in the `activeSprite`.
    redo = function()
    end,

    ---Forces a screen refresh.
    refresh = function()
    end,

    ---Creates a new transaction so as to group several sprite modifications
    ---in just one undo/redo operation.
    ---@param func function a function called inside the transaction
    ---@overload fun(name: string, func: function)
    transaction = function(func)
    end,

    ---Undoes the latest operation in the `activeSprite`.
    undo = function()
    end,

    ---Simulates a user stroke in the canvas using the given tool.
    ---See https://www.aseprite.org/api/app#app-usetool .
    ---@param options {tool: string, color: Color, bgColor: Color, brush: Brush, points: Point[], cel: Cel, layer: Layer, frame: Frame, ink: Ink, button: MouseButton, opacity: integer, contiguous: boolean, tolerance: integer, freehandAlgorithm: 0|1, selection: SelectionMode}
    useTool = function(options)
    end,

    ---Executes the command named `CommandName` with the parameters provided.
    ---See https://www.aseprite.org/api/app_command .
    command = {
        BackgroundFromLayer = function()
        end,

        ---When trimOutside is true, trims cels of excess alpha and trims cels
        ---to sprite bounds.
        ---@param options {bottom: integer, bounds: Rectangle, left: integer, right: integer, top: integer, trimOutside: boolean, ui: boolean}
        CanvasSize = function(options)
        end,

        ---@param options {format: "rgb"|"gray"|"grayscale"|"indexed", dithering: "ordered"|"old"|"error-diffusion", ["dithering-matrix"]: string, rgbmap: "octree"|"rgb5a3"|"default", toGray: "luma"|"hsv"|"hsl"}
        ChangePixelFormat = function(options)
        end,

        ---@param options {ui: boolean, channels: integer, curve: Point[]|integer[][] }
        ColorCurve = function(options)
        end,

        ---Extracts a palette from the sprite canvas.
        ---For the algorithm, 0 is default, 1 is RGB table, 2 is octree.
        ---@param options {ui: boolean, withAlpha: boolean, maxColors: integer, useRange: boolean, algorithm:0|1|2}
        ColorQuantization = function(options)
        end,

        FitScreen = function()
        end,

        GoToNextTab = function()
        end,

        GoToPreviousTab = function()
        end,

        InvertMask = function()
        end,

        LayerFromBackground = function()
        end,

        LinkCels = function()
        end,

        ---@param options {brush: "circle"|"square", modifier: "border"|"contract"|"expand", quantity: integer}
        ModifySelection = function(options)
        end,

        ---Beware, may cause crashes in version 1.2.40 or older.
        Refresh = function()
        end,

        ---Sets the palette swatch display size in the color bar.
        ---@param options {size: integer}
        SetPaletteEntrySize = function(options)
        end,

        ---Switches the foreground and background color.
        ---Reverses the order of swatches in shading ink.
        SwitchColors = function()
        end,

        ---Shows, hides or toggles the visibility of the timeline.
        ---@param options {close: boolean, open: boolean, switch: boolean}
        Timeline = function(options)
        end,
    },

    ---Functions to handle file names and the file system.
    fs = {
        ---The installation path of Aseprite for the current platform.
        appPath = undefined --[[@as string]],

        ---The path from which the Aseprite executable launched.
        currentPath = undefined --[[@as string]],

        ---The preferred path separator of the current platform.
        pathSeparator = undefined --[[@as "/"|"\\"]],

        ---The path for temporary files for the current platform.
        tempPath = undefined --[[@as string]],

        ---The user's Aseprite configuration path for the current platform.
        userConfigPath = undefined --[[@as string]],

        ---The user's Documents path for the current platform.
        userDocsPath = undefined --[[@as string]],

        ---Returns the file extension of the given filename, excluding the `.`.
        ---@param fn string Filename.
        ---@return string
        fileExtension = function(fn)
        end,

        ---Returns the file name, including the extension.
        ---@param fn string Filename.
        ---@return string
        fileName = function(fn)
        end,

        ---Returns the path/directory part of the given filename.
        ---@param fn string Filename.
        ---@return string
        filePath = function(fn)
        end,

        ---Returns the file path joined with the title, excluding the extension,
        ---of the given filename.
        ---@param fn string Filename.
        ---@return string
        filePathAndTitle = function(fn)
        end,

        ---Returns the file size of the given filename `fn`.
        ---@param fn string Filename.
        ---@return integer
        fileSize = function(fn)
        end,

        ---Returns the file title, excluding the path and extension, of the
        ---given filename.
        ---@param fn string Filename.
        ---@return string
        fileTitle = function(fn)
        end,

        ---Returns true if the given filename `fn` is a directory.
        ---@param fn string Filename.
        ---@return boolean
        isDirectory = function(fn)
        end,

        ---Returns true if the given filename `fn` is a file.
        ---@param fn string Filename.
        ---@return boolean
        isFile = function(fn)
        end,

        ---Joins together a number of string arguments
        ---with the path separator for the current platform.
        ---@param ... string Strings.
        ---@return string
        joinPath = function(...)
        end,

        ---Returns a list of files in the given directory path.
        ---Each file name in the return table is relative to the path.
        ---@param path string Directory path.
        ---@return string[]
        listFiles = function(path)
        end,

        ---Returns the file path converted to a canonical form for the current
        ---platform.
        ---@param path string File path.
        ---@return string
        normalizePath = function(path)
        end,

        ---Creates all directories needed to access to the path.
        ---@param path string Path.
        ---@return boolean
        makeAllDirectories = function(path)
        end,

        ---Creates one directory.
        ---@param path string Directory path.
        ---@return boolean
        makeDirectory = function(path)
        end,

        ---Removes the given directory (it must be empty).
        ---@param path string Directory path.
        ---@return boolean success
        removeDirectory = function(path)
        end
    },

    ---A set of functions to handle the color for Image pixels as unsigned
    ---integers.
    pixelColor = {
        ---Constructs a 16-bit unsigned integer for grayscale images.
        ---@param gray integer Gray value. Black is 0, white is 255.
        ---@param alpha? integer Alpha. Default is 255, opaque.
        ---@return integer
        graya = function(gray, alpha)
        end,

        ---Returns the alpha component.
        ---@param grayPixelValue integer 16-bit integer.
        ---@return integer
        grayaA = function(grayPixelValue)
        end,

        ---Returns the gray component.
        ---@param grayPixelValue integer 16-bit integer.
        ---@return integer
        grayaV = function(grayPixelValue)
        end,

        ---Constructs a 32-bit unsigned integer for RGBA images.
        ---@param red integer Red channel.
        ---@param green integer Green channel.
        ---@param blue integer Blue channel.
        ---@param alpha? integer Alpha. Default is 255, opaque.
        ---@return integer
        rgba = function(red, green, blue, alpha)
        end,

        ---Returns the alpha component.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaA = function(rgbaPixelValue)
        end,

        ---Returns the blue component.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaB = function(rgbaPixelValue)
        end,

        ---Returns the green component.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaG = function(rgbaPixelValue)
        end,

        ---Returns the red component.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaR = function(rgbaPixelValue)
        end,

        ---Constructs a 32-bit unsigned integer for tile maps.
        ---@param i integer Tile set index.
        ---@param f integer Tile map flags.
        ---@return integer
        tile = function(i, f)
        end,

        ---Returns the modifier flags for a tile in the map,
        ---such as whether it is flipped or rotated.
        ---@param n integer Pixel value.
        ---@return integer
        tileF = function(n)
        end,

        ---Returns the tile set index.
        ---@param n integer Pixel value.
        ---@return integer
        tileI = function(n)
        end,
    },

    ---Allows document, application and tool preferences to be get or set.
    ---See https://github.com/aseprite/api/blob/main/api/app_preferences.md
    ---and https://github.com/aseprite/aseprite/blob/main/data/pref.xml .
    preferences = {
        ---Returns the preferences of the given `Tool`.
        ---@param tool Tool|string
        ---@return any
        tool = function(tool)
        end,

        ---Returns the preferences of the given `Sprite`.
        ---@param sprite Sprite
        ---@return any
        document = function(sprite)
        end
    },

    ---The active brush.
    ---@deprecated
    activeBrush = undefined --[[@as Brush]],

    ---The active cel. `nil` when no sprite is active or
    ---when the active layer is a group.
    ---@deprecated
    activeCel = undefined --[[@as Cel|nil]],

    ---The active frame. `nil` when no sprite is active.
    ---Can be assigned an integer frame number.
    ---@deprecated
    activeFrame = undefined --[[@as Frame|nil]],

    ---The active image. `nil` when no sprite is active or
    ---when the active layer is a group.
    ---@deprecated
    activeImage = undefined --[[@as Image|nil]],

    ---The active layer. `nil` when no sprite is active.
    ---@deprecated
    activeLayer = undefined --[[@as Layer|nil]],

    ---The active sprite.
    ---@deprecated
    activeSprite = undefined --[[@as Sprite|nil]],

    ---The active tag. `nil` when no sprite is active.
    ---@deprecated
    activeTag = undefined --[[@as Tag|nil]],

    ---The active tool.
    ---@deprecated
    activeTool = undefined --[[@as Tool|string]],
}


---Module for encoding and decoding JSON strings.
json = {
    ---Parses `jsonText`, returning a JSON object.
    ---Note that `number` fields will be parsed to `float`s,
    ---even if they were originally `integer`s.
    ---@param jsonText string
    ---@return userdata
    decode = function(jsonText)
    end,

    ---Converts a Lua table or JSON object to a string.
    ---@param table table|userdata
    ---@return string
    encode = function(table)
    end
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/anidir.h#L16
---@enum AniDir
AniDir = {
    FORWARD = 0,
    REVERSE = 1,
    PING_PONG = 2,
    PING_PONG_REVERSE = 3,
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/blend_mode.h#L26
---@enum BlendMode
---@NOTE Internal enum is converted to public, leading to discrepancies.
BlendMode = {
    SRC = 1,
    NORMAL = 3,
    MULTIPLY = 14,
    SCREEN = 15,
    OVERLAY = 16,
    DARKEN = 17,
    LIGHTEN = 18,
    COLOR_DODGE = 19,
    COLOR_BURN = 20,
    HARD_LIGHT = 21,
    SOFT_LIGHT = 22,
    DIFFERENCE = 23,
    EXCLUSION = 24,
    HSL_HUE = 25,
    HSL_SATURATION = 26,
    HSL_COLOR = 27,
    HSL_LUMINOSITY = 28,
    ADDITION = 29,
    SUBTRACT = 30,
    DIVIDE = 31
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/brush_pattern.h#L14
---@enum BrushPattern
BrushPattern = {
    ORIGIN = 0,
    TARGET = 1,
    NONE = 2
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/brush_type.h#L15
---@enum BrushType
BrushType = {
    CIRCLE = 0,
    SQUARE = 1,
    LINE = 2,
    IMAGE = 3
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/color_mode.h
---@enum ColorMode
ColorMode = {
    RGB = 0,
    GRAY = 1,
    INDEXED = 2,
    TILEMAP = 4
}


---@enum FilterChannels
FilterChannels = {
    RED = 1,
    GREEN = 2,
    BLUE = 4,
    ALPHA = 8,
    GRAY = 16,
    INDEX = 32,
    RGB = 7,
    RGBA = 15,
    GRAYA = 24
}


---@enum FlipType
FlipType = {
    HORIZONTAL = 0,
    VERTICAL = 1
}


---@enum Ink
Ink = {
    SIMPLE = 0,
    ALPHA_COMPOSITING = 1,
    COPY_COLOR = 2,
    LOCK_ALPHA = 3,
    SHADING = 4
}


---@enum MouseButton
MouseButton = {
    NONE = 0,
    LEFT = 1,
    RIGHT = 2,
    MIDDLE = 3,
    X1 = 4,
    X2 = 5
}


---@NOTE Both GRAB and GRABBING appear as 6. 2 is missing?
---@enum MouseCursor
MouseCursor = {
    NONE = 0,
    ARROW = 1,
    CROSSHAIR = 3,
    NOT_ALLOWED = 4,
    POINTER = 5,
    GRAB = 6,
    MOVE = 7,
    NS_RESIZE = 8,
    WE_RESIZE = 9,
    N_RESIZE = 10,
    NE_RESIZE = 11,
    E_RESIZE = 12,
    SE_RESIZE = 13,
    S_RESIZE = 14,
    SW_RESIZE = 15,
    W_RESIZE = 16,
    NW_RESIZE = 17,
}


---@enum RangeType
RangeType = {
    EMPTY = 0,
    CELS = 1,
    FRAMES = 2,
    LAYERS = 4
}


---@enum SelectionMode
SelectionMode = {
    REPLACE = 0,
    ADD = 1,
    SUBTRACT = 2,
    INTERSECT = 3
}


---@enum SpriteSheetDataFormat
SpriteSheetDataFormat = {
    JSON_HASH = 0,
    JSON_ARRAY = 1
}


---@enum SpriteSheetType
SpriteSheetType = {
    HORIZONTAL = 1,
    VERTICAL = 2,
    ROWS = 3,
    COLUMNS = 4,
    PACKED = 5
}


---@enum WebSocketMessageType
WebSocketMessageType = {
    TEXT = 0,
    OPEN = 1,
    CLOSE = 2,
    ERROR = 3,
    PING = 4,
    PONG = 5,
    FRAGMENT = 6,
    BINARY = 16
}


---Identifies a brush to paint with `app.useTool()` function.
---@class Brush
---@field angle integer Gets the angle between -180 and 180.
---@field center Point Gets the center.
---@field image Image|nil Gets the image, if any, based on type.
---@field pattern BrushPattern Gets the pattern.
---@field patternOrigin Point Gets the pattern origin.
---@field size integer Gets the brush size.
---@field type BrushType Gets the brush type.
Brush = {
    ---@NOTE There are two methods, setFgColor and setBgColor. Not clear how they work, if at all.
}

---Creates a new `Brush` instance.
---@return Brush
---@overload fun(size: Size): Brush
---@overload fun(image: Image): Brush
---@overload fun(options: {type: BrushType, size: integer, angle: integer, center: Point, image: Image, pattern: BrushPattern, patternOrigin: Point}): Brush
function Brush()
end

---A cel contains an image at the intersection of a layer and a frame.
---Its position offsets the image from the sprite's top-left corner.
---
---See https://github.com/aseprite/aseprite/blob/main/docs/ase-file-specs.md#note5
---for how to process a cel's zIndex.
---@class Cel
---@field bounds Rectangle Gets the cel bounds.
---@field color Color Gets or sets the cel color in the timeline.
---@field data string Gets or sets custom data assigned to the cel.
---@field frame Frame|nil Gets or sets the frame to which the cel belongs. When set, the cel will be moved to the given frame.
---@field image Image Gets or sets the cel's image.
---@field layer Layer Gets the layer to which the cel belongs.
---@field opacity integer Gets or sets the cel opacity.
---@field position Point Gets or sets the cel position.
---@field sprite Sprite Gets the sprite to which the cel belongs.
---@field zIndex integer Gets or sets the cel's z offset in [-32768, 32767].
---@NOTE also includes frameNumber property, but unclear what happens if frame is nil
Cel = {}


---Represents a color. The expected range for alpha (opacity, transparency) is
---[0, 255]. Expected ranges for red, green and blue are [0, 255]. The expected
---range for hue is [0.0, 360.0). Expected ranges for saturation, lightness and
---value are [0.0, 1.0].
---@class Color
---@field alpha integer Gets or sets the transparency.
---@field blue integer Gets or sets the blue color channel.
---@field gray number Gets the color's gray value as a number based on HSL lightness. Sets as an integer.
---@field grayPixel integer Gets the 16-bit gray pixel (0xAAVV) based on HSL lightness.
---@field green integer Gets or sets the green color channel.
---@field hslHue number Gets or sets the HSL hue.
---@field hslLightness number Gets or sets the HSL lightness.
---@field hslSaturation number Gets or sets the HSL saturation.
---@field hsvHue number Gets or sets the HSV hue.
---@field hsvSaturation number Gets or sets the HSV saturation.
---@field hsvValue number Gets or sets the HSV value.
---@field hue number Gets or sets the hue.
---@field index integer Gets or sets the nearest or exact match palette index for this color.
---@field lightness number Gets or sets the HSL lightness.
---@field red integer Gets or sets the red color channel.
---@field rgbaPixel integer Gets the 32-bit pixel (0xAABBGGRR).
---@field saturation number Gets or sets the saturation, context-dependent.
---@field value number Gets or sets the HSV value.
Color = {}

---Creates a new `Color` instance. Performs no bounds checking on arguments.
---@return Color
---@overload fun(red: integer, green: integer, blue: integer, alpha?: integer): Color
---@overload fun(index: integer): Color
---@overload fun(options: {r: integer, g: integer, b: integer, a: integer}): Color
---@overload fun(options: {h: number, s: number, v: number, a: integer}): Color
---@overload fun(options: {h: number, s: number, l: number, a: integer}): Color
---@overload fun(options: {red: integer, green: integer, blue: integer, alpha: integer}): Color
---@overload fun(options: {hue: number, saturation: number, value: number, alpha: integer}): Color
---@overload fun(options: {hue: number, saturation: number, lightness: number, alpha: integer}): Color
---@overload fun(options: {gray: integer, alpha: integer}): Color
---@overload fun(options: {index: integer}): Color
function Color()
end

---Represents the color space, or profile, of a `Sprite`, `Image`, or
---`ImageSpec`.
---@class ColorSpace
---@field name string Gets or sets the color space name.
ColorSpace = {}

---Creates an empty color space, sRGB color space, or loads a color profile
---from the given ICC file specified in `fromFile` parameter.
---@return ColorSpace
---@overload fun(options: {sRGB: boolean}): ColorSpace
---@overload fun(options: {fromFile: string}): ColorSpace
function ColorSpace()
end

---Creates dialog windows with input widgets on the screen to accept user input.
---@class Dialog
---@field bounds Rectangle Gets or sets the dialog bounds.
---@field data {[string]: boolean|string|integer|number|Color|Color[]}
Dialog = {
    ---Appends a button to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, selected: boolean, focus: boolean, onclick: function}
    ---@return Dialog
    button = function(dialog, options)
    end,

    ---Appends a canvas to a dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, width: integer, height: integer, visible: boolean, autoScaling: boolean, onpaint: fun(event: {context: GraphicsContext}), onkeydown: fun(event: KeyEvent), onkeyup: fun(event: KeyEvent), onmousemove: fun(event: MouseEvent), onmousedown: fun(event: MouseEvent), onmouseup: fun(event: MouseEvent), ondblclick: fun(event: MouseEvent), onwheel: fun(event: MouseEvent), ontouchmagnify: fun(event: TouchEvent)}
    ---@return Dialog
    canvas = function(dialog, options)
    end,

    ---Appends a check box widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, selected: boolean, onclick: function}
    ---@return Dialog
    check = function(dialog, options)
    end,

    ---Closes the dialog.
    ---@param dialog Dialog
    close = function(dialog)
    end,

    ---Appends a color picker widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, color: Color, onchange: function}
    ---@return Dialog
    color = function(dialog, options)
    end,

    ---Appends a combo box, or drop down menu, to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, option: string, options: string[], onchange: function}
    ---@return Dialog
    combobox = function(dialog, options)
    end,

    ---Appends a text entry field to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, focus: boolean, onchange: function}
    ---@return Dialog
    entry = function(dialog, options)
    end,

    ---Appends a button to select one file to open or save.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, title: string, open: boolean, save: boolean, filename: string|string[], filetypes: string[], onchange:function}
    ---@return Dialog
    file = function(dialog, options)
    end,

    ---Appends a static label to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string}
    ---@return Dialog
    label = function(dialog, options)
    end,

    ---Changes properties of the given widget given by string identifier.
    ---@param dialog Dialog
    ---@param options {id: string, visible: boolean, enabled: boolean}|{[string]: any}
    modify = function(dialog, options)
    end,

    ---Creates a new row in the dialog.
    ---@param dialog Dialog
    ---@param options {always: boolean}
    ---@return Dialog
    ---@overload fun(): Dialog
    newrow = function(dialog, options)
    end,

    ---Appends an entry field for a number to the dialog.
    ---When assigning the text option, the number should be formatted to a
    ---string.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, decimals: integer, onchange: function}
    ---@return Dialog
    number = function(dialog, options)
    end,

    ---Appends a radio button widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, selected: boolean, onchange: function}
    ---@return Dialog
    radio = function(dialog, options)
    end,

    ---Calls the onpaint event of all canvas widgets in the dialog.
    ---@param dialog Dialog
    repaint = function(dialog)
    end,

    ---Creates a separator line in the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, text: string}
    ---@return Dialog
    separator = function(dialog, options)
    end,

    ---Appends a widget with an array of colors to the dialog.
    ---Colors can be picked when the mode is "pick".
    ---They can be sorted and accessed as an array when the mode is "sort".
    ---The default mode is "pick".
    ---@param dialog Dialog
    ---@param options {id: string, label: string, colors: Color[], mode: "pick"|"sort", onclick: fun(event: {color: Color, button: MouseButton})}
    ---@return Dialog
    shades = function(dialog, options)
    end,

    ---Displays the dialog on the screen.
    ---When wait is true, blocks other user interactions.
    ---@param dialog Dialog
    ---@param options {wait: boolean, bounds: Rectangle}
    ---@overload fun(dialog: Dialog)
    show = function(dialog, options)
    end,

    ---Appends a slider widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, min: integer, max: integer, value: integer, onchange: function, onrelease: function}
    ---@return Dialog
    slider = function(dialog, options)
    end,
}

---Creates a new `Dialog` instance.
---@return Dialog
---@overload fun(title: string): Dialog
---@overload fun(options: {title: string, onclose: function}): Dialog
function Dialog()
end

---Represents a sprite editor.
---@class Editor
---@field mousePos Point Gets the mouse's screen position.
---@field sprite Sprite Gets the active sprite.
---@field spritePos Point Gets a point of the the mouse position on the sprite.
Editor = {
    ---Asks the user to select a point on the sprite.
    ---@param options {title: string, point: Point, onclick: function, onchange: function, oncancel: function}
    askPoint = function(options)
    end,

    ---Cancels the askPoint action.
    ---@param editor Editor
    cancel = function(editor)
    end
}


---A collection of listeners for specific events.
---@class Events
Events = {
    ---Connects the given `function` with the given event.
    ---Returns the listenerCode.
    ---@param eventName string the event name/code/identifier
    ---@param func function
    ---@return integer
    on = function(eventName, func)
    end,

    ---Disconnects the given function from all events in the object,
    ---or stops only the connection identified by listenerCode
    ---@param listenerCode integer
    ---@overload fun(func: function)
    off = function(listenerCode)
    end,
}


---Represents a discrete unit of time in a sprite.
---@class Frame
---@field duration number Gets or sets the frame duration in seconds.
---@field frameNumber integer Gets the frame number.
---@field next Frame|nil Gets the next frame, if any.
---@field previous Frame|nil Gets the previous frame, if any.
---@field sprite Sprite Gets the sprite of this frame.
Frame = {}


---The GraphicsContext object provides methods for drawing images,
---text and shapes on the canvas.
---@class GraphicsContext
---@field antialias boolean Gets or sets whether paths and shapes are painted on using antialiasing.
---@field blendMode BlendMode|nil Gets or sets the canvas blend mode. May return nil.
---@field color Color Gets or sets the color to paint with the path functions.
---@field height integer Gets the height of the visible area in pixels. Changes when the dialog is resized.
---@field opacity integer Gets or sets the opacity used in stroke(), fill(), etc.
---@field strokeWidth integer Gets or sets the width of lines painted with strokes.
---@field width integer Gets the width of the visible area in pixels. Changes when the dialog is resized.
---@NOTE Also contains the field 'theme', which in turn has an instance styleMetrics method.
GraphicsContext = {
    ---Starts a new path, emptying the list of tracked sub-paths.
    ---@param gc GraphicsContext
    beginPath = function(gc)
    end,

    ---Sets the current path as a clipping area for following
    ---drawing operations.
    ---@param gc GraphicsContext
    clip = function(gc)
    end,

    ---Closes the current sub-path by connecting the current point
    ---with the first point of the current sub-path.
    ---@param gc GraphicsContext
    closePath = function(gc)
    end,

    ---Appends a cubic Bezier curve to the current sub-path, from the last
    ---point to the specified xy-coordinates, with two control points.
    ---@param gc GraphicsContext Graphics context.
    ---@param cp1x number First control point x.
    ---@param cp1y number First control point y.
    ---@param cp2x number Second control point x.
    ---@param cp2y number Second control point y.
    ---@param x number Anchor point x.
    ---@param y number Anchor point y.
    cubicTo = function(gc, cp1x, cp1y, cp2x, cp2y, x, y)
    end,

    ---Draws on the canvas the given image.
    ---If given source and destination bounds, a part of the image is drawn on
    ---the canvas.
    ---If given coordinates, the full image will be drawn at the specified
    ---position in its original scale.
    ---@param gc GraphicsContext Graphics context.
    ---@param image Image Source image.
    ---@param rectSrc Rectangle Source rectangle.
    ---@param rectDst Rectangle Destination rectangle.
    ---@overload fun(gc: GraphicsContext, image: Image, xSrc: integer, ySrc: integer, wSrc: integer, hSrc: integer, xDst: integer, yDst: integer, wDst: integer, hDst: integer)
    ---@overload fun(gc: GraphicsContext, image: Image, xDst: integer, yDst: integer)
    drawImage = function(gc, image, rectSrc, rectDst)
    end,

    ---Draws on the canvas a theme part specified by the given partId,
    ---at a given Point or at specified coordinates.
    ---@param gc GraphicsContext
    ---@param partId string
    ---@param point Point
    ---@overload fun(gc: GraphicsContext, partId: string, x: integer, y: integer)
    drawThemeImage = function(gc, partId, point)
    end,

    ---Draws on the canvas a theme part specified by the given partId,
    ---filling a given Rectangle or at specified coordinates, with
    ---given width and height. This method uses nine-slice scaling for
    ---parts that have their Slice's center defined.
    ---@param gc GraphicsContext
    ---@param partId string
    ---@param rectangle Rectangle
    ---@overload fun(gc: GraphicsContext, partId: string, x: integer, y: integer, w: integer, h: integer)
    drawThemeRect = function(gc, partId, rectangle)
    end,

    ---Fills the current path with the current color.
    ---@param gc GraphicsContext
    fill = function(gc)
    end,

    ---Fills the given rectangle with the current color.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    fillRect = function(gc, rectangle)
    end,

    ---Draws on the canvas the given text string
    ---at a position specified by the coordinates.
    ---@param gc GraphicsContext
    ---@param text string
    ---@param x integer
    ---@param y integer
    fillText = function(gc, text, x, y)
    end,

    ---Appends a line to the current sub-path, from the last point
    ---to the specified coordinates.
    ---@param gc GraphicsContext
    ---@param x number
    ---@param y number
    lineTo = function(gc, x, y)
    end,

    ---Returns the size of the given text using the current font.
    ---@param gc GraphicsContext
    ---@param text string
    ---@return Size
    measureText = function(gc, text)
    end,

    ---Starts a new sub-path at the specified coordinates.
    ---@param gc GraphicsContext
    ---@param x number
    ---@param y number
    moveTo = function(gc, x, y)
    end,

    ---Appends an oval enclosed by the given Rectangle to the current sub-path.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    oval = function(gc, rectangle)
    end,

    ---Appends a given Rectangle to the current sub-path.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    rect = function(gc, rectangle)
    end,

    ---Restores the last saved canvas state.
    ---@param gc GraphicsContext
    restore = function(gc)
    end,

    ---Appends a Rectangle to the current sub-path with rounded corners.
    ---If a single radius is specified, a rectangle with circular corners
    ---is created.
    ---If two radii are specified, a rectangle with elliptical corners
    ---is created.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    ---@param rx number
    ---@param ry number
    ---@overload fun(gc: GraphicsContext, rectangle: Rectangle, r: number)
    roundedRect = function(gc, rectangle, rx, ry)
    end,

    ---Saves the current state of the canvas to restore it later, including:
    ---color, opacity, blendMode, strokeWidth and clipping region.
    ---@param gc GraphicsContext
    save = function(gc)
    end,

    ---Paints the edges of the current path with the current color
    ---and current width.
    ---@param gc GraphicsContext
    stroke = function(gc)
    end,

    ---Paints the edges of the given rectangle with the current color
    ---and current width.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    strokeRect = function(gc, rectangle)
    end
}


---Represents the grid that governs how tiles are placed
---in a tile map.
---@class Grid
---@field origin Point Gets the grid offset relative to the canvas.
---@field tileSize Size Gets the tile width and height.
Grid = {}

---Creates a new `Grid` instance.
---@return Grid
---@overload fun(otherGrid: Grid): Grid
---@overload fun(x: integer, y: integer, width: integer, height: integer): Grid
---@overload fun(numbers: {[1]: integer, [2]: integer, [3]: integer, [4]: integer}): Grid
function Grid()
end

---Represents an image that contains an array of pixel data.
---The organization of data depends on the color mode.
---@class Image
---@field bounds Rectangle Gets the image bounds with origin equal to (0, 0).
---@field bytes string Gets or sets a byte string that contains raw image data.
---@field cel Cel Gets the cel to which this image belongs or `nil`.
---@field colorMode ColorMode Gets the image color mode.
---@field height integer Gets the image height.
---@field id integer Gets the image identifier.
---@field rowStride integer Gets the number of bytes for each row in the image.
---@field spec ImageSpec Gets the specification for this image.
---@field version integer Gets the version assigned to the image inside the program, updated with each image change.
---@field width integer Gets the image width.
Image = {
    ---Clears all pixels in the image with given color
    ---or `image.spec.transparentColor` if no color is specified.
    ---@param image Image
    ---@param color? Color|integer
    ---@overload fun(image: Image, bounds: Rectangle, color?: Color|integer)
    clear = function(image, color)
    end,

    ---Creates a copy of the image.
    ---@param image Image
    ---@return Image
    clone = function(image)
    end,

    ---Draws the given sourceImage image on the destinationImage.
    ---For indexed color mode, sets the region to the destination image.
    ---@param destinationImage Image
    ---@param sourceImage Image
    ---@param position? Point
    ---@param opacity? integer
    ---@param blendMode? BlendMode|integer
    drawImage = function(destinationImage, sourceImage, position, opacity, blendMode)
    end,

    ---Sets the pixel in the coordinate to the given integer pixel value.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@param color integer
    drawPixel = function(image, x, y, color)
    end,

    ---Draws the given sourceSprite frame number into the destinationImage.
    ---If position is a point, it will draw the sourceSprite in the given position.
    ---@param destinationImage Image
    ---@param sourceSprite Sprite
    ---@param frame Frame|integer
    ---@param position? Point
    drawSprite = function(destinationImage, sourceSprite, frame, position)
    end,

    ---Flips an image in-place on either the horizontal or vertical axis.
    ---Defaults to horizontal.
    ---@param image Image
    ---@param flipType? FlipType
    flip = function(image, flipType)
    end,

    ---Returns an integer pixel value for the given coordinates local to the Image.
    ---When the coordinates are out-of-bounds, returns `0xffffffff`,
    ---which is white for RGB images.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@return integer
    getPixel = function(image, x, y)
    end,

    ---Returns true if all pixels in the image are equal to the transparent color.
    ---@param image Image
    ---@return boolean
    isEmpty = function(image)
    end,

    ---Evaluates whether the provided image has the same dimensions as the instance image,
    ---is the same color mode, and contains the same pixel colors. Does not check
    ---for difference in color space or transparent color.
    ---@param image Image
    ---@param otherImage Image
    ---@return boolean
    isEqual = function(image, otherImage)
    end,

    ---Returns true if all pixels in the image are equal to the
    ---given color.
    ---@param image Image
    ---@param refColor Color|integer
    ---@return boolean
    isPlain = function(image, refColor)
    end,

    ---Returns a pixel iterator for the whole image or the given rectangle.
    ---@param image Image
    ---@param rectangle? Rectangle
    ---@return fun(integer)|fun(): integer|{x: integer, y: integer} accessor Can be called to get pixel and set pixel (e.g. `accessor()` and `accessor(pixelValue)`), and holds x, y coordinates.
    ---@NOTE To parse correctly, fun(): integer cannot be at the start of the union above.
    pixels = function(image, rectangle)
    end,

    ---Resizes the image. The pivot defaults to `Point(0, 0)`.
    ---If no method is specified, defaults to nearest-neighbor.
    ---@param image Image
    ---@param width integer
    ---@param height integer
    ---@overload fun(image: Image, options: {width: integer, height: integer, method: "bilinear"|"rotsprite", pivot: Point})
    ---@overload fun(image: Image, options: {size: Size, method: "bilinear"|"rotsprite", pivot: Point})
    resize = function(image, width, height)
    end,

    ---Saves the image as a sprite in the given `filename`.
    ---@param image Image
    ---@param filename string
    ---@overload fun(image: Image, options: {filename: string, palette: Palette})
    saveAs = function(image, filename)
    end,

    ---Returns the shrunken bounds, a rectangle, of the image
    ---removing all the empty space of borders using the mask
    ---color or the given `refColor`.
    ---@param image Image
    ---@param refColor integer
    ---@return Rectangle
    shrinkBounds = function(image, refColor)
    end,

    ---Copies/draws the given sourceImage image over destinationImage.
    ---If position is a point, it will draw the sourceImage
    ---in the given position.
    ---@param destinationImage Image
    ---@param sourceImage Image
    ---@param position? Point
    ---@deprecated
    putImage = function(destinationImage, sourceImage, position)
    end,

    ---Sets the pixel in the coordinate to the given integer pixel value.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@param color integer
    ---@deprecated
    putPixel = function(image, x, y, color)
    end,

    ---Draws the given sourceSprite frame number into
    ---the destinationImage. If position is a point,
    ---it will draw the sourceSprite in the given position.
    ---@param destinationImage Image
    ---@param sourceSprite Sprite
    ---@param frameNumber integer
    ---@param position Point
    ---@deprecated
    putSprite = function(destinationImage, sourceSprite, frameNumber, position)
    end
}

---Creates a new `Image` instance.
---Images loaded fromFile may be `nil`.
---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Image
---@overload fun(spec: ImageSpec): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image): Image
---@overload fun(option: {fromFile: string}): Image
function Image(width, height, colorMode)
end

---Specifications of sprites or images.
---@class ImageSpec
---@field colorMode ColorMode Gets or sets the spec color mode.
---@field colorSpace ColorSpace Gets or sets the spec color space.
---@field height integer Gets or sets the spec height.
---@field width integer Gets or sets the spec width.
---@field transparentColor integer Gets or sets the index for a transparent color in a palette.
ImageSpec = {}

---Creates a new `ImageSpec` instance.
---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: {width: integer, height: integer, colorMode: ColorMode, transparentColor: number})
function ImageSpec()
end

---@class KeyEvent
---@field altKey boolean
---@field code string A string identifier for the key. See https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values .
---@field ctrlKey boolean
---@field key string A string containing the pressed/released Unicode character.
---@field metaKey boolean
---@field repeatCount integer Number of times the key was autorepeated.
---@field shiftKey boolean
---@field spaceKey boolean
KeyEvent = {
    ---Stops propagating this event to other parent widget/main
    ---Aseprite window. Use this in case that the canvas widget
    ---used the key and you want to avoid triggering a command
    ---with a keyboard shortcut.
    ---@param ke KeyEvent
    stopPropagation = function(ke)
    end
}


---Represents a layer in the timeline. Can be one of many subtypes:
---background, group, reference or tilemap.
---@class Layer
---@field blendMode BlendMode|nil Gets or sets the layer blend mode. `nil` if the layer is a group.
---@field cels Cel[] Gets the cels table in the layer.
---@field color Color Gets or sets the layer's color in the timeline.
---@field data string Gets or sets the layer's custom user data.
---@field id integer Gets the layer's id.
---@field isBackground boolean Whether the layer is a background.
---@field isCollapsed boolean Gets or sets a layer's collapsed state in the timeline.
---@field isContinuous boolean Gets or sets a layer's continuous state in the timeline.
---@field isEditable boolean Gets or sets a layer's editability in the timeline.
---@field isExpanded boolean Gets or sets a layer's expanded state in the timeline.
---@field isGroup boolean Whether the layer is a group and can be a parent to other layers.
---@field isImage boolean Whether the layer contains cels with images.
---@field isReference boolean Whether the layer is a reference layer.
---@field isTilemap boolean Whether the layer is a tile map.
---@field isTransparent boolean Gets a layer's support for transparency.
---@field isVisible boolean Gets or sets the layer's visibility state in the timeline.
---@field layers Layer[]|nil If a layer is a group, gets the table of child layers.
---@field name string Gets or sets the layer's name. Should not be treated as a unique identifier.
---@field next Layer|nil Gets the next layer, if any.
---@field opacity integer|nil Gets or sets the layer opacity. `nil` if the `Layer` is a group.
---@field parent Sprite|Layer Gets or sets the layer's parent. May be a `Sprite` for top-level layers.
---@field previous Layer|nil Gets the previous layer, if any.
---@field sprite Sprite Gets the sprite to which the layer belongs.
---@field stackIndex integer Gets or sets the layer's index in its parent's layers table.
---@field tileset Tileset|nil If the layer is a tile map, gets or sets the layer's tile set.
Layer = {
    ---Returns a cel, if any, at the intersection of the layer and a frame.
    ---@param layer Layer
    ---@param frame Frame|integer
    ---@return Cel|nil
    cel = function(layer, frame)
    end
}


---@class MouseEvent
---@field altKey boolean
---@field button MouseButton
---@field ctrlKey boolean
---@field deltaX number|nil
---@field deltaY number|nil
---@field metaKey boolean
---@field pressure number
---@field shiftKey boolean
---@field spaceKey boolean
---@field x integer
---@field y integer
MouseEvent = {}


---@class Palette
---@field frame Frame|nil Gets the first frame, if any.
---@operator len(): integer
---@NOTE also includes frameNumber property, but unclear what happens if frame is nil
Palette = {
    ---Returns the color at the given index.
    ---The index goes from `0` to `#palette - 1`.
    ---Throws an error if the index is out of bounds.
    ---@param palette Palette
    ---@param index integer
    ---@return Color
    getColor = function(palette, index)
    end,

    ---Changes the number of the palette colors to `ncolors`.
    ---@param palette Palette
    ---@param ncolors integer
    resize = function(palette, ncolors)
    end,

    ---Saves the palette in the given `filename`.
    ---@param palette Palette
    ---@param filename string
    saveAs = function(palette, filename)
    end,

    ---Sets a palette color at the given index.
    ---The index goes from `0` to `#palette - 1`.
    ---Throws an error if the index is out of bounds.
    ---@param palette Palette
    ---@param index integer
    ---@param color Color|integer
    setColor = function(palette, index, color)
    end,
}

---Creates a new `Palette` instance. By default it will contain 256 colors.
---`fromResource` is an ID specified in one of the extensions
---palette (e.g. `DB16`, `DB32`, `Solarized`).
---
---Palettes loaded `fromFile` may be `nil`.
---
---The resource string given to `fromResource` should be validated as
---correct before the constructor is called.
---@return Palette
---@overload fun(numberOfColors: integer): Palette
---@overload fun(options: {fromFile: string}): Palette
---@overload fun(options: {fromResource: string}): Palette
function Palette()
end

---Structures an Aseprite plug-in, or extension.
---@class Plugin
---@field name string Gets the extension name.
---@field path string Gets the path where the extension is installed.
---@field preferences table Gets or sets user preferences.
Plugin = {
    ---Removes a command.
    ---@param plugin Plugin
    ---@param id string
    deleteCommand = function(plugin, id)
    end,

    ---Removes a menu group.
    ---@param plugin Plugin
    ---@param id string
    deleteMenuGroup = function(plugin, id)
    end,

    ---Creates a new command that can be associated to keyboard shortcuts
    ---and is added in the app menu in a group.
    ---@param plugin Plugin
    ---@param options {id: string, title: string, group: string, onclick: function, onenabled: function}
    newCommand = function(plugin, options)
    end,

    ---Creates a new menu item which will contain a submenu grouping several
    ---plugin commands.
    ---@param plugin Plugin
    ---@param options {id: string, title: string, group: string}
    newMenuGroup = function(plugin, options)
    end,

    ---Creates a menu separator in the given menu group.
    ---@param plugin Plugin
    ---@param options {group: string}
    newMenuSeparator = function(plugin, options)
    end
}


---A 2D integer coordinate pair.
---@class Point
---@field x integer Gets or sets integer on the horizontal axis.
---@field y integer Gets or sets integer on the vertical axis.
---@operator add(Point): Point
---@operator div(integer): Point
---@operator idiv(integer): Point
---@operator mod(integer): Point
---@operator mul(integer): Point
---@operator pow(integer): Point
---@operator sub(Point): Point
---@operator unm(): Point
Point = {}

---Creates a new `Point` instance.
---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(x: integer, y: integer): Point
---@overload fun(options: {x: integer, y: integer}): Point
---@overload fun(numbers: {[1]: integer, [2]: integer}): Point
function Point()
end

---A range of selected objects. It may contain layers, frames, cels,
---images, tiles and/or colors. Tiles and colors are referenced indirectly
---through `integer`s.
---@class Range
---@field cels Cel[] Gets a table of cels.
---@field colors integer[] Gets or sets a table of indices in the color bar.
---@field editableImages Image[] Gets a table of unique, editable images.
---@field frames Frame[] Gets or sets a table of frames.
---@field images Image[] Gets a table of unique images.
---@field isEmpty boolean Gets whether or not the range is empty.
---@field layers Layer[] Gets or sets a table of layers.
---@field slices Slice[] Gets or sets a table of slices.
---@field sprite Sprite Gets the sprite to which the range is pointing.
---@field type RangeType Gets the type of range.
---@NOTE Also contains a tiles field, but it doesn't work as of 1.3rc-4.
---@NOTE It's not clear from the UI how a range contains slices.
Range = {
    ---Clears the current range's contents.
    ---@param range Range
    clear = function(range)
    end,

    ---Returns true if a layer, frame, slice or cel is in the timeline range.
    ---@param range Range
    ---@param object Layer|Frame|Cel|Slice
    ---@return boolean
    contains = function(range, object)
    end,

    ---Returns true if the given color index is selected in the color bar.
    ---@param range Range
    ---@param colorIndex integer
    ---@return boolean
    containsColor = function(range, colorIndex)
    end,

    ---Returns true if the given tile index is selected in the tileset bar.
    ---@param range Range
    ---@param tileIndex integer
    ---@return boolean
    containsTile = function(range, tileIndex)
    end
}


---Creates a new `Rectangle` instance.
---@class Rectangle
---@field h integer Gets or sets the vertical dimension.
---@field height integer Gets or sets the vertical dimension.
---@field origin Point Gets or sets the top-left corner.
---@field size Size Gets or sets the width and height.
---@field w integer Gets or sets the horizontal dimension.
---@field width integer Gets or sets the horizontal dimension.
---@field x integer Gets or sets the top-left corner x.
---@field y integer Gets or sets the top-left corner y.
---@operator band(Rectangle): Rectangle
---@operator bor(Rectangle): Rectangle
Rectangle = {
    ---Returns true if `otherRectangle` is inside `rectangle`.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return boolean
    contains = function(rectangle, otherRectangle)
    end,

    ---Returns a new rectangle which is the intersection of `rectangle` and
    ---`otherRectangle`. If the rectangles do not intersect, then the result
    ---will be empty.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    intersect = function(rectangle, otherRectangle)
    end,

    ---Returns true if `rectangle` intersects `otherRectangle`.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return boolean
    intersects = function(rectangle, otherRectangle)
    end,

    ---Returns true if the rectangle is empty,
    ---i.e., width and/or height are zero.
    ---@param rectangle Rectangle
    ---@return boolean
    isEmpty = function(rectangle)
    end,

    ---Returns a new rectangle that contains both given
    ---rectangles `rectangle` and `otherRectangle`.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    union = function(rectangle, otherRectangle)
    end
}

---Creates a new `Rectangle` instance.
---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: integer, y: integer, width: integer, height: integer): Rectangle
---@overload fun(options: {x: integer, y: integer, width: integer, height: integer}): Rectangle
---@overload fun(numbers: {[1]: integer, [2]: integer, [3]: integer, [4]: integer}): Rectangle
function Rectangle()
end

---Represents a region of selected pixels on the sprite canvas.
---@class Selection
---@field bounds Rectangle Gets a rectangle of the selection bounds.
---@field isEmpty boolean Whether the selection is empty.
---@field origin Point Gets or sets the selection origin.
Selection = {
    ---Adds a new `rectangle` (or `otherSelection`) to the selection.
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    add = function(selection, rectangle)
    end,

    ---Returns true if the given point is inside the selection.
    ---@param selection Selection
    ---@param point Point
    ---@return boolean
    ---@overload fun(selection: Selection, x: integer, y: integer): boolean
    contains = function(selection, point)
    end,

    ---Deselects the selection.
    ---@param selection Selection
    deselect = function(selection)
    end,

    ---Creates an intersection in `selection` between the given `rectangle` or
    ---`otherSelection`.
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    intersect = function(selection, rectangle)
    end,

    ---Replaces the selection with the given rectangle.
    ---@param selection Selection
    ---@param rectangle Rectangle
    select = function(selection, rectangle)
    end,

    ---Selects the whole sprite canvas. Only valid for a sprite selection.
    ---@param selection Selection
    selectAll = function(selection)
    end,

    ---Subtracts the given `rectangle`, or `otherSelection`, from `selection`.
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    subtract = function(selection, rectangle)
    end,
}

---Creates a new `Selection` instance.
---@param rectangle? Rectangle
---@return Selection
function Selection(rectangle)
end

---An object that saves the active state of the editor in a specific moment.
---Cel, frame, image, layer or sprite may be nil if no sprite is open or if
---the active layer is a group.
---@class Site
---@field cel Cel|nil Gets the active cel, if any.
---@field frame Frame|nil Gets the active frame, if any.
---@field image Image|nil Gets the active image, if any.
---@field layer Layer|nil Gets the active layer, if any.
---@field sprite Sprite|nil Gets the active sprite, if any.
---@NOTE As with other classes, omit frameNumber property.
Site = {}


---Represents a non-uniform scalar with two dimensions, i.e., width and height.
---Dimensions may be negative or zero; they are not validated by the
---constructor.
---@class Size
---@field h integer Gets or sets the height.
---@field height integer Gets or sets the height.
---@field w integer Gets or sets the width.
---@field width integer Gets or sets the width.
---@operator add(Size): Size
---@operator div(integer): Size
---@operator idiv(integer): Size
---@operator mod(integer): Size
---@operator mul(integer): Size
---@operator pow(integer): Size
---@operator sub(Size): Size
---@operator unm(): Size
Size {
    ---Returns the new size which will be big enough to contain
    ---both given dimensions, `size` and `otherSize`.
    ---@param size Size
    ---@param otherSize Size
    ---@return Size
    union = function(size, otherSize)
    end
}

---Creates a new `Size` instance with the given dimensions.
---Width and height default to zero.
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: {width: integer, height: integer}): Size
---@overload fun(numbers: {[1]: integer, [2]: integer}): Size
function Size()
end

---An object that allows for nine-slice scaling.
---@class Slice
---@field bounds Rectangle|nil The slice's bounding rectangle, if any.
---@field center Rectangle|nil The central rectangle of a slice's nine-slice, if any.
---@field color Color The user-defined color of the slice in the timeline.
---@field data string The user-defined data of the slice.
---@field name string Gets or sets the slice's name.
---@field pivot Point|nil The slice's pivot, if any.
---@field sprite Sprite The sprite to which the slice belongs.
Slice = {}


---Represents a file in working memory. Holds cels, frames, layers, slices,
---tags and tilesets.
---@class Sprite
---@field backgroundLayer Layer|nil Gets a background layer, if any, for which the sprite is a direct parent.
---@field bounds Rectangle Gets the sprite bounds.
---@field cels Cel[] Gets the cels contained by the sprite.
---@field colorMode ColorMode Gets the sprite's color mode.
---@field colorSpace ColorSpace Gets or sets the sprite color space.
---@field events Events Events to associate functions that can act as listeners.
---@field filename string Gets or sets the sprite file name.
---@field frames Frame[] Gets the frames contained by the sprite.
---@field gridBounds Rectangle Gets or sets grid offset and size.
---@field height integer Gets or sets the height.
---@field isModified boolean Returns true if the sprite is modified compared to the latest saved state.
---@field layers Layer[] Gets the layers contained by the sprite.
---@field palettes Palette[] Gets the palettes contained by the sprite.
---@field pixelRatio Size Gets or sets the sprite pixel ratio.
---@field properties userdata Gets or sets user- and extension-defined properties of the sprite.
---@field selection Selection Gets or sets the active selection.
---@field slices Slice[] Gets the slices contained by the sprite.
---@field spec ImageSpec Gets the sprite's image specification.
---@field tags Tag[] Gets the tags contained by the sprite.
---@field tileManagementPlugin string|nil Gets or sets external plugin string for custom tile management.
---@field tilesets Tileset[] Gets the tilesets contained by the sprite.
---@field transparentColor integer Gets or sets the transparent color.
---@field width integer Gets or sets the width.
Sprite = {
    ---Assigns a new color space to the sprite without modifying pixels.
    ---@param sprite Sprite
    ---@param colorSpace ColorSpace
    assignColorSpace = function(sprite, colorSpace)
    end,

    ---Closes the sprite. Does not ask the user to save changes.
    ---See `app.command.CloseFile` .
    ---@param sprite Sprite
    close = function(sprite)
    end,

    ---Converts all the sprite pixels to a new color space so the image looks
    ---the same as in the previous color space.
    ---@param sprite Sprite
    ---@param colorSpace ColorSpace
    convertColorSpace = function(sprite, colorSpace)
    end,

    ---Crops the sprite.
    ---@param sprite Sprite
    ---@param x integer
    ---@param y integer
    ---@param width integer
    ---@param height integer
    ---@overload fun(sprite: Sprite, rectangle: Rectangle)
    crop = function(sprite, x, y, width, height)
    end,

    ---Deletes the given `cel`.
    ---If the cel is from a background layer, the cel will be replaced with
    ---another that contains an image filled with `app.bgColor`.
    ---@param sprite Sprite
    ---@param cel Cel
    ---@overload fun(sprite: Sprite, layer: Layer, frame: Frame)
    deleteCel = function(sprite, cel)
    end,

    ---Deletes the given `Frame`.
    ---@param sprite Sprite
    ---@param frame Frame|integer
    deleteFrame = function(sprite, frame)
    end,

    ---Deletes the given `Layer`.
    ---@param sprite Sprite
    ---@param layer Layer
    ---@NOTE Also accepts a string name. Discouraged because names aren't unique.
    deleteLayer = function(sprite, layer)
    end,

    ---Deletes the given `Slice`.
    ---@param sprite Sprite
    ---@param slice Slice
    ---@NOTE Also accepts a string name. Discouraged because names aren't unique.
    deleteSlice = function(sprite, slice)
    end,

    ---Deletes the given `Tag`.
    ---@param sprite Sprite
    ---@param tag Tag
    ---@NOTE Also accepts a string name. Discouraged because names aren't unique.
    deleteTag = function(sprite, tag)
    end,

    ---Deletes a `Tile` from a `Tileset`.
    ---@param sprite Sprite
    ---@param tile Tile
    ---@overload fun(sprite: Sprite, tileset: Tileset, tileIndex: integer)
    deleteTile = function(sprite, tile)
    end,

    ---Deletes the given `Tileset` from the sprite's tilesets.
    ---@param sprite Sprite
    ---@param tileset Tileset
    ---@overload fun(sprite: Sprite, tilesetIndex: integer)
    deleteTileset = function(sprite, tileset)
    end,

    ---Flattens all layers of the sprite into one layer.
    ---The same as `app.commands.FlattenLayers()` .
    ---@param sprite Sprite
    flatten = function(sprite)
    end,

    ---Sets the sprite palette to one loaded from a file path.
    ---@param sprite Sprite
    ---@param filename string
    loadPalette = function(sprite, filename)
    end,

    ---Creates a new cel in the given layer. Throws an error if the layer is a
    ---group.
    ---If a frame is not provided, defaults to the first frame.
    ---If an image is not provided, a new image will be created with the size
    ---of the sprite canvas.
    ---If a position is not provided, the cel defaults to the sprite top-left
    ---corner.
    ---@param sprite Sprite
    ---@param layer Layer Leaf layer.
    ---@param frame? Frame|integer Defaults to frame one.
    ---@param image? Image Defaults to empty image.
    ---@param position? Point Defaults to top-left corner.
    ---@return Cel
    newCel = function(sprite, layer, frame, image, position)
    end,

    ---Creates a new empty frame in the given `frameNumber`.
    ---Defaults to `#sprite.frames + 1`.
    ---@param sprite Sprite
    ---@param frameNumber? integer
    ---@return Frame
    newEmptyFrame = function(sprite, frameNumber)
    end,

    ---Creates a copy of the given `Frame` object or frame number and returns
    ---a `Frame` that points to the newly created frame at `frameNumber`.
    ---@param sprite Sprite
    ---@param frame Frame|integer
    ---@return Frame
    newFrame = function(sprite, frame)
    end,

    ---Creates a new group layer at the top of the layers stack.
    ---@param sprite Sprite
    ---@return Layer
    newGroup = function(sprite)
    end,

    ---Creates a new layer at the top of the layers stack.
    ---@param sprite Sprite
    ---@return Layer
    newLayer = function(sprite)
    end,

    ---Creates a new slice.
    ---@param sprite Sprite
    ---@param rectangle? Rectangle
    ---@return Slice
    newSlice = function(sprite, rectangle)
    end,

    ---Creates a new tag that contains the frames between `fromFrame` and
    ---`toFrame`, lower and upper bound inclusive.
    ---@param sprite Sprite
    ---@param fromFrame Frame|integer
    ---@param toFrame Frame|integer
    ---@return Tag
    newTag = function(sprite, fromFrame, toFrame)
    end,

    ---Inserts an empty tile into the given tileset at a tileIndex.
    ---If tileIndex is not provided, the new tile is appended at the end.
    ---@param sprite Sprite
    ---@param tileset Tileset
    ---@param tileIndex integer?
    ---@return Tile
    newTile = function(sprite, tileset, tileIndex)
    end,

    ---Appends a new tileset to the sprite's tilesets.
    ---If no parameters are given, the tileset has 1 tile of 16x16 pixels.
    ---If a `Grid` or `Rectangle` is specified, it is used to set the tileset's
    ---origin and tile size.
    ---`numTiles` specifies the number of initial tiles.
    ---@param sprite Sprite
    ---@return Tileset
    ---@overload fun(sprite: Sprite, grid: Grid, numTiles?: integer): Tileset
    ---@overload fun(sprite: Sprite, anotherTileset: Tileset): Tileset
    ---@NOTE The proper overload signature for Rectangles is unclear?
    newTileset = function(sprite)
    end,

    ---Resizes the sprite and all cels that it contains.
    ---@param sprite Sprite
    ---@param width integer
    ---@param height integer
    ---@overload fun(sprite: Sprite, size: Size)
    resize = function(sprite, width, height)
    end,

    ---Saves the sprite to the given file and mark the sprite as saved.
    ---@param sprite Sprite
    ---@param filename string
    saveAs = function(sprite, filename)
    end,

    ---Saves a copy of the sprite in the given file but doesn't change the
    ---saved state of the sprite.
    ---@param sprite Sprite
    ---@param filename string
    saveCopyAs = function(sprite, filename)
    end,

    ---Sets the sprite's first palette.
    ---@param sprite Sprite
    ---@param palette Palette
    setPalette = function(sprite, palette)
    end,
}

---Creates a new `Sprite` instance.
---Sprites loaded fromFile may be `nil`.
---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Sprite
---@overload fun(spec: ImageSpec): Sprite
---@overload fun(otherSprite: Sprite): Sprite
---@overload fun(options: {fromFile: string}): Sprite
---@overload fun(options: {fromFile: string, oneFrame: boolean}): Sprite
function Sprite(width, height, colorMode)
end

---A tag in the timeline to label and organize frames.
---@class Tag
---@field aniDir AniDir Gets or sets the tag animation direction.
---@field color Color Gets or sets the tag's color in the timeline.
---@field data string The user-defined data of the tag.
---@field frames integer Gets the number of frames contained by the tag.
---@field fromFrame Frame|nil Gets or sets the `Frame` where the tag starts.
---@field name string Gets or sets the tag name.
---@field repeats integer Gets or sets the number of repeats. Zero is infinity.
---@field sprite Sprite Gets the sprite to which the tag belongs.
---@field toFrame Frame|nil Gets or sets the `Frame` where the tag ends.
Tag = {}


---A tile from a `Tileset`.
---@class Tile
---@field color Color Gets or sets the user-defined color.
---@field data string Gets or sets the user-defined data string.
---@field image Image Gets or sets the tile image.
---@field index integer Gets the tile's index in its tileset.
Tile = {}


---An unordered set of unique `Tile`s.
---@class Tileset
---@field baseIndex integer Gets or sets the base index.
---@field color Color Gets or sets the user-defined color of this tileset.
---@field data string Gets or sets the user-defined data string of this tileset.
---@field grid Grid Gets the grid offset and size.
---@field name string Gets or sets the tileset name.
---@operator len(): integer
Tileset = {
    ---Returns the tile in the given index.
    ---@param tileset Tileset
    ---@param index integer
    ---@return Tile
    tile = function(tileset, index)
    end,

    ---Returns the image of tile in the given index.
    ---@param tileset Tileset
    ---@param index integer
    ---@return Image
    ---@deprecated
    getTile = function(tileset, index)
    end,
}


---The Timer class can be used to execute a function periodically.
---@class Timer
---@field interval number Gets or sets the timer interval in seconds.
---@field isRunning boolean Whether the timer is running.
Timer = {
    ---Starts the timer.
    ---@param timer Timer
    start = function(timer)
    end,

    ---Stops the timer.
    ---@param timer Timer
    stop = function(timer)
    end,
}

---Creates a new `Timer` instance.
---@param options {interval: number, ontick: function}
---@return Timer
function Timer(options)
end

---References a drawing tool. At the moment this class is used only to get and
---set the `app.activeTool` or to paint on the canvas, i.e., the `tool`
---parameter in `app.useTool()`.
---@class Tool
---@field id string The identifier specified in the `gui.xml` file.
Tool = {}


---Received as the first parameter in the function associated to a canvas
---widget ontouch event.
---@class TouchEvent
---@field magnification number Magnification factor to apply.
---@field x integer Horizontal coordinate, starting from the top-left corner.
---@field y integer Vertical coordinate, starting from the top-left corner.
TouchEvent = {}


---Represents a Universally unique identifier.
---May be indexed, converted to a string or checked for equality.
---@class Uuid
Uuid = {}

---@overload fun(otherUuid: Uuid): Uuid
---@overload fun(str: string): Uuid
function Uuid()
end

---Represents a version number and provides an easy way to compare if the
---`app.version` is greater or equal than an expected version.
---See https://semver.org/ .
---@class Version
---@field major integer Major change number.
---@field minor integer Minor change number.
---@field patch integer Patch change number.
---@field prereleaseLabel string Returns the pre-release label.
---@field prereleaseNumber integer The pre-release version.
Version = {}

---Create a new `Version` instance from a string.
---@param version string
---@return Version
function Version(version)
end

---Object used to communicate with another program.
---@class WebSocket
---@field url string Address of the server. Read-only. The url is specified when creating the websocket.
WebSocket = {
    ---Tries to connect to the server.
    ---@param webSocket WebSocket
    connect = function(webSocket)
    end,

    ---Disconnects from the server.
    ---@param webSocket WebSocket
    close = function(webSocket)
    end,

    ---Sends a binary message to the server.
    ---@param webSocket WebSocket
    ---@param ... string
    sendBinary = function(webSocket, ...)
    end,

    ---Sends a very short ping message to the server.
    ---There's a limit to the length of data that can be sent.
    ---@param webSocket WebSocket
    ---@param str string
    sendPing = function(webSocket, str)
    end,

    ---Sends a text message to the server.
    ---If multiple strings are passed, they will be joined together.
    ---@param webSocket WebSocket
    ---@param ... string
    sendText = function(webSocket, ...)
    end,
}

---Creates a websocket client.
---@param options? {url: string, onreceive: fun(message: string, data: string), deflate: boolean, minreconnectwait: integer, maxreconnectwait: integer}
---@return WebSocket
function WebSocket(options)
end

---References a window of the program.
---@class Window
---@field events Events Gets an `Events` object so as to add listener methods.
---@field height integer Gets the height of the main window.
---@field width integer Gets the width of the main window.
Window = {}
