local base = "https://raw.githubusercontent.com/PelaoTruco/ZembluHub/main/"

local Main = loadstring(game:HttpGet(base.."Main.lua"))()
local Style = loadstring(game:HttpGet(base.."Style.lua"))()
local Functions = loadstring(game:HttpGet(base.."Functions.lua"))()
local Categories = loadstring(game:HttpGet(base.."Categories.lua"))()

Main(Style, Functions, Categories)
