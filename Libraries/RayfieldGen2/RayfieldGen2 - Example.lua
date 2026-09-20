--// Rayfield Gen2 Example UI
--// Stable release

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

--==================================================
-- Window
--==================================================

local Window = Rayfield:CreateWindow({
    name = "Example Hub",
    subtitle = "Rayfield Gen2 Demo",

    -- Left sidebar
    sidebarLayout = true,

    -- Save UI values
    configuration = {
        autoSave = true,
        autoLoad = true,
        fileName = "ExampleHubConfig",
    },

    -- Built-in theme:
    -- default / cobalt / ember / amethyst / frost / rose
    theme = "cobalt",
})

--==================================================
-- Sidebar Sections
--==================================================

Window:CreateSection({
    name = "Main",
})

--==================================================
-- Home Tab
--==================================================

local Home = Window:CreateTab({
    name = "Home",
    icon = 93364949241311,
})

Home:CreateSection({
    name = "Gameplay",
})

-- Toggle
local AutoSprint = Home:CreateToggle({
    name = "Auto Sprint",
    description = "Enable automatic sprinting.",
    value = false,

    callback = function(state)
        print("Auto Sprint:", state)
    end,
})

-- Toggle
local ReducedMotion = Home:CreateToggle({
    name = "Reduced Motion",
    description = "Reduce visual effects.",

    callback = function(state)
        print("Reduced Motion:", state)
    end,
})

-- Slider
local FOV = Home:CreateSlider({
    name = "Field of View",
    description = "Change your camera FOV.",
    range = { 70, 120 },
    increment = 1,
    value = 90,
    suffix = "°",

    callback = function(value)
        local camera = workspace.CurrentCamera

        if camera then
            camera.FieldOfView = value
        end
    end,
})

Home:CreateSection({
    name = "Interface",
})

-- Dropdown
local Quality = Home:CreateDropdown({
    name = "Graphics Quality",
    description = "Select graphics quality.",
    options = {
        "Low",
        "Medium",
        "High",
        "Ultra",
    },
    value = "High",

    callback = function(value)
        print("Graphics Quality:", value)
    end,
})

-- Multi-select dropdown
local Modules = Home:CreateDropdown({
    name = "Modules",
    description = "Select multiple modules.",
    multiSelect = true,

    options = {
        "Movement",
        "Visuals",
        "Utilities",
        "Interface",
    },

    value = {
        "Visuals",
    },

    placeholder = "No modules selected",
})

--==================================================
-- Actions
--==================================================

Home:CreateSection({
    name = "Actions",
})

Home:CreateButton({
    name = "Show Notification",
    description = "Display a Rayfield notification.",

    callback = function()
        Window:Notify({
            title = "Example Hub",
            content = "Hello from Rayfield Gen2!",
        })
    end,
})

Home:CreateButton({
    name = "Show Toast",

    callback = function()
        Window:Toast({
            title = "Saved",
        })
    end,
})

Home:CreateButton({
    name = "Print Current Values",

    callback = function()
        print("========== CURRENT VALUES ==========")
        print("Auto Sprint:", AutoSprint.value)
        print("Reduced Motion:", ReducedMotion.value)
        print("FOV:", FOV.value)
        print("Quality:", Quality.value)

        print("====================================")
    end,
})

--==================================================
-- Settings Tab
--==================================================

Window:CreateSection({
    name = "Configuration",
})

local Settings = Window:CreateTab({
    name = "Settings",
    icon = 100604009889706,
})

Settings:CreateSection({
    name = "Player",
})

-- Text Input
local PlayerName = Settings:CreateInput({
    name = "Player Name",
    description = "Enter a player name.",
    placeholder = "Username",
})

-- Numeric Input
local MaxPlayers = Settings:CreateInput({
    name = "Max Players",
    description = "Numbers only.",
    numeric = true,
    value = "16",
})

-- Keybind
local SprintKey = Settings:CreateKeybind({
    name = "Sprint Key",
    value = Enum.KeyCode.LeftShift,

    callback = function(key)
        print("Sprint key:", key)
    end,
})

-- Hold keybind
Settings:CreateKeybind({
    name = "Zoom",
    description = "Hold the key to activate.",

    value = Enum.KeyCode.C,

    hold = true,

    callback = function(holding)
        print("Zoom:", holding)
    end,
})

-- Color Picker
Settings:CreateColorPicker({
    name = "Highlight Color",
    color = Color3.fromRGB(96, 205, 255),

    callback = function(color)
        print("Selected color:", color)
    end,
})

--==================================================
-- Statistics Tab
--==================================================

local Stats = Window:CreateTab({
    name = "Stats",
    icon = 85925158736685,
})

Stats:CreateSection({
    name = "Session",
})

local Coins = Stats:CreateStat({
    name = "Coins",
    prefix = "$",
    value = 12500,
})

local Kills = Stats:CreateStat({
    name = "Kills",
    value = 42,
})

local Players = Stats:CreateStat({
    name = "Players",
    value = 8,
})

Stats:CreateButton({
    name = "Simulate Round",

    callback = function()
        Coins:Set(Coins.value + math.random(500, 2500))
        Kills:Set(Kills.value + math.random(1, 10))
        Players:Set(math.random(1, 20))
    end,
})

--==================================================
-- Layout / Groups
--==================================================

Window:CreateSection({
    name = "Advanced",
})

local Layout = Window:CreateTab({
    name = "Layout",
    icon = 84750991656135,
})

Layout:CreateSection({
    name = "Two Column Example",
})

local Grid = Layout:CreateGroup()

local LeftColumn = Grid:CreateGroup({
    direction = "column",
})

LeftColumn:CreateToggle({
    name = "Feature A",
})

LeftColumn:CreateToggle({
    name = "Feature B",
})

local RightColumn = Grid:CreateGroup({
    direction = "column",
})

RightColumn:CreateToggle({
    name = "Feature C",
})

RightColumn:CreateToggle({
    name = "Feature D",
})

--==================================================
-- Runtime Controls
--==================================================

Layout:CreateSection({
    name = "Runtime",
})

Layout:CreateButton({
    name = "Change Theme",

    callback = function()
        Window:ChangeTheme("ember")
    end,
})

Layout:CreateButton({
    name = "Reset Theme",

    callback = function()
        Window:ChangeTheme("cobalt")
    end,
})

Layout:CreateButton({
    name = "Enable Auto Sprint",

    callback = function()
        AutoSprint:Set(true)
    end,
})

Layout:CreateButton({
    name = "Set FOV to 100",

    callback = function()
        FOV:Set(100)
    end,
})

--==================================================
-- About
--==================================================

Window:CreateSection({
    name = "Information",
})

local About = Window:CreateTab({
    name = "About",
    icon = 93364949241311,
})

About:CreateSection({
    name = "Rayfield Gen2",
})

About:CreateText({
    name = "Example UI",
    text = "This is a demonstration of Rayfield Gen2 components.",
})

About:CreateText({
    name = "Features",
    text = "Toggles, sliders, dropdowns, inputs, keybinds, colors, stats and groups.",
})

About:CreateDivider()

About:CreateText({
    name = "Status",
    text = "UI loaded successfully.",
})

print("[Rayfield Gen2] Example UI loaded!")