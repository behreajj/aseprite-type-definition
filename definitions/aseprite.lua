---@meta

---@type unknown
local undefined

---The `app` global namespace.
app = {
    ---Gets the API version.
    apiVersion = undefined --[[@as integer]],

    ---Gets or sets the background color.
    bgColor = undefined --[[@as Color]],

    --Gets or sets the background tile.
    bgTile = undefined --[[@as integer]],

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

    --Gets or sets the foreground tile.
    fgTile = undefined --[[@as integer]],

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
    params = undefined --[[@as table<string, string>]],

    ---Gets the range of elements chosen in the timeline or palette bar.
    range = undefined --[[@as Range]],

    ---Gets the active site.
    site = undefined --[[@as Site]],

    ---Gets or sets the active sprite.
    sprite = undefined --[[@as Sprite|nil]],

    ---Gets an array of sprites open in the application.
    sprites = undefined --[=[@as Sprite[]]=],

    ---Gets the active tag based on the active frame. For overlapping tags,
    ---prioritizes the lower frame number.
    ---`nil` when no sprite is active.
    tag = undefined --[[@as Tag|nil]],

    ---Gets the UI theme.
    theme = undefined --[[@as Theme]],

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

    ---Creates a new transaction so as to bundle many modifications into one
    ---undo operation. The transaction is rolled back if an error is thrown.
    ---@param func function a function called inside the transaction
    ---@overload fun(name: string, func: function)
    ---@see error
    transaction = function(func)
    end,

    ---Undoes the latest operation in the active sprite.
    undo = function()
    end,

    ---Simulates a user stroke in the canvas using the given tool. Many tools
    ---do not work, including but not limited to: polygon, contour, curve.
    ---
    ---Do not use with event handler functions (https://github.com/aseprite/aseprite/issues/4695).
    ---@see Events.on
    ---@param options {bgColor: Color, brush: Brush, button: MouseButton, cel: Cel, color: Color, contiguous: boolean, frame: Frame, freehandAlgorithm: 0|1|2, ink: Ink, layer: Layer, opacity: integer, points: Point[], selection: SelectionMode, tolerance: integer, tool: Tool|string, tilemapMode: TilemapMode, tilesetMode: TilesetMode}
    ---@deprecated
    useTool = function(options)
    end,

    ---Properties and methods to get, set and clear the clipboard.
    clipboard = {
        ---Gets or sets clipboard content.
        content = undefined --[[@as {image: Image|nil, palette:Palette|nil, selection: Selection|nil, text:string|nil, tileset:Tileset|nil}]],

        ---Gets or sets clipboard image data. Getter may return nil.
        image = undefined --[[@as Image|nil]],

        ---Gets or sets clipboard text. Getter may return nil.
        text = undefined --[[@as string|nil]],

        ---Returns true if the clipboard contains image content.
        hasImage = undefined --[[@as boolean]],

        ---Returns true if the clipboard contains text content.
        hasText = undefined --[[@as boolean]],

        ---Clears content from the clipboard.
        clear = function()
        end,
    },

    ---Executes the command named `CommandName` with the parameters provided.
    ---@NOTE CopyCel, Eyedropper, Launch, MoveCel, SelectTile, SetPalette omitted.
    ---@NOTE Try out Screenshot
    command = {
        ---Displays the application about section.
        About = function()
        end,

        ---Appends a color to the active palette. The source defaults to
        ---"color".
        ---@param options {source: "bg"|"color"|"fg", color: Color}
        AddColor = function(options)
        end,

        ---Cycles the view mode from normal UI to context bar and timeline,
        ---then to editor only mode, then back to normal.
        AdvancedMode = function()
        end,

        ---Resizes sprite canvas to remove excess transparent pixels.
        ---See https://github.com/aseprite/aseprite/blob/main/src/app/commands/cmd_crop.cpp#L86 .
        ---@param options {byGrid: boolean}
        AutocropSprite = function(options)
        end,

        ---Converts a layer to a background layer.
        BackgroundFromLayer = function()
        end,

        ---Applies a brightness-contrast adjustment filter to the sprite.
        ---@param options {brightness: integer, channels: FilterChannels|integer, contrast: integer, ui: boolean}
        BrightnessContrast = function(options)
        end,

        ---Cancels the current operation.
        ---@param options {type: "all"|"noop"}
        Cancel = function(options)
        end,

        ---Changes the sprite canvas size by the given dimensions.
        ---When trimOutside is true, trims cels of excess alpha and
        ---trims cels to sprite bounds.
        ---@NOTE Discourage the use of buggy overload which uses left, right, top and bottom.
        ---@param options {bounds: Rectangle, trimOutside: boolean, ui: boolean}
        CanvasSize = function(options)
        end,

        ---Sets the active cel's opacity.
        ---@param options {opacity: integer}
        CelOpacity = function(options)
        end,

        ---Displays the cel properties dialog.
        CelProperties = function()
        end,

        ---Changes the brush according to the change argument. If the `custom`
        ---brush is changed, then `slot` specifies which brush to use.
        ---Incrementing an angle rotates it counter clockwise. Decrementing
        ---rotates it clockwise.
        ---@param options {change: "custom"|"decrement-angle"|"decrement-size"|"flip-x"|"flip-y"|"flip-d"|"increment-angle"|"increment-size"|"rotate-90cw", slot: integer}
        ChangeBrush = function(options)
        end,

        ---Changes the active color in the color bar. When a color reaches one
        ---end of the palette, it will loop around to the other end.
        ---@param options {change: "decrement-index"|"increment-index", target: "background"|"foreground"}
        ChangeColor = function(options)
        end,

        ---Changes the sprite's color mode.
        ---When `ui` is `true`, widgets do not display arguments set by command.
        ---@param options {fitCriteria: "cielab"|"ciexyz"|"linearizedRGB"|"rgb"|"default", format: "rgb"|"gray"|"grayscale"|"indexed", dithering: "ordered"|"old"|"error-diffusion", ["dithering-matrix"]: string, rgbmap: "octree"|"rgb5a3"|"default", toGray: "luma"|"hsv"|"hsl"}
        ChangePixelFormat = function(options)
        end,

        ---Deletes timeline elements in a range.
        Clear = function()
        end,

        ---Deletes the selected cels. In a background layer, replaces cels with
        ---an active background color fill.
        ClearCel = function()
        end,

        ---Closes all files.
        CloseAllFiles = function()
        end,

        ---Closes the active file.
        CloseFile = function()
        end,

        ---Applies an sRGB color curve filter to the sprite.
        ---@param options {channels: FilterChannels|integer, curve: Point[]|integer[][], ui: boolean}
        ColorCurve = function(options)
        end,

        ---Extracts a palette from the sprite canvas.
        ---For the algorithm, 0 is default, 1 is RGB table, 2 is octree.
        ---@param options {algorithm:0|1|2, maxColors: integer, ui: boolean, useRange: boolean, withAlpha: boolean}
        ColorQuantization = function(options)
        end,

        ---Toggles the contiguous fill setting on tools such as paint bucket
        ---magic wand, and gradient.
        ContiguousFill = function()
        end,

        ---Converts a layer's type.
        ---@param options {to: "background"|"layer"|"tilemap", ui: boolean}
        ConvertLayer = function(options)
        end,

        ---Applies a convolution matrix filter to the sprite.
        ---@param options {channels: FilterChannels|integer, fromResource: string, tiledMode: "both"|"none"|"x"|"y", ui: boolean}
        ConvolutionMatrix = function(options)
        end,

        ---Copies a selection at the active layer.
        Copy = function()
        end,

        ---Copies the palette swatches in a range and pastes them before the
        ---given index.
        ---@param options {before: integer}
        CopyColors = function(options)
        end,

        ---Copies a selection of composited layers.
        CopyMerged = function()
        end,

        ---Copies the active sprite's path to the clipboard.
        CopyPath = function()
        end,

        ---Crops the sprite according to a selection.
        ---@param options {x: integer, y: integer, width: integer, height: integer}
        CropSprite = function(options)
        end,

        ---Copies and removes the selected content.
        Cut = function()
        end,

        ---Removes a selection mask from the sprite.
        DeselectMask = function()
        end,

        ---Applies a despeckle filter to the sprite.
        ---@param options {channels: FilterChannels|integer, height: integer, tiledMode: "both"|"none"|"x"|"y", ui: boolean, width: integer}
        Despeckle = function(options)
        end,

        ---Opens the developer console.
        DeveloperConsole = function()
        end,

        ---Discards an active, custom brush, returning to a default brush.
        DiscardBrush = function()
        end,

        ---Duplicates a layer. For tilemap layers, the new layer refers to the
        ---same tile set as the source layer, by reference.
        DuplicateLayer = function()
        end,

        ---Duplicates a sprite. Parameters available as of version 1.3.11-beta-1.
        ---@param options {filename: string, flatten: boolean, ui: boolean}
        DuplicateSprite = function(options)
        end,

        ---Duplicates a view of the sprite in the editor. Does not duplicate
        ---the sprite itself.
        DuplicateView = function()
        end,

        ---Exits the application.
        Exit = function()
        end,

        ---Exports the sprite to a sprite sheet.
        ---@param options {askOverwrite: boolean, bestFit: boolean, borderPadding: integer, columns: integer, dataFilename: string, dataFormat: SpriteSheetDataFormat, extrude: boolean, filenameFormat: string, fromTilesets: boolean, height: integer, ignoreEmpty: boolean, innerPadding: integer, layer: string, recent: boolean, listLayers: boolean, listSlices: boolean, listTags: boolean, mergeDuplicates: boolean, openGenerated: boolean, rows: integer, shapePadding: integer, splitGrid: boolean, splitLayers: boolean, splitTags: boolean, tag: string, textureFilename: string, trim: boolean, trimByGrid: boolean, trimSprite: boolean, type: SpriteSheetType, ui: boolean, width: integer}
        ExportSpriteSheet = function(options)
        end,

        ---Exports a Tileset.
        ---@param options {aniDir: AniDir, bounds: Rectangle, dataFormat: SpriteSheetDataFormat, filename: string, filenameFormat: string, fromFrame: Frame, fromTilesets: boolean, ignoreEmpty: boolean, scale: number, slice: string, tag: string, toFrame: Frame, ui: boolean}
        ExportTileset = function(options)
        end,

        ---Fills a selection with the foreground color.
        Fill = function()
        end,

        ---Centers and zooms the sprite canvas so as to fit it on screen.
        FitScreen = function()
        end,

        ---Flattens layers.
        ---@param options {visibleOnly: boolean}
        FlattenLayers = function(options)
        end,

        ---Flips the content horizontally or vertically. If target is "mask",
        ---flips the selected region only.
        ---@param options {target: "mask", orientation: "horizontal"|"vertical"}
        Flip = function(options)
        end,

        ---Displays the frame properties dialog.
        ---@param options {frame: "all"|"current"|integer}
        FrameProperties = function(options)
        end,

        ---Displays the tag properties dialog.
        FrameTagProperties = function()
        end,

        ---Toggles full screen mode.
        FullscreenMode = function()
        end,

        ---Displays full screen preview.
        FullscreenPreview = function()
        end,

        ---Sets the first frame in the sprite as active.
        GotoFirstFrame = function()
        end,

        ---Sets the first frame in the tag as active.
        GotoFirstFrameInTag = function()
        end,

        ---Sets the active frame.
        ---@param options {frame: integer}
        GotoFrame = function(options)
        end,

        ---Sets the last frame in the sprite as active.
        GotoLastFrame = function()
        end,

        ---Sets the last frame in the tag as active.
        GotoLastFrameInTag = function()
        end,

        ---Sets the next frame to active.
        GotoNextFrame = function()
        end,

        ---Sets the next frame within the same tag to active.
        GotoNextFrameWithSameTag = function()
        end,

        ---Sets the next layer up the stack to active.
        GotoNextLayer = function()
        end,

        ---Sets the next tab in the application to active.
        GotoNextTab = function()
        end,

        ---Sets the previous frame to active.
        GotoPreviousFrame = function()
        end,

        ---Sets the previuos frame within the same tag to active.
        GotoPreviousFrameWithSameTag = function()
        end,

        ---Sets the previous layer down the stack to active.
        GotoPreviousLayer = function()
        end,

        ---Sets the previous tab in the application to active.
        GotoPreviousTab = function()
        end,

        ---Displays grid settings window.
        GridSettings = function()
        end,

        ---Displays the home tab.
        Home = function()
        end,

        ---Applies the hue/saturation filter to the sprite.
        ---`channels` defaults to 0.
        ---`mode` can be 0 for HSV_MUL; 1, HSL_MUL; 2, HSV_ADD; 3, HSL_ADD. See
        ---https://github.com/aseprite/aseprite/blob/main/src/filters/hue_saturation_filter.h .
        ---Defaults to HSL_MUL.
        ---When `ui` is `true`, widgets do not display arguments set by command.
        ---@param options {alpha: number, channels: FilterChannels|integer, hue: number, lightness: number, mode: 0|1|2|3, saturation: number, ui: boolean, value: number}
        HueSaturation = function(options)
        end,

        ---Imports a sprite from a sprite sheet.
        ---@param options {frameBounds: Rectangle, padding: Size, partialTiles: boolean, type: SpriteSheetType, ui: boolean}
        ImportSpriteSheet = function(options)
        end,

        ---Applies the invert color filter to the sprite.
        ---@param options {channels: FilterChannels|integer, ui: boolean}
        InvertColor = function(options)
        end,

        ---Inverts the active selection.
        InvertMask = function()
        end,

        ---Opens the keyboard shortcuts dialog, optionally with the results of
        ---a search query.
        ---@param options {search: string}
        KeyboardShortcuts = function(options)
        end,

        ---Converts a background layer to a regular layer.
        LayerFromBackground = function()
        end,

        ---Toggles editability of layers in the active range.
        LayerLock = function()
        end,

        ---Sets the active layer's opacity.
        ---@param options {opacity: integer}
        LayerOpacity = function(options)
        end,

        ---Displays the layer properties dialog.
        LayerProperties = function()
        end,

        ---Toggles visibility of layers in the active range.
        LayerVisibility = function()
        end,

        ---Links the cels contained by the active range.
        LinkCels = function()
        end,

        ---Loads a selection from a file.
        ---@param options {filename: string}
        LoadMask = function(options)
        end,

        ---Loads a palette from either preset or file name. For the preset,
        ---use "default" to load the default palette.
        ---@overload fun(options: {preset: "default"|string})
        ---@param options {filename: string}
        LoadPalette = function(options)
        end,

        ---Selects all the sprite canvas.
        MaskAll = function()
        end,

        ---Displays the select color dialog.
        ---@param options {color: Color, mode: SelectionMode, tolerance: integer, ui: boolean}
        MaskByColor = function(options)
        end,

        ---Creates a selection around a cel's bounding box.
        MaskContent = function()
        end,

        ---Merges the layer with those beneath.
        MergeDownLayer = function()
        end,

        ---Changes the active selection, either contracting it, expanding it or
        ---turning it into a border.
        ---@param options {brush: "circle"|"square", modifier: "border"|"contract"|"expand", quantity: integer}
        ModifySelection = function(options)
        end,

        ---Moves colors in a range in the palette to before the given index.
        ---@param options {before:integer}
        MoveColors = function(options)
        end,

        ---Moves a selection, either its boundaries or content, depending on
        ---the `target`. The `wrap` parameter wraps pixel content around the
        ---selection boundaries.
        ---@param options {direction: "down"|"left"|"right"|"up", quantity: integer, target: "boundaries"|"content", units: "pixel"|"tile-height"|"tile-width"|"zoomed-pixel"|"zoomed-tile-height"|"zoomed-tile-width"|"viewport-height"|"viewport-width", wrap: boolean}
        MoveMask = function(options)
        end,

        ---Creates a new sprite.
        ---@overload fun(options: {fromClipboard: boolean})
        ---@param options {colorMode: ColorMode, height: integer, ui: boolean, width: integer}
        NewFile = function(options)
        end,

        ---Creates a new frame.
        ---@param options {content: "cel"|"celblock"|"celcopies"|"cellinked"|"current"|"empty"|"frame"}
        NewFrame = function(options)
        end,

        ---Creates a new tag. Displays dialog to set new tag options.
        NewFrameTag = function()
        end,

        ---Creates a new layer. Layer type options `reference`, `tilemap` and
        ---`group` are mutually exclusive. The `gridBounds` parameter applies
        ---only to tilemap layers. The `ask` parameter refers to displaying a
        ---dialog in the UI for the user to enter a layer name. The `top`
        ---parameter places a new layer at the top of the stack if true. The
        ---`before` parameter places the new layer before the active layer if
        ---true, after if false.
        ---@overload fun(options: {fromClipboard: boolean, name: string})
        ---@overload fun(options: {fromFile: boolean, name: string})
        ---@param options {ask: boolean, before: boolean, gridBounds: Rectangle, group: boolean, name: string, reference: boolean, tilemap: boolean, top: boolean, viaCopy: boolean, viaCut: boolean}
        NewLayer = function(options)
        end,

        ---Creates a new sprite from the active selection.
        NewSpriteFromSelection = function()
        end,

        ---Opens a a file in the rich-text browser, e.g., for markdown (.md)
        ---files.
        ---@param options {filename: string}
        OpenBrowser = function(options)
        end,

        ---Opens a file.
        ---@param options {filename: string, folder: string, oneframe: boolean, repeat_checkbox: boolean, sequence: "agree"|"ask"|"no"|"skip"|"yes"}
        OpenFile = function(options)
        end,

        ---Toggles whether the active group folder is open or closed.
        OpenGroup = function()
        end,

        ---If the active sprite has been saved to disk, opens an operating
        ---system file browser of the folder that contains the file.
        OpenInFolder = function()
        end,

        ---Opens an operating system file browser indicating where Lua scripts
        ---can be found.
        OpenScriptFolder = function()
        end,

        ---If the active sprite has been saved to disk, opens the file with the
        ---defaut application.
        OpenWithApp = function()
        end,

        ---Displays the preferences dialog, with an option to prompt the
        ---installation of an extension from a file path.
        ---@param options {installExtension: string}
        Options = function(options)
        end,

        ---Applies an outline to the selected elements.
        ---@param options {bgColor: Color, channels: FilterChannels|integer, color: Color, matrix:"circle"|"horizontal"|"square"|"vertical", place: "inside"|"outside", tiledMode: "both"|"none"|"x"|"y", ui: boolean}
        Outline = function(options)
        end,

        ---Edits a color in the palette. If `edit` is set to `switch`, toggles
        ---whether the palette is locked or unlocked. If `popup` is
        ---`background`, then displays color sliders for the background color.
        ---If `popup` is set to a non-empty string, displays the sliders for
        ---the foreground color.
        ---@param options {edit: "switch", popup: "background"}
        PaletteEditor = function(options)
        end,

        ---Sets the size of the active palette.
        ---@param options {size: integer}
        PaletteSize = function(options)
        end,

        ---Pastes content from the clipboard.
        ---@param options {x: integer, y: integer}
        Paste = function(options)
        end,

        ---Opens the insert text dialog window.
        PasteText = function()
        end,

        ---Toggles pixel perfect on and off for tools such as the pencil.
        PixelPerfectMode = function()
        end,

        ---Plays the sprite animation in the editor canvas.
        PlayAnimation = function()
        end,

        ---Plays the sprite animation in the preview window.
        PlayPreviewAnimation = function()
        end,

        ---Repeats the previous export.
        RepeatLastExport = function()
        end,

        ---Reloads Aseprite's theme, or skin. May cause crashes in version
        ---1.2.40 or older, especially with custom themes.
        Refresh = function()
        end,

        ---Replaces the `from` color with the `to` color according to a match
        ---tolerance.
        ---@param options {channels: FilterChannels|integer, from: Color, to: Color, tolerance: integer, ui: boolean}
        ReplaceColor = function(options)
        end,

        ---Reselects a previously unselected mask.
        ReselectMask = function()
        end,

        ---Reverses the order of frames in the active range.
        ReverseFrames = function()
        end,

        ---Rotates an element by an angle in degrees.
        ---@param options {target: "mask", angle: integer}
        Rotate = function(options)
        end,

        ---Runs a script from file name. Other parameters are passed to the
        ---script to parse.
        ---@param options {filename: string}
        RunScript = function(options)
        end,

        ---This method has serious bugs, particularly with `fromFrame` and
        ---`toFrame` parameters. Prefer save methods in `Image` and `Sprite`
        ---where possible.
        ---@param options {aniDir: AniDir, bounds: Rectangle, filename: string, filenameFormat: string, fromFrame: Frame, ignoreEmpty: boolean, recent: boolean, scale: number, slice: string, tag: string, toFrame: Frame, ui: boolean}
        ---@deprecated
        SaveFile = function(options)
        end,

        ---This method has serious bugs, particularly with `fromFrame` and
        ---`toFrame` parameters. Prefer save methods in `Image` and `Sprite`
        ---where possible.
        ---@param options {aniDir: AniDir, bounds: Rectangle, filename: string, filenameFormat: string, fromFrame: Frame, ignoreEmpty: boolean, recent: boolean, scale: number, slice: string, tag: string, toFrame: Frame, ui: boolean}
        ---@deprecated
        SaveFileAs = function(options)
        end,

        ---This method has serious bugs, particularly with `fromFrame` and
        ---`toFrame` parameters. Prefer save methods in `Image` and `Sprite`
        ---where possible.
        ---@param options {aniDir: AniDir, bounds: Rectangle, filename: string, filenameFormat: string, fromFrame: Frame, ignoreEmpty: boolean, recent: boolean, scale: number, slice: string, tag: string, toFrame: Frame, ui: boolean}
        ---@deprecated
        SaveFileCopyAs = function(options)
        end,

        ---Opens the file browser to save a selection to file.
        SaveMask = function()
        end,

        ---Saves the active palette by preset name.
        ---@param options {preset: string, saveAsPreset: boolean}
        SavePalette = function(options)
        end,

        ---Scrolls the canvas view.
        ---@param options {direction: "down"|"left"|"right"|"up", quantity: integer, units: "pixel"|"tile-height"|"tile-width"|"zoomed-pixel"|"zoomed-tile-height"|"zoomed-tile-width"|"viewport-height"|"viewport-width"}
        Scroll = function(options)
        end,

        ---Scrolls the canvas view to the sprite center.
        ScrollCenter = function()
        end,

        ---Sets the sprite's grid to the active selection's bounds.
        SelectionAsGrid = function()
        end,

        ---Sets the color selector in the UI. The argument "wheel" is the same
        ---as "rgb-wheel".
        ---@param options {type: "normal-map-wheel"|"rgb-wheel"|"ryb-wheel"|"spectrum"|"tint-shade-tone"|"wheel"}
        SetColorSelector = function(options)
        end,

        ---Sets the ink type for the active tool.
        ---@param options {type: Ink}
        SetInkType = function(options)
        end,

        ---Creates or removes a tag around frames. Frame indices are zero
        ---indexed, regardless of UI base index. The parameter "end" is a Lua
        ---reserved keyword, so place in square brackets, e.g., { ["end"] = 5 }.
        ---@param options {action: "off"|"on", begin: integer, end: integer}
        SetLoopSection = function(options)
        end,

        ---Creates a range in the color bar of used or unused colors or tiles,
        ---per the modifier.
        ---@param options {modifier: "unused_colors"|"unused_tiles"|"used_colors"|"used_tiles"}
        SelectPaletteColors = function(options)
        end,

        ---Sets the palette swatch display size in the color bar.
        ---@param options {size: integer}
        SetPaletteEntrySize = function(options)
        end,

        ---Sets the animation playback speed.
        ---@param options {multiplier: number}
        SetPlaybackSpeed = function(options)
        end,

        ---Toggles whether the ink type is shared across all tools.
        SetSameInk = function()
        end,

        ---Toggles whether to show auto-guides on the canvas.
        ShowAutoGuides = function()
        end,

        ---Toggles the brush preview setting.
        ShowBrushPreview = function()
        end,

        ---Toggles the visibility for elements in the 'extras' category.
        ShowExtras = function()
        end,

        ---Toggles grid visibility. If a tile map layer is active, shows the
        ---tile grid. Otherwise, shows the sprite grid.
        ShowGrid = function()
        end,

        ---Toggles whether to show layer edges, i.e., cel bounds, on the canvas.
        ShowLayerEdges = function()
        end,

        ---Displays a menu. For appropriate menu strings, see
        ---https://github.com/aseprite/aseprite/blob/main/data/gui.xml.
        ---@param options {menu: string}
        ShowMenu = function(options)
        end,

        ---Toggles the onion skin's visibility.
        ShowOnionSkin = function()
        end,

        ---Toggles pixel grid visibility.
        ShowPixelGrid = function()
        end,

        ---Toggles the show selection edges setting.
        ShowSelectionEdges = function()
        end,

        ---Toggles the visibility of slices on the canvas.
        ShowSlices = function()
        end,

        ---Toggles tile number visibility on the canvas.
        ShowTileNumbers = function()
        end,

        ---Displays the slice properties dialog.
        ---@param options {name: string, id: string}
        SliceProperties = function(options)
        end,

        ---Toggles snap to grid setting.
        SnapToGrid = function()
        end,

        ---Displays the sprite properties dialog.
        SpriteProperties = function()
        end,

        ---Scales a sprite, either to a target width and height, or by a
        ---scalar. Not to be confused with changing a sprite's canvas size.
        ---@param options {height: integer, lockRatio: boolean, method: "bilinear"|"nearest"|"rotSprite", scale: number, scaleX: number, scaleY: number, ui: boolean, width: integer}
        SpriteSize = function(options)
        end,

        ---Strokes the inner edge of a selection with the foreground color.
        Stroke = function()
        end,

        ---Swaps the colors in a sprite's background checkboard.
        SwapCheckerboardColors = function()
        end,

        ---Switches the foreground and background color.
        ---Reverses the order of swatches in shading ink.
        SwitchColors = function()
        end,

        ---Toggles a sprite's symmetry mode. Defaults to "none".
        ---@param options {orientation: "horizontal"|"left_diagonal"|"none"|"right_diagonal"|"vertical"}
        SymmetryMode = function(options)
        end,

        ---Sets a sprite's tiled mode view.
        ---@param options {axis: "both"|"x"|"y"}
        TiledMode = function(options)
        end,

        ---Sets a sprite's tile set mode. Defaults to "auto".
        ---@param options {mode: "auto"|"manual"|"stack"}
        TilesetMode = function(options)
        end,

        ---Shows, hides or toggles the visibility of the timeline.
        ---@overload fun(options: {close: boolean})
        ---@overload fun(options: {open: boolean})
        ---@param options {switch: boolean}
        Timeline = function(options)
        end,

        ---Toggle setting to display only active layer.
        ---@param options {checkedIfZero: boolean, opacity: integer, preview: boolean}
        ToggleOtherLayersOpacity = function(options)
        end,

        ---Toggles the animation playback setting to play all frames.
        TogglePlayAll = function()
        end,

        ---Toggles the animation playback setting to play once.
        TogglePlayOnce = function()
        end,

        ---Toggles the animation playback setting to play subtags.
        TogglePlaySubtags = function()
        end,

        ---Toggles the preview windows visibility for an active sprite.
        TogglePreview = function()
        end,

        ---Toggles the animation playback setting to rewind on stop.
        ToggleRewindOnStop = function()
        end,

        ---Toggles between focus on color palette swatches and tiles in a set
        ---in the color bar.
        ToggleTilesMode = function()
        end,

        ---Toggles visibility of timeline cel thumbnails.
        ToggleTimelineThumbnails = function()
        end,

        ---Undoes the most recent action.
        Undo = function()
        end,

        ---Toggles visibility of the undo history dialog.
        UndoHistory = function()
        end,

        ---Unlinks the cels contained by the active range.
        UnlinkCel = function()
        end,

        ---Zooms the sprite view. When a percentage is provided, then sets the
        ---zoom to the level nearest the input. To zoom in and out, do not
        ---provide a percentage.
        ---@overload fun(options: {action: "in"|"out", focus: "center"|"mouse"})
        ---@param options {action: "set", focus: "center"|"mouse", percentage: number }
        ---@NOTE percentage is retrieved as a string, but parsed as a number.
        Zoom = function(options)
        end
    },

    ---Functions to handle file names and the file system.
    fs = {
        ---The installation path of Aseprite for the current platform.
        appPath = undefined --[[@as string]],

        ---The path from which the Aseprite executable launched.
        currentPath = undefined --[[@as string]],

        ---The preferred path separator of the current platform.
        pathSeparator = undefined --[[@as "/"|"\\"]],

        ---The path for temporary files.
        tempPath = undefined --[[@as string]],

        ---The user's Aseprite configuration path.
        userConfigPath = undefined --[[@as string]],

        ---The user's Documents path.
        userDocsPath = undefined --[[@as string]],

        ---Returns the file extension of the given filename, excluding the `.`.
        ---@param fileName string
        ---@return string
        fileExtension = function(fileName)
        end,

        ---Returns the file name, including the extension.
        ---@param fileName string
        ---@return string
        fileName = function(fileName)
        end,

        ---Returns the path, or directory, part of the given filename.
        ---@param fileName string
        ---@return string
        filePath = function(fileName)
        end,

        ---Returns the file path joined with the title, excluding the extension,
        ---of the given filename.
        ---@param fileName string
        ---@return string
        filePathAndTitle = function(fileName)
        end,

        ---Returns the file size of the given filename.
        ---@param fileName string
        ---@return integer
        fileSize = function(fileName)
        end,

        ---Returns the file title, excluding the path and extension, of the
        ---given filename.
        ---@param fileName string
        ---@return string
        fileTitle = function(fileName)
        end,

        ---Returns true if the given filename is a directory.
        ---@param fileName string
        ---@return boolean
        isDirectory = function(fileName)
        end,

        ---Returns true if the given filename is a file.
        ---@param fileName string
        ---@return boolean
        isFile = function(fileName)
        end,

        ---Joins together a number of string arguments
        ---with the path separator for the current platform.
        ---@param ... string
        ---@return string
        joinPath = function(...)
        end,

        ---Returns a list of files in the given directory path.
        ---Each file name in the return table is relative to the path.
        ---@param path string
        ---@return string[]
        listFiles = function(path)
        end,

        ---Returns the file path converted to a canonical form for the current
        ---platform.
        ---@param path string
        ---@return string
        normalizePath = function(path)
        end,

        ---Creates all directories needed to access the path.
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
        ---@return boolean success
        removeDirectory = function(path)
        end
    },

    ---Properties about the operating system.
    os = {
        ---Returns true if the architecture is Arm 64.
        arm64 = undefined --[[@as boolean]],

        ---Gets the operating system name and version.
        fullName = undefined --[[@as string]],

        ---Returns true if the operating system is Linux.
        linux = undefined --[[@as boolean]],

        ---Returns true if the operating system is Mac.
        macos = undefined --[[@as boolean]],

        ---Gets the operating system name.
        name = undefined --[[@as "Linux"|"macOS"|"Windows"]],

        ---Gets the operating system semantic version. See https://semver.org/ .
        version = undefined --[[@as string]],

        ---Returns true if the operating system is Windows.
        windows = undefined --[[@as boolean]],

        ---Returns true if the architecture is x64.
        x64 = undefined --[[@as boolean]],

        ---Returns true if the architecture is x86.
        x86 = undefined --[[@as boolean]]
    },

    ---A module to handle the color for Image pixels as unsigned integers.
    pixelColor = {
        ---Constructs a 16-bit unsigned integer for grayscale images.
        ---@param gray integer Gray value. Black is 0, white is 255.
        ---@param alpha? integer Alpha. Default is 255, opaque.
        ---@return integer
        graya = function(gray, alpha)
        end,

        ---Returns the alpha component from a 16-bit integer.
        ---@param grayPixelValue integer 16-bit integer.
        ---@return integer
        grayaA = function(grayPixelValue)
        end,

        ---Returns the gray component from a 16-bit integer.
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

        ---Returns the alpha component from a 32-bit integer.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaA = function(rgbaPixelValue)
        end,

        ---Returns the blue component from a 32-bit integer.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaB = function(rgbaPixelValue)
        end,

        ---Returns the green component from a 32-bit integer.
        ---@param rgbaPixelValue integer 32-bit integer.
        ---@return integer
        rgbaG = function(rgbaPixelValue)
        end,

        ---Returns the red component from a 32-bit integer.
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

        ---Returns the modifier flags for a tile in the map, where `0x20000000`
        ---is diagonal, `0x40000000` is vertical, `0x80000000` is horizontal.
        ---These three may be composited together up to `0xe0000000`.
        ---See https://github.com/aseprite/aseprite/blob/main/src/doc/tile.h .
        ---@param mapEntryValue integer Entry value.
        ---@return integer
        tileF = function(mapEntryValue)
        end,

        ---Returns the tile set index for a tile in the map.
        ---@param mapEntryValue integer Entry value.
        ---@return integer
        tileI = function(mapEntryValue)
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

    ---The active cel. `nil` when no sprite is active or when the active layer
    ---is a group.
    ---@deprecated
    activeCel = undefined --[[@as Cel|nil]],

    ---The active frame. `nil` when no sprite is active.
    ---Can be assigned an integer frame number.
    ---@deprecated
    activeFrame = undefined --[[@as Frame|nil]],

    ---The active image. `nil` when no sprite is active or when the active
    ---layer is a group.
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
    ---`number` fields will be parsed to `float`s,
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


---@enum Align
Align = {
    LEFT = 0x040000,
    CENTER = 0x080000,
    RIGHT = 0x100000,
    TOP = 0x200000,
    BOTTOM = 0x800000,
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
---https://github.com/aseprite/aseprite/blob/main/src/app/script/engine.cpp#L299
---@enum BlendMode
BlendMode = {
    CLEAR = 0,
    SRC = 1,
    DST = 2,
    NORMAL = 3, -- SRC_OVER
    DST_OVER = 4,
    SRC_IN = 5,
    DST_IN = 6,
    SRC_OUT = 7,
    DST_OUT = 8,
    SRC_ATOP = 9,
    DST_ATOP = 10,
    XOR = 11,
    PLUS = 12,
    MODULATE = 13,
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
    HSL_HUE = 25,        -- HUE
    HSL_SATURATION = 26, -- SATURATION
    HSL_COLOR = 27,      -- COLOR
    HSL_LUMINOSITY = 28, -- LUMINOSITY
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


---https://github.com/aseprite/aseprite/blob/main/src/filters/target.h
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


---https://github.com/aseprite/aseprite/blob/main/src/doc/algorithm/flip_type.h
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


---https://github.com/aseprite/aseprite/blob/main/src/ui/mouse_button.h
---@enum MouseButton
MouseButton = {
    NONE = 0,
    LEFT = 1,
    RIGHT = 2,
    MIDDLE = 3,
    X1 = 4,
    X2 = 5
}


---https://github.com/aseprite/aseprite/blob/main/src/ui/cursor_type.h
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


---https://github.com/aseprite/aseprite/blob/main/src/app/doc_range.h#L28
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


---https://github.com/aseprite/aseprite/blob/main/src/app/tilemap_mode.h
---@enum TilemapMode
TilemapMode = {
    PIXELS = 0,
    TILES = 1
}


---https://github.com/aseprite/aseprite/blob/main/src/app/tileset_mode.h
---@enum TilesetMode
TilesetMode = {
    MANUAL = 0,
    AUTO = 1,
    STACK = 2
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
    ---@NOTE There is also setBgColor. Not clear how it works, if at all.

    ---Sets the brush's foreground color.
    ---@param brush Brush
    ---@param color Color
    setFgColor = function(brush, color)
    end
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
---@field bounds Rectangle Gets the cel bounds. Width and height are scaled by tile size in tile map cels.
---@field color Color Gets or sets the cel color in the timeline.
---@field data string Gets or sets custom data assigned to the cel.
---@field frame Frame|nil Gets or sets the frame to which the cel belongs. When set, the cel will be moved to the given frame.
---@field image Image Gets or sets the cel's image.
---@field layer Layer Gets the layer to which the cel belongs.
---@field opacity integer Gets or sets the cel opacity.
---@field position Point Gets or sets the cel position.
---@field properties table<string, any> Gets or sets the cel's user-defined properties.
---@field sprite Sprite Gets the sprite to which the cel belongs.
---@field zIndex integer Gets or sets the cel's z offset in [-32768, 32767].
---@NOTE also includes frameNumber property, but uncertain what happens if frame is nil
Cel = {}


---Represents a color. The expected range for alpha (opacity, transparency) is
---[0, 255]. Expected ranges for red, green and blue are [0, 255]. The expected
---range for hue is [0.0, 360.0). Expected ranges for saturation, lightness and
---value are [0.0, 1.0].
---@class Color
---@field alpha integer Gets or sets the transparency.
---@field blue integer Gets or sets the blue color channel.
---@field gray number Gets the color's gray value as a number based on HSL lightness. Sets as an integer.
---@field grayPixel integer Gets a 16-bit gray pixel (0xAAVV), based on HSL lightness.
---@field green integer Gets or sets the green color channel.
---@field hslHue number Gets or sets the HSL hue.
---@field hslLightness number Gets or sets the HSL lightness.
---@field hslSaturation number Gets or sets the HSL saturation.
---@field hsvHue number Gets or sets the HSV hue.
---@field hsvSaturation number Gets or sets the HSV saturation.
---@field hsvValue number Gets or sets the HSV value.
---@field hue number Gets or sets the hue.
---@field index integer Gets or sets the nearest or exact match palette index for this color. Index may be greater than a byte in size, [0, 255].
---@field lightness number Gets or sets the HSL lightness.
---@field red integer Gets or sets the red color channel.
---@field rgbaPixel integer Gets a 32-bit pixel for RGB color mode (0xAABBGGRR).
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
    ---@param options {id: string, label: string, text: string, enabled: boolean, focus: boolean, selected: boolean, visible: boolean, onclick: function}
    ---@return Dialog
    button = function(dialog, options)
    end,

    ---Appends a canvas to a dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, width: integer, height: integer, hexpand: boolean, autoscaling: boolean, visible: boolean, vexpand: boolean, ondblclick: fun(event: MouseEvent), onkeydown: fun(event: KeyEvent), onkeyup: fun(event: KeyEvent), onmousedown: fun(event: MouseEvent), onmousemove: fun(event: MouseEvent), onmouseup: fun(event: MouseEvent), onpaint: fun(event: {context: GraphicsContext}), ontouchmagnify: fun(event: TouchEvent), onwheel: fun(event: MouseEvent)}
    ---@return Dialog
    canvas = function(dialog, options)
    end,

    ---Appends a check box widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, enabled: boolean, focus: boolean, selected: boolean, visible: boolean, onclick: function}
    ---@return Dialog
    check = function(dialog, options)
    end,

    ---Closes the dialog.
    ---@param dialog Dialog
    close = function(dialog)
    end,

    ---Appends a color picker widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, color: Color, enabled: boolean, focus: boolean, visible: boolean, onchange: function}
    ---@return Dialog
    color = function(dialog, options)
    end,

    ---Appends a combo box, or drop down menu, to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, option: string, options: string[], enabled: boolean, visible: boolean, onchange: function}
    ---@return Dialog
    ---@NOTE The focus optional property does not work for drop down.
    combobox = function(dialog, options)
    end,

    ---Marks the end of both the last tab and the group of tabs to which it
    ---belongs.
    ---@param dialog Dialog
    ---@param options {id: string, selected: string, align: Align|integer, onchange: function}
    ---@return Dialog
    endtabs = function(dialog, options)
    end,

    ---Appends a text entry field to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, enabled: boolean, focus: boolean, visible: boolean, onchange: function}
    ---@return Dialog
    entry = function(dialog, options)
    end,

    ---Appends a button to select one file to open or save. When 'entry' is
    ---present, a text entry field will appear to the left of an ellipsis file
    ---browser button.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, title: string, filename: string|string[], filetypes: string[], open: boolean, save: boolean, entry: boolean, enabled: boolean, focus: boolean, visible: boolean, onchange:function}
    ---@return Dialog
    file = function(dialog, options)
    end,

    ---Appends a static label to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, visible: boolean}
    ---@return Dialog
    label = function(dialog, options)
    end,

    ---Changes properties of the given widget given by string identifier.
    ---@param dialog Dialog
    ---@param options {id: string, color: Color, enabled: boolean, filename: string, max: integer, min: integer, option: string, selected: boolean, text: string, value: integer, visible: boolean}
    ---@return Dialog
    ---@overload fun(options: {id: string, [string]: any}): Dialog
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
    ---@param options {id: string, label: string, text: string, decimals: integer, enabled: boolean, focus: boolean, visible: boolean, onchange: function}
    ---@return Dialog
    number = function(dialog, options)
    end,

    ---Appends a radio button widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, text: string, selected: boolean, enabled: boolean, focus: boolean, visible: boolean, onclick: function}
    ---@return Dialog
    radio = function(dialog, options)
    end,

    ---Calls the onpaint event of all canvas widgets in the dialog.
    ---@param dialog Dialog
    ---@NOTE Does not return a dialog.
    repaint = function(dialog)
    end,

    ---Creates a separator line in the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, text: string}
    ---@return Dialog
    ---@NOTE visible parameter does not apply to separators. https://github.com/aseprite/aseprite/issues/4989
    separator = function(dialog, options)
    end,

    ---Appends a widget with an array of colors to the dialog.
    ---Colors can be picked when the mode is "pick".
    ---They can be sorted and accessed as an array when the mode is "sort".
    ---The default mode is "pick".
    ---@param dialog Dialog
    ---@param options {id: string, label: string, colors: Color[], mode: "pick"|"sort", visible: boolean, onclick: fun(event: {color: Color, button: MouseButton})}
    ---@return Dialog
    shades = function(dialog, options)
    end,

    ---Displays the dialog on the screen.
    ---When `wait` is `true`, blocks other user interactions. Dialog widget
    ---focus can be cycled with `Tab`.
    ---When `hand` is `true`, blocks other user interactions except panning
    ---the canvas with the hand tool.
    ---@param dialog Dialog
    ---@param options {autoscrollbars: boolean, hand: boolean, bounds: Rectangle, wait: boolean}
    ---@return Dialog
    ---@overload fun(dialog: Dialog): Dialog
    show = function(dialog, options)
    end,

    ---Appends a slider widget to the dialog.
    ---@param dialog Dialog
    ---@param options {id: string, label: string, min: integer, max: integer, value: integer, enabled: boolean, focus: boolean, visible: boolean, onchange: function, onrelease: function}
    ---@return Dialog
    slider = function(dialog, options)
    end,

    ---Creates a new tab. If called after a prior tab call, closes the prior
    ---and starts a new one.
    ---@param dialog Dialog
    ---@param options {id: string, text: string, onclick: function}
    ---@return Dialog
    tab = function(dialog, options)
    end,
}

---Creates a new `Dialog` instance.
---@return Dialog
---@overload fun(title: string): Dialog
---@overload fun(options: {title: string, notitlebar: boolean, parent: Dialog, onclose: function}): Dialog
function Dialog()
end

---Represents a sprite editor.
---@class Editor
---@field mousePos Point Gets the mouse's screen position.
---@field scroll {x: number, y: number} Gets or sets the editor scrollbar.
---@field sprite Sprite Gets the active sprite.
---@field spritePos Point Gets the mouse position on the sprite. Does not account for offset due to view tiled mode.
---@field zoom number Gets or sets the editor zoom, where `1.0` is 100%.
Editor = {
    ---Asks the user to select a point on the sprite.
    ---The title appears in the context bar.
    ---Decorations are similar to Canvas Size interface.
    ---@param editor Editor
    ---@param options {title: string, point: Point, decorate: {rulers: boolean, dimmed: boolean}, onclick: fun(event: {point: Point}), onchange: fun(event: {point: Point}), oncancel: fun(event: table)}
    askPoint = function(editor, options)
    end,

    ---Cancels the askPoint action.
    ---@param editor Editor
    cancel = function(editor)
    end
}


---A collection of listeners for specific events.
---@class Events
Events = {
    ---Connects the given function with the given event.
    ---Suitable arguments for the parameter `eventName` depend on whether the
    ---`Events` object is from a `Sprite` or the `app`. See `SpriteEvents` and
    ---`AppEvents` in
    ---https://github.com/aseprite/aseprite/blob/main/src/app/script/events_class.cpp .
    ---Returns the listenerCode.
    ---@param ev Events
    ---@param eventName string|"afteraddtile"|"aftercommand"|"beforecommand"|"beforesitechange"|"bgcolorchange"|"change"|"fgcolorchange"|"filenamechange"|"remaptileset"|"sitechange"
    ---@param func function
    ---@return integer
    on = function(ev, eventName, func)
    end,

    ---Disconnects the given function from all events in the object,
    ---or stops only the connection identified by listenerCode
    ---@param ev Events
    ---@param listenerCode integer
    ---@overload fun(ev: Events, func: function)
    off = function(ev, listenerCode)
    end,
}


---Represents a discrete unit of animation in a sprite.
---@class Frame
---@field duration number Gets or sets the frame duration in seconds.
---@field frameNumber integer Gets the frame number.
---@field next Frame|nil Gets the next frame, if any.
---@field previous Frame|nil Gets the previous frame, if any.
---@field sprite Sprite Gets the sprite to which this frame belongs.
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
---@field theme Theme Gets the theme where metrics are not multiplied by UI scaling.
---@field width integer Gets the width of the visible area in pixels. Changes when the dialog is resized.
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

    ---Appends a cubic Bezier curve to the current sub-path, from the previous
    ---anchor point to the given coordinates with two control points between.
    ---@param gc GraphicsContext Graphics context.
    ---@param cp1x number First control point x.
    ---@param cp1y number First control point y.
    ---@param cp2x number Second control point x.
    ---@param cp2y number Second control point y.
    ---@param x number Anchor point x.
    ---@param y number Anchor point y.
    cubicTo = function(gc, cp1x, cp1y, cp2x, cp2y, x, y)
    end,

    ---Draws the given image on the canvas. Does not support translucent or
    ---transparent pixels.
    ---If given source and destination rectangles, a part of the image is drawn
    ---on the canvas.
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

    ---Draws a theme part given by partId on the canvas at the given
    ---coordinates.
    ---@param gc GraphicsContext
    ---@param partId string
    ---@param point Point
    ---@overload fun(gc: GraphicsContext, partId: string, x: integer, y: integer)
    drawThemeImage = function(gc, partId, point)
    end,

    ---Draws a theme part given by partId on the canvas, filling a given
    ---rectangle. Uses nine-slice scaling for parts that have a defined Slice
    ---center.
    ---@param gc GraphicsContext
    ---@param partId string
    ---@param rectangle Rectangle
    ---@overload fun(gc: GraphicsContext, partId: string, x: integer, y: integer, w: integer, h: integer)
    ---@see Slice.center
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

    ---Draws on the canvas the given text string at a position specified by
    ---the coordinates.
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
    ---Does not include pixels set by drawImage.
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

    ---Saves the current state of the canvas to restore it later.
    ---Includes: color, opacity, blendMode, strokeWidth and clipping
    ---region. Does not include pixels set by drawImage.
    ---@param gc GraphicsContext
    save = function(gc)
    end,

    ---Paints the edges of the current path with the current color
    ---and stroke weight.
    ---@param gc GraphicsContext
    stroke = function(gc)
    end,

    ---Paints the edges of the given rectangle with the current color
    ---and stroke weight.
    ---@param gc GraphicsContext
    ---@param rectangle Rectangle
    strokeRect = function(gc, rectangle)
    end
}


---Represents the grid that governs how tiles are placed in a tile map.
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
---@field bytesPerPixel integer Gets the number of bytes per pixel.
---@field cel Cel Gets the cel to which this image belongs or `nil`.
---@field colorMode ColorMode Gets the image color mode.
---@field context GraphicsContext|nil Gets a graphics context for the image if Skia is supported. As of version 1.3.11-beta-1.
---@field height integer Gets the image height.
---@field id integer Gets the image identifier.
---@field rowStride integer Gets the number of bytes for each row in the image.
---@field spec ImageSpec Gets the specification for this image.
---@field version integer Gets the version assigned to the image inside the program, updated with each image change.
---@field width integer Gets the image width.
Image = {
    ---Clears all pixels in the image with the given color
    ---or `image.spec.transparentColor` if no color is specified.
    ---For 8bpp indexed color mode images, the reference color overflows if it
    ---is out of bounds, e.g., `295` would clear to index `295 & 255` or `39`.
    ---@param image Image
    ---@param refColor? Color|integer
    ---@overload fun(image: Image, bounds: Rectangle, refColor?: Color|integer)
    ---@NOTE Does not create undo. https://github.com/aseprite/aseprite/issues/5015
    clear = function(image, refColor)
    end,

    ---Creates a copy of the image.
    ---@param image Image
    ---@return Image
    clone = function(image)
    end,

    ---Blits the `sourceImage` onto the `destinationImage`.
    ---The `position` offsets where the destination is drawn on the source.
    ---Offsets may be positive or negative. The source may be larger than the
    ---destination. Excess pixels will be be clipped.
    ---@param destinationImage Image
    ---@param sourceImage Image
    ---@param position? Point
    ---@param opacity? integer
    ---@param blendMode? BlendMode|integer
    drawImage = function(destinationImage, sourceImage, position, opacity, blendMode)
    end,

    ---Sets the pixel at a coordinate to a given color if the coordinate is in
    ---bounds, i.e., greater than or equal to zero and less than the image
    ---width and height.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@param color Color|integer
    drawPixel = function(image, x, y, color)
    end,

    ---Blits the `sourceSprite` at the `frame` onto the `destinationImage`.
    ---
    ---The `position` offsets where the destination is drawn on the source.
    ---Offsets may be positive or negative. The source may be larger than the
    ---destination. Excess pixels will be be clipped.
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

    ---Returns an integer pixel value for the given coordinates local to the
    ---image. When the coordinates are out-of-bounds, returns `0xffffffff`,
    ---which is white for RGB images.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@return integer
    getPixel = function(image, x, y)
    end,

    ---Returns true if all pixels in the image are equal to the transparent
    ---color.
    ---@param image Image
    ---@return boolean
    isEmpty = function(image)
    end,

    ---Evaluates whether the provided image has the same dimensions as the
    ---instance image, is the same color mode, and contains the same pixel
    ---colors. Does not check for difference in color space or transparent
    ---color.
    ---@param image Image
    ---@param otherImage Image
    ---@return boolean
    isEqual = function(image, otherImage)
    end,

    ---Returns true if all pixels in the image are equal to the given color.
    ---@param image Image
    ---@param refColor Color|integer
    ---@return boolean
    isPlain = function(image, refColor)
    end,

    ---Returns a pixel iterator for the whole image or the given rectangle.
    ---@param image Image
    ---@param rectangle? Rectangle
    ---@return fun(int: integer)|fun(): integer|{x: integer, y: integer} accessor Can be called to get pixel and set pixel (e.g. `accessor()` and `accessor(pixelValue)`), and holds x, y coordinates.
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

    ---Saves the image as a sprite in the given `filename`. Returns true if the
    ---operation is successful.
    ---@param image Image
    ---@param filename string
    ---@return boolean
    ---@overload fun(image: Image, options: {filename: string, palette: Palette}): boolean
    saveAs = function(image, filename)
    end,

    ---Returns a rectangle of the image where empty space, as defined by a
    ---`refColor` has been removed. For empty images and tile map images,
    ---returns an empty rectangle, i.e., with zero size.
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
    ---@see Image.drawImage
    putImage = function(destinationImage, sourceImage, position)
    end,

    ---Sets the pixel in the coordinate to the given integer pixel value.
    ---@param image Image
    ---@param x integer
    ---@param y integer
    ---@param color integer
    ---@deprecated
    ---@see Image.drawPixel
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
    ---@see Image.drawSprite
    putSprite = function(destinationImage, sourceSprite, frameNumber, position)
    end
}

---Creates a new `Image` instance.
---Images loaded fromFile may be `nil`.
---Images created a rectangle parameter may return `nil` if the rectangle is
---empty, i.e., has zero or negative width or height.
---The ImageSpec constructor is preferable, so that transparent color and color
---space fields can be transferred from a source to a target.
---@param spec ImageSpec
---@return Image
---@overload fun(width: integer, height: integer, colorMode?: ColorMode): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image): Image
---@overload fun(otherImage: Image, rectangle: Rectangle): Image
---@overload fun(option: {fromFile: string}): Image
---@NOTE A constructor overload cannot have variants on return type, e.g, Image|nil, without impacting other overloads in autocomplete.
function Image(spec)
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

---Represents a key event used by listener methods of a canvas widget.
---@class KeyEvent
---@field altKey boolean Whether the `Alt` key was pressed.
---@field code string A string identifier for the key. See https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values .
---@field ctrlKey boolean Whether the `Ctrl` key was pressed.
---@field key string A string containing the unicode character.
---@field metaKey boolean Whether the `Windows` or `Command` key was pressed.
---@field repeatCount integer Number of times the key was autorepeated.
---@field shiftKey boolean Whether the `Shift` key was pressed.
---@field spaceKey boolean Whether the `Space` key was pressed.
KeyEvent = {
    ---Stops propagating this event to other parent widget or main
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
---@field blendMode BlendMode|nil Gets or sets the layer blend mode. Behavior for group layers depends on experimental composition as of 1.3.11-beta-1.
---@field cels Cel[] Gets the cels table in the layer.
---@field color Color Gets or sets the layer's color in the timeline.
---@field data string Gets or sets custom data assigned to the layer.
---@field id integer Gets the layer's id.
---@field isBackground boolean Whether the layer is a background.
---@field isCollapsed boolean Gets or sets a layer's collapsed state in the timeline.
---@field isContinuous boolean Gets or sets a layer's continuous state in the timeline.
---@field isEditable boolean Gets or sets a layer's editability in the timeline.
---@field isExpanded boolean Gets or sets a layer's expanded state in the timeline.
---@field isGroup boolean Whether the layer is a group and can be a parent to other layers.
---@field isImage boolean Whether the layer may contain cels with images, i.e., is not a group.
---@field isReference boolean Whether the layer is a reference layer.
---@field isTilemap boolean Whether the layer is a tile map.
---@field isTransparent boolean Gets a layer's support for transparency.
---@field isVisible boolean Gets or sets the layer's visibility state in the timeline.
---@field layers Layer[]|nil If a layer is a group, gets the table of child layers.
---@field name string Gets or sets the layer's name. Should not be treated as a unique identifier.
---@field next Layer|nil Gets the next layer, if any.
---@field opacity integer|nil Gets or sets the layer opacity. Behavior for group layers depends on experimental composition as of 1.3.11-beta-1.
---@field parent Sprite|Layer Gets or sets the layer's parent. May be a `Sprite` for top-level layers.
---@field previous Layer|nil Gets the previous layer, if any.
---@field properties table<string, any> Gets or sets the layer's user-defined properties.
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


---Represents a mouse event used by listener methods of a canvas widget.
---@class MouseEvent
---@field altKey boolean Whether the `Alt` key was pressed.
---@field button MouseButton The button pressed or released by the user.
---@field ctrlKey boolean Whether the `Ctrl` key was pressed.
---@field deltaX number|nil Change in mouse wheel x.
---@field deltaY number|nil Change in mouse wheel y.
---@field metaKey boolean Whether the `Windows` or `Command` key was pressed.
---@field pressure number Pen pressure when the event comes from a stylus.
---@field shiftKey boolean Whether the `Shift` key was pressed.
---@field spaceKey boolean Whether the `Space` key was pressed.
---@field x integer The horizontal mouse position relative to the canvas widget.
---@field y integer The vertical mouse position relative to the canvas widget.
MouseEvent = {}


---Represents an array of `Color` objects. Indexing begins at 0.
---@class Palette
---@field frame Frame|nil Gets the first frame, if any.
---@operator len(): integer
---@NOTE also includes frameNumber property, but uncertain what happens if frame is nil
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
---palette (e.g. `DB16`, `DB32`, `Solarized`). Palettes loaded `fromFile` may
---be `nil`. The resource string given to `fromResource` should be validated
---before the constructor is called.
---@return Palette
---@overload fun(numberOfColors: integer): Palette
---@overload fun(options: {fromFile: string}): Palette
---@overload fun(options: {fromResource: string}): Palette
function Palette()
end

---Structures an Aseprite plug-in, or extension.
---@class Plugin
---@field displayName string Gets the extension display name.
---@field name string Gets the extension name.
---@field path string Gets the path where the extension is installed.
---@field preferences table Gets or sets user preferences.
---@field version Version Gets the extension version.
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
---images, slices, tiles and/or colors.
---
---Tiles and colors are referenced indirectly through `integer`s.
---
---Some tables may report as empty when the timeline is hidden.
---
---The `layers` field is not necessarily ordered according to stack index,
---whether relative to the sprite or to parent layer.
---@class Range
---@field cels Cel[] Gets a table of cels.
---@field colors integer[] Gets or sets a table of color palette indices.
---@field editableImages Image[] Gets a table of unique, editable images.
---@field frames Frame[] Gets or sets a table of frames.
---@field images Image[] Gets a table of unique images.
---@field isEmpty boolean Gets whether or not the range is empty.
---@field layers Layer[] Gets or sets a table of layers.
---@field slices Slice[] Gets or sets a table of active slices.
---@field sprite Sprite Gets the sprite to which the range belongs.
---@field tiles integer[] Gets or sets a table of tile set indices.
---@field type RangeType Gets the type of range.
---@NOTE Tiles field works as a setter, but not yet as a getter.
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


---Creates a new `Rectangle` instance. Dimensions may be negative or zero;
---they are not validated by the constructor.
---@class Rectangle
---@field h integer Gets or sets the vertical dimension.
---@field height integer Gets or sets the vertical dimension.
---@field isEmpty boolean Returns true if either width or height is less than or equal to zero.
---@field origin Point Gets or sets the top-left corner.
---@field size Size Gets or sets the width and height.
---@field w integer Gets or sets the horizontal dimension.
---@field width integer Gets or sets the horizontal dimension.
---@field x integer Gets or sets the top-left corner x.
---@field y integer Gets or sets the top-left corner y.
---@operator band(Rectangle): Rectangle
---@operator bor(Rectangle): Rectangle
Rectangle = {
    ---Returns true if a `Point` or `Rectangle` is inside the left operand.
    ---For rectangle and rectangle, Returns false if either rectangle is empty. See
    ---https://github.com/aseprite/laf/blob/main/gfx/rect.h#L256 .
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return boolean
    ---@see Rectangle.isEmpty
    ---@overload fun(rectangle: Rectangle, point: Point): boolean
    contains = function(rectangle, otherRectangle)
    end,

    ---Returns a new rectangle which is the intersection of `rectangle` and
    ---`otherRectangle`. If the rectangles do not intersect, then the result
    ---will be empty. See
    ---https://github.com/aseprite/laf/blob/main/gfx/rect.h#L289 .
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    ---@see Rectangle.intersects
    intersect = function(rectangle, otherRectangle)
    end,

    ---Returns true if `rectangle` intersects `otherRectangle`. Returns false
    ---if either rectangle is empty. See
    ---https://github.com/aseprite/laf/blob/main/gfx/rect.h#L267 .
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return boolean
    ---@see Rectangle.isEmpty
    intersects = function(rectangle, otherRectangle)
    end,

    ---Returns a new rectangle that contains both given rectangles `rectangle`
    ---and `otherRectangle`. If the left operand is empty, then returns the
    ---right. If the right operand is empty, then returns the left. See
    ---https://github.com/aseprite/laf/blob/main/gfx/rect.h#L277 .
    ---@param rectangle Rectangle
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    ---@see Rectangle.isEmpty
    union = function(rectangle, otherRectangle)
    end
}

---Creates a new `Rectangle` instance. Dimensions may be negative or zero;
---they are not validated by the constructor.
---Width and height default to zero.
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

---Creates a new `Selection` instance. When rectangle dimensions are zero or
---negative, selection is empty with zero bounds.
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
---@field tilemapMode TilemapMode|nil Gets the active TilemapMode, if any.
---@field tilesetMode TilesetMode|nil Gets the active TilesetMode, if any.
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
Size = {
    ---Returns a new size that contains both given sizes `size`
    ---and `otherSize`. Best used with positive, non-zero left and right
    ---operands.
    ---@param size Size
    ---@param otherSize Size
    ---@return Size
    union = function(size, otherSize)
    end
}

---Creates a new `Size` instance with the given dimensions. Dimensions may be
---negative or zero; they are not validated by the constructor.
---Width and height default to zero.
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: {width: integer, height: integer}): Size
---@overload fun(numbers: {[1]: integer, [2]: integer}): Size
function Size()
end

---An object that allows for nine-slice scaling. The slice's frame data cannot
---be accessed via the API.
---@class Slice
---@field bounds Rectangle|nil The slice's bounding rectangle, if any.
---@field center Rectangle|nil The central rectangle of a slice's nine-slice, if any. Coordinates are in local space.
---@field color Color Gets or sets the slice's color.
---@field data string Gets or sets custom data assigned to the slice.
---@field name string Gets or sets the slice's name.
---@field pivot Point|nil The slice's pivot, if any. Coordinates are in local space.
---@field properties table<string, any> Gets or sets the slice's user-defined properties.
---@field sprite Sprite Gets the sprite to which the slice belongs.
Slice = {}


---Represents a file in working memory. Holds cels, frames, layers, slices,
---tags and tilesets.
---@class Sprite
---@field backgroundLayer Layer|nil Gets a background layer, if any, for which the sprite is a direct parent.
---@field bounds Rectangle Gets the sprite bounds.
---@field cels Cel[] Gets the cels contained by the sprite.
---@field color Color Gets or sets the sprite's tab color in the UI.
---@field colorMode ColorMode Gets the sprite's color mode.
---@field colorSpace ColorSpace Gets or sets the sprite color space.
---@field data string Gets or sets custom data assigned to the sprite.
---@field events Events Events to associate functions that can act as listeners.
---@field filename string Gets or sets the sprite file name.
---@field frames Frame[] Gets the frames contained by the sprite.
---@field gridBounds Rectangle Gets or sets grid offset and size.
---@field height integer Gets or sets the height.
---@field id integer Gets the sprite's id.
---@field isModified boolean Returns true if the sprite is modified compared to the latest saved state.
---@field layers Layer[] Gets the layers contained by the sprite.
---@field palettes Palette[] Gets the palettes contained by the sprite.
---@field pixelRatio Size Gets or sets the sprite pixel ratio.
---@field properties table<string, any> Gets or sets the sprite's user-defined properties.
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
    ---Defaults to the last frame in the sprite.
    ---The new frame's duration defaults to that of the active frame.
    ---@param sprite Sprite
    ---@param frameNumber? integer
    ---@return Frame
    newEmptyFrame = function(sprite, frameNumber)
    end,

    ---Creates a copy of the given `Frame` object or frame number and returns
    ---the copy.
    ---Defaults to the last frame in the sprite.
    ---@param sprite Sprite
    ---@param frame? Frame|integer
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
    ---If the given bounds `Rectangle` is zero or negative, then the created
    ---Slice `bounds` will be `nil`.
    ---@param sprite Sprite
    ---@param bounds? Rectangle
    ---@return Slice
    newSlice = function(sprite, bounds)
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
    ---`origin` and `tileSize`. `Rectangle`s should be verified to have
    ---positive size before being given to the method.
    ---`numTiles` specifies the number of initial tiles.
    ---@param sprite Sprite
    ---@return Tileset
    ---@overload fun(sprite: Sprite, rectangle: Rectangle, numTiles?: integer): Tileset
    ---@overload fun(sprite: Sprite, grid: Grid, numTiles?: integer): Tileset
    ---@overload fun(sprite: Sprite, anotherTileset: Tileset): Tileset
    newTileset = function(sprite)
    end,

    ---Resizes the sprite and all cels that it contains.
    ---@param sprite Sprite
    ---@param width integer
    ---@param height integer
    ---@overload fun(sprite: Sprite, size: Size)
    resize = function(sprite, width, height)
    end,

    ---Saves the sprite to the given file and mark the sprite as saved. Returns
    ---true if the operation is successful.
    ---@param sprite Sprite
    ---@param filename string
    ---@return boolean
    saveAs = function(sprite, filename)
    end,

    ---Saves a copy of the sprite in the given file but doesn't change the
    ---saved state of the sprite. Returns true if the operation is successful.
    ---@param sprite Sprite
    ---@param filename string
    ---@return boolean
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
---The ImageSpec constructor is preferable, so that transparent color and color
---space fields can be transferred from a source to a target.
---Not all fields are duplicated when `otherSprite` is used, for example,
---custom user data and tag colors.
---@param spec ImageSpec
---@return Sprite
---@overload fun(width: integer, height: integer, colorMode?: ColorMode): Sprite
---@overload fun(otherSprite: Sprite): Sprite
---@overload fun(options: {fromFile: string}): Sprite
---@overload fun(options: {fromFile: string, oneFrame: boolean}): Sprite
function Sprite(spec)
end

---A tag in the timeline to label and organize frames.
---@class Tag
---@field aniDir AniDir Gets or sets the tag animation direction.
---@field color Color Gets or sets the tag's color in the timeline.
---@field data string Gets or sets custom data assigned to the tag.
---@field frames integer Gets the number of frames contained by the tag.
---@field fromFrame Frame|nil Gets or sets the `Frame` where the tag starts.
---@field name string Gets or sets the tag name.
---@field properties table<string, any> Gets or sets the tag's user-defined properties.
---@field repeats integer Gets or sets the number of repeats. Zero is infinity.
---@field sprite Sprite Gets the sprite to which the tag belongs.
---@field toFrame Frame|nil Gets or sets the `Frame` where the tag ends.
Tag = {}


---Stores color and dimensions of elements in a UI theme. See
---https://github.com/aseprite/api/blob/main/api/app_theme.md and
---https://github.com/aseprite/aseprite/blob/main/data/extensions/aseprite-theme/theme.xml .
---@class Theme
---@field color table<string, Color> Gets the colors used by a theme.
---@field dimension table<string, integer> Gets the dimensions of theme elements.
Theme = {
    ---Returns data about the given style ID string. The data is a table
    ---containing integers for the left, right, top and bottom border in pixels.
    ---Whether UI scaling is applied depends on whether the theme was retrieved
    ---from `app` or a `GraphicsContext`.
    ---@param theme Theme
    ---@param id string
    ---@return {bottom: integer, left: integer, right: integer, top: integer}
    styleMetrics = function(theme, id)
    end
}


---A tile from a `Tileset`.
---@class Tile
---@field color Color Gets or sets the user-defined color.
---@field data string Gets or sets custom data assigned to the tile.
---@field image Image Gets or sets the tile image.
---@field index integer Gets the tile's index in its tileset.
---@field properties table<string, any> Gets or sets the tile's user-defined properties.
Tile = {}


---An unordered set of unique `Tile`s.
---@class Tileset
---@field baseIndex integer Gets or sets the base index.
---@field color Color Gets or sets the user-defined color of this tileset.
---@field data string Gets or sets custom data assigned to the tileset.
---@field grid Grid Gets the grid offset and size.
---@field name string Gets or sets the tileset name.
---@field properties table<string, any> Gets or sets the tileset's user-defined properties.
---@operator len(): integer
Tileset = {
    ---Returns the tile in the given index.
    ---The index goes from `0` to `#tileset - 1`.
    ---Returns `nil` if the index is out of bounds.
    ---@param tileset Tileset
    ---@param index integer
    ---@return Tile|nil
    tile = function(tileset, index)
    end,

    ---Returns the image of the tile in the given index.
    ---@param tileset Tileset
    ---@param index integer
    ---@return Image
    ---@deprecated
    ---@see Tileset.tile
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
---set the `app.tool` or to paint on the canvas, i.e., the `tool`
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


---Represents a Universally unique identifier composed of 16 bytes. Each byte
---may be retrieved by index. Can be converted to a string with `tostring`.
---Follows the format "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
---@class Uuid
Uuid = {}

---Creates a new Uuid. When called without arguments, a random Uuid is created.
---Otherwise, can be created from a string or another Uuid.
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