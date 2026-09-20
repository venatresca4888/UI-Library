local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/sametexe001/sametlibs/refs/heads/main/Stellar/Library.lua"))()

local Window = Library:Window({Name = "Window", SubName = "SubWindow", Logo = "rbxassetid://81441172534384"})
local Watermark = Library:Watermark("This is a watermark", "rbxassetid://81441172534384")

local Page = Window:Page({Name = "Page", Icon = "rbxassetid://72196061405823"})

for Index = 1, 3 do 
    Window:Page({Name = "Page", Icon = "rbxassetid://72196061405823"})
end

Library:CreateSettingsPage(Window, Watermark)

local AimbotSection = Page:Section({Name = "Aimbot", Side = 1})

AimbotSection:Toggle({
    Name = "Toglge",
    Flag = "Toggle",
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Button({
    Name = "Button",
    Callback = function()
        print("Button")
    end
})

AimbotSection:Slider({
    Name = "Slider",
    Flag = "Slider",
    Default = 50,
    Min = 0,
    Max = 100,
    Suffix = "%",
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Dropdown({
    Name = "Dropdown",
    Flag = "Dropdown",
    Items = {"Optionn 1", "Optionn 2", "Optionn 3", "Optionn 4"},
    Default = "Optionn 2",
    Multi = false,
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Label("Text"):Colorpicker({
    Flag = "Colorpicker",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Textbox({
    Name = "Textbox",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Flag = "Textbox",
    Callback = function(Value)
        print(Value)
    end
})

AimbotSection:Label("Text"):Keybind({
    Name = "Keybind",
    Flag = "Keybind",
    Mode = "Toggle",
    Default = Enum.KeyCode.C,
    Callback = function(Value)
        print(Value)
    end
})