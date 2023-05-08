---@meta


---@type unknown
local undefined


---The `app` global namespace.
app = {
    ---The active brush.
    activeBrush = undefined --[[@as Brush]],

    ---The active cel. `nil` when no sprite is active or
    ---when the active layer is a group.
    activeCel = undefined --[[@as Cel|nil]],

    ---The active frame. `nil` when no sprite is active.
    ---Can be assigned an integer frame number.
    activeFrame = undefined --[[@as Frame|nil]],

    ---The active image. `nil` when no sprite is active or
    ---when the active layer is a group.
    activeImage = undefined --[[@as Image|nil]],

    ---The active layer. `nil` when no sprite is active.
    activeLayer = undefined --[[@as Layer|nil]],

    ---The active sprite.
    activeSprite = undefined --[[@as Sprite|nil]],

    ---The active tag. `nil` when no sprite is active.
    activeTag = undefined --[[@as Tag|nil]],

    ---The active tool.
    activeTool = undefined --[[@as Tool]],

    ---The API version.
    apiVersion = undefined --[[@as number]],

    ---The background color.
    bgColor = undefined --[[@as Color]],

    ---The `Events` object to associate functions that can act like
    ---listeners of specific app events
    events = undefined --[[@as Events]],

    ---The foreground color.
    fgColor = undefined --[[@as Color]],

    ---Whether the UI is available.
    isUIAvailable = undefined --[[@as boolean]],

    ---A table with parameters specified as `--script-param key=value` in the
    ---CLI or as `<param>` in `user.aseprite-keys` or `gui.xml` file
    params = undefined --[[@as {[string]: string}]],

    ---The range of elements chosen in the timeline or palette bar.
    ---Contains a list of frames, cels, layers, or colors.
    range = undefined --[[@as Range]],

    ---The active site.
    site = undefined --[[@as Site]],

    ---Opened sprites in the application.
    sprites = undefined --[=[@as Sprite[]]=],

    ---Returns the UI Elements scaling specified in Edit > Preferences,
    ---e.g., 1 for 100%, 2 for 200%.
    uiScale = undefined --[[@as integer]],

    ---The Aseprite version number, e.g., Version("1.2.10-beta1").
    version = undefined --[[@as Version]],

    ---Displays an alert message.
    ---If `buttons` are not specified, it will show a message box with the OK button only.
    ---@param text string
    ---@overload fun(options: {title: string, text: string|string[], buttons: string|string[]})
    ---@return integer buttonIndex the selected button, e.g., 1 if the first button was clicked
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
    ---@param func fun(...): any a function called inside the transaction
    ---@overload fun(name: string, func: fun(...): any)
    transaction = function(func)
    end,

    ---Undoes the latest operation in the `activeSprite`.
    undo = function()
    end,

    ---Simulates a user stroke in the canvas using the given tool.
    ---See https://www.aseprite.org/api/app#app-usetool .
    ---@param options {tool: string, color: Color, bgColor: Color, brush: Brush, points: Point[], cel: Cel, layer: Layer, frame: Frame, ink: Ink, button: MouseButton, opacity: integer, contiguous: boolean, tolerance: integer, freehandAlgorithm: 0|1, selection?: SelectionMode}
    usetool = function(options)
    end,

    ---Executes the command named `CommandName` with the parameters provided.
    ---See https://www.aseprite.org/api/app_command .
    command = {
        BackgroundFromLayer = function()
        end,

        ---@param options {format?: "rgb"|"gray"|"grayscale"|"indexed", dithering?: "ordered"|"old"|"error-diffusion", rgbmap?: "octree"|"rgb5a3"|"default", toGray?: "luma"|"hsv"|"hsl"}
        ---@NOTE How to handle dither-matrix param containing a hyphen?
        ChangePixelFormat = function(options)
        end,

        ---@param options {ui?: boolean, channels?: integer, curve?: Point[]|integer[][] }
        ColorCurve = function(options)
        end,

        ---For the algorithm, 0 is default, 1 is RGB table, 2 is octree.
        ---@param options {ui?: boolean, withAlpha?: boolean, maxColors?: integer, useRange?: boolean, algorithm?:0|1|2}
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

        ---To load the default palette, assign "default" to the "preset" option.
        ---@param options {preset?: string|"default", filename?: string}
        LoadPalette = function(options)
        end,

        ---@param options {brush?: "circle"|"square", modifier?: "border"|"contract"|"expand", quantity?: integer}
        ModifySelection = function(options)
        end,

        Refresh = function()
        end,

        SwitchColors = function()
        end,

        ---@param options {close?: boolean, open?: boolean, switch?: boolean}
        Timeline = function(options)
        end,
    },

    ---Functions to handle file names and the file system.
    fs = {
        ---The installation path of Aseprite for the current platform.
        appPath = undefined --[[@as string]],

        ---The path from which the Aseprite executable launched.
        currentPath = undefined --[[@as string]],

        ---The preferred path separator of the current platform; see: `app.fs.joinPath()`.
        pathSeparator = undefined --[[@as "/"|"\\"]],

        ---The path for temporary files for the current platform.
        tempPath = undefined --[[@as string]],

        ---The current user's Aseprite configuration path for the current platform.
        userConfigPath = undefined --[[@as string]],

        ---The current user's Documents path for the current platform.
        userDocsPath = undefined --[[@as string]],

        ---Returns the file extension of the given filename, excluding the `.`.
        ---@param fn string filename
        ---@return string
        fileExtension = function(fn)
        end,

        ---Returns the file name, including the extension.
        ---@param fn string filename
        ---@return string
        fileName = function(fn)
        end,

        ---Returns the path/directory part of the given filename.
        ---@param fn string filename
        ---@return string
        filePath = function(fn)
        end,

        ---Returns the file path joined with the title, excluding the extension, of the given filename.
        ---@param fn string filename
        ---@return string
        filePathAndTitle = function(fn)
        end,

        ---Returns the file size of the given filename `fn`.
        ---@param fn string filename
        ---@return integer
        fileSize = function(fn)
        end,

        ---Returns the file title (without including the path nor the extension) of the given filename.
        ---@param fn string filename
        ---@return string
        fileTitle = function(fn)
        end,

        ---Returns true if the given filename `fn` is a directory.
        ---@param fn string filename
        ---@return boolean
        isDirectory = function(fn)
        end,

        ---Returns true if the given filename `fn` is a file.
        ---@param fn string filename
        ---@return boolean
        isFile = function(fn)
        end,

        ---Joins together a number of string arguments
        ---with the path separator for the current platform.
        ---@param ... string
        ---@return string
        joinPath = function(...)
        end,

        ---Returns a list of files in the given directory path.
        ---Each file name in the return table is relative to
        ---the given path.
        ---@param path string
        ---@return string[]
        listFiles = function(path)
        end,

        ---Returns the file path converted to a canonical form
        ---for the current platform.
        ---@param path string
        ---@return string
        normalizePath = function(path)
        end,

        ---Creates all directories needed to access to the path.
        ---@param path string
        ---@return boolean
        makeAllDirectories = function(path)
        end,

        ---Creates one directory.
        ---@param path string
        ---@return boolean
        makeDirectory = function(path)
        end,

        ---Removes the given directory (it must be empty).
        ---@param path string
        ---@return boolean success `true` if the directory was removed (or is already removed).
        removeDirectory = function(path)
        end
    },

    ---A set of functions to handle the color for Image pixels at the lowest level: an unsigned integer.
    pixelColor = {
        ---Constructs a 16-bit unsigned integer for grayscale images.
        ---@param gray integer
        ---@param alpha integer alpha; default is 255 (opaque)
        ---@return integer
        graya = function(gray, alpha)
        end,

        ---Returns the alpha component.
        ---@param grayPixelValue integer 16-bit integer
        ---@return integer
        grayaA = function(grayPixelValue)
        end,

        ---Returns the gray component.
        ---@param grayPixelValue integer 16-bit integer
        ---@return integer
        grayaV = function(grayPixelValue)
        end,

        ---Constructs a 32-bit unsigned integer for RGBA images.
        ---@param red integer
        ---@param green integer
        ---@param blue integer
        ---@param alpha? integer alpha; default is 255 (opaque)
        ---@return integer
        rgba = function(red, green, blue, alpha)
        end,

        ---Returns the alpha component.
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaA = function(rgbaPixelValue)
        end,

        ---Returns the blue component.
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaB = function(rgbaPixelValue)
        end,

        ---Returns the green component.
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaG = function(rgbaPixelValue)
        end,

        ---Returns the red component.
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaR = function(rgbaPixelValue)
        end,

        ---Constructs a 32-bit unsigned integer for tile maps.
        ---@param i integer tile set index
        ---@param f integer tile map flags
        ---@return integer
        tile = function(i, f)
        end,

        ---Returns the modifier flags for a tile in the map,
        ---such as whether it is flipped or rotated.
        ---@param n integer pixel value
        ---@return integer
        tileF = function(n)
        end,

        ---Returns the tile set index.
        ---@param n integer pixel value
        ---@return integer
        tileI = function(n)
        end,
    },

    preferences = {
        ---Returns the preferences of the given `Tool`.
        ---@param tool Tool
        ---@return any
        tool = function(tool)
        end,

        ---Returns the preferences of the given `Sprite`.
        ---@param sprite Sprite
        ---@return any
        document = function(sprite)
        end
    },
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/anidir.h#L16
---@enum AniDir
AniDir = {
    FOWARD = 0,
    REVERSE = 1,
    PING_PONG = 2,
    PING_PONG_REVERSE = 3,
}


---https://github.com/aseprite/aseprite/blob/main/src/doc/blend_mode.h#L26
---@enum BlendMode
BlendMode = {
    NORMAL = 0,
    MULTIPLY = 1,
    SCREEN = 2,
    OVERLAY = 3,
    DARKEN = 4,
    LIGHTEN = 5,
    COLOR_DODGE = 6,
    COLOR_BURN = 7,
    HARD_LIGHT = 8,
    SOFT_LIGHT = 9,
    DIFFERENCE = 10,
    EXCLUSION = 11,
    HSL_HUE = 12,
    HSL_SATURATION = 13,
    HSL_COLOR = 14,
    HSL_LUMINOSITY = 15,
    ADDITION = 16,
    SUBTRACT = 17,
    DIVIDE = 18
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


---@enum Ink
Ink = {
    SIMPLE = 0,
    ALPHA_COMPOSTING = 1,
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
---@field angle integer Angle of brush pattern between -180 and 180.
---@field center Point
---@field image Image
---@field pattern BrushPattern
---@field patternOrigin Point
---@field size integer
---@field type BrushType
Brush = {}

---Creates a new `Brush` instance.
---@return Brush
---@overload fun(size: Size): Brush
---@overload fun(image: Image): Brush
---@overload fun(options: {type: BrushType, size: integer, angle: integer, center: Point, image: Image, pattern: BrushPattern, patternOrigin: Point}): Brush
function Brush()
end

---A cel contains an image at the intersection of a layer and a frame.
---Its position offsets the image from the sprite's top-left corner.
---@class Cel
---@field bounds Rectangle The rectangle of the cel bounds.
---@field color Color The color of the cel in the timeline.
---@field data string The user-defined data related to the cel.
---@field frame Frame|nil The frame to which the cel belongs. When set, the cel will be moved to the given frame.
---@field image Image The cel's image.
---@field layer Layer The layer where the cel is located.
---@field opacity integer The cel opacity between 0 (transparent) and 255 (opaque).
---@field position Point The cel position.
---@field sprite Sprite The sprite to which the cel belongs.
---@NOTE also includes frameNumber property, but unclear what happens if frame is nil
Cel = {}


---Represents a color.
---@class Color
---@field alpha integer The alpha of color between 0 (transparent) and 255 (opaque).
---@field blue integer The blue color channel, in [0, 255].
---@field gray integer
---@field grayPixel integer The pixel color which is equivalent to the gray+alpha values of this color
---@field green integer The green color channel, in [0, 255].
---@field hslHue number
---@field hslLightness number
---@field hslSaturation number
---@field hsvHue number
---@field hsvSaturation number
---@field hsvValue number
---@field hue number The hue.
---@field index integer The nearest (or exact) match palette index for this color.
---@field lightness number The HSL Lightness.
---@field red integer The red color channel, in [0, 255].
---@field rgbaPixel integer The pixel color which is equivalent to the RGBA values of this color
---@field saturation number The HSV saturation or HSL saturation depending on the kind of color
---@field value number The HSV Value
Color = {}

---Creates a new `Color` instance. Performs no bounds checking on arguments.
---@param options {r: integer, g: integer, b: integer, a: integer}
---@return Color
---@overload fun(options: {h: number, s: number, v: number, a: integer}): Color
---@overload fun(options: {h: number, s: number, l: number, a: integer}): Color
---@overload fun(options: {red: integer, green: integer, blue: integer, alpha: integer}): Color
---@overload fun(options: {hue: number, saturation: number, value: number, alpha: integer}): Color
---@overload fun(options: {hue: number, saturation: number, lightness: number, alpha: integer}): Color
---@overload fun(options: {gray: integer, a: integer}): Color
---@overload fun(options: {index: integer}): Color
---@overload fun(index: integer): Color
function Color(options)
end

---Represents the color space/profile of a sprite, image, or image spec
---@class ColorSpace
---@field name string The color space name
ColorSpace = {}

---Creates an empty color space, sRGB color space, or loads a color
---profile from the given ICC file specified in "fromFile" parameter.
---@return ColorSpace
---@overload fun(options: {sRGB: boolean}): ColorSpace
---@overload fun(options: {fromFile: string}): ColorSpace
function ColorSpace()
end

---A class can be used to show input controls/widgets in the screen
---to get some data from the user.
---@class Dialog
---@field bounds Rectangle The bounds of dialog
---@field data {[string]: boolean|string|integer|number|Color|Color[]}
Dialog = {
    ---Creates a button.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, text: string, selected?: boolean, focus?: boolean, onclick?: fun()}
    ---@return Dialog
    button = function(dialog, options)
    end,

    ---Creates a canvas.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, width?: integer, height?: integer, visible?: boolean, autoScaling?: boolean, onpaint?: fun(event: {context: GraphicsContext}), onkeydown?: fun(event: KeyEvent), onkeyup?: fun(event: KeyEvent), onmousemove?: fun(event: MouseEvent), onmousedown?: fun(event: MouseEvent), onmouseup?: fun(event: MouseEvent), ondblclick?: fun(event: MouseEvent), onwheel?: fun(event: MouseEvent), ontouchmagnify?: fun(event: TouchEvent)}
    ---@return Dialog
    canvas = function(dialog, options)
    end,

    ---Creates a check box.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, text?: string, selected?: boolean, onclick?: function}
    ---@return Dialog
    check = function(dialog, options)
    end,

    ---Closes the dialog.
    ---@param dialog Dialog
    close = function(dialog)
    end,

    ---Creates a color picker.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, color?: Color, onchange?: function}
    ---@return Dialog
    color = function(dialog, options)
    end,

    ---Creates a combo box, or drop down list.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, option?: string, options?: string[], onchange?: fun()}
    ---@return Dialog
    combobox = function(dialog, options)
    end,

    ---Creates a text entry field.
    ---@param dialog Dialog
    ---@param options {id?: string, label: string, text: string, focus: boolean, onchange: function}
    ---@return Dialog
    entry = function(dialog, options)
    end,

    ---Creates a button to select one file to open or save.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, title?: string, open?: boolean, save?: boolean, filename: string|string[], filetypes?: string[], onchange?:fun()}
    ---@return Dialog
    file = function(dialog, options)
    end,

    ---Creates a static label.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, text?: string}
    ---@return Dialog
    label = function(dialog, options)
    end,

    ---Changes properties of the given widget given by identifier.
    ---@param dialog Dialog
    ---@param options {id: string, visible?: boolean, enabled?: boolean}|{[string]: any}
    modify = function(dialog, options)
    end,

    ---Creates a new row.
    ---@param dialog Dialog
    ---@param options {always?: boolean}
    ---@return Dialog
    ---@overload fun(): Dialog
    newrow = function(dialog, options)
    end,

    ---Creates an entry field to input a number.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, text?: string, decimals?: integer, onchange?: fun()}
    ---@return Dialog
    number = function(dialog, options)
    end,

    ---Creates a radio button.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, text?: string, selected?: boolean, onchange?: fun()}
    ---@return Dialog
    radio = function(dialog, options)
    end,

    ---Calls the onpaint event of all canvas widgets in the dialog.
    ---@param dialog Dialog
    repaint = function(dialog)
    end,

    ---Creates a separator.
    ---@param dialog Dialog
    ---@param options {id?: string, text?: string}
    ---@return Dialog
    separator = function(dialog, options)
    end,

    ---Creates a widget with an array of colors.
    ---Colors can be picked when the mode is "pick".
    ---They can be sorted and accessed as an array when
    ---the mode is "sort". The default mode is "pick".
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, colors?: Color[], mode?: "pick"|"sort", onclick?: fun(event: {color: Color, button: MouseButton})}
    ---@return Dialog
    shades = function(dialog, options)
    end,

    ---Makes the dialog visible to the user.
    ---When wait is true, blocks other user interactions.
    ---@param dialog Dialog
    ---@param options {wait?: boolean, bounds?: Rectangle}
    ---@overload fun(dialog: Dialog)
    show = function(dialog, options)
    end,

    ---Creates a slider.
    ---@param dialog Dialog
    ---@param options {id?: string, label?: string, min?: integer, max?: integer, value?: integer, onchange?: function, onrelease?: function}
    ---@return Dialog
    slider = function(dialog, options)
    end,
}

---Creates a new `Dialog` instance.
---@return Dialog
---@overload fun(title: string): Dialog
---@overload fun(options: {title: string, onclose: fun()}): Dialog
function Dialog()
end

---A collection of listeners for specific events;
---see: `app.events`, `sprite.events`
---@class Events
Events = {
    ---Connects the given `function` with the given event.
    ---Returns the listenerCode.
    ---@param eventName string the event name/code/identifier
    ---@param func fun()
    ---@return integer
    on = function(eventName, func)
    end,

    ---Disconnects the given function from all events in the object,
    --or stops/breaks only the specific connection
    --identified by listenerCode
    ---@param listenerCode integer
    ---@overload fun(func: fun())
    off = function(listenerCode)
    end,
}


---@class Frame
---@field duration number Duration of the frame in seconds.
---@field frameNumber integer The frame number.
---@field next Frame|nil The next frame, if any.
---@field previous Frame|nil The previous frame, if any.
---@field sprite Sprite The sprite of this frame.
Frame = {}


---The GraphicsContext object provides methods for drawing images,
---text and shapes on the canvas.
---@class GraphicsContext
---@field antialias boolean Gets or sets whether paths and shapes are painted on using antialiasing.
---@field blendMode BlendMode Blend mode used in stroke(), fill(), drawImage(), etc.
---@field color Color Gets or sets the color to paint with the path functions.
---@field height integer Gets the height of the visible area in pixels. Changes when the dialog is resized.
---@field opacity integer Opacity used in stroke(), fill(), drawImage(), etc.
---@field strokeWidth integer Gets or sets the width of lines painted with strokes.
---@field width integer Gets the width of the visible area in pixels. Changes when the dialog is resized.
---@NOTE Also contains the field 'theme', which in turn has an instance styleMetrics method.
GraphicsContext = {
    ---Starts a new path, emptying the list of tracked sub-paths.
    ---This is the first method to call when drawing paths.
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

    ---Adds a cubic Bézier curve to the current sub-path, from the last
    ---point to the specified xy-coordinates, with two control points
    ---(specified by cp1x/cp1y and cp2x/cp2y coordinates).
    ---@param gc GraphicsContext
    ---@param cp1x number first control point x
    ---@param cp1y number first control point y
    ---@param cp2x number second control point x
    ---@param cp2y number second control point y
    ---@param x number anchor point x
    ---@param y number anchor point y
    cubicTo = function(gc, cp1x, cp1y, cp2x, cp2y, x, y)
    end,

    ---Draws on the canvas the given image. If given xy-coordinates, the
    ---full image will be drawn at the specified position, in it's original scale.
    ---If given source and destination bounds (or their respective values),
    ---a part of the image is drawn (specified by the srcRect, or srcX/srcY/
    ---srcW/srcH, relative to the image) on the canvas (specified by the
    ---dstRect or dstX/dstY/dstW/dstH). This allows drawing only a part
    ---of and/or scaling the image.
    ---@param gc GraphicsContext
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@overload fun(gc: GraphicsContext, image: Image, srcRect: Rectangle, dstRect: Rectangle)
    ---@overload fun(gc: GraphicsContext, image: Image, srcX: integer, srcY: integer, srcW: integer, srcH: integer, dstX: integer, dstY: integer, dstW: integer, dstH: integer)
    drawImage = function(gc, image, x, y)
    end,

    ---Draws on the canvas a theme part specified by the given partId,
    ---at a given Point or at specified xy-coordinates.
    ---@param gc GraphicsContext
    ---@param partId string
    ---@param point Point
    ---@overload fun(gc: GraphicsContext, partId: string, x: integer, y: integer)
    drawThemeImage = function(gc, partId, point)
    end,

    ---Draws on the canvas a theme part specified by the given partId,
    ---filling a given Rectangle or at specified xy-coordinates, with
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
    ---at a position specified by the xy-coordinates.
    ---@param gc GraphicsContext
    ---@param text string
    ---@param x integer
    ---@param y integer
    fillText = function(gc, text, x, y)
    end,

    ---Adds a line to the current sub-path, from the last point
    ---to the specified xy-coordinates.
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

    ---Starts a new sub-path at the specified xy-coordinates.
    ---@param gc GraphicsContext
    ---@param x number
    ---@param y number
    moveTo = function(gc, x, y)
    end,

    ---Adds an oval enclosed by the given Rectangle to the current sub-path.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    oval = function(gc, rectangle)
    end,

    ---Adds a given Rectangle to the current sub-path.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    rect = function(gc, rectangle)
    end,

    ---Restores the last saved canvas state.
    ---@param gc GraphicsContext
    restore = function(gc)
    end,

    ---Adds a given Rectangle to the current sub-path with rounded corners.
    ---If a single radius is specified, a rectangle with circular corners
    ---is created. This method can be used to easily draw circles.
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


---@class Grid
---@field origin Point
---@field tileSize Size
Grid = {}

---Creates a new `Grid` instance.
---@return Grid
---@overload fun(otherGrid: Grid): Grid
---@overload fun(x: integer, y: integer, width: integer, height: integer): Grid
---@overload fun(numbers: {[1]: integer, [2]: integer, [3]: integer, [4]: integer}): Grid
function Grid()
end

---@class Image
---@field bounds Rectangle Returns a rectangle with the bounds of the image with origin equal to (0, 0).
---@field bytes string A byte string that contains raw image data.
---@field cel Cel The cel to which this image belongs or `nil`.
---@field colorMode ColorMode The image color mode.
---@field height integer The image height.
---@field rowStride integer Number of bytes for each row in the image.
---@field spec ImageSpec The specification for this image.
---@field version integer Version assigned to the image inside the program, updated with each image change.
---@field width integer The image width.
Image = {
    ---Clear all pixels in the image with given color
    ---(or `image.spec.transparentColor` if no color is specified).
    ---@param image Image
    ---@param color? Color|integer
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

    ---Sets the pixel in the xy-coordinate to the given integer pixel value.
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

    ---Returns a integer pixel value for the given coordinate related to the Image itself.
    ---When the coordinates are out-of-bounds, Returns `0xffffffff`,
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

    ---Returns true if both images looks the same (spec is equal and all pixels are the same).
    ---@param image Image
    ---@param otherImage Image
    ---@return boolean
    isEqual = function(image, otherImage)
    end,

    ---Returns true if all pixels in the image are equal to the
    ---given color (which can be a pixel color or a `Color`).
    ---@param image Image
    ---@param color Color|integer
    ---@return boolean
    isPlain = function(image, color)
    end,

    ---Returns a pixel iterator for the whole image or the given rectangle.
    ---@param image Image
    ---@param rectangle? Rectangle
    ---@return fun(): integer|fun(integer)|{x: integer, y: integer} accessor Can be called to get pixel and set pixel (e.g. `accessor()` and `accessor(pixelValue)`), and holds x, y coordinates
    pixels = function(image, rectangle)
    end,

    ---Resizes the image; The pivot is Point(0, 0) by default.
    ---@param image Image
    ---@param width integer
    ---@param height integer
    ---@overload fun(image: Image, options: {width: integer, height: integer, method?: "bilinear"|"rotsprite", pivot?: Point})
    ---@overload fun(image: Image, options: {size: Size, method?: "bilinear"|"rotsprite", pivot?: Point})
    resize = function(image, width, height)
    end,

    ---Saves the image as a sprite in the given `filename`
    ---@param image Image
    ---@param filename string
    ---@overload fun(image: Image, options: {filename: string, palette: Palette})
    saveAs = function(image, filename)
    end,

    ---Returns the shrunken bounds (a rectangle) of the image
    ---removing all the empty space of borders using the mask
    ---color or the given reference color in refColor.
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

    ---Sets the pixel in the xy-coordinate to the given integer pixel value.
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
---@field colorMode ColorMode
---@field colorSpace ColorSpace
---@field height integer
---@field width integer
---@field transparentColor integer The index that refers a transparent color in a palette when the image or sprite uses indexed color mode.
ImageSpec = {}

---Creates a new `ImageSpec` instance.
---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: {width: integer, height: integer, colorMode: ColorMode|number, transparentColor: number})
function ImageSpec()
end

---@class KeyEvent
---@field altKey boolean
---@field code string A string identifier for the key. See https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values
---@field ctrlKey boolean
---@field key string A string containing the pressed/released Unicode character.
---@field metaKey boolean
---@field repeatCount integer Number of times the key was autorepeated.
---@field shiftKey boolean
---@field spaceKey boolean
KeyEvent = {
    ---Stops propagating this event to other parent widget/main
    ---Aseprite window. Use this in case that your canvas widget
    ---used the key and you want to avoid triggering a command
    ---with a keyboard shortcut.
    ---@param ke KeyEvent
    stopPropagation = function(ke)
    end
}


---@class Layer
---@field blendMode BlendMode|nil The blend mode of the layer, or `nil` if the `layer` is a group.
---@field cels Cel[] Table of cels in the layer.
---@field color Color User-defined color of this layer in the timeline.
---@field data string The user-defined data related to this layer.
---@field id integer The layer's id.
---@field isBackground boolean Whether or not a layer is a background.
---@field isCollapsed boolean Whether or not a group's children are hidden in the timeline.
---@field isContinuous boolean Whether a layer biases toward linked cels when a new cel is created.
---@field isEditable boolean Whether a layer is editable (unlocked).
---@field isExpanded boolean Whether or not a group's child layers are visible in the timeline.
---@field isGroup boolean Whether or not the layer is a group and can be a parent to other layers.
---@field isImage boolean Whether or not the layer contains cels with images.
---@field isReference boolean Whether or not the layer is a reference layer.
---@field isTilemap boolean Whether or not the layer is a tile map.
---@field isTransparent boolean Whether or not a layer supports transparency.
---@field isVisible boolean Whether or not the layer is visible.
---@field layers Layer[]|nil If a layer is a group, gets the table of child layers.
---@field name string The layer's name. Should not be treated as a unique identifier.
---@field opacity integer|nil The layer opacity, or `nil` if the `Layer` is a group.
---@field parent Sprite|Layer The layer's parent. May be a `Sprite` for top-level layers.
---@field sprite Sprite The sprite to which the layer belongs.
---@field stackIndex integer The layer's index in its parent's layers table.
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
---@NOTE also includes frameNumber property, but unclear what happens if frame is nil
Palette = {
    ---Returns the color at the given index. The index goes from 0 to #palette - 1.
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

    ---Changes a palette color in the given index.
    ---The index goes from 0 to #palette - 1.
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
---Palettes loaded fromFile may be `nil`. The resource string should be
---validated as correct before the constructor is called.
---@return Palette
---@overload fun(numberOfColors: integer): Palette
---@overload fun(options: {fromFile: string}): Palette
---@overload fun(options: {fromResource: string}): Palette
function Palette()
end

---@class Point
---@field x integer
---@field y integer
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
---@param x? integer Defaults to zero.
---@param y? integer Defaults to zero.
---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(options: {x: integer, y: integer}): Point
---@overload fun(numbers: {[1]: integer, [2]: integer}): Point
function Point(x, y)
end

---A range of selected objects. It may contain layers, frames, cels,
---images, tiles and/or colors. Tiles and colors are referenced indirectly
---through `integer`s.
---@class Range
---@field cels Cel[] The table of cels.
---@field colors integer[] The table of indices in the color bar.
---@field editableImages Image[] The table of unique, editable images.
---@field frames Frame[] The table of frames.
---@field images Image[] The table of unique images.
---@field isEmpty boolean Whether or not the range is empty.
---@field layers Layer[] The table of layers.
---@field slices Slice[] The table of slices.
---@field sprite Sprite Sprite to which the range is pointing.
---@field tiles integer[] The table of indices in the tileset bar.
---@field type RangeType
Range = {
    ---Clears the current range's contents.
    ---@param range Range
    clear = function(range)
    end,

    ---Returns true if the layer, frame or cel is in the timeline range.
    ---@param range Range
    ---@param object Layer|Frame|Cel
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
---@field height integer
---@field origin Point
---@field size Size
---@field width integer
---@field x integer
---@field y integer
---@operator band(Rectangle): Rectangle
---@operator bor(Rectangle): Rectangle
Rectangle = {
    ---Returns true if `otherRectangle` is inside `rectangle`.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return boolean
    contains = function(rectangle, otherRectangle)
    end,

    ---Returns the new rectangle which is the intersection of
    ---`rectangle` and `otherRectangle`; If both rectangles
    ---don't intersect each other, the result will be empty.
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    intersect = function(rectangle, otherRectangle)
    end,

    ---Returns true if `rectangle` intersects in some way `otherRectangle`
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

    ---Returns a new rectangle big enough to contains both given
    ---rectangles `rectangle` and `otherRectangle`
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    union = function(rectangle, otherRectangle)
    end
}

---Creates a new `Rectangle` instance
---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: integer, y: integer, width: integer, height: integer): Rectangle
---@overload fun(options: {x: integer, y: integer, width: integer, height: integer}): Rectangle
---@overload fun(numbers: {[1]: integer, [2]: integer, [3]: integer, [4]: integer}): Rectangle
function Rectangle()
end

---@class Selection
---@field bounds Rectangle A rectangle with the bounds of the selection
---@field origin Point The selection origin/position
Selection = {
    ---Adds a new `rectangle` (or `otherSelection`) to the selection
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    add = function(selection, rectangle)
    end,

    ---Returns true or false if the given point is inside the selection
    ---@param selection Selection
    ---@param point Point
    ---@return boolean
    ---@overload fun(selection: Selection, x: integer, y: integer): boolean
    contains = function(selection, point)
    end,

    ---Deselects the selection
    ---@param selection Selection
    deselect = function(selection)
    end,

    ---Creates an intersection in `selection` between the given `rectangle` (or `otherSelection`)
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    intersect = function(selection, rectangle)
    end,

    ---Returns true if the selection is empty i.e. there are no pixels selected
    ---@param selection Selection
    isEmpty = function(selection)
    end,

    ---Replaces the selection with the given rectangle
    ---@param selection Selection
    ---@param rectangle Rectangle
    select = function(selection, rectangle)
    end,

    ---Selected the whole sprite canvas; Only valid for a sprite.selection
    ---@param selection Selection
    selectAll = function(selection)
    end,

    ---Subtracts the given `rectangle` (or `otherSelection`) from `selection`
    ---@param selection Selection
    ---@param rectangle Rectangle
    ---@overload fun(selection: Selection, otherSelection: Selection)
    subtract = function(selection, rectangle)
    end,
}

---Creates a new Selection
---@param rectangle? Rectangle
---@return Selection
function Selection(rectangle)
end

---An object that saves the active state of the editor in a specific moment.
---Cel, frame, image, layer or sprite may be nil if no sprite is open or if
---the active layer is a group.
---@class Site
---@field cel Cel|nil The active cel
---@field frame Frame|nil The active frame
---@field image Image|nil The active image
---@field layer Layer|nil The active layer
---@field sprite Sprite|nil The active sprite
---@NOTE As with other classes, omit frameNumber property.
Site = {}


---@class Size
---@field height integer
---@field width integer
---@operator add(Size): Size
---@operator div(integer): Size
---@operator idiv(integer): Size
---@operator mod(integer): Size
---@operator mul(integer): Size
---@operator pow(integer): Size
---@operator sub(Size): Size
---@operator unm(): Size
Size {
    ---@param size Size
    ---@param otherSize Size
    ---@return Size
    union = function(size, otherSize)
    end
}

---Creates a new `Size` instance with the given dimensions
---(or width=height=0 if they are not specified).
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: {width: integer, height: integer}): Size
---@overload fun(options: integer[]): Size
function Size()
end

---An object that allows for nine-slice scaling.
---@class Slice
---@field bounds Rectangle|nil The slice's bounding rectangle, if any.
---@field center Rectangle|nil The central rectangle of a slice's nine-slice, if any.
---@field color Color The user-defined color of this slice in the timeline
---@field data string The user-defined data related to this slice
---@field name string The slice's name
---@field pivot Point|nil The slice's pivot, if any.
---@field sprite Sprite The sprite to which a slice belongs
Slice = {}


---@class Sprite
---@field backgroundLayer Layer|nil The background layer, if any.
---@field bounds Rectangle The bounds of the sprite as a rectangle in the position `0, 0`
---@field cels Cel[] The cels contained by the sprite.
---@field colorMode ColorMode The sprite's color mode.
---@field colorSpace ColorSpace The color space of the sprite
---@field events Events events to associate functions that can act like listeners of specific Sprite events.
---@field filename string The name of the file from where this sprite was loaded or saved or an empty string
---@field frames Frame[] The frames contained by the sprite.
---@field gridBounds Rectangle The bounds of the sprite grid
---@field height integer The vertical sprite dimension.
---@field isModified boolean Returns true if the sprite is modified compared to the latest saved state on disk.
---@field layers Layer[] The layers contained by the sprite.
---@field palettes Palette[] The palettes contained by the sprite.
---@field pixelRatio Size The pixel ratio.
---@field selection Selection The active selection.
---@field slices Slice[] The slices contained by the sprite.
---@field spec ImageSpec The sprite's image specification.
---@field tags Tag[] The tags contained by the sprite.
---@field tilesets Tileset[] The tilesets contained by the sprite.
---@field transparentColor integer An integer that specifies which index is transparent for indexed sprites
---@field width integer The horizontal sprite dimension.
Sprite = {
    ---Assigns a new color space to the sprite without modifying
    ---the sprite pixels.
    ---@param sprite Sprite
    ---@param colorSpace ColorSpace
    assignColorSpace = function(sprite, colorSpace)
    end,

    ---Closes the sprite. Does not ask the user to save changes.
    ---See app.command.CloseFile .
    ---@param sprite Sprite
    close = function(sprite)
    end,

    ---Converts all the sprite pixels to a new color space
    ---so the image looks the same as in the previous color space.
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

    ---Deletes the given `cel`; If the cel is from a transparent
    ---layer, the cel is completely deleted, but if the cel is
    ---from a background layer, the cel will be delete with
    ---the background color
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

    ---Deletes the given `Layer` or the layer with the given `layerName`.
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

    ---Flatten all layers of the sprite into one layer;
    ---is the same as `app.commands.FlattenLayers()`.
    ---@param sprite Sprite
    flatten = function(sprite)
    end,

    ---Sets the sprite palette to one loaded from a file path.
    ---@param sprite Sprite
    ---@param filename string
    loadPalette = function(sprite, filename)
    end,

    ---Creates a new cel in the given layer. Throws an error if the
    ---layer is a group.
    ---If a frame is not provided, defaults to the first frame.
    ---If an image is not provided, a new image will be created with
    ---the size of the sprite canvas.
    ---If a position is not provided, the cel defaults to the sprite
    ---top-left corner.
    ---@param sprite Sprite
    ---@param layer Layer Leaf layer.
    ---@param frame? Frame|integer Defaults to frame one.
    ---@param image? Image Defaults to empty image.
    ---@param position? Point Defaults to top-left corner.
    ---@return Cel
    newCel = function(sprite, layer, frame, image, position)
    end,

    ---Creates a new empty frame in the given `frameNumber` (default: #sprite.frames + 1)
    ---@param sprite Sprite
    ---@param frameNumber? integer
    ---@return Frame
    newEmptyFrame = function(sprite, frameNumber)
    end,

    ---Creates a copy of the given `frame` object or frame number and returns
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

    ---Creates a new tag in the given frame range and with the given name.
    ---@param sprite Sprite
    ---@param fromFrameNumber integer
    ---@param toFrameNumber integer
    ---@return Tag
    newTag = function(sprite, fromFrameNumber, toFrameNumber)
    end,

    ---Inserts an empty tile into the given tileset at a tileIndex.
    ---If tileIndex is not provided, the new tile is added to
    ---the end of the tileset.
    ---@param sprite Sprite
    ---@param tileset Tileset
    ---@param tileIndex integer?
    ---@return Tile
    newTile = function(sprite, tileset, tileIndex)
    end,

    ---Returns a new tileset and adds it to the sprite's tilesets.
    ---If no parameters are given, the tileset has 1 tile of 16x16 pixels.
    ---If Grid or Rectangle is specified, it is used to set the tileset's
    ---origin and tile size.
    ---numTiles specifies the number of initial tiles.
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

    ---Saves a copy of the sprite in the given file but doesn't
    ---change the saved state of the sprite.
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
---@overload fun (otherSprite: Sprite): Sprite
---@overload fun(options: { fromFile: string }): Sprite
---@overload fun(options: { fromFile: string, oneFrame: boolean }): Sprite
function Sprite(width, height, colorMode)
end

---Represents a tag in the timeline.
---@class Tag
---@field aniDir AniDir The Animation Direction property of the tag.
---@field color Color The user-defined color of this tag in the timeline.
---@field frames integer The number of frames that this tag contains.
---@field fromFrame Frame|nil The `Frame` where the tag starts.
---@field name string The name of the tag.
---@field repeats integer Gets or sets the number of times the tag is repeated.
---@field sprite Sprite The sprite to which this tag belongs.
---@field toFrame Frame|nil The `Frame` where the tag ends.
Tag = {}


-- Represents a tile from a Tileset.
---@class Tile
---@field color Color Gets or sets the user-defined color of this tile.
---@field data string Gets or sets the user-defined data related to this tile, a string.
---@field image Image Gets or sets the image of this tile.
---@field index integer The index of the tile in its tileset.
Tile = {}


---@class Tileset
---@field baseIndex integer
---@field color Color
---@field data string
---@field grid Grid
---@field name string
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
---@field interval number Returns the interval of the timer in seconds.
---@field isRunning boolean Returns true if the timer is running.
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

---References a drawing tool. At the moment this class is used only
---to get and set the active tool (`app.activeTool`), or to paint
---on the canvas (`tool` parameter in `app.useTool()`).
---@class Tool
---@field id string the identifier of the specified in the `gui.xml` file
Tool = {}


---Received as the first parameter in the function associated to a
---canvas widget ontouch event.
---@class TouchEvent
---@field magnification number Magnification factor to apply.
---@field x integer Horizontal coordinate, starting from the top-left corner.
---@field y integer Vertical coordinate, starting from the top-left corner.
TouchEvent = {}


---Represents a version number and provides an easy way to
---compare if the `app.version` is greater or equal than an
---expected version. See https://semver.org/ .
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

---WebSocket
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

    ---Sends a very short ping message to the server
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

---Creates as websocket client.
---@param options? {url: string, onreceive: fun(message: string, data: string), deflate: boolean, minreconnectwait: integer, maxreconnectwait: integer}
---@return WebSocket
function WebSocket(options)
end