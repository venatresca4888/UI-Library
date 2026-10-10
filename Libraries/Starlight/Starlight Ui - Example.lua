getgenv().SecureMode = true
getgenv().InterfaceName = "XcxHub"

local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId
local gameName = "Unknown Game" -- ค่าตั้งต้น ถ้าดึงชื่อไม่ได้

-- พยายามดึงชื่อเกม
pcall(function()
    gameName = MarketplaceService:GetProductInfo(placeId).Name
end)

local Window = Starlight:CreateWindow({
    Name = "Xcx Hub",
    Subtitle = gameName .. " || Create By Xcx",
    Icon = NebulaIcons:GetIcon("star", "Material"),
    LoadingSettings = {
        Title = "Xcx Hub",
        Subtitle = "Welcome, " .. game.Players.LocalPlayer.DisplayName,
        Logo = NebulaIcons:GetIcon("star", "Material"),
        BuildWarnings = true
    },
    FileSettings = {
        ConfigFolder = "Xcx Hub"
    },
    NotifyOnCallbackError = true
})

local MainSection = Window:CreateTabSection("Main Features", true)
local SettingsSection = Window:CreateTabSection("Settings")

local MainTab = MainSection:CreateTab({
    Name = "Elements",
    Icon = NebulaIcons:GetIcon('widgets', 'Material'),
    Columns = 2,
}, "MAIN_ELEMENTS")

local NestedTab = MainSection:CreateTab({
    Name = "Nested Elements",
    Icon = NebulaIcons:GetIcon('layers', 'Material'),
    Columns = 2,
}, "NESTED_ELEMENTS")

local MiscTab = MainSection:CreateTab({
    Name = "Miscellaneous",
    Icon = NebulaIcons:GetIcon('category', 'Material'),
    Columns = 2,
}, "MISC_ELEMENTS")

local SettingsTab = SettingsSection:CreateTab({
    Name = "GUI Settings",
    Icon = NebulaIcons:GetIcon('settings', 'Material'),
    Columns = 2,
}, "GUI_SETTINGS")

local ElementsGroupbox1 = MainTab:CreateGroupbox({
    Name = "Basic Elements",
    Column = 1,
    Icon = NebulaIcons:GetIcon("toggle_on", "Material")
}, "BASIC_ELEMENTS_1")

local ElementsGroupbox2 = MainTab:CreateGroupbox({
    Name = "Input Elements",
    Column = 2,
    Icon = NebulaIcons:GetIcon("edit", "Material")
}, "INPUT_ELEMENTS_1")

ElementsGroupbox1:CreateButton({
    Name = "Standard Button",
    Icon = NebulaIcons:GetIcon('check', 'Material'),
    Tooltip = "This is a standard button.",
    Callback = function()
        Starlight:Notification({
            Title = "Button Pressed",
            Content = "You pressed the standard button.",
            Icon = NebulaIcons:GetIcon('check', 'Material')
        }, "BTN_NOTIF")
    end,
}, "BTN_1")

ElementsGroupbox1:CreateButton({
    Name = "Style 2 Button",
    Icon = NebulaIcons:GetIcon('fingerprint', 'Material'),
    Callback = function() end,
    Style = 2,
    IndicatorStyle = 2,
    CenterContent = true
}, "BTN_2")

ElementsGroupbox1:CreateToggle({
    Name = "Checkbox Toggle",
    CurrentValue = true,
    Style = 1,
    CheckboxIcon = NebulaIcons:GetIcon("check", "Material"),
    Callback = function(Value)
        print("Checkbox is now:", Value)
    end,
}, "TOGGLE_1")

ElementsGroupbox1:CreateToggle({
    Name = "Switch Toggle",
    CurrentValue = false,
    Style = 2,
    Icon = NebulaIcons:GetIcon("toggle_off", "Material"),
    Callback = function(Value)
        print("Switch is now:", Value)
    end,
}, "TOGGLE_2")

ElementsGroupbox1:CreateToggle({
    Name = "Ignore Config Toggle",
    CurrentValue = false,
    Style = 2,
    IgnoreConfig = true,
    Callback = function(Value)
        print("Ignored Toggle is now:", Value)
    end,
}, "TOGGLE_3")

ElementsGroupbox2:CreateSlider({
    Name = "Slider",
    Icon = NebulaIcons:GetIcon('chart-no-axes-column-increasing', 'Lucide'),
    Range = {0, 100},
    Increment = 5,
    CurrentValue = 50,
    Suffix = "%",
    Callback = function(Value)
        print("Slider value:", Value)
    end,
}, "SLIDER_1")

ElementsGroupbox2:CreateInput({
    Name = "Text Input",
    Icon = NebulaIcons:GetIcon('text-cursor-input', 'Lucide'),
    CurrentValue = "",
    PlaceholderText = "Type something...",
    Callback = function(Text)
        print("Input text:", Text)
    end,
}, "INPUT_1")

ElementsGroupbox2:CreateInput({
    Name = "Numeric Input",
    CurrentValue = "123",
    PlaceholderText = "Enter numbers...",
    Numeric = true,
    Enter = true,
    MaxCharacters = 5,
    Callback = function(Text)
        print("Numeric input (on enter):", Text)
    end,
}, "INPUT_2")

local NestedGroupbox1 = NestedTab:CreateGroupbox({
    Name = "Binds",
    Column = 1
}, "NESTED_GROUP_1")

local NestedGroupbox2 = NestedTab:CreateGroupbox({
    Name = "Pickers & Dropdowns",
    Column = 2
}, "NESTED_GROUP_2")

local BindLabel = NestedGroupbox1:CreateLabel({
    Name = "Label with Bind"
}, "BIND_LABEL")

BindLabel:AddBind({
    CurrentValue = "Q",
    HoldToInteract = false,
    Callback = function(Value)
        print("Label Bind toggled:", Value)
    end,
    OnChangedCallback = function(Value)
        print("Label Bind key changed to:", Value)
    end,
}, "BIND_FOR_LABEL")

local BindToggle = NestedGroupbox1:CreateToggle({
    Name = "Toggle with Bind",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        print("Toggle (via UI) is now:", Value)
    end
}, "BIND_TOGGLE")

BindToggle:AddBind({
    CurrentValue = "E",
    SyncToggleState = true,
    Callback = function(Value)
        print("Toggle (via Bind) is now:", Value)
    end
}, "BIND_FOR_TOGGLE")

local ColorPickerLabel = NestedGroupbox2:CreateLabel({
    Name = "Color Picker"
}, "CP_LABEL")

ColorPickerLabel:AddColorPicker({
    CurrentValue = Color3.fromRGB(33, 217, 64),
    Transparency = 0.5,
    Callback = function(Color, Transparency)
        print("New Color:", Color, "New Transparency:", Transparency)
    end,
}, "COLORPICKER")

local DropdownLabel = NestedGroupbox2:CreateLabel({
    Name = "Dropdown"
}, "DD_LABEL")

DropdownLabel:AddDropdown({
    Options = {"Option 1", "Option 2", "Option 3"},
    CurrentOptions = {"Option 1"},
    Placeholder = "Select an option...",
    MultipleOptions = true,
    Callback = function(Options)
        print("Selected options:", table.concat(Options, ", "))
    end,
}, "DROPDOWN")

local PlayerDropdownLabel = NestedGroupbox2:CreateLabel({
    Name = "Player Dropdown"
}, "PLAYER_DD_LABEL")

PlayerDropdownLabel:AddDropdown({
    Special = "Player",
    MultipleOptions = false,
    Callback = function(Options)
        if Options[1] then
            print("Selected Player:", Options[1])
        end
    end
}, "PLAYER_DROPDOWN")

local TextualGroupbox = MiscTab:CreateGroupbox({
    Name = "Textual & Other",
    Column = 1
}, "TEXTUAL_GROUP")

local DialogsGroupbox = MiscTab:CreateGroupbox({
    Name = "Dialogs & Notifications",
    Column = 2
}, "DIALOGS_GROUP")

TextualGroupbox:CreateLabel({
    Name = "This is a simple label."
}, "LABEL_SIMPLE")

TextualGroupbox:CreateDivider()

TextualGroupbox:CreateParagraph({
    Name = "Paragraph Header",
    Content = "This is a paragraph element. \nIt supports multi-line text and auto-resizes based on its content.",
    Icon = NebulaIcons:GetIcon("description", "Material")
}, "PARA_1")

DialogsGroupbox:CreateButton({
    Name = "Show Notification",
    Callback = function()
        Starlight:Notification({
            Title = "Manual Notification",
            Icon = NebulaIcons:GetIcon('sparkle', 'Material'),
            Content = "This notification was triggered by a button.",
            Duration = 5
        }, "MANUAL_NOTIF")
    end,
}, "NOTIF_BTN")

DialogsGroupbox:CreateButton({
    Name = "Prompt Dialog (Buttons)",
    Callback = function()
        Window:PromptDialog({
            Name = "Confirmation",
            Content = "Are you sure you want to proceed?",
            Type = 1,
            Actions = {
                Primary = {
                    Name = "Confirm",
                    Icon = NebulaIcons:GetIcon("check", "Material"),
                    Callback = function()
                        print("Dialog Confirmed")
                    end
                },
                {
                    Name = "Cancel",
                    Callback = function()
                        print("Dialog Canceled")
                    end
                },
            }
        })
    end,
}, "DIALOG_BTN_1")

DialogsGroupbox:CreateButton({
    Name = "Prompt Dialog (Input)",
    Callback = function()
        Window:PromptDialog({
            Name = "Input Required",
            Content = "Please enter your name below.",
            Type = 2,
            Actions = {
                {
                    PlaceholderText = "Your Name",
                    Callback = function(text)
                        print("Dialog input received:", text)
                    end
                },
                {
                    PlaceholderText = "Your Age (Numeric)",
                    Numeric = true,
                    Callback = function(text)
                         print("Dialog input (age) received:", text)
                    end
                }
            }
        })
    end,
}, "DIALOG_BTN_2")

SettingsTab:BuildThemeGroupbox(1)
SettingsTab:BuildConfigGroupbox(2)

Starlight:SetTheme("Nebula")
Starlight:LoadAutoloadTheme()

Starlight:OnDestroy(function()
    print("Starlight UI Destroyed. Cleaning up script.")
end)

Starlight:LoadAutoloadConfig()
