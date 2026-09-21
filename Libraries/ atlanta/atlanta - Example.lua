local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/cursed-blip/atlanta-reimagined/refs/heads/main/library.lua"))()

local window = library:window({ name = "my script" })
local tab = window:tab({ name = "Combat" })
local section = tab:column():section({ name = "aim" })

section:toggle({
    name = "enabled",
    flag = "aim_enabled",
    callback = function(state) end,
})

section:slider({ name = "smoothness", min = 0, max = 100, default = 40, flag = "smooth" })
section:dropdown({ name = "target", items = { "head", "torso" }, default = "head", flag = "target" })
section:button({ name = "run", callback = function() end })
