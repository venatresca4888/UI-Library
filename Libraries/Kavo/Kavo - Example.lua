--// Kavo UI Library - Example UI

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
))()

--// Create Window
local Window = Library.CreateLib("Example UI", "Midnight")

--==================================================
-- Main Tab
--==================================================

local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Controls")

MainSection:NewLabel("Kavo UI Library Example")
MainSection:NewLabel("Demo interface - no game-specific functions")

--// Button
MainSection:NewButton("Test Button", "Print a message", function()
    print("[Kavo] Test Button clicked")
end)

--// Toggle
local enabled = false

MainSection:NewToggle(
    "Enable Feature",
    "Enable / disable demo feature",
    function(state)
        enabled = state
        print("[Kavo] Feature:", state)
    end
)

--// Slider
local sliderValue = 50

MainSection:NewSlider(
    "Value",
    "Change demo value",
    100,
    0,
    function(value)
        sliderValue = value
        print("[Kavo] Value:", value)
    end
)

--// TextBox
MainSection:NewTextBox(
    "Username",
    "Enter a name",
    function(text)
        print("[Kavo] Username:", text)
    end
)

--// Dropdown
local dropdown = MainSection:NewDropdown(
    "Mode",
    "Select a mode",
    {
        "Normal",
        "Performance",
        "Experimental"
    },
    function(option)
        print("[Kavo] Mode:", option)
    end
)

--// Color Picker
local accentColor = Color3.fromRGB(26, 189, 158)

MainSection:NewColorPicker(
    "Accent Color",
    "Choose a color",
    accentColor,
    function(color)
        accentColor = color
        print("[Kavo] Color:", color)
    end
)

--==================================================
-- Settings Tab
--==================================================

local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Interface")

SettingsSection:NewLabel("Interface Settings")

--// Toggle UI with INSERT
SettingsSection:NewKeybind(
    "Toggle UI",
    "Press Insert to hide/show UI",
    Enum.KeyCode.Insert,
    function()
        Library:ToggleUI()
    end
)

--// Refresh dropdown example
local oldList = {
    "Normal",
    "Performance"
}

local newList = {
    "Normal",
    "Performance",
    "Experimental",
    "Debug"
}

local refreshDropdown = SettingsSection:NewDropdown(
    "Preset",
    "Select a preset",
    oldList,
    function(option)
        print("[Kavo] Preset:", option)
    end
)

SettingsSection:NewButton(
    "Refresh Presets",
    "Add more preset options",
    function()
        refreshDropdown:Refresh(newList)
    end
)

--==================================================
-- About Tab
--==================================================

local AboutTab = Window:NewTab("About")
local AboutSection = AboutTab:NewSection("Information")

AboutSection:NewLabel("Example UI")
AboutSection:NewLabel("Built with Kavo UI Library")
AboutSection:NewLabel("Theme: Midnight")

AboutSection:NewButton(
    "Print Status",
    "Print current demo values",
    function()
        print("========== KAVO STATUS ==========")
        print("Enabled:", enabled)
        print("Slider:", sliderValue)
        print("Accent Color:", accentColor)
        print("=================================")
    end
)

print("[Kavo] Example UI loaded successfully")