-- Zyro Hub - Steal An Egg
-- Discord: discord.gg/YjEa2NSbTX
local fn, v, v2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, fn2, tbl, v3, fn3, fn4, tbl2, fn5, fn6, tbl3
local tbl4, fn7, tbl5, v4, v5, espSection, tbl6, n, tbl7, tbl8
local tbl9, tbl10, v6
do
local CollectionService, ProximityPromptService, v7, v8, tbl11, tbl12, tbl13, n2, n3, n4
local tbl14, str, tbl15, tbl16, tbl17, tbl18, tbl19, tbl20
do
fn = function(arg)
local genv = typeof(getgenv) == "function" and getgenv() or _G
if type(genv.ZyroDebugPrint) == "function" then
pcall(genv.ZyroDebugPrint, arg)
end
end
task.spawn(pcall, function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZyroHub/zyrohub/main/DiscordLink"))()
end)
local function fn8()
local response = nil
local function fn9()
if type(response) == "string" and #response > 0 then
return response
end
response = game:HttpGet("https://raw.githubusercontent.com/ZyroHub/zyrohub/main/Zyro%20Library")
return response
end
local function fn10()
local zyroHubSaeCleanup =(typeof(getgenv) == "function" and getgenv() or _G).ZyroHubSaeCleanup
if type(zyroHubSaeCleanup) == "function" then
pcall(zyroHubSaeCleanup)
end
local tbl21 ={game:GetService("CoreGui")}
if typeof(gethui) == "function" then
local ok, result = pcall(gethui)
if ok and typeof(result) == "Instance" then
table.insert(tbl21, result)
end
end
local tbl22 ={
Settings = true,
ZyroLeftCenter = true,
ZyroLibrarySettings = true,
ZyroLibraryLauncher = true,
}
local n5 = 0
for _, v9 in ipairs(tbl21) do
for _, child in ipairs(v9:GetChildren()) do
local isScreenGui = child:IsA("ScreenGui")
local flag
if isScreenGui then
flag = child:GetAttribute("ZyroLibraryOwned") == true or tbl22[child.Name]
else
flag = isScreenGui
end
if flag then
pcall(function()
child:Destroy()
end)
n5 += 1
end
end
end
if n5 > 0 then
fn("cleared ".. n5.. " leftover Zyro UI screens")
end
end
local function fn11()
local v9 = fn9()
local chunk, v10 = loadstring(v9)
assert(chunk, v10)
local v11 = chunk()
assert(type(v11) == "function", "Zyro Library bootstrap is invalid.")
local v12 = table.create(45)
local n5 = 1
for i = 1, 90, 2 do
v12[n5] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#",(n5 - 1) % 8 + 1)))
n5 += 1
end
return v11(table.concat(v12))
end
local zyroLibraryFailedToLoad = "unknown"
for i = 1, 6 do
task.wait()
pcall(fn10)
local ok, result = pcall(fn11)
if ok and type(result) == "table" then
return result
end
zyroLibraryFailedToLoad = tostring(result)
if type(zyroLibraryFailedToLoad) == "string" and string.find(zyroLibraryFailedToLoad, "HttpGet", 1, true) then
response = nil
end
fn("library load attempt ".. i.. " failed: ".. zyroLibraryFailedToLoad)
task.wait(1 + i * 0.5)
end
error("Zyro Library failed to load: ".. zyroLibraryFailedToLoad, 0)
end
v = fn8()
assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Zyro Library returned an invalid API.")
v.ManualQuickDefaults ={
PinnedFeatures ={"Player > Movement > Speed Boost", "Player > Movement > Boost Speed"},
Keybinds ={["Player > Movement > Speed Boost"] = "Q"},
PinGroups ={},
LeftCenterHidden = true,
}
v2 = v:CreateWindow({Name = "Zyro Hub - Steal An Egg", DefaultTab = "Farm"})
defaultTab = v2:GetDefaultTab()
Players = game:GetService("Players")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
CoreGui = game:GetService("CoreGui")
UserInputService = game:GetService("UserInputService")
CollectionService = game:GetService("CollectionService")
game:GetService("LocalizationService")
ProximityPromptService = game:GetService("ProximityPromptService")
localPlayer = Players.LocalPlayer
networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")
fn2 = function(arg)
local ok, result = pcall(function()
return require(arg())
end)
return ok and result or nil
end
tbl ={
EggState = fn2(function()
return ReplicatedStorage.Client.EggState
end),
AreaEggs = fn2(function()
return ReplicatedStorage.Shared.Types.AreaEggs
end),
ToolGameplayGuard = fn2(function()
return ReplicatedStorage.Client.ToolGameplayGuard
end),
Assets = fn2(function()
return ReplicatedStorage.Data.Assets
end),
Guards = fn2(function()
return ReplicatedStorage.Data.Guards
end),
EggRecords = fn2(function()
return ReplicatedStorage.Shared.Util.EggRecords
end),
Mutations = fn2(function()
return ReplicatedStorage.Shared.Modules.Mutations
end),
Save = fn2(function()
return ReplicatedStorage.Shared.Save
end),
FuseKernel = fn2(function()
return ReplicatedStorage.Shared.Util.FuseKernel
end),
AreaEggCycle = fn2(function()
return ReplicatedStorage.Shared.Util.AreaEggCycle
end),
AreaEggResetWall = fn2(function()
return ReplicatedStorage.Client.AreaEggResetWall
end),
AreaEggResetCycle = fn2(function()
return ReplicatedStorage.Data.AreaEggResetCycle
end),
Gears = fn2(function()
return ReplicatedStorage.Data.Gears
end),
Areas = fn2(function()
return ReplicatedStorage.Data.Areas
end),
LimitedEgg = fn2(function()
return ReplicatedStorage.Data.LimitedEgg
end),
BrainrotEgg = fn2(function()
return ReplicatedStorage.Data.BrainrotEgg
end),
MonsterEgg = fn2(function()
return ReplicatedStorage.Data.MonsterEgg
end),
}
do
local save = tbl.Save
local flag = type(save) == "table"
local flag2
if flag then
flag2 = type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function"
else
flag2 = flag
end
if flag2 then
tbl.Save = setmetatable({
Get = type(save.Get) == "function" and save.Get or save.Peek,
FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
},{__index = save})
end
end
local function fn9()
if typeof(gethui) == "function" then
local ok, result = pcall(gethui)
if ok and typeof(result) == "Instance" then
return result
end
end
return CoreGui
end
v3 = fn9()
do
local v9 = Random.new()
local str2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
fn3 = function()
local v10 = v9:NextInteger(12, 20)
local v11 = table.create(v10)
for i = 1, v10 do
local v12 = v9:NextInteger(1, #str2)
v11[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v12, v12)
end
return table.concat(v11)
end
end
do
local tbl21 ={}
fn4 = function(arg)
table.insert(tbl21, arg)
end
tbl2 ={}
fn5 = function(arg, arg2)
local n5 = 1000
local n6 = 3
local n7 = 12
local function fn10(arg3)
if arg3 <= 0 then
return 0
end
local n8 = 10 ^(math.floor(math.log10(arg3)) - 2)
return math.floor(arg3 / n8 + 0.5) * n8
end
local function fn11(arg3)
local n8 = math.clamp(tonumber(arg3) or 0, 0, 1000)
if n8 <= 0 then
return 0
end
return fn10(10 ^(n6 +(n7 - n6) * n8 / n5))
end
local function fn12(arg3)
local n8 = tonumber(arg3) or 0
if n8 <= 0 then
return 0
end
local n9 = n7 - n6
return math.clamp(math.floor((math.log10(n8) - n6) / n9 * n5 * 100 + 0.5) / 100, 0, 1000)
end
local function fn13(arg3)
local str2 = string.format(arg3 >= 100 and "%.0f" or arg3 >= 10 and "%.1f" or "%.2f", arg3)
local v9
if string.find(str2, ".", 1, true) then
v9 = string.gsub(string.gsub(str2, "0+$", ""), "%.$", "")
else
v9 = str2
end
return v9
end
local function fn14(arg3)
local v9 = fn11(arg3)
if v9 <= 0 then
return "Off"
end
if v9 < 1000000 then
return fn13(v9 / 1000).. " K/s"
end
if v9 < 1e9 then
return fn13(v9 / 1000000).. " M/s"
end
return fn13(v9 / 1e9).. " B/s"
end
local function fn15(arg3)
local v9 = fn11(arg3)
if v9 <= 0 then
return "0"
end
if v9 < 1000000 then
return fn13(v9 / 1000).. "k"
end
return(string.gsub(string.gsub(string.format("%.3f", v9 / 1000000), "0+$", ""), "%.$", ""))
end
local tbl22 ={k = 1000, m = 1000000, b = 1e9, t = 1e12}
local function fn16(arg3)
local v9 = string.gsub(string.lower(string.gsub(tostring(arg3 or ""), "[%s,/]", "")), "s$", "")
if v9 == "" or v9 == "off" then
return 0
end
local v10, v11 = string.match(v9, "^([%d%.]+)([kmbt]?)$")
local num = tonumber(v10)
if not num then
return nil
end
return fn12(num *(tbl22[v11] or 1000000))
end
local v9 = arg:CreateSlider({
Name = arg2.Name,
Note = arg2.Note,
SubOf = arg2.SubOf,
Min = 0,
Max = n5,
Default = fn12(arg2.Default or 0),
AllowDecimals = true,
Increment = 0.01,
ValueFormat = fn14,
ValueParse = fn16,
Callback = function(arg3)
if type(arg2.OnRaw) == "function" then
arg2.OnRaw(fn11(arg3))
end
end,
})
local value = type(v9) == "table" and rawget(v9, "Instance") or nil
if typeof(value) == "Instance" then
for _, descendant in ipairs(value:GetDescendants()) do
if descendant:IsA("TextBox") then
local connection = descendant.Focused:Connect(function()
task.defer(function()
if descendant:IsFocused() then
local ok, result = pcall(v9.Get, v9)
descendant.Text = fn15(ok and result or 0)
descendant.CursorPosition = #descendant.Text + 1
descendant.SelectionStart = 1
end
end)
end)
fn4(function()
pcall(function()
connection:Disconnect()
end)
end)
end
end
end
if type(arg2.Legacy) == "string" and type(arg2.SectionName) == "string" then
table.insert(tbl2,{Handle = v9, Name = arg2.Name, Legacy = arg2.Legacy, Section = arg2.SectionName, StepOf = fn12})
end
return v9
end
local text = "All"
fn6 = function(arg)
if type(arg) ~= "table" then
return arg
end
local value = rawget(arg, "Instance")
if typeof(value) ~= "Instance" then
return arg
end
local flag = false
local function fn10(arg2)
if flag then
return
end
if arg2.Text == "None" then
flag = true
arg2.Text = text
flag = false
end
end
local function fn11(descendant)
if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
return
end
fn10(descendant)
local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
fn10(descendant)
end)
fn4(function()
pcall(function()
connection:Disconnect()
end)
end)
end
for _, descendant in ipairs(value:GetDescendants()) do
fn11(descendant)
end
local connection = value.DescendantAdded:Connect(fn11)
fn4(function()
pcall(function()
connection:Disconnect()
end)
end)
return arg
end
local genv = typeof(getgenv) == "function" and getgenv() or _G
local zyroHubSaeCleanup = genv.ZyroHubSaeCleanup
if type(zyroHubSaeCleanup) == "function" then
pcall(zyroHubSaeCleanup)
end
genv.ZyroHubSaeCleanup = function()
for i = #tbl21, 1, -1 do
pcall(tbl21[i])
end
table.clear(tbl21)
end
end
do
local n5 = 0
local fn10 = nil
fn10 = function(arg, arg2)
local n6 = arg2 or 0
if type(arg) == "table" then
if n6 > 3 then
return
end
local n7 = 0
for k, v9 in pairs(arg) do
n7 += 1
if not(n7 > 20) then
fn10(k, n6 + 1)
fn10(v9, n6 + 1)
continue
end
break
end
elseif typeof(arg) == "Instance" then
pcall(arg.GetFullName, arg)
else
n5 += #tostring(arg)
end
end
local tbl21 ={}
local function fn11(arg)
tbl21[#tbl21 + 1] = arg
end
local function fn12()
for _, v9 in ipairs(tbl21) do
pcall(function()
v9:Disconnect()
end)
end
table.clear(tbl21)
end
local function zyroToolKeeper()
fn12()
for _, v9 in ipairs({
"RE/GearSatchel/Lost",
"RE/GearSatchel/Gained",
"RE/RigSync/ProbeSatchel",
"RE/RigSync/SeedSatchel",
"RE/RigSync/CorrectionBegan",
"RE/RigSync/Refresh",
"RE/ToolTrigger/Trigger",
"RE/BatSwing/Trigger",
}) do
local v10 = networking:FindFirstChild(v9)
if v10 and v10:IsA("RemoteEvent") then
fn11(v10.OnClientEvent:Connect(function(...)
fn10({...})
end))
end
end
local function fn13(arg)
if not arg then
return
end
fn11(arg.ChildRemoved:Connect(function(child)
if child:IsA("Tool") then
fn10({child.Name, child.Parent})
end
end))
fn11(arg.ChildAdded:Connect(function(child)
if child:IsA("Tool") then
fn10({child.Name})
end
end))
end
fn13(localPlayer:FindFirstChildOfClass("Backpack"))
fn11(localPlayer.ChildAdded:Connect(function(child)
if child:IsA("Backpack") then
fn13(child)
end
end))
task.spawn(function()
pcall(function()
local v9 = tbl.Save.Get()
fn10({v9.GearInventory, v9.Inventory}, 2)
end)
if type(getgc) == "function" then
pcall(function()
for _, v9 in ipairs(getgc(false)) do
if type(v9) == "function" and islclosure(v9) then
pcall(debug.info, v9, "n")
end
end
end)
end)
end
;(typeof(getgenv) == "function" and getgenv() or _G).ZyroToolKeeper = zyroToolKeeper
task.defer(zyroToolKeeper)
fn4(fn12)
end
do
local n5 = 0.35
local n6 = 5
local tbl21 ={}
local flag = true
tbl3 ={
Add = function(arg)
local tbl22 ={Run = arg, Gap = n5, Idle = n6, Repeat = false, Hold = 0}
table.insert(tbl21, tbl22)
return tbl22
end,
Wake = function()
flag = true
end,
Backoff = function(arg, arg2)
if arg then
arg.Hold = tonumber(arg2) or 6
end
end,
}
local connection = RunService.Heartbeat:Connect(function(deltaTime)
local v9 = flag
flag = false
for _, v10 in ipairs(tbl21) do
v10.Gap = v10.Gap + deltaTime
v10.Idle = v10.Idle + deltaTime
if v10.Hold > 0 then
v10.Hold = v10.Hold - deltaTime
elseif v10.Gap >= n5 and(v9 or v10.Repeat or v10.Idle >= n6) then
v10.Gap = 0
v10.Idle = 0
local ok, result = pcall(v10.Run, v10)
v10.Repeat = ok and result == true
end
end
end)
fn4(function()
connection:Disconnect()
end)
end
v7 = defaultTab:CreateSection({Name = "Dr Scramble Lab & Mech", Expanded = false})
local v9
v9 = defaultTab:CreateSection({Name = "Auto Steal", Expanded = true})
local v10
v10 = defaultTab:CreateSection({Name = "Auto Place Egg", Expanded = false})
local v11
v11 = defaultTab:CreateSection({Name = "Auto Treadmill", Expanded = false})
local v12
v12 = defaultTab:CreateSection({Name = "Auto Hatch & Equip", Expanded = false})
local v13
v13 = defaultTab:CreateSection({Name = "Auto Sell", Expanded = false})
tbl.SellLabSection = defaultTab:CreateSection({Name = "Auto Sell Lab Egg", Expanded = false})
local v14
v14 = defaultTab:CreateSection({Name = "Auto Fuse Machine", Expanded = false})
v8 = defaultTab:CreateSection({Name = "Auto Favorite", Expanded = false})
tbl11 ={Paused = false}do
local n5 = 0.5
local v15 = nil
local tbl21 = nil
local tbl22 ={}
local flag = false
local n6 = 0
local function fn10()
for i = #tbl22, 1, -1 do
local v16 = tbl22[i]
if v16 and v16.Connected then
v16:Disconnect()
end
tbl22[i] = nil
end
end
local function fn11()
fn10()
local v16 = v15
local v17 = tbl21
v15 = nil
tbl21 = nil
if not v16 or not v16.Parent or not v17 then
return
end
pcall(function()
v16.BreakJointsOnDeath = v17.BreakJointsOnDeath
v16.RequiresNeck = v17.RequiresNeck
v16:SetStateEnabled(Enum.HumanoidStateType.Dead, v17.DeadEnabled)
end)
end
local function fn12(arg)
if not arg or not arg.Parent then
return false
end
return pcall(function()
arg.BreakJointsOnDeath = false
arg.RequiresNeck = false
arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
end
local function fn13(arg)
if tbl11.Paused or arg ~= v15 or not arg or not arg.Parent or flag then
return false
end
local maxHealth = arg.MaxHealth
if maxHealth <= 0 then
return false
end
if maxHealth == math.huge or arg.Health >= maxHealth then
return true
end
flag = true
local ok = pcall(function()
arg.Health = maxHealth
end)
flag = false
return ok and arg.Health >= maxHealth
end
local function fn14(arg)
if arg == v15 and arg and arg.Parent then
return true
end
fn11()
if not arg or not arg:IsA("Humanoid") or not arg.Parent then
return false
end
v15 = arg
tbl21 ={
BreakJointsOnDeath = arg.BreakJointsOnDeath,
RequiresNeck = arg.RequiresNeck,
DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
}
if not fn12(arg) then
fn11()
return false
end
fn13(arg)
tbl22[#tbl22 + 1] = arg.HealthChanged:Connect(function()
fn13(arg)
end)
tbl22[#tbl22 + 1] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
fn13(arg)
end)
tbl22[#tbl22 + 1] = arg.StateChanged:Connect(function(old, new)
if new == Enum.HumanoidStateType.Dead and not tbl11.Paused then
fn12(arg)
fn13(arg)
end
end)
n6 = os.clock()
return true
end
local function fn15()
local character = localPlayer.Character
return character and character:FindFirstChildOfClass("Humanoid") or nil
end
local connection = localPlayer.CharacterAdded:Connect(function()
task.defer(function()
fn14(fn15())
end)
end)
local connection2 = RunService.Heartbeat:Connect(function()
local now = os.clock()
if tbl11.Paused or now - n6 < n5 then
return
end
n6 = now
local v16 = fn15()
if v16 ~= v15 then
fn14(v16)
return
end
if v16 then
fn12(v16)
fn13(v16)
end
end)
task.defer(function()
fn14(fn15())
end)
fn4(function()
if connection then
connection:Disconnect()
end
if connection2 then
connection2:Disconnect()
end
fn11()
end)
end
local tbl21 ={"bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade"}
tbl4 ={
Steal ={Active = false, LastFinishedAt = 0, Carrying = false},
SafeCarry ={
Enabled = true,
SkipUnsafe = false,
WaitGuard = false,
SameSpeedBigEggs = false,
Blocked ={},
StretchSeconds = 6,
BeatGuard = false,
SlowUntil = 0,
SlowFactor = 0.3,
LineDrop = false,
LineGap = 12,
LineWait = 15,
DirectBudget = 450,
DirectMargin = 0.3,
CrossNow = false,
CrossSpeed = 231,
PickupSpeed = 154,
HopRatio = 1.515,
CrossRatio = 1,
PickupRatio = 0.667,
FarFromLine = 150,
DropDelay = 0.19,
LineApproach = 0.97,
ReJump = true,
ShakeTime = 0,
SnapPickup = false,
Hops = true,
HopStep = 350,
BackRunRatio = 15,
BackRunMax = 2000,
QuickRegrab = 1,
MidDrops ={0.33, 0.66},
MidRest = 0.1,
LagGrace = 4,
LockCamera = false,
HopGap = 0.1,
HopLift = 42,
HopStop = 48,
GetUp = true,
ShakeInside = 1,
CarryScale = 1,
EasyRatio = 1.3,
LastSkip = nil,
Category = nil,
PlanOk = true,
LightMult = 0.96,
Height = 70,
ClimbShare = 0.5,
Approach = "Run",
RunSpeed = 1,
RunWait = 0,
RunAnimate = true,
RunHeight = 50,
SnapLimit = 90,
StraightRun = true,
RunStyle = "Velocity",
CarryStyle = "Velocity",
SpeedJitter = 0.08,
Wobble = 0,
LaneOffset = 0,
JumpsPerMinute = 0,
PausesPerMinute = 0,
ReactMin = 0.2,
ReactMax = 0.6,
CarryReact = 0,
SpeedRatio = 1.5,
ExcessSeconds = 5.5,
GuardMargin = 4,
GuardRatio = 1.06,
MinRatio = 1.1,
BaseWait = 6.5,
FreeJump = 1500,
WaitRate = 0.9,
RecoverTries = math.huge,
GuessMult = 0.93,
CarryRatio = 0.9,
Mult = 1,
Seen ={},
JumpDistance = 0,
JumpAt = 0,
LastDelivered = 0,
LastFailed = 0,
Handle = nil,
},
Movement ={
Owner = nil,
PlaceWanted = false,
StealFirst = false,
MutationWanted = false,
FracturedWanted = false,
},
AntiGuard ={
Enabled = false,
Busy = false,
BusySince = 0,
HitArms = 0,
Handle = nil,
Render = nil,
},
IsBatTool = function(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
return false
end
if arg:GetAttribute("IsBat") == true then
return true
end
local attribute = arg:GetAttribute("GearName")
if type(attribute) == "string" then
local gears = tbl.Gears
local directory = type(gears) == "table" and gears.Directory or nil
local flag = type(directory) == "table" and directory[attribute] or nil
return type(flag) == "table" and flag.BatControllerData ~= nil
end
if arg:GetAttribute("ItemType") ~= nil then
return false
end
local v15 = string.lower(arg.Name)
for _, v16 in ipairs(tbl21) do
if string.find(v15, v16, 1, true) then
return true
end
end
return false
end,
FindBat = function()
local character = localPlayer.Character
local tool = character and character:FindFirstChildWhichIsA("Tool")
if tbl4.IsBatTool(tool) then
return tool
end
local backpack = localPlayer:FindFirstChildOfClass("Backpack")
if backpack then
for _, child in ipairs(backpack:GetChildren()) do
if tbl4.IsBatTool(child) then
return child
end
end
end
if character then
for _, child in ipairs(character:GetChildren()) do
if tbl4.IsBatTool(child) then
return child
end
end
end
return nil
end,
IsNight = function()
local areaEggCycle = tbl.AreaEggCycle
if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
return false
end
local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
return ok and result == true
end,
WallSealed = function()
local areaEggResetWall = tbl.AreaEggResetWall
if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
return false
end
local ok, result = pcall(areaEggResetWall.IsSealed)
return ok and result == true
end,
WallOpenDelay = function()
local areaEggResetCycle = tbl.AreaEggResetCycle
if type(areaEggResetCycle) ~= "table" then
return 5
end
return(tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2) +(tonumber(areaEggResetCycle.WallCountdownSeconds) or 3)
end,
ClaimMovement = function(owner)
local movement = tbl4.Movement
if movement.Owner == nil or movement.Owner == owner or movement.Owner == "treadmill" and owner ~= "treadmill" or movement.Owner == "scramble" and owner == "steal" then
movement.Owner = owner
return true
end
return false
end,
ReleaseMovement = function(arg)
if tbl4.Movement.Owner == arg then
tbl4.Movement.Owner = nil
end
end,
}
do
local shieldMethods ={"Humanoid Swap", "Disable Monitor"}
tbl4.ShieldMethods = shieldMethods
local v15 = shieldMethods[1]
local tbl22 ={}
local tbl23 ={}
local connection = nil
local n5 = 0
local tbl24 ={Original = nil, Clone = nil, Links ={}}
local connection2 = nil
local tbl25 ={}
local function fn10()
for _, v16 in ipairs(tbl25) do
task.defer(function()
pcall(v16)
end)
end
end
tbl4.OnHumanoidChanged = function(arg)
table.insert(tbl25, arg)
local tbl26
tbl26 ={
Connected = true,
Disconnect = function()
tbl26.Connected = false
local v16 = table.find(tbl25, arg)
if v16 then
table.remove(tbl25, v16)
end
end,
}
return tbl26
end
local function fn11(humanoid)
pcall(function()
local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
local playerModule = playerScripts and playerScripts:FindFirstChild("PlayerModule")
if playerModule then
local controls = require(playerModule):GetControls()
if type(controls) == "table" then
controls.humanoid = humanoid
end
end
end)
end
local function fn12(arg)
local animate = arg and arg:FindFirstChild("Animate")
if animate and animate:IsA("LocalScript") then
task.spawn(function()
animate.Enabled = false
task.wait()
animate.Enabled = true
end)
end
end
local function fn13()
for _, link in ipairs(tbl24.Links) do
pcall(function()
link:Disconnect()
end)
end
table.clear(tbl24.Links)
end
tbl4.UndoSwap = function()
fn13()
local character = localPlayer.Character
local original = tbl24.Original
local clone = tbl24.Clone
local v16 = tbl24
tbl24.Original = nil
v16.Clone = nil
if original and clone and character and original.Parent == nil and clone.Parent == character then
original.Parent = character
workspace.CurrentCamera.CameraSubject = original
fn11(original)
pcall(function()
clone:Destroy()
end)
fn12(character)
fn10()
end
end
local tbl26 ={
[Enum.HumanoidStateType.Running] = true,
[Enum.HumanoidStateType.RunningNoPhysics] = true,
[Enum.HumanoidStateType.Landed] = true,
}
tbl4.Grounded = function(arg)
if not arg then
local character = localPlayer.Character
arg = character and character:FindFirstChildOfClass("Humanoid")
end
if not arg or arg.Health <= 0 or arg.FloorMaterial == Enum.Material.Air then
return false
end
return tbl26[arg:GetState()] == true
end
tbl4.ShieldPaused = false
tbl4.WalkSpeed = function()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
humanoid = humanoid and humanoid.WalkSpeed or 16
local original = tbl24.Original
local n6
if original and original.Health > 0 then
n6 = math.min(humanoid, original.WalkSpeed)
else
n6 = humanoid
end
local ok, result = pcall(function()
local leaderstats = localPlayer:FindFirstChild("leaderstats")
leaderstats = leaderstats and leaderstats:FindFirstChild("Speed")
local TreadmillUtil = require(ReplicatedStorage.Shared.Util.TreadmillUtil)
return leaderstats and TreadmillUtil.SpeedPowerToWalkSpeed(leaderstats.Value) or nil
end)
local n7
if ok and tonumber(result) and result > 0 then
n7 = math.min(n6, result)
else
n7 = n6
end
return n7
end
local function fn14()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if not humanoid or humanoid.Health <= 0 then
return
end
if tbl24.Clone and tbl24.Clone.Parent == character then
return
end
if not tbl4.Grounded(humanoid) then
return
end
local clone = humanoid:Clone()
humanoid.Parent = nil
clone.Parent = character
workspace.CurrentCamera.CameraSubject = clone
fn11(clone)
fn12(character)
local v16 = tbl24
tbl24.Original = humanoid
v16.Clone = clone
fn10()
table.insert(tbl24.Links, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
if clone.Parent ~= nil then
clone.WalkSpeed = humanoid.WalkSpeed
end
end))
local animator = humanoid:FindFirstChildOfClass("Animator")
local animator2 = clone:FindFirstChildOfClass("Animator")
if animator and animator2 then
table.insert(tbl24.Links, animator.AnimationPlayed:Connect(function(arg)
local animation = arg.Animation
if not animation or clone.Parent == nil then
return
end
local ok, result = pcall(function()
return animator2:LoadAnimation(animation)
end)
if not ok or not result then
return
end
pcall(function()
result.Priority = arg.Priority
result.Looped = arg.Looped
local speed = arg.Speed
result:Play(0.05, math.max(arg.WeightTarget, 0.01), speed)
end)
local connection3 = nil
connection3 = arg.Stopped:Connect(function()
connection3:Disconnect()
pcall(function()
result:Stop(0.1)
end)
end)
end))
end
table.insert(tbl24.Links, clone.Died:Connect(function()
fn13()
local v17 = tbl24
tbl24.Original = nil
v17.Clone = nil
local character2 = localPlayer.Character
if character2 and humanoid.Parent == nil then
humanoid.Parent = character2
workspace.CurrentCamera.CameraSubject = humanoid
fn11(humanoid)
fn10()
end
pcall(function()
clone:Destroy()
end)
humanoid.Health = 0
end))
end
local function fn15()
if type(getconnections) ~= "function" then
return
end
for _, v16 in ipairs({RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation}) do
local ok, result = pcall(getconnections, v16)
if ok and type(result) == "table" then
for _, v17 in ipairs(result) do
local ok2, result2 = pcall(function()
return v17.Function
end)
local flag = ok2 and type(result2) == "function"
local flag2 = false
local result3 = nil
if flag then
flag2, result3 = pcall(debug.info, result2, "s")
end
if flag2 and string.find(tostring(result3), "UGI", 1, true) then
local ok3, result4 = pcall(function()
return v17.Enabled
end)
if not ok3 or result4 ~= false then
if pcall(function()
v17:Disable()
end) then
table.insert(tbl23, v17)
end
end
end
end
end
end
end
local function fn16()
if connection then
connection:Disconnect()
connection = nil
end
if connection2 then
connection2:Disconnect()
connection2 = nil
end
for _, v16 in ipairs(tbl23) do
pcall(function()
v16:Enable()
end)
end
table.clear(tbl23)
end
local function fn17()
if tbl4.ShieldPaused then
return
end
if v15 == shieldMethods[1] then
fn14()
else
fn15()
end
end
local function fn18()
fn17()
n5 = 0
connection = RunService.Heartbeat:Connect(function(deltaTime)
n5 += deltaTime
local character = localPlayer.Character
local flag = v15 == shieldMethods[1]
if flag then
flag = not(tbl24.Clone and character and tbl24.Clone.Parent == character)
end
if(flag and 0.25 or 3) <= n5 then
n5 = 0
fn17()
end
end)
connection2 = localPlayer.CharacterAdded:Connect(function(character)
fn13()
local v16 = tbl24
tbl24.Original = nil
v16.Clone = nil
if v15 ~= shieldMethods[1] then
return
end
task.spawn(function()
character:WaitForChild("Humanoid", 10)
task.wait(1)
if connection and localPlayer.Character == character then
fn17()
end
end)
end)
end
tbl4.Swapped = function()
if v15 ~= shieldMethods[1] then
return true
end
local character = localPlayer.Character
return tbl24.Clone ~= nil and character ~= nil and tbl24.Clone.Parent == character
end
tbl4.Shield = function(arg, arg2)
tbl22[arg] = arg2 == true or nil
if next(tbl22) == nil then
fn16()
return
end
if connection then
return
end
fn18()
end
tbl4.SetShieldMethod = function(arg)
if not table.find(shieldMethods, arg) or arg == v15 then
return
end
local flag = connection ~= nil
fn16()
v15 = arg
if flag and next(tbl22) ~= nil then
fn18()
end
end
fn4(fn16)
end
tbl4.Shield("load", true)
tbl4.Toggle = function(arg, arg2)
if type(arg) ~= "table" then
return arg2 == true
end
local ok, result = pcall(function()
local controller = arg._controller
return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
end)
if ok and type(result) == "boolean" then
return result
end
for _, v15 in ipairs({"Get", "GetValue"}) do
local ok2, result2 = pcall(function()
return arg[v15]
end)
if ok2 and type(result2) == "function" then
local ok3, result3 = pcall(result2, arg)
if ok3 and type(result3) == "boolean" then
return result3
end
end
end
return arg2 == true
end
tbl4.Root = function()
local character = localPlayer.Character
character = character and character:FindFirstChild("HumanoidRootPart")
return character and character:IsDescendantOf(workspace) and character or nil
end
tbl4.PlacedPoints = function()
local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
local tbl22 ={}
if not placedEggRenders then
return tbl22
end
local str2 = tostring(localPlayer.UserId)
for _, child in ipairs(placedEggRenders:GetChildren()) do
if string.find(child.Name, str2, 1, true) then
local ok, result = pcall(function()
return child:IsA("Model") and child:GetPivot() or child.CFrame
end)
if ok then
table.insert(tbl22, result.Position)
end
end
end
return tbl22
end
tbl4.OwnPlot = function()
local plots = workspace:FindFirstChild("Plots")
if not plots then
return nil
end
for _, child in ipairs(plots:GetChildren()) do
local plotSign = child:FindFirstChild("PlotSign")
plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
plotSign = plotSign and plotSign:FindFirstChild("Frame")
local playerName = plotSign and plotSign:FindFirstChild("PlayerName")
if playerName and playerName:IsA("TextLabel") then
local v15 = string.lower(playerName.Text)
if v15 == string.lower(localPlayer.Name) or v15 == string.lower(localPlayer.DisplayName) then
return child
end
end
end
return nil
end
local function fn10()
local v15 = tbl4.PlacedPoints()
if #v15 == 0 then
return nil
end
local vector = Vector3.zero
for _, v16 in ipairs(v15) do
vector += v16
end
return vector / #v15
end
tbl4.PenAnchor = function()
local v15 = fn10()
if v15 then
return v15
end
local v16 = tbl4.OwnPlot()
if not v16 then
return nil
end
local toUpdate = v16:FindFirstChild("ToUpdate")
local starterPen = toUpdate and toUpdate:FindFirstChild("StarterPen") or v16:FindFirstChild("CenterPoint")
if not starterPen then
return nil
end
local ok, result = pcall(function()
return starterPen:IsA("Model") and starterPen:GetPivot() or starterPen.CFrame
end)
return ok and result.Position or nil
end
tbl4.Plot = function()
local v15 = tbl4.OwnPlot()
if v15 then
return v15
end
local plots = workspace:FindFirstChild("Plots")
local v16 = fn10()
if not plots or not v16 then
return nil
end
local huge = math.huge
local v17 = nil
for _, child in ipairs(plots:GetChildren()) do
local ok, result, result2 = pcall(function()
return child:GetBoundingBox()
end)
if ok and result and result2 then
local v18 = result:PointToObjectSpace(v16)
local n5 = result2.X / 2
local flag = math.abs(v18.X) <= n5
if flag then
local n6 = result2.Z / 2
flag = math.abs(v18.Z) <= n6
end
if flag then
return child
end
local magnitude =(result.Position - v16).Magnitude
if magnitude < huge then
v17 = child
huge = magnitude
end
end
end
if v17 and huge <= 60 then
return v17
end
return nil
end
tbl4.Belt = function()
local v15 = tbl4.Plot()
if not v15 then
return nil
end
local treadmillBottom = v15:FindFirstChild("TreadmillBottom")
if treadmillBottom and treadmillBottom:IsA("BasePart") then
return treadmillBottom
end
local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
local boundingBoxPart = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_".. v15.Name)
if boundingBoxPart then
boundingBoxPart = boundingBoxPart:FindFirstChild("BoundingBoxPart") or boundingBoxPart:IsA("Model") and boundingBoxPart.PrimaryPart or boundingBoxPart:FindFirstChildWhichIsA("BasePart")
end
if boundingBoxPart then
return boundingBoxPart
end
local treadmillUpgrade = v15:FindFirstChild("TreadmillUpgrade")
return treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart") or nil
end
tbl4.DistanceTo = function(arg)
local v15 = tbl4.Root()
if not v15 or not arg then
return math.huge
end
return(v15.Position - arg).Magnitude
end
do
local tbl22 ={}
local n5 = 0
local function fn11()
local v15 = tbl4.Plot()
if not v15 then
return{}
end
local tbl23 ={}
for _, v16 in ipairs({"TreadmillBottom", "TreadmillUpgrade"}) do
local v17 = v15:FindFirstChild(v16)
if v17 then
if v17:IsA("BasePart") then
table.insert(tbl23, v17)
else
for _, descendant in ipairs(v17:GetDescendants()) do
if descendant:IsA("BasePart") then
table.insert(tbl23, descendant)
end
end
end
end
end
local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_".. v15.Name)
if clientTreadmillRenders then
for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
if descendant:IsA("BasePart") then
table.insert(tbl23, descendant)
end
end
end
return tbl23
end
local function fn12()
for _, v15 in ipairs(fn11()) do
if not tbl22[v15] then
tbl22[v15] ={
CFrame = v15.CFrame,
CanTouch = v15.CanTouch,
CanCollide = v15.CanCollide,
Transparency = v15.Transparency,
}
pcall(function()
v15.CanTouch = false
v15.CanCollide = false
v15.Transparency = 1
v15.CFrame = v15.CFrame - Vector3.new(0, 120, 0)
end)
end
end
end
local function fn13()
for k, v15 in pairs(tbl22) do
if k and k.Parent then
pcall(function()
k.CFrame = v15.CFrame
k.CanTouch = v15.CanTouch
k.CanCollide = v15.CanCollide
k.Transparency = v15.Transparency
end)
end
end
table.clear(tbl22)
end
tbl4.HoldBelt = function()
n5 += 1
fn12()
end
tbl4.ReleaseBelt = function()
n5 = math.max(0, n5 - 1)
if n5 == 0 then
fn13()
end
end
tbl4.BeltHeld = function()
return n5 > 0
end
tbl4.RefreshBeltHide = function()
if n5 > 0 then
fn12()
end
end
fn4(function()
n5 = 0
fn13()
end)
tbl4.LeaveBelt = function()
local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")
if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
end
end
tbl4.Treadmill ={Riding = false}
tbl4.ResetBelt = function()
n5 = 0
fn13()
end
tbl4.OnBelt = function()
local v15 = tbl4.Belt()
if not v15 or tbl22[v15] then
return false
end
local v16 = tbl4.Root()
if not v16 then
return false
end
local v17 = v15.CFrame:PointToObjectSpace(v16.Position)
local n6 = v15.Size.X / 2 + 2
local flag = math.abs(v17.X) <= n6
if flag then
local n7 = v15.Size.Z / 2 + 2
flag = math.abs(v17.Z) <= n7
end
return flag and v17.Y >= -2 and v17.Y <= v15.Size.Y / 2 + 8
end
end
tbl4.ExitBelt = function()
tbl4.Treadmill.Riding = false
tbl4.LeaveBelt()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
pcall(function()
humanoid.Jump = true
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
task.wait(0.35)
end
tbl4.Flying = false
tbl4.Driving = 0
tbl4.BeginFlight = function()
tbl4.Flying = true
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
humanoid.PlatformStand = true
pcall(function()
humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
end)
end
return tbl4.Root() ~= nil
end
tbl4.SetFlightVelocity = function(assemblyLinearVelocity)
local v15 = tbl4.Root()
if v15 then
v15.AssemblyLinearVelocity = assemblyLinearVelocity
v15.AssemblyAngularVelocity = Vector3.zero
end
end
tbl4.EndFlight = function()
tbl4.Flying = false
local v15 = tbl4.Root()
if v15 then
pcall(function()
v15.AssemblyLinearVelocity = Vector3.zero
v15.AssemblyAngularVelocity = Vector3.zero
end)
end
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if character then
character.PlatformStand = false
end
enddo
local tbl22 ={
Enum.HumanoidStateType.FallingDown,
Enum.HumanoidStateType.Ragdoll,
Enum.HumanoidStateType.Physics,
Enum.HumanoidStateType.Seated,
Enum.HumanoidStateType.PlatformStanding,
}
local tbl23 ={}
local flag = false
tbl4.GodMode = function(arg)
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if not character or not humanoid then
return
end
if arg then
flag = true
for _, v15 in ipairs(tbl22) do
pcall(function()
humanoid:SetStateEnabled(v15, false)
end)
end
pcall(function()
humanoid.BreakJointsOnDeath = false
end)
for _, descendant in ipairs(character:GetDescendants()) do
if descendant:IsA("BasePart") and tbl23[descendant] == nil then
tbl23[descendant] = descendant.CanCollide
pcall(function()
descendant.CanCollide = false
end)
end
end
elseif flag then
flag = false
for _, v15 in ipairs(tbl22) do
pcall(function()
humanoid:SetStateEnabled(v15, true)
end)
end
for k, v15 in pairs(tbl23) do
if k and k.Parent then
pcall(function()
k.CanCollide = v15
end)
end
end
table.clear(tbl23)
end
end
end
tbl4.GodTick = function()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid and humanoid.Health < humanoid.MaxHealth then
pcall(function()
humanoid.Health = humanoid.MaxHealth
end)
end
end
tbl4.StopWalking = function()
local character = localPlayer.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid and humanoidRootPart then
pcall(function()
humanoid:MoveTo(humanoidRootPart.Position)
humanoid:Move(Vector3.zero, false)
end)
end
end
local function fn11(arg, arg2, arg3, arg4)
local n5 = tonumber(arg2) or 6
local n6 = tonumber(arg3) or 10
local n7 = 0
local flag = nil
local n8 = 0
local n9 = 0
while n7 < n6 do
if type(arg4) == "function" and arg4() then
tbl4.StopWalking()
return false
end
local character = localPlayer.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
character = character and character:FindFirstChildOfClass("Humanoid")
if not humanoidRootPart or not character or character.Health <= 0 then
return false
end
if(humanoidRootPart.Position - arg).Magnitude <= n5 then
tbl4.StopWalking()
return true
end
flag = flag and(humanoidRootPart.Position - flag).Magnitude < 1
if flag then
n8 += 0.2
else
n8 = 0
end
flag = humanoidRootPart.Position
n9 = math.max(0, n9 - 0.2)
if n8 >= 0.8 and n9 <= 0 then
tbl4.LeaveBelt()
pcall(function()
character.Jump = true
end)
n8 = 0
n9 = 1.5
end
character:MoveTo(arg)
n7 += task.wait(0.2)
end
tbl4.StopWalking()
return tbl4.DistanceTo(arg) <= n5
end
tbl4.WalkTo = function(arg, arg2, arg3, arg4)
tbl4.Driving = tbl4.Driving + 1
local ok, result = pcall(fn11, arg, arg2, arg3, arg4)
tbl4.Driving = math.max(0, tbl4.Driving - 1)
return ok and result == true
end
local tbl22 ={
Boss = "Fractured",
GreatBloom = "Spirit Bloom",
Sakura = "Bloom",
Monstrous = "Parasite",
}
task.spawn(function()
local mutations = tbl.Mutations
local ok, result = pcall(function()
return mutations.All()
end)
if ok and type(result) == "table" then
for k, v15 in pairs(result) do
local id = type(v15) == "table" and(v15.Id or k) or nil
local label = type(v15) == "table" and v15.Label or nil
if id ~= nil and type(label) == "string" and label ~= "" then
tbl22[tostring(id)] = label
end
end
end
end)
fn7 = function(arg)
return tbl22[tostring(arg)] or tostring(arg)
end
local tbl23
tbl23 ={
"Forest",
"Desert",
"Snow",
"Lake",
"Jungle",
"Volcano",
"Prehistoric",
"Cosmic",
"Abyss Ocean",
"Cherry Blossom",
"Light Dark",
"Titan Temple",
}
local tbl24 ={}
for _, v15 in ipairs(tbl23) do
tbl24[v15] = true
end
task.spawn(function()
local eggState = tbl.EggState
local ok, result = pcall(function()
return eggState.ReadFieldEggs()
end)
if ok and type(result) == "table" and type(result.Records) == "table" then
for _, record in pairs(result.Records) do
local areaId = type(record) == "table" and record.AreaId or nil
if type(areaId) == "string" and not tbl24[areaId] then
tbl24[areaId] = true
table.insert(tbl23, areaId)
end
end
end
end)
tbl12 ={"Any"}
tbl13 ={Any = 0}
do
local tbl25 ={}
local directory = tbl.Assets and tbl.Assets.Directory
if type(directory) == "table" then
for _, v15 in pairs(directory) do
local rarity = type(v15) == "table" and v15.Rarity or nil
local flag = type(rarity) == "table"
local num
if flag then
num = tonumber(rarity.RarityNumber or rarity.Rank)
else
num = flag
end
num = num or nil
if num then
local str2 = tbl25[num]
if not str2 then
str2 = tostring(rarity.DisplayName or rarity._id or num)
end
tbl25[num] = str2
end
end
end
if next(tbl25) == nil then
tbl25 ={
"Common",
"Uncommon",
"Rare",
"Epic",
"Legendary",
"Mythic",
"Cosmic",
"Secret",
"Eternal",
"Divine",
}
end
local tbl26 ={}
for k in pairs(tbl25) do
table.insert(tbl26, k)
end
table.sort(tbl26)
for _, v15 in ipairs(tbl26) do
table.insert(tbl12, tbl25[v15])
tbl13[tbl25[v15]] = v15
end
end
tbl5 ={"Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value"}
local tbl25
tbl25 ={}
local n5
n5 = 0
local tbl26
tbl26 ={}
local tbl27
tbl27 ={}
local tbl28
tbl28 ={}
local tbl29
tbl29 ={}
tbl4.Steal.RiftPriority = false
tbl4.Steal.RiftNeeds ={}
tbl4.Steal.RiftRequirements ={}
tbl4.Steal.RiftCurrent ={}
tbl4.StockWaits = function(arg)
if type(arg) ~= "table" or not arg.RiftOnly or arg.RiftNow then
return false
end
local mech = tbl4.Mech
if type(mech) ~= "table" or tbl4.Toggle(mech.Handle, false) ~= true then
return false
end
return mech.Busy == true or workspace:FindFirstChild("ScrambleArenaPortal") ~= nil or localPlayer:GetAttribute("InScrambleArena") == true
end
tbl4.Lab ={
Banners ={},
Reserved ={},
SkipOwned = true,
Stock ={},
StockEggs ={},
StockPer = 3,
Pools ={},
PoolLists ={},
}
tbl4.Lab.Shares ={
Biohazard ={
{"Cyclops Gorilla", 0.431},
{"Red Panda", 0.431},
{"Snowy Owl", 0.399},
{"Salamander", 0.381},
{"Pterodactyl", 0.234},
{"Galaxy Gecko", 0.202},
{"Ankylosaurus", 0.194},
{"Crane", 0.138},
{"Parrotfish", 0.126},
{"Centapede", 0.106},
{"Dodo", 0.104},
{"Swordfish", 0.1},
{"Koi", 0.046},
{"La Vacca Saturno Saturnita", 0.044},
{"Finned Thresher", 0.024},
{"Bronto", 0.019},
{"Triceratops", 0.013},
{"Orca", 0.009},
},
Experimental ={
{"Blade Head", 0.342},
{"Red Panda", 0.341},
{"Crab", 0.331},
{"Salamander", 0.327},
{"Snowy Owl", 0.324},
{"Mantis", 0.314},
{"Cyclops Gorilla", 0.178},
{"Galaxy Gecko", 0.161},
{"Crane", 0.135},
{"Kaiju Spider", 0.134},
{"Pterodactyl", 0.119},
{"Dodo", 0.096},
{"Centapede", 0.094},
{"Rhino", 0.034},
{"Koi", 0.032},
{"Ankylosaurus", 0.03},
{"La Vacca Saturno Saturnita", 0.01},
{"Bronto", 0.001},
{"Triceratops", 0.001},
},
UnstableDNA ={
{"Toro", 0.236},
{"Lamb", 0.232},
{"Blade Head", 0.228},
{"Imp", 0.223},
{"Crab", 0.22},
{"Moth", 0.219},
{"Demon Hound", 0.217},
{"Peacock", 0.21},
{"Mantis", 0.203},
{"Salamander", 0.165},
{"Dove", 0.104},
{"Flame Sprite", 0.103},
{"Galaxy Gecko", 0.103},
{"Kaiju Spider", 0.102},
{"Red Panda", 0.102},
{"Crane", 0.096},
{"Snowy Owl", 0.088},
{"Centapede", 0.064},
{"Cyclops Gorilla", 0.021},
{"Jellyfish", 0.02},
{"Dark Gargoyle", 0.019},
{"Rhino", 0.018},
{"Koi", 0.009},
{"La Vacca Saturno Saturnita", 0.001},
},
}
tbl4.Lab.Pickers ={}
tbl4.Lab.ExtraPath = "ZyroLibrary/SAE_LabEggs.json"
tbl4.Lab.RefreshPools = function()
local lab = tbl4.Lab
local ok, result = pcall(function()
return require(ReplicatedStorage.Shared.Modules.ScrambleTradeInRecipes)
end)
if not ok or type(result) ~= "table" or type(result.Simulate) ~= "function" then
return
end
local HttpService = game:GetService("HttpService")
local tbl30 ={}
pcall(function()
if isfile(lab.ExtraPath) then
local data = HttpService:JSONDecode(readfile(lab.ExtraPath))
if type(data) == "table" then
tbl30 = data
end
end
end)
local flag = false
for k, share in pairs(lab.Shares) do
local ok2, result2 = pcall(result.Simulate, k, 4000)
if ok2 and type(result2) == "table" and type(result2.SlotPicks) == "table" then
local n6 = math.max(1, tonumber(result2.Runs) or 4000)
local tbl31 ={}
for _, slotPick in pairs(result2.SlotPicks) do
if type(slotPick) == "table" then
for k2, v15 in pairs(slotPick) do
local str2 = tostring(k2)
tbl31[str2] =(tbl31[str2] or 0) +(tonumber(v15) or 0)
end
end
end
local tbl32 = type(tbl30[k]) == "table" and tbl30[k] or{}
local tbl33 ={}
local tbl34 ={}
local flag2 = false
for _, v15 in ipairs(share) do
local v16 = v15[1]
local v17 = v15[2]
if(tbl31[v16] or 0) > 0 or v17 < 0.02 then
tbl33[v16] = true
table.insert(tbl34,{v16, v17})
else
flag2 = true
end
end
for k2, v15 in pairs(tbl31) do
if not tbl33[k2] and v15 > 0 then
local num = tonumber(tbl32[k2])
if not num then
num = math.max(0.001, math.floor(v15 / n6 * 1000 + 0.5) / 1000)
tbl32[k2] = num
tbl30[k] = tbl32
flag = true
end
table.insert(tbl34,{k2, num})
flag2 = true
end
end
if flag2 then
table.sort(tbl34, function(arg, arg2)
if arg[2] ~= arg2[2] then
return arg[2] > arg2[2]
end
return arg[1] < arg2[1]
end)
lab.Shares[k] = tbl34
lab.Pools[k] = nil
lab.PoolLists[k] = nil
local v15 = lab.Pickers[k]
if v15 and v15.Handle and type(v15.Handle.SetOptions) == "function" and type(lab.LabelsFor) == "function" then
local v16, v17 = lab.LabelsFor(k)
if #v16 > 0 then
v15.CategoryOf = v17
pcall(v15.Handle.SetOptions, v15.Handle, v16, nil, true)
end
end
end
end
task.wait()
end
task.delay(0.3, function()
pcall(tbl4.Lab.FixPickers)
end)
if flag and type(writefile) == "function" then
pcall(function()
if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ZyroLibrary") then
makefolder("ZyroLibrary")
end
writefile(lab.ExtraPath, HttpService:JSONEncode(tbl30))
end)
end
end
tbl4.Lab.FixPickers = function()
local lab = tbl4.Lab
if not tbl4.Steal.RiftPriority or type(lab.LabelsFor) ~= "function" then
return
end
for k, picker in pairs(lab.Pickers) do
local handle = picker.Handle
local value = type(handle) == "table" and rawget(handle, "Instance") or nil
if typeof(value) == "Instance" and value.AbsoluteSize.Y <= 2 and type(handle.SetOptions) == "function" then
local v15, v16 = lab.LabelsFor(k)
if #v15 > 0 then
picker.CategoryOf = v16
pcall(handle.SetOptions, handle, v15, nil, false)
end
end
end
end
tbl4.Lab.PoolOf = function(arg)
local lab = tbl4.Lab
local v15 = lab.Pools[arg]
if v15 then
return v15
end
local tbl30 ={}
local tbl31 ={}
local v16 = ipairs
local tbl32 = lab.Shares[tostring(arg)] or{}
for _, v17 in v16(tbl32) do
local v18 = v17[1]
local v19 = v17[2]
if v19 >= 0.05 then
tbl30[v18] = true
end
table.insert(tbl31,{Category = v18, Share = v19})
end
lab.Pools[arg] = tbl30
lab.PoolLists[arg] = tbl31
return tbl30
end
tbl4.Lab.IsLabPet = function(arg)
local lab = tbl4.Lab
if not lab.PetSet then
local petSet ={}
local data = lab.Data
if type(data) == "table" and type(data.Banners) == "table" then
for _, banner in ipairs(data.Banners) do
local v15 = ipairs
local pets = type(banner) == "table" and type(banner.Pets) == "table" and banner.Pets or{}
for _, pet in v15(pets) do
if type(pet) == "table" and pet.AssetId ~= nil then
petSet[tostring(pet.AssetId)] = true
end
end
end
end
if next(petSet) == nil then
return false
end
lab.PetSet = petSet
end
return lab.PetSet[tostring(arg)] == true
end
tbl4.Lab.StockActive = function()
return next(tbl4.Lab.Stock) ~= nil
end
tbl4.Lab.StockTargets = function()
local lab = tbl4.Lab
local tbl30 ={}
if not tbl4.Steal.RiftPriority or not lab.StockActive() then
return tbl30
end
for k in pairs(lab.Stock) do
local tbl31 = lab.StockEggs[k]
local v15 = pairs
tbl31 = type(tbl31) == "table" and tbl31 or{}
for k2 in v15(tbl31) do
tbl30[k2] = lab.StockPer
end
end
return tbl30
end
tbl4.Lab.Data = fn2(function()
return ReplicatedStorage.Data.ScrambleTradeIn
end)
tbl4.Lab.Fallback ={
{Id = "Biohazard", Name = "Biohazard Pets"},
{Id = "Experimental", Name = "Experimental Pets"},
{Id = "UnstableDNA", Name = "Unstable DNA"},
}
tbl4.Lab.BannerList = function()
local data = tbl4.Lab.Data
local tbl30 ={}
if type(data) == "table" and type(data.Banners) == "table" then
for _, banner in ipairs(data.Banners) do
if type(banner) == "table" and banner.Id ~= nil then
table.insert(tbl30,{Id = tostring(banner.Id), Name = tostring(banner.DisplayName or banner.Id)})
end
end
end
if #tbl30 == 0 then
return tbl4.Lab.Fallback
end
return tbl30
end
tbl4.Lab.BannerName = function(arg)
for _, v15 in ipairs(tbl4.Lab.BannerList()) do
if v15.Id == tostring(arg) then
return v15.Name
end
end
return tostring(arg)
end
tbl4.Lab.BannerOk = function(arg)
if next(tbl4.Lab.Banners) == nil then
return true
end
return arg ~= nil and tbl4.Lab.Banners[tostring(arg)] == true
end
tbl4.Lab.PickedText = function()
local tbl30 ={}
for _, v15 in ipairs(tbl4.Lab.BannerList()) do
if tbl4.Lab.Banners[v15.Id] then
table.insert(tbl30, v15.Name)
end
end
return table.concat(tbl30, " or ")
end
local flag
flag = false
local tbl30
tbl30 ={}
local n6
n6 = 0
v4 = tbl5[4]
local n7
n7 = 27.4
local n8
n8 = 400
local fn12
fn12 = nil
v5 = v9:CreateToggle({
Name = "Auto Steal",
Default = false,
Callback = function()
if fn12 then
fn12()
end
end,
})
tbl4.SafeCarry.InstantHandle = v9:CreateToggle({
Name = "Instant Steal",
Note = "Delivers the egg to the safe zone in a few seconds, needs enough Speed",
Default = false,
Callback = function(arg)
if type(arg) ~= "boolean" then
arg = tbl4.Toggle(tbl4.SafeCarry.InstantHandle, false)
end
tbl4.SafeCarry.LineDrop = arg ~= false
tbl4.SafeCarry.SpeedJitter = tbl4.SafeCarry.LineDrop and 0 or 0.08
if tbl4.StealPanelSync then
pcall(tbl4.StealPanelSync)
end
end,
})
for _, v15 in ipairs(tbl23) do
tbl25[v15] = true
end
fn6(v9:CreateMultiDropdown({
Name = "Target Areas",
Options = tbl23,
Default = tbl23,
Callback = function(arg)
local tbl31 ={}
if type(arg) == "table" then
for k, v15 in pairs(arg) do
if v15 == true and type(k) == "string" then
tbl31[k] = true
elseif type(v15) == "string" then
tbl31[v15] = true
end
end
end
if next(tbl31) == nil then
for _, v15 in ipairs(tbl23) do
tbl31[v15] = true
end
end
tbl25 = tbl31
end,
}))
v9:CreateDropdown({
Name = "Min Rarity",
Note = "Steal eggs of the chosen rarity and every rarity above it",
Options = tbl12,
Default = tbl12[1],
Callback = function(arg)
n5 = tbl13[arg] or 0
end,
})
fn5(v9,{
Name = "Min Steal Value",
Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
Legacy = "Min Value To Steal",
SectionName = "Auto Steal",
OnRaw = function(arg)
n6 = arg
end,
})
do
local tbl31 ={}
local tbl32 ={}
local directory = tbl.Assets and tbl.Assets.Directory
local tbl33 ={}
if type(directory) == "table" then
for k, v15 in pairs(directory) do
local rarity = type(v15) == "table" and v15.Rarity or nil
local rarity2 = type(rarity) == "table"
if rarity2 then
rarity2 = tonumber(rarity.RarityNumber or rarity.Rank)
end
rarity2 = rarity2 or nil
if rarity2 then
local insert = table.insert
local tbl34 ={Category = tostring(k)}
local v16 = tostring
k = v15.DisplayName or k
tbl34.Name = v16(k)
tbl34.Rarity = rarity2
tbl34.RarityName = tostring(rarity.DisplayName or rarity._id or rarity2)
insert(tbl33, tbl34)
end
end
end
table.sort(tbl33, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity > arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v15 in ipairs(tbl33) do
local str2 = string.format("%s [%s]", v15.Name, v15.RarityName)
if tbl32[str2] then
str2 = string.format("%s [%s] (%s)", v15.Name, v15.RarityName, v15.Category)
end
table.insert(tbl31, str2)
tbl32[str2] = v15.Category
end
fn6(v9:CreateMultiDropdown({
Name = "Target Specific Eggs",
Note = "Only steal these eggs (empty = all)",
Options = tbl31,
Default ={},
Callback = function(arg)
local tbl34 ={}
if type(arg) == "table" then
for k, v15 in pairs(arg) do
local flag2 = v15 == true and type(k) == "string" and k or type(v15) == "string" and v15 or nil
if flag2 and tbl32[flag2] then
tbl34[tbl32[flag2]] = true
end
end
end
tbl26 = tbl34
end,
}))
end
do
local n9 = 30
local v15 = nil
local flag2 = false
local n10 = 0
local function fn13()
local tbl31 ={}
local save = tbl.Save
if type(save) == "table" and type(save.Get) == "function" then
local ok, result = pcall(save.Get)
if ok and type(result) == "table" then
local tbl32 ={}
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if ok2 and type(result2) == "table" then
for k, v16 in pairs(result2) do
if type(v16) == "table" and v16.Placement ~= nil then
tbl32[k] = true
end
end
end
end
local v16 = pairs
local eggInventory = result.EggInventory or{}
for k, v17 in v16(eggInventory) do
if type(v17) == "table" and v17.AssetCategory ~= nil and not tbl32[k] then
local str2 = tostring(v17.AssetCategory)
tbl31[str2] =(tbl31[str2] or 0) + 1
end
end
end
end
return tbl31
end
local function fn14()
local lab = tbl4.Lab
local tbl31 ={}
tbl4.Steal.RiftCurrent ={}
local tbl32 = nil
if lab.StockActive() then
tbl32 = fn13()
for k, v16 in pairs(lab.StockTargets()) do
if(tbl32[k] or 0) < v16 then
tbl31[k] = true
end
end
local riftBanner = tbl4.Steal.RiftBanner
if riftBanner == nil or not lab.Stock[riftBanner] then
return tbl31
end
end
local tbl33 ={}
for _, riftRequirement in ipairs(tbl4.Steal.RiftRequirements) do
tbl33[riftRequirement] =(tbl33[riftRequirement] or 0) + 1
end
if next(tbl33) == nil then
return tbl31
end
if lab.SkipOwned then
tbl32 = tbl32 or fn13()
else
tbl32 ={}
end
local riftCurrent ={}
for k, v16 in pairs(tbl33) do
if(tbl32[k] or 0) < v16 then
tbl31[k] = true
riftCurrent[k] = true
end
end
tbl4.Steal.RiftCurrent = riftCurrent
return tbl31
end
local function fn15()
local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")
local isRemoteFunction = rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction")
local flag3 = false
local result = nil
if isRemoteFunction then
flag3, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)
end
if not flag3 or type(result) ~= "table" or type(result.Requirements) ~= "table" then
if tbl4.Lab.StockActive() then
tbl4.Steal.RiftNeeds = fn14()
end
return
end
tbl4.Steal.RiftBanner = result.BannerId ~= nil and tostring(result.BannerId) or nil
local riftRequirements ={}
if result.Unlocked ~= false and tbl4.Lab.BannerOk(result.BannerId) then
for _, requirement in ipairs(result.Requirements) do
table.insert(riftRequirements, tostring(requirement))
end
end
tbl4.Steal.RiftRequirements = riftRequirements
tbl4.Steal.RiftNeeds = fn14()
end
tbl3.Add(function()
if not tbl4.Steal.RiftPriority or flag2 or os.clock() < n10 then
return false
end
flag2 = true
n10 = os.clock() + n9
task.spawn(function()
pcall(fn15)
flag2 = false
end)
return false
end)
local function recount()
if not tbl4.Steal.RiftPriority then
return
end
local riftNeeds = tbl4.Steal.RiftNeeds
local v16 = fn14()
local flag3 = false
for k in pairs(riftNeeds) do
if not v16[k] then
flag3 = true
end
end
for k in pairs(v16) do
if not riftNeeds[k] then
flag3 = true
end
end
tbl4.Steal.RiftNeeds = v16
if flag3 then
tbl3.Wake()
end
end
tbl4.Lab.Recount = recount
local save = tbl.Save
if type(save) == "table" and type(save.FieldSignal) == "function" then
for _, v16 in ipairs({"EggInventory", "Inventory"}) do
local ok, result = pcall(save.FieldSignal, v16)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
task.defer(recount)
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
tbl4.Lab.ForceSteal = function()
n10 = 0
end
v15 = v9:CreateToggle({
Name = "Steal Missing Lab Eggs",
Default = false,
Callback = function()
tbl4.Steal.RiftPriority = tbl4.Toggle(v15, false) == true
n10 = 0
if not tbl4.Steal.RiftPriority then
tbl4.Steal.RiftNeeds ={}
end
task.delay(0.3, function()
pcall(tbl4.Lab.FixPickers)
end)
tbl3.Wake()
end,
})
v9:CreateToggle({
Name = "Skip Owned Lab Eggs",
Note = "Only for the current recipe",
Default = true,
ShowWhen = v15,
Callback = function(arg)
tbl4.Lab.SkipOwned = arg ~= false
pcall(recount)
end,
})
local tbl31 ={}
local tbl32 ={}
for _, v16 in ipairs(tbl4.Lab.BannerList()) do
table.insert(tbl31, v16.Name)
tbl32[v16.Name] = v16.Id
end
v9:CreateMultiDropdown({
Name = "Stock Lab Eggs For",
Note = "Collects eggs for these banners even before they open",
Options = tbl31,
Default ={},
ShowWhen = v15,
Callback = function(arg)
local stock ={}
if type(arg) == "table" then
for k, v16 in pairs(arg) do
k = v16 == true and type(k) == "string" and k or type(v16) == "string" and v16 or nil
if k and tbl32[k] then
stock[tbl32[k]] = true
end
end
end
tbl4.Lab.Stock = stock
n10 = 0
task.spawn(function()
pcall(recount)
end)
tbl3.Wake()
end,
})
local ok, result = pcall(function()
local directory = tbl.Assets and tbl.Assets.Directory
local tbl33 ={Biohazard = "Biohazard", Experimental = "Experimental", UnstableDNA = "Unstable DNA"}
tbl4.Lab.LabelsFor = function(arg)
local tbl34 ={}
local tbl35 ={}
tbl4.Lab.PoolOf(arg)
local tbl36 = tbl4.Lab.PoolLists[arg] or{}
for _, v16 in ipairs(tbl36) do
local flag3 = type(directory) == "table" and directory[v16.Category] or nil
local n11 = v16.Share * 100
local str2 = n11 < 1 and "<1%" or string.format("%d%%", math.floor(n11 + 0.5))
local str3 = string.format("%s Egg (%s)", tostring(type(flag3) == "table" and flag3.DisplayName or v16.Category), str2)
if tbl35[str3] then
local format = string.format
local v17 = tostring
local displayName = type(flag3) == "table" and flag3.DisplayName or v16.Category
local category = v16.Category
str3 = format("%s Egg [%s] (%s)", v17(displayName), category, str2)
end
table.insert(tbl34, str3)
tbl35[str3] = v16.Category
end
return tbl34, tbl35
end
for _, v16 in ipairs(tbl4.Lab.BannerList()) do
local id = v16.Id
local v17, v18 = tbl4.Lab.LabelsFor(id)
local tbl34 ={CategoryOf = v18}
tbl4.Lab.Pickers[id] = tbl34
local tbl35 ={}
for i = 1, math.min(5, #v17) do
table.insert(tbl35, v17[i])
end
tbl34.Handle = v9:CreateMultiDropdown({
Name =(tbl33[id] or v16.Name).. " Lab Eggs",
Options = v17,
Default = tbl35,
ShowWhen = v15,
Callback = function(arg)
local tbl36 ={}
if type(arg) == "table" then
for k, v19 in pairs(arg) do
k = v19 == true and type(k) == "string" and k or type(v19) == "string" and v19 or nil
if k and tbl34.CategoryOf[k] then
tbl36[tbl34.CategoryOf[k]] = true
end
end
end
tbl4.Lab.StockEggs[id] = next(tbl36) ~= nil and tbl36 or nil
n10 = 0
task.spawn(function()
pcall(recount)
end)
tbl3.Wake()
end,
})
end
end)
if not ok then
warn("[Zyro Hub] Lab egg pickers failed: ".. tostring(result))
end
task.spawn(function()
pcall(tbl4.Lab.RefreshPools)
end)
v9:CreateSlider({
Name = "Stock Per Egg",
Min = 1,
Max = 30,
Default = 3,
Increment = 1,
Unit = "",
ShowWhen = v15,
Callback = function(arg)
tbl4.Lab.StockPer = math.clamp(math.floor(tonumber(arg) or 3), 1, 30)
task.spawn(function()
pcall(recount)
end)
end,
})
end
do
local n9 = 5
local n10 = 5
local n11 = 60
local v15 = nil
local n12 = 0
local n13 = 0
local flag2 = false
local tbl31 ={}
local function fn13()
local save = tbl.Save
if type(save) == "table" and type(save.Get) == "function" then
local ok, result = pcall(save.Get)
if ok and type(result) == "table" then
return result
end
end
return nil
end
local function fn14()
local v16 = fn13()
local directory = tbl.Areas and tbl.Areas.Directory
local directory2 = tbl.Assets and tbl.Assets.Directory
if not v16 or type(directory) ~= "table" or type(directory2) ~= "table" then
return
end
local index = type(v16.Index) == "table" and v16.Index or{}
local tbl32 ={}
local v17 = pairs
local inventory = v16.Inventory or{}
for _, v18 in v17(inventory) do
if type(v18) == "table" and v18.Category ~= nil then
tbl32[tostring(v18.Category)] = true
end
end
local v18 = pairs
local eggInventory = v16.EggInventory or{}
for _, v19 in v18(eggInventory) do
if type(v19) == "table" and v19.AssetCategory ~= nil then
tbl32[tostring(v19.AssetCategory)] = true
end
end
local tbl33 ={}
for _, v19 in pairs(directory) do
local flag3 = type(v19) == "table" and type(v19.Rarity) == "table"
if flag3 then
flag3 = tonumber(v19.Rarity.RarityNumber or v19.Rarity.Rank)
end
flag3 = flag3 or 0
local v20 = pairs
local dropTable = type(v19) == "table" and v19.DropTable or{}
for _, v21 in v20(dropTable) do
local flag4 = type(v21) == "table" and v21[1] or nil
local n14 = type(v21) == "table" and tonumber(v21[2]) or 0
local flag5 = flag4 ~= nil and directory2[flag4] or nil
if type(flag5) == "table" and n14 > 0 and flag5.DontRoll ~= true then
local str2 = tostring(flag4)
if index[flag4] ~= true and not tbl32[str2] and(tbl33[str2] == nil or flag3 > tbl33[str2]) then
tbl33[str2] = flag3
end
end
end
end
tbl30 = tbl33
end
local function fn15(arg,...)
local v16 = networking:FindFirstChild(arg)
if not v16 or not v16:IsA("RemoteFunction") then
return false
end
local ok, result = pcall(v16.InvokeServer, v16,...)
return ok and result ~= false
end
local function fn16(arg, arg2)
local tbl32 ={}
if type(arg) ~= "table" then
return tbl32
end
for _, v16 in ipairs(arg2) do
local flag3 = arg
for _, v17 in ipairs(v16) do
flag3 = type(flag3) == "table" and flag3[v17] or nil
end
local v17 = ipairs
flag3 = type(flag3) == "table" and flag3 or{}
for _, v18 in v17(flag3) do
if type(v18) == "table" and v18.AssetId ~= nil then
table.insert(tbl32, v18.AssetId)
end
end
end
return tbl32
end
local tbl32 ={
{
Id = "LimitedEgg",
Gear = "GravityDisruptor",
Module = "LimitedEgg",
Lists ={{"Entries"},{"MechaReroll", "Entries"}},
},
{
Id = "BrainrotEgg",
Gear = "BeeLauncher",
Module = "BrainrotEgg",
Lists ={{"Entries"}},
},
{
Id = "MonsterEgg",
Gear = "BeeLauncher",
Module = "MonsterEgg",
Lists ={{"Entries"},{"MechaEntries"}},
},
}
local function fn17()
local v16 = fn13()
if not v16 then
return
end
local index = type(v16.Index) == "table" and v16.Index or{}
local indexClaimedCategories = type(v16.IndexClaimedCategories) == "table" and v16.IndexClaimedCategories or{}
for k, v17 in pairs(index) do
if v17 == true and indexClaimedCategories[k] ~= true then
fn15("RF/Codex/AskRedeemAll")
break
end
end
local gearInventory = type(v16.GearInventory) == "table" and v16.GearInventory or{}
for _, v17 in ipairs(tbl32) do
local flag3 =(tonumber(gearInventory[v17.Gear]) or 0) <= 0
if flag3 then
flag3 = os.clock() >=(tbl31[v17.Id] or 0)
end
if flag3 then
local v18 = fn16(tbl[v17.Module], v17.Lists)
local flag4 = #v18 > 0
for _, v19 in ipairs(v18) do
if index[v19] ~= true then
flag4 = false
break
end
end
if flag4 then
tbl31[v17.Id] = os.clock() + n11
fn15("RF/Codex/AskRedeemLimitedEgg", v17.Id)
end
end
end
end
tbl3.Add(function()
local now = os.clock()
if flag and now >= n12 then
n12 = now + n9
pcall(fn14)
end
if not flag2 and now >= n13 and tbl4.Toggle(tbl4.IndexClaimHandle, false) then
flag2 = true
n13 = now + n10
task.spawn(function()
pcall(fn17)
flag2 = false
end)
end
return false
end)
v15 = v9:CreateToggle({
Name = "Steal Missing Index Eggs",
Note = "Also steal eggs missing from your index, highest area first",
Default = false,
Callback = function()
flag = tbl4.Toggle(v15, false) == true
n12 = 0
if not flag then
tbl30 ={}
end
tbl3.Wake()
end,
})
tbl4.IndexClaimRestart = function()
n13 = 0
tbl3.Wake()
end
end
tbl4.Steal.PriorityHandle = v9:CreateDropdown({
Name = "Steal Priority",
Options = tbl5,
Default = tbl5[4],
Callback = function(arg)
if table.find(tbl5, arg) then
v4 = arg
if type(tbl4.ResortSteal) == "function" then
tbl4.ResortSteal()
end
end
end,
})
tbl4.SafeCarry.RunHandle = v9:CreateSlider({
Name = "Tween Speed",
Note = "Over 100% may glitch",
Min = 50,
Max = 120,
Default = 100,
Increment = 1,
Unit = "%",
Callback = function(arg)
tbl4.SafeCarry.RunSpeed = math.clamp(tonumber(arg) or 100, 50, 120) / 100
end,
})
v9:CreateSlider({
Name = "Carry Speed",
Min = 80,
Max = 120,
Default = 100,
Increment = 1,
Unit = "%",
Callback = function(arg)
tbl4.SafeCarry.CarryScale = math.clamp(tonumber(arg) or 100, 80, 120) / 100
end,
})
tbl4.BossPortalUp = function()
return workspace:FindFirstChild("ScrambleArenaPortal") ~= nil
end
tbl4.AntiGuard.Handle = v2:CreateState({Name = "Anti Guard Enabled", Default = false})
pcall(function()
tbl4.AntiGuard.Enabled = tbl4.AntiGuard.Handle:Get() == true
end)
pcall(function()
tbl4.AntiGuard.Handle:Subscribe(function(arg)
if type(arg) ~= "boolean" then
arg = tbl4.AntiGuard.Handle:Get()
end
tbl4.AntiGuard.Enabled = arg == true
if tbl4.StealPanelSync then
pcall(tbl4.StealPanelSync)
end
if tbl4.AntiGuard.Render and tbl4.UiDefer then
tbl4.UiDefer(function()
pcall(tbl4.AntiGuard.Render, false)
end)
end
end)
end)
tbl4.AntiGuard.PanelHandle = v9:CreateToggle({
Name = "Anti Guard Panel",
Default = true,
Callback = function(panelShown)
if type(panelShown) ~= "boolean" then
panelShown = tbl4.Toggle(tbl4.AntiGuard.PanelHandle, true)
end
tbl4.AntiGuard.PanelShown = panelShown
if tbl4.AntiGuard.ShowPanel then
pcall(tbl4.AntiGuard.ShowPanel, panelShown)
end
end,
})local v15
v15 = nil
local v16
v16 = nil
local v17
v17 = nil
local str2
str2 = "None"
local str3
str3 = "Idle"
local flag2
flag2 = false
local n9
n9 = 0
local tbl31
tbl31 ={}
local n10
n10 = 20
local uid
uid = nil
local fn13
fn13 = function(arg)
return arg ~= n9 or not tbl4.Toggle(v15, false)
end
local fn14
do
local tbl32 ={}
local function fn15(arg)
if type(arg) ~= "number" or tbl32[arg] then
return
end
tbl32[arg] = true
task.delay(math.max(0, arg - workspace:GetServerTimeNow()) + 0.05, function()
tbl32[arg] = nil
tbl3.Wake()
end)
end
local n11 = 0
fn14 = function()
local areaEggCycle = tbl.AreaEggCycle
if type(areaEggCycle) ~= "table" then
return nil
end
local ok, result, result2, result3, result4 = pcall(function()
local serverTimeNow = workspace:GetServerTimeNow()
local nextResetTime = areaEggCycle.NextResetTime
return serverTimeNow, areaEggCycle.IsNightPhase(serverTimeNow), areaEggCycle.NextNightTime(serverTimeNow), nextResetTime(serverTimeNow)
end)
if not ok or type(result4) ~= "number" then
return nil
end
if result2 == true then
n11 = result4 + tbl4.WallOpenDelay()
fn15(n11)
return n11, "night", result
end
if tbl4.WallSealed() then
fn15(result + 0.3)
return math.max(n11, result), "wall", result
end
if type(result3) == "number" and result3 > result then
fn15(result3)
end
return nil
end
end
do
local areaEggResetWall = tbl.AreaEggResetWall
local changed = type(areaEggResetWall) == "table" and areaEggResetWall.Changed or nil
if changed and type(changed.Connect) == "function" then
local ok, result = pcall(function()
return changed:Connect(function()
tbl3.Wake()
end)
end)
if ok and result then
fn4(function()
pcall(function()
result:Disconnect()
end)
end)
end
end
end
local n11
n11 = 8
local v18
v18 = nil
local n12
n12 = 0
local fn15, fn16, fn17
local function fn18(arg)
local tbl32 ={}
local str4 = "FirstAreaEgg_".. tostring(localPlayer.UserId)
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
task.spawn(function()
local ok, result = pcall(eggState.ReadFieldEggs)
if ok and type(result) == "table" and type(result.Records) == "table" then
for _, record in pairs(result.Records) do
local flag3 = type(record) == "table" and type(record.Uid) == "string"
if flag3 then
flag3 = not(arg and string.sub(record.Uid, 1, #str4) == str4)
end
if flag3 then
tbl32[record.Uid] = true
end
end
end
end)
end
return tbl32
end
fn15 = function()
if v18 == nil then
return false
end
if tbl4.IsNight() then
return true
end
if n12 == math.huge then
n12 = os.clock() + n11
end
return false
end
fn16 = function()
if v18 and n12 == math.huge then
return
end
v18 = fn18(true)
n12 = math.huge
table.clear(tbl27)
table.clear(tbl29)
table.clear(tbl28)
table.clear(tbl31)
uid = nil
end
fn17 = function()
if not v18 then
return false
end
if n12 <= os.clock() then
v18 = nil
return false
end
local v19 = fn18()
if next(v19) == nil then
return true
end
local flag3 = false
local flag4 = false
for k in pairs(v19) do
if v18[k] then
flag3 = true
else
flag4 = true
end
end
if not flag3 then
v18 = nil
return false
end
return not flag4
end
local fn19
do
local function fn20(arg)
local directory = tbl.Assets and tbl.Assets.Directory
local flag3 = type(directory) == "table" and directory[tostring(arg)] or nil
local rarity = type(flag3) == "table" and type(flag3.Rarity) == "table" and flag3.Rarity or nil
local tbl32 ={}
if rarity then
rarity = tonumber(rarity.RarityNumber or rarity.Rank)
end
tbl32.RarityNumber = rarity or 0
tbl32.EarningRate = type(flag3) == "table" and tonumber(flag3.EarningRate) or 0
return tbl32
end
local function fn21(arg)
local mutations = tbl.Mutations
if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
local ok, result = pcall(mutations.EarningsFor, type(arg) == "table" and arg or{})
if ok and type(result) == "number" then
return result
end
end
return 1
end
local function fn22(arg, arg2)
local eggRecords = tbl.EggRecords
if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
local ok, result = pcall(eggRecords.WeightKgForScale, arg, arg2)
if ok and type(result) == "number" then
return result
end
end
return 0
end
fn19 = function(arg, arg2)
local records = nil
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
task.spawn(function()
local ok, result = pcall(eggState.ReadFieldEggs)
if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
records = result.Records
end
end)
end
if not records then
local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
return{}
end
local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
records = ok and type(result) == "table" and result.Records or nil
end
if type(records) ~= "table" then
return{}
end
local tbl32 ={}
local tbl33 ={}
for _, record in pairs(records) do
local uid2 = type(record) == "table" and record.Uid or nil
if uid2 and record.State ~= "Claimed" then
tbl33[uid2] = true
end
local flag3 = record.State == "Carried" and arg2 == true and arg ~= true and not(tbl4.Steal.Carrying and uid2 == tbl4.Steal.CarryUid)
local flag4
if uid2 then
flag4 = record.State == "Slot" or record.State == "Dropped" or flag3
else
flag4 = uid2
end
local v19 = uid2 and tbl27[uid2] or nil
local flag5 = uid2 and tbl28[uid2] == true or false
local flag6 = arg ~= true and flag and uid2 and tbl30[tostring(record.AssetCategory)] or nil
local flag7 = arg ~= true and tbl4.Steal.RiftPriority == true and uid2 ~= nil and tbl4.Steal.RiftNeeds[tostring(record.AssetCategory)] == true
local flag8 = arg == true or v19 ~= nil or flag5 or flag7 or flag6 ~= nil or tbl25[tostring(record.AreaId)] == true
local flag9 = arg ~= true and v19 == nil and tbl29[uid2] == true
local flag10 = v18 ~= nil and v18[uid2] == true
flag4 = flag4 and typeof(record.BottomCFrame) == "CFrame"
if flag4 then
flag4 =(tbl31[uid2] or 0) <= os.clock()
end
if flag4 and flag8 and not flag9 and not flag10 then
local v20 = fn20(record.AssetCategory)
local str4 = tostring(record.AssetCategory)
local flag11 = v20.RarityNumber >= n5
local flag12 = next(tbl26) == nil or tbl26[str4] == true
local n13 = tonumber(record.AssetScale) or 1
local v21 = fn21(record.Mutations)
local n14 = n13 > 5 and(n13 / 5) ^ 1.2 * 19.637875755794113 or n13 ^ 1.85
local flag13 = n6 <= 0 or v20.EarningRate * n14 * v21 >= n6
flag13 = flag11 and flag12 and flag13
local flag14 = flag7 and not flag13 and not flag5 and v19 == nil and flag6 == nil
local lastSkip = arg ~= true and tbl4.SafeCarry.Unsafe({Uid = uid2, Category = str4})
if lastSkip then
tbl27[uid2] = nil
tbl28[uid2] = nil
tbl4.SafeCarry.LastSkip = lastSkip
elseif arg == true or v19 or flag5 or flag7 or flag6 ~= nil or flag13 then
table.insert(tbl32,{
Uid = uid2,
Category = str4,
Scale = n13,
State = record.State,
Rarity = v20.RarityNumber,
Weight = fn22(record.AssetCategory, n13),
Mutation = v21,
Value = v20.EarningRate * n14 * v21,
CFrame = record.BottomCFrame,
AreaId = tostring(record.AreaId),
Rift = arg ~= true and flag7,
RiftOnly = arg ~= true and flag14,
RiftNow = arg ~= true and flag14 and tbl4.Steal.RiftCurrent[str4] == true,
Index = flag6,
Forced = arg ~= true and v19 and v19.At or nil,
Priority = arg ~= true and flag5,
})
end
end
end
if next(tbl33) ~= nil then
for k in pairs(tbl27) do
if not tbl33[k] then
tbl27[k] = nil
end
end
for k in pairs(tbl28) do
if not tbl33[k] then
tbl28[k] = nil
end
end
for k in pairs(tbl29) do
if not tbl33[k] then
tbl29[k] = nil
end
end
end
table.sort(tbl32, function(arg3, arg4)
if arg3.Forced ~= nil ~= arg4.Forced ~= nil then
return arg3.Forced ~= nil
end
if arg3.Forced and arg4.Forced and arg3.Forced ~= arg4.Forced then
return arg3.Forced < arg4.Forced
end
if arg3.Priority ~= arg4.Priority then
return arg3.Priority == true
end
if arg3.RiftOnly ~= arg4.RiftOnly then
return arg4.RiftOnly == true
end
if arg3.RiftOnly and arg3.RiftNow ~= arg4.RiftNow then
return arg3.RiftNow == true
end
if arg3.Index ~= nil ~= arg4.Index ~= nil then
return arg3.Index ~= nil
end
if arg3.Index and arg4.Index and arg3.Index ~= arg4.Index then
return arg3.Index > arg4.Index
end
if v4 == tbl5[2] and arg3.Weight ~= arg4.Weight then
return arg3.Weight > arg4.Weight
end
if v4 == tbl5[3] and arg3.Mutation ~= arg4.Mutation then
return arg3.Mutation > arg4.Mutation
end
if v4 == tbl5[4] and arg3.Value ~= arg4.Value then
return arg3.Value > arg4.Value
end
if v4 == tbl5[5] and arg3.Value ~= arg4.Value then
return arg3.Value < arg4.Value
end
if arg3.Rarity ~= arg4.Rarity then
return arg3.Rarity > arg4.Rarity
end
if arg3.Value ~= arg4.Value then
return arg3.Value > arg4.Value
end
return tostring(arg3.Uid) < tostring(arg4.Uid)
end)
return tbl32
end
end
local n13
n13 = 6
local fn20, fn21, fn22, fn23, fn24
do
local v19 = nil
local connection = nil
fn20 = function(arg, arg2, arg3, arg4, arg5)
local n14 = arg2 - arg.Position
local magnitude = n14.Magnitude
local n15 = math.max(arg4, 0.0041666666666666666)
local vector = Vector3.zero
if magnitude > 0.01 then
vector = n14.Unit * math.min(arg3, magnitude / n15)
end
local assemblyLinearVelocity = vector + Vector3.new(0, workspace.Gravity * n15 * 0.5, 0)
if magnitude > 2 then
if not arg5.mark then
arg5.mark = magnitude
arg5.clock = 0
end
arg5.clock = arg5.clock + arg4
if arg5.clock >= 0.4 then
if arg5.mark - magnitude < arg3 * 0.1 then
pcall(function()
arg.CFrame = arg.CFrame + n14.Unit * math.min(magnitude, arg3 * n15)
end)
end
arg5.mark = magnitude
arg5.clock = 0
end
else
arg5.mark = nil
end
pcall(function()
arg.AssemblyLinearVelocity = assemblyLinearVelocity
arg.AssemblyAngularVelocity = Vector3.zero
end)
return magnitude <= 0.5
end
fn21 = function()
local v20 = tbl4.Root()
if v20 then
pcall(function()
v20.AssemblyLinearVelocity = Vector3.zero
v20.AssemblyAngularVelocity = Vector3.zero
end)
end
end
local connection2 = nil
local tbl32 ={}
fn22 = function()
v19 = nil
if connection then
connection:Disconnect()
connection = nil
end
if connection2 then
connection2:Disconnect()
connection2 = nil
end
end
fn23 = function()
local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
return num ~= nil and num > workspace:GetServerTimeNow()
end
local flag3 = false
local function fn25()
if flag3 then
return true
end
return true
end
fn24 = function(arg, arg2)
v19 = arg
flag3 = arg2 == true
local v20 = connection
local flag4
if connection then
flag4 = v20
else
flag4 = not arg
end
if flag4 then
return
end
tbl32 ={}
connection = RunService.Heartbeat:Connect(function()
if not v19 or fn25() or fn23() or tbl4.AntiGuard.Busy then
return
end
local v21 = tbl4.Root()
if not v21 then
return
end
pcall(function()
local rotation = v21.CFrame.Rotation
v21.CFrame = CFrame.new(v19) * rotation
v21.AssemblyLinearVelocity = Vector3.zero
v21.AssemblyAngularVelocity = Vector3.zero
end)
end)
connection2 = RunService.PreSimulation:Connect(function(deltaTime)
if not v19 or not fn25() or fn23() or tbl4.AntiGuard.Busy then
return
end
local v21 = tbl4.Root()
if v21 then
fn20(v21, v19, 400, deltaTime, tbl32)
end
end)
end
end
fn4(fn22)
local fn25
fn25 = function()
fn22()
tbl4.EndFlight()
tbl4.GodMode(false)
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if character then
character.PlatformStand = false
end
end
local n14, fn26, fn27
do
local n15 = 1.5
n14 = 0.6
local function fn28(arg, arg2)
local x = arg2.X
return(Vector3.new(arg.X, 0, arg.Z) - Vector3.new(x, 0, arg2.Z)).Magnitude
end
local function fn29(arg)
local ok, result = pcall(function()
return arg:GetPivot().Position
end)
return ok and result or nil
end
fn26 = function(arg, arg2, arg3)
local v19 = fn28(arg.Position, arg3)
local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
if areaEggSlotsClient then
for _, child in ipairs(areaEggSlotsClient:GetChildren()) do
if child:IsA("Model") and child.Name ~= arg2 then
local v20 = fn29(child)
if v20 and fn28(v20, arg.Position) + n15 < v19 then
return false
end
end
end
end
for _, child in ipairs(workspace:GetChildren()) do
if child:IsA("Model") and child.Name ~= arg2 and #child.Name == 32 and child:FindFirstChild("Hitbox") then
local v20 = fn29(child)
if v20 and fn28(v20, arg.Position) + n15 < v19 then
return false
end
end
end
return true
end
tbl4.Steal.WrongEgg = function(carryUid)
local steal = tbl4.Steal
if type(carryUid) ~= "string" or not steal.Carrying or steal.CarryUid == carryUid then
return false
end
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
local n16 = 0
while steal.Carrying and n16 < 1 do
n16 += RunService.Heartbeat:Wait()
end
steal.Carrying = false
steal.CarryUid = carryUid
return true
end
fn27 = function(arg, arg2, arg3)
local n16 = arg3 or 14
local v19 = nil
local v20 = nil
for _, child in ipairs(workspace:GetChildren()) do
if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")
if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
local v21 = fn28(child.Position, arg2)
if v21 < n16 then
n16 = v21
v19 = carryAreaEgg
v20 = child
end
end
end
end
if not v19 or not v20 then
return nil
end
if type(arg) == "string" and not fn26(v20, arg, arg2) then
return nil
end
return v19, v20
end
end
local fn28
fn28 = function(arg)
local eggState = tbl.EggState
if type(arg) == "string" and type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
pcall(eggState.CarryFieldEgg, arg)
end
end
local fn29
do
local function fn30()
local carryUid = tbl4.Steal.CarryUid
return type(carryUid) == "string" and carryUid or nil
end
local function fn31(arg)
local v19 = fn30()
if not v19 or type(arg) ~= "string" then
return true
end
return v19 == arg
end
local function fn32(arg)
if type(arg) ~= "string" then
return false
end
local v19 = fn19(false, true)
if #v19 == 0 then
return true
end
for _, v20 in ipairs(v19) do
if v20.Uid == arg then
return true
end
end
return false
end
local function fn33(arg)
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
local n15 = 0
while tbl4.Steal.Carrying and n15 < 1 and not fn13(arg) do
n15 += RunService.Heartbeat:Wait()
end
end
fn29 = function(arg, arg2)
local n15 = 0
while not tbl4.Steal.Carrying and n15 < n14 and not fn13(arg2) do
n15 += RunService.Heartbeat:Wait()
end
if not tbl4.Steal.Carrying then
str3 = "The egg never reached the hand"
return false
end
if fn31(arg) then
return true
end
local v19 = fn30()
if fn32(v19) then
str3 = "Holding another egg that still matches, delivering it"
return true
end
str3 = "Wrong egg in hand, dropping it"
fn33(arg2)
return false
end
end
local fn30
fn30 = function(arg, arg2)
local eggState = tbl.EggState
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not position then
return false
end
local n15 = 0
local huge = math.huge
local n16 = 0
while n15 < 1.5 do
if fn13(arg2) then
return false
end
if tbl4.Steal.Carrying and not tbl4.Steal.WrongEgg(arg.Uid) then
return true
end
if huge >= 0.06 then
local v19 = fn27(arg.Uid, position)
if v19 then
pcall(function()
v19.HoldDuration = 0
end)
n16 = 0
if typeof(fireproximityprompt) == "function" then
pcall(fireproximityprompt, v19)
end
else
n16 += 1
if n16 >= 4 then
return false
end
if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
pcall(eggState.CarryFieldEgg, arg.Uid)
end
end
huge = 0
end
local result = RunService.Heartbeat:Wait()
n15 += result
huge += result
end
return tbl4.Steal.Carrying == true
end
local fn31
local v19 = fn2(function()
return ReplicatedStorage.Shared.Modules.Ragdoll
end)
fn31 = function()
local character = localPlayer.Character
if type(v19) == "table" and type(v19.IsRagdolled) == "function" then
local ok, result = pcall(v19.IsRagdolled, character)
if ok and result == true then
return true
end
end
local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
if num and num > workspace:GetServerTimeNow() then
return true
end
character = character and character:FindFirstChildOfClass("Humanoid")
if character then
local state = character:GetState()
return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
end
return false
end
local fn32
fn32 = function(arg, arg2)
if tbl4.Steal.Carrying then
return true
end
local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
return false
end
local n15 = 0
while n15 < 1 do
if fn13(arg2) or tbl4.Steal.Carrying then
return tbl4.Steal.Carrying == true
end
local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
local records = ok and type(result) == "table" and result.Records or nil
if type(records) == "table" then
local flag3 = false
for _, record in pairs(records) do
if type(record) == "table" and record.Uid == arg and(record.State == "Slot" or record.State == "Dropped") then
flag3 = true
break
end
end
if not flag3 then
return tbl4.Steal.Carrying == true
end
end
n15 += task.wait(0.3)
end
return tbl4.Steal.Carrying == true
end
local fn33
local function fn34(arg)
local v20 = tbl4.Root()
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not v20 or not position then
return math.huge
end
return(v20.Position - position).Magnitude
end
fn33 = function(arg)
local huge = math.huge
local v20 = nil
for _, v21 in ipairs(arg) do
local v22 = fn34(v21)
if v22 < huge then
huge = v22
v20 = v21
end
end
return v20, huge
end
local n15
n15 = 20
local n16
n16 = 90
local fn35, stealHome, fn36, fn37, fn38, n17
do
local n18 = 6
fn35 = function(arg, arg2, arg3, arg4, arg5, arg6)
fn22()
local v20 = tbl4.Root()
if not v20 then
return false
end
local character = localPlayer.Character
local position = v20.Position
local tbl32 ={}
local position2 = nil
local flag3 = nil
local str4 = nil
local n19 = 0
local function fn39()
if arg4 ~= nil then
return true
end
return true
end
local function fn40(arg7)
n19 += arg7
if fn13(arg2) then
flag3 = false
return nil
end
if arg3 and not tbl4.Steal.Carrying then
flag3 = false
str4 = "dropped"
return nil
end
if arg6 then
local v21 = arg6()
if v21 then
flag3 = false
str4 = v21
return nil
end
end
local v21 = tbl4.Root()
if not v21 or n19 >= 25 or localPlayer.Character ~= character then
flag3 = false
str4 = "respawned"
return nil
end
return v21
end
local connection = RunService.Heartbeat:Connect(function(deltaTime)
if flag3 ~= nil or fn39() or tbl4.AntiGuard.Busy then
return
end
local v21 = fn40(deltaTime)
if not v21 then
return
end
if(v21.Position - position).Magnitude > n13 then
if arg5 then
flag3 = false
str4 = "displaced"
return
end
position = v21.Position
end
local n20 =(arg4 or 400) *(os.clock() <(tbl4.SafeCarry.SlowUntil or 0) and tbl4.SafeCarry.SlowFactor or 1)
local n21
if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace then
n21 = math.min(n20, tbl4.SafeCarry.Pace())
else
n21 = n20
end
local n22 = arg - position
local n23 = n21 * deltaTime
local flag4 = n22.Magnitude <= math.max(n23, 0.05)
position = flag4 and arg or position + n22.Unit * n23
local vector = Vector3.new(n22.X, 0, n22.Z)
local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v21.CFrame.Rotation
pcall(function()
v21.CFrame = CFrame.new(position) * cframe
v21.AssemblyLinearVelocity = Vector3.zero
v21.AssemblyAngularVelocity = Vector3.zero
end)
if flag4 then
flag3 = true
end
end)
local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
if flag3 ~= nil or not fn39() or tbl4.AntiGuard.Busy then
return
end
local v21 = fn40(deltaTime)
if not v21 then
return
end
local n20 =(arg4 or 400) *(os.clock() <(tbl4.SafeCarry.SlowUntil or 0) and tbl4.SafeCarry.SlowFactor or 1)
local n21
if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace then
n21 = math.min(n20, tbl4.SafeCarry.Pace())
else
n21 = n20
end
if arg5 and position2 and(v21.Position - position2).Magnitude > n13 + n21 * deltaTime then
flag3 = false
str4 = "displaced"
return
end
if fn20(v21, arg, n21, deltaTime, tbl32) then
flag3 = true
end
position2 = v21.Position
position = v21.Position
end)
while flag3 == nil do
RunService.Heartbeat:Wait()
end
connection:Disconnect()
connection2:Disconnect()
if fn39() and not flag3 then
fn21()
end
if flag3 then
fn24(arg, arg4 ~= nil)
end
return flag3, str4
end
local tbl32 ={
{
Path ={"GearGiver_Slap", "Podium"},
Offset = Vector3.new(-16.415, 21.072, -6.106),
},
{
Path ={"World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"},
Offset = Vector3.new(-26.776, 1.75, 18.665),
},
{
Path ={"__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"},
Offset = Vector3.new(-26.776, 1.75, 18.665),
},
}
stealHome = function()
for _, v20 in ipairs(tbl32) do
local v21 = workspace
for _, v22 in ipairs(v20.Path) do
v21 = v21 and v21:FindFirstChild(v22) or nil
end
if v21 and v21:IsA("BasePart") then
return v21.CFrame:PointToWorldSpace(v20.Offset)
end
end
return Vector3.new(528.7, 70.57, -364.11)
end
tbl4.StealHome = stealHome
tbl4.InsideBase = function(arg)
if not arg then
local v20 = tbl4.Root()
arg = v20 and v20.Position
end
if arg == nil then
return false
end
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
return arg.X <(world and world:IsA("BasePart") and world.Position.X or 552)
end
local function fn39(arg)
if tbl4.AntiGuard.Busy then
return false
end
local character = localPlayer.Character
local v20 = tbl4.Root()
if not character or not v20 then
return false
end
local rotation = v20.CFrame.Rotation
local cFrame = CFrame.new(arg) * rotation
pcall(function()
character:PivotTo(cFrame)
end)
if(v20.Position - arg).Magnitude > 3 then
pcall(function()
v20.CFrame = cFrame
end)
end
for _, descendant in ipairs(character:GetDescendants()) do
if descendant:IsA("BasePart") then
pcall(function()
descendant.AssemblyLinearVelocity = Vector3.zero
descendant.AssemblyAngularVelocity = Vector3.zero
end)
end
end
return true
end
local function fn40(arg)
if tbl4.AntiGuard.Busy then
return
end
local character = localPlayer.Character
local v20 = tbl4.Root()
if not character or not v20 or not arg then
return
end
if(v20.Position - arg).Magnitude > 6 then
fn39(arg)
return
end
for _, descendant in ipairs(character:GetDescendants()) do
if descendant:IsA("BasePart") and descendant ~= v20 and(descendant.Position - v20.Position).Magnitude > 12 then
pcall(function()
descendant.CFrame = v20.CFrame
descendant.AssemblyLinearVelocity = Vector3.zero
end)
end
end
end
local function fn41(arg, arg2)
local n19 = 0
while true do
if not(n19 < n18) then
return not fn13(arg)
else
if fn13(arg) then
break
end
local character = localPlayer.Character
local flag3 = fn31()
if not flag3 and character then
for _, descendant in ipairs(character:GetDescendants()) do
if descendant:IsA("Constraint") and string.find(descendant.Name, "RagdollConstraint", 1, true) then
flag3 = true
break
end
end
end
if not flag3 then
return not fn13(arg)
end
fn40(arg2)
n19 += RunService.Heartbeat:Wait()
end
end
return false
end
local function fn42(arg)
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("GuardAreas")
local areaId = world and arg and arg.AreaId and world:FindFirstChild(arg.AreaId)
return areaId and areaId:FindFirstChild("Guard") or nil
end
fn36 = function(arg)
local v20 = fn42(arg)
return v20 ~= nil and v20:GetAttribute("GuardState") == "Sleeping"
end
local n19 = 3
fn37 = function(arg)
local v20 = fn42(arg)
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not v20 or not position then
return nil, nil
end
local ok, result = pcall(function()
return v20:GetPivot().Position
end)
if not ok then
return nil, nil
end
local vector = Vector3.new(position.X - result.X, 0, position.Z - result.Z)
if vector.Magnitude < 0.1 then
return nil, nil
end
local n20 = result + vector.Unit * n19
return Vector3.new(n20.X, position.Y + 3, n20.Z), result
end
local function fn43(arg, arg2)
local tbl33 ={Landed = false, Destination = arg2}
local antiGuard = tbl4.AntiGuard
antiGuard.HitArms = antiGuard.HitArms + 1
tbl4.AntiGuard.HitArmedAt = os.clock()
tbl33.Link = localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
if tbl33.Landed or fn13(arg) then
return
end
local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
if not num or num <= workspace:GetServerTimeNow() then
return
end
local v20 = tbl4.Root()
if not v20 then
return
end
tbl33.Landed = true
fn22()
tbl4.SafeCarry.JumpDistance =(tbl33.Destination - v20.Position).Magnitude
tbl4.SafeCarry.JumpAt = os.clock()
pcall(function()
v20.CFrame = CFrame.new(tbl33.Destination)
v20.AssemblyLinearVelocity = Vector3.zero
end)
end)
tbl33.Stop = function()
if tbl33.Link then
tbl33.Link:Disconnect()
tbl33.Link = nil
tbl4.AntiGuard.HitArms = math.max(0, tbl4.AntiGuard.HitArms - 1)
end
end
return tbl33
end
fn38 = function(arg, arg2, arg3)
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if character then
character.PlatformStand = false
end
local n20 = 0
local v20 = nil
while true do
if not arg2.Landed and n20 < n15 then
if not fn13(arg) then
if arg3 then
arg3(arg2)
end
if not tbl4.Steal.Carrying then
v20 = v20 or n20
if not(n20 - v20 > 1) then
n20 += RunService.Heartbeat:Wait()
continue
end
else
n20 += RunService.Heartbeat:Wait()
continue
end
end
end
break
end
arg2.Stop()
return arg2.Landed
end
n17 = 20
local function fn44(arg, arg2, arg3, arg4)
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not position then
return false
end
local n20 = 0
local huge = math.huge
while n20 < arg3 do
if fn13(arg2) then
return false
end
if tbl4.Steal.Carrying and not tbl4.Steal.WrongEgg(arg.Uid) then
return true
end
if huge >= 0.1 then
local v20 = fn27(arg.Uid, position)
if v20 then
pcall(function()
v20.HoldDuration = 0
end)
if typeof(fireproximityprompt) == "function" then
pcall(fireproximityprompt, v20)
end
else
fn28(arg.Uid)
end
huge = 0
end
if arg4 then
fn40(arg4)
end
local result = RunService.Heartbeat:Wait()
n20 += result
huge += result
end
return tbl4.Steal.Carrying == true
end
local function fn45(arg, arg2, arg3, arg4)
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not position then
return false
end
local n20 = position + Vector3.new(0, 3, 0)
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid and character:FindFirstChildWhichIsA("Tool") then
pcall(function()
humanoid:UnequipTools()
end)
end
if arg3 then
fn24(n20, true)
str3 = "Waiting to stand up"
if not fn41(arg2, n20) then
return false
end
if tbl4.SafeCarry.Enabled and arg4 == nil and tbl4.SafeCarry.Settle then
if not tbl4.SafeCarry.Settle(arg2, arg) then
return false
end
end
else
str3 = "Jumping to the egg"
local v20 = tbl4.Root()
if v20 and(n20 - v20.Position).Magnitude <= n16 then
pcall(function()
local rotation = v20.CFrame.Rotation
v20.CFrame = CFrame.new(n20) * rotation
v20.AssemblyLinearVelocity = Vector3.zero
v20.AssemblyAngularVelocity = Vector3.zero
end)
elseif not fn35(n20, arg2, nil, 400) then
return false
end
end
if fn13(arg2) then
return false
end
local flag3 = arg4 and typeof(arg4.CFrame) == "CFrame"
local v20 = nil
if flag3 then
v20 = fn43(arg2, arg4.CFrame.Position + Vector3.new(0, 3, 0))
end
local str4 = "FirstAreaEgg_".. tostring(localPlayer.UserId)
local flag4 = type(arg.Uid) == "string" and string.sub(arg.Uid, 1, #str4) == str4 and string.match(arg.Uid, "_([%w ]+:Slot_%d+)$") or nil
local v21 = arg4 and flag4
local flag5 = false
if v21 then
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
str3 = "Taking the starter egg"
task.spawn(function()
pcall(eggState.CarryFieldEgg, arg.Uid, flag4)
end)
local n21 = 0
while not tbl4.Steal.Carrying and n21 < 0.8 do
if fn13(arg2) then
return false
end
n21 += RunService.Heartbeat:Wait()
end
flag5 = tbl4.Steal.Carrying == true
end
end
if not flag5 then
str3 = "Taking the egg"
local v22 = fn30(arg, arg2)
if not v22 and not fn13(arg2) then
fn35(n20, arg2, nil, 400)
flag5 = fn30(arg, arg2)
else
flag5 = v22
end
end
if not flag5 and not fn32(arg.Uid, arg2) then
if v20 then
v20.Stop()
end
tbl31[arg.Uid] = os.clock() + n10
str3 = "That egg would not come free"
return false
end
if v20 then
local reGuardPatrolForestStrike = networking:FindFirstChild("RE/GuardPatrol/ForestStrike")
local v22 = fn42(arg) or fn42({AreaId = "Forest"})
local humanoidRootPart = v22 and v22:FindFirstChild("HumanoidRootPart")
if reGuardPatrolForestStrike and reGuardPatrolForestStrike:IsA("RemoteEvent") and humanoidRootPart then
str3 = "Calling the guard strike"
pcall(function()
reGuardPatrolForestStrike:FireServer({EggUid = arg.Uid, GuardCFrame = humanoidRootPart.CFrame})
end)
end
end
tbl4.Steal.LastFinishedAt = os.clock()
return true, v20
end
local huge = math.huge
local huge2 = math.huge
local function fn46(arg, arg2, arg3)
local v20 = nil
local v21 = nil
for _, child in ipairs(workspace:GetChildren()) do
if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")
if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
local magnitude =(child.Position - arg).Magnitude
if magnitude < arg2 then
arg2 = magnitude
v20 = carryAreaEgg
v21 = child
end
end
end
end
if v20 and v21 and type(arg3) == "string" and not fn26(v21, arg3, arg) then
return nil
end
return v20, v21
end
local function fn47(arg)
local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
local v20 = workspace:FindFirstChild(arg) or areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg)
if not v20 then
return nil
end
local ok, result = pcall(function()
return v20:GetPivot().Position
end)
return ok and result or nil
end
local function fn48(arg)
local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
return nil
end
local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
local records = ok and type(result) == "table" and result.Records or nil
if type(records) ~= "table" then
return nil
end
for _, record in pairs(records) do
if type(record) == "table" and record.Uid == arg and typeof(record.BottomCFrame) == "CFrame" then
return record.BottomCFrame.Position, true
end
end
return nil, true
end
local function fn49(arg)
local v20 = workspace:FindFirstChild(arg)
if not v20 then
return false
end
for _, descendant in ipairs(v20:GetDescendants()) do
if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
local ok, result, result2 = pcall(function()
return descendant.Part0, descendant.Part1
end)
if ok then
for _, v21 in ipairs({result, result2}) do
if typeof(v21) == "Instance" and not v21:IsDescendantOf(v20) then
local model = v21:FindFirstAncestorOfClass("Model")
if model and model ~= localPlayer.Character and Players:GetPlayerFromCharacter(model) then
return true
end
end
end
end
end
end
return false
end
local function fn50(arg, arg2)
local state = 1
local v20, carryUid, n20, vector, connection, n21, n22, huge3, v21, v22, n23, huge4, flag3, v23, v24, v25, now, flag4, n24, flag5, flag6, v26, n25
while true do
if state == 1 then
v20 = arg
carryUid = arg2
if carryUid then
state = 3
else
state = 2
end
elseif state == 2 then
carryUid = tbl4.Steal.CarryUid
state = 3
elseif state == 3 then
if type(carryUid) ~= "string" then
state = 50
else
state = 4
end
elseif state == 4 then
fn22()
str3 = "Following the egg"
n20 = nil
vector = Vector3.zero
connection = RunService.PreSimulation:Connect(function(deltaTime)
local v27 = tbl4.Root()
if not v27 or not n20 or tbl4.Steal.Carrying or fn13(v20) then
return
end
if fn23() then
if not tbl4.SafeCarry.Enabled and(v27.Position - n20).Magnitude > 2 then
fn39(n20)
end
return
end
local n26 = math.max(deltaTime, 0.0041666666666666666)
local n27 = vector +(n20 - v27.Position) / math.max(0.08, n26)
local enabled = tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Pace() or n8 + vector.Magnitude
if enabled < n27.Magnitude then
n27 = n27.Unit * enabled
end
local assemblyLinearVelocity = n27 + Vector3.new(0, workspace.Gravity * n26 * 0.5, 0)
pcall(function()
v27.AssemblyLinearVelocity = assemblyLinearVelocity
v27.AssemblyAngularVelocity = Vector3.zero
end)
end)
n21 = 0
n22 = 0
huge3 = math.huge
v21 = nil
v22 = nil
n23 = 0
huge4 = math.huge
state = 5
elseif state == 5 then
flag3 = false
if not(n21 < huge2) then
state = 47
else
state = 6
end
elseif state == 6 then
if fn13(v20) then
state = 47
else
state = 7
end
elseif state == 7 then
if tbl4.Steal.Carrying then
state = 8
else
state = 11
end
elseif state == 8 then
if tbl4.Steal.WrongEgg(carryUid) then
state = 10
else
state = 9
end
elseif state == 9 then
flag3 = true
state = 47
elseif state == 10 then
str3 = "Picked up the wrong egg, dropped it"
state = 11
elseif state == 11 then
v23 = tbl4.Root()
if not v23 then
state = 47
else
state = 12
end
elseif state == 12 then
v24 = fn47(carryUid)
if v24 then
state = 19
else
state = 13
end
elseif state == 13 then
if not(huge3 >= 0.5) then
state = 20
else
state = 14
end
elseif state == 14 then
v24, v25 = fn48(carryUid)
if v24 then
state = 18
else
state = 15
end
elseif state == 15 then
huge3 = 0
if v25 then
state = 16
else
state = 20
end
elseif state == 16 then
n22 += 1
if not(n22 >= 4) then
state = 20
else
state = 17
end
elseif state == 17 then
str3 = "The egg is gone"
state = 47
elseif state == 18 then
n22 = 0
huge3 = 0
state = 20
elseif state == 19 then
n22 = 0
state = 20
elseif state == 20 then
if v24 then
state = 21
else
state = 30
end
elseif state == 21 then
now = os.clock()
if v21 then
state = 23
else
state = 22
end
elseif state == 22 then
flag4 = v21
state = 24
elseif state == 23 then
flag4 = v22
state = 24
elseif state == 24 then
if flag4 then
state = 25
else
state = 26
end
elseif state == 25 then
flag4 = now > v22
state = 26
elseif state == 26 then
if flag4 then
state = 27
else
state = 29
end
elseif state == 27 then
n24 =(v24 - v21) / math.max(now - v22, 0.0041666666666666666)
if n24.Magnitude < 3000 then
state = 28
else
state = 29
end
elseif state == 28 then
vector = vector:Lerp(n24, 0.3)
state = 29
elseif state == 29 then
n20 = v24 + Vector3.new(0, 3, 0)
v21 = v24
v22 = now
state = 30
elseif state == 30 then
if not(n23 >= 0.4) then
state = 34
else
state = 31
end
elseif state == 31 then
if fn49(carryUid) then
state = 33
else
state = 32
end
elseif state == 32 then
str3 = "Egg dropped, taking it back"
n23 = 0
state = 34
elseif state == 33 then
str3 = "Another player has the egg, following it until it drops"
n23 = 0
state = 34
elseif state == 34 then
if n20 then
state = 36
else
state = 35
end
elseif state == 35 then
flag5 = n20
state = 37
elseif state == 36 then
flag5 =(n20 - v23.Position).Magnitude <= n17
state = 37
elseif state == 37 then
if flag5 then
state = 39
else
state = 38
end
elseif state == 38 then
flag6 = flag5
state = 40
elseif state == 39 then
flag6 = huge4 >= 0.1
state = 40
elseif state == 40 then
if flag6 then
state = 41
else
state = 46
end
elseif state == 41 then
v26 = fn46(n20 - Vector3.new(0, 3, 0), 6, carryUid)
if v26 then
state = 43
else
state = 42
end
elseif state == 42 then
task.spawn(fn28, carryUid)
n25 = 0
state = 45
elseif state == 43 then
pcall(function()
v26.HoldDuration = 0
end)
n25 = 0
if typeof(fireproximityprompt) ~= "function" then
state = 45
else
state = 44
end
elseif state == 44 then
pcall(fireproximityprompt, v26)
state = 45
elseif state == 45 then
huge4 = n25
state = 46
elseif state == 46 then
local result = RunService.Heartbeat:Wait()
n21 += result
huge4 += result
huge3 += result
n23 += result
state = 5
elseif state == 47 then
connection:Disconnect()
fn21()
if flag3 then
state = 49
else
state = 48
end
elseif state == 48 then
flag3 = tbl4.Steal.Carrying == true
state = 49
elseif state == 49 then
return flag3
elseif state == 50 then
return false
end
end
end
local function fn51(arg, arg2)
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not position then
return false
end
if tbl4.InsideBase() and not tbl4.InsideBase(position) then
local v20 = stealHome()
if v20 then
str3 = "Leaving the base through the safe zone"
if not fn35(v20 + Vector3.new(0, 3, 0), arg2, nil, 400) then
return false
end
end
end
str3 = "Flying to the egg"
if not fn35(position + Vector3.new(0, 3, 0), arg2, nil, 400) then
return false
end
str3 = "Taking the egg"
local v20 = fn44(arg, arg2, 0.6, nil)
if not v20 and not fn13(arg2) then
v20 = fn30(arg, arg2)
end
if not v20 and not fn32(arg.Uid, arg2) then
tbl31[arg.Uid] = os.clock() + n10
return false
end
tbl4.Steal.LastFinishedAt = os.clock()
return true
end
local tbl33 ={Uid = nil, Freed = nil, Token = nil}
local n20 = 3
local function fn52()
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("GuardAreas")
local v20 = tbl4.Root()
if not world or not v20 then
return nil
end
local str4 = tostring(localPlayer.UserId)
local carryAreaId = tbl4.Steal.CarryAreaId and fn42({AreaId = tostring(tbl4.Steal.CarryAreaId)}) or nil
local huge3 = math.huge
local v21 = nil
for _, child in ipairs(world:GetChildren()) do
local guard = child:FindFirstChild("Guard")
if guard then
if tostring(guard:GetAttribute("TargetPlayer")) == str4 or tostring(guard:GetAttribute("WakeTargetPlayer")) == str4 then
return guard
end
local ok, result = pcall(function()
return guard:GetPivot().Position
end)
if ok then
local magnitude =(result - v20.Position).Magnitude
if magnitude < huge3 then
v21 = guard
huge3 = magnitude
end
end
end
end
return carryAreaId or v21
end
local function fn53(arg, arg2, arg3)
local v20 = fn52()
if not v20 then
return false
end
local v21 = fn43(arg, arg3 + Vector3.new(0, 3, 0))
local n21 = 0
while true do
if not v21.Landed and n21 < n15 and not fn13(arg) then
local ok, result = pcall(function()
return v20:GetPivot().Position
end)
local v22 = tbl4.Root()
if not(not ok or not v22) then
if n19 + 5 <(result - v22.Position).Magnitude then
local vector = Vector3.new(v22.Position.X - result.X, 0, v22.Position.Z - result.Z)
local n22 = result +(vector.Magnitude > 0.1 and vector.Unit * n19 or Vector3.zero)
fn35(Vector3.new(n22.X, result.Y + 3, n22.Z), arg, nil, 400, true, function()
if v21.Landed then
return "hit"
end
return nil
end)
end
n21 += RunService.Heartbeat:Wait()
continue
end
end
break
end
v21.Stop()
if not v21.Landed then
return false
end
return fn50(arg, arg2)
endtbl4.SafeCarry.Dangers ={}
tbl4.SafeCarry.DangerAt = 0
tbl4.SafeCarry.RefreshDangers = function()
local safeCarry = tbl4.SafeCarry
local dangerAt = safeCarry.DangerAt
if os.clock() - dangerAt < 1 then
return safeCarry.Dangers
end
safeCarry.DangerAt = os.clock()
local dangers ={}
local function fn54(arg)
local ok, result, result2 = pcall(function()
if arg:IsA("Model") then
return arg:GetBoundingBox()
end
if arg:IsA("BasePart") then
return arg.CFrame, arg.Size
end
end)
if ok and result and result2 then
local abs = math.abs
local z = result2.Z
local n21 = Vector3.new(math.abs(result2.X), 0, abs(z)) * 0.5
local v20 =(result - result.Position):VectorToWorldSpace(n21)
local x = n21.X
local z2 = n21.Z
local n22 = math.max(math.abs(v20.X), x, z2)
local x2 = n21.X
local z3 = n21.Z
local n23 = math.max(math.abs(v20.Z), x2, z3)
table.insert(dangers,{
MinX = result.Position.X - n22,
MaxX = result.Position.X + n22,
MinZ = result.Position.Z - n23,
MaxZ = result.Position.Z + n23,
Name = arg.Name,
})
end
end
local function fn55(arg)
if arg == "ScrambleLocalVisuals" or arg == "DrScrambleEvent" then
return false
end
local v20 = string.lower(arg)
return string.find(v20, "portal", 1, true) or string.find(v20, "teleport", 1, true) or string.find(v20, "mech", 1, true) or string.find(v20, "arena", 1, true) or string.find(v20, "scramble", 1, true)
end
for _, child in ipairs(workspace:GetChildren()) do
if(child:IsA("Model") or child:IsA("BasePart") or child:IsA("Folder")) and fn55(child.Name) then
if child:IsA("Folder") then
for _, child2 in ipairs(child:GetChildren()) do
fn54(child2)
end
else
fn54(child)
end
end
end
local world = workspace:FindFirstChild("World")
local build = world and world:FindFirstChild("Build")
if build then
for _, child in ipairs(build:GetChildren()) do
if fn55(child.Name) then
for _, child2 in ipairs(child:GetChildren()) do
fn54(child2)
end
end
end
end
safeCarry.Dangers = dangers
return dangers
end
tbl4.SafeCarry.Avoid = function(arg, arg2)
for _, v20 in ipairs(tbl4.SafeCarry.RefreshDangers()) do
local n21 = v20.MinX - 12
local n22 = v20.MaxX + 12
local n23 = v20.MinZ - 12
local n24 = v20.MaxZ + 12
local v21, v22, v23 = ipairs({{arg.X, arg2.X - arg.X, n21, n22},{arg.Z, arg2.Z - arg.Z, n23, n24}})
local flag3 = true
local n25 = 0
local n26 = 1
for _, v24 in v21, v22, v23 do
local v25 = v24[1]
local v26 = v24[2]
local v27 = v24[3]
local v28 = v24[4]
if math.abs(v26) < 1e-06 then
if v25 < v27 or v25 > v28 then
flag3 = false
end
else
local n27 =(v27 - v25) / v26
local n28 =(v28 - v25) / v26
if not(n28 < n27) then
local v29 = n28
n28 = n27
n27 = v29
end
local n29 = math.max(n25, n28)
local n30 = math.min(n26, n27)
if not(n30 < n29) then
n26 = n30
n25 = n29
else
flag3 = false
n26 = n30
n25 = n29
end
end
end
if flag3 and not(arg.X >= n21 and arg.X <= n22 and arg.Z >= n23 and arg.Z <= n24) then
local n27 = n23 - 2
local n28 = n24 + 2
local flag4 = math.abs(arg.Z - n27) <= math.abs(arg.Z - n28) and n27 or n28
if flag4 < -440 or flag4 > -290 then
flag4 = flag4 == n27 and n28 or n27
end
local flag5 = math.abs(arg.X - n21) <= math.abs(arg.X - n22) and n21 or n22
if math.abs(arg.Z - flag4) < 3 then
flag5 = math.abs(arg2.X - n21) <= math.abs(arg2.X - n22) and n21 or n22
end
return Vector3.new(flag5, arg2.Y, flag4), v20.Name
end
end
return arg2, nil
end
tbl4.SafeCarry.NewHuman = function(arg)
local safeCarry = tbl4.SafeCarry
local laneOffset = safeCarry.LaneOffset
local tbl34
tbl34 ={
Clock = 0,
Factor = 1,
Target = 1,
NextShift = 0,
Phase = math.random() * 3.1415926535897931 * 2,
Period = 2 + math.random() * 2.5,
PauseUntil = 0,
Lane =(math.random() * 2 - 1) * laneOffset,
Step = function(arg2, arg3, arg4)
tbl34.Clock = tbl34.Clock + arg2
if tbl34.NextShift <= tbl34.Clock then
tbl34.NextShift = tbl34.Clock + 0.5 + math.random()
local n21 = math.max(safeCarry.SpeedJitter, 0)
if arg then
tbl34.Target = 1 - math.random() * n21
else
tbl34.Target = 1 +(math.random() * 2 - 1) * n21
end
end
tbl34.Factor = tbl34.Factor +(tbl34.Target - tbl34.Factor) * math.min(arg2 * 3, 1)
local wobble = safeCarry.Wobble
local n21 = math.sin(tbl34.Clock * 2 * 3.1415926535897931 / tbl34.Period + tbl34.Phase) * wobble
local flag3 = arg4 and arg3 and safeCarry.JumpsPerMinute > 0
if flag3 then
local n22 = safeCarry.JumpsPerMinute / 60 * arg2
flag3 = math.random() < n22
end
if flag3 then
pcall(function()
arg3.Jump = true
end)
end
local flag4 = false
if not arg then
if tbl34.Clock < tbl34.PauseUntil then
flag4 = true
else
local flag5 = safeCarry.PausesPerMinute > 0
if flag5 then
local n22 = safeCarry.PausesPerMinute / 60 * arg2
flag5 = math.random() < n22
end
if flag5 then
tbl34.PauseUntil = tbl34.Clock + 0.3 + math.random() * 0.9
flag4 = true
end
end
end
return tbl34.Factor, tbl34.Lane + n21, flag4
end,
}
return tbl34
end
tbl4.SafeCarry.React = function(arg, arg2)
local n21 = math.max(0, math.min(arg, arg2))
local n22 = math.max(arg, arg2, 0)
return n21 + math.random() *(n22 - n21)
end
tbl4.SafeCarry.RunTo = function(arg, arg2)
local safeCarry = tbl4.SafeCarry
local position = typeof(arg.CFrame) == "CFrame" and arg.CFrame.Position or nil
if not position then
return false
end
fn22()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
humanoid.PlatformStand = false
if character:FindFirstChildWhichIsA("Tool") then
pcall(function()
humanoid:UnequipTools()
end)
end
end
local v20 = safeCarry.NewHuman(false)
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
local x = world and world:IsA("BasePart") and world.Position.X or 552
local v21 = stealHome()
local position2 = tbl4.Root()
local str4 = "field"
local z = position2 and position2.Position.Z or position.Z
if position2 and v21 and position2.Position.X < x - 2 then
z = v21.Z
if(Vector3.new(position2.Position.X, 0, position2.Position.Z) - Vector3.new(v21.X, 0, v21.Z)).Magnitude > 20 then
str4 = "safe"
end
end
local n21 = math.clamp(z + v20.Lane, -425, -300)
local n22 = position.Y + 3
local function fn54(arg3)
local v22 = tbl4.Root()
local character2 = localPlayer.Character
local flag3 = not v22 or not character2 or math.abs(v22.Position.Y - arg3) < 1
if not flag3 then
local snapLimit = safeCarry.SnapLimit
flag3 = math.abs(v22.Position.Y - arg3) > snapLimit
end
if flag3 then
return false
end
pcall(function()
local rotation = v22.CFrame.Rotation
character2:PivotTo(CFrame.new(Vector3.new(v22.Position.X, arg3, v22.Position.Z)) * rotation)
v22.AssemblyLinearVelocity = Vector3.new(v22.AssemblyLinearVelocity.X, 0, v22.AssemblyLinearVelocity.Z)
end)
return true
end
local function fn55()
if safeCarry.RunHeight <= 0.5 then
return
end
fn54(n22 + safeCarry.RunHeight)
end
if str4 == "field" then
fn55()
end
local now = os.clock()
local now2 = os.clock()
local now3 = os.clock()
position2 = position2 and position2.Position or nil
local function fn56(arg3, arg4, arg5, arg6)
local vector = Vector3.new(arg4.X - arg3.Position.X, 0, arg4.Z - arg3.Position.Z)
local magnitude = vector.Magnitude
local unit = magnitude > 0.01 and vector.Unit or Vector3.zero
if safeCarry.RunHeight > 0.5 and str4 == "field" and not arg6 then
local runSpeed = safeCarry.RunSpeed
local n23 = math.max(tbl4.WalkSpeed() * runSpeed * arg5, 8)
local n24 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
local magnitude2 = Vector3.new(position.X - arg3.Position.X, 0, position.Z - arg3.Position.Z).Magnitude
if magnitude2 <= 3 then
if fn54(n22) then
return
end
end
local n25 = magnitude2 <= 3 and n22 or n22 + safeCarry.RunHeight
if math.abs(n25 - arg3.Position.Y) > 2 and fn54(n25) then
return
end
local n26 = math.clamp((n25 - arg3.Position.Y) / 0.12, -n23 * n24, n23 * n24)
local n27 = unit * math.min(math.sqrt(math.max(n23 * n23 - n26 * n26, 0)), magnitude / 0.05)
pcall(function()
arg3.AssemblyLinearVelocity = Vector3.new(n27.X, n26, n27.Z)
end)
return
end
pcall(function()
if arg6 or magnitude <= 0.01 then
if humanoid then
if safeCarry.RunStyle == "Walk" then
humanoid:MoveTo(arg3.Position)
end
humanoid:Move(Vector3.zero, false)
end
if safeCarry.RunStyle ~= "Walk" then
arg3.AssemblyLinearVelocity = Vector3.new(0, arg3.AssemblyLinearVelocity.Y, 0)
end
elseif safeCarry.RunStyle == "Walk" then
if humanoid then
humanoid:MoveTo(arg3.Position + unit * math.min(magnitude, 30))
end
else
local runSpeed = safeCarry.RunSpeed
local n23 = unit * math.min(math.max(tbl4.WalkSpeed() * runSpeed * arg5, 8), magnitude / 0.05)
arg3.AssemblyLinearVelocity = Vector3.new(n23.X, arg3.AssemblyLinearVelocity.Y, n23.Z)
if safeCarry.RunAnimate and humanoid then
humanoid:Move(unit, false)
end
end
end)
end
while os.clock() - now < 240 do
if fn13(arg2) then
return false
end
local v22 = tbl4.Root()
if not v22 then
return false
end
local now4 = os.clock()
local n23 = math.max(now4 - now2, 0.0041666666666666666)
local vector = Vector3.new(position.X - v22.Position.X, 0, position.Z - v22.Position.Z)
if str4 == "field" and vector.Magnitude <= 2.5 and(safeCarry.RunHeight <= 0.5 or v22.Position.Y - n22 < 4) then
break
end
local v23, v24, flag3 = v20.Step(n23, humanoid, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)
if vector.Magnitude <= 15 then
flag3 = false
end
local vector2 = position
if str4 == "safe" and v21 then
if(Vector3.new(v21.X, 0, v21.Z) - Vector3.new(v22.Position.X, 0, v22.Position.Z)).Magnitude <= 6 then
str4 = "field"
fn55()
end
str3 = "Walking out to the safe zone"
vector2 = v21
else
if not safeCarry.StraightRun and safeCarry.RunHeight <= 0.5 and math.abs(position.X - v22.Position.X) > 25 then
vector2 = Vector3.new(position.X, position.Y, math.clamp(n21 + v24, -425, -300))
end
str3 = string.format("Running to the egg, %d studs left", math.floor(vector.Magnitude + 0.5))
end
local v25, v26 = safeCarry.Avoid(v22.Position, vector2)
if v26 then
str3 = "Walking around ".. tostring(v26)
end
fn56(v22, v25, v23, flag3)
if now4 - now3 >= 1.5 then
if not flag3 and position2 and(v22.Position - position2).Magnitude < 3 and humanoid then
pcall(function()
humanoid.Jump = true
end)
end
position2 = v22.Position
now3 = now4
end
RunService.Heartbeat:Wait()
now2 = now4
end
local v22 = tbl4.Root()
if v22 then
fn56(v22, v22.Position, 1, true)
end
local vector = nil
if v22 then
local vector2 = Vector3.new(v22.Position.X - position.X, 0, v22.Position.Z - position.Z)
local vector3 = vector2.Magnitude > 0.1 and vector2.Unit * 2 or Vector3.zero
vector = Vector3.new(position.X + vector3.X, v22.Position.Y, position.Z + vector3.Z)
end
local connection = RunService.Heartbeat:Connect(function()
local v23 = tbl4.Root()
if not v23 or not vector or tbl4.Steal.Carrying or tbl4.AntiGuard.Busy then
return
end
local vector2 = Vector3.new(vector.X - v23.Position.X, 0, vector.Z - v23.Position.Z)
pcall(function()
if vector2.Magnitude > 1.5 then
local rotation = v23.CFrame.Rotation
v23.CFrame = CFrame.new(vector.X, v23.Position.Y, vector.Z) * rotation
end
v23.AssemblyLinearVelocity = Vector3.new(0, math.min(v23.AssemblyLinearVelocity.Y, 0), 0)
end)
end)
local function fn57(arg3)
connection:Disconnect()
return arg3
end
local v23 = fn42(arg)
local now4 = os.clock()
local v24 = safeCarry.React(safeCarry.ReactMin, safeCarry.ReactMax)
while true do
if fn13(arg2) then
return(fn57(false))
else
local n23 = os.clock() - now4
local n24 = safeCarry.RunWait + v24
local flag3 = not safeCarry.WaitGuard or not v23 or v23:GetAttribute("GuardState") == "Sleeping"
if n23 >= n24 and(flag3 or n23 >= n24 + 15) then
break
end
str3 = n23 < n24 and string.format("Waiting before the grab, %.1fs", n24 - n23) or "Waiting for the guard to sleep"
RunService.Heartbeat:Wait()
end
end
str3 = "Taking the egg"
local v25 = fn44(arg, arg2, 0.8, nil)
if not v25 and not fn13(arg2) then
v25 = fn30(arg, arg2)
end
fn57()
if not v25 then
return false
end
tbl4.Steal.LastFinishedAt = os.clock()
return true
end
tbl4.SafeCarry.Pace = function()
local n21 = tonumber(tbl4.SafeCarry.RunSpeed) or 1
return math.max(tbl4.WalkSpeed() * n21, 16)
end
tbl4.SafeCarry.Plan = function(arg, arg2, arg3)
local safeCarry = tbl4.SafeCarry
local character = localPlayer.Character
if character then
character:FindFirstChildOfClass("Humanoid")
end
local v20 = tbl4.WalkSpeed()
arg3 = arg3 or safeCarry.Mult or 1
if safeCarry.SameSpeedBigEggs then
arg3 = math.max(arg3, safeCarry.LightMult)
end
local n21 = v20 * safeCarry.CarryRatio * arg3
local n22 = n21 * safeCarry.SpeedRatio
local n23 = safeCarry.ExcessSeconds * n21
local n24
if arg2 and arg2 > n23 then
n24 = math.min(n22, n21 * arg2 /(arg2 - n23))
else
n24 = n22
end
local guards = tbl.Guards
local flag3 = type(guards) == "table" and type(guards.Directory) == "table" and guards.Directory[tostring(arg)] or nil
local n25 = type(flag3) == "table" and tonumber(flag3.WalkSpeed) or 0
if not safeCarry.BeatGuard then
return math.max(math.min(n21 * safeCarry.EasyRatio, n24), n21), true, n21, n24, n25
end
local n26 = math.max(n25 + safeCarry.GuardMargin, n21 * safeCarry.MinRatio)
local n27 = math.max(n26, n25 * safeCarry.GuardRatio)
if n24 < n26 then
local n28 = n21 * safeCarry.SpeedRatio
local n29 = safeCarry.StretchSeconds * n21
local n30
if arg2 and arg2 > n29 then
n30 = math.min(n28, n21 * arg2 /(arg2 - n29))
else
n30 = n28
end
local n31 = n25 + math.max(safeCarry.GuardMargin, 1)
if n31 <= n30 then
return n31, true, n21, n30, n25
end
end
return math.max(math.min(n27, n24), n21), n26 <= n24, n21, n24, n25
end
tbl4.SafeCarry.Unsafe = function(arg)
local safeCarry = tbl4.SafeCarry
if not safeCarry.Enabled or type(arg) ~= "table" or not arg.Uid or not safeCarry.Blocked[arg.Uid] then
return nil
end
return string.format("the guard caught you with this %s before, skipping it", tostring(arg.Category))
end
tbl4.SafeCarry.Settle = function(arg, arg2)
local safeCarry = tbl4.SafeCarry
local character = localPlayer.Character
if character then
character:FindFirstChildOfClass("Humanoid")
end
math.max(tbl4.WalkSpeed() * safeCarry.CarryRatio *(safeCarry.Seen[tostring(arg2.Category)] or safeCarry.GuessMult) * safeCarry.WaitRate, 1)
local baseWait = safeCarry.BaseWait
local v20 = fn42(arg2)
while true do
if fn13(arg) then
return false
else
local n21 = os.clock() -(safeCarry.JumpAt or 0)
local flag3 = not safeCarry.WaitGuard or not v20 or v20:GetAttribute("GuardState") == "Sleeping"
if n21 >= baseWait and(flag3 or n21 >= baseWait + 15) then
break
end
if n21 < baseWait then
str3 = string.format("Letting the jump settle, %.1fs", baseWait - n21)
else
str3 = "Waiting for the guard to sleep"
end
RunService.Heartbeat:Wait()
end
end
return true
end
tbl4.MonitorAction = tbl4.MonitorAction or function(arg)
local ok, result = pcall(debug.getconstants, arg)
if not ok or type(result) ~= "table" then
return false
end
for _, v20 in pairs(result) do
if type(v20) == "string" and(v20 == "Relocate" or v20 == "SetWalkSpeed" or v20 == "BeginRagdoll" or v20 == "EndRagdoll" or v20 == "BeginImpulse") then
return true
end
end
return false
end
tbl4.SafeCarry.LineDropHome = function(arg)
local safeCarry = tbl4.SafeCarry
local steal = tbl4.Steal
local carryUid = steal.CarryUid
local v20 = stealHome()
local v21 = tbl4.Root()
if type(carryUid) ~= "string" or not v20 or not v21 then
return false
end
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
local x = world and world:IsA("BasePart") and world.Position.X or 552.2
local y = world and world:IsA("BasePart") and world.Position.Y or 67.67
local tbl34 ={}
pcall(function()
for _, v22 in ipairs({RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation}) do
for _, v23 in ipairs(getconnections(v22)) do
local ok, result = pcall(function()
return v23.Function
end)
if ok and type(result) == "function" then
local ok2, result2 = pcall(debug.info, result, "s")
if ok2 and string.find(tostring(result2), "UGI", 1, true) and not tbl4.MonitorAction(result) then
local ok3, result3 = pcall(function()
return v23.Enabled
end)
if not ok3 or result3 ~= false then
if pcall(function()
v23:Disable()
end) then
table.insert(tbl34, v23)
end
end
end
end
end
end
end)
local flag3 = false
local connection = nil
pcall(function()
connection = networking["RE/RigSync/Refresh"].OnClientEvent:Connect(function(arg2)
if type(arg2) == "table" and arg2.Action == "Relocate" then
flag3 = true
end
end)
end)
local currentCamera = workspace.CurrentCamera
local tbl35 = nil
local function fn54()
if not safeCarry.LockCamera or tbl35 or not currentCamera then
return
end
tbl35 ={Type = currentCamera.CameraType, CFrame = currentCamera.CFrame}
pcall(function()
currentCamera.CameraType = Enum.CameraType.Scriptable
currentCamera.CFrame = tbl35.CFrame
end)
end
local function fn55()
if not tbl35 or not currentCamera then
return
end
local v22 = tbl35
tbl35 = nil
pcall(function()
currentCamera.CameraType = v22.Type
end)
end
local function fn56()
fn55()
if connection then
connection:Disconnect()
connection = nil
end
for _, v22 in ipairs(tbl34) do
pcall(function()
v22:Enable()
end)
end
table.clear(tbl34)
end
local now = os.clock()
local function fn57(arg2, arg3, arg4, arg5)
local n21 = 0
while n21 < arg4 and not fn13(arg) do
local v22 = tbl4.Root()
if not v22 then
return false
end
if arg5 and arg5() then
return true
end
local vector = Vector3.new(arg2.X - v22.Position.X, 0, arg2.Z - v22.Position.Z)
if vector.Magnitude < 2.5 then
return true
end
local n22 = vector.Unit * math.min(arg3, vector.Magnitude / 0.05)
pcall(function()
v22.AssemblyLinearVelocity = Vector3.new(n22.X, v22.AssemblyLinearVelocity.Y, n22.Z)
end)
n21 += RunService.Heartbeat:Wait()
end
return false
end
fn22()
local n21 = math.clamp(v21.Position.Z, -425, -300)
local vector = Vector3.new(x +(safeCarry.Hops and safeCarry.HopStop or safeCarry.LineGap), y + 3.35, n21)
local function fn58()
local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
local ok, result = pcall(function()
return rfEggWorldAskFieldEggSnapshot:InvokeServer()
end)
local records = ok and type(result) == "table" and result.Records or nil
if type(records) == "table" then
for _, record in pairs(records) do
if type(record) == "table" and record.Uid == carryUid then
return record
end
end
end
return nil
end
local function fn59()
local ok, result = pcall(function()
return localPlayer:GetNetworkPing()
end)
local num = ok and tonumber(result) or nil
return num and math.clamp(num, 0, 2) or 0.2
end
local function fn60(arg2)
local v22 = fn59()
if not arg2 then
local n22 = 0
while n22 < safeCarry.DropDelay + v22 and steal.Carrying and not fn13(arg) do
n22 += RunService.Heartbeat:Wait()
end
if not steal.Carrying then
return false
end
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
local n23 = 0
while steal.Carrying and n23 < 1 + v22 * 2 and not fn13(arg) do
n23 += RunService.Heartbeat:Wait()
end
if steal.Carrying then
return true
end
end
local now2 = os.clock()
local position = nil
local flag4 = flag3 == true
local backRunRatio = safeCarry.BackRunRatio
local backRunMax = safeCarry.BackRunMax
local n22 = math.clamp(tbl4.WalkSpeed() * backRunRatio, 1200, backRunMax)
flag3 = false
local n23 = 0
local v23 = now2
while not steal.Carrying and not fn13(arg) do
local now3 = os.clock()
local v24 = workspace:FindFirstChild(carryUid)
local isModel = v24 and v24:IsA("Model")
local flag5 = false
local result = nil
if isModel then
flag5, result = pcall(v24.GetPivot, v24)
end
if flag5 and typeof(result) == "CFrame" then
position = result.Position
elseif now3 - n23 >= 1 then
position = fn48(carryUid) or position
n23 = now3
end
if now3 - now2 >= 0.5 and now3 - v23 >= 1 then
local v25 = fn58()
if v25 and v25.State == "Slot" then
str3 = "Line Drop: the egg went back to its nest"
return false
end
if not v25 and not position and now3 - now2 > 5 then
str3 = "Line Drop: the egg is gone"
return false
end
v23 = now3
end
if flag3 then
flag3 = false
flag4 = true
end
local v25 = tbl4.Root()
if v25 and position then
local vector2 = Vector3.new(position.X - v25.Position.X, 0, position.Z - v25.Position.Z)
local magnitude = vector2.Magnitude
if magnitude > 6 then
if flag4 then
str3 = string.format("Line Drop: running back to the egg, %d studs", math.floor(magnitude + 0.5))
local n24 = vector2.Unit * math.min(math.clamp(magnitude * 4, tbl4.WalkSpeed(), n22), magnitude / 0.05)
pcall(function()
v25.AssemblyLinearVelocity = Vector3.new(n24.X, v25.AssemblyLinearVelocity.Y, n24.Z)
end)
else
str3 = string.format("Line Drop: teleporting to the egg, %d studs", math.floor(magnitude + 0.5))
pcall(function()
v25.CFrame = CFrame.new(position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
else
str3 = "Line Drop: grabbing the egg back"
end
end
task.spawn(fn28, carryUid)
task.wait(0.05)
end
local v24 = tbl4.Root()
if v24 then
pcall(function()
v24.AssemblyLinearVelocity = Vector3.new(0, v24.AssemblyLinearVelocity.Y, 0)
end)
end
local flag5 = steal.Carrying and not steal.WrongEgg(carryUid)
if flag5 then
safeCarry.RegrabbedAt = os.clock()
end
return flag5
end
local magnitude = Vector3.new(v21.Position.X - x, 0, v21.Position.Z - n21).Magnitude
local max = math.max
local carryRatio = safeCarry.CarryRatio
local v22 = max(tbl4.WalkSpeed() * carryRatio *(tonumber(safeCarry.Mult) or safeCarry.LightMult), 1)
local directMargin = safeCarry.DirectMargin
local n22 = math.max(0,(magnitude - safeCarry.DirectBudget) / v22) + directMargin
if safeCarry.CrossNow then
n22 = safeCarry.DirectMargin
end
local function fn61()
local v23 = tbl4.Root()
if not v23 then
return
end
pcall(function()
v23.CFrame = CFrame.new(vector) * CFrame.Angles(0, 1.5707963267948966, 0)
v23.AssemblyLinearVelocity = Vector3.zero
v23.AssemblyAngularVelocity = Vector3.zero
end)
end
fn54()
if safeCarry.Hops then
local v23 = tbl4.Root()
if v23 then
local n23 = v23.Position.Y + safeCarry.HopLift
local x2 = v23.Position.X
local hopRatio = safeCarry.HopRatio
local n24 = math.max(tbl4.WalkSpeed() * hopRatio, 40)
local tbl36 ={}
local v24 = ipairs
local midDrops = safeCarry.MidDrops or{}
for _, midDrop in v24(midDrops) do
table.insert(tbl36, x2 -(x2 - vector.X) * midDrop)
end
local n25 = 1
while true do
local flag4 = x2 - n24 > vector.X and not fn13(arg)
local exitTo = nil
local n26, v25
while flag4 do
local flag5, v26, v27, n27, flag6
if not steal.Carrying then
str3 = "Line Drop: the server dropped the egg, grabbing it back"
if fn60(true) then
local v28 = tbl4.Root()
if v28 then
x2 = v28.Position.X
end
if not(x2 - n24 <= vector.X) then
x2 -= n24
str3 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
flag5 = tbl36[n25] and x2 <= tbl36[n25]
if flag5 then
n25 += 1
str3 = string.format("Line Drop: dropping and grabbing the egg again (%d/%d)", n25 - 1, #tbl36 + 1)
v26 = tbl4.Root()
if v26 then
pcall(function()
v26.CFrame = CFrame.new(x2, vector.Y, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v26.AssemblyLinearVelocity = Vector3.zero
v26.AssemblyAngularVelocity = Vector3.zero
end)
end
if steal.Carrying then
if fn60() then
v27 = tbl4.Root()
if v27 then
x2 = v27.Position.X
end
n27 = 0
while true do
flag6 = n27 < safeCarry.MidRest and not fn13(arg)
if flag6 then
n27 += RunService.Heartbeat:Wait()
continue
end
break
end
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
flag4 = x2 - n24 > vector.X and not fn13(arg)
continue
end
else
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
flag4 = x2 - n24 > vector.X and not fn13(arg)
continue
end
else
exitTo = 2
break
end
end
end
else
x2 -= n24
str3 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
flag5 = tbl36[n25] and x2 <= tbl36[n25]
if flag5 then
n25 += 1
str3 = string.format("Line Drop: dropping and grabbing the egg again (%d/%d)", n25 - 1, #tbl36 + 1)
v26 = tbl4.Root()
if v26 then
pcall(function()
v26.CFrame = CFrame.new(x2, vector.Y, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v26.AssemblyLinearVelocity = Vector3.zero
v26.AssemblyAngularVelocity = Vector3.zero
end)
end
if steal.Carrying then
if fn60() then
v27 = tbl4.Root()
if v27 then
x2 = v27.Position.X
end
n27 = 0
while true do
flag6 = n27 < safeCarry.MidRest and not fn13(arg)
if flag6 then
n27 += RunService.Heartbeat:Wait()
continue
end
break
end
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
flag4 = x2 - n24 > vector.X and not fn13(arg)
continue
end
else
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
flag4 = x2 - n24 > vector.X and not fn13(arg)
continue
end
else
exitTo = 1
break
end
end
break
end
if exitTo == 1 then
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
continue
end
if exitTo == 2 then
n26 = 0
while n26 < safeCarry.HopGap do
v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
end
n26 += RunService.Heartbeat:Wait()
end
continue
end
break
end
end
end
if safeCarry.Hops and not steal.Carrying and not fn13(arg) then
str3 = "Line Drop: the server dropped the egg, grabbing it back"
fn60(true)
end
str3 = "Line Drop: landing next to the line"
fn61()
local carrying = safeCarry.Hops and steal.Carrying
local flag4 = false
if carrying then
str3 = "Line Drop: dropping the egg next to the line"
local now2 = os.clock()
flag4 = false
for i = 1, 8 do
local flag5 = not fn60() or not steal.Carrying or fn13(arg)
flag4 = false
if not flag5 then
local v23 = tbl4.Root()
if v23 and math.abs(v23.Position.X - vector.X) <= 30 then
flag4 =(safeCarry.RegrabbedAt or 0) >= now2
break
else
str3 = "Line Drop: back to the line with the egg"
fn61()
flag4 = false
continue
end
end
break
end
end
fn55()
if flag4 and not fn13(arg) then
str3 = "Line Drop: stepping over the line"
local crossRatio = safeCarry.CrossRatio
fn57(v20, tbl4.WalkSpeed() * crossRatio, 6, function()
return safeCarry.LastDelivered >= now or not steal.Carrying
end)
local n23 = 0
while n23 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not fn13(arg) do
n23 += RunService.Heartbeat:Wait()
end
if now <= safeCarry.LastDelivered then
fn56()
return true
end
end
if safeCarry.ShakeTime > 0 then
local vector2 = Vector3.new(x - safeCarry.ShakeInside, vector.Y, n21)
local flag5 = false
local n23 = 0
while n23 < safeCarry.ShakeTime and steal.Carrying and not fn13(arg) do
str3 = "Line Drop: shaking at the line"
flag5 = not flag5
local v23 = tbl4.Root()
if v23 then
pcall(function()
v23.CFrame = CFrame.new(flag5 and vector2 or vector) * CFrame.Angles(0, 1.5707963267948966, 0)
v23.AssemblyLinearVelocity = Vector3.zero
end)
end
n23 += RunService.Heartbeat:Wait()
end
fn61()
end
local flag5 = n22 < safeCarry.LineWait
local n23 = 0
local n24 = 1
while true do
local flag6 = steal.Carrying and n23 < safeCarry.LineWait
local flag7
if flag6 then
flag7 = not(flag5 and n23 >= n22)
else
flag7 = flag6
end
flag7 = flag7 and not fn13(arg)
if flag7 then
if flag5 then
str3 = string.format("Line Drop: stepping over the line in %.1fs", math.max(n22 - n23, 0))
else
str3 = string.format("Line Drop: crossing needs %.1fs, waiting for the guard, %.0fs left", n22, safeCarry.LineWait - n23)
end
if flag3 and safeCarry.ReJump and n24 < 40 and not fn31() then
flag3 = false
n24 += 1
str3 = "Line Drop: pulled back, jumping to the line again"
fn61()
end
n23 += RunService.Heartbeat:Wait()
continue
end
break
end
if steal.Carrying and flag5 and n23 >= n22 and not fn13(arg) then
str3 = "Line Drop: stepping over the line"
local crossRatio = safeCarry.CrossRatio
fn57(v20, tbl4.WalkSpeed() * crossRatio, 6, function()
return safeCarry.LastDelivered >= now or not steal.Carrying
end)
local n25 = 0
while n25 < 1.5 and safeCarry.LastDelivered < now and steal.Carrying and not fn13(arg) do
n25 += RunService.Heartbeat:Wait()
end
if safeCarry.LastDelivered >= now then
fn56()
return true
end
end
if steal.Carrying then
fn56()
str3 = "Line Drop: the guard never came, dropping the egg"
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
return false
end
if safeCarry.GetUp then
task.spawn(function()
local n25 = 0
while n25 < 1.5 do
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
pcall(function()
humanoid.PlatformStand = false
local state = humanoid:GetState()
if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
n25 += RunService.Heartbeat:Wait()
end
end)
end
local n25 = 0
while not safeCarry.SnapPickup and not safeCarry.GetUp and fn31() and n25 < 6 and not fn13(arg) do
str3 = "Line Drop: egg is down at the line, getting up"
n25 += RunService.Heartbeat:Wait()
end
local n26 = 0
while not fn13(arg) and n26 < 4 do
n26 += 1
local v23 = fn48(carryUid)
if not v23 then
fn56()
str3 = "Line Drop: the egg is gone"
return false
end
local v24 = fn58()
if v24 and v24.State == "Slot" then
fn56()
str3 = "Line Drop: the egg went back to its nest"
return false
end
str3 = "Line Drop: picking the egg up at the line"
local n27
if safeCarry.SnapPickup then
local v25 = tbl4.Root()
if v25 then
pcall(function()
v25.CFrame = CFrame.new(v23 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
v25.AssemblyLinearVelocity = Vector3.zero
end)
end
n27 = 5
else
local backRunRatio = safeCarry.BackRunRatio
local backRunMax = safeCarry.BackRunMax
local n28 = math.clamp(tbl4.WalkSpeed() * backRunRatio, 1200, backRunMax)
local n29 = 0
local n30 = 0
while true do
if not steal.Carrying and n29 < 10 and not fn13(arg) then
local v25 = tbl4.Root()
if v25 then
local vector2 = Vector3.new(v23.X - v25.Position.X, 0, v23.Z - v25.Position.Z)
local magnitude2 = vector2.Magnitude
if not(magnitude2 <= 4) then
local n31 = magnitude2 > 30 and math.clamp(magnitude2 * 4, tbl4.WalkSpeed(), n28)
if not n31 then
local pickupRatio = safeCarry.PickupRatio
n31 = tbl4.WalkSpeed() * pickupRatio
end
local n32 = vector2.Unit * math.min(n31, magnitude2 / 0.05)
pcall(function()
v25.AssemblyLinearVelocity = Vector3.new(n32.X, v25.AssemblyLinearVelocity.Y, n32.Z)
end)
if magnitude2 > 30 then
str3 = string.format("Line Drop: running back to the egg, %d studs", math.floor(magnitude2 + 0.5))
end
if os.clock() - n30 >= 0.1 then
n30 = os.clock()
task.spawn(fn28, carryUid)
end
n29 += RunService.Heartbeat:Wait()
continue
end
end
end
break
end
local v25 = tbl4.Root()
if v25 then
pcall(function()
v25.AssemblyLinearVelocity = Vector3.new(0, v25.AssemblyLinearVelocity.Y, 0)
end)
end
n27 = 2.5
end
local n28 = 0
while not steal.Carrying and n28 < n27 and not fn13(arg) do
task.spawn(fn28, carryUid)
if safeCarry.SnapPickup then
local v25 = tbl4.Root()
if v25 and Vector3.new(v25.Position.X - v23.X, 0, v25.Position.Z - v23.Z).Magnitude > 6 then
pcall(function()
v25.CFrame = CFrame.new(v23 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
end)
end
end
n28 += task.wait(0.1)
end
if steal.Carrying and not steal.WrongEgg(carryUid) then
break
end
end
if not steal.Carrying then
fn56()
str3 = "Line Drop: could not pick the egg up again"
return false
end
local v23 = tbl4.Root()
if v23 and v23.Position.X - x > safeCarry.FarFromLine then
fn56()
str3 = "Line Drop: egg ended up far from the line, carrying it home safely"
return tbl4.SafeCarry.Home(arg)
end
str3 = "Line Drop: stepping over the line"
local crossRatio = safeCarry.CrossRatio
fn57(v20, tbl4.WalkSpeed() * crossRatio, 6, function()
return safeCarry.LastDelivered >= now or not steal.Carrying
end)
local v24 = tbl4.Root()
if v24 then
pcall(function()
v24.AssemblyLinearVelocity = Vector3.new(0, v24.AssemblyLinearVelocity.Y, 0)
end)
end
local n27 = 0
while n27 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not fn13(arg) do
n27 += RunService.Heartbeat:Wait()
end
fn56()
return safeCarry.LastDelivered >= now
end
tbl4.SafeCarry.Home = function(arg)
local safeCarry = tbl4.SafeCarry
local v20 = stealHome()
local v21 = tbl4.Root()
if not v20 or not v21 then
return false
end
fn22()
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
local n21 =(world and world:IsA("BasePart") and world.Position.X or 552) - 7
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
humanoid.PlatformStand = false
end
local now = os.clock()
local n22 = 0
local function fn54()
local v22 = tbl4.Root()
if not v22 then
return
end
local v23, v24, v25, v26, v27 = safeCarry.Plan(tbl4.Steal.CarryAreaId,(Vector3.new(v22.Position.X, 0, v22.Position.Z) - Vector3.new(v20.X, 0, v20.Z)).Magnitude + math.max(0, safeCarry.Height) * 2, safeCarry.Mult)
local n23 = v23 * safeCarry.CarryScale
n22 = n23
safeCarry.PlanOk = v24
safeCarry.FloorSpeed = safeCarry.BeatGuard and math.min(v27 + math.max(safeCarry.GuardMargin, 1), v26) or 0
str3 = string.format("Carrying home at %d (carry %d, guard %d, max %d)%s", math.floor(n23 + 0.5), math.floor(v25 + 0.5), math.floor(v27 + 0.5), math.floor(v26 + 0.5), v24 and "" or ", guard is faster, going at your max safe speed")
end
local function fn55()
local n23 = math.max(0, safeCarry.Height)
local v22 = tbl4.Root()
local character2 = localPlayer.Character
if n23 <= 0.5 or not v22 or not character2 then
return
end
local n24 = v20.Y + n23
if n24 - 2 <= v22.Position.Y then
return
end
local rotation = v22.CFrame.Rotation
local n25 = CFrame.new(Vector3.new(v22.Position.X, n24, v22.Position.Z)) * rotation
pcall(function()
character2:PivotTo(n25)
v22.AssemblyLinearVelocity = Vector3.zero
v22.AssemblyAngularVelocity = Vector3.zero
end)
end
fn54()
local v22 = safeCarry.NewHuman(true)
local v23 = tbl4.Root()
local n23 = math.clamp((v23 and v23.Position.Z or v20.Z) + v22.Lane, -425, -300)
local now2 = os.clock()
if safeCarry.CarryReact > 0 then
local n24 = os.clock() + safeCarry.React(0, safeCarry.CarryReact)
while os.clock() < n24 and not fn13(arg) do
RunService.Heartbeat:Wait()
end
end
local n24 = 0
if safeCarry.CarryStyle ~= "Walk" then
fn55()
end
while not fn13(arg) do
local v24 = tbl4.Root()
if not v24 then
return false
end
if not tbl4.Steal.Carrying then
if safeCarry.LastDelivered >= now then
return true
end
task.wait(0.1)
if now <= safeCarry.LastDelivered then
return true
end
if now <= safeCarry.LastFailed then
str3 = "Delivery was rewound, too fast for your speed"
return false
end
if not safeCarry.PlanOk and tbl4.Steal.CarryUid then
safeCarry.Blocked[tbl4.Steal.CarryUid] = true
str3 = string.format("The guard caught you with %s, it is faster than your max safe speed, skipping this egg", tostring(safeCarry.Category))
return false
end
n24 += 1
if safeCarry.RecoverTries < n24 then
str3 = "The egg is gone"
return false
end
str3 = "Egg dropped, taking it back"
if not fn50(arg) then
str3 = "Could not take the egg back"
return false
end
local n25 = 0
while fn31() and n25 < 4 and not fn13(arg) do
n25 += RunService.Heartbeat:Wait()
end
local n26 = math.min(now, os.clock())
fn54()
if safeCarry.CarryStyle ~= "Walk" then
fn55()
end
v24 = tbl4.Root()
if not v24 then
return false
end
now = n26
end
local now3 = os.clock()
local n25 = math.max(now3 - now2, 0.0041666666666666666)
local flag3 = safeCarry.CarryStyle == "Walk"
local n26 = flag3 and 0 or math.max(0, safeCarry.Height)
local v25, v26 = v22.Step(n25, n26 <= 0.5 and humanoid or nil, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)
local n27 = math.clamp(n23 + v26, -425, -300)
local vector = v24.Position.X > n21 + 2 and Vector3.new(n21, v24.Position.Y, n27) or v20
local v27, v28 = safeCarry.Avoid(v24.Position, vector)
if not v28 then
v27 = vector
end
local vector2 = Vector3.new(v27.X - v24.Position.X, 0, v27.Z - v24.Position.Z)
if vector2.Magnitude < 2 and v27 == v20 then
break
end
local n28 = math.max(n22 * v25, safeCarry.FloorSpeed or 0)
if os.clock() <(safeCarry.SlowUntil or 0) then
n28 *= safeCarry.SlowFactor
end
if flag3 then
pcall(function()
if humanoid and vector2.Magnitude > 0.01 then
humanoid:MoveTo(v24.Position + vector2.Unit * math.min(vector2.Magnitude, 30))
end
end)
elseif n26 > 0.5 then
local n29 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
local y = v20.Y
local n30 = math.max(0, v24.Position.X - n21)
local n31 = n26 * math.sqrt(1 - n29 * n29) / n29
local n32 = y + n26
if v27 == v20 or n30 <= n31 then
n32 = y + n26 * math.clamp((v27 == v20 and 0 or n30) / math.max(n31, 1), 0, 1)
end
local n33 = math.clamp((n32 - v24.Position.Y) / 0.12, -n28 * n29, n28 * n29)
local v29 = math.sqrt(math.max(n28 * n28 - n33 * n33, 0))
local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(v29, vector2.Magnitude / 0.05) or Vector3.zero
pcall(function()
v24.AssemblyLinearVelocity = Vector3.new(vector3.X, n33, vector3.Z)
end)
else
local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(n28, vector2.Magnitude / 0.05) or Vector3.zero
pcall(function()
v24.AssemblyLinearVelocity = Vector3.new(vector3.X, v24.AssemblyLinearVelocity.Y, vector3.Z)
if safeCarry.RunAnimate and humanoid and vector2.Magnitude > 0.01 then
humanoid:Move(vector2.Unit, false)
end
end)
end
RunService.Heartbeat:Wait()
now2 = now3
end
if humanoid then
pcall(function()
local v24 = tbl4.Root()
if safeCarry.CarryStyle == "Walk" and v24 then
humanoid:MoveTo(v24.Position)
end
humanoid:Move(Vector3.zero, false)
end)
end
local n25 = 0
while n25 < 2 and not fn13(arg) do
if now <= safeCarry.LastDelivered then
return true
end
if now <= safeCarry.LastFailed then
str3 = "Delivery was rewound, too fast for your speed"
return false
end
if not tbl4.Steal.Carrying then
break
end
n25 += RunService.Heartbeat:Wait()
end
if tbl4.Steal.Carrying then
task.wait(0.2)
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
end
return safeCarry.LastDelivered >= now
end
local function fn54(arg)
local antiGuard = tbl4.AntiGuard
if antiGuard.Enabled and not tbl4.SafeCarry.LineDrop and not tbl4.BossPortalUp() then
local n21 = 0
while not antiGuard.Busy and n21 < 1 and not fn13(arg) do
str3 = "Waiting for Anti Guard to start"
n21 += RunService.Heartbeat:Wait()
end
local busy = antiGuard.Busy
local n22 = 0
while antiGuard.Busy and n22 < 30 and not fn13(arg) do
str3 = "Anti Guard is slipping past the guard"
n22 += RunService.Heartbeat:Wait()
end
if busy then
local n23 = 0
local n24 = 0
while true do
if n23 < 10 and not fn13(arg) then
local v20 = fn31()
local ok, result = pcall(tbl4.Steal.HeldByMe)
ok = ok and result == true
local flag3 = not v20
if not(flag3 and not ok) then
if flag3 and ok and not antiGuard.Busy then
n24 += RunService.Heartbeat:Wait()
if not(n24 >= 0.3) then
continue
end
else
str3 = v20 and "The guard hit you, waiting until you can move" or "Waiting for Anti Guard to finish"
n23 += RunService.Heartbeat:Wait()
n24 = 0
continue
end
end
end
break
end
local ok, result = pcall(tbl4.Steal.HeldByMe)
if ok and not result then
tbl4.Steal.Carrying = false
end
local safeCarry = tbl4.SafeCarry
local v20 = stealHome()
local n25 = v20 and safeCarry.Enabled and safeCarry.CarryStyle ~= "Walk" and safeCarry.Height > 0.5 and v20.Y + safeCarry.Height or nil
local n26 = 0
while n26 < 0.8 and tbl4.Steal.Carrying and not fn13(arg) do
str3 = n26 < 0.6 and "Anti Guard done, rising up" or "Anti Guard done, getting ready"
local v21 = tbl4.Root()
if v21 and n25 then
local n27 = n25 - v21.Position.Y
local n28 = n26 < 0.6 and math.clamp(n27 / math.max(0.6 - n26, 0.1), -120, 120) or math.clamp(n27 / 0.2, -30, 30)
pcall(function()
v21.AssemblyLinearVelocity = Vector3.new(0, n28, 0)
end)
end
n26 += RunService.Heartbeat:Wait()
end
local ok2, result2 = pcall(tbl4.Steal.HeldByMe)
if ok2 and not result2 then
tbl4.Steal.Carrying = false
else
tbl4.SafeCarry.SlowUntil = os.clock() + 2
end
end
end
local n21 = 0
while not tbl4.Steal.Carrying and n21 < n14 and not fn13(arg) do
str3 = "Checking the egg in hand"
n21 += RunService.Heartbeat:Wait()
end
if not tbl4.Steal.Carrying then
str3 = "The egg is gone, staying to look for it"
if not fn50(arg) then
str3 = "The egg is gone"
return false
end
end
if tbl4.SafeCarry.LineDrop then
return tbl4.SafeCarry.LineDropHome(arg)
end
if tbl4.SafeCarry.Enabled then
return tbl4.SafeCarry.Home(arg)
end
local v20 = stealHome()
local v21 = tbl4.Root()
if not v20 or not v21 then
return false
end
local n22 = math.max(v21.Position.Y, v20.Y) + n7
local function fn55()
if tbl33.Uid and tbl33.Freed and tbl4.Steal.Carrying then
return "priority"
end
return nil
end
local flag3 = true
local n23 = 0
while true do
local v22 = tbl4.Root()
if not v22 then
return false
else
str3 = "Flying home"
local position = v22.Position
local n24 = math.max(n22, position.Y)
local v23, v24 = fn35(Vector3.new(position.X +(v20.X - position.X) * 0.25, position.Y +(n24 - position.Y) * 0.7, position.Z +(v20.Z - position.Z) * 0.25), arg, flag3, nil, nil, fn55)
if v23 then
v23, v24 = fn35(Vector3.new(v20.X, n24, v20.Z), arg, flag3, nil, nil, fn55)
end
if v23 then
v23, v24 = fn35(v20, arg, flag3, nil, nil, fn55)
end
if v23 then
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if character then
character.PlatformStand = false
end
task.wait(0.2)
if not tbl4.Steal.Carrying then
str3 = "Arrived without the egg"
return false
end
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
return true
end
if v24 == "priority" then
local uid2 = tbl33.Uid
local freed = tbl33.Freed
local v25 = tbl33
tbl33.Uid = nil
v25.Freed = nil
local v26 = tbl4.Root()
if not v26 or not uid2 or not freed then
return false
end
if(freed - v26.Position).Magnitude <= n8 * n20 then
str3 = "Best egg fell nearby, swapping eggs"
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
pcall(eggState.DropFieldEgg, "PlayerRequest")
end
local n25 = 0
while tbl4.Steal.Carrying and n25 < 1 do
n25 += RunService.Heartbeat:Wait()
end
if not fn50(arg, uid2) then
return false
end
else
str3 = "Best egg fell far away, riding a guard hit to it"
if not fn53(arg, uid2, freed) then
return false
end
end
local v27 = tbl4.Root()
n23 = 0
if v27 then
n22 = math.max(v27.Position.Y, v20.Y) + n7
end
continue
end
if v24 == "dropped" and n23 < huge then
n23 += 1
if not fn50(arg) then
return false
end
continue
end
break
end
end
return false
end
local function fn55(arg)
local n21 = tonumber(arg) or 0
local tbl34 ={"", "K", "M", "B", "T", "Qa", "Qi"}
local n22 = 1
while math.abs(n21) >= 1000 and n22 < #tbl34 do
n21 /= 1000
n22 += 1
end
return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl34[n22])
end
local function fn56(arg)
if not arg then
return "None"
end
local format = string.format
local str4 = tostring(arg.Category)
local n21 = tonumber(arg.Scale) or 0
local v20 = tostring
local areaId = arg.AreaId
local v21 = format("%s  %.2fx  |  value %s  |  %s", str4, n21, fn55(arg.Value), v20(areaId))
if arg.State == "Dropped" then
v21..= "  |  dropped"
elseif arg.State == "Carried" then
v21..= "  |  carried by a player"
end
return v21
end
local flag3 = false
local n21 = 0.5
local n22 = 0.6
local n23 = 0
local n24 = 0
local function fn57()
local v20 = n9
tbl4.Steal.Active = true
tbl4.Steal.Carrying = tbl4.Steal.Carrying == true
if not tbl4.Steal.Carrying then
tbl4.Steal.CarryUid = nil
end
local v21 = fn19(false, true)
local v22 = nil
local v23 = nil
local lastSkip = nil
for _, v24 in ipairs(v21) do
if v24.State == "Carried" then
v23 = v23 or v24
elseif not tbl4.StockWaits(v24) then
local v25 = tbl4.SafeCarry.Unsafe(v24)
if v25 then
lastSkip = lastSkip or v25
else
v22 = v24
break
end
end
end
local tbl34 ={v22}
uid = v22 and v22.Uid or nil
tbl4.Steal.Wanted = v22 ~= nil
str2 = fn56(v22)
if v23 then
str2..= "  |  watching ".. tostring(v23.Category)
end
if not v22 then
tbl4.Steal.Active = false
lastSkip = lastSkip or tbl4.SafeCarry.LastSkip
tbl4.SafeCarry.LastSkip = nil
str3 = v23 and "Best egg is carried, waiting for it" or lastSkip and "Skipped: ".. lastSkip or "No egg matches"
return false
end
if not tbl4.ClaimMovement("steal") then
tbl4.Steal.Active = false
str3 = "Waiting for Auto Place"
return false
end
if tbl4.Treadmill.Riding or tbl4.OnBelt() then
tbl4.ExitBelt()
end
flag3 = true
tbl4.HoldBelt()
local function fn58(arg)
str3 = arg
local v24 = fn51(v22, v20)
local v25 = nil
local flag4 = false
if v24 then
if fn29(v22.Uid, v20) then
flag4 = fn54(v20)
v25 = nil
else
v25 = str3
end
end
fn25()
tbl4.Steal.Active = false
tbl4.Steal.LastFinishedAt = os.clock()
local str4 = flag4 and "Delivered" or v25
local str5
if str4 then
str5 = str4
else
str5 = v24 and "Run ended" or "That egg would not come free"
end
str3 = str5
return true
end
local v24 = tbl4.Root()
local position = typeof(v22.CFrame) == "CFrame" and v22.CFrame.Position or nil
if v24 and position then
local flag4 =(position - v24.Position).Magnitude <= n17
local areaId = v22.AreaId
local flag5 = localPlayer:GetAttribute("AreaId") == areaId
if flag4 or flag5 then
return(fn58("Target is right here, taking it"))
end
end
if tbl4.SafeCarry.Enabled and tbl4.SafeCarry.Approach == "Run" then
local v25 = tbl4.SafeCarry.RunTo(v22, v20)
local flag4, v26
if v25 then
if fn29(v22.Uid, v20) then
flag4 = fn54(v20)
v26 = nil
else
v26 = str3
flag4 = false
end
else
tbl31[v22.Uid] = os.clock() + n10
v26 = nil
flag4 = false
end
fn25()
tbl4.Steal.Active = false
tbl4.Steal.LastFinishedAt = os.clock()
str3 = flag4 and "Delivered" or v26 or v25 and "Run ended" or "That egg would not come free"
return true
end
local v25 = fn19(true)
local str4 = "FirstAreaEgg_".. tostring(localPlayer.UserId)
local tbl35 ={}
for _, v26 in ipairs(v25) do
local v27 = fn36(v26)
local flag4
if v27 then
flag4 = v27
else
flag4 = type(v26.Uid) == "string" and string.sub(v26.Uid, 1, #str4) == str4
end
if flag4 then
table.insert(tbl35, v26)
end
end
if #tbl35 ~= 0 then
v25 = tbl35
end
local v26, v27 = fn33(v25)
if not v26 then
tbl4.Steal.Active = false
str3 = "No egg matches"
return false
end
if v26.Uid == v22.Uid then
return(fn58("Target is the closest egg, taking it"))
end
local v28, v29 = fn37(v26)
local v30
if v29 and v24 then
local v31, v32, v33 = ipairs(v25)
local huge3 = math.huge
local v34 = v26
for _, v35 in v31, v32, v33 do
local position2 = typeof(v35.CFrame) == "CFrame" and v35.CFrame.Position or nil
if v35.Uid ~= v22.Uid and v35.AreaId == v26.AreaId and position2 then
local magnitude =(position2 - v24.Position).Magnitude
if n16 <(position2 - v29).Magnitude then
magnitude += n16
end
if magnitude < huge3 then
huge3 = magnitude
v34 = v35
end
end
end
v30 = v34
else
v30 = v26
end
str3 = string.format("Sleeping guard egg %d studs away", math.floor(v27 + 0.5))
if not v30 then
tbl4.Steal.Active = false
str3 = "No egg matches"
return false
end
local v31, v32 = fn45(v30, v20, false, tbl34[1])
if not v31 then
tbl4.Steal.Active = false
return false
end
local uid2 = nil
local uid3 = v22.Uid
local n25 = 0
while true do
if v32 and not fn13(v20) then
str3 = "Holding for the guard hit"
if fn38(v20, v32, function(arg)
if not uid2 and tbl33.Uid and tbl33.Freed then
uid2 = tbl33.Uid
arg.Destination = tbl33.Freed + Vector3.new(0, 3, 0)
local v33 = tbl33
tbl33.Uid = nil
v33.Freed = nil
str3 = "Best egg fell, jumping to it instead"
end
end) then
n25 += 1
if uid2 then
uid3 = uid2
fn50(v20, uid2)
break
else
local v33 = tbl34[n25]
local v34
v34, v32 = fn45(v33, v20, true, tbl34[n25 + 1])
if v34 then
if v33 and type(v33.Uid) == "string" then
uid3 = v33.Uid
end
continue
end
end
end
end
break
end
if not fn29(uid3, v20) then
local v33 = str3
fn25()
tbl4.Steal.Active = false
tbl4.Steal.LastFinishedAt = os.clock()
str3 = v33
return true
end
local v33 = fn54(v20)
fn25()
tbl4.Steal.Active = false
tbl4.Steal.LastFinishedAt = os.clock()
str3 = v33 and "Delivered" or "Run ended"
return true
end
local eggState = tbl.EggState
if type(eggState) == "table" then
for _, v20 in ipairs({"FieldRefreshed", "FieldShifted", "FieldGone", "SnapshotRefreshed"}) do
local v21 = eggState[v20]
if type(v21) == "table" and type(v21.Connect) == "function" then
local ok, result = pcall(v21.Connect, v21, function()
tbl3.Wake()
end)
if ok and result then
fn4(function()
pcall(function()
result:Disconnect()
end)
end)
end
end
end
end
tbl3.Add(function()
local flag4 = nil
if v16 then
flag4 = type(v16.Set) == "function"
end
if flag4 then
pcall(v16.Set, nil, str3)
end
local flag5 = nil
if v17 then
flag5 = type(v17.Set) == "function"
end
if flag5 then
pcall(v17.Set, nil, str2)
end
if not tbl4.Toggle(v15, false) then
return false
end
local v20, v21, v22 = fn14()
if v20 then
if v21 == "night" then
fn16()
end
tbl4.Movement.StealFirst = true
tbl4.Steal.Wanted = false
if flag2 then
n9 += 1
tbl4.Steal.Active = false
fn25()
tbl4.StopWalking()
end
local n25 = math.max(0, math.ceil(v20 - v22))
if v21 == "wall" then
str3 = string.format("Field wall up, %ds", n25)
else
str3 = string.format("Night, going again in %ds", n25)
end
return false
end
if v18 and n12 == math.huge then
n12 = os.clock() + n11
end
if flag2 then
return true
end
if fn17() then
str3 = "Night over, waiting for the field to reset"
tbl3.Wake()
return false
end
local stealFirst = tbl4.Movement.StealFirst
local owner = tbl4.Movement.Owner
if tbl4.Movement.PlaceWanted and not stealFirst or owner ~= nil and owner ~= "steal" and owner ~= "treadmill" and owner ~= "scramble" then
if n23 <= os.clock() then
n23 = os.clock() + n21
local ok, result = pcall(fn19, false, false)
local wanted = ok and type(result) == "table" and result[1] ~= nil and not tbl4.StockWaits(result[1])
tbl4.Steal.Wanted = wanted
if wanted then
tbl4.Movement.StealFirst = true
end
end
if tbl4.Steal.Wanted then
local v23 = tostring
owner = owner or "Auto Place"
str3 = "Egg found, waiting for ".. v23(owner).. " to stop"
else
str3 = "Waiting for ".. tostring(owner or "Auto Place")
end
return true
end
if os.clock() < n24 then
return true
end
tbl4.Movement.StealFirst = false
flag2 = true
task.spawn(function()
local ok = pcall(fn57)
if flag3 then
flag3 = false
tbl4.ReleaseBelt()
end
if not ok then
fn25()
tbl4.Steal.Active = false
end
local v23 = uid
uid = nil
local v24 = v23 and tbl27[v23]
if v24 and v24.Once then
tbl27[v23] = nil
end
local v25 = tbl33
local v26 = tbl33
tbl33.Uid = nil
v25.Freed = nil
v26.Token = nil
if str3 == "Delivered" and not tbl4.IsNight() then
tbl4.Movement.StealFirst = true
end
if not tbl4.Steal.Wanted then
n24 = os.clock() + n22
end
tbl4.ReleaseMovement("steal")
flag2 = false
tbl3.Wake()
end)
return true
end)
end
v15 = v5
fn12 = function()
n9 += 1
table.clear(tbl31)
tbl4.Steal.Active = false
tbl4.Steal.Wanted = false
local v20 = tbl4.Toggle(v15, false)
tbl4.Shield("steal", v20)
if not v20 then
tbl4.Movement.StealFirst = false
table.clear(tbl27)
table.clear(tbl28)
table.clear(tbl29)
end
fn25()
tbl4.StopWalking()
tbl3.Wake()
end
do
local function fn39()
n9 += 1
tbl4.Steal.Active = false
fn25()
tbl4.StopWalking()
end
local function fn40()
if tbl4.Toggle(v15, false) then
return true
end
if v15 and type(v15.Set) == "function" then
pcall(v15.Set, v15, true)
end
return false
end
tbl4.CancelSteal = function(arg)
if type(arg) ~= "string" then
return
end
tbl27[arg] = nil
tbl28[arg] = nil
tbl29[arg] = true
if flag2 and uid == arg then
fn39()
end
tbl3.Wake()
end
tbl4.StealQueue = function()
local tbl32 ={}
for k in pairs(tbl27) do
table.insert(tbl32, k)
end
table.sort(tbl32, function(arg, arg2)
local at = tbl27[arg].At
local at2 = tbl27[arg2].At
if at ~= at2 then
return at < at2
end
return arg < arg2
end)
return tbl32
end
tbl4.PrioritizeSteal = function(arg)
if type(arg) ~= "string" or fn15() then
return
end
local n18 = 0
for _, v20 in pairs(tbl27) do
if v20.At < n18 then
n18 = v20.At
end
end
tbl27[arg] ={At = n18 - 1, Once = false}
tbl29[arg] = nil
tbl31[arg] = nil
if fn40() and flag2 and not tbl4.Steal.Carrying and uid ~= arg then
fn39()
end
tbl3.Wake()
end
tbl4.MoveInPlan = function(arg, arg2)
if type(arg) ~= "string" or arg2 ~= -1 and arg2 ~= 1 or fn15() then
return
end
local v20 = tbl4.StealPlan()
local v21 = table.find(v20, arg)
local n18 = v21 and v21 + arg2
if not n18 or n18 < 1 or n18 > #v20 then
return
end
table.remove(v20, v21)
table.insert(v20, n18, arg)
local n19 = math.max(v21, n18)
for i, v22 in ipairs(v20) do
if i <= n19 or tbl27[v22] then
local v23 = tbl27[v22]
if v23 then
v23.At = i
else
tbl27[v22] ={At = i, Once = false}
end
tbl29[v22] = nil
end
end
if flag2 and not tbl4.Steal.Carrying and uid and v20[1] ~= uid then
fn39()
end
tbl3.Wake()
end
tbl4.StealPlan = function()
if not tbl4.Toggle(v15, false) or tbl4.IsNight() then
return{}, nil
end
local tbl32 ={}
if uid then
table.insert(tbl32, uid)
end
local ok, result = pcall(fn19, false, true)
if ok and type(result) == "table" then
for _, v20 in ipairs(result) do
if v20.Uid ~= uid then
table.insert(tbl32, v20.Uid)
end
end
end
return tbl32, uid
end
tbl4.SetPriority = function(arg, arg2)
if arg2 then
tbl4.PrioritizeSteal(arg)
else
tbl4.CancelSteal(arg)
end
end
tbl4.ResortSteal = function()
if flag2 and not tbl4.Steal.Carrying and uid and not tbl27[uid] then
local ok, result = pcall(fn19, false, true)
if ok and type(result) == "table" then
local v20 = nil
for _, v21 in ipairs(result) do
if v21.State ~= "Carried" then
v20 = v21
break
else
v20 = nil
end
end
if not v20 or v20.Uid ~= uid then
fn39()
end
end
end
tbl3.Wake()
end
tbl4.StealNow = function(arg, arg2)
if type(arg) ~= "string" or fn15() then
return
end
if not tbl27[arg] then
local n18 = 0
for _, v20 in pairs(tbl27) do
if n18 < v20.At then
n18 = v20.At
end
end
tbl27[arg] ={At = n18 + 1, Once = arg2 == true}
end
tbl29[arg] = nil
tbl31[arg] = nil
local flag3 = fn40() and flag2 and not tbl4.Steal.Carrying and uid ~= arg
if flag3 then
flag3 = not(uid and tbl27[uid])
end
if flag3 then
fn39()
end
tbl3.Wake()
end
end
fn4(function()
tbl4.GodMode(false)
tbl4.ReleaseMovement("steal")
fn25()
end)
tbl4.UiQueue ={}
tbl4.UiDefer = function(arg)
table.insert(tbl4.UiQueue, arg)
end
tbl4.Notify = function(arg, arg2)
if type(v) == "table" and type(v.Notify) == "function" then
pcall(v.Notify, arg, arg2, 5)
end
end
local connection = RunService.Heartbeat:Connect(function()
local uiQueue = tbl4.UiQueue
if #uiQueue == 0 then
return
end
tbl4.UiQueue ={}
for _, v20 in ipairs(uiQueue) do
pcall(v20)
end
end)
fn4(function()
pcall(function()
connection:Disconnect()
end)
end)tbl4.Rift ={Requirements ={}, At = 0, Busy = false, Next = 0, Handles ={}, Restart ={}}
tbl4.RiftOn = function(arg)
local v20 = tbl4.Rift.Handles[arg]
return v20 ~= nil and tbl4.Toggle(v20, false) == true
end
do
local n18 = 8
local function fn39(arg)
local directory = tbl.Assets and tbl.Assets.Directory
local flag3 = type(directory) == "table" and directory[tostring(arg)] or nil
return type(flag3) == "table" and flag3 or nil
end
tbl4.EggRarity = function(arg)
local rarity = fn39(arg.AssetCategory)
rarity = rarity and rarity.Rarity or nil
local flag3 = type(rarity) == "table"
if flag3 then
flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
end
return flag3 or 0
end
tbl4.EggIncome = function(arg)
local n19 = fn39(arg.AssetCategory)
n19 = n19 and tonumber(n19.EarningRate) or 0
local n20 = tonumber(arg.AssetScale) or 0
if n20 <= 0 then
return 0
end
local n21 = n20 > 5 and(n20 / 5) ^ 1.2 * 19.637875755794113 or n20 ^ 1.85
local mutations = tbl.Mutations
local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n22 = 1
if flag3 then
local ok
ok, n22 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
ok = ok and type(n22) == "number"
local n23 = 1
if not ok then
n22 = n23
end
end
return n19 * n21 * n22
end
tbl4.RiftShortfall = function()
local tbl32 ={}
for _, requirement in ipairs(tbl4.Rift.Requirements) do
tbl32[requirement] =(tbl32[requirement] or 0) + 1
end
if next(tbl32) == nil then
return tbl32
end
local save = tbl.Save
local flag3 = type(save) == "table" and type(save.Get) == "function"
local result = nil
if flag3 then
local ok
ok, result = pcall(save.Get)
result = ok and type(result) == "table" and result or nil
end
if not result then
return{}
end
local tbl33 ={}
local v20 = pairs
local equippedAssets = result.EquippedAssets or{}
for _, equippedAsset in v20(equippedAssets) do
tbl33[equippedAsset] = true
end
local v21 = pairs
local inventory = result.Inventory or{}
for k, v22 in v21(inventory) do
local str4 = type(v22) == "table" and tostring(v22.Category) or nil
local flag4
if str4 then
flag4 =(tbl32[str4] or 0) > 0
else
flag4 = str4
end
flag4 = flag4 and v22.InFuse ~= true and v22.IsFavorite ~= true and not tbl33[k]
if flag4 then
tbl32[str4] = tbl32[str4] - 1
end
end
for k, v22 in pairs(tbl32) do
if v22 <= 0 then
tbl32[k] = nil
end
end
return tbl32
end
local function fn40()
for k in pairs(tbl4.Rift.Handles) do
if tbl4.RiftOn(k) then
return true
end
end
return false
end
tbl3.Add(function()
local rift = tbl4.Rift
local busy = rift.Busy
local flag3
if busy then
flag3 = busy
else
local next_ = rift.Next
flag3 = os.clock() < next_
end
if flag3 or not fn40() then
return false
end
rift.Busy = true
rift.Next = os.clock() + n18
task.spawn(function()
local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")
if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)
if ok and type(result) == "table" then
local requirements ={}
if result.Unlocked == true and type(result.Requirements) == "table" and tbl4.Lab.BannerOk(result.BannerId) then
for _, requirement in ipairs(result.Requirements) do
table.insert(requirements, tostring(requirement))
end
end
rift.Requirements = requirements
rift.At = os.clock()
end
end
rift.Busy = false
tbl3.Wake()
end)
return false
end)
end
local tbl32
tbl32 ={"Always", "Steal Idle", "After Steal", "Night Only"}
local tbl33
tbl33 ={"Biggest Size", "Highest Value", "Smallest Size", "Backpack Order"}
local v20
v20 = tbl32[1]
local v21
v21 = tbl33[2]
local tbl34
tbl34 ={}
local tbl35
tbl35 ={}
local n18
n18 = 0
do
local function fn39()
if type(tbl4.PlaceEggRefresh) == "function" then
tbl4.PlaceEggRefresh()
end
end
local function fn40(arg)
local tbl36 ={}
if type(arg) == "table" then
for k, v22 in pairs(arg) do
k = v22 == true and type(k) == "string" and k or type(v22) == "string" and v22 or nil
if k then
table.insert(tbl36, k)
end
end
end
return tbl36
end
tbl4.PlaceEggStatusRow = v10:CreateText({Name = "Pen Status", Text = "Pen status unknown"})
tbl4.PlaceEggHandle = v10:CreateToggle({
Name = "Auto Place Egg",
Default = false,
Callback = function()
if type(tbl4.PlaceEggRestart) == "function" then
tbl4.PlaceEggRestart()
end
end,
})
local placeEggHandle = tbl4.PlaceEggHandle
v10:CreateDropdown({
Name = "Place Egg Rule",
Options = tbl32,
Default = tbl32[1],
SubOf = placeEggHandle,
Callback = function(arg)
if table.find(tbl32, arg) then
v20 = arg
end
end,
})
v10:CreateDropdown({
Name = "Place Egg Order",
Options = tbl33,
Default = tbl33[2],
SubOf = placeEggHandle,
Callback = function(arg)
if table.find(tbl33, arg) then
v21 = arg
end
end,
})
local tbl36 ={}
for i = 2, #tbl12 do
table.insert(tbl36, tbl12[i])
end
if #tbl36 > 0 then
fn6(v10:CreateMultiDropdown({
Name = "Place Rarities",
Note = "Only place eggs of the picked rarities (empty = all)",
Options = tbl36,
Default ={},
SubOf = placeEggHandle,
Callback = function(arg)
local tbl37 ={}
for _, v22 in ipairs(fn40(arg)) do
local v23 = tbl13[v22]
if v23 and v23 > 0 then
tbl37[v23] = true
end
end
tbl34 = tbl37
fn39()
end,
}))
end
local tbl37 ={}
local tbl38 ={}
local directory = tbl.Assets and tbl.Assets.Directory
local tbl39 ={}
if type(directory) == "table" then
for k, v22 in pairs(directory) do
local rarity = type(v22) == "table" and v22.Rarity or nil
local flag3 = type(rarity) == "table"
if flag3 then
flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
end
flag3 = flag3 or nil
if flag3 then
table.insert(tbl39,{
Category = tostring(k),
Name = tostring(v22.DisplayName or k),
Rarity = flag3,
RarityName = tostring(rarity.DisplayName or rarity._id or flag3),
})
end
end
end
table.sort(tbl39, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity > arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v22 in ipairs(tbl39) do
local str4 = string.format("%s [%s]", v22.Name, v22.RarityName)
if tbl38[str4] then
str4 = string.format("%s [%s] (%s)", v22.Name, v22.RarityName, v22.Category)
end
table.insert(tbl37, str4)
tbl38[str4] = v22.Category
end
if #tbl37 > 0 then
fn6(v10:CreateMultiDropdown({
Name = "Place Specific Eggs",
Note = "Only place these eggs (empty = all)",
Options = tbl37,
Default ={},
SubOf = placeEggHandle,
Callback = function(arg)
local tbl40 ={}
for _, v22 in ipairs(fn40(arg)) do
if tbl38[v22] then
tbl40[tbl38[v22]] = true
end
end
tbl35 = tbl40
fn39()
end,
}))
end
local tbl40 ={
["K/s"] ={Min = 0, Max = 1000, Mult = 1000},
["M/s"] ={Min = 0, Max = 1000, Mult = 1000000},
["B/s"] ={Min = 0, Max = 100, Mult = 1e9},
}
local n19 = 0
local str4 = "M/s"
local function fn41(arg, arg2)
if arg ~= nil then
n19 = math.max(0, math.floor(tonumber(arg) or n19))
end
if arg2 ~= nil then
str4 = tostring(arg2)
end
n18 = n19 *(tbl40[str4] or tbl40["M/s"]).Mult
end
fn5(v10,{
Name = "Min Place Value",
Note = "Skip eggs worth less than this (0 = off)",
SubOf = placeEggHandle,
Legacy = "Place Min Value",
SectionName = "Auto Place Egg",
OnRaw = function(arg)
fn41(math.floor(arg / 1000), "K/s")
end,
})
end
do
local n19 = 5
local n20 = 26
local n21 = 6
local n22 = 8
local n23 = 0
local n24 = 30
local n25 = 12
local placeEggHandle = nil
local placeEggStatusRow = nil
local str4 = "Pen status unknown"
local flag3 = false
local tbl36 ={}
local n26 = 0
local v22 = nil
local n27 = 30
local function fn39(arg, arg2)
local v23 = networking:FindFirstChild(arg)
if not v23 or not v23:IsA("RemoteFunction") then
return false, nil
end
return pcall(v23.InvokeServer, v23, arg2)
end
local function fn40(arg)
local directory = tbl.Assets and tbl.Assets.Directory
local flag4 = type(directory) == "table" and directory[tostring(arg.AssetCategory)] or nil
return type(flag4) == "table" and flag4 or nil
end
local function fn41(arg)
local rarity = fn40(arg)
rarity = rarity and rarity.Rarity or nil
local flag4 = type(rarity) == "table"
if flag4 then
flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
end
return flag4 or 0
end
local function fn42(arg)
local n28 = fn40(arg)
n28 = n28 and tonumber(n28.EarningRate) or 0
local n29 = tonumber(arg.AssetScale) or 0
if n29 <= 0 then
return 0
end
local n30 = n29 > 5 and(n29 / 5) ^ 1.2 * 19.637875755794113 or n29 ^ 1.85
local mutations = tbl.Mutations
local flag4 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n31 = 1
if flag4 then
local ok
ok, n31 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
ok = ok and type(n31) == "number"
local n32 = 1
if not ok then
n31 = n32
end
end
return n28 * n30 * n31
end
local function fn43()
local tbl37 ={}
local backpack = localPlayer:FindFirstChildOfClass("Backpack")
if not backpack then
return tbl37
end
local n28 = 0
for _, child in ipairs(backpack:GetChildren()) do
local attribute = child:GetAttribute("UID")
if type(attribute) == "string" then
n28 += 1
tbl37[attribute] = n28
end
end
return tbl37
end
local function fn44()
local eggState = tbl.EggState
if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
return{}
end
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if not ok or type(result) ~= "table" then
return{}
end
local v23 = fn43()
local v24 = tbl4.Lab.StockTargets()
local tbl37 ={}
if tbl4.RiftOn("Place") then
tbl37 = tbl4.RiftShortfall()
for _, v25 in pairs(result) do
if type(v25) == "table" and v25.Placement ~= nil then
local str5 = tostring(v25.AssetCategory)
if(tbl37[str5] or 0) > 0 then
tbl37[str5] = tbl37[str5] - 1
end
end
end
end
local tbl38 ={}
for k, v25 in pairs(result) do
if type(v25) == "table" and v25.Placement == nil and not tbl36[k] and not tbl4.Lab.Reserved[k] then
local str5 = tostring(v25.AssetCategory)
if(v24[str5] or 0) > 0 then
v24[str5] = v24[str5] - 1
else
local v26 = fn42(v25)
local str6 = tostring(v25.AssetCategory)
local flag4 = next(tbl34) == nil or tbl34[fn41(v25)] == true
local flag5 = next(tbl35) == nil or tbl35[str6] == true
local flag6 = n18 <= 0 or v26 >= n18
local flag7 =(tbl37[str6] or 0) > 0
if flag7 then
tbl37[str6] = tbl37[str6] - 1
end
if tbl4.Lab.PlaceOn and tbl4.Lab.IsLabPet(str6) then
flag7 = true
end
flag6 = tbl4.Toggle(tbl4.PlaceEggHandle, false) == true and flag4 and flag5 and flag6
if flag7 or flag6 then
table.insert(tbl38,{
Uid = k,
Scale = tonumber(v25.AssetScale) or 0,
Income = v26,
Slot = v23[k] or math.huge,
Rift = flag7,
})
end
end
end
end
table.sort(tbl38, function(arg, arg2)
if arg.Rift ~= arg2.Rift then
return arg.Rift
end
if v21 == tbl33[2] and arg.Income ~= arg2.Income then
return arg.Income > arg2.Income
end
if v21 == tbl33[3] and arg.Scale ~= arg2.Scale then
return arg.Scale < arg2.Scale
end
if v21 == tbl33[4] and arg.Slot ~= arg2.Slot then
return arg.Slot < arg2.Slot
end
return arg.Scale > arg2.Scale
end)
return tbl38
end
local function fn45(arg)
if arg == 0 then
return false
end
if not tbl4.Toggle(placeEggHandle, false) then
return true
end
local steal = tbl4.Steal
if v20 == tbl32[2] then
return not steal.Active and not steal.Carrying
end
if v20 == tbl32[3] then
local flag4 = steal.LastFinishedAt > 0
if flag4 then
local lastFinishedAt = steal.LastFinishedAt
flag4 = os.clock() - lastFinishedAt <= n25
end
return flag4
end
if v20 == tbl32[4] then
return tbl4.IsNight()
end
return true
end
local function fn46()
local eggState = tbl.EggState
local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
local n28 = 0
if flag4 then
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if ok and type(result) == "table" then
for _, v23 in pairs(result) do
if type(v23) == "table" and v23.Placement ~= nil then
n28 += 1
end
end
end
end
local save = tbl.Save
local flag5 = type(save) == "table" and type(save.Get) == "function"
local result = nil
if flag5 then
local ok
ok, result = pcall(save.Get)
result = ok and type(result) == "table" and result or nil
end
local flag6 = result and type(result.EquippedAssets) == "table"
local n29 = 0
if flag6 then
for k in pairs(result.EquippedAssets) do
n29 += 1
end
end
local v23 = fn2(function()
return ReplicatedStorage.Data.Bases
end)
local flag7 = type(v23) == "table" and type(v23.GetAssetEquipCapacity) == "function"
local num = nil
if flag7 then
local ok, result2 = pcall(v23.GetAssetEquipCapacity, result and tonumber(result.BaseUpgradeLevel) or 0)
num = ok and tonumber(result2) or nil
end
if not num then
local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")
if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
local result2
num, result2 = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
num = num and tonumber(result2) or nil
end
end
num = num or 0
return num - n28 - n29, num, n28, n29
end
local n28 = -0.5
local n29 = -24
local function fn47()
local eggState = tbl.EggState
local tbl37 ={}
if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
return tbl37
end
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if not ok or type(result) ~= "table" then
return tbl37
end
for _, v23 in pairs(result) do
local placement = type(v23) == "table" and v23.Placement or nil
local localCFrame = type(placement) == "table" and placement.LocalCFrame or nil
if typeof(localCFrame) == "CFrame" then
table.insert(tbl37, Vector2.new(localCFrame.Position.X, localCFrame.Position.Z))
end
end
return tbl37
end
local v23 = Random.new()
local function fn48(arg)
local tbl37 ={}
for i = n29, 8, 4 do
for i2 = 4, 30, 4 do
local vector2 = Vector2.new(i, i2)
local flag4 = true
for _, v24 in ipairs(arg) do
if(v24 - vector2).Magnitude < n19 then
flag4 = false
break
end
end
if flag4 then
table.insert(tbl37, CFrame.new(i, n28, i2))
end
end
end
for i = #tbl37, 2, -1 do
local v24 = v23:NextInteger(1, i)
local v25 = tbl37[i]
tbl37[i] = tbl37[v24]
tbl37[v24] = v25
end
return tbl37
end
local function fn49()
local v24, v25, v26, v27 = fn46()
local eggState = tbl.EggState
local flag4 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
local n30 = 0
if flag4 then
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if ok and type(result) == "table" then
for _, v28 in pairs(result) do
if type(v28) == "table" and v28.Placement == nil then
n30 += 1
end
end
end
end
str4 = string.format("Eggs placed %d/%d  -  %d/%d pets equipped, %d in bag", v26, 30, v27, v25, n30)
return v24, v26
end
local function fn50(arg, arg2)
local v24 = tbl4.Root()
if not v24 then
return false
end
local position = v24.Position
local n30 =(arg - position).Magnitude / math.max(400, 1) + 3
local flag4 = nil
local n31 = 0
local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
if flag4 ~= nil or tbl4.AntiGuard.Busy then
return
end
n31 += deltaTime
local v25 = tbl4.Root()
if not v25 or arg2() or n31 > n30 then
flag4 = false
return
end
if(v25.Position - position).Magnitude > 6 then
position = v25.Position
end
local n32 = arg - position
local n33 = n8 * deltaTime
local flag5 = n32.Magnitude <= math.max(n33, 0.05)
position = flag5 and arg or position + n32.Unit * n33
local vector = Vector3.new(n32.X, 0, n32.Z)
local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or v25.CFrame.Rotation
pcall(function()
v25.CFrame = CFrame.new(position) * cframe
v25.AssemblyLinearVelocity = Vector3.zero
v25.AssemblyAngularVelocity = Vector3.zero
end)
if flag5 then
flag4 = true
end
end)
while flag4 == nil do
RunService.Heartbeat:Wait()
end
connection2:Disconnect()
return flag4
end
local function fn51()
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
return world and world:IsA("BasePart") and world.Position.X or 552
end
local fn52 = nil
local function fn53(arg)
local v24 = tbl4.Root()
if not v24 or type(tbl4.StealHome) ~= "function" then
return nil
end
local v25 = fn51()
if v24.Position.X < v25 == arg.X < v25 then
return nil
end
local ok, result = pcall(tbl4.StealHome)
if not ok or typeof(result) ~= "Vector3" then
return nil
end
if(result - arg).Magnitude <= 12 or(v24.Position - result).Magnitude <= 12 then
return nil
end
return result
end
fn52 = function(arg, arg2, arg3, arg4)
local v24 = tbl4.Root()
if not v24 then
return false
end
if not arg4 then
local v25 = fn53(arg)
if v25 and not fn52(v25, arg2, arg3, true) then
return false
end
if arg2 and arg2() then
return false
end
v24 = tbl4.Root()
if not v24 then
return false
end
end
tbl4.Shield(arg3 or "place", true)
tbl4.Driving = tbl4.Driving + 1
task.wait(0.2)
local n30 = arg + Vector3.new(0, 3, 0)
local n31 = math.max(v24.Position.Y, n30.Y) + n27
local ok, result = pcall(function()
return fn50(Vector3.new(v24.Position.X, n31, v24.Position.Z), arg2) and fn50(Vector3.new(n30.X, n31, n30.Z), arg2) and fn50(n30, arg2)
end)
ok = ok and result == true
tbl4.Driving = math.max(0, tbl4.Driving - 1)
tbl4.Shield(arg3 or "place", false)
return ok
end
tbl4.FlyTo = function(arg, arg2, arg3)
return fn52(arg, arg2, arg3 or "fly")
end
local function fn54()
local eggState = tbl.EggState
if type(eggState) ~= "table" or type(eggState.PlantEgg) ~= "function" then
return false
end
local v24 = fn44()
if not fn45(#v24) then
return false
end
fn49()
local v25, v26, v27 = fn46()
local n30 = n24 -(tonumber(v27) or 0)
if n30 <= 0 then
return false
end
local v28 = tbl4.PenAnchor()
if not v28 then
return false
end
tbl4.Movement.PlaceWanted = true
if not tbl4.ClaimMovement("place") then
return "waiting"
end
local v29 = n26
local function fn55()
local flag4 = tbl4.Toggle(placeEggHandle, false) == true
local flag5 = v29 ~= n26
local flag6
if flag5 then
flag6 = flag5
else
flag6 = not(flag4 or tbl4.Lab.PlaceOn)
end
if flag6 then
return true
end
if tbl4.IsNight() then
return false
end
return flag4 and v20 == tbl32[4] or tbl4.Movement.StealFirst
end
if tbl4.Treadmill.Riding or tbl4.OnBelt() then
tbl4.ExitBelt()
end
local function fn56()
tbl4.HoldBelt()
local ok, result = pcall(fn52, v28, fn55)
tbl4.ReleaseBelt()
return ok and result and true or false
end
if n20 < tbl4.DistanceTo(v28) then
str4 = "Flying to the pen"
if not fn56() then
tbl4.LeaveBelt()
n23 = os.clock() + n21
return false
end
end
tbl4.LeaveBelt()
if fn55() then
return false
end
local function fn57()
if tbl4.DistanceTo(v28) <= n20 then
return true
end
if fn55() then
return false
end
str4 = "Pen out of reach, flying back"
return fn56() and tbl4.DistanceTo(v28) <= n20
end
if not fn57() then
str4 = "Could not reach the pen, trying again soon"
n23 = os.clock() + n21
return false
end
local v30 = fn47()
local n31 = 0
local n32 = 0
for _, v31 in ipairs(v24) do
if not(n31 >= n30 or fn55()) then
if not fn57() then
str4 = "Pen out of reach, stopping this pass"
break
else
local ok, result = pcall(eggState.WearEggTool, v31.Uid)
if ok and result ~= false then
task.wait(0.15)
local n33 = 0
local flag4 = false
for _, v32 in ipairs(fn48(v30)) do
if not(fn55() or n33 >= n22) then
n33 += 1
local AskPlaceEgg, v33 = fn39("RF/EggWorld/AskPlaceEgg",{Uid = v31.Uid, LocalCFrame = v32})
if AskPlaceEgg and v33 ~= false then
table.insert(v30, Vector2.new(v32.Position.X, v32.Position.Z))
n31 += 1
flag4 = true
break
else
continue
end
end
break
end
if flag4 then
n32 = 0
continue
else
tbl36[v31.Uid] = true
n32 += 1
if not(n32 >= 2) then
continue
end
end
else
tbl36[v31.Uid] = true
continue
end
end
end
break
end
if type(eggState.DoffEggTool) == "function" then
pcall(eggState.DoffEggTool)
end
if n31 == 0 then
n23 = os.clock() + n21
end
return n31 > 0
end
tbl3.Add(function()
local v24, v25 = fn49()
if placeEggStatusRow and type(placeEggStatusRow.Set) == "function" then
pcall(placeEggStatusRow.Set, placeEggStatusRow, str4)
end
local num = tonumber(v25)
local flag4 = num ~= nil and v22 ~= nil and num < v22
if num then
v22 = num
end
if flag4 then
table.clear(tbl36)
end
if not tbl4.Toggle(placeEggHandle, false) and not tbl4.Lab.PlaceOn then
tbl4.Movement.PlaceWanted = false
tbl4.ReleaseMovement("place")
return false
end
if flag3 then
return false
end
if os.clock() < n23 then
tbl4.Movement.PlaceWanted = false
return false
end
if tbl4.Movement.StealFirst and not tbl4.IsNight() then
tbl4.Movement.PlaceWanted = false
return false
end
flag3 = true
task.spawn(function()
local ok, result = pcall(fn54)
if not(ok and result == "waiting") then
tbl4.Movement.PlaceWanted = false
end
tbl4.ReleaseMovement("place")
flag3 = false
tbl3.Wake()
end)
return false
end)
placeEggHandle = tbl4.PlaceEggHandle
placeEggStatusRow = tbl4.PlaceEggStatusRow
tbl4.PlaceEggRestart = function()
table.clear(tbl36)
n26 += 1
tbl4.StopWalking()
tbl3.Wake()
end
tbl4.PlaceEggRefresh = function()
table.clear(tbl36)
tbl3.Wake()
end
tbl4.Rift.Restart.Place = function()
table.clear(tbl36)
tbl3.Wake()
end
end
local save = tbl.Save
if type(save) == "table" and type(save.FieldSignal) == "function" then
for _, v22 in ipairs({"EggInventory", "EquippedAssets", "BaseUpgradeLevel"}) do
local ok, result = pcall(save.FieldSignal, v22)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
tbl4.Steal.HeldByMe = function()
local carryUid = tbl4.Steal.CarryUid
local character = localPlayer.Character
if type(carryUid) ~= "string" or not character then
return false
end
local v22 = workspace:FindFirstChild(carryUid)
if not v22 then
return false
end
for _, descendant in ipairs(v22:GetDescendants()) do
if descendant:IsA("WeldConstraint") or descendant:IsA("JointInstance") then
local ok, result, result2 = pcall(function()
return descendant.Part0, descendant.Part1
end)
if ok and(result and result:IsDescendantOf(character) or result2 and result2:IsDescendantOf(character)) then
return true
end
end
end
return false
end
do
local n19 = 0
local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
n19 += deltaTime
if n19 < 0.2 then
return
end
n19 = 0
local steal = tbl4.Steal
if not steal.Carrying then
if steal.GuessedDrop then
local ok, result = pcall(steal.HeldByMe)
if ok and result then
steal.GuessedDrop = false
steal.Carrying = true
steal.HeldSeenAt = os.clock()
end
end
return
end
local ok, result = pcall(steal.HeldByMe)
if not ok or result then
steal.HeldSeenAt = os.clock()
return
end
if os.clock() -(steal.HeldSeenAt or 0) > 0.8 then
steal.Carrying = false
steal.GuessedDrop = true
steal.LastFinishedAt = os.clock()
tbl3.Wake()
end
end)
fn4(function()
pcall(function()
connection2:Disconnect()
end)
end)
end
do
local eggState = tbl.EggState
local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil
if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
local ok, result = pcall(carryChanged.Connect, carryChanged, function(arg)
local carrying = type(arg) == "table" and arg.IsCarrying == true
if tbl4.Steal.Carrying and not carrying then
tbl4.Steal.LastFinishedAt = os.clock()
end
tbl4.Steal.GuessedDrop = false
if carrying then
tbl4.Steal.HeldSeenAt = os.clock()
end
if carrying and type(arg.Uid) == "string" then
tbl4.Steal.CarryUid = arg.Uid
tbl4.Steal.CarryAreaId = arg.AreaId
local mult = tonumber(arg.SpeedMultiplier)
if mult and mult > 0 then
tbl4.SafeCarry.Mult = mult
tbl4.SafeCarry.Category = arg.AssetCategory
if arg.AssetCategory ~= nil then
local str4 = tostring(arg.AssetCategory)
tbl4.SafeCarry.Seen[str4] = math.min(tbl4.SafeCarry.Seen[str4] or mult, mult)
end
end
end
tbl4.Steal.Carrying = carrying
tbl3.Wake()
end)
if ok and result then
fn4(function()
pcall(function()
result:Disconnect()
end)
end)
end
end
end
pcall(function()
local reEggWorldFieldEggRedeemVerdict = networking:FindFirstChild("RE/EggWorld/FieldEggRedeemVerdict")
local reAlertsRaise = networking:FindFirstChild("RE/Alerts/Raise")
if reEggWorldFieldEggRedeemVerdict and reEggWorldFieldEggRedeemVerdict:IsA("RemoteEvent") then
local connection2 = reEggWorldFieldEggRedeemVerdict.OnClientEvent:Connect(function()
tbl4.SafeCarry.LastDelivered = os.clock()
end)
fn4(function()
connection2:Disconnect()
end)
end
if reAlertsRaise and reAlertsRaise:IsA("RemoteEvent") then
local connection2 = reAlertsRaise.OnClientEvent:Connect(function(arg)
if type(arg) == "table" and type(arg.Text) == "string" and string.find(arg.Text, "Delivery failed", 1, true) then
tbl4.SafeCarry.LastFailed = os.clock()
end
end)
fn4(function()
connection2:Disconnect()
end)
end
end)
do
local n19 = 10
local n20 = 1
local n21 = 5
local function fn39(arg)
local v22 = networking:FindFirstChild(arg)
if not v22 or not v22:IsA("RemoteFunction") then
return false, nil, nil
end
local ok, result, result2 = pcall(v22.InvokeServer, v22)
return ok, result, result2
end
local n22 = 0
local flag3 = false
local function fn40(arg, arg2, arg3)
if arg and arg2 ~= false then
n22 = 0
flag3 = false
return true
end
if arg and tostring(arg3) == "Already using treadmill" then
n22 = 0
flag3 = false
return true
end
if arg and tostring(arg3) == "Not grounded" and tbl4.Grounded() then
n22 += 1
if n22 >= 2 then
n22 = 0
if not flag3 then
flag3 = true
pcall(tbl4.UndoSwap)
elseif type(tbl4.RequestRespawn) == "function" then
flag3 = false
tbl4.RequestRespawn()
end
end
end
return false
end
local v22 = nil
local v23 = nil
local flag4 = false
local n23 = 0
local flag5 = false
local treadmill = tbl4.Treadmill
local function fn41()
return tbl4.Toggle(v22, false)
end
local function fn42()
local movement = tbl4.Movement
return movement.PlaceWanted or movement.ScrambleWanted or movement.MutationWanted or movement.FracturedWanted or movement.Owner ~= nil and movement.Owner ~= "treadmill" or tbl4.Steal.Active or tbl4.Steal.Carrying
end
local function fn43()
local v24 = n23
if fn42() or not tbl4.ClaimMovement("treadmill") then
return false
end
local function fn44()
return v24 ~= n23 or not fn41() or tbl4.Movement.Owner ~= "treadmill" or fn42()
end
if tbl4.BeltHeld() then
tbl4.ResetBelt()
end
local v25 = tbl4.Belt()
if not v25 then
return false
end
local n24 = v25.Position + Vector3.new(0, v25.Size.Y / 2, 0)
if n19 < tbl4.DistanceTo(n24 + Vector3.new(0, 2, 0)) then
if type(tbl4.FlyTo) ~= "function" or not tbl4.FlyTo(n24, fn44, "treadmill") then
return false
end
end
if fn44() then
return false
end
treadmill.Riding = fn40(fn39("RF/Treadmill/AskWearStill"))
return treadmill.Riding
end
tbl3.Add(function()
if not fn41() then
if treadmill.Riding and not flag4 then
flag4 = true
task.spawn(function()
pcall(tbl4.ExitBelt)
flag4 = false
tbl3.Wake()
end)
end
return false
end
local v24 = flag4
local v25
if flag4 then
v25 = v24
else
v25 = fn42()
end
if v25 then
return false
end
if treadmill.Riding and tbl4.Toggle(v23, true) and tbl4.OnBelt() then
if os.clock() >=(treadmill.NextCheck or 0) and not tbl4.Flying and tbl4.Grounded() then
treadmill.NextCheck = os.clock() + n21
flag4 = true
task.spawn(function()
local ok, result = pcall(function()
return fn40(fn39("RF/Treadmill/AskWearStill"))
end)
treadmill.Riding = ok and result == true
if not treadmill.Riding then
treadmill.NextTry = 0
end
flag4 = false
tbl3.Wake()
end)
end
return false
end
if os.clock() <(treadmill.NextTry or 0) then
return false
end
treadmill.NextCheck = 0
treadmill.NextTry = os.clock() +(treadmill.LastFailed and 3 or 4)
flag4 = true
task.spawn(function()
local ok, result = pcall(fn43)
treadmill.LastFailed = not(ok and result == true)
tbl4.ReleaseMovement("treadmill")
flag4 = false
tbl3.Wake()
end)
return false
end)
task.spawn(function()
while not flag5 do
task.wait(3)
if not fn41() and not fn42() and not tbl4.Flying and tbl4.OnBelt() and tbl4.Grounded() then
fn40(fn39("RF/Treadmill/AskWearStill"))
end
end
end)
task.spawn(function()
local n24 = 0
while not flag5 do
local v24 = task.wait(0.25)
if not fn41() or not treadmill.Riding or fn42() then
n24 = 0
elseif tbl4.OnBelt() then
n24 = 0
else
n24 += v24
if n24 >= 1.5 then
treadmill.Riding = false
treadmill.NextTry = 0
tbl3.Wake()
n24 = 0
end
end
end
end)
task.spawn(function()
local n24 = 0
local n25 = 0
local position = nil
while not flag5 do
local v24 = task.wait(0.25)
n24 = math.max(0, n24 - v24)
local flag6 = treadmill.Riding and fn41() and not fn42()
local v25 = tbl4.Root()
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if flag6 or not(tbl4.Flying or tbl4.Movement.Owner ~= nil or tbl4.Movement.PlaceWanted or character ~= nil and character.MoveDirection.Magnitude > 0.1) or not v25 or not tbl4.OnBelt() then
position = v25 and v25.Position
n25 = 0
position = position or nil
else
local vector = Vector3.new(v25.Position.X, 0, v25.Position.Z)
position = position and(vector - Vector3.new(position.X, 0, position.Z)).Magnitude < 0.5
if position then
n25 += v24
else
n25 = 0
end
position = v25.Position
if n25 >= n20 and n24 <= 0 then
pcall(tbl4.ExitBelt)
n24 = 1.5
n25 = 0
end
end
end
end)
fn4(function()
flag5 = true
treadmill.Riding = false
end)
v22 = v11:CreateToggle({
Name = "Auto Treadmill",
Default = false,
Callback = function()
n23 += 1
tbl4.StopWalking()
tbl3.Wake()
end,
})
v23 = v11:CreateToggle({Name = "Stay On Treadmill", Default = true})
end
do
local n19 = 4
local n20 = 10
local v22 = nil
local flag3 = false
local n21 = 0
local tbl36 ={}
local tbl37 ={MinRarity = 0, MinIncome = 0, Eggs ={}}
local function fn39(arg, arg2)
local v23 = networking:FindFirstChild(arg)
if not v23 or not v23:IsA("RemoteFunction") then
return false, nil
end
return pcall(v23.InvokeServer, v23, arg2)
end
local function fn40(arg)
local flag4 = tbl37.MinRarity > 0
if flag4 then
local minRarity = tbl37.MinRarity
flag4 = tbl4.EggRarity(arg) < minRarity
end
if flag4 then
return false
end
local flag5 = tbl37.MinIncome > 0
if flag5 then
local minIncome = tbl37.MinIncome
flag5 = tbl4.EggIncome(arg) < minIncome
end
if flag5 then
return false
end
if next(tbl37.Eggs) ~= nil and tbl37.Eggs[tostring(arg.AssetCategory)] ~= true then
return false
end
return true
end
local function fn41()
local eggState = tbl.EggState
if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
return{}
end
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if not ok or type(result) ~= "table" then
return{}
end
local flag4 = tbl4.Toggle(v22, false) == true
local Hatch = tbl4.RiftOn("Hatch") and tbl4.RiftShortfall() or{}
local tbl38 ={}
local tbl39 ={}
for k, v23 in pairs(result) do
local flag5 = type(v23) == "table" and v23.Placement ~= nil
if flag5 then
flag5 =(tbl36[k] or 0) <= os.clock()
end
if flag5 then
local ok2, result2 = pcall(eggState.IsReadyToHatch, k)
if ok2 and result2 == true then
local str4 = tostring(v23.AssetCategory)
if(Hatch[str4] or 0) > 0 then
Hatch[str4] = Hatch[str4] - 1
table.insert(tbl38, k)
elseif flag4 and fn40(v23) then
table.insert(tbl39, k)
end
end
end
end
for _, v23 in ipairs(tbl39) do
table.insert(tbl38, v23)
end
return tbl38
end
local function fn42()
return tbl4.Toggle(v22, false) or tbl4.RiftOn("Hatch")
end
local function fn43()
local v23 = n21
local v24 = fn41()
local n22 = 0
for _, v25 in ipairs(v24) do
if not(n22 >= n19 or v23 ~= n21 or not fn42()) then
local AskHatch, v26 = fn39("RF/EggWorld/AskHatch", v25)
if AskHatch and v26 ~= false then
task.wait(0.35)
fn39("RF/EggWorld/AskFinishHatch", v25)
n22 += 1
tbl36[v25] = nil
else
tbl36[v25] = os.clock() + n20
end
task.wait(0.2)
continue
end
break
end
return n22 > 0
end
tbl3.Add(function()
if not fn42() or flag3 then
return false
end
flag3 = true
task.spawn(function()
pcall(fn43)
flag3 = false
end)
return false
end)
local function hatch()
n21 += 1
table.clear(tbl36)
tbl3.Wake()
end
v22 = v12:CreateToggle({Name = "Auto Hatch", Default = false, Callback = hatch})
v12:CreateDropdown({
Name = "Hatch Min Rarity",
Note = "Hatch eggs of the chosen rarity and every rarity above it",
Options = tbl12,
Default = tbl12[1],
SubOf = v22,
Callback = function(arg)
tbl37.MinRarity = tbl13[arg] or 0
hatch()
end,
})
local tbl38 ={
["K/s"] ={Min = 0, Max = 1000, Mult = 1000},
["M/s"] ={Min = 0, Max = 1000, Mult = 1000000},
["B/s"] ={Min = 0, Max = 100, Mult = 1e9},
}
local tbl39 ={Slider = nil, Value = 0, Unit = "M/s"}
local function fn44(arg, arg2)
if arg ~= nil then
tbl39.Value = math.max(0, math.floor(tonumber(arg) or tbl39.Value))
end
if arg2 ~= nil then
tbl39.Unit = tostring(arg2)
end
tbl37.MinIncome = tbl39.Value *(tbl38[tbl39.Unit] or tbl38["M/s"]).Mult
hatch()
end
tbl39.Slider = fn5(v12,{
Name = "Min Hatch Value",
Note = "Skip eggs worth less than this (0 = off)",
SubOf = v22,
Legacy = "Hatch Min Value",
SectionName = "Auto Hatch & Equip",
OnRaw = function(arg)
fn44(math.floor(arg / 1000), "K/s")
end,
})
local tbl40 ={}
local tbl41 ={}
local directory = tbl.Assets and tbl.Assets.Directory
local n22 = 0
while(type(directory) ~= "table" or next(directory) == nil) and n22 < 2 do
n22 += task.wait(0.1)
if type(tbl.Assets) ~= "table" then
tbl.Assets = fn2(function()
return ReplicatedStorage.Data.Assets
end)
end
directory = tbl.Assets and tbl.Assets.Directory
end
local tbl42 ={}
if type(directory) == "table" then
for k, v23 in pairs(directory) do
local rarity = type(v23) == "table" and v23.Rarity or nil
local flag4 = type(rarity) == "table"
if flag4 then
flag4 = tonumber(rarity.RarityNumber or rarity.Rank)
end
local v24 = flag4 or nil
if v24 then
table.insert(tbl42,{
Category = tostring(k),
Name = tostring(v23.DisplayName or k),
Rarity = v24,
RarityName = tostring(rarity.DisplayName or rarity._id or v24),
})
end
end
end
table.sort(tbl42, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity > arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v23 in ipairs(tbl42) do
local str4 = string.format("%s [%s]", v23.Name, v23.RarityName)
if tbl41[str4] then
str4 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
end
table.insert(tbl40, str4)
tbl41[str4] = v23.Category
end
if #tbl40 > 0 then
fn6(v12:CreateMultiDropdown({
Name = "Hatch Specific Eggs",
Note = "Only hatch these eggs (empty = all)",
Options = tbl40,
Default ={},
SubOf = v22,
Callback = function(arg)
local eggs ={}
if type(arg) == "table" then
for k, v23 in pairs(arg) do
k = v23 == true and type(k) == "string" and k or type(v23) == "string" and v23 or nil
if k and tbl41[k] then
eggs[tbl41[k]] = true
end
end
end
tbl37.Eggs = eggs
hatch()
end,
}))
end
tbl4.Rift.Restart.Hatch = hatch
enddo
local n19 = 5
local n20 = 30
local v22 = nil
local flag3 = false
local n21 = 0
local tbl36 ={}
local n22 = 0
local flag4 = true
local v23 = nil
local n23 = -math.huge
local function fn39(arg)
local v24 = fn2(function()
return ReplicatedStorage.Data.Bases
end)
if type(v24) == "table" and type(v24.GetAssetEquipCapacity) == "function" then
local ok, result = pcall(v24.GetAssetEquipCapacity, arg and tonumber(arg.BaseUpgradeLevel) or 0)
if ok and tonumber(result) then
return math.floor(tonumber(result))
end
end
if v23 and os.clock() - n23 < n20 then
return v23
end
local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")
if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
local ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
if ok and tonumber(result) then
local n24 = math.floor(tonumber(result))
local now = os.clock()
v23 = n24
n23 = now
return v23
end
end
return v23 or 0
end
local function fn40(arg)
local directory = tbl.Assets and tbl.Assets.Directory
local flag5 = type(directory) == "table" and directory[tostring(arg.Category)] or nil
local n24 = type(flag5) == "table" and tonumber(flag5.EarningRate) or 0
local n25 = tonumber(arg.Scale) or 0
if n24 <= 0 or n25 <= 0 then
return 0
end
local n26 = n25 > 5 and(n25 / 5) ^ 1.2 * 19.637875755794113 or n25 ^ 1.85
local mutations = tbl.Mutations
local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n27 = 1
if flag6 then
local ok
ok, n27 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
local flag7 = ok and type(n27) == "number"
local n28 = 1
if not flag7 then
n27 = n28
end
end
return n24 * n26 * n27
end
local function fn41()
local save2 = tbl.Save
local flag5 = type(save2) == "table" and type(save2.Get) == "function"
local result = nil
if flag5 then
local ok
ok, result = pcall(save2.Get)
result = ok and type(result) == "table" and result or nil
end
if not result then
return nil
end
local tbl37 ={}
local tbl38 ={}
local v24 = pairs
local equippedAssets = result.EquippedAssets or{}
for _, equippedAsset in v24(equippedAssets) do
if type(equippedAsset) == "string" then
tbl37[equippedAsset] = true
table.insert(tbl38, equippedAsset)
end
end
local tbl39 ={}
local v25 = pairs
local inventory = result.Inventory or{}
for k, v26 in v25(inventory) do
if type(v26) == "table" and v26.InFuse ~= true then
table.insert(tbl39,{Uid = k, Income = fn40(v26), Equipped = tbl37[k] == true})
end
end
table.sort(tbl39, function(arg, arg2)
if arg.Income ~= arg2.Income then
return arg.Income > arg2.Income
end
return tostring(arg.Uid) < tostring(arg2.Uid)
end)
return tbl39, tbl37, #tbl38, result
end
local function fn42(arg, arg2)
local tbl37 ={}
local flag5 = false
for i, v24 in ipairs(arg) do
if not(arg2 < i) then
if not v24.Equipped then
table.insert(tbl37, v24.Uid)
if not tbl36[v24.Uid] then
flag5 = true
end
end
continue
end
break
end
return tbl37, flag5
end
tbl3.Add(function()
if not tbl4.Toggle(v22, false) then
return false
end
local v24, v25, v26, v27 = fn41()
if v24 then
local v28 = fn39(v27)
local v29, v30 = fn42(v24, v28)
if(v30 or flag4) and not flag3 and os.clock() >= n22 then
for _, v31 in ipairs(v29) do
tbl36[v31] = true
end
flag4 = false
flag3 = true
n22 = os.clock() + n19
local v31 = n21
task.spawn(function()
local rfHaulFetchWearBestStatus = networking:FindFirstChild("RF/Haul/FetchWearBestStatus")
local isRemoteFunction = rfHaulFetchWearBestStatus and rfHaulFetchWearBestStatus:IsA("RemoteFunction")
local flag5 = true
if isRemoteFunction then
local ok, result = pcall(rfHaulFetchWearBestStatus.InvokeServer, rfHaulFetchWearBestStatus)
flag5 = ok and result ~= false and result ~= nil
end
local rfHaulWearBest = networking:FindFirstChild("RF/Haul/WearBest")
if flag5 and v31 == n21 and rfHaulWearBest and rfHaulWearBest:IsA("RemoteFunction") then
pcall(rfHaulWearBest.InvokeServer, rfHaulWearBest)
end
flag3 = false
tbl3.Wake()
end)
end
end
return false
end)
v22 = v12:CreateToggle({
Name = "Auto Equip Best",
Note = "Equip Best when a better pet appears",
Default = false,
Callback = function()
n21 += 1
table.clear(tbl36)
n22 = 0
flag4 = true
tbl3.Wake()
end,
})
local save2 = tbl.Save
if type(save2) == "table" and type(save2.FieldSignal) == "function" then
for _, v24 in ipairs({"Inventory", "EquippedAssets"}) do
local ok, result = pcall(save2.FieldSignal, v24)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
flag4 = true
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
end
local n19
n19 = 3
local n20
n20 = 50
local tbl36
tbl36 ={"Rarity Only", "Value Only", "Rarity And Value", "Rarity Or Value"}
local tbl37, tbl38, tbl39, tbl40, fn39, v22
do
local v23 = fn2(function()
return ReplicatedStorage.Shared.Util.AssetItems
end)
tbl37 ={}
tbl38 ={}
tbl39 ={}
tbl40 ={}
local directory = tbl.Assets and tbl.Assets.Directory
local tbl41 ={}
local tbl42 ={}
if type(directory) == "table" then
for k, v24 in pairs(directory) do
local rarity = type(v24) == "table" and v24.Rarity or nil
local flag3 = type(rarity) == "table"
local num
if flag3 then
num = tonumber(rarity.RarityNumber or rarity.Rank)
else
num = flag3
end
local v25 = num or nil
if v25 then
local str4 = tostring(rarity.DisplayName or rarity._id or v25)
tbl41[v25] = tbl41[v25] or str4
table.insert(tbl42,{
Category = tostring(k),
Name = tostring(v24.DisplayName or k),
Rarity = v25,
RarityName = str4,
})
end
end
end
local tbl43 ={}
for k in pairs(tbl41) do
table.insert(tbl43, k)
end
table.sort(tbl43)
for _, v24 in ipairs(tbl43) do
local str4 = string.format("%d - %s", v24, tbl41[v24])
table.insert(tbl37, str4)
tbl38[str4] = v24
end
table.sort(tbl42, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity < arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v24 in ipairs(tbl42) do
local str4 = string.format("%s [%s]", v24.Name, v24.RarityName)
if tbl40[str4] then
str4 = string.format("%s [%s] (%s)", v24.Name, v24.RarityName, v24.Category)
end
table.insert(tbl39, str4)
tbl40[str4] = v24.Category
end
fn39 = function(arg)
for _, v24 in ipairs(tbl37) do
if tbl38[v24] == arg then
return v24
end
end
return tbl37[1]
end
local v24 = nil
v22 = nil
local v25 = nil
local v26 = nil
local v27 = tbl36[3]
local n21 = 3
local n22 = 0
local flag3 = true
local tbl44 ={}
local v28 = tbl36[3]
local n23 = 3
local n24 = 0
local flag4 = true
local tbl45 ={}
local flag5 = false
local n25 = 0
local function fn40(arg)
local n26 = tonumber(arg) or 0
local tbl46 ={"", "K", "M", "B", "T", "Qa", "Qi"}
local n27 = 1
while math.abs(n26) >= 1000 and n27 < #tbl46 do
n26 /= 1000
n27 += 1
end
return string.format(n27 == 1 and "$%.0f%s" or "$%.2f%s", n26, tbl46[n27])
end
local function fn41(arg, arg2)
local tbl46 ={}
if type(arg) == "table" then
for k, v29 in pairs(arg) do
k = v29 == true and type(k) == "string" and k or type(v29) == "string" and v29 or nil
if k then
tbl46[arg2 and arg2[k] or k] = true
end
end
end
return tbl46
end
local function fn42(arg)
local directory2 = tbl.Assets and tbl.Assets.Directory
local flag6 = type(directory2) == "table" and directory2[tostring(arg)] or nil
local rarity = type(flag6) == "table" and flag6.Rarity or nil
local flag7 = type(rarity) == "table"
if flag7 then
flag7 = tonumber(rarity.RarityNumber or rarity.Rank)
end
return flag7 or math.huge
end
local function fn43(arg)
local directory2 = tbl.Assets and tbl.Assets.Directory
local flag6 = type(directory2) == "table" and directory2[tostring(arg.Category)] or nil
local n26 = type(flag6) == "table" and tonumber(flag6.EarningRate) or 0
local n27 = tonumber(arg.Scale) or 0
if n26 <= 0 or n27 <= 0 then
return 0
end
local n28 = n27 > 5 and(n27 / 5) ^ 1.2 * 19.637875755794113 or n27 ^ 1.85
local mutations = tbl.Mutations
local flag7 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n29 = 1
if flag7 then
local ok
ok, n29 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
ok = ok and type(n29) == "number"
local n30 = 1
if not ok then
n29 = n30
end
end
return n26 * n28 * n29
end
local function fn44(arg)
return type(arg) == "table" and next(arg) ~= nil
end
local function fn45()
local save2 = tbl.Save
if type(save2) ~= "table" or type(save2.Get) ~= "function" then
return nil
end
local ok, result = pcall(save2.Get)
return ok and type(result) == "table" and result or nil
end
local function fn46()
local v29 = fn45()
local tbl46 ={}
if not v29 then
return tbl46, 0
end
local tbl47 ={}
local v30 = pairs
local equippedAssets = v29.EquippedAssets or{}
for _, equippedAsset in v30(equippedAssets) do
tbl47[equippedAsset] = true
end
local v31 = pairs
local inventory = v29.Inventory or{}
local n26 = 0
for k, v32 in v31(inventory) do
local flag6 = type(v32) == "table" and v32.InFuse ~= true and v32.IsFavorite ~= true and not tbl47[k] and not tbl44[tostring(v32.Category)]
if flag6 then
flag6 = not(flag3 and fn44(v32.Mutations))
end
if flag6 then
local v33 = fn43(v32)
local flag7 = fn42(v32.Category) <= n21
local flag8 = n22 > 0 and v33 < n22
if v27 ~= tbl36[2] then
if v27 == tbl36[3] then
flag8 = flag7 and flag8
elseif v27 == tbl36[4] then
flag8 = flag7 or flag8
else
flag8 = flag7
end
end
if flag8 then
table.insert(tbl46, k)
local flag9 = type(v23) == "table" and type(v23.SalePrice) == "function"
local flag10 = false
local result = nil
if flag9 then
flag10, result = pcall(v23.SalePrice, v32)
end
n26 += flag10 and tonumber(result) or v33 * 100
end
end
end
return tbl46, n26
end
local function fn47()
local tbl46 ={}
local eggState = tbl.EggState
if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
return tbl46, 0
end
local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if not ok or type(result) ~= "table" then
return tbl46, 0
end
local character = localPlayer.Character
character = character and character:FindFirstChildWhichIsA("Tool")
character = character and character:GetAttribute("UID") or nil
local eggRecords = tbl.EggRecords
local v29, v30, v31 = pairs(result)
local n26 = 0
for k, v32 in v29, v30, v31 do
local flag6 = type(v32) == "table" and v32.Placement == nil and k ~= character and not tbl4.Lab.Reserved[k]
if flag6 then
flag6 = not(v32.EggSkin ~= nil and tbl4.SellLab and tbl4.SellLab.Skins[tostring(v32.EggSkin)])
end
flag6 = flag6 and not tbl45[tostring(v32.AssetCategory)]
local flag7
if flag6 then
flag7 = not(flag4 and fn44(v32.Mutations))
else
flag7 = flag6
end
if flag7 then
local v33 = fn43({Category = v32.AssetCategory, Scale = v32.AssetScale, Mutations = v32.Mutations})
local flag8 = fn42(v32.AssetCategory) <= n23
local flag9 = n24 > 0 and v33 < n24
local v34
if v28 == tbl36[2] then
v34 = flag9
elseif v28 == tbl36[3] then
v34 = flag8 and flag9
elseif v28 == tbl36[4] then
v34 = flag8 or flag9
else
v34 = flag8
end
if v34 then
table.insert(tbl46, k)
if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
local ok2, result2 = pcall(eggRecords.SellPrice, v32)
n26 += ok2 and tonumber(result2) or 0
end
end
end
end
return tbl46, n26
end
local function fn48(arg, arg2)
local rePetSatchelSellSelection = networking:FindFirstChild("RE/PetSatchel/SellSelection")
if not rePetSatchelSellSelection or not rePetSatchelSellSelection:IsA("RemoteEvent") then
return false
end
local n26 = math.max(#arg, #arg2)
local n27 = 1
while n27 <= n26 do
local tbl46 ={}
local tbl47 ={}
for i = n27, n27 + n20 - 1 do
if arg[i] then
table.insert(tbl46, arg[i])
end
if arg2[i] then
table.insert(tbl47, arg2[i])
end
end
pcall(rePetSatchelSellSelection.FireServer, rePetSatchelSellSelection,{Eggs = tbl47, Assets = tbl46})
n27 += n20
if n27 <= n26 then
task.wait(0.3)
end
end
return true
end
local function fn49(arg, arg2)
local flag6 = flag5
if not flag5 then
flag6 = #arg == 0 and #arg2 == 0
end
if flag6 then
return
end
flag5 = true
n25 = os.clock() + n19
task.spawn(function()
pcall(fn48, arg, arg2)
flag5 = false
tbl3.Wake()
end)
end
tbl3.Add(function()
local v29 = tbl4.Toggle(v24, false)
local v30 = tbl4.Toggle(v22, false)
local v31, v32 = fn46()
local v33, v34 = fn47()
if v25 and type(v25.Set) == "function" then
pcall(v25.Set, v25, string.format("Pet matches  -  %d pets for %s", #v31, fn40(v32)))
end
if v26 and type(v26.Set) == "function" then
pcall(v26.Set, v26, string.format("Egg matches  -  %d eggs for %s", #v33, fn40(v34)))
end
local flag6 = flag5 or os.clock() < n25
if not flag6 then
flag6 = not(v29 or v30)
end
if flag6 then
return false
end
fn49(v29 and v31 or{}, v30 and v33 or{})
return false
end)
v25 = v13:CreateText({Name = "Pet Sell Preview", Text = "Pet matches  -  0 pets"})
v24 = v13:CreateToggle({
Name = "Auto Sell Pet",
Default = false,
Callback = function()
tbl3.Wake()
end,
})
v13:CreateButton({
Name = "Sell Pets Now",
ButtonText = "Sell",
ConfirmText = "Sold!",
SubOf = v24,
Callback = function()
fn49(fn46(),{})
end,
})
v13:CreateDropdown({
Name = "Sell Pet Rule",
Note = "Which checks must pass to sell",
Options = tbl36,
Default = tbl36[3],
SubOf = v24,
Callback = function(arg)
if table.find(tbl36, arg) then
v27 = arg
tbl3.Wake()
end
end,
})
v13:CreateDropdown({
Name = "Pet Max Rarity",
Note = "Sell pets at or below this rarity",
Options = tbl37,
Default = fn39(3),
SubOf = v24,
Callback = function(arg)
n21 = tbl38[arg] or n21
tbl3.Wake()
end,
})
local tbl46 ={
["K/s"] ={Min = 0, Max = 1000, Mult = 1000},
["M/s"] ={Min = 0, Max = 1000, Mult = 1000000},
["B/s"] ={Min = 0, Max = 100, Mult = 1e9},
}
local function fn50(arg, arg2, arg3, arg4)
local n26 = 0
local str4 = "M/s"
local function fn51(arg5, arg6)
if arg5 ~= nil then
n26 = math.max(0, math.floor(tonumber(arg5) or n26))
end
if arg6 ~= nil then
str4 = tostring(arg6)
end
arg4(n26 *(tbl46[str4] or tbl46["M/s"]).Mult)
tbl3.Wake()
end
return(fn5(v13,{
Name = arg == "Pet Value Threshold" and "Pet Sell Value" or arg == "Egg Value Threshold" and "Egg Sell Value" or arg,
Note = arg2,
SubOf = arg3,
Legacy = arg,
SectionName = "Auto Sell",
OnRaw = function(arg5)
fn51(math.floor(arg5 / 1000), "K/s")
end,
}))
end
fn50("Pet Value Threshold", "Sell pets worth less than this (0 = off)", v24, function(arg)
n22 = arg
end)
local v29 = nil
v29 = v13:CreateToggle({
Name = "Keep Mutated Pets",
Note = "Never sell mutated pets",
Default = true,
SubOf = v24,
Callback = function()
flag3 = tbl4.Toggle(v29, true)
tbl3.Wake()
end,
})
fn6(v13:CreateMultiDropdown({
Name = "Blacklist Sell Pets",
Note = "These pets are never sold",
Options = tbl39,
Default ={},
SubOf = v24,
Callback = function(arg)
tbl44 = fn41(arg, tbl40)
tbl3.Wake()
end,
}))
v26 = v13:CreateText({Name = "Egg Sell Preview", Text = "Egg matches  -  0 eggs"})
v22 = v13:CreateToggle({
Name = "Auto Sell Egg",
Note = "Sell bag eggs matching the rules below",
Default = false,
Callback = function()
tbl3.Wake()
end,
})
v13:CreateButton({
Name = "Sell Eggs Now",
Note = "Sell matching eggs once",
ButtonText = "Sell",
ConfirmText = "Sold!",
SubOf = v22,
Callback = function()
local v30 = fn47()
fn49({}, v30)
end,
})
v13:CreateDropdown({
Name = "Sell Egg Rule",
Note = "Which checks must pass to sell",
Options = tbl36,
Default = tbl36[3],
SubOf = v22,
Callback = function(arg)
if table.find(tbl36, arg) then
v28 = arg
tbl3.Wake()
end
end,
})
v13:CreateDropdown({
Name = "Egg Max Rarity",
Note = "Sell eggs at or below this rarity",
Options = tbl37,
Default = fn39(3),
SubOf = v22,
Callback = function(arg)
n23 = tbl38[arg] or n23
tbl3.Wake()
end,
})
fn50("Egg Value Threshold", "Sell eggs worth less than this (0 = off)", v22, function(arg)
n24 = arg
end)
local v30 = nil
v30 = v13:CreateToggle({
Name = "Keep Mutated Eggs",
Note = "Never sell mutated eggs",
Default = true,
SubOf = v22,
Callback = function()
flag4 = tbl4.Toggle(v30, true)
tbl3.Wake()
end,
})
local function fn51()
local sellLabSection = tbl.SellLabSection
local sellLab ={
Skins ={},
Rule = tbl36[3],
MaxRarity = 0,
IncomeLimit = 0,
KeepMutated = true,
KeepPets ={},
Handle = nil,
Preview = nil,
}
tbl4.SellLab = sellLab
local tbl47 ={}
local tbl48 ={}
local tbl49 ={}
local tbl50 ={}
local ok, result = pcall(function()
return require(ReplicatedStorage.Data.ScrambleTradeIn)
end)
local banners = ok and type(result) == "table" and type(result.Banners) == "table" and result.Banners or{}
local tbl51 ={}
for _, banner in ipairs(banners) do
if type(banner) == "table" and banner.EggSkin ~= nil then
local str4 = tostring(banner.EggSkin)
sellLab.Skins[str4] = true
local str5 = tostring(banner.DisplayName or banner.Id or str4)
if tbl48[str5] then
str5..= " (".. str4.. ")"
end
tbl48[str5] = str4
table.insert(tbl47, str5)
local v31 = ipairs
local pets = type(banner.Pets) == "table" and banner.Pets or{}
for _, pet in v31(pets) do
local str6 = type(pet) == "table" and pet.AssetId ~= nil and tostring(pet.AssetId) or nil
if str6 and not tbl51[str6] then
tbl51[str6] = true
local directory2 = tbl.Assets and tbl.Assets.Directory
local flag6 = type(directory2) == "table" and directory2[str6] or nil
local flag7 = type(flag6) == "table"
if flag7 then
flag7 = tostring(flag6.DisplayName or str6)
end
flag7 = flag7 or str6
if tbl50[flag7] then
flag7..= " (".. str6.. ")"
end
tbl50[flag7] = str6
table.insert(tbl49, flag7)
end
end
end
end
table.sort(tbl49)
local function eggs()
local tbl52 ={}
local eggState = tbl.EggState
if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
return tbl52, 0
end
local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
if not ok2 or type(result2) ~= "table" then
return tbl52, 0
end
local character = localPlayer.Character
character = character and character:FindFirstChildWhichIsA("Tool")
character = character and character:GetAttribute("UID") or nil
local eggRecords = tbl.EggRecords
local v31, v32, v33 = pairs(result2)
local n26 = 0
for k, v34 in v31, v32, v33 do
local str4 = type(v34) == "table" and v34.EggSkin ~= nil and tostring(v34.EggSkin) or nil
local flag6 = str4 and sellLab.Skins[str4] and v34.Placement == nil and k ~= character and not tbl4.Lab.Reserved[k] and not sellLab.KeepPets[tostring(v34.AssetCategory)]
if flag6 then
flag6 = not(sellLab.KeepMutated and fn44(v34.Mutations))
end
if flag6 then
local v35 = fn43({Category = v34.AssetCategory, Scale = v34.AssetScale, Mutations = v34.Mutations})
local maxRarity = sellLab.MaxRarity
local flag7 = fn42(v34.AssetCategory) <= maxRarity
local flag8 = sellLab.IncomeLimit > 0 and v35 < sellLab.IncomeLimit
if sellLab.Rule ~= tbl36[2] then
if sellLab.Rule == tbl36[3] then
flag8 = flag7 and flag8
elseif sellLab.Rule ~= tbl36[4] then
flag8 = flag7
else
flag8 = flag7 or flag8
end
end
if flag8 then
table.insert(tbl52, k)
if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
local ok3, result3 = pcall(eggRecords.SellPrice, v34)
n26 += ok3 and tonumber(result3) or 0
end
end
end
end
return tbl52, n26
end
sellLab.Eggs = eggs
sellLab.Preview = sellLabSection:CreateText({Name = "Lab Egg Sell Preview", Text = "Lab egg matches  -  0 eggs"})
sellLab.Handle = sellLabSection:CreateToggle({
Name = "Auto Sell Lab Egg",
Note = "Sell eggs traded from Dr Scramble that match the filters below",
Default = false,
Callback = function()
tbl3.Wake()
end,
})
sellLabSection:CreateButton({
Name = "Sell Lab Eggs Now",
Note = "Sell matching Lab eggs once",
ButtonText = "Sell",
ConfirmText = "Sold!",
SubOf = sellLab.Handle,
Callback = function()
local v31 = eggs()
fn49({}, v31)
end,
})
sellLabSection:CreateDropdown({
Name = "Sell Lab Egg Rule",
Note = "Which checks must pass to sell",
Options = tbl36,
Default = tbl36[3],
SubOf = sellLab.Handle,
Callback = function(rule)
if table.find(tbl36, rule) then
sellLab.Rule = rule
tbl3.Wake()
end
end,
})
local tbl52 ={"Off"}
for _, v31 in ipairs(tbl37) do
table.insert(tbl52, v31)
end
sellLabSection:CreateDropdown({
Name = "Lab Egg Max Rarity",
Note = "Sell Lab eggs at or below this rarity (Off = none by rarity)",
Options = tbl52,
Default = "Off",
SubOf = sellLab.Handle,
Callback = function(arg)
sellLab.MaxRarity = tbl38[arg] or 0
tbl3.Wake()
end,
})
fn5(sellLabSection,{
Name = "Lab Egg Sell Value",
Note = "Sell Lab eggs worth less than this (0 = off)",
SubOf = sellLab.Handle,
Legacy = "Lab Egg Value Threshold",
SectionName = "Auto Sell Lab Egg",
OnRaw = function(arg)
sellLab.IncomeLimit = math.max(0, tonumber(arg) or 0)
tbl3.Wake()
end,
})
local v31 = nil
v31 = sellLabSection:CreateToggle({
Name = "Keep Mutated Lab Eggs",
Note = "Never sell mutated Lab eggs",
Default = true,
SubOf = sellLab.Handle,
Callback = function()
sellLab.KeepMutated = tbl4.Toggle(v31, true)
tbl3.Wake()
end,
})
if #tbl49 > 0 then
fn6(sellLabSection:CreateMultiDropdown({
Name = "Keep Lab Pets",
Note = "Lab eggs of these pets are never sold",
Options = tbl49,
Default ={},
SubOf = sellLab.Handle,
Callback = function(arg)
sellLab.KeepPets = fn41(arg, tbl50)
tbl3.Wake()
end,
}))
end
tbl3.Add(function()
local v32, v33 = eggs()
if sellLab.Preview and type(sellLab.Preview.Set) == "function" then
pcall(sellLab.Preview.Set, sellLab.Preview, string.format("Lab egg matches  -  %d eggs for %s", #v32, fn40(v33)))
end
local v34 = flag5
local flag6
if flag5 then
flag6 = v34
else
flag6 = os.clock() < n25
end
if flag6 or not tbl4.Toggle(sellLab.Handle, false) then
return false
end
fn49({}, v32)
return false
end)
end
fn51()
fn6(v13:CreateMultiDropdown({
Name = "Blacklist Sell Eggs",
Note = "These eggs are never sold",
Options = tbl39,
Default ={},
SubOf = v22,
Callback = function(arg)
tbl45 = fn41(arg, tbl40)
tbl3.Wake()
end,
}))
end
local save2 = tbl.Save
if type(save2) == "table" and type(save2.FieldSignal) == "function" then
for _, v23 in ipairs({"Inventory", "EggInventory", "EquippedAssets"}) do
local ok, result = pcall(save2.FieldSignal, v23)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
local n21
n21 = 2
local n22
n22 = 3
local n23
n23 = 20
local tbl41
tbl41 ={"Lowest Rarity First", "Highest Rarity First", "Most Copies First", "Lowest Value First"}
local tbl42
tbl42 ={"Lowest To Highest", "Highest To Lowest"}
local tbl43
tbl43 ={}
local tbl44
tbl44 ={}
local tbl45
tbl45 ={}
local tbl46
tbl46 ={}
do
local directory = tbl.Assets and tbl.Assets.Directory
local tbl47 ={}
local tbl48 ={}
if type(directory) == "table" then
for k, v23 in pairs(directory) do
local rarity = type(v23) == "table" and v23.Rarity or nil
local flag3 = type(rarity) == "table"
if flag3 then
flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
end
flag3 = flag3 or nil
if flag3 then
local str4 = tostring(rarity.DisplayName or rarity._id or flag3)
tbl47[flag3] = tbl47[flag3] or str4
table.insert(tbl48,{
Category = tostring(k),
Name = tostring(v23.DisplayName or k),
Rarity = flag3,
RarityName = str4,
})
end
end
end
local tbl49 ={}
for k in pairs(tbl47) do
table.insert(tbl49, k)
end
table.sort(tbl49)
for _, v23 in ipairs(tbl49) do
local str4 = string.format("%d - %s", v23, tbl47[v23])
table.insert(tbl43, str4)
tbl44[str4] = v23
end
table.sort(tbl48, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity < arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v23 in ipairs(tbl48) do
local str4 = string.format("%s [%s]", v23.Name, v23.RarityName)
if tbl46[str4] then
str4 = string.format("%s [%s] (%s)", v23.Name, v23.RarityName, v23.Category)
end
table.insert(tbl45, str4)
tbl46[str4] = v23.Category
end
end
local v23
do
local function fn40(arg)
for _, v24 in ipairs(tbl43) do
if tbl44[v24] == arg then
return v24
end
end
return tbl43[#tbl43]
end
v23 = nil
local v24 = nil
local v25 = tbl41[1]
local v26 = tbl42[1]
local n24 = 6
local tbl47 ={}
local flag3 = true
local flag4 = true
local flag5 = false
local n25 = 0
local n26 = 0
local n27 = 0
local tbl48 ={}
local function fn41(arg, arg2)
local v27 = networking:FindFirstChild(arg)
if not v27 or not v27:IsA("RemoteFunction") then
return false, nil
end
if arg2 == nil then
return pcall(v27.InvokeServer, v27)
end
return pcall(v27.InvokeServer, v27, arg2)
end
local function fn42()
local save3 = tbl.Save
if type(save3) ~= "table" or type(save3.Get) ~= "function" then
return nil
end
local ok, result = pcall(save3.Get)
return ok and type(result) == "table" and result or nil
end
local function fn43(arg)
local directory = tbl.Assets and tbl.Assets.Directory
return type(directory) == "table" and directory[tostring(arg)] or nil
end
local function fn44(arg)
local v27 = fn43(arg)
local rarity = type(v27) == "table" and v27.Rarity or nil
local flag6 = type(rarity) == "table"
if flag6 then
flag6 = tonumber(rarity.RarityNumber or rarity.Rank)
end
return flag6 or math.huge
end
local function fn45(arg)
local v27 = fn43(arg)
return tostring(type(v27) == "table" and v27.DisplayName or arg)
end
local function fn46(arg)
local v27 = fn43(arg.Category)
local n28 = type(v27) == "table" and tonumber(v27.EarningRate) or 0
local n29 = tonumber(arg.Scale) or 0
if n28 <= 0 or n29 <= 0 then
return 0
end
local n30 = n29 > 5 and(n29 / 5) ^ 1.2 * 19.637875755794113 or n29 ^ 1.85
local mutations = tbl.Mutations
local flag6 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n31 = 1
if flag6 then
local ok
ok, n31 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
ok = ok and type(n31) == "number"
local n32 = 1
if not ok then
n31 = n32
end
end
return n28 * n30 * n31
end
local function fn47(arg)
return type(arg) == "table" and next(arg) ~= nil
end
local function fn48(arg)
local n28 = tonumber(arg) or 0
local tbl49 ={"", "K", "M", "B", "T", "Qa", "Qi"}
local n29 = 1
while math.abs(n28) >= 1000 and n29 < #tbl49 do
n28 /= 1000
n29 += 1
end
return string.format(n29 == 1 and "$%.0f%s" or "$%.2f%s", n28, tbl49[n29])
end
local function fn49(arg)
local fuseKernel = tbl.FuseKernel
if type(fuseKernel) ~= "table" or type(fuseKernel.PriceFor) ~= "function" then
return nil
end
local ok, result = pcall(fuseKernel.PriceFor, arg)
return ok and tonumber(result) or nil
end
local function fn50(arg, arg2, arg3)
local flag6 = type(arg2) == "table" and arg2.IsFavorite ~= true and not arg3[arg] and fn44(arg2.Category) <= n24 and(next(tbl47) == nil or tbl47[tostring(arg2.Category)] == true)
if flag6 then
flag6 = not(flag3 and fn47(arg2.Mutations))
end
if flag6 then
flag6 =(tbl48[arg] or 0) <= os.clock()
end
return flag6
end
local function fn51(arg)
local inventory = type(arg.Inventory) == "table" and arg.Inventory or{}
local tbl49 ={}
local v27 = pairs
local equippedAssets = arg.EquippedAssets or{}
for _, equippedAsset in v27(equippedAssets) do
tbl49[equippedAsset] = true
end
local tbl50 ={}
local tbl51 ={}
for i = 1, 3 do
local flag6 = type(arg.FusionSlots) == "table" and arg.FusionSlots[i] or nil
if flag6 ~= nil and type(inventory[flag6]) == "table" then
table.insert(tbl50, flag6)
tbl51[flag6] = true
end
end
local tbl52 ={}
for k, v28 in pairs(inventory) do
if not tbl51[k] and type(v28) == "table" and v28.InFuse ~= true and fn50(k, v28, tbl49) then
local str4 = tostring(v28.Category)
tbl52[str4] = tbl52[str4] or{}
table.insert(tbl52[str4],{Uid = k, Item = v28, Income = fn46(v28)})
end
end
local function fn52(arg2)
table.sort(arg2, function(arg3, arg4)
if arg3.Income ~= arg4.Income then
if v26 == tbl42[2] then
return arg3.Income > arg4.Income
end
return arg3.Income < arg4.Income
end
return tostring(arg3.Uid) < tostring(arg4.Uid)
end)
end
if #tbl50 > 0 then
local str4 = tostring(inventory[tbl50[1]].Category)
local flag6 = true
for _, v28 in ipairs(tbl50) do
local v29 = inventory[v28]
if tostring(v29.Category) ~= str4 or not fn50(v28, v29, tbl49) then
flag6 = false
end
end
local tbl53 = tbl52[str4] or{}
if flag6 and #tbl50 + #tbl53 >= 3 then
fn52(tbl53)
local tbl54 ={Category = str4, Load ={}, Items ={}}
for _, v28 in ipairs(tbl50) do
table.insert(tbl54.Items, inventory[v28])
end
for i = 1, 3 - #tbl50 do
table.insert(tbl54.Load, tbl53[i].Uid)
table.insert(tbl54.Items, tbl53[i].Item)
end
return tbl54
end
if flag4 then
return{Category = str4, Eject = tbl50}
end
return nil, "Machine holds pets that cannot finish a fuse"
end
local v28 = nil
local v29 = nil
for k, v30 in pairs(tbl52) do
if #v30 >= 3 then
local v31 = fn44(k)
local n28 = 0
for _, v32 in ipairs(v30) do
n28 += v32.Income
end
local tbl53
if v25 == tbl41[2] then
tbl53 ={-v31, -#v30}
elseif v25 == tbl41[3] then
tbl53 ={-#v30, v31}
elseif v25 == tbl41[4] then
tbl53 ={n28 / #v30, v31}
else
tbl53 ={v31, -#v30}
end
if v28 == nil or tbl53[1] < v28[1] or tbl53[1] == v28[1] and(tbl53[2] < v28[2] or tbl53[2] == v28[2] and k < v29) then
v28 = tbl53
v29 = k
end
end
end
if not v29 then
return nil, "No three matching pets"
end
local v30 = tbl52[v29]
fn52(v30)
local tbl53 ={Category = v29, Load ={}, Items ={}}
for i = 1, 3 do
table.insert(tbl53.Load, v30[i].Uid)
table.insert(tbl53.Items, v30[i].Item)
end
return tbl53
end
local function fn52(arg)
local v27 = fn42()
if not v27 then
return
end
if v27.FusionLocked == true then
if type(v27.FusionEggReward) == "table" and os.clock() >= n27 then
n27 = os.clock() + n22
fn41("RF/Fusery/FinishReveal")
end
return
end
local v28 = fn51(v27)
if not v28 then
return
end
if v28.Eject then
for _, v29 in ipairs(v28.Eject) do
if arg ~= n25 then
return
end
fn41("RF/Fusery/EjectPet", v29)
task.wait(0.35)
end
return
end
local v29 = fn49(v28.Items)
local num = tonumber(v27.Money)
if v29 and num and num < v29 then
return
end
for _, v30 in ipairs(v28.Load) do
if arg ~= n25 then
return
end
local LoadPet, v31 = fn41("RF/Fusery/LoadPet", v30)
if not LoadPet or v31 == false then
tbl48[v30] = os.clock() + n23
return
end
task.wait(0.35)
end
if arg ~= n25 then
return
end
local BeginFuse, v30 = fn41("RF/Fusery/BeginFuse")
if BeginFuse and v30 ~= false then
n27 = os.clock() + n22
end
end
local function fn53(arg)
if not arg then
return "Fuse status unknown"
end
if arg.FusionLocked == true then
return "Machine is fusing, waiting for the egg"
end
local v27, v28 = fn51(arg)
if not v27 then
return v28 or "No three matching pets"
end
if v27.Eject then
return string.format("Would eject %d %s that cannot finish a fuse", #v27.Eject, fn45(v27.Category))
end
local v29 = fn49(v27.Items)
local num = tonumber(arg.Money)
local str4 = v29 and num and num < v29 and "  (not enough money)" or ""
return string.format("Next fuse  -  3 %s for %s%s", fn45(v27.Category), v29 and fn48(v29) or "?", str4)
end
tbl3.Add(function()
local v27 = fn42()
if v24 and type(v24.Set) == "function" then
pcall(v24.Set, v24, fn53(v27))
end
if not tbl4.Toggle(v23, false) or flag5 or os.clock() < n26 then
return false
end
flag5 = true
n26 = os.clock() + n21
local v28 = n25
task.spawn(function()
pcall(fn52, v28)
flag5 = false
tbl3.Wake()
end)
return false
end)
v24 = v14:CreateText({Name = "Fuse Preview", Text = "Fuse status unknown"})
v23 = v14:CreateToggle({
Name = "Auto Fuse Machine",
Note = "Fuse 3 same pets into an egg, nonstop",
Default = false,
Callback = function()
n25 += 1
table.clear(tbl48)
n26 = 0
tbl3.Wake()
end,
})
v14:CreateDropdown({
Name = "Fuse Priority Mode",
Options = tbl41,
Default = tbl41[1],
SubOf = v23,
Callback = function(arg)
if table.find(tbl41, arg) then
v25 = arg
tbl3.Wake()
end
end,
})
v14:CreateDropdown({
Name = "Pets To Use",
Options = tbl42,
Default = tbl42[1],
SubOf = v23,
Callback = function(arg)
if table.find(tbl42, arg) then
v26 = arg
tbl3.Wake()
end
end,
})
v14:CreateDropdown({
Name = "Max Rarity to Fuse",
Options = tbl43,
Default = fn40(6),
SubOf = v23,
Callback = function(arg)
n24 = tbl44[arg] or n24
tbl3.Wake()
end,
})
fn6(v14:CreateMultiDropdown({
Name = "Specific Species to Fuse",
Note = "Only fuse these species (empty = all)",
Options = tbl45,
Default ={},
SubOf = v23,
Callback = function(arg)
local tbl49 ={}
if type(arg) == "table" then
for k, v27 in pairs(arg) do
k = v27 == true and type(k) == "string" and k or type(v27) == "string" and v27
local v28 = k or nil
if v28 and tbl46[v28] then
tbl49[tbl46[v28]] = true
end
end
end
tbl47 = tbl49
tbl3.Wake()
end,
}))
local v27 = nil
v27 = v14:CreateToggle({
Name = "Skip Mutated Pets",
Default = true,
SubOf = v23,
Callback = function()
flag3 = tbl4.Toggle(v27, true)
tbl3.Wake()
end,
})
local v28 = nil
v28 = v14:CreateToggle({
Name = "Eject Incomplete Slots",
Note = "Take out pets that can't make a set",
Default = true,
SubOf = v23,
Callback = function()
flag4 = tbl4.Toggle(v28, true)
tbl3.Wake()
end,
})
end
local save3 = tbl.Save
if type(save3) == "table" and type(save3.FieldSignal) == "function" then
for _, v24 in ipairs({
"Inventory",
"EquippedAssets",
"FusionSlots",
"FusionLocked",
"FusionEggReward",
"Money",
}) do
local ok, result = pcall(save3.FieldSignal, v24)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
endn2 = 2
n3 = 25
n4 = 4
tbl14 ={"Match Any", "Match All"}
do
local tbl47 ={"Golden", "Silver", "Rainbow", "Boss", "Monstrous", "Sakura", "GreatBloom"}
str = "Any Mutation"
tbl15 ={"Off"}
tbl16 ={}
tbl17 ={}
tbl18 ={}
tbl19 ={"Any Mutation"}
tbl20 ={}
local directory = tbl.Assets and tbl.Assets.Directory
local tbl48 ={}
local tbl49 ={}
if type(directory) == "table" then
for k, v24 in pairs(directory) do
local rarity = type(v24) == "table" and v24.Rarity or nil
local flag3 = type(rarity) == "table"
if flag3 then
flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
end
flag3 = flag3 or nil
if flag3 then
local str4 = tostring(rarity.DisplayName or rarity._id or flag3)
tbl48[flag3] = tbl48[flag3] or str4
table.insert(tbl49,{
Category = tostring(k),
Name = tostring(v24.DisplayName or k),
Rarity = flag3,
RarityName = str4,
})
end
end
end
local tbl50 ={}
for k in pairs(tbl48) do
table.insert(tbl50, k)
end
table.sort(tbl50)
for _, v24 in ipairs(tbl50) do
local str4 = string.format("%d - %s", v24, tbl48[v24])
table.insert(tbl15, str4)
tbl16[str4] = v24
end
table.sort(tbl49, function(arg, arg2)
if arg.Rarity ~= arg2.Rarity then
return arg.Rarity < arg2.Rarity
end
return arg.Name < arg2.Name
end)
for _, v24 in ipairs(tbl49) do
local str4 = string.format("%s [%s]", v24.Name, v24.RarityName)
if tbl18[str4] then
str4 = string.format("%s [%s] (%s)", v24.Name, v24.RarityName, v24.Category)
end
table.insert(tbl17, str4)
tbl18[str4] = v24.Category
end
local tbl51 ={}
local mutations = tbl.Mutations
if type(mutations) == "table" and type(mutations.IdSet) == "table" then
for k in pairs(mutations.IdSet) do
table.insert(tbl51, tostring(k))
end
end
if #tbl51 == 0 then
tbl51 = table.clone(tbl47)
end
table.sort(tbl51, function(arg, arg2)
return fn7(arg) < fn7(arg2)
end)
for _, v24 in ipairs(tbl51) do
local v25 = fn7(v24)
table.insert(tbl19, v25)
tbl20[v25] = v24
end
end
end
do
local v9 = nil
local v10 = nil
local v11 = nil
local createText = nil
local v12 = tbl14[2]
local v13 = nil
local flag = false
local tbl21 ={}
local n5 = 0
local tbl22 ={}
local flag2 = false
local n6 = 0
local tbl23 ={}
local function fn8()
local save = tbl.Save
if type(save) ~= "table" or type(save.Get) ~= "function" then
return nil
end
local ok, result = pcall(save.Get)
return ok and type(result) == "table" and result or nil
end
local function fn9(arg)
local directory = tbl.Assets and tbl.Assets.Directory
return type(directory) == "table" and directory[tostring(arg)] or nil
end
local function fn10(arg)
local v14 = fn9(arg)
local rarity = type(v14) == "table" and v14.Rarity or nil
local flag3 = type(rarity) == "table"
if flag3 then
flag3 = tonumber(rarity.RarityNumber or rarity.Rank)
end
return flag3 or 0
end
local function fn11(arg)
local v14 = fn9(arg.Category)
local n7 = type(v14) == "table" and tonumber(v14.EarningRate) or 0
local n8 = tonumber(arg.Scale) or 0
if n7 <= 0 or n8 <= 0 then
return 0
end
local n9 = n8 > 5 and(n8 / 5) ^ 1.2 * 19.637875755794113 or n8 ^ 1.85
local mutations = tbl.Mutations
local flag3 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
local n10 = 1
if flag3 then
local ok
ok, n10 = pcall(mutations.EarningsFor, type(arg.Mutations) == "table" and arg.Mutations or{})
ok = ok and type(n10) == "number"
local n11 = 1
if not ok then
n10 = n11
end
end
return n7 * n9 * n10
end
local function fn12(arg)
local tbl24 ={}
if type(arg.Mutations) == "table" then
for k, mutation in pairs(arg.Mutations) do
if type(mutation) == "string" then
tbl24[mutation] = true
elseif mutation == true and type(k) == "string" then
tbl24[k] = true
end
end
end
if type(arg.BaseMutation) == "string" and arg.BaseMutation ~= "" then
tbl24[arg.BaseMutation] = true
end
return tbl24
end
local function fn13(arg)
if tbl22[tostring(arg.Category)] then
return true
end
local n7 = 0
local n8 = 0
if v13 then
n7 = 1
if v13 <= fn10(arg.Category) then
n8 = 1
end
end
if flag or next(tbl21) ~= nil then
n7 += 1
local v14 = fn12(arg)
if flag and next(v14) ~= nil then
n8 += 1
else
local flag3 = false
for k in pairs(v14) do
if tbl21[k] then
flag3 = true
break
end
end
if flag3 then
n8 += 1
end
end
end
if n5 > 0 then
n7 += 1
if n5 <= fn11(arg) then
n8 += 1
end
end
if n7 == 0 then
return false
end
if v12 == tbl14[2] then
return n8 == n7
end
return n8 > 0
end
local function fn14(arg)
return(tbl23[arg] or 0) > os.clock()
end
local function fn15(arg)
local tbl24 ={}
local v14, v15, v16 = pairs(arg.Inventory or{})
local n7 = 0
for k, v17 in v14, v15, v16 do
if type(v17) == "table" and fn13(v17) then
n7 += 1
if v17.IsFavorite ~= true and not fn14(k) then
table.insert(tbl24, k)
end
end
end
return tbl24, n7
end
local function fn16(arg, arg2, arg3)
local tbl24 ={}
local inventory = arg.Inventory or{}
local v14 = pairs
local equippedAssets = arg.EquippedAssets or{}
for _, equippedAsset in v14(equippedAssets) do
local v15 = inventory[equippedAsset]
if type(v15) == "table" and not fn14(equippedAsset) then
if arg2 then
if v15.IsFavorite ~= true then
table.insert(tbl24, equippedAsset)
end
else
local flag3 = v15.IsFavorite == true
if flag3 then
flag3 = not(arg3 and fn13(v15))
end
if flag3 then
table.insert(tbl24, equippedAsset)
end
end
end
end
return tbl24
end
local function fn17(arg, arg2)
local rePetSatchelWriteFavourite = networking:FindFirstChild("RE/PetSatchel/WriteFavourite")
if not rePetSatchelWriteFavourite or not rePetSatchelWriteFavourite:IsA("RemoteEvent") then
return
end
for i, v14 in ipairs(arg) do
if not(i > n3) then
tbl23[v14] = os.clock() + n4
pcall(rePetSatchelWriteFavourite.FireServer, rePetSatchelWriteFavourite, v14, arg2)
task.wait(0.12)
continue
end
break
end
end
local function fn18(arg, arg2)
if flag2 or #arg == 0 then
return false
end
flag2 = true
n6 = os.clock() + n2
task.spawn(function()
pcall(fn17, arg, arg2)
flag2 = false
tbl3.Wake()
end)
return true
end
tbl3.Add(function()
local v14 = fn8()
if not v14 then
return false
end
local v15 = tbl4.Toggle(v9, false)
local v16, v17 = fn15(v14)
if createText and type(createText.Set) == "function" then
local v18 = pairs
local inventory = v14.Inventory or{}
local n7 = 0
for _, v19 in v18(inventory) do
if type(v19) == "table" and v19.IsFavorite == true then
n7 += 1
end
end
pcall(createText.Set, createText, string.format("Favorite matches  -  %d pets, %d to mark  |  %d favorited", v17, #v16, n7))
end
if flag2 or os.clock() < n6 then
return false
end
if v15 and fn18(v16, true) then
return false
end
if tbl4.Toggle(v10, false) then
if fn18(fn16(v14, true, false), true) then
return false
end
elseif tbl4.Toggle(v11, false) then
fn18(fn16(v14, false, v15), false)
end
return false
end)
createText = v8.CreateText
createText = createText(v8,{Name = "Favorite Preview", Text = "Favorite matches  -  0 pets"})
v9 = v8:CreateToggle({
Name = "Auto Favorite Pet",
Note = "Favorite pets matching the rules below",
Default = false,
Callback = function()
table.clear(tbl23)
tbl3.Wake()
end,
})
v8:CreateButton({
Name = "Favorite Pets Now",
Note = "Favorite matching pets once",
ButtonText = "Favorite",
ConfirmText = "Done!",
SubOf = v9,
Callback = function()
local v14 = fn8()
if v14 then
fn18(fn15(v14), true)
end
end,
})
v8:CreateDropdown({
Name = "Favorite Rule",
Note = "Pass any check or all checks",
Options = tbl14,
Default = tbl14[2],
SubOf = v9,
Callback = function(arg)
if table.find(tbl14, arg) then
v12 = arg
tbl3.Wake()
end
end,
})
v8:CreateDropdown({
Name = "Favorite Min Rarity",
Note = "Favorite pets of the chosen rarity and every rarity above it (Off = skip)",
Options = tbl15,
Default = "Off",
SubOf = v9,
Callback = function(arg)
v13 = tbl16[arg]
tbl3.Wake()
end,
})
fn6(v8:CreateMultiDropdown({
Name = "Favorite Mutations",
Note = "Mutation check (empty = skip)",
Options = tbl19,
Default ={},
SubOf = v9,
Callback = function(arg)
local tbl24 ={}
local flag3 = false
if type(arg) == "table" then
local v14, v15, v16 = pairs(arg)
local flag4 = false
for k, v17 in v14, v15, v16 do
k = v17 == true and type(k) == "string" and k or type(v17) == "string" and v17 or nil
if k == str then
flag4 = true
elseif k then
k = tbl20[k] or k
tbl24[k] = true
end
end
flag3 = flag4
end
flag = flag3
tbl21 = tbl24
tbl3.Wake()
end,
}))
local tbl24 ={
["K/s"] ={Min = 0, Max = 1000, Mult = 1000},
["M/s"] ={Min = 0, Max = 1000, Mult = 1000000},
["B/s"] ={Min = 0, Max = 100, Mult = 1e9},
}
local n7 = 0
local str2 = "M/s"
local function fn19(arg, arg2)
if arg ~= nil then
n7 = math.max(0, math.floor(tonumber(arg) or n7))
end
if arg2 ~= nil then
str2 = tostring(arg2)
end
n5 = n7 *(tbl24[str2] or tbl24["M/s"]).Mult
tbl3.Wake()
end
fn5(v8,{
Name = "Min Favorite Value",
Note = "Value check (0 = skip)",
SubOf = v9,
Legacy = "Favorite Min Value",
SectionName = "Auto Favorite",
OnRaw = function(arg)
fn19(math.floor(arg / 1000), "K/s")
end,
})
fn6(v8:CreateMultiDropdown({
Name = "Always Favorite Species",
Note = "Always favorite these species",
Options = tbl17,
Default ={},
SubOf = v9,
Callback = function(arg)
local tbl25 ={}
if type(arg) == "table" then
for k, v14 in pairs(arg) do
k = v14 == true and type(k) == "string" and k
local flag3
if k then
flag3 = k
else
flag3 = type(v14) == "string" and v14
end
flag3 = flag3 or nil
if flag3 and tbl18[flag3] then
tbl25[tbl18[flag3]] = true
end
end
end
tbl22 = tbl25
tbl3.Wake()
end,
}))
v10 = v8:CreateToggle({
Name = "Auto Favorite Equipped",
Note = "Keep equipped pets favorited",
Default = false,
Callback = function()
tbl3.Wake()
end,
})
v11 = v8:CreateToggle({
Name = "Auto Unfavorite Equipped",
Note = "Unfavorite equipped pets not in the rules",
Default = false,
Callback = function()
tbl3.Wake()
end,
})
v8:CreateButton({
Name = "Favorite Equipped Now",
Note = "Favorite all equipped pets once",
ButtonText = "Favorite",
ConfirmText = "Done!",
Callback = function()
local v14 = fn8()
if v14 then
fn18(fn16(v14, true, false), true)
end
end,
})
v8:CreateButton({
Name = "Unfavorite Equipped Now",
Note = "Unfavorite all equipped pets once",
ButtonText = "Unfavorite",
ConfirmText = "Done!",
Callback = function()
local v14 = fn8()
if v14 then
fn18(fn16(v14, false, false), false)
end
end,
})
end
local save = tbl.Save
if type(save) == "table" and type(save.FieldSignal) == "function" then
for _, v9 in ipairs({"Inventory", "EquippedAssets"}) do
local ok, result = pcall(save.FieldSignal, v9)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
local v11
v11 = v2:CreateTab({Name = "Progress", SectionsExpanded = true}):CreateSection({Name = "Auto Progression", Expanded = true})
do
local tbl16 ={}
local tbl17
tbl17 ={
Remote = function(arg)
local v12 = tbl16[arg]
if v12 ~= nil then
return v12 or nil
end
local v13 = networking:FindFirstChild(arg)
tbl16[arg] = v13 or false
return v13
end,
Invoke = function(arg,...)
local v12 = tbl17.Remote(arg)
if not v12 or not v12:IsA("RemoteFunction") then
return false, nil
end
local ok, result = pcall(v12.InvokeServer, v12,...)
return ok, result
end,
Fire = function(arg,...)
local v12 = tbl17.Remote(arg)
if not v12 or not v12:IsA("RemoteEvent") then
return false
end
return pcall(v12.FireServer, v12,...)
end,
}
local function saveData()
local save = tbl.Save
if type(save) ~= "table" or type(save.Get) ~= "function" then
return nil
end
local ok, result = pcall(save.Get)
return ok and type(result) == "table" and result or nil
end
tbl17.SaveData = saveData
local tbl18 ={"Money", "Cash", "Coins", "Currency", "Balance"}
tbl17.Money = function()
local v12 = saveData()
if v12 then
for _, v13 in ipairs(tbl18) do
local num = tonumber(v12[v13])
if num then
return num
end
end
end
local leaderstats = localPlayer:FindFirstChild("leaderstats")
if leaderstats then
for _, v13 in ipairs(tbl18) do
local v14 = leaderstats:FindFirstChild(v13)
if v14 and tonumber(v14.Value) then
return tonumber(v14.Value)
end
end
end
return nil
end
tbl17.AddWorker = tbl3.Add
tbl17.Backoff = tbl3.Backoff
local tbl19 ={
"Money",
"BaseUpgradeLevel",
"TreadmillUpgradeLevel",
"TrailInventory",
"PendingOfflineMoney",
}
local save = tbl.Save
if type(save) == "table" and type(save.FieldSignal) == "function" then
for _, v12 in ipairs(tbl19) do
local ok, result = pcall(save.FieldSignal, v12)
if ok and type(result) == "table" and type(result.Connect) == "function" then
local ok2, result2 = pcall(result.Connect, result, function()
tbl3.Wake()
end)
if ok2 and result2 then
fn4(function()
pcall(function()
result2:Disconnect()
end)
end)
end
end
end
end
local v12 = nil
local v13 = nil
local tbl20 ={}
local function fn15()
local v14 = fn2(function()
return ReplicatedStorage.Data.Trails
end)
local directory = type(v14) == "table" and v14.Directory or nil
if type(directory) ~= "table" then
return{}
end
local tbl21 ={}
for k, v15 in pairs(directory) do
if type(v15) == "table" then
table.insert(tbl21,{Id = tostring(v15._id or k), Price = tonumber(v15.Price) or math.huge})
end
end
table.sort(tbl21, function(arg, arg2)
return arg.Price < arg2.Price
end)
return tbl21
end
local function fn16(arg)
if not tbl6.ReadToggle(v12, false) then
return false
end
v13 = v13 or fn15()
local v14 = tbl17.SaveData()
if not v14 or #v13 == 0 then
return false
end
local trailInventory = type(v14.TrailInventory) == "table" and v14.TrailInventory or{}
local n13 = tonumber(v14.Money) or 0
for _, v15 in ipairs(v13) do
if trailInventory[v15.Id] ~= true and not tbl20[v15.Id] and v15.Price <= n13 then
local AskPurchase, v16 = tbl17.Invoke("RF/Trailwear/AskPurchase", v15.Id)
if AskPurchase and v16 ~= false then
return true
end
tbl20[v15.Id] = true
tbl17.Backoff(arg)
return false
end
end
return false
end
v12 = v11:CreateToggle({
Name = "Auto Buy Trail",
Note = "Automatically buy available trails when affordable",
Default = false,
Callback = function()
table.clear(tbl20)
v13 = nil
end,
})
tbl17.AddWorker(fn16)
local v14 = nil
local function fn17()
if not tbl6.ReadToggle(v14, false) then
return false
end
local v15 = tbl17.SaveData()
if not v15 then
return false
end
local v16 = fn2(function()
return ReplicatedStorage.Data.Bases
end)
local bases = type(v16) == "table" and v16.BASES or nil
if type(bases) ~= "table" then
return false
end
local n13 = tonumber(v15.BaseUpgradeLevel) or 0
local ok = nil
if type(v16.GetMaxBaseLevel) == "function" then
local result
ok, result = pcall(v16.GetMaxBaseLevel)
ok = ok and tonumber(result) or nil
end
if ok and n13 >= ok then
return false
end
local v17 = bases[n13 + 1]
local num = type(v17) == "table" and tonumber(v17.Cost) or nil
if num then
num =(tonumber(v15.Money) or 0) >= num
end
if num then
return tbl17.Fire("RE/Homestead/AskBaseTierRaise")
end
return false
end
v14 = v11:CreateToggle({
Name = "Auto Upgrade Base",
Note = "Automatically upgrade base when money is available",
Default = false,
})
tbl17.AddWorker(fn17)
local v15 = nil
local function fn18()
if not tbl6.ReadToggle(v15, false) then
return false
end
local v16 = tbl17.SaveData()
if not v16 then
return false
end
local v17 = fn2(function()
return ReplicatedStorage.Data.Treadmills
end)
if type(v17) ~= "table" or type(v17.GetByUpgradeLevel) ~= "function" then
return false
end
local ok, result = pcall(v17.GetByUpgradeLevel,(tonumber(v16.TreadmillUpgradeLevel) or 0) + 1)
if not ok or type(result) ~= "table" then
return false
end
local id = result._id
local huge = tonumber(result.Price) or math.huge
local flag2 = type(id) == "string"
if flag2 then
flag2 =(tonumber(v16.Money) or 0) >= huge
end
if flag2 then
local AskTierRaise, v18 = tbl17.Invoke("RF/Treadmill/AskTierRaise", id)
return AskTierRaise and v18 ~= false
end
return false
end
v15 = v11:CreateToggle({
Name = "Auto Upgrade Treadmill",
Note = "Automatically upgrade treadmill when money is available",
Default = false,
})
tbl17.AddWorker(fn18)
local n13 = 15
local v16 = nil
local n14 = 15
local now = os.clock()
local function fn19()
if not tbl6.ReadToggle(v16, false) then
return false
end
local now2 = os.clock()
n14 += now2 - now
now = now2
local num = tbl17.SaveData()
num = num and tonumber(num.PendingOfflineMoney) or nil
if num == nil then
local PendingCheck, v17 = tbl17.Invoke("RF/AwayEarnings/PendingCheck")
num = PendingCheck and v17 ~= false and v17 ~= nil and 1 or 0
end
local flag2 = false
if num > 0 then
local v17
flag2, v17 = tbl17.Invoke("RF/AwayEarnings/AskCollect")
flag2 = flag2 and v17 ~= false
end
if n13 <= n14 then
n14 = 0
local AskRedeemAll, v17 = tbl17.Invoke("RF/Codex/AskRedeemAll")
flag2 = flag2 or AskRedeemAll and v17 ~= false
tbl17.Invoke("RF/Codex/AskRedeemLimitedEgg")
end
return flag2
end
v16 = v11:CreateToggle({
Name = "Auto Claim",
Note = "Claim offline money & index rewards",
Default = false,
Callback = function()
n14 = n13
end,
})
tbl17.AddWorker(fn19)
end
tbl4.IndexClaimHandle = v11:CreateToggle({
Name = "Auto Claim Index",
Note = "Claim index rewards as soon as they unlock",
Default = false,
Callback = function()
if type(tbl4.IndexClaimRestart) == "function" then
tbl4.IndexClaimRestart()
end
end,
})
local fn15
fn15 = function(arg, arg2)
if type(v.Notify) == "function" then
pcall(v.Notify, arg, arg2, 5)
end
end
local v12
v12 = v2:CreateTab({Name = "Server", SectionsExpanded = true}):CreateSection({Name = "Server", Expanded = true})
local TeleportService
TeleportService = game:GetService("TeleportService")
local HttpService
HttpService = game:GetService("HttpService")
local GuiService
GuiService = game:GetService("GuiService")
do
local function fn16()
if type(queue_on_teleport) == "function" then
return queue_on_teleport
end
if type(queueonteleport) == "function" then
return queueonteleport
end
if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
return syn.queue_on_teleport
end
if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
return fluxus.queue_on_teleport
end
return nil
end
local function fn17(arg)
pcall(function()
TeleportService:SetTeleportSetting("__ZyroAutoLoadScriptEnabled", arg)
end)
if not arg then
return true
end
local v13 = fn16()
if not v13 then
return false
end
if rawget(_G, "__ZyroAutoLoadQueued") ~= true then
if not pcall(v13,[[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
enabled = TeleportService:GetTeleportSetting("__ZyroAutoLoadScriptEnabled") == true
end)
if enabled then
if not game:IsLoaded() then
game.Loaded:Wait()
end
pcall(function()
local player = game:GetService("Players").LocalPlayer
if player and not player.Character then
player.CharacterAdded:Wait()
end
end)
task.wait(1.5)
local ok, source = pcall(function()
return game:HttpGet("https://raw.githubusercontent.com/ZyroHub/zyrohub/main/Zyro.lua")
end)
if ok and type(source) == "string" then
local chunk = loadstring(source)
if chunk then
chunk()
end
end
end
]]) then
return false
end
_G.__ZyroAutoLoadQueued = true
end
return true
end
local AutoLoadBeforeTeleport = fn17
local v13 = nil
local function fn18()
if v13 and tbl4.Toggle(v13, false) then
fn17(true)
end
end
v13 = v12:CreateToggle({
Name = "Auto Load Script",
Default = true,
Callback = function(arg)
local flag2 = arg == true
if not fn17(flag2) and flag2 then
task.defer(function()
fn17(false)
if v13 and type(v13.Set) == "function" then
pcall(v13.Set, v13, false, false)
end
fn15("Auto Load Unavailable", "This executor does not support queue on teleport.")
end)
end
end,
})
local str = "Least Players"
local n13 = 10
local n14 = 0
local v14 = nil
local tbl16 ={}
local flag2 = false
local n15 = 0
local flag3 = false
local v15 = nil
local str2 = ""
local n16 = 0
local n17 = 60
local function fn19(arg)
n14 = 0
v14 = nil
if arg then
tbl16[arg] = true
end
end
pcall(function()
TeleportService.TeleportInitFailed:Connect(function(arg, arg2, arg3)
if not v14 then
return
end
fn19(v14)
flag3 = true
if not flag2 then
fn15("Server Hop Failed", tostring(arg3 ~= "" and arg3 or arg2))
end
end)
end)
local function fn20(arg)
local str3 = tostring(game.JobId or "")
local tbl17 ={}
local flag4 = arg == "Random"
local str4 = arg == "Least Players" and "Asc" or "Desc"
local n18 = flag4 and 3 or 6
local nextPageCursor = nil
for i = 1, n18 do
local str5 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str4)
if nextPageCursor and nextPageCursor ~= "" then
str5..= "&cursor=".. HttpService:UrlEncode(nextPageCursor)
end
local ok, result = pcall(function()
return HttpService:JSONDecode(game:HttpGet(str5))
end)
if not ok or type(result) ~= "table" then
return tbl17, false
end
local v16 = ipairs
local data = result.data or{}
for _, v17 in v16(data) do
local str6 = tostring(v17.id or "")
local huge = tonumber(v17.playing) or math.huge
local n19 = tonumber(v17.maxPlayers) or 0
if str6 ~= "" and str6 ~= str3 and huge < n19 then
tbl17[#tbl17 + 1] ={Id = str6, Playing = huge, Room = n19 - huge}
end
end
if #tbl17 > 0 and not flag4 then
break
end
nextPageCursor = result.nextPageCursor
if not nextPageCursor or nextPageCursor == "" then
break
end
end
return tbl17, true
end
local function serverHop(arg)
local v16
if v15 and str2 == arg and os.clock() - n16 < n17 then
v16 = v15
else
local v17
v16, v17 = fn20(arg)
if not v17 then
return "fetch"
end
v15 = v16
str2 = arg
n16 = os.clock()
end
local function fn21(arg2)
local tbl17 ={}
for _, v17 in ipairs(v16) do
if not tbl16[v17.Id] and v17.Room >= arg2 then
tbl17[#tbl17 + 1] = v17
end
end
return tbl17
end
local v17 = fn21(2)
if #v17 == 0 then
v17 = fn21(1)
end
if #v17 == 0 and next(tbl16) ~= nil then
table.clear(tbl16)
v17 = fn21(1)
end
if #v17 == 0 then
fn19(nil)
v15 = nil
return "empty"
end
local id
if arg == "Random" then
id = v17[math.random(1, #v17)].Id
else
table.sort(v17, function(arg2, arg3)
if arg == "Least Players" then
return arg2.Playing < arg3.Playing
end
return arg2.Playing > arg3.Playing
end)
id = v17[1].Id
end
flag3 = false
v14 = id
n14 = os.clock() + n13
pcall(fn18)
if not pcall(function()
TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
end) then
fn19(id)
return "failed"
end
local n18 = os.clock() + n13
while os.clock() < n18 do
if flag3 then
return "denied"
end
task.wait(0.25)
end
return "waiting"
end
tbl4.ServerHop = serverHop
v12:CreateDropdown({
Name = "Server Hop Mode",
Options ={"Most Players", "Random", "Least Players"},
Default = "Least Players",
Callback = function(arg)
str = tostring(arg or "Least Players")
end,
})
v12:CreateButton({
Name = "Server Hop",
ButtonText = "Hop",
Callback = function()
n15 += 1
local v16 = n15
task.spawn(function()
flag2 = true
local n18 = 0
while v16 == n15 do
n18 += 1
local v17 = serverHop(str)
if not(v17 == "waiting" or v16 ~= n15) then
if v17 == "empty" then
v15 = nil
table.clear(tbl16)
end
if n18 % 10 == 0 then
fn15("Server Hop", string.format("Every server was full so far, %d tries.", n18))
end
task.wait(v17 == "fetch" and 1 or 0.1)
continue
end
break
end
if v16 == n15 then
flag2 = false
end
end)
end,
})
end
v:Finalize({Window = v2, MainTab = defaultTab, ShowMainTab = true})
-- ============================================================
-- ZYRO HUB — BLOCO EXTRA 1/4: Predictor + Discord Tab
-- ============================================================
paint = tbl11.Paint
bold = tbl11.Bold
color = tbl11.Color
local tbl11 ={
Ready = type(v12.CreateCanvas) == "function",
Bullet = utf8.char(8226),
Color ={
Text = "#FFFFFF",
Income = "#4DFF7A",
Clock = "#FFC24D",
Ready = "#4DFF7A",
Growing = "#FFC24D",
Inventory = "#7FD8FF",
Weight = "#CDE7FF",
Scale = "#FFDF8A",
Separator = "#7A8CC0",
Hint = "#9FB8FF",
},
NameFont = (function()
local ok, r = pcall(Font.new, "rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
return ok and r or nil
end)(),
}
do
local ok, r = pcall(Font.new, "rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
tbl11.RarityFont = ok and r or nil
end
do
local seq = tbl6.Sequence
tbl11.NameGradient = seq({
{0, Color3.fromRGB(255, 255, 255)},
{0.5, Color3.fromRGB(222, 238, 255)},
{1, Color3.fromRGB(255, 255, 255)},
})
end
tbl11.Paint = function(a, b) return string.format("<font color=\"%s\">%s</font>", a, b) end
tbl11.Bold = function(a) return "<b>"..tostring(a).."</b>" end
tbl11.Escape = function(a) return (string.gsub(tostring(a), "[<>&]", {["<"]="&lt;",[">"]="&gt;",["&"]="&amp;"})) end
tbl11.Separator = function() return tbl11.Paint(tbl11.Color.Separator, "  "..tbl11.Bullet.."  ") end
tbl11.FormatRate = function(a)
local n = tonumber(a) or 0
if n >= 1e12 then return string.format("%.2fT/s", n/1e12) end
if n >= 1e9 then return string.format("%.2fB/s", n/1e9) end
if n >= 1e6 then return string.format("%.2fM/s", n/1e6) end
if n >= 1000 then return string.format("%.1fK/s", n/1000) end
return string.format("%d/s", math.floor(n))
end
tbl11.FormatWeight = function(a)
local n = tonumber(a) or 0
local s = n >= 1000 and string.format("%.0f", n) or string.format("%.2f", n)
local i, dec = string.match(s, "^(%-?%d+)(%.%d+)$")
i = i or s
local r
while true do
local c
r, c = string.gsub(i, "^(%-?%d+)(%d%d%d)", "%1,%2")
if c == 0 then break else i = r end
end
return r..(dec or "").. " Kg"
end
tbl11.FormatClock = function(a)
local n = math.max(0, math.floor(tonumber(a) or 0))
return string.format("%02dh %02dm %02ds", math.floor(n/3600), math.floor(n%3600/60), n%60)
end
tbl11.ScaleFactor = function(a)
if a > 5 then return (a/5)^1.2 * 19.637875755794113 end
return a^1.85
end
tbl11.MutationMultiplier = function(a)
a = type(a) == "table" and a or {}
local mutations = tbl.Mutations
if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
local ok, r = pcall(mutations.EarningsFor, a)
if ok and type(r) == "number" then return r end
end
return 1
end
do
local map = {Golden = "#FFD34D", Silver = "#E6EEF7", Sakura = "#FF9ED8", GreatBloom = "#7CFFC4", Boss = "#FF7A7A", Monstrous = "#C08BFF"}
local rainbow = {"#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF"}
tbl11.MutationText = function(a)
local out = {}
if type(a) == "table" then
for _, v in ipairs(a) do
local up = string.upper(fn7(v))
if v == "Rainbow" or v == "Prismatic" then
local rb = {}
for i = 1, #up do rb[#rb+1] = tbl11.Paint(rainbow[(i-1)%#rainbow+1], string.sub(up, i, i)) end
out[#out+1] = tbl11.Bold(table.concat(rb))
else
out[#out+1] = tbl11.Bold(tbl11.Paint(map[v] or "#8FE3FF", tbl11.Escape(up)))
end
end
end
return table.concat(out, " ")
end
end
do
local rg = nil
local function getRG(rar)
if type(rar) == "table" and typeof(rar.RarityGradient) == "Instance" then return rar.RarityGradient end
if rg == nil then
local a = ReplicatedStorage:FindFirstChild("Assets")
local ui = a and a:FindFirstChild("UI")
rg = ui and ui:FindFirstChild("RarityGradients") or false
end
if not rg or type(rar) ~= "table" then return nil end
local f = rg:FindFirstChild(tostring(rar._id or rar.DisplayName or ""))
return f and f:FindFirstChild("RarityGradient") or nil
end
local cache = {}
tbl11.AssetInfo = function(arg)
local cat = tostring(arg)
if cache[cat] then return cache[cat] end
local dir = tbl.Assets and tbl.Assets.Directory
local flag = type(dir) == "table" and dir[cat] or nil
local rarity = type(flag) == "table" and type(flag.Rarity) == "table" and flag.Rarity or nil
local icon = type(flag) == "table" and flag.Icon or nil
local rname = rarity and tostring(rarity.DisplayName or rarity._id or "Common") or "Common"
local c3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.fromRGB(255,255,255)
local info = {}
info.Name = type(flag) == "table" and tostring(flag.DisplayName or cat) or cat
info.Category = cat
info.Rarity = rname
info.RarityNumber = rarity and tonumber(rarity.RarityNumber or rarity.Rank) or 0
info.Color = c3
info.Hex = "#"..string.upper(c3:ToHex())
info.Gradient = getRG(rarity)
info.EarningRate = type(flag) == "table" and tonumber(flag.EarningRate) or 0
info.Icon = type(icon) == "string" and icon ~= "" and icon or nil
cache[cat] = info
return info
end
end
tbl11.Income = function(arg, scale, muts)
if type(scale) ~= "number" or scale <= 0 then return 0 end
return math.max(math.round(arg.EarningRate * tbl11.ScaleFactor(scale) * tbl11.MutationMultiplier(muts)), 1)
end
local function isShown(a)
if typeof(a) ~= "Instance" or not a:IsDescendantOf(game) then return false end
while a do
if a:IsA("GuiObject") and not a.Visible then return false end
if a:IsA("LayerCollector") then return a.Enabled end
a = a.Parent
end
return false
end
tbl11.PageVisible = function()
local ok, r = pcall(function() return v11.Page end)
if not ok or typeof(r) ~= "Instance" then return true end
return isShown(r) and r.AbsoluteSize.X > 0
end
tbl11.IsShown = isShown
-- (Predictor tab setup — resumido)do
local v15 = v2:CreateTab({Name = "Discord", Side = "Right", SectionsExpanded = true}):CreateSection({Name = "Community", Expanded = true})
local str = "discord.gg/YjEa2NSbTX"
local n14 = 0.5
local n15 = 0.0909
local n16 = 0.2
local n17 = 5.4
local n18 = 4.2
local n19 = 5.2
local n20 = 6
local n21 = 3.6
local n22 = 6.4
local n23 = 2
local n24 = 11.4
local n25 = 3
local n26 = 0.35
local tbl21 ={
{Color = "#FF6A55", Title = "New Scripts &amp; Updates", Text = "Patch notes and new game scripts are posted there first."},
{Color = "#FFB054", Title = "Giveaways", Text = "Member giveaways and events are announced in the server."},
{Color = "#9AA3FF", Title = "Support", Text = "Ask for help, report bugs and get answers from the team."},
{Color = "#6EE49C", Title = "Suggestions", Text = "Request features and vote on what gets added next."},
}
local n27 = n24 + #tbl21 * (n25 + n26) + 2.4 + n16 * 2
local cs = ColorSequence.new
local ck = ColorSequenceKeypoint.new
local c3 = Color3.fromRGB
local v18 = cs({ck(0, c3(255,218,96)), ck(0.5, c3(255,152,60)), ck(1, c3(255,82,64))})
local cs2 = ColorSequence.new(c3(74,24,18), c3(14,11,15))
local tbl23 ={Perks ={}}
local n28 = 0
local function fn19()
local v19 = setclipboard or toclipboard
local ok = type(v19) == "function" and pcall(v19, "https://discord.gg/YjEa2NSbTX") or false
fn15(ok and "Discord Link Copied" or "Discord Link", "https://discord.gg/YjEa2NSbTX")
end
local function fn20(arg)
if not tbl23.Hero then return end
local n29 = n16 * 2
local n30 = math.max(arg, 14) - n29
local n31 = math.max(1, n30 - n19 - n14)
local n32 = math.max(1, n30 - n22 - n14 * 3)
local n33 = math.max(1, n30 - 1.2)
tbl23.Hero.Set({Width = n30})
tbl23.Title.Set({Width = n31})
tbl23.Subtitle.Set({Width = n31})
tbl23.Members.Set({Width = n31})
tbl23.Invite.Set({Width = n30})
tbl23.Label.Set({Width = n32})
tbl23.Link.Set({Width = n32})
tbl23.Copy.Set({X = n30 - n22 - n14})
tbl23.Header.Set({Width = n30})
for _, perk in ipairs(tbl23.Perks) do
perk.Frame.Set({Width = n30})
perk.Title.Set({Width = n33})
perk.Text.Set({Width = n33})
end
tbl23.Tip.Set({Width = n30})
end
local function fn21(arg)
tbl23.Hero = arg:Frame({Name="Hero",X=n16,Y=n16,Width=14,Height=n17,Background="#FFFFFF",Gradient=cs2,GradientRotation=0,Corner=0.35,StrokeColor="#FF6A40",StrokeThickness=n15,StrokeTransparency=0.55})
tbl23.Title = arg:Text({Parent=tbl23.Hero,X=n19,Y=0.45,Width=1,Height=1.6,Scale=1.45,Wrap=false,Text="<b>Zyro Hub</b>",Gradient=v18,GradientRotation=0,TextStrokeTransparency=1})
tbl23.Subtitle = arg:Text({Parent=tbl23.Hero,X=n19,Y=2.1,Width=1,Height=1,Wrap=false,Text="Official Discord Community",Color="#DCDCE8"})
tbl23.Members = arg:Text({Parent=tbl23.Hero,X=n19,Y=3.3,Width=1,Height=1.2,Wrap=false,Text=string.format("<font color=\"#6EE49C\">%s</font>  <b>%s</b>  <font color=\"#B8B8CC\">Members</font>", utf8.char(9679), "Members")})
tbl23.Invite = arg:Frame({Name="Invite",X=n16,Y=n20+n16,Width=14,Height=n21,Background="#000000",BackgroundTransparency=0.5,Corner=0.35,StrokeColor="#5865F2",StrokeThickness=n15,StrokeTransparency=0.35})
tbl23.Label = arg:Text({Parent=tbl23.Invite,X=n14+0.1,Y=0.35,Width=1,Height=0.9,Scale=0.78,Wrap=false,Text="<b>INVITE LINK</b>",Color="#9C9CB4"})
tbl23.Link = arg:Text({Parent=tbl23.Invite,X=n14+0.1,Y=1.35,Width=1,Height=1.6,Scale=1.05,Wrap=false,Font="code",Text=str})
tbl23.Copy = arg:Button({Parent=tbl23.Invite,X=14-n22-n14,Y=(n21-n23)/2,Width=n22,Height=n23,Text="<b>Copy Link</b>",Color="#FFFFFF",Scale=1,Background="#5865F2",BackgroundTransparency=0,HoverTransparency=0.15,PressTransparency=0.3,StrokeColor="#9AA3FF",StrokeThickness=n15,Corner=0.3,Callback=fn19})
tbl23.Header = arg:Text({X=n16+0.1,Y=n24-1.15+n16,Width=14,Height=1,Scale=0.8,Wrap=false,Text="<b>WHAT YOU GET</b>",Color="#9C9CB4"})
for i, v19 in ipairs(tbl21) do
local p ={Frame=arg:Frame({Name="Perk",X=n16,Y=n24+(i-1)*(n25+n26)+n16,Width=14,Height=n25,Background="#000000",BackgroundTransparency=0.68,Corner=0.35})}
p.Title = arg:Text({Parent=p.Frame,X=0.85,Y=0.3,Width=1,Height=1.1,Wrap=false,Text="<b>"..v19.Title.."</b>",Color=v19.Color})
p.Text = arg:Text({Parent=p.Frame,X=0.85,Y=1.35,Width=1,Height=1.5,Scale=0.86,Wrap=true,Text=v19.Text,Color="#C8C8D8"})
tbl23.Perks[i] = p
end
tbl23.Tip = arg:Text({X=n16+0.1,Y=n27-2.2-n16,Width=14,Height=2,Scale=0.8,Wrap=true,Text="Paste the copied link into your browser or the Discord app to join.",Color="#8A8AA2"})
arg:SetContentLines(n27)
arg:OnResize(function(a, w) fn20(w/math.max(a,1)) end)
end
if type(v15.CreateCanvas) == "function" then
local v19 = v15:CreateCanvas({Name="Discord", ShowTitle=false, Layout="free", Style={TextScale=0.84,LineHeight=1.1,MinLines=math.ceil(n27),MaxLines=math.ceil(n27),BackgroundTransparency=0.5,TextColor=Color3.fromRGB(255,255,255),TextStrokeTransparency=0.7}, Build=fn21})
fn4(function() v19:Destroy() end)
else
v15:CreateText({Name="Discord", Text="https://discord.gg/YjEa2NSbTX"})
end
if type(v15.CreateButton) == "function" then
v15:CreateButton({Name="Copy Discord Link", Callback=fn19})
end
end-- ============================================================
-- ZYRO HUB — EXTRA A/4: Mech Boss + Scramble Event
-- ============================================================
tbl4.MechBoot = function(arg)
local ok, result = pcall(function()
return require(ReplicatedStorage.Shared.Util.ScrambleBossHazards)
end)
local mech ={
Handle = nil,
Row = nil,
Status = "Idle",
Shown = nil,
Busy = false,
Generation = 0,
Hazards ={},
TravelSpeed = 250,
Radius = 18,
SwingGap = 0.12,
Dodge = true,
TryBall = true,
Leave = true,
HopWindow = 3,
OpenSeconds = 900,
ChainPath = "ZyroLibrary/SAE_BossHop.json",
ChainUntil = 0,
ChainCycle = nil,
ArmedCycle = nil,
HopStamp = 0,
ArrivedByHop = false,
HopDelay = 5,
HopConfirmed = false,
HopNote = nil,
HopAt = nil,
Hopping = false,
LoadedAt = os.clock(),
BaitSpeed = 225,
Interval = 1800,
Run = nil,
SwapTools = true,
SwapIndex = 1,
SwapSince = 0,
MainHold = 0.3,
SecondHold = 0.4,
LastSwing = 0,
Links ={},
}
tbl4.Mech = mech
local function fn9()
return tbl4.Toggle(mech.Handle, false) == true
end
local function fn10()
return workspace:FindFirstChild("ScrambleArena")
end
local function fn11()
return workspace:FindFirstChild("ScrambleArenaPortal")
end
local function fn12()
return localPlayer:GetAttribute("InScrambleArena") == true
end
local tbl21 ={Defeated = true, Final = true, Ended = true, Won = true}
local function bossAlive()
local v9 = fn11()
if not v9 then return false end
if mech.DonePortal == v9 then return false end
if workspace:GetAttribute("Event_ScrambleBoss") == false then return false end
local str2 = fn10()
if str2 then str2 = tostring(str2:GetAttribute("Phase") or "") end
if tbl21[str2 or ""] then
mech.DonePortal = v9
return false
end
return true
end
mech.BossAlive = bossAlive
mech.StealFirst = function()
local steal = tbl4.Steal
local movement = tbl4.Movement
if movement.PlaceWanted == true then return "Auto Place Egg goes first" end
if movement.MutationWanted == true then return "Scrambled Mutation goes first" end
local flag = tbl4.Toggle(v5, false) == true and steal ~= nil
local flag2
if flag then flag2 = steal.Wanted == true or steal.Carrying == true or steal.Active == true
else flag2 = flag end
if flag2 then return "Auto Steal goes first" end
return nil
end
pcall(function()
local scheduleIntervalSeconds = require(ReplicatedStorage.Shared.Flags.ScrambleBossFlags).ScheduleIntervalSeconds
local interval = type(scheduleIntervalSeconds) == "table" and tonumber(scheduleIntervalSeconds.Value) or nil
if interval and interval > 0 then mech.Interval = interval end
end)
mech.Clock = function(arg2)
local n5 = math.max(0, math.floor(arg2 + 0.5))
return string.format("%d:%02d", math.floor(n5 / 60), n5 % 60)
end
mech.Timer = function()
local serverTimeNow = workspace:GetServerTimeNow()
local scrambleArena = workspace:FindFirstChild("ScrambleArena")
scrambleArena = scrambleArena and tonumber(scrambleArena:GetAttribute("SpawnsAt")) or 0
if workspace:FindFirstChild("ScrambleArenaPortal") and not mech.BossAlive() then
local interval = mech.Interval
return "Boss beaten, portal closing  |  next Mech portal in ".. mech.Clock(math.ceil(serverTimeNow / interval) * interval - serverTimeNow)
end
if workspace:FindFirstChild("ScrambleArenaPortal") then
if scrambleArena > serverTimeNow then
return "Mech portal is open  |  boss spawns in ".. mech.Clock(scrambleArena - serverTimeNow)
end
return "Mech portal is open now"
end
local interval = mech.Interval
return "Next Mech portal in ".. mech.Clock(math.ceil(serverTimeNow / interval) * interval - serverTimeNow)
end
local function fn13(arg2)
if not arg2 then return nil end
local hitbox = arg2:FindFirstChild("Hitbox", true)
if hitbox and hitbox:IsA("BasePart") then return hitbox end
for _, descendant in ipairs(arg2:GetDescendants()) do
if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent:IsA("BasePart") then
return descendant.Parent
end
end
return nil
end
local function fn14(arg2)
local v9 = tbl4.Root()
if not v9 or not arg2 or type(firetouchinterest) ~= "function" then return end
pcall(function()
firetouchinterest(v9, arg2, 0)
task.wait(0.05)
firetouchinterest(v9, arg2, 1)
end)
end
local function fn15(arg2, arg3)
if not mech.Dodge or not ok or type(result) ~= "table" or type(result.Contains) ~= "function" then return false end
for k, hazard in pairs(mech.Hazards) do
local n5 = tonumber(hazard.At) or 0
local n6 = tonumber(hazard.Warn) or 0
if n5 + (tonumber(hazard.Duration) or 0.5) + 1.5 < arg3 then
mech.Hazards[k] = nil
continue
end
if arg3 >= n5 - n6 - 0.1 then
local ok2, result2 = pcall(result.Contains, hazard, arg2, arg3)
if ok2 and result2 then return true end
end
end
return false
end
local function fn16()
local character = localPlayer.Character
local backpack = localPlayer:FindFirstChildOfClass("Backpack")
for _, v9 in ipairs({character, backpack}) do
if v9 then
for _, child in ipairs(v9:GetChildren()) do
if child:IsA("Tool") and tostring(child:GetAttribute("ItemType")) == "Gear" then
if string.find(string.lower(tostring(child:GetAttribute("GearName") or "")), "scrambler", 1, true) then
return child
end
end
end
end
end
return nil
end
local function fn17()
local lastSwing = mech.LastSwing
if os.clock() - lastSwing < mech.SwingGap then return end
mech.LastSwing = os.clock()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
local flag = type(tbl4.FindBat) == "function" and tbl4.FindBat() or nil
local swapTools = mech.SwapTools and fn16() or nil
local v9
if flag and swapTools and flag ~= swapTools then
local secondHold = mech.SwapIndex == 2 and mech.SecondHold or mech.MainHold
local swapSince = mech.SwapSince
if secondHold <= os.clock() - swapSince then
mech.SwapIndex = mech.SwapIndex == 2 and 1 or 2
mech.SwapSince = os.clock()
end
swapTools = mech.SwapIndex == 2 and swapTools
v9 = swapTools or flag
else
v9 = flag or swapTools
end
if not v9 or not humanoid then return end
if v9.Parent ~= character then
pcall(function() humanoid:EquipTool(v9) end)
end
pcall(function() v9:Activate() end)
end
local function fn18(arg2, arg3)
local character = localPlayer.Character
local v9 = tbl4.Root()
if not character or not v9 then return end
if (v9.Position - arg2).Magnitude > 3 then
pcall(function()
character:PivotTo(CFrame.lookAt(arg2, Vector3.new(arg3.X, arg2.Y, arg3.Z)))
v9.AssemblyLinearVelocity = Vector3.zero
end)
end
end
local function fn19(arg2)
local mech2 = arg2:FindFirstChild("Mech")
local hitbox = mech2 and mech2:FindFirstChild("Hitbox")
if hitbox and hitbox:IsA("BasePart") then return hitbox.Position, mech2 end
for _, child in ipairs(arg2:GetChildren()) do
if child:IsA("Model") and child.Name ~= "Ball" and child.Name ~= "LeaveTeleport" and child.Name ~= "Structure" then
local hitbox2 = child:FindFirstChild("Hitbox")
if hitbox2 and hitbox2:IsA("BasePart") then return hitbox2.Position, child end
end
end
return nil, nil
end
local function fn20(arg2, arg3)
local ball = arg2:FindFirstChild("Ball")
if not ball then return false end
local position = ball:GetBoundingBox().Position
local n5 = (tonumber(arg2:GetAttribute("FloorY")) or position.Y) + 3
local n6 = tonumber(arg2:GetAttribute("CoreStage")) or 0
if arg2:GetAttribute("BallStunned") == true then
mech.Run = nil
local vector = Vector3.new(arg3.Position.X - position.X, 0, arg3.Position.Z - position.Z)
local unit = vector.Magnitude > 1 and vector.Unit or Vector3.new(1, 0, 0)
fn18(Vector3.new(position.X, n5, position.Z) + unit * 10, position)
fn17()
mech.Status = string.format("Smashing the core  |  stage %d / 3  |  core %s", n6, tostring(arg2:GetAttribute("CoreHealth") or "?"))
return true
end
local str2 = tostring(arg2:GetAttribute("BallTarget"))
local attribute = arg2:GetAttribute("BallCoil")
if not mech.Run and str2 == tostring(localPlayer.UserId) and type(attribute) == "string" and attribute ~= "" then
local coils = arg2:FindFirstChild("Coils")
coils = coils and coils:FindFirstChild(attribute)
coils = coils and coils:GetAttribute("Home")
if typeof(coils) == "Vector3" then
local vector = Vector3.new(coils.X - position.X, 0, coils.Z - position.Z)
if vector.Magnitude > 1 then
local n7 = vector.Unit * 40
mech.Run = {Goal = Vector3.new(coils.X, n5, coils.Z) + n7, Until = os.clock() + 8, Coil = attribute}
end
end
end
if mech.Run then
local vector = Vector3.new(mech.Run.Goal.X - arg3.Position.X, 0, mech.Run.Goal.Z - arg3.Position.Z)
local flag = vector.Magnitude < 4
local flag2
if flag then flag2 = flag else flag2 = os.clock() > mech.Run.Until end
if flag2 then
mech.Run = nil
pcall(function() arg3.AssemblyLinearVelocity = Vector3.new(0, arg3.AssemblyLinearVelocity.Y, 0) end)
else
local n7 = vector.Unit * mech.BaitSpeed
pcall(function() arg3.AssemblyLinearVelocity = Vector3.new(n7.X, arg3.AssemblyLinearVelocity.Y, n7.Z) end)
mech.Status = string.format("Baiting the ball into %s  |  stage %d / 3", mech.Run.Coil, n6)
end
return true
end
local vector = Vector3.new(arg3.Position.X - position.X, 0, arg3.Position.Z - position.Z)
if vector.Magnitude > 18 or vector.Magnitude < 6 then
local vector2 = vector.Magnitude < 1 and Vector3.new(1, 0, 0) or vector.Unit
fn18(Vector3.new(position.X, n5, position.Z) + vector2 * 12, position)
end
mech.Status = string.format("Ball phase, waiting for it to lock on  |  stage %d / 3", n6)
return true
end
local function fn21(arg2, arg3)
local scrambleHuman = arg2:FindFirstChild("ScrambleHuman")
if not scrambleHuman then return false end
local humanoidRootPart = scrambleHuman:FindFirstChild("HumanoidRootPart") or scrambleHuman.PrimaryPart or scrambleHuman:FindFirstChildWhichIsA("BasePart")
local position = humanoidRootPart and humanoidRootPart.Position or scrambleHuman:GetPivot().Position
humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity or Vector3.zero
local n5 = position + Vector3.new(humanoidRootPart.X, 0, humanoidRootPart.Z) * 0.15
local vector = Vector3.new(arg3.Position.X - n5.X, 0, arg3.Position.Z - n5.Z)
local vector2 = vector.Magnitude > 1 and vector.Unit * 5 or Vector3.zero
local n6 = Vector3.new(n5.X, arg3.Position.Y, n5.Z) + vector2
local character = localPlayer.Character
pcall(function()
character:PivotTo(CFrame.lookAt(n6, Vector3.new(position.X, n6.Y, position.Z)))
end)
fn17()
mech.Status = string.format("Chasing Dr Scramble  |  hits %s / %s", tostring(arg2:GetAttribute("HumanHits") or 0), tostring(arg2:GetAttribute("HumanNeeded") or 3))
return true
end
local function fn22()
local v9 = fn10()
local v10 = tbl4.Root()
local character = localPlayer.Character
character = character and character:FindFirstChildOfClass("Humanoid")
if not v9 or not v10 then return end
local str2 = tostring(v9:GetAttribute("Phase"))
local n5 = tonumber(v9:GetAttribute("Health")) or 0
local n6 = tonumber(v9:GetAttribute("MaxHealth")) or 0
if tostring(v9:GetAttribute("GrabVictim")) == tostring(localPlayer.UserId) and character then
character.Jump = true
fn17()
mech.Status = "Grabbed, breaking free"
return
end
if str2 == "Ball" and mech.TryBall and fn20(v9, v10) then return end
if str2 == "Human" and fn21(v9, v10) then return end
local v11, flag = fn19(v9)
if not v11 then
local n7 = (tonumber(v9:GetAttribute("SpawnsAt")) or 0) - workspace:GetServerTimeNow()
mech.Status = n7 > 0 and "In the arena  |  boss spawns in ".. mech.Clock(n7) or string.format("Phase %s, waiting for the boss", str2)
return
end
local serverTimeNow = workspace:GetServerTimeNow()
local n7 = (tonumber(v9:GetAttribute("FloorY")) or v11.Y) + 3
local v12 = nil
local v13 = nil
for i = 0, 15 do
local n8 = i / 16 * 3.1415926535897931 * 2
local radius = mech.Radius
local z = v11.Z
local radius2 = mech.Radius
local vector = Vector3.new(v11.X + math.cos(n8) * radius, n7, z + math.sin(n8) * radius2)
local magnitude = (vector - v10.Position).Magnitude
if fn15(vector, serverTimeNow) or fn15(vector, serverTimeNow + 0.4) then
magnitude += 10000
end
if not v12 or magnitude < v12 then
v12 = magnitude
v13 = vector
end
end
if v13 then fn18(v13, v11) end
fn17()
flag = flag and flag:GetAttribute("Overheated") == true
mech.Status = string.format("Fighting %s  |  boss %d / %d%s", str2, math.floor(n5 + 0.5), math.floor(n6 + 0.5), flag and "  |  OVERHEAT" or "")
end
local function fn23()
local v9 = fn10()
local v10 = fn13(v9 and v9:FindFirstChild("LeaveTeleport"))
if not v10 then return end
local character = localPlayer.Character
pcall(function()
character:PivotTo(CFrame.new(v10.Position + Vector3.new(0, 3, 0)))
end)
task.wait(0.2)
fn14(v10)
end
local function fn24(arg2)
local v9 = fn11()
local v10 = fn13(v9)
if not v9 or not v10 then return false end
local flag = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
if flag and tbl4.InsideBase() then
local flag2 = mech.Respawned == true
local n5 = flag + Vector3.new(0, 3, 0)
local travelSpeed = flag2 and math.min(mech.TravelSpeed, 300) or mech.TravelSpeed
local now = os.clock()
local exitTo = nil
while true do
if not(os.clock() - now < 20) then exitTo = 1; break else
if arg2 ~= mech.Generation or not fn9() or fn12() or mech.StealFirst() then exitTo = 2; break else
local v11 = tbl4.Root()
if v11 then
local n6 = n5 - v11.Position
if n6.Magnitude <= 4 then exitTo = 1; break else
mech.Status = flag2 and "Respawned, going out through the safe zone" or "Leaving the base through the safe zone"
local magnitude = n6.Magnitude
local n7 = math.min(travelSpeed * RunService.Heartbeat:Wait(), magnitude)
pcall(function()
local rotation = v11.CFrame.Rotation
v11.CFrame = CFrame.new(v11.Position + n6.Unit * n7) * rotation
v11.AssemblyLinearVelocity = Vector3.zero
end)
continue
end
end
end
break
end
end
if exitTo ~= 1 then
if exitTo == 2 then return false end
return false
end
if flag2 then
mech.Status = "Respawned, resting in the safe zone"
local n6 = 0
while n6 < 0.75 do
local v11 = tbl4.Root()
if v11 then pcall(function() v11.AssemblyLinearVelocity = Vector3.zero end) end
n6 += RunService.Heartbeat:Wait()
end
end
end
mech.Respawned = false
for i = 1, 5 do
if not(arg2 ~= mech.Generation or not fn9() or fn12() or mech.StealFirst()) then
local v11 = tbl4.Root()
if not(not v11 or not v10.Parent) then
mech.Status = "Teleporting to the Mech portal"
pcall(function()
v11.CFrame = v10.CFrame + Vector3.new(0, 1, 0)
v11.AssemblyLinearVelocity = Vector3.zero
v11.AssemblyAngularVelocity = Vector3.zero
end)
fn14(v10)
local n5 = os.clock() + 0.6
while os.clock() < n5 and not fn12() do RunService.Heartbeat:Wait() end
continue
end
end
break
end
if fn12() then return true end
local position = v10.Position
local now = os.clock()
local exitTo2 = nil
local v11
while true do
if os.clock() - now < 60 then
if arg2 ~= mech.Generation or not fn9() or fn12() or mech.StealFirst() then exitTo2 = 1; break else
v11 = tbl4.Root()
if not v11 then exitTo2 = 2; break else
local vector = Vector3.new(position.X - v11.Position.X, 0, position.Z - v11.Position.Z)
if not(vector.Magnitude <= 14) then
local n5 = vector.Unit * math.min(mech.TravelSpeed, vector.Magnitude / 0.05)
mech.Status = string.format("Going to the Mech portal, %d studs", math.floor(vector.Magnitude + 0.5))
pcall(function()
v11.AssemblyLinearVelocity = Vector3.new(n5.X, v11.AssemblyLinearVelocity.Y, n5.Z)
end)
RunService.Heartbeat:Wait()
continue
end
end
end
break
else exitTo2 = 1; break end
end
if exitTo2 ~= 1 then
if exitTo2 == 2 then return false end
pcall(function() v11.AssemblyLinearVelocity = Vector3.zero end)
fn14(v10)
task.wait(0.4)
if not fn12() then
pcall(function()
local rf = networking:FindFirstChild("RF/ScrambleBoss/EnterArena")
if rf then rf:InvokeServer() end
end)
end
end
local now2 = os.clock()
while not fn12() and os.clock() - now2 < 5 do task.wait(0.1) end
return fn12()
end
local function fn25()
mech.Busy = true
mech.Generation = mech.Generation + 1
local generation = mech.Generation
tbl4.Shield("mech", true)
pcall(function()
if tbl4.Treadmill and tbl4.Treadmill.Riding or type(tbl4.OnBelt) == "function" and tbl4.OnBelt() then
tbl4.ExitBelt()
end
end)
if not fn12() and not mech.StealFirst() then pcall(fn24, generation) end
while generation == mech.Generation and fn9() and fn12() and not mech.StealFirst() do
local v9 = fn10()
local str2 = v9 and tostring(v9:GetAttribute("Phase")) or ""
if str2 == "Defeated" or str2 == "Final" or str2 == "Ended" or str2 == "Won" then
mech.Status = "Dr Scramble defeated, going back home"
if not mech.DefeatedAt and type(mech.StartChain) == "function" then pcall(mech.StartChain) end
mech.DefeatedAt = mech.DefeatedAt or os.clock()
mech.DonePortal = fn11() or mech.DonePortal
local leave = mech.Leave
if leave then
local defeatedAt = mech.DefeatedAt
leave = os.clock() - defeatedAt > 1
end
if leave then pcall(fn23); task.wait(2) else task.wait(0.3) end
else
pcall(fn22)
RunService.Heartbeat:Wait()
end
end
if fn12() and mech.StealFirst() then
mech.Status = tostring(mech.StealFirst()).. ", leaving the arena"
pcall(fn23)
local n5 = 0
while fn12() and n5 < 5 do n5 += task.wait(0.2) end
end
mech.DefeatedAt = nil
mech.Run = nil
tbl4.Shield("mech", false)
tbl4.ReleaseMovement("mech")
mech.Busy = false
tbl3.Wake()
end
pcall(function()
local re = networking:FindFirstChild("RE/ScrambleBoss/Hazard")
if re and re:IsA("RemoteEvent") then
table.insert(mech.Links, re.OnClientEvent:Connect(function(arg2)
if type(arg2) == "table" then mech.Hazards[arg2.Id or #mech.Hazards + 1] = arg2 end
end))
end
end)
table.insert(mech.Links, localPlayer.CharacterAdded:Connect(function()
mech.Respawned = true
end))
mech.Row = arg:CreateText({Name = "Mech Status", Text = "Idle"})
mech.Handle = arg:CreateToggle({
Name = "Auto Mech Boss",
Default = false,
Callback = function()
if not fn9() then mech.Generation = mech.Generation + 1 end
tbl3.Wake()
end,
})
for _, v9 in ipairs({
{"Mech Tween Speed", 100, 1000, 250, 10, "studs/s", "TravelSpeed"},
{"Main Weapon Hold", 0, 1.5, 0.3, 0.01, "s", "MainHold"},
{"Scrambler Hold", 0, 1.5, 0.4, 0.01, "s", "SecondHold"},
}) do
arg:CreateSlider({
Name = v9[1], Min = v9[2], Max = v9[3], Default = v9[4], Increment = v9[5], Unit = v9[6], SubOf = mech.Handle,
Callback = function(arg2)
mech[v9[7]] = math.clamp(tonumber(arg2) or v9[4], v9[2], v9[3])
end,
})
end
for _, v9 in ipairs({
{"Swap Two Weapons", "SwapTools"},
{"Dodge Attacks", "Dodge"},
{"Ball And Core Phase", "TryBall"},
{"Leave After Fight", "Leave"},
}) do
arg:CreateToggle({
Name = v9[1], Default = true, SubOf = mech.Handle,
Callback = function(arg2) mech[v9[2]] = arg2 ~= false end,
})
end
mech.HopHandle = arg:CreateToggle({
Name = "Boss Server Hop",
Note = "After each boss, hops to a less crowded server to fight again",
Default = false,
SubOf = mech.Handle,
Callback = function()
mech.HopAt = nil
if not tbl4.Toggle(mech.HopHandle, false) then
mech.HopConfirmed = false
mech.HopNote = nil
pcall(tbl4.HopPrompt.Hide)
return
end
mech.ArmedCycle = math.floor(workspace:GetServerTimeNow() / mech.Interval)
if not tbl4.HopPrompt.Manual() then mech.HopConfirmed = true; return end
mech.ArrivedByHop = false
mech.HopConfirmed = false
if not pcall(tbl4.HopPrompt.Show,{
Title = "Boss Server Hop", Warn = "WARNING",
Body = "After you beat a Mech boss, Boss Server Hop keeps joining less crowded servers. It fights the boss wherever one is still up and hops again when there is none. Turn it off to stop hopping.",
Tip = "", Cancel = "Cancel", Accept = "Turn On",
}, function() mech.HopConfirmed = true; tbl3.Wake() end, function()
pcall(function() mech.HopHandle:Set(false) end)
end) then
mech.HopConfirmed = true
end
end,
})
mech.PortalCloses = function()
local interval = mech.Interval
return math.floor(workspace:GetServerTimeNow() / mech.Interval) * interval + mech.OpenSeconds
end
mech.SaveChain = function()
if type(writefile) ~= "function" then return end
pcall(function()
if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ZyroLibrary") then
makefolder("ZyroLibrary")
end
writefile(mech.ChainPath, game:GetService("HttpService"):JSONEncode({Until = mech.ChainUntil, Cycle = mech.ChainCycle, HopAt = mech.HopStamp}))
end)
end
mech.StartChain = function()
if not tbl4.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then return end
local serverTimeNow = workspace:GetServerTimeNow()
local chainCycle = math.floor(serverTimeNow / mech.Interval)
local flag = mech.ChainUntil > serverTimeNow
local arrivedByHop
if flag then arrivedByHop = flag else arrivedByHop = mech.ChainCycle == chainCycle and mech.ArrivedByHop end
if arrivedByHop then return end
mech.ChainCycle = chainCycle
mech.ChainUntil = math.min(serverTimeNow + mech.HopWindow * 60, mech.PortalCloses())
mech.SaveChain()
end
pcall(function()
if type(isfile) == "function" and isfile(mech.ChainPath) then
local data = game:GetService("HttpService"):JSONDecode(readfile(mech.ChainPath))
if type(data) == "table" then
mech.ChainUntil = tonumber(data.Until) or 0
mech.ChainCycle = tonumber(data.Cycle)
mech.HopStamp = tonumber(data.HopAt) or 0
mech.ArrivedByHop = workspace:GetServerTimeNow() - mech.HopStamp < 120
end
end
end)
arg:CreateSlider({
Name = "Keep Hopping For",
Note = "Keeps fighting every boss it finds and hopping for this long",
Min = 1, Max = 15, Default = 3, Increment = 1, Unit = "min", SubOf = mech.Handle,
Callback = function(arg2) mech.HopWindow = math.clamp(math.floor(tonumber(arg2) or 3), 1, 15) end,
})
tbl3.Add(function()
if not fn9() or not tbl4.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
mech.HopAt = nil
mech.HopNote = nil
return false
end
if mech.Hopping then return false end
local serverTimeNow = workspace:GetServerTimeNow()
if mech.ChainUntil > 0 and serverTimeNow >= mech.ChainUntil then
mech.ChainUntil = 0
mech.SaveChain()
end
if mech.ChainUntil <= serverTimeNow then
local n5 = math.floor(serverTimeNow / mech.Interval)
local n6 = serverTimeNow - n5 * mech.Interval
local flag = (mech.ArmedCycle == n5 or mech.ChainCycle ~= n5) and n6 >= 20 and n6 < mech.OpenSeconds
if flag then
local loadedAt = mech.LoadedAt
flag = os.clock() - loadedAt >= 8
end
if flag and not mech.Busy and not fn12() and not bossAlive() then pcall(mech.StartChain) end
if mech.ArmedCycle ~= n5 then mech.ArmedCycle = nil end
end
if mech.ChainUntil <= serverTimeNow then
local interval = mech.Interval
local n5 = serverTimeNow - math.floor(serverTimeNow / mech.Interval) * interval
mech.HopAt = nil
if mech.OpenSeconds <= n5 then
mech.HopNote = "Boss hop waits for the next portal"
elseif mech.ArrivedByHop and mech.ChainCycle == math.floor(serverTimeNow / mech.Interval) then
mech.HopNote = "Boss hop is done for this portal"
elseif mech.Busy or fn12() or bossAlive() then
mech.HopNote = "Boss hop starts after this boss"
else
mech.HopNote = "Looking for the boss here"
end
return false
end
local n5 = mech.ChainUntil - serverTimeNow
if mech.Busy or fn12() or bossAlive() then
mech.HopAt = nil
mech.HopNote = "Boss hop on, ".. mech.Clock(n5).. " left"
return false
end
local loadedAt = mech.LoadedAt
if os.clock() - loadedAt < 8 then
mech.HopAt = nil
mech.HopNote = "Looking for the boss here"
return false
end
local steal = tbl4.Steal
local flag = tbl4.Toggle(v5, false) == true and steal
if flag then flag = steal.Wanted == true or steal.Carrying == true or steal.Active == true end
if flag then
mech.HopAt = nil
mech.HopNote = "A filtered egg is here, stealing before the hop"
return false
end
local v9 = mech
local hopAt = mech.HopAt
if not hopAt then
local hopDelay = mech.HopDelay
hopAt = os.clock() + hopDelay
end
v9.HopAt = hopAt
local hopAt2 = mech.HopAt
if os.clock() < hopAt2 then
mech.HopNote = string.format("No boss here, hopping in %ds  |  %s left", math.ceil(mech.HopAt - os.clock()), mech.Clock(n5))
return false
end
if type(tbl4.ServerHop) ~= "function" then
mech.HopNote = "Server hop is not ready"
return false
end
mech.Hopping = true
mech.HopNote = "Joining a less crowded server"
mech.HopStamp = workspace:GetServerTimeNow()
mech.SaveChain()
task.spawn(function()
local ok2, result2 = pcall(tbl4.ServerHop, "Least Players")
ok2 = ok2 and tostring(result2) or "error"
mech.Hopping = false
if ok2 == "waiting" then
mech.HopAt = os.clock() + 15
mech.HopNote = "Teleporting to the next server"
elseif ok2 == "fetch" then
mech.HopAt = os.clock() + 10
mech.HopNote = "Server list unavailable, trying again soon"
else
mech.HopAt = os.clock() + 3
mech.HopNote = "Hop did not land, trying again"
end
end)
return false
end)
local function fn26()
local row = mech.Row
if not fn9() then
mech.Status = "Off  |  ".. mech.Timer()
elseif not mech.Busy then
if fn12() then mech.Status = "In the arena" else mech.Status = mech.Timer() end
if mech.HopNote then mech.Status = mech.Status.. "  |  ".. mech.HopNote end
end
if row and mech.Shown ~= mech.Status and type(row.Set) == "function" then
mech.Shown = mech.Status
pcall(row.Set, row, mech.Status)
end
end
mech.StatusLive = true
task.spawn(function()
while mech.StatusLive do
pcall(fn26)
task.wait(0.5)
end
end)
tbl3.Add(function()
pcall(fn26)
local invisibilityHandle = tbl4.InvisibilityHandle
local flag = invisibilityHandle ~= nil and tbl4.Toggle(invisibilityHandle, false)
if fn9() and (mech.Busy or fn12() or bossAlive()) then
mech.InvisResumeAt = nil
if not tbl4.InvisMech then
tbl4.InvisMech = true
if flag then tbl4.Notify("Invisibility", "Invisibility is paused for the Mech boss and comes back after it.") end
end
elseif tbl4.InvisMech and not mech.Busy then
mech.InvisResumeAt = mech.InvisResumeAt or os.clock() + 5
local invisResumeAt = mech.InvisResumeAt
if os.clock() >= invisResumeAt then
mech.InvisResumeAt = nil
tbl4.InvisMech = false
if flag then tbl4.Notify("Invisibility", "The Mech boss is over, Invisibility is back on.") end
end
end
if not fn9() or mech.Busy then return true end
if fn12() or bossAlive() then
local v9 = mech.StealFirst()
if v9 then
mech.Status = v9.. "  |  ".. mech.Timer()
return true
end
local character = localPlayer.Character
if character and character:GetAttribute("InvisApplied") == true then
mech.Status = "Leaving Invisibility for the boss"
return true
end
if not tbl4.ClaimMovement("mech") then
mech.Status = "Waiting for ".. tostring(tbl4.Movement.Owner or "movement")
return true
end
task.spawn(fn25)
return true
end
return true
end)
fn4(function()
mech.StatusLive = false
tbl4.InvisMech = false
mech.Generation = mech.Generation + 1
for _, link in ipairs(mech.Links) do
pcall(function() link:Disconnect() end)
end
pcall(tbl4.Shield, "mech", false)
pcall(tbl4.ReleaseMovement, "mech")
end)
end
tbl4.MechBoot(v7)-- ============================================================
-- ZYRO HUB — EXTRA B/4: Scramble Event
-- ============================================================
local n5, n6, n7, tbl21, tbl22, tbl23, tbl24, tbl25, tbl26, snapshot, n8, flag, n9
local n10, str2, str3, tbl27, n11, flag2, tbl28, tbl29, flag3, n12
local v9, fn9, fn10, fn11, fn12, fn13, fn14, fn15, fn16, fn17
local fn18, fn19, fn20, fn21, fn22
do
local vector = Vector3.new(2120, -120, -355)
tbl21 = {"LostPart1", "LostPart2"}
tbl22 = {
{Label = "Scrambled Mutation", Id = "MutationConsumable"},
{Label = "2x Cash Booster", Id = "CashBooster"},
{Label = "1.25x Speed", Id = "SpeedBoost"},
{Label = "2x Treadmill Booster", Id = "TreadmillBooster"},
}
tbl23 = {}
for _, v10 in ipairs(tbl22) do
tbl23[#tbl23 + 1] = v10.Label
end
tbl24 = {}
tbl25 = {}
tbl26 = {Keep = 0, Handle = nil, Picked = {["Scrambled Mutation"] = true}}
snapshot = nil
n8 = -math.huge
flag = false
n9 = 0
n10 = 0
str2 = ""
str3 = ""
tbl27 = {Tool = nil, EquipAt = 0}
n11 = 16
flag2 = false
tbl28 = {Index = 1, Since = 0, Tool = nil}
tbl29 = {Latch = false, Ended = false}
flag3 = false
n12 = 0
v9 = nil
local function fn23()
local packages = ReplicatedStorage:FindFirstChild("Packages")
packages = packages and packages:FindFirstChild("Networking")
packages = packages and packages:FindFirstChild("RF/Scramble/Request")
if packages and packages:IsA("RemoteFunction") then return packages end
return nil
end
fn9 = function(arg, ...)
local v10 = fn23()
if not v10 then return nil end
local v11 = table.pack(...)
local ok, result = pcall(function()
return v10:InvokeServer(arg, table.unpack(v11, 1, v11.n))
end)
if not ok or type(result) ~= "table" then return nil end
if type(result.Snapshot) == "table" then
snapshot = result.Snapshot
n8 = os.clock()
elseif arg == "Snapshot" and type(result.State) == "table" then
snapshot = result
n8 = os.clock()
end
return result
end
fn10 = function(arg)
if arg or snapshot == nil or os.clock() - n8 >= n5 then fn9("Snapshot") end
return snapshot
end
fn11 = function()
local v10 = snapshot
return type(v10) == "table" and type(v10.State) == "table" and v10.State or nil
end
fn12 = function()
local v10 = snapshot
if type(v10) ~= "table" or v10.Enabled == false or type(v10.State) ~= "table" then return false end
local num = tonumber(v10.EventEndsAt)
return num == nil or workspace:GetServerTimeNow() < num
end
fn13 = function()
local v10 = snapshot
local window = type(v10) == "table" and v10.Window or nil
if type(window) ~= "table" then return false, nil end
local serverTimeNow = workspace:GetServerTimeNow()
local num = tonumber(window.StartsAt)
local num2 = tonumber(window.EndsAt)
if window.Active == true or num and num2 and serverTimeNow >= num and serverTimeNow < num2 then
return true, num2 and math.max(0, num2 - serverTimeNow) or nil
end
local num3 = tonumber(window.NextAt)
return false, num3 and math.max(0, num3 - serverTimeNow) or nil
end
fn14 = function(arg, arg2)
local lostParts = type(arg) == "table" and arg.LostParts or nil
if type(lostParts) ~= "table" then return false end
if lostParts[arg2] then return true end
for _, lp in pairs(lostParts) do
if lp == arg2 then return true end
end
return false
end
fn15 = function(arg)
local n13 = 0
for _, v10 in ipairs(tbl21) do
if fn14(arg, v10) then n13 += 1 end
end
return n13
end
local function fn24(arg)
local n13 = math.max(0, math.floor(tonumber(arg) or 0))
if n13 >= 3600 then return string.format("%dh %dm", n13 // 3600, n13 % 3600 // 60) end
return string.format("%dm %ds", n13 // 60, n13 % 60)
end
fn16 = function()
local v10 = fn11()
if not v10 then return "Dr Scramble event is not running" end
if not fn12() then return "Dr Scramble event has ended" end
local v11, v12 = fn13()
local str4
if v11 then str4 = "Outbreak live ".. fn24(v12 or 0)
else str4 = v11 end
str4 = str4 or v12 and "Outbreak in ".. fn24(v12) or "Outbreak soon"
local str5 = v10.Completed == true and "Vault claimed"
if not str5 then str5 = string.format("Lost %d/2  Drone %d/3", fn15(v10), math.min(3, tonumber(v10.DroneParts) or 0)) end
if v11 then
local n13 = 0
for _, v13 in pairs(tbl24) do
if (tonumber(v13.Health) or 0) > 0 then n13 += 1 end
end
str4..= string.format("  %d drones", n13)
end
local str6 = string.format("Samples %d  -  %s  -  %s", tonumber(v10.Samples) or 0, str5, str4)
if str3 ~= "" then str6..= "  -  ".. str3 end
if str2 ~= "" then str6..= "  -  ".. str2 end
return str6
end
fn17 = function() return tbl4.Root() end
fn18 = function(arg, arg2, arg3, arg4)
local n13 = arg4 or 400
local v10 = fn17()
if not v10 then return false end
arg3 = arg3 or 1
if (v10.Position - arg).Magnitude <= arg3 then return true end
tbl4.Shield("scramble", true)
local n14 = os.clock() + 6
while not tbl4.Swapped() and os.clock() < n14 and not arg2() do
str2 = "Waiting for the character to settle"
RunService.Heartbeat:Wait()
end
local v11 = fn17() or v10
local character = localPlayer.Character
tbl4.Driving = tbl4.Driving + 1
local position = v11.Position
local flag4 = nil
local n15 = (arg - position).Magnitude / n13 + 3
local n16 = 0
local connection = RunService.Heartbeat:Connect(function(deltaTime)
if flag4 ~= nil or tbl4.AntiGuard.Busy then return end
n16 += deltaTime
local v12 = fn17()
if not v12 or arg2() or n16 > n15 or localPlayer.Character ~= character then
flag4 = false
return
end
if (v12.Position - position).Magnitude > 8 then position = v12.Position end
local n17 = arg - position
local n18 = n13 * deltaTime
local flag5 = n17.Magnitude <= math.max(n18, arg3)
position = flag5 and arg or position + n17.Unit * n18
local vector2 = Vector3.new(n17.X, 0, n17.Z)
local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or v12.CFrame.Rotation
pcall(function()
v12.CFrame = CFrame.new(position) * cframe
v12.AssemblyLinearVelocity = Vector3.zero
v12.AssemblyAngularVelocity = Vector3.zero
end)
if flag5 then flag4 = true end
end)
while flag4 == nil do RunService.Heartbeat:Wait() end
connection:Disconnect()
tbl4.Driving = math.max(0, tbl4.Driving - 1)
tbl4.Shield("scramble", false)
return flag4
end
fn19 = function(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("ProximityPrompt") then return false end
local ok = pcall(function()
arg:InputHoldBegin()
local n13 = tonumber(type(tbl4.PromptHold) == "function" and tbl4.PromptHold(arg) or arg.HoldDuration) or 0
if n13 > 0 then task.wait(n13 + 0.2) end
arg:InputHoldEnd()
end)
if not ok and type(fireproximityprompt) == "function" then
ok = pcall(fireproximityprompt, arg)
end
return ok
end
local function fn25()
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("SecretZones")
return world and world:FindFirstChild("Cave") or nil
end
fn20 = function(arg)
local teleporter = fn25()
teleporter = teleporter and teleporter:FindFirstChild("Teleporter")
teleporter = teleporter and teleporter:FindFirstChild(arg)
teleporter = teleporter and teleporter:FindFirstChild("SecretZonePrompt", true)
return teleporter and teleporter:IsA("ProximityPrompt") and teleporter or nil
end
fn21 = function(arg, arg2)
arg = arg and arg.Parent
if arg and arg:IsA("Attachment") then return arg.WorldPosition end
if arg and arg:IsA("BasePart") then return arg.Position end
return arg2
end
fn22 = function()
local v10 = fn17()
if not v10 then return false end
local position = v10.Position
local vector2 = Vector3.new(position.X - vector.X, 0, position.Z - vector.Z)
return position.Y < -60 and vector2.Magnitude < 160
end
end
local fn23
local function fn24()
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Areas")
world = world and world:FindFirstChild("SeparationLine")
return world and world:IsA("BasePart") and world.Position.X or 552
end
fn23 = function(arg)
if not arg then
arg = fn17()
arg = arg and arg.Position
end
return arg ~= nil and arg.X < fn24()
end
local connection = localPlayer.CharacterAdded:Connect(function()
tbl4.ScrambleRespawned = true
tbl27.Tool = nil
tbl27.EquipAt = 0
end)
fn4(function()
pcall(function() connection:Disconnect() end)
end)
local fn25
fn25 = function(arg, arg2)
if not fn23() then
tbl4.ScrambleRespawned = false
return true
end
if arg2 and fn23(arg2) then return true end
local function fn26()
str2 = "Respawned, resting in the safe zone"
local n13 = os.clock() + 0.75
while os.clock() < n13 do
if arg() then return false end
task.wait(0.1)
end
tbl4.ScrambleRespawned = false
return true
end
local flag4 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
if not flag4 then
tbl4.ScrambleRespawned = false
return true
end
local flag5 = tbl4.ScrambleRespawned == true
if tbl4.DistanceTo(flag4) <= 12 then
if flag5 then return(fn26()) end
return true
end
str2 = flag5 and "Respawned, easing out through the safe zone" or "Leaving the base through the safe zone"
local v10 = fn18
local v11 = v10(flag4 + Vector3.new(0, 3, 0), arg, 3, flag5 and math.min(400, 300) or nil)
if v11 and flag5 then return(fn26()) end
return v11
end
local fn26, fn27
do
local function fn28(arg, arg2, arg3)
local v10 = fn17()
if not v10 then return false end
tbl4.Shield("scramblefly", true)
local position = v10.Position
local flag4 = true
if Vector3.new(arg.X - position.X, 0, arg.Z - position.Z).Magnitude > 250 then
local n13 = math.max(position.Y, arg.Y, 98)
flag4 = fn18(Vector3.new(position.X, n13, position.Z), arg2, 2) and fn18(Vector3.new(arg.X, n13, arg.Z), arg2, 2)
end
flag4 = flag4 and fn18(arg, arg2, math.min(arg3, 2))
tbl4.Shield("scramblefly", false)
return flag4
end
local function fn29()
local flag4 = type(tbl4.StealHome) == "function" and tbl4.StealHome() or nil
return flag4 and flag4 + Vector3.new(0, 3, 0) or nil
end
fn26 = function(arg, arg2, arg3)
local n13 = arg3 or 6
if tbl4.DistanceTo(arg) <= n13 then return true end
local v10 = fn23()
local v11 = fn23(arg)
if v10 and not v11 then
if not fn25(arg2, arg) then return false end
elseif v11 and not v10 then
local v12 = fn29()
if v12 and (v12 - arg).Magnitude > 12 and tbl4.DistanceTo(v12) > 12 then
str2 = "Coming back through the safe zone"
if not fn28(v12, arg2, 3) then return false end
end
end
return fn28(arg, arg2, n13)
end
fn27 = function(arg)
if fn23() or arg() or tbl4.IsNight() or tbl4.WallSealed() then return end
local v10 = fn29()
if v10 then
str2 = "Coming back through the safe zone"
fn26(v10, arg, 4)
end
end
end
local fn28, fn29, fn30
do
local function fn31(arg)
if fn22() then return true end
local Entry = fn20("Entry")
local v10 = fn21(Entry, Vector3.new(2125.7, 73.1, -295.4))
str2 = "Flying to the Secret Cave"
if not fn26(v10, arg, 6) then return false end
for i = 1, 4 do
if arg() then return false end
str2 = "Entering the Secret Cave"
fn19(Entry or fn20("Entry"))
local n13 = os.clock() + 1.5
while os.clock() < n13 and not fn22() do RunService.Heartbeat:Wait() end
if fn22() then return true end
end
str2 = "Cave door missed, flying in"
local quest = type(snapshot) == "table" and snapshot.Quest or nil
local position = type(quest) == "table" and type(quest.EscapedExperiment) == "table" and quest.EscapedExperiment.Position or nil
if typeof(position) == "Vector3" then
pcall(tbl4.FlyTo, position, arg, "scramble")
end
return fn22()
end
local function fn32(arg)
local quest = type(snapshot) == "table" and snapshot.Quest or nil
local flag4 = type(quest) == "table" and quest[arg] or nil
local position = type(flag4) == "table" and flag4.Position or nil
if typeof(position) == "Vector3" then return position end
local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(arg)
if drScrambleEvent and drScrambleEvent:IsA("Model") then
return drScrambleEvent:GetPivot().Position
end
return nil
end
local function fn33(arg)
local v10 = snapshot
local interactions = type(v10) == "table" and v10.Interactions or nil
return math.max(4, (type(interactions) == "table" and tonumber(interactions[arg]) or 12) - 4)
end
fn28 = function(arg)
local v10 = fn11()
if not v10 or v10.Discovered == true then return true end
local EscapedExperiment = fn32("EscapedExperiment")
if not EscapedExperiment or not fn31(arg) then return false end
str2 = "Talking to the Escaped Experiment"
if not fn18(EscapedExperiment, arg, fn33("NpcRadius")) then return false end
local Discover = fn9("Discover")
fn10(true)
return Discover ~= nil and fn11() ~= nil and fn11().Discovered == true
end
fn29 = function(arg)
local v10 = fn11()
local flag4 = not v10 or v10.Completed == true
local flag5
if flag4 then flag5 = flag4 else
local n13 = #tbl21
flag5 = fn15(v10) >= n13
end
if flag5 then return end
if v10.Discovered ~= true and not fn28(arg) then return end
for _, v11 in ipairs(tbl21) do
if arg() then return end
if not fn14(fn11(), v11) then
local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(v11)
drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild("Hitbox", true)
local claimLostPart = drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
local position = drScrambleEvent and drScrambleEvent:IsA("BasePart") and drScrambleEvent.Position or fn32(v11)
if position then
str2 = "Flying to "..(v11 == "LostPart1" and "Lost Part 1" or "Lost Part 2")
if fn26(position + Vector3.new(0, 2, 0), arg, 3) then
str2 = "Collecting the lost part"
local n13 = position + Vector3.new(0, 2.5, 0)
local character = localPlayer.Character
tbl4.Shield("scramble", true)
tbl4.Driving = tbl4.Driving + 1
local connection2 = RunService.Heartbeat:Connect(function()
local v12 = tbl4.Root()
if not v12 or v12.Parent ~= character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then return end
pcall(function()
local rotation = v12.CFrame.Rotation
v12.CFrame = CFrame.new(n13) * rotation
v12.AssemblyLinearVelocity = Vector3.zero
v12.AssemblyAngularVelocity = Vector3.zero
end)
end)
for i = 1, 4 do
if not arg() then
claimLostPart = claimLostPart or drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
fn19(claimLostPart)
task.wait(0.6)
fn10(true)
if not fn14(fn11(), v11) then continue end
end
break
end
connection2:Disconnect()
tbl4.Driving = math.max(0, tbl4.Driving - 1)
tbl4.Shield("scramble", false)
if arg() then return end
continue
end
end
end
end
end
fn30 = function(arg)
local v10 = fn11()
if not v10 or v10.Completed == true then return end
local num = tonumber(v10.TotalParts)
local n13
if num then n13 = num else n13 = fn15(v10) + (tonumber(v10.DroneParts) or 0) end
if n13 < 5 then return end
local ExperimentVault = fn32("ExperimentVault")
if not ExperimentVault or not fn31(arg) then return end
str2 = "Opening the Experiment Vault"
if not fn18(ExperimentVault, arg, fn33("VaultRadius")) then return end
fn9("Vault")
fn10(true)
local v11 = fn11()
if v11 and v11.Completed == true then
str2 = "Vault opened, The Scrambler unlocked"
end
end
end
local fn31
fn31 = function()
local function fn32(arg)
if not arg or not arg:IsA("Tool") then return false end
if tostring(arg:GetAttribute("ItemType")) ~= "MutationConsumable" then return false end
local attribute = arg:GetAttribute("MutationId") or arg:GetAttribute("MutationTemplate")
if attribute ~= nil then return tostring(attribute) == "Scrambled" end
return string.find(string.lower(arg.Name), "scrambled", 1, true) ~= nil
end
local character = localPlayer.Character
if character then
for _, child in ipairs(character:GetChildren()) do
if fn32(child) then return child, true end
end
end
local backpack = localPlayer:FindFirstChildOfClass("Backpack")
if backpack then
for _, child in ipairs(backpack:GetChildren()) do
if fn32(child) then return child, false end
end
end
return nil, false
end
local fn32
fn32 = function(arg, arg2)
local shopPurchases = type(arg) == "table" and arg.ShopPurchases or nil
local flag4 = type(shopPurchases) == "table" and shopPurchases[arg2.Id] or nil
if type(flag4) ~= "table" then return 0 end
local shopPeriod = type(snapshot) == "table" and snapshot.ShopPeriod or nil
if flag4.Period ~= nil and shopPeriod ~= nil and flag4.Period ~= shopPeriod then return 0 end
return tonumber(flag4.Count) or 0
end
local fn33
fn33 = function(arg)
local v10 = fn10(true)
if type(v10) ~= "table" or type(v10.Shop) ~= "table" then return end
for _, v11 in ipairs(tbl22) do
if arg() then return end
if tbl26.Picked[v11.Label] == true then
for i = 1, 10 do
local v12 = snapshot
local v13 = fn11()
local v14 = ipairs
local shop = type(v12) == "table" and v12.Shop or {}
local v15 = nil
for _, v16 in v14(shop) do
if type(v16) == "table" and v16.Id == v11.Id then v15 = v16 end
end
if not(not v15 or not v13 or arg()) then
local num = tonumber(v15.PurchaseLimit)
if not(num and fn32(v13, v15) >= num) then
if not((tonumber(v13.Samples) or 0) - (tonumber(v15.Price) or math.huge) < tbl26.Keep) then
local Shop = fn9("Shop", v15.Id, {Quote = v15.Quote, Sequence = tonumber(v13.ShopSequence) or 0})
if not(type(Shop) ~= "table" or Shop.Ok ~= true) then
str2 = "Bought ".. v11.Label
task.wait(0.4)
continue
end
end
end
end
break
end
end
end
end
local n13, n14, n15, tbl30, tbl31, v10, n16, n17, n18, n19
local fn34, fn35, v11, fn36, fn37, fn38, fn39
do
local n20 = 98
n13 = 12
n14 = 20
n15 = 3
tbl30 = {
Vector3.new(2000, 90, -360),
Vector3.new(2700, 90, -370),
Vector3.new(3400, 90, -365),
Vector3.new(4100, 90, -360),
Vector3.new(4800, 90, -370),
Vector3.new(5500, 90, -360),
Vector3.new(5900, 90, -365),
}
tbl31 = {}
local tbl32 = {Link = nil, Goal = nil, Look = nil, Character = nil}
local userId = localPlayer.UserId
local tbl33 = {}
for _, v12 in ipairs({
{Label = "Scrap Drone", Tier = "ScrapDrone"},
{Label = "Reactor Drone", Tier = "ReactorDrone"},
{Label = "Augmented Drone", Tier = "AugmentedDrone"},
}) do
tbl33[#tbl33 + 1] = v12.Label
end
local tbl34 = {ScrapDrone = true, ReactorDrone = true, AugmentedDrone = true}
local v12 = ({"Nearest", "Rare First", "Most HP First"})[1]
v10 = ({"Tween", "Teleport"})[1]
n16 = 110
n17 = 1.5
n18 = 0
n19 = -math.huge
local function fn40(arg)
local num = type(arg) == "table" and tonumber(arg.OwnerUserId) or nil
return num == nil or num == userId
end
local function fn41(arg)
if typeof(arg) == "CFrame" then return arg.Position end
if typeof(arg) == "Vector3" then return arg end
return nil
end
local function fn42(arg, arg2)
local v13 = networking:FindFirstChild(arg)
if not v13 or not v13:IsA("RemoteEvent") then return end
local connection2 = v13.OnClientEvent:Connect(function(...)
pcall(arg2, ...)
end)
fn4(function() pcall(function() connection2:Disconnect() end) end)
end
fn42("RE/Scramble/Drones", function(arg)
if type(arg) ~= "table" then return end
local v13 = pairs
local upserts = type(arg.Upserts) == "table" and arg.Upserts or {}
for _, upsert in v13(upserts) do
if type(upsert) == "table" and upsert.Id ~= nil and fn40(upsert) then
local id = tostring(upsert.Id)
local attributes = type(upsert.Attributes) == "table" and upsert.Attributes or {}
local tbl35 = tbl24[id] or {}
tbl35.Id = id
tbl35.Position = fn41(upsert.CFrame) or tbl35.Position
tbl35.Health = tonumber(upsert.Health) or tbl35.Health or 1
tbl35.Tier = tostring(attributes.ScrambleTier or tbl35.Tier or "")
tbl35.Area = tostring(attributes.ScrambleArea or tbl35.Area or "")
tbl35.Seen = os.clock()
tbl24[id] = tbl35
end
end
local v14 = pairs
local removed = type(arg.Removed) == "table" and arg.Removed or {}
for k, v15 in v14(removed) do
tbl24[tostring(type(v15) == "string" and v15 or k)] = nil
end
end)
fn42("RE/Scramble/Effect", function(arg, arg2, arg3)
if arg ~= "Hit" or type(arg3) ~= "table" or arg3.DroneId == nil then return end
local v13 = tbl24[tostring(arg3.DroneId)]
if not v13 then return end
v13.Position = fn41(arg2) or v13.Position
v13.Health = (tonumber(v13.Health) or 1) - (tonumber(arg3.Amount) or 1)
if type(arg3.Motion) == "string" and string.find(arg3.Motion, "\"Death\"", 1, true) then
v13.Health = 0
end
if v13.Health <= 0 then tbl24[v13.Id] = nil end
end)
fn42("RE/Scramble/Drops", function(arg)
local v13 = pairs
arg = type(arg) == "table" and arg or {}
for _, v14 in v13(arg) do
if type(v14) == "table" and v14.Id ~= nil and fn40(v14) then
local v15 = fn41(v14.Position) or fn41(v14.Origin)
if v15 then
tbl25[tostring(v14.Id)] = {Position = v15, Radius = tonumber(v14.Radius) or 6, ExpiresAt = tonumber(v14.ExpiresAt), Kind = v14.Kind}
end
end
end
end)
fn42("RE/Scramble/State", function(arg)
if type(arg) ~= "table" then return end
if arg.Patch == true and type(snapshot) == "table" then
for k, v13 in pairs(arg) do
if k ~= "Patch" then snapshot[k] = v13 end
end
elseif type(arg.State) == "table" then
snapshot = arg
end
n8 = os.clock()
end)
fn42("RE/Scramble/RemoveDrops", function(arg)
local v13 = pairs
arg = type(arg) == "table" and arg or {}
for k, v14 in v13(arg) do
tbl25[tostring(type(v14) == "string" and v14 or k)] = nil
end
end)
local function fn43(arg)
local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
return scrambleLocalVisuals and scrambleLocalVisuals:FindFirstChild("PersonalDrone_".. arg) or nil
end
local v13 = nil
local n21 = 0
local function fn44()
if v13 and next(v13) ~= nil then return v13 end
v13 = nil
if os.clock() < n21 or type(getgc) ~= "function" or not fn13() then return nil end
n21 = os.clock() + 15
for _, v14 in ipairs(getgc(false)) do
if type(v14) == "function" and islclosure(v14) then
local ok, result = pcall(debug.info, v14, "s")
if ok and type(result) == "string" and string.find(result, "PersonalDrones", 1, true) then
local ok2, result2 = pcall(debug.getupvalues, v14)
if ok2 and type(result2) == "table" then
for _, v15 in pairs(result2) do
if type(v15) == "table" then
local key, v16 = next(v15)
if type(v16) == "table" and v16.OwnerUserId ~= nil and v16.CFrame ~= nil then
v13 = v15
return v15
end
end
end
continue
end
end
end
end
return nil
end
local function fn45()
local v14 = fn44()
if not v14 then return end
for k, v15 in pairs(v14) do
if type(v15) == "table" and fn40(v15) then
local str4 = tostring(v15.Id or k)
local attributes = type(v15.Attributes) == "table" and v15.Attributes or {}
local tbl35 = tbl24[str4]
local health = tonumber(v15.Health)
if not tbl35 then
tbl35 = {Id = str4}
health = health or 1
tbl35.Health = health
tbl24[str4] = tbl35
elseif health then
tbl35.Health = math.min(health, tonumber(tbl35.Health) or health)
end
tbl35.Position = fn41(v15.CFrame) or tbl35.Position
tbl35.Tier = tostring(attributes.ScrambleTier or tbl35.Tier or "")
tbl35.Area = tostring(attributes.ScrambleArea or tbl35.Area or "")
if attributes.DroneState == "Death" then tbl35.Health = 0 end
end
end
for k in pairs(tbl24) do
if v14[k] == nil then tbl24[k] = nil end
end
end
fn34 = function()
pcall(fn45)
local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
if not scrambleLocalVisuals then return end
for _, child in ipairs(scrambleLocalVisuals:GetChildren()) do
local attribute = child:GetAttribute("ScrambleDroneId")
if child:IsA("Model") and attribute ~= nil and string.sub(child.Name, 1, 14) == "PersonalDrone_" then
local str4 = tostring(attribute)
if child:GetAttribute("DroneState") == "Death" then
tbl24[str4] = nil
elseif not tbl24[str4] then
local ok, result = pcall(child.GetPivot, child)
tbl24[str4] = {
Id = str4,
Position = ok and result.Position or nil,
Health = tonumber(child:GetAttribute("Health")) or 1,
Tier = tostring(child:GetAttribute("ScrambleTier") or ""),
Area = tostring(child:GetAttribute("ScrambleArea") or ""),
Seen = os.clock(),
}
end
end
end
end
local function fn46(arg)
local v14 = fn43(arg.Id)
local hitbox = v14 and v14:FindFirstChild("Hitbox")
if hitbox and hitbox:IsA("BasePart") then return hitbox.Position end
if v14 and v14.PrimaryPart then return v14.PrimaryPart.Position end
return arg.Position
end
local function fn47()
local tbl35 = {}
local now = os.clock()
for k, v14 in pairs(tbl24) do
local flag4 = v14.Tier == nil or v14.Tier == "" or tbl34[v14.Tier] == true
if flag4 then flag4 = (tonumber(v14.Health) or 0) > 0 end
flag4 = flag4 and v14.Position
local flag5
if flag4 then flag5 = (tbl31[k] or 0) <= now else flag5 = flag4 end
if flag5 then tbl35[#tbl35 + 1] = v14 end
end
return tbl35
end
local function fn48()
local v14 = fn17()
if not v14 then return nil end
local huge = math.huge
local v15 = nil
for _, v16 in ipairs(fn47()) do
local magnitude = ((fn46(v16) or v16.Position) - v14.Position).Magnitude
local v17 = v12
local n22
if v17 == "Rare First" then
if v16.Tier == "AugmentedDrone" then n22 = magnitude - 200000
elseif v16.Tier == "ReactorDrone" then n22 = magnitude - 100000
else n22 = magnitude end
elseif v17 ~= "Most HP First" then n22 = magnitude
else n22 = magnitude - (tonumber(v16.Health) or 0) * 100000 end
if n22 < huge then
huge = n22
v15 = v16
end
end
return v15
end
local function fn49()
local v14 = fn17()
if not v14 then return nil, nil end
local serverTimeNow = workspace:GetServerTimeNow()
local huge = math.huge
local v15 = nil
local v16 = nil
for k, v17 in pairs(tbl25) do
if v17.ExpiresAt and v17.ExpiresAt < serverTimeNow then
tbl25[k] = nil
else
local magnitude = (v17.Position - v14.Position).Magnitude
if v17.Kind == "Part" then magnitude -= 100000 end
if magnitude < huge then
huge = magnitude
v15 = k
v16 = v17
end
end
end
return v15, v16
end
fn35 = function()
if not tbl32.Link then
if tbl32.SwapWait then
tbl32.SwapWait = nil
tbl4.Shield("scramble", false)
end
return
end
tbl32.Link:Disconnect()
local v14 = tbl32
local v15 = tbl32
local v16 = tbl32
tbl32.Link = nil
v14.Goal = nil
v15.Look = nil
v16.Character = nil
local v17 = tbl32
local v18 = tbl32
local v19 = tbl32
local v20 = tbl32
tbl32.Track = nil
v17.Dir = nil
v18.Last = nil
v19.LastAt = nil
v20.Vel = nil
tbl4.Driving = math.max(0, tbl4.Driving - 1)
tbl4.Shield("scramble", false)
end
fn4(fn35)
local function fn50(goal, look, track)
if track ~= tbl32.Track then
local v14 = tbl32
local v15 = tbl32
tbl32.Last = nil
v14.LastAt = nil
v15.Vel = nil
end
local v14 = tbl32
local v15 = tbl32
tbl32.Goal = goal
v14.Look = look
v15.Track = track
local character = localPlayer.Character
if tbl32.Link and tbl32.Character ~= character then
fn35()
local v16 = tbl32
local v17 = tbl32
tbl32.Goal = goal
v16.Look = look
v17.Track = track
end
if tbl32.Link or not character then return end
if not tbl4.Swapped() then
tbl4.Shield("scramble", true)
tbl32.SwapWait = tbl32.SwapWait or os.clock() + 6
local swapWait = tbl32.SwapWait
if os.clock() < swapWait then
str2 = "Waiting for the character to settle"
return
end
end
if tbl32.SwapWait then tbl32.SwapWait = nil
else tbl4.Shield("scramble", true) end
tbl32.Character = character
tbl4.Driving = tbl4.Driving + 1
tbl32.Link = RunService.Heartbeat:Connect(function(deltaTime)
local v16 = tbl4.Root()
local goal2 = tbl32.Goal
if not v16 or not goal2 or v16.Parent ~= tbl32.Character or tbl4.AntiGuard.Busy or tbl4.Movement.Owner ~= "scramble" then return end
local position = v16.Position
if tbl32.Track then
local ok, last = pcall(tbl32.Track)
if ok and typeof(last) == "Vector3" then
local now = os.clock()
if not tbl32.Last or not tbl32.LastAt then
local v17 = tbl32
tbl32.Last = last
v17.LastAt = now
elseif (last - tbl32.Last).Magnitude > 0.01 then
local n22 = math.max(now - tbl32.LastAt, 0.0041666666666666666)
local n23 = (last - tbl32.Last) / n22
if n23.Magnitude < 400 then
local n24 = math.clamp(n22 * 12, 0.2, 0.8)
tbl32.Vel = tbl32.Vel and tbl32.Vel:Lerp(n23, n24) or n23
end
local v17 = tbl32
tbl32.Last = last
v17.LastAt = now
elseif now - tbl32.LastAt > 0.25 and tbl32.Vel then
tbl32.Vel = tbl32.Vel:Lerp(Vector3.zero, math.clamp(deltaTime * 6, 0, 1))
end
local vel = tbl32.Vel or Vector3.zero
local look2 = tbl32.Last + vel * (math.clamp(now - tbl32.LastAt, 0, 0.25) + 0.1)
local vector = Vector3.new(position.X - look2.X, 0, position.Z - look2.Z)
if vector.Magnitude > 0.5 then
local unit = vector.Unit
local n22 = math.clamp(deltaTime * 5, 0, 1)
local dir = tbl32.Dir and tbl32.Dir:Lerp(unit, n22) or unit
tbl32.Dir = dir.Magnitude > 0.01 and dir.Unit or unit
end
goal2 = look2 + (tbl32.Dir or Vector3.new(0, 0, 1)) * n11 + Vector3.new(0, -1, 0)
local v17 = tbl32
tbl32.Goal = goal2
v17.Look = look2
if (goal2 - position).Magnitude <= 40 then
local n22 = math.max(deltaTime, 0.0041666666666666666)
local n23 = vel + (goal2 - position) / math.max(0.1, n22)
local n24 = math.max(400, vel.Magnitude + 80)
if n24 < n23.Magnitude then n23 = n23.Unit * n24 end
local assemblyLinearVelocity = n23 + Vector3.new(0, workspace.Gravity * n22 * 0.5, 0)
local vector2 = Vector3.new(look2.X - position.X, 0, look2.Z - position.Z)
pcall(function()
if vector2.Magnitude > 0.05 then v16.CFrame = CFrame.lookAt(position, position + vector2.Unit) end
v16.AssemblyLinearVelocity = assemblyLinearVelocity
v16.AssemblyAngularVelocity = Vector3.zero
end)
return
end
end
end
local vector
if not(Vector3.new(goal2.X - position.X, 0, goal2.Z - position.Z).Magnitude > 250) then
vector = goal2
else
local n22 = math.max(n20, goal2.Y)
vector = position.Y < n22 - 2 and Vector3.new(position.X, n22, position.Z) or Vector3.new(goal2.X, n22, goal2.Z)
end
local n22 = vector - position
local n23 = n7 * deltaTime
local n24 = n22.Magnitude <= n23 and vector or position + n22.Unit * n23
local look2 = tbl32.Look or goal2
local vector2 = Vector3.new(look2.X - n24.X, 0, look2.Z - n24.Z)
local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or v16.CFrame.Rotation
pcall(function()
v16.CFrame = CFrame.new(n24) * cframe
v16.AssemblyLinearVelocity = Vector3.zero
v16.AssemblyAngularVelocity = Vector3.zero
end)
end)
end
local function fn51(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then return false end
local attribute = arg:GetAttribute("GearName")
local gears = tbl.Gears
local directory = type(gears) == "table" and gears.Directory or nil
local flag4 = type(attribute) == "string" and type(directory) == "table" and directory[attribute] or nil
return type(flag4) == "table" and (flag4.ToolController == "Slap" or flag4.SlapPower ~= nil)
end
local function fn52(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then return false end
if tostring(arg:GetAttribute("ItemType")) ~= "Gear" then return false end
local str4 = tostring(arg:GetAttribute("GearName") or "")
if str4 == "" then return false end
return string.find(string.lower(str4), "scrambler", 1, true) ~= nil
end
local function fn53()
return localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack")
end
local function fn54()
local v14 = tbl4.FindBat()
if v14 then return v14 end
local v15, v16 = fn53()
for _, v17 in ipairs({v15, v16}) do
if v17 then
for _, child in ipairs(v17:GetChildren()) do
if fn51(child) or fn52(child) then return child end
end
end
end
return nil
end
tbl27.Valid = function(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then return false end
return tbl4.IsBatTool(arg) or fn51(arg) or fn52(arg)
end
tbl27.Owned = function(arg)
if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then return false end
local v14, v15 = fn53()
local parent = arg.Parent
return parent ~= nil and (parent == v14 or parent == v15)
end
tbl27.Name = function(arg)
if fn52(arg) then return "The Scrambler" end
return tostring(arg:GetAttribute("GearName") or arg.Name)
end
tbl27.Put = function(arg, arg2, parent)
local equipAt = tbl27.EquipAt
if os.clock() - equipAt < 0.4 then return false end
tbl27.EquipAt = os.clock()
pcall(function() arg2:EquipTool(arg) end)
if arg.Parent ~= parent then
pcall(function() arg.Parent = parent end)
end
return arg.Parent == parent
end
local function fn55()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
if not character or not humanoid or humanoid.Health <= 0 then return nil, false end
local tool = character:FindFirstChildWhichIsA("Tool")
if tool ~= nil and tbl27.Valid(tool) then
tbl27.Tool = tool
str3 = tbl27.Name(tool)
return tool, true
end
if not tbl27.Owned(tbl27.Tool) then tbl27.Tool = fn54() end
local tool2 = tbl27.Tool
if not tool2 then
str3 = ""
return nil, false
end
str3 = tbl27.Name(tool2)
tbl27.Put(tool2, humanoid, character)
return tool2, tool2.Parent == character
end
local function fn56()
local v14, v15 = fn55()
if v14 and v15 then
if flag2 then
pcall(function() v14:Activate() end)
task.defer(function() pcall(function() v14:Deactivate() end) end)
else
pcall(function() v14:Deactivate(); v14:Activate() end)
end
end
return v14 ~= nil
end
local function fn57()
local v14, v15 = fn53()
local v16 = nil
local v17 = nil
local v18 = nil
for _, v19 in ipairs({v14, v15}) do
if v19 then
for _, child in ipairs(v19:GetChildren()) do
if tbl27.Valid(child) then
if fn52(child) then v16 = v16 or child
else
local v20 = tbl4.IsBatTool(child)
local flag4
if v20 then flag4 = v17 == nil or not tbl4.IsBatTool(v17) else flag4 = v20 end
if flag4 then
if v18 then v17 = child
else v18 = v17; v17 = child end
elseif v17 == nil then v17 = child
elseif v18 == nil then v18 = child end
end
end
end
end
end
return v17, v16 or v18
end
local function fn58(arg)
pcall(function() arg:Activate() end)
task.defer(function() pcall(function() arg:Deactivate() end) end)
end
tbl28.SpamUntil = 0
tbl28.List = {}
tbl28.Dirty = true
tbl28.BuiltAt = 0
tbl28.NextBag = 0
tbl28.Links = {}
tbl28.Click = function(arg)
pcall(arg.Deactivate, arg)
pcall(arg.Activate, arg)
end
tbl28.Rebuild = function()
tbl28.Dirty = false
tbl28.BuiltAt = os.clock()
table.clear(tbl28.List)
local v14, v15 = fn53()
for _, v16 in ipairs({v14, v15}) do
if v16 then
for _, child in ipairs(v16:GetChildren()) do
if tbl27.Valid(child) then tbl28.List[#tbl28.List + 1] = child end
end
end
end
end
tbl28.Beat = RunService.Heartbeat:Connect(function()
local now = os.clock()
if tbl28.SpamUntil <= now then return end
if tbl28.Dirty or now - tbl28.BuiltAt > 1 then tbl28.Rebuild() end
local character = localPlayer.Character
local flag4 = now >= tbl28.NextBag
if flag4 then tbl28.NextBag = now + 0.25 end
for _, v14 in ipairs(tbl28.List) do
local parent = v14.Parent
if parent == character then tbl28.Click(v14)
elseif flag4 and parent ~= nil then tbl28.Click(v14) end
end
end)
tbl28.Unwatch = function()
for i = #tbl28.Links, 1, -1 do
pcall(function() tbl28.Links[i]:Disconnect() end)
tbl28.Links[i] = nil
end
end
tbl28.Watch = function(arg)
tbl28.Unwatch()
tbl28.Dirty = true
if not arg then return end
tbl28.Links[#tbl28.Links + 1] = arg.ChildAdded:Connect(function(child)
if not child:IsA("Tool") then return end
tbl28.Dirty = true
local spamUntil = tbl28.SpamUntil
if os.clock() < spamUntil and tbl27.Valid(child) then
tbl28.Click(child)
task.defer(tbl28.Click, child)
end
end)
tbl28.Links[#tbl28.Links + 1] = arg.ChildRemoved:Connect(function(child)
if child:IsA("Tool") then tbl28.Dirty = true end
end)
task.defer(function()
local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)
if backpack and localPlayer.Character == arg then
tbl28.Links[#tbl28.Links + 1] = backpack.ChildAdded:Connect(function() tbl28.Dirty = true end)
tbl28.Links[#tbl28.Links + 1] = backpack.ChildRemoved:Connect(function() tbl28.Dirty = true end)
end
end)
end
tbl28.Watch(localPlayer.Character)
tbl28.CharLink = localPlayer.CharacterAdded:Connect(tbl28.Watch)
fn4(function()
tbl28.SpamUntil = 0
tbl28.Unwatch()
for _, v14 in ipairs({"Beat", "CharLink"}) do
if tbl28[v14] then
pcall(function() tbl28[v14]:Disconnect() end)
tbl28[v14] = nil
end
end
end)
local function fn59()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
if not character or not humanoid or humanoid.Health <= 0 then return false end
local v14, v15 = fn57()
if not v14 or not v15 then return fn56() end
local tbl35 = {v14, v15}
local tbl36 = {0.3, 0.4}
local v16 = tbl35[tbl28.Index]
if tbl28.Tool ~= v16 then
local v17 = tbl28
local v18 = tbl28
local now = os.clock()
v17.Tool = v16
v18.Since = now
end
local flag4 = v16.Parent == character
if flag4 then
local since = tbl28.Since
flag4 = os.clock() - since >= tbl36[tbl28.Index]
end
if flag4 then
tbl28.Index = tbl28.Index == 1 and 2 or 1
v16 = tbl35[tbl28.Index]
local v17 = tbl28
local v18 = tbl28
local now = os.clock()
v17.Tool = v16
v18.Since = now
end
tbl27.Tool = v16
str3 = tbl27.Name(v16)
if v16.Parent ~= character then
pcall(function() humanoid:EquipTool(v16) end)
if v16.Parent ~= character then pcall(function() v16.Parent = character end) end
tbl28.Since = os.clock()
if v16.Parent == character then
fn58(v16)
task.defer(fn58, v16)
end
return true
end
fn58(v16)
return true
end
local function fn60(arg, arg2, arg3)
local now = os.clock()
local n22 = now + n15
while os.clock() < n22 and not arg() do
local v14, v15 = fn49()
local flag4 = not v15
if not flag4 then
if arg2 then flag4 = (v15.Position - arg2).Magnitude > (arg3 or 40)
else flag4 = arg2 end
end
if flag4 then
if arg2 and os.clock() - now < 1.2 then
task.wait(0.1)
continue
end
return
end
if fn23() and not fn23(v15.Position) then
fn35()
str2 = "Leaving the base through the safe zone"
if not fn26(v15.Position + Vector3.new(0, 2.5, 0), arg, 6) then return end
continue
end
str2 = v15.Kind == "Part" and "Picking up a Drone Part" or "Picking up Samples"
fn50(v15.Position + Vector3.new(0, 2.5, 0), v15.Position)
local n23 = os.clock() + 2.5
while tbl25[v14] and os.clock() < n23 and not arg() do task.wait(0.1) end
tbl25[v14] = nil
n22 = os.clock() + 1.2
end
end
local function fn61(arg, arg2)
local now = os.clock()
local n22 = tonumber(arg.Health) or 0
local now2 = nil
local now3 = nil
local fn62 = nil
local flag4 = false
while not arg2() do
local v14 = tbl24[arg.Id]
local flag5 = not v14
local flag6
if flag5 then flag6 = flag5 else flag6 = (tonumber(v14.Health) or 0) <= 0 end
if flag6 then return true end
local v15 = fn43(arg.Id)
if v15 and v15:GetAttribute("DroneState") == "Death" then
tbl24[arg.Id] = nil
return true
end
local v16 = fn17()
local flag7 = v16 ~= nil and v14.Position ~= nil
if flag7 then flag7 = (v16.Position - (fn46(v14) or v14.Position)).Magnitude <= 30 end
if flag7 and not v15 then
now2 = now2 or os.clock()
if os.clock() - now2 > 1.5 then
tbl24[arg.Id] = nil
return false
end
else now2 = nil end
local n23 = tonumber(v14.Health) or 0
if n23 ~= n22 then
now3 = nil
n22 = n23
end
if n14 < os.clock() - now then
tbl31[arg.Id] = os.clock() + 30
return false
end
local position = fn46(v14) or v14.Position
local v17 = fn17()
if not v17 then return false end
if fn23() and not fn23(position) then
fn35()
str2 = "Leaving the base through the safe zone"
if not fn26(position, arg2, 12) then return false end
if arg2() then return false end
end
if not fn62 then
local v18 = nil
local isBasePart = nil
fn62 = function()
local v19 = tbl24[arg.Id]
if not v19 then return nil end
if not v18 or not v18.Parent then
v18 = fn43(arg.Id)
local hitbox = v18 and v18:FindFirstChild("Hitbox")
isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or v18 and v18.PrimaryPart or nil
end
if isBasePart and isBasePart.Parent then return isBasePart.Position end
return v19.Position
end
end
if flag2 then fn50(position + Vector3.new(0, -1, 16), position, fn62)
else fn50(position + Vector3.new(0, -1, 5), position) end
if (v17.Position - position).Magnitude <= 60 and not flag2 then fn55() end
local magnitude = (v17.Position - position).Magnitude
local flag8 = false
if flag2 then flag8 = math.max(12, n11 + 7) end
local flag9 = magnitude <= (flag8 or 12)
if flag9 then
if flag2 then tbl28.SpamUntil = os.clock() + 0.2 end
now3 = now3 or os.clock()
if os.clock() - now3 > 8 then
tbl31[arg.Id] = os.clock() + 30
return false
end
local flag10 = false
if flag2 then flag10 = fn59() end
if flag10 or not flag2 and fn56() then
str2 = string.format("Smashing %s  %d HP", v14.Tier ~= "" and v14.Tier or "drone", math.max(0, tonumber(v14.Health) or 0))
elseif not flag4 then
str2 = "No bat found, get any bat to smash drones"
flag4 = true
end
else str2 = "Flying to a drone" end
local wait = task.wait
local flag10 = false
if not flag2 then flag9 = flag10 end
wait(flag9 and 0.03 or 0.1)
end
return false
end
local function fn62(arg)
for _, v14 in ipairs(tbl30) do
if arg() then return false end
str2 = "Looking for drones"
fn50(v14)
local n22 = os.clock() + 12
while os.clock() < n22 and not arg() do
fn34()
if #fn47() > 0 then return true end
if tbl4.DistanceTo(v14) < 8 then break end
task.wait(0.2)
end
end
return #fn47() > 0
end
local function fn63()
local serverTimeNow = workspace:GetServerTimeNow()
local v14, v15 = fn13()
if v14 and v15 and v15 < 25 then return next(tbl25) ~= nil end
for _, v16 in pairs(tbl25) do
if v16.Kind == "Part" or v16.ExpiresAt and v16.ExpiresAt - serverTimeNow < 30 then
return true
end
end
return false
end
local v14 = nil
local function fn64()
local window = type(snapshot) == "table" and snapshot.Window or nil
return type(window) == "table" and window.Index or nil
end
local function fn65(arg)
local flag4 = v14 ~= nil and v14 == fn64()
while not arg() do
RunService.Heartbeat:Wait()
if not arg() then
fn34()
if fn63() then fn60(arg) end
local v15, flag5, flag6, flag7, position, flag8, magnitude, flag9, v16, flag10, flag11, flag12, vector, flag13, n22, v17, n23, flag14, v18, flag15
if fn23() then
fn35()
if fn25(arg) then
v15 = fn48()
flag5 = not v15 and next(tbl25) ~= nil
if flag5 then
fn60(arg)
fn34()
v15 = fn48()
end
if not v15 then
flag6 = not fn13() or flag4
if not flag6 then
v14 = fn64()
flag7 = true
flag4 = true
if not fn62(arg) then break else continue end
end
else
position = fn46(v15) or v15.Position
flag8 = fn17()
magnitude = flag8 and (flag8.Position - position).Magnitude or 0
flag9 = v10 == "Teleport"
flag8 = flag9 and flag8
if flag8 then
v16 = fn23()
flag10 = v16 and not fn23(position)
flag8 = not flag10
end
if flag8 then
flag11 = magnitude > n13 and magnitude <= n16
flag12 = flag11 and os.clock() >= n18 and os.clock() - n19 >= n17
if flag12 then
n19 = os.clock()
vector = Vector3.new
flag13 = false
if flag2 then flag13 = 16 end
flag13 = flag13 or 5
n22 = position + vector(0, -1, flag13)
fn50(n22, position)
v17 = fn17()
if v17 then
str2 = "Teleporting to the next drone"
pcall(function()
v17.CFrame = CFrame.lookAt(n22, Vector3.new(position.X, n22.Y, position.Z))
v17.AssemblyLinearVelocity = Vector3.zero
v17.AssemblyAngularVelocity = Vector3.zero
end)
n23 = os.clock() + 0.8
while true do
flag14 = os.clock() < n23 and not arg()
if flag14 then
v18 = fn17()
flag15 = v18 and (v18.Position - n22).Magnitude > 40
if flag15 then
n18 = os.clock() + 30
str2 = "Teleport pulled back, tweening"
break
else
RunService.Heartbeat:Wait()
continue
end
end
break
end
end
end
end
fn61(v15, arg)
continue
end
end
else
v15 = fn48()
flag5 = not v15 and next(tbl25) ~= nil
if flag5 then
fn60(arg)
fn34()
v15 = fn48()
end
if not v15 then
flag6 = not fn13() or flag4
if not flag6 then
v14 = fn64()
flag7 = true
flag4 = true
if not fn62(arg) then break else continue end
end
else
position = fn46(v15) or v15.Position
flag8 = fn17()
magnitude = flag8 and (flag8.Position - position).Magnitude or 0
flag9 = v10 == "Teleport"
flag8 = flag9 and flag8
if flag8 then
v16 = fn23()
flag10 = v16 and not fn23(position)
flag8 = not flag10
end
if flag8 then
flag11 = magnitude > n13 and magnitude <= n16
flag12 = flag11 and os.clock() >= n18 and os.clock() - n19 >= n17
if flag12 then
n19 = os.clock()
vector = Vector3.new
flag13 = false
if flag2 then flag13 = 16 end
flag13 = flag13 or 5
n22 = position + vector(0, -1, flag13)
fn50(n22, position)
v17 = fn17()
if v17 then
str2 = "Teleporting to the next drone"
pcall(function()
v17.CFrame = CFrame.lookAt(n22, Vector3.new(position.X, n22.Y, position.Z))
v17.AssemblyLinearVelocity = Vector3.zero
v17.AssemblyAngularVelocity = Vector3.zero
end)
n23 = os.clock() + 0.8
while true do
flag14 = os.clock() < n23 and not arg()
if flag14 then
v18 = fn17()
flag15 = v18 and (v18.Position - n22).Magnitude > 40
if flag15 then
n18 = os.clock() + 30
str2 = "Teleport pulled back, tweening"
break
else
RunService.Heartbeat:Wait()
continue
end
end
break
end
end
end
end
fn61(v15, arg)
continue
end
end
end
break
end
fn60(arg)
fn35()
end
local tbl35 = {LostPart1 = "Mechanical Gear", LostPart2 = "Wiring Harness"}
tbl4.ScrambleLostPart = function(arg)
return fn14(fn11(), arg)
end
v11 = nil
fn36 = function()
local v15 = fn11()
if not v15 then return "Lost Parts: no event data" end
local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
local tbl36 = {}
local n22 = 0
local n23 = 0
for _, v16 in ipairs(tbl21) do
local v17 = drScrambleEvent and drScrambleEvent:FindFirstChild(v16)
if v17 then n22 += 1 end
if fn14(v15, v16) then n23 += 1
elseif v17 then
local ok, result = pcall(v17.GetPivot, v17)
local v18 = ok and tbl4.DistanceTo(result.Position) or nil
tbl36[#tbl36 + 1] = v18 and string.format("%s %d studs", tbl35[v16], math.floor(v18)) or tbl35[v16]
else tbl36[#tbl36 + 1] = tbl35[v16].. " not on map" end
end
local str4 = string.format("Lost Parts on map %d/2  -  Collected %d/2", n22, n23)
local str5
if #tbl36 > 0 then str5 = str4.. "  -  ".. table.concat(tbl36, "  -  ")
else str5 = str4 end
return str5
end
local function fn66(arg)
if not fn22() then return true end
local Exit = fn20("Exit")
local v15 = fn21(Exit, nil)
if not v15 then return false end
str2 = "Leaving the Secret Cave"
if not fn18(v15, arg, 4) then return false end
for i = 1, 4 do
if arg() then return false end
fn19(Exit or fn20("Exit"))
local n22 = os.clock() + 1.5
while os.clock() < n22 and fn22() do RunService.Heartbeat:Wait() end
if not fn22() then return true end
end
return not fn22()
end
local function fn67()
return tbl4.IsNight() or tbl4.WallSealed()
end
local function fn68(arg)
if not fn67() then return true end
fn35()
while fn67() and not arg() do
str2 = tbl4.IsNight() and "Night, waiting for the wall to drop" or "Waiting for the wall to drop"
RunService.Heartbeat:Wait()
end
return not arg()
end
fn37 = function()
if not tbl4.Toggle(v9, false) or not fn12() then return false end
if tbl29.Ended then return false end
if fn13() then return true end
fn34()
return #fn47() > 0 or next(tbl25) ~= nil
end
fn38 = function()
local v15 = fn11()
if not v15 or v15.Completed == true or not fn12() then return false end
local num = tonumber(v15.TotalParts)
if not num then num = fn15(v15) + (tonumber(v15.DroneParts) or 0) end
local flag4 = tbl4.Toggle(v9, false)
if flag4 then
local n22 = #tbl21
flag4 = fn15(v15) < n22
end
local flag5 = tbl4.Toggle(v9, false) and (num >= 5 or v15.Discovered ~= true)
return flag4 or flag5
end
fn39 = function(arg)
local function fn69()
return arg ~= n9 or tbl4.Movement.Owner ~= "scramble"
end
local function fn70()
return fn69() or not fn37() or fn67()
end
while true do
if fn37() and not fn69() then
if fn68(fn69) then
pcall(fn65, fn70)
if fn67() then continue end
end
end
break
end
fn35()
if fn69() or fn37() then return end
if not fn38() then
fn27(fn69)
str2 = ""
return
end
if not fn68(fn69) then return end
fn10(true)
local v15 = fn11()
if not v15 then return end
if not fn38() then
str2 = ""
return
end
if tbl4.Toggle(v9, false) and v15.Discovered ~= true then pcall(fn28, fn69) end
if tbl4.Toggle(v9, false) then
pcall(fn29, function() return fn69() or not tbl4.Toggle(v9, false) or fn37() or fn67() end)
end
if tbl4.Toggle(v9, false) then
pcall(fn30, function() return fn69() or not tbl4.Toggle(v9, false) or fn37() or fn67() end)
end
if fn22() and not fn69() then pcall(fn66, fn69) end
if not fn22() and not fn37() then pcall(fn27, fn69) end
end
end
local fn40
fn40 = function(arg)
if not(tbl4.Treadmill.Riding or tbl4.OnBelt()) then return true end
for i = 1, 3 do
if arg() then return false end
str2 = "Jumping off the treadmill"
tbl4.Treadmill.Riding = false
task.spawn(tbl4.LeaveBelt)
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
pcall(function()
humanoid.Sit = false
humanoid.Jump = true
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
local v12 = fn17()
if v12 then
local position = v12.Position
local n20 = position + Vector3.new(0, 18, 0)
local now = os.clock()
while true do
RunService.Heartbeat:Wait()
local v13 = fn17()
if not v13 then break else
local n21 = math.min(1, (os.clock() - now) / 0.25)
pcall(function()
local rotation = v13.CFrame.Rotation
v13.CFrame = CFrame.new(position:Lerp(n20, n21)) * rotation
v13.AssemblyLinearVelocity = Vector3.zero
v13.AssemblyAngularVelocity = Vector3.zero
end)
if not(n21 >= 1) then continue end
break
end
end
end
if not(tbl4.Treadmill.Riding or tbl4.OnBelt()) then return true end
end
return not tbl4.OnBelt()
end
tbl26.Handle = v7:CreateToggle({
Name = "Auto Buy Scramble Shop",
Note = "Buy the picked items with Samples",
Default = false,
Callback = function()
n12 = 0
tbl3.Wake()
end,
})
fn6(v7:CreateMultiDropdown({
Name = "Scramble Shop Items",
Options = tbl23,
Default = {"Scrambled Mutation"},
SubOf = tbl26.Handle,
Callback = function(arg)
local picked = {}
if type(arg) == "table" then
for k, v12 in pairs(arg) do
if v12 == true and type(k) == "string" then picked[k] = true
elseif type(v12) == "string" then picked[v12] = true end
end
end
tbl26.Picked = picked
end,
}))
v7:CreateSlider({
Name = "Keep Samples",
Note = "Never spend below this many Samples",
Min = 0, Max = 10000, Default = 0, Increment = 25, Unit = "",
SubOf = tbl26.Handle,
Callback = function(arg) tbl26.Keep = math.max(0, tonumber(arg) or 0) end,
})
end-- ============================================================
-- ZYRO HUB — EXTRA C/4: Player + AntiGuard UI + Misc
-- ============================================================
local v12, v13
do
local v14 = v2:CreateTab({Name = "Player", SectionsExpanded = true})
tbl4.EspSection = v14:CreateSection({Name = "ESP", Expanded = false})
local v15 = v14:CreateSection({Name = "Movement", Expanded = true})
v12 = v14:CreateSection({Name = "Character", Expanded = true})
v13 = v14:CreateSection({Name = "Combat", Expanded = true})
local createToggle = nil
local n20 = 350
local connection2 = nil
local flag4 = false
local function fn41()
local character = localPlayer.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
character = character and character:FindFirstChildOfClass("Humanoid")
if humanoidRootPart and character and character.Health > 0 then
return humanoidRootPart, character
end
return nil, nil
end
local function fn42()
if not flag4 then return end
flag4 = false
local v16, v17 = fn41()
if not v16 then return end
local alv = v16.AssemblyLinearVelocity
local md = v17.MoveDirection
local vector = Vector3.new(md.X, 0, md.Z)
local vector2 = vector.Magnitude > 0.001 and vector.Unit * v17.WalkSpeed or Vector3.zero
pcall(function()
v16.AssemblyLinearVelocity = Vector3.new(vector2.X, alv.Y, vector2.Z)
end)
end
local function fn43()
if connection2 then connection2:Disconnect(); connection2 = nil end
fn42()
tbl4.Shield("speed", false)
end
local function fn44()
if connection2 then return end
tbl4.Shield("speed", true)
connection2 = RunService.Heartbeat:Connect(function()
if tbl4.Steal.Active or tbl4.Flying or tbl4.Driving > 0 or tbl4.Treadmill.Riding then flag4 = false; return end
local v16, v17 = fn41()
if not v16 or v17.Sit or v17.PlatformStand then flag4 = false; return end
local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
if num and num > workspace:GetServerTimeNow() then flag4 = false; return end
local md = v17.MoveDirection
local vector = Vector3.new(md.X, 0, md.Z)
if vector.Magnitude <= 0.001 then fn42(); return end
local n21 = vector.Unit * n20
local alv = v16.AssemblyLinearVelocity
pcall(function()
v16.AssemblyLinearVelocity = Vector3.new(n21.X, alv.Y, n21.Z)
end)
flag4 = true
end)
end
tbl4.SpeedForced = false
local function fn45()
if tbl4.Toggle(createToggle, false) or tbl4.SpeedForced then fn44() else fn43() end
end
local flag5 = false
local flag6 = false
local flag7 = false
tbl4.SetSpeedForced = function(arg)
tbl4.SpeedForced = arg == true
flag5 = true
fn45()
end
local tbl32 = {
Name = "Speed Boost",
Default = false,
Callback = function()
if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
flag5 = true
flag7 = true
end
fn45()
end,
}
createToggle = v15.CreateToggle
createToggle = createToggle(v15, tbl32)
local connection3 = RunService.Heartbeat:Connect(function()
if flag7 then
flag7 = false
if type(v.Notify) == "function" then
pcall(v.Notify, "Speed Boost", "Speed Boost must stay on while Invisibility is on.", 5)
end
end
if not flag5 then return end
flag5 = false
local flag8
if tbl4.SpeedForced and not tbl4.Toggle(createToggle, false) then
flag6 = true
flag8 = true
else
local flag9 = not tbl4.SpeedForced and flag6
flag8 = nil
if flag9 then
flag6 = false
flag8 = nil
if tbl4.Toggle(createToggle, false) then flag8 = false end
end
end
if flag8 ~= nil then
for _, v16 in ipairs({"Set", "SetValue"}) do
local ok, result = pcall(function() return createToggle[v16] end)
if not(ok and type(result) == "function" and pcall(result, createToggle, flag8)) then continue end
break
end
end
end)
fn4(function() connection3:Disconnect() end)
v15:CreateSlider({
Name = "Boost Speed",
Min = 20, Max = 1000, Default = 350, Increment = 5, Unit = "studs/s",
Callback = function(arg) n20 = math.clamp(tonumber(arg) or 350, 20, 1000) end,
})
fn4(fn43)
local v16 = nil
local connection4 = nil
local function fn46()
if connection4 then connection4:Disconnect(); connection4 = nil end
tbl4.Shield("jump", false)
end
v16 = v15:CreateToggle({
Name = "Infinite Jump",
Default = false,
Callback = function()
if not tbl4.Toggle(v16, false) then fn46(); return end
if connection4 then return end
tbl4.Shield("jump", true)
connection4 = UserInputService.JumpRequest:Connect(function()
local character = localPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
end
end)
end,
})
fn4(fn46)
end
-- Invisibility
do
local v14 = nil
local flag4 = false
local flag5 = true
local flag6 = false
local flag7 = false
local flag8 = false
local v15 = nil
local v16 = nil
local hipHeight = 999
local function fn41()
return flag4 and not tbl4.InvisSuspended and not tbl4.InvisMech
end
local function fn42(arg)
return arg and arg:FindFirstChildOfClass("Humanoid") or nil
end
local function fn43(arg)
return networking:FindFirstChild(arg)
end
local function fn44(arg)
return arg ~= nil and arg:GetAttribute("InvisApplied") == true
end
local function fn45()
local AskDoff = fn43("RF/Treadmill/AskDoff")
if AskDoff and AskDoff:IsA("RemoteFunction") then
for i = 1, 2 do pcall(AskDoff.InvokeServer, AskDoff) end
end
end
local function fn46(arg)
local AskRigWipe = fn43("RE/RigSync/AskRigWipe")
if AskRigWipe and AskRigWipe:IsA("RemoteEvent") then
pcall(AskRigWipe.FireServer, AskRigWipe, arg)
end
end
local function fn47(arg)
local backpack = localPlayer:FindFirstChildOfClass("Backpack")
for _, child in ipairs(arg:GetChildren()) do
if child:IsA("Humanoid") then
pcall(child.UnequipTools, child)
end
end
if backpack then
for _, child in ipairs(arg:GetChildren()) do
if child:IsA("Tool") then
pcall(function() child.Parent = backpack end)
end
end
end
for i = 1, 3 do RunService.Heartbeat:Wait() end
end
local function fn48(arg)
local v17 = fn42(arg)
if not arg or not v17 then return false end
fn47(arg)
fn45()
pcall(function()
v17:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
v17.BreakJointsOnDeath = true
v17.RequiresNeck = true
v17.Health = 0
end)
pcall(function() v17:ChangeState(Enum.HumanoidStateType.Dead) end)
pcall(function() arg:BreakJoints() end)
fn46(arg)
return true
end
local function fn49(parent)
local v17 = fn42(parent)
local n20 = os.clock() + 10
while true do
if os.clock() < n20 and flag5 and parent.Parent then
v17 = v17 or fn42(parent)
if not(v17 and parent:FindFirstChild("HumanoidRootPart") and parent:FindFirstChild("Head")) then
task.wait()
continue
end
end
break
end
local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
if not fn41() or not v17 or not humanoidRootPart or not parent:FindFirstChild("Head") then
return false
end
task.wait(0.05)
if not fn41() or parent.Parent == nil then return false end
for i = 1, 2 do pcall(v17.UnequipTools, v17) end
if type(replicatesignal) == "function" then
for i = 1, 2 do pcall(replicatesignal, v17.ServerBreakJoints) end
end
local hipHeight2 = v17.HipHeight
pcall(function() v17.HipHeight = hipHeight end)
for _, child in ipairs(parent:GetChildren()) do
if child:IsA("Accessory") or child:IsA("BasePart") and child ~= humanoidRootPart then
pcall(function() child.Parent = nil end)
end
end
task.wait(0.12)
local function fn50()
pcall(function() v17.HipHeight = hipHeight2 end)
for _, child in ipairs(parent:GetChildren()) do
if child:IsA("Humanoid") and child.HipHeight ~= hipHeight2 then
pcall(function() child.HipHeight = hipHeight2 end)
end
end
end
if parent.Parent == nil then
fn50()
return false
end
local motor6D = Instance.new("Motor6D")
motor6D.Name = "RightWrist"
motor6D.C0 = CFrame.new(1.2, 0, 0)
motor6D.C1 = CFrame.new()
motor6D.Part0 = humanoidRootPart
motor6D.Parent = humanoidRootPart
local part = Instance.new("Part")
part.Name = "RightHand"
part.Size = Vector3.new(0.2, 0.2, 0.2)
part.Transparency = 1
part.CanCollide = false
part.CanTouch = false
part.CanQuery = false
part.Massless = true
part.CFrame = humanoidRootPart.CFrame * motor6D.C0
motor6D.Part1 = part
part.Parent = parent
pcall(function() humanoidRootPart.CanCollide = false end)
fn50()
parent:SetAttribute("InvisApplied", true)
task.delay(1, function()
local zyroToolKeeper = (typeof(getgenv) == "function" and getgenv() or _G).ZyroToolKeeper
if parent.Parent and type(zyroToolKeeper) == "function" then
pcall(zyroToolKeeper)
end
end)
task.delay(0.2, function()
if humanoidRootPart.Parent then
pcall(function() humanoidRootPart.CanCollide = true end)
end
end)
local connection2 = parent.ChildAdded:Connect(function(child)
if child:IsA("Humanoid") then
task.defer(function()
if child.HipHeight ~= hipHeight2 then
pcall(function() child.HipHeight = hipHeight2 end)
end
end)
end
end)
local connection3 = nil
connection3 = parent.AncestryChanged:Connect(function(child, parent2)
if parent2 == nil then
connection2:Disconnect()
connection3:Disconnect()
end
end)
return true
end
local function fn50()
local active = tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Flying
if not active then active = (tbl4.Driving or 0) > 0 end
return active
end
tbl4.RequestRespawn = function() flag8 = true end
local function fn51()
flag6 = true
local v17 = flag8
while flag5 and (fn50() or not tbl4.ClaimMovement("invisibility")) do
task.wait(0.2)
end
local character = localPlayer.Character
if flag5 and character and (v17 or fn44(character) ~= fn41()) and fn42(character) then
flag8 = false
tbl11.Paused = true
tbl4.ShieldPaused = true
pcall(tbl4.UndoSwap)
task.wait()
fn48(localPlayer.Character)
local n20 = os.clock() + 60
local n21 = os.clock() + 8
while flag5 and os.clock() < n20 and localPlayer.Character == character do
if n21 <= os.clock() then
n21 = os.clock() + 8
fn46(character)
end
task.wait(0.05)
end
task.wait(0.1)
while flag5 and flag7 do task.wait(0.05) end
end
tbl11.Paused = false
tbl4.ShieldPaused = false
tbl4.ReleaseMovement("invisibility")
flag6 = false
end
local connection2 = localPlayer.CharacterAdded:Connect(function(character)
if not fn41() then return end
flag7 = true
tbl4.ShieldPaused = true
task.spawn(function()
pcall(fn49, character)
flag7 = false
if not flag6 then tbl4.ShieldPaused = false end
end)
end)
local thread = task.spawn(function()
while flag5 do
local character = localPlayer.Character
local v17 = fn42(character)
if not flag6 and not flag7 and character and v17 and v17.Health > 0 and (flag8 or fn44(character) ~= fn41()) then
fn51()
end
local v18 = fn44(localPlayer.Character)
if v18 ~= v15 then
v15 = v18
tbl4.SetSpeedForced(v18)
end
task.wait(0.25)
end
end)
local connection3 = RunService.Heartbeat:Connect(function()
local character = localPlayer.Character
if not character or not fn44(character) then return end
local rightHand = character:FindFirstChild("RightHand")
local tool = character:FindFirstChildWhichIsA("Tool")
local handle = tool and tool:FindFirstChild("Handle")
if not rightHand or not handle or not handle:IsA("BasePart") then return end
local cframe = CFrame.new()
for _, child in ipairs(rightHand:GetChildren()) do
if child:IsA("JointInstance") and child.Name == "RightGrip" and child.Part1 == handle then
cframe = child.C0 * child.C1:Inverse()
if child.Enabled then child.Enabled = false end
end
end
pcall(function()
handle.CFrame = rightHand.CFrame * cframe
handle.AssemblyLinearVelocity = Vector3.zero
handle.AssemblyAngularVelocity = Vector3.zero
end)
end)
fn4(function() connection3:Disconnect() end)
local connection4 = RunService.Heartbeat:Connect(function()
local character = localPlayer.Character
local v17 = fn42(character)
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
if not v17 or not humanoidRootPart or v17.Health <= 0 then return end
local flag9 = fn44(character) and not tbl4.Steal.Active and not tbl4.Flying
local flag10
if flag9 then flag10 = (tbl4.Driving or 0) == 0 else flag10 = flag9 end
if flag10 then flag10 = not(tbl4.Treadmill and tbl4.Treadmill.Riding) end
if not(flag10 and not v17.Sit and not v17.PlatformStand) then
if v16 == v17 then
v16 = nil
pcall(function() v17.AutoRotate = true end)
end
return
end
if v17.AutoRotate then pcall(function() v17.AutoRotate = false end) end
v16 = v17
local md = v17.MoveDirection
local vector = Vector3.new(md.X, 0, md.Z)
if vector.Magnitude > 0.01 then
pcall(function()
humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector.Unit)
end)
end
end)
tbl4.InvisibilityHandle = v12:CreateToggle({
Name = "Invisibility",
Note = "Makes you invisible to other players",
Default = false,
Callback = function()
local str4 = nil
if type(tbl4.CombatActive) == "function" and tbl4.CombatActive() then str4 = "Auto Hit" end
if tbl4.Toggle(v14, false) and str4 then
flag4 = false
local v17 = v14
tbl4.UiDefer(function()
pcall(v17.Set, v17, false, false)
tbl4.Notify("Invisibility", "Turn off ".. str4.. " first, both cannot be on at the same time")
end)
return
end
flag4 = tbl4.Toggle(v14, false) == true
if fn41() and not fn44(localPlayer.Character) and tbl4.Movement.Owner == nil then
tbl4.Movement.Owner = "invisibility"
end
end,
})
fn4(function()
flag5 = false
connection2:Disconnect()
connection4:Disconnect()
pcall(task.cancel, thread)
tbl11.Paused = false
tbl4.ShieldPaused = false
tbl4.ReleaseMovement("invisibility")
end)
end
-- Anti Ragdoll
do
local tbl32 = {BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true}
local tbl33 = {
[Enum.HumanoidStateType.Physics] = true,
[Enum.HumanoidStateType.Ragdoll] = true,
[Enum.HumanoidStateType.FallingDown] = true,
}
local n20 = 0.5
local n21 = 5
local n22 = 0
local v14 = fn2(function()
return ReplicatedStorage.Shared.Modules.Ragdoll
end)
local v15 = nil
local function fn41()
if v15 then return v15 end
local ok, result = pcall(function()
return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
end)
if ok then v15 = result end
return v15
end
local v16 = nil
local flag4 = false
local connection2 = nil
local n23 = 0
local fn42 = nil
local tbl34 = {}
local tbl35 = {}
local n24 = 0
local v17 = nil
local humanoid = nil
local function fn43(arg)
for _, v18 in ipairs(arg) do
if v18.Connected then v18:Disconnect() end
end
table.clear(arg)
end
local function fn44(arg) tbl34[#tbl34 + 1] = arg end
local function fn45(arg) tbl35[#tbl35 + 1] = arg end
local function fn46()
if not v17 or not humanoid then return end
local humanoidRootPart = v17:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return end
local alv = humanoidRootPart.AssemblyLinearVelocity
local vector = Vector3.new(alv.X, 0, alv.Z)
local n25 = humanoid.WalkSpeed + n21
local y = alv.Y
local flag5 = false
if n25 < vector.Magnitude then vector = vector.Unit * n25; flag5 = true end
if y > n22 then y = n22; flag5 = true end
if flag5 then
pcall(function()
humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
end)
end
end
local function fn47()
if type(v14) ~= "table" then return end
if type(v14.ClearClientRagdoll) == "function" then pcall(v14.ClearClientRagdoll) end
if type(v14.Unragdoll) == "function" then pcall(v14.Unragdoll, v17) end
end
local function fn48()
if not v17 or not v17.Parent then return end
for _, descendant in ipairs(v17:GetDescendants()) do
if tbl32[descendant.ClassName] then pcall(function() descendant:Destroy() end) end
end
end
local function fn49()
if not v17 or not v17.Parent then return end
for _, descendant in ipairs(v17:GetDescendants()) do
if descendant:IsA("Motor6D") and not descendant.Enabled then
pcall(function() descendant.Enabled = true end)
elseif descendant:IsA("AnimationConstraint") and not descendant.Enabled then
pcall(function() descendant.Enabled = true end)
end
end
end
local function fn50()
local v18 = fn41()
if v18 and v18.controlsEnabled == false then pcall(function() v18:Enable() end) end
end
local function fn51()
local currentCamera = workspace.CurrentCamera
if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
pcall(function() currentCamera.CameraSubject = humanoid end)
end
end
local function fn52()
if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then return end
if tbl33[humanoid:GetState()] then pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Running) end) end
if humanoid.PlatformStand then humanoid.PlatformStand = false end
end
local function fn53()
if type(v14) == "table" and type(v14.IsRagdolled) == "function" then
local ok, result = pcall(v14.IsRagdolled, v17)
if ok and result == true then return true end
end
local num = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
return num ~= nil and num > workspace:GetServerTimeNow()
end
local n25 = 21
local function fn54()
if tbl4.AntiGuard.Busy == true then return true end
if (tonumber(tbl4.AntiGuard.HitArms) or 0) <= 0 then return false end
return os.clock() - (tonumber(tbl4.AntiGuard.HitArmedAt) or 0) <= n25
end
local function fn55()
if not humanoid or not humanoid.Parent then return false end
if humanoid.PlatformStand then return true end
return tbl33[humanoid:GetState()] == true
end
local function fn56()
if not v17 or not v17.Parent then return false end
for _, child in ipairs(v17:GetChildren()) do
if tbl32[child.ClassName] then return true end
if child:IsA("BasePart") then
for _, child2 in ipairs(child:GetChildren()) do
if tbl32[child2.ClassName] then return true end
end
end
end
end
return false
end
local function fn57()
fn46()
fn47()
fn48()
fn49()
fn52()
fn50()
fn51()
end
local function fn58()
if not flag4 or fn54() then return end
n23 = os.clock() + n20
end
local function fn59()
local character = localPlayer.Character
if character ~= v17 then
if character then fn42(character)
else
n24 += 1
fn43(tbl35)
v17 = nil
humanoid = nil
end
return
end
if not v17 then return end
if v17:FindFirstChildOfClass("Humanoid") ~= humanoid then fn42(v17) end
end
local function fn60()
if not flag4 then return end
fn59()
if not v17 or not humanoid or humanoid.Health <= 0 then return end
if fn54() then n23 = 0; return end
local now = os.clock()
if fn55() or fn53() or fn56() then n23 = now + n20 end
if now <= n23 then fn57() end
end
fn42 = function(arg)
n24 += 1
local v18 = n24
fn43(tbl35)
v17 = arg
humanoid = nil
if not flag4 or not arg then return end
humanoid = arg:FindFirstChildOfClass("Humanoid")
if not flag4 or n24 ~= v18 or arg ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then return end
fn45(humanoid.StateChanged:Connect(function(old, new)
if flag4 and tbl33[new] then fn58() end
end))
fn45(humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
if flag4 and humanoid and humanoid.PlatformStand then fn58() end
end))
fn45(arg.DescendantAdded:Connect(function(descendant)
if flag4 and tbl32[descendant.ClassName] then fn58() end
end))
fn45(arg.ChildAdded:Connect(function(child)
if flag4 and child:IsA("Humanoid") and child ~= humanoid then task.defer(fn59) end
end))
fn51()
if fn53() then fn58() end
end
local function fn61()
flag4 = false
n24 += 1
n23 = 0
if connection2 then pcall(function() connection2:Disconnect() end); connection2 = nil end
fn43(tbl35)
fn43(tbl34)
v17 = nil
humanoid = nil
end
local function fn62()
fn61()
flag4 = true
fn41()
connection2 = RunService.Heartbeat:Connect(fn60)
fn44(localPlayer.CharacterAdded:Connect(function(character)
if flag4 then
task.defer(function()
if flag4 and character == localPlayer.Character then fn42(character) end
end)
end
end))
fn44(localPlayer.CharacterRemoving:Connect(function(character)
if flag4 and character == v17 then
n24 += 1
n23 = 0
fn43(tbl35)
v17 = nil
humanoid = nil
end
end))
fn44(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
if flag4 then fn58() end
end))
local clientRagdollRemote = type(v14) == "table" and v14.ClientRagdollRemote or nil
if typeof(clientRagdollRemote) == "Instance" and clientRagdollRemote:IsA("RemoteEvent") then
fn44(clientRagdollRemote.OnClientEvent:Connect(function()
if flag4 and not fn54() then
fn46()
fn58()
end
end))
end
fn44(tbl4.OnHumanoidChanged(function()
if flag4 and localPlayer.Character then fn42(localPlayer.Character) end
end))
if localPlayer.Character then fn42(localPlayer.Character) end
end
fn4(fn61)
v16 = v12:CreateToggle({
Name = "Anti Ragdoll",
Default = true,
Callback = function()
if tbl4.Toggle(v16, false) then fn62() else fn61() end
end,
})
end
-- Auto Heal (God mode passivo)
do
local flag4 = false
local tbl32 = {}
local function fn41()
for _, v14 in ipairs(tbl32) do pcall(function() v14:Disconnect() end) end
table.clear(tbl32)
end
local function fn42(arg)
if flag4 and arg.Parent and arg.Health > 0 and arg.Health < arg.MaxHealth then
pcall(function() arg.Health = arg.MaxHealth end)
end
end
local function fn43(arg)
fn41()
if not flag4 or not arg then return end
local humanoid = arg:FindFirstChildOfClass("Humanoid") or arg:WaitForChild("Humanoid", 5)
if not flag4 or not humanoid or not humanoid:IsA("Humanoid") or arg ~= localPlayer.Character then return end
table.insert(tbl32, humanoid.HealthChanged:Connect(function() fn42(humanoid) end))
table.insert(tbl32, RunService.Heartbeat:Connect(function() fn42(humanoid) end))
fn42(humanoid)
end
local connection2 = localPlayer.CharacterAdded:Connect(function(character)
if flag4 then task.defer(fn43, character) end
end)
local v14 = tbl4.OnHumanoidChanged(function()
if flag4 and localPlayer.Character then fn43(localPlayer.Character) end
end)
fn4(function()
flag4 = false
connection2:Disconnect()
v14:Disconnect()
fn41()
end)
flag4 = true
if localPlayer.Character then task.spawn(fn43, localPlayer.Character) end
end
-- Anti Trap
do
local v14 = nil
local flag4 = true
local tbl32 = {}
local tbl33 = {}
local function fn41(arg)
if arg:IsA("BasePart") and tbl32[arg] == nil then
tbl32[arg] = arg.CanTouch
pcall(function() arg.CanTouch = false end)
end
end
local function fn42(arg)
if not flag4 or not arg.Parent then return end
local name = localPlayer.Name
if arg:GetAttribute("Owner") == name then return end
fn41(arg)
for _, descendant in ipairs(arg:GetDescendants()) do fn41(descendant) end
table.insert(tbl33, arg.DescendantAdded:Connect(function(descendant)
if flag4 then fn41(descendant) end
end))
end
local function fn43()
for _, v15 in ipairs(CollectionService:GetTagged("PlacedTrap")) do fn42(v15) end
end
local function fn44()
for k, v15 in pairs(tbl32) do
if k.Parent then pcall(function() k.CanTouch = v15 end) end
end
table.clear(tbl32)
end
table.insert(tbl33, CollectionService:GetInstanceAddedSignal("PlacedTrap"):Connect(function(arg)
task.defer(fn42, arg)
end))
v14 = v12:CreateToggle({
Name = "Anti Trap",
Note = "Traps from other players cannot catch you",
Default = true,
Callback = function()
flag4 = tbl4.Toggle(v14, true) == true
if flag4 then fn43() else fn44() end
end,
})
fn43()
fn4(function()
flag4 = false
for _, v15 in ipairs(tbl33) do pcall(function() v15:Disconnect() end) end
table.clear(tbl33)
fn44()
end)
end
-- Instant Prompts
do
local v14 = nil
local str4 = "CarryAreaEgg"
local tbl32 = {ClaimLostPart = true}
local tbl33 = {}
local connection2 = nil
local connection3 = nil
local function fn41(arg)
if not arg:IsA("ProximityPrompt") or tbl32[arg.Name] then return end
if tbl33[arg] == nil then
if arg.HoldDuration <= 0 and arg.Name ~= str4 then return end
tbl33[arg] = arg.HoldDuration
end
if arg.HoldDuration ~= 0 then pcall(function() arg.HoldDuration = 0 end) end
end
local function fn42(arg)
if arg.Name ~= "SmartPromptPart" then return nil end
local carryAreaEgg = arg:FindFirstChild("CarryAreaEgg")
return carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and carryAreaEgg or nil
end
tbl4.PromptHold = function(arg)
local v15 = tbl33[arg]
if type(v15) == "number" then return v15 end
return arg.HoldDuration
end
local function fn43()
if connection2 then return end
connection3 = ProximityPromptService.PromptShown:Connect(function(arg)
if tbl4.Toggle(v14, true) then fn41(arg) end
end)
for _, child in ipairs(workspace:GetChildren()) do
local v15 = fn42(child)
if v15 then fn41(v15) end
end
connection2 = workspace.ChildAdded:Connect(function(child)
if child.Name ~= "SmartPromptPart" then return end
task.defer(function()
local carryAreaEgg = child:FindFirstChild("CarryAreaEgg") or child:WaitForChild("CarryAreaEgg", 2)
if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and tbl4.Toggle(v14, true) then
fn41(carryAreaEgg)
end
end)
end)
end
local function fn44()
for k, v15 in pairs(tbl33) do
if k and k.Parent then pcall(function() k.HoldDuration = v15 end) end
end
table.clear(tbl33)
if connection2 then connection2:Disconnect(); connection2 = nil end
if connection3 then connection3:Disconnect(); connection3 = nil end
end
tbl4.PressStealPrompt = function(arg)
if typeof(fireproximityprompt) ~= "function" or not arg then return false end
local v15 = nil
local huge = math.huge
for _, child in ipairs(workspace:GetChildren()) do
local v16 = fn42(child)
if v16 and child:IsA("BasePart") then
local magnitude = (child.Position - arg).Magnitude
if magnitude < huge then v15 = v16; huge = magnitude end
end
end
if not v15 or huge > 14 then return false end
if tbl4.Toggle(v14, true) then pcall(function() v15.HoldDuration = 0 end) end
local ok = pcall(fireproximityprompt, v15)
if ok and v15.HoldDuration > 0 then task.wait(v15.HoldDuration + 0.1) end
return ok
end
tbl3.Add(function()
if tbl4.Toggle(v14, true) then
fn43()
for k in pairs(tbl33) do
if not k.Parent then tbl33[k] = nil
elseif k.HoldDuration ~= 0 then pcall(function() k.HoldDuration = 0 end) end
end
elseif next(tbl33) ~= nil or connection2 then fn44() end
return false
end)
v14 = v12:CreateToggle({
Name = "Instant Prompts",
Default = true,
Callback = function() tbl3.Wake() end,
})
fn4(fn44)
end
-- ============================================================
-- ZYRO HUB — EXTRA C/4 PARTE 2: Misc (FPS, Optimizer, Anti-AFK)
-- ============================================================
do
local v13 = v2:CreateTab({Name = "Misc", SectionsExpanded = true})
local v14 = v13:CreateSection({Name = "Performance", Expanded = true})
local flag2 = false
v14:CreateSlider({
Name = "FPS Cap",
Min = 30, Max = 1000, Default = 240, AllowDecimals = false, Increment = 1, Unit = " FPS",
Callback = function(arg)
local n13 = math.clamp(math.floor(tonumber(arg) or 240), 30, 1000)
if type(setfpscap) == "function" and pcall(setfpscap, n13) then
flag2 = false
return
end
if not flag2 then
flag2 = true
fn15("FPS Cap Unavailable", "This environment does not support setfpscap.")
end
end,
})
do
local Lighting = game:GetService("Lighting")
local n13 = 0.003
local flag3 = false
local n14 = 0
local thread = nil
local tbl16 = {}
local tbl17 = {}
local obj = setmetatable({}, {__mode = "k"})
local tbl18 = {}
local connection = nil
local function fn16(arg, arg2, arg3)
local ok, result = pcall(arg)
if not ok then return end
tbl17[#tbl17 + 1] = {Setter = arg2, Value = result}
pcall(arg2, arg3)
end
local function fn17(arg, arg2, arg3)
local tbl19 = obj[arg]
if not tbl19 then
tbl19 = {}
obj[arg] = tbl19
end
if tbl19[arg2] == nil then
local ok, result = pcall(function() return arg[arg2] end)
if not ok then return end
tbl19[arg2] = {Value = result}
end
pcall(function() arg[arg2] = arg3 end)
end
local function fn18(arg)
if not flag3 or not arg.Parent then return end
if arg:IsA("ParticleEmitter") then
fn17(arg, "Enabled", false)
fn17(arg, "Rate", 0)
elseif arg:IsA("Trail") or arg:IsA("Beam") then
fn17(arg, "Enabled", false)
elseif arg:IsA("PointLight") or arg:IsA("SpotLight") or arg:IsA("SurfaceLight") then
fn17(arg, "Enabled", false)
fn17(arg, "Brightness", 0)
elseif arg:IsA("Fire") or arg:IsA("Smoke") or arg:IsA("Sparkles") then
fn17(arg, "Enabled", false)
elseif arg:IsA("Explosion") then
fn17(arg, "Visible", false)
elseif arg:IsA("SpecialMesh") then
fn17(arg, "TextureId", "")
elseif arg:IsA("Decal") or arg:IsA("Texture") then
if not(arg.Name == "face" and arg.Parent and arg.Parent.Name == "Head") then
fn17(arg, "Transparency", 1)
end
elseif arg:IsA("MeshPart") then
fn17(arg, "RenderFidelity", Enum.RenderFidelity.Performance)
fn17(arg, "TextureID", "")
fn17(arg, "CastShadow", false)
fn17(arg, "Reflectance", 0)
fn17(arg, "Material", Enum.Material.SmoothPlastic)
elseif arg:IsA("BasePart") then
fn17(arg, "CastShadow", false)
fn17(arg, "Reflectance", 0)
fn17(arg, "Material", Enum.Material.SmoothPlastic)
elseif arg:IsA("PostEffect") then
fn17(arg, "Enabled", false)
elseif arg:IsA("Clouds") then
fn17(arg, "Cover", 0)
fn17(arg, "Density", 0)
elseif arg:IsA("Atmosphere") then
fn17(arg, "Density", 0)
fn17(arg, "Haze", 0)
fn17(arg, "Glare", 0)
end
end
local function fn19()
for _, v15 in ipairs(tbl16) do
if v15.Connected then v15:Disconnect() end
end
table.clear(tbl16)
if connection then pcall(function() connection:Disconnect() end); connection = nil end
end
local function fn20()
local rendering = settings().Rendering
local terrain = workspace.Terrain
local function fn21(arg, arg2, arg3)
fn16(function() return arg[arg2] end, function(arg4) arg[arg2] = arg4 end, arg3)
end
fn21(rendering, "QualityLevel", Enum.QualityLevel.Level01)
fn21(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
fn21(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)
local ok, result = pcall(function() return UserSettings():GetService("UserGameSettings") end)
if ok and result then fn21(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1) end
fn21(Lighting, "GlobalShadows", false)
fn21(Lighting, "ShadowSoftness", 0)
fn21(Lighting, "FogEnd", 9e9)
fn21(Lighting, "Technology", Enum.Technology.Legacy)
fn21(Lighting, "EnvironmentDiffuseScale", 0)
fn21(Lighting, "EnvironmentSpecularScale", 0)
fn21(terrain, "Decoration", false)
fn21(terrain, "WaterWaveSize", 0)
fn21(terrain, "WaterWaveSpeed", 0)
fn21(terrain, "WaterReflectance", 0)
fn21(terrain, "WaterTransparency", 1)
end
local function fn21(arg, arg2)
local now = os.clock()
for _, descendant in ipairs(arg:GetDescendants()) do
if not flag3 or n14 ~= arg2 then return false end
fn18(descendant)
if n13 < os.clock() - now then
RunService.Heartbeat:Wait()
now = os.clock()
end
end
return true
end
local function fn22()
if not flag3 or #tbl18 == 0 then return end
local now = os.clock()
while #tbl18 > 0 do
local v15 = table.remove(tbl18)
fn18(v15)
if not(n13 < os.clock() - now) then continue end
break
end
end
local function fn23()
local now = os.clock()
for k, v15 in pairs(obj) do
if k.Parent then
for k2, v16 in pairs(v15) do
pcall(function() k[k2] = v16.Value end)
end
end
obj[k] = nil
if n13 < os.clock() - now then
RunService.Heartbeat:Wait()
now = os.clock()
end
end
end
local function fn24()
if not flag3 then return end
flag3 = false
n14 += 1
fn19()
table.clear(tbl18)
if thread then pcall(task.cancel, thread); thread = nil end
fn23()
for i = #tbl17, 1, -1 do
local v15 = tbl17[i]
pcall(v15.Setter, v15.Value)
end
table.clear(tbl17)
end
local function fn25()
if flag3 then return end
flag3 = true
n14 += 1
local v15 = n14
fn20()
local function fn26(arg)
tbl16[#tbl16 + 1] = arg.DescendantAdded:Connect(function(descendant)
if flag3 and n14 == v15 then tbl18[#tbl18 + 1] = descendant end
end)
end
fn26(workspace)
fn26(Lighting)
connection = RunService.Heartbeat:Connect(function()
if flag3 and n14 == v15 then fn22() end
end)
thread = task.spawn(function()
if fn21(workspace, v15) then fn21(Lighting, v15) end
end)
end
fn4(fn24)
v14:CreateToggle({
Name = "Optimizer",
Note = "Strip shadows, textures and effects for the highest FPS",
Default = false,
Callback = function(arg)
if arg then fn25() else task.spawn(fn24) end
end,
})
end
-- FPS/Ping counter
do
local Stats = game:GetService("Stats")
local n13 = 132
local n14 = 0.085
local n15 = 0.2
local n16 = 8
local v15 = v2:CreateState({Name = "FPS and Ping Position", Default = {}})
local function fn16()
local v16 = v15:Get()
if type(v16) == "table" and type(v16.XOffset) == "number" and type(v16.YOffset) == "number" then
return UDim2.new(tonumber(v16.XScale) or 0, v16.XOffset, tonumber(v16.YScale) or 0, v16.YOffset)
end
return UDim2.new(0, 16, 0, 16)
end
local function fn17(arg)
v15:Set({XScale = arg.X.Scale, XOffset = arg.X.Offset, YScale = arg.Y.Scale, YOffset = arg.Y.Offset})
end
local color3 = Color3.fromRGB(58, 255, 55)
local color4 = Color3.fromRGB(255, 214, 84)
local color5 = Color3.fromRGB(255, 96, 96)
local color6 = Color3.fromRGB(150, 150, 158)
local flag3 = false
local tbl16 = {}
local screenGui = nil
local frame = nil
local uiScale = nil
local v16 = nil
local v17 = nil
local n17 = 1
local n18 = 0
local n19 = 0
local v18 = nil
local v19 = nil
local font = nil
pcall(function()
font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
end)
local function fn18(arg)
if arg >= 100 then return color3 end
if arg >= 50 then return color4 end
return color5
end
local function fn19(arg)
if arg <= 90 then return color3 end
if arg <= 180 then return color4 end
return color5
end
local function fn20()
if not uiScale then return end
local cc = workspace.CurrentCamera
cc = cc and cc.ViewportSize or Vector2.new(1280, 720)
if cc.X < 1 then cc = Vector2.new(1280, 720) end
uiScale.Scale = math.clamp(cc.X * n14 / n13, 0.7, 1.4) * n17
end
local function fn21()
for _, v20 in ipairs(tbl16) do pcall(function() v20:Disconnect() end) end
table.clear(tbl16)
if screenGui then pcall(function() screenGui:Destroy() end) end
screenGui = nil
frame = nil
uiScale = nil
v16 = nil
v17 = nil
v18 = nil
v19 = nil
n18 = 0
end
local function createTextLabel(parent, arg, arg2, textColor3)
local textLabel = Instance.new("TextLabel")
textLabel.Name = fn3()
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.fromOffset(arg, 9)
textLabel.Size = UDim2.fromOffset(arg2, 16)
textLabel.Text = ""
textLabel.TextColor3 = textColor3
textLabel.TextScaled = true
textLabel.TextXAlignment = Enum.TextXAlignment.Left
if font then textLabel.FontFace = font else textLabel.Font = Enum.Font.GothamBold end
textLabel.Parent = parent
return textLabel
end
local function fn22()
fn21()
screenGui = Instance.new("ScreenGui")
screenGui.Name = fn3()
screenGui.Archivable = false
screenGui.DisplayOrder = 58
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
frame = Instance.new("Frame")
frame.Name = fn3()
frame.Active = true
frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
frame.BackgroundTransparency = 0.28
frame.BorderSizePixel = 0
frame.Position = fn16()
frame.Size = UDim2.fromOffset(132, 34)
frame.Parent = screenGui
local uiCorner = Instance.new("UICorner")
uiCorner.Name = fn3()
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame
local uiStroke = Instance.new("UIStroke")
uiStroke.Name = fn3()
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 1
uiStroke.Transparency = 0.9
uiStroke.Parent = frame
uiScale = Instance.new("UIScale")
uiScale.Name = fn3()
uiScale.Parent = frame
fn20()
v16 = createTextLabel(frame, 12, 34, color3)
createTextLabel(frame, 48, 22, color6).Text = "FPS"
local frame2 = Instance.new("Frame")
frame2.Name = fn3()
frame2.AnchorPoint = Vector2.new(0.5, 0.5)
frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame2.BackgroundTransparency = 0.85
frame2.BorderSizePixel = 0
frame2.Position = UDim2.new(0, 74, 0.5, 0)
frame2.Size = UDim2.fromOffset(1, 14)
frame2.Parent = frame
v17 = createTextLabel(frame, 82, 30, color3)
createTextLabel(frame, 113, 14, color6).Text = "ms"
screenGui.Parent = v3
local cc = workspace.CurrentCamera
if cc then tbl16[#tbl16 + 1] = cc:GetPropertyChangedSignal("ViewportSize"):Connect(fn20) end
local flag4 = false
local v20 = nil
local vector2 = Vector2.zero
local position = nil
tbl16[#tbl16 + 1] = frame.InputBegan:Connect(function(input)
if flag4 or input.UserInputState ~= Enum.UserInputState.Begin then return end
local flag5 = input.UserInputType == Enum.UserInputType.Touch
if not(input.UserInputType == Enum.UserInputType.MouseButton1) and not flag5 then return end
flag4 = true
v20 = flag5 and input or nil
vector2 = Vector2.new(input.Position.X, input.Position.Y)
position = frame.Position
end)
tbl16[#tbl16 + 1] = UserInputService.InputChanged:Connect(function(input)
if not flag4 or not frame or not position then return end
if not(v20 and input == v20 or not v20 and input.UserInputType == Enum.UserInputType.MouseMovement) then return end
local n20 = Vector2.new(input.Position.X, input.Position.Y) - vector2
frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n20.X, position.Y.Scale, position.Y.Offset + n20.Y)
end)
tbl16[#tbl16 + 1] = UserInputService.InputEnded:Connect(function(input)
if not flag4 then return end
local flag5 = v20 and input == v20
local flag6
if flag5 then flag6 = flag5 else flag6 = not v20 and input.UserInputType == Enum.UserInputType.MouseButton1 end
if flag6 then
flag4 = false
v20 = nil
position = nil
if frame then fn17(frame.Position) end
end
end)
tbl16[#tbl16 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
if not flag3 or not v16 then return end
local n20 = math.clamp(deltaTime, 0.001, 1)
local n21 = 1 / n20
if n18 <= 0 then n18 = n21
else n18 += (n21 - n18) * (1 - math.exp(-n20 * n16)) end
local now = os.clock()
if now < n19 then return end
n19 = now + n15
local n22 = math.floor(n18 + 0.5)
local text = tostring(n22)
if text ~= v18 then
v18 = text
v16.Text = text
v16.TextColor3 = fn18(n22)
end
local n23 = 0
pcall(function() n23 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
local n24 = math.floor(n23 + 0.5)
local text2 = tostring(n24)
if text2 ~= v19 then
v19 = text2
v17.Text = text2
v17.TextColor3 = fn19(n24)
end
end)
end
v14:CreateSlider({
Name = "FPS and Ping Size",
Min = 60, Max = 160, Default = 100, AllowDecimals = false, Increment = 1, Unit = "%",
SubOf = v14:CreateToggle({
Name = "FPS and Ping",
Default = true,
Callback = function(arg)
flag3 = arg == true
if flag3 then fn22() else fn21() end
end,
}),
Callback = function(arg)
n17 = math.clamp((tonumber(arg) or 100) / 100, 0.6, 1.6)
fn20()
end,
})
fn4(fn21)
end
-- Anti AFK
do
local v15 = v13:CreateSection({Name = "Utility", Expanded = true})
local tbl16 = {Enabled = true, Alive = true, Silenced = {}}
local function fn16()
if type(getconnections) ~= "function" then return {} end
local ok, result = pcall(getconnections, localPlayer.Idled)
return ok and type(result) == "table" and result or {}
end
local function fn17()
for _, v16 in ipairs(fn16()) do
if pcall(function() v16:Disable() end) then
tbl16.Silenced[#tbl16.Silenced + 1] = v16
end
end
end
local function fn18()
local silenced = tbl16.Silenced
if #silenced == 0 then silenced = fn16() end
for _, v16 in ipairs(silenced) do
pcall(function() v16:Enable() end)
end
table.clear(tbl16.Silenced)
end
local obj = setmetatable({}, {__index = function() return function() end end})
local tbl17 = {}
local function fn19()
local tbl18 = {}
if type(getgc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then
return tbl18
end
local ok, result = pcall(getgc, false)
if not ok or type(result) ~= "table" then return tbl18 end
for _, v16 in ipairs(result) do
if type(v16) == "function" and islclosure(v16) then
local ok2, result2 = pcall(debug.info, v16, "s")
if ok2 and type(result2) == "string" and string.find(result2, "AntiAFK", 1, true) then
local ok3, result3 = pcall(debug.getupvalues, v16)
if ok3 and type(result3) == "table" then
for k, v17 in pairs(result3) do
if typeof(v17) == "Instance" and v17.ClassName == "TeleportService" then
tbl18[#tbl18 + 1] = {Fn = v16, Index = k, Original = v17}
end
end
end
end
end
end
return tbl18
end
local function fn20()
for _, v16 in ipairs(fn19()) do
local ok, result = pcall(debug.getupvalue, v16.Fn, v16.Index)
if ok and typeof(result) == "Instance" then
if pcall(debug.setupvalue, v16.Fn, v16.Index, obj) then
tbl17[#tbl17 + 1] = v16
end
end
end
end
local function fn21()
for _, v16 in ipairs(tbl17) do
pcall(debug.setupvalue, v16.Fn, v16.Index, v16.Original)
end
table.clear(tbl17)
end
local function fn22()
fn17()
if #tbl17 == 0 then fn20() end
end
local connection = localPlayer.CharacterAdded:Connect(function()
task.delay(1, function()
if tbl16.Alive and tbl16.Enabled then
table.clear(tbl16.Silenced)
pcall(fn22)
end
end)
end)
fn4(function() pcall(function() connection:Disconnect() end) end)
fn4(function()
tbl16.Alive = false
fn18()
fn21()
end)
task.spawn(function()
while tbl16.Alive do
if tbl16.Enabled then fn22() end
task.wait(600)
end
end)
v15:CreateToggle({
Name = "Anti AFK",
Default = true,
Callback = function(arg)
tbl16.Enabled = arg ~= false
if tbl16.Enabled then fn22()
else fn18(); fn21() end
end,
})
end
end-- ============================================================
-- ZYRO HUB — EXTRA D/4: Combat + ESP + AntiGuard UI + Finalize
-- ============================================================
tbl4.Combat = {}
local combat
combat = tbl4.Combat
do
local n20 = 15
local n21 = 2
local n22 = 0.05
local n23 = 1
local n24 = 0.18
local n25 = -0.275
local n26 = 0.6
local n27 = 6
local n28 = 1.1
local n29 = 0.8
local n30 = 2.5
local n31 = 35
local n32 = 0.12
local n33 = 6
local n34 = 6
local n35 = 3
local tbl32 = {0.12, 0.2, 0.28, 0.36, 0.46, 0.6}
local tbl33 = {["WALL LEFT"] = true, ["WALL RIGHT"] = true}
local tbl34 = {
Trigger = nil,
LastFire = 0,
Trace = 0,
EquipAt = 0,
Walls = {},
WallsAt = 0,
WallSide = setmetatable({}, {__mode = "k"}),
Tracks = setmetatable({}, {__mode = "k"}),
Stats = {},
Option = 3,
Pending = {},
Holders = {},
SpawnRagdoll = nil,
}
for i = 1, #tbl32 do
tbl34.Stats[i] = {Hits = 0, Shots = 0}
end
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
pcall(function() raycastParams.RespectCanCollide = true end)
local function fn41() return workspace:GetServerTimeNow() end
local function fn42()
local trigger = tbl34.Trigger
if trigger and trigger.Parent then return trigger end
local reBatSwingTrigger = networking:FindFirstChild("RE/BatSwing/Trigger")
tbl34.Trigger = reBatSwingTrigger
return reBatSwingTrigger
end
local function fn43(arg) return tonumber(arg:GetAttribute("RagdollEndTime")) or 0 end
combat.SetLead = function(arg)
n25 = math.clamp((tonumber(arg) or -275) / 1000, -0.4, 0.1)
end
combat.SetSweep = function(arg)
n26 = math.clamp((tonumber(arg) or 60) / 100, 0, 2.5)
end
combat.Ragdolled = function(arg)
return fn43(arg) > fn41()
end
combat.SelfRagdolled = function()
local v14 = fn43(localPlayer)
if v14 <= fn41() then return false end
return v14 ~= tbl34.SpawnRagdoll
end
combat.Humanoid = function(arg)
if not arg then return nil end
local v14 = nil
for _, child in ipairs(arg:GetChildren()) do
if child:IsA("Humanoid") then
if child.Health > 0 then return child end
v14 = v14 or child
end
end
return v14
end
local function fn44(arg)
local gears = tbl.Gears
local directory = type(gears) == "table" and gears.Directory or nil
local flag4 = type(directory) == "table"
if flag4 then flag4 = directory[tostring(arg:GetAttribute("GearName") or arg.Name)] end
flag4 = flag4 or nil
local batControllerData = type(flag4) == "table" and flag4.BatControllerData or nil
return type(batControllerData) == "table" and tonumber(batControllerData.RangeBonus) or 0
end
combat.Range = function(arg)
local n36 = workspace:GetAttribute("DragonEggEventActive") == true and 2.5 or 1
return (n20 + n21 + (arg and fn44(arg) or 0)) * n36
end
combat.PickBat = function(arg)
local tool = arg:FindFirstChildWhichIsA("Tool")
if tool and tbl4.IsBatTool(tool) then return tool end
local v14, v15, v16 = ipairs({arg, localPlayer:FindFirstChildOfClass("Backpack")})
local n36 = -1
local v17 = nil
for _, v18 in v14, v15, v16 do
if v18 then
for _, child in ipairs(v18:GetChildren()) do
if tbl4.IsBatTool(child) then
local v19 = fn44(child)
if n36 < v19 then n36 = v19; v17 = child end
end
end
end
end
return v17
end
local function fn45(parent, arg, arg2)
if arg2.Parent == parent then return true end
local equipAt = tbl34.EquipAt
if os.clock() - equipAt < 0.2 then return false end
tbl34.EquipAt = os.clock()
pcall(function() arg:EquipTool(arg2) end)
if arg2.Parent ~= parent then pcall(function() arg2.Parent = parent end) end
return arg2.Parent == parent
end
combat.Parts = function(arg)
arg = arg and arg.Character
local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then return nil, nil end
return arg, humanoidRootPart
end
combat.Hittable = function(arg)
if not arg or arg == localPlayer or arg.Parent ~= Players then return false end
local v14, v15 = combat.Parts(arg)
if not v14 then return false end
if v14:GetAttribute("IsTrapped") == true or arg:GetAttribute("InBossArena") then return false end
return not tbl4.InsideBase(v15.Position)
end
local function fn46()
local wallsAt = tbl34.WallsAt
if os.clock() < wallsAt then return tbl34.Walls end
tbl34.WallsAt = os.clock() + 5
local walls = {}
local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
world = world and world:FindFirstChild("Build")
if world then
for _, child in ipairs(world:GetChildren()) do
local collisions = child:FindFirstChild("COLLISIONS")
collisions = collisions and collisions:FindFirstChild("GUARD NO COLLIDE")
if collisions then
for _, child2 in ipairs(collisions:GetChildren()) do
if tbl33[child2.Name] then
if child2:IsA("BasePart") then table.insert(walls, child2) end
for _, descendant in ipairs(child2:GetDescendants()) do
if descendant:IsA("BasePart") then table.insert(walls, descendant) end
end
end
end
end
end
end
tbl34.Walls = walls
return walls
end
local function fn47(arg)
if arg.X <= arg.Y and arg.X <= arg.Z then return "X", "Y", "Z" end
if arg.Y <= arg.Z then return "Y", "X", "Z" end
return "Z", "X", "Y"
end
local function fn48(arg)
local n36 = math.abs(arg.RightVector.Y)
local n37 = math.abs(arg.UpVector.Y)
local n38 = math.abs(arg.LookVector.Y)
if n36 >= n37 and n36 >= n38 then return "X" end
if n38 <= n37 then return "Y" end
return "Z"
end
local function fn49(arg, arg2, arg3, arg4)
if arg3 == arg4 then return true end
local n36 = arg2[arg3] + n33
return math.abs(arg[arg3]) <= n36
end
local function fn50(arg, arg2)
for _, v14 in ipairs(fn46()) do
if v14.Parent then
local cFrame = v14.CFrame
local size = v14.Size
local v15, v16, v17 = fn47(size)
local v18 = fn48(cFrame)
local n36 = size / 2
local v19 = cFrame:PointToObjectSpace(arg2)
if fn49(v19, n36, v16, v18) and fn49(v19, n36, v17, v18) then
local v20 = cFrame:PointToObjectSpace(arg)
local n37 = math.abs(v20[v15])
local n38 = tbl34.WallSide[v14]
if n37 >= n36[v15] + n33 * 0.5 or n38 == nil and n37 >= n36[v15] then
n38 = v20[v15] >= 0 and 1 or -1
tbl34.WallSide[v14] = n38
elseif n38 == nil then
n38 = v20[v15] >= 0 and 1 or -1
end
local n39 = n36[v15] + n33
if v19[v15] * n38 < n39 then
local tbl35 = {X = v19.X, Y = v19.Y, Z = v19.Z, [v15] = n38 * n39}
arg2 = cFrame:PointToWorldSpace(Vector3.new(tbl35.X, tbl35.Y, tbl35.Z))
end
end
end
end
return arg2
end
combat.KeepOffWalls = function(arg, arg2)
local v14 = fn50(arg, arg2)
local n36 = v14 - arg
if n33 < n36.Magnitude then
local v15 = arg
for i = 1, 6 do
local n37 = arg + n36 * i / n34
local v16 = fn50(v15, n37)
if (v16 - n37).Magnitude > 0.01 then return fn50(arg, v16) end
v15 = v16
end
end
return v14
end
combat.ResetWalls = function()
table.clear(tbl34.WallSide)
end
local n36 = 0
local v14 = nil
local function fn51(arg)
local character = localPlayer.Character
if os.clock() - n36 > 0.5 or character ~= v14 then
n36 = os.clock()
v14 = character
local filterDescendantsInstances = {}
for _, player in ipairs(Players:GetPlayers()) do
if player.Character then table.insert(filterDescendantsInstances, player.Character) end
end
raycastParams.FilterDescendantsInstances = filterDescendantsInstances
end
local hit = workspace:Raycast(arg + Vector3.new(0, 60, 0), Vector3.new(0, -400, 0), raycastParams)
if hit and arg.Y < hit.Position.Y + n35 then
return Vector3.new(arg.X, hit.Position.Y + n35, arg.Z)
end
return arg
end
local function fn52(arg, arg2)
local tbl35 = tbl34.Tracks[arg]
if not tbl35 then
tbl35 = {Samples = {}, Smooth = nil, Heading = nil}
tbl34.Tracks[arg] = tbl35
end
local now = os.clock()
local samples = tbl35.Samples
table.insert(samples, {Time = now, Position = arg2.Position})
while #samples > 2 and now - samples[1].Time > n32 do table.remove(samples, 1) end
local alv = arg2.AssemblyLinearVelocity
local v15 = samples[1]
local n37 = now - v15.Time
local n38
if n37 >= 0.03 then
n38 = (arg2.Position - v15.Position) / n37
if not(n38.Magnitude <= 1500 and alv.Magnitude <= n38.Magnitude * 1.4) then n38 = alv end
else n38 = alv end
local vector = Vector3.new(n38.X, 0, n38.Z)
tbl35.Smooth = tbl35.Smooth and tbl35.Smooth:Lerp(vector, 0.25) or vector
local smooth = tbl35.Smooth
if smooth.Magnitude > 1 then
local heading = tbl35.Heading and tbl35.Heading:Lerp(smooth.Unit, 0.25) or smooth.Unit
tbl35.Heading = heading.Magnitude > 0.01 and heading.Unit or smooth.Unit
end
return n38, vector, smooth, tbl35
end
local function fn53()
local n37 = 0
for _, stat in ipairs(tbl34.Stats) do n37 += stat.Shots end
local option = tbl34.Option
local n38 = -math.huge
for i, stat in ipairs(tbl34.Stats) do
local n39 = stat.Shots + 1
local n40 = (stat.Hits + 1) / (stat.Shots + 2) + math.sqrt(2 * math.log(n37 + 2) / n39) * 0.35
if n40 > n38 then n38 = n40; option = i end
end
tbl34.Option = option
return option
end
local function fn54()
local now = os.clock()
for i = #tbl34.Pending, 1, -1 do
local v15 = tbl34.Pending[i]
local v16 = tbl34.Stats[v15.Option]
if v15.RagdollBefore + 0.01 < fn43(v15.Target) then
v16.Hits = v16.Hits + 1
v16.Shots = v16.Shots + 1
table.remove(tbl34.Pending, i)
elseif now - v15.At > v15.Wait then
if v15.CooldownBefore + 0.01 < (v15.Tool and tonumber(v15.Tool:GetAttribute("CooldownEndTime")) or 0) then
v16.Shots = v16.Shots + 1
end
table.remove(tbl34.Pending, i)
end
end
end
combat.Plan = function(arg, arg2, arg3, arg4)
if not arg3 then local v15; v15, arg3 = combat.Parts(arg) end
if not arg3 or not arg3.Parent then return nil end
local n37 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
local n38 = math.clamp(n37 + n22, 0.05, 0.35)
local v15, v16, v17, v18 = fn52(arg or arg3, arg3)
local v19 = fn53()
local v20 = tbl32[v19]
local position = arg3.Position
local n39 = position + v15 * math.max(0, v20 + n37 - n38)
local n40 = position + v15 * (v20 + n37)
local magnitude = v17.Magnitude
local heading = v18.Heading
if not heading then
local vector = Vector3.new(arg2.Position.X - position.X, 0, arg2.Position.Z - position.Z)
heading = vector.Magnitude > 0.1 and vector.Unit or Vector3.new(0, 0, 1)
end
local character = localPlayer.Character
local v21 = combat.Range(character and combat.PickBat(character) or nil)
local n41 = position + v17 * (n37 + v20 + n24 + n25) + (magnitude > 1 and v17.Unit * n27 * n26 or Vector3.zero)
local n42 = math.max(5, math.min(v21 * 0.7, 6 + magnitude * 0.07)) * n26
local now = os.clock()
local n43 = (math.sin(now * 2 * 3.1415926535897931 / n28) * 0.5 + 0.5) * n42
local n44 = math.sin(now * 2 * 3.1415926535897931 / n29) * n30
local vector = Vector3.new(-heading.Z, 0, heading.X)
if vector:Dot(arg2.Position - n41) < 0 then vector = -vector end
local n45 = n41 + heading * n43 + vector * (v16.Magnitude < n31 and 3 or 1.5) + Vector3.new(0, n44, 0)
local position2 = arg2.Position
if not arg4 then
position2 = combat.KeepOffWalls(arg2.Position, fn51(Vector3.new(n45.X, n45.Y, position.Z)))
end
return {Goal = position2, Velocity = Vector3.new(v17.X, 0, v17.Z), Face = n40, Current = n40, Historical = n39, Option = v19, Distance = (position - arg2.Position).Magnitude}
end
combat.Steer = function(arg, arg2, arg3, arg4, arg5)
local n37 = math.max(arg5, 0.0041666666666666666)
local velocity = arg2.Velocity
local n38 = velocity + (arg2.Goal - arg.Position) / math.max(0.12, n37)
local n39 = math.min(arg3 + velocity.Magnitude, arg4)
if n38.Magnitude > n39 then n38 = n38.Unit * n39 end
local position = arg.Position
local n40 = position + n38 * n37
local v15 = combat.KeepOffWalls(position, n40)
if (v15 - n40).Magnitude > 0.01 then n38 = (v15 - position) / n37 end
local v16 = combat.KeepOffWalls(position, position)
if (v16 - position).Magnitude > 0.01 then n38 = (v16 - position) / math.max(0.12, n37) end
local alv = n38 + Vector3.new(0, workspace.Gravity * n37 * 0.5, 0)
pcall(function()
local vector = Vector3.new(arg2.Face.X - position.X, 0, arg2.Face.Z - position.Z)
if vector.Magnitude > 0.05 then arg.CFrame = CFrame.lookAt(position, position + vector.Unit) end
arg.AssemblyLinearVelocity = alv
arg.AssemblyAngularVelocity = Vector3.zero
end)
end
combat.TryHit = function(arg, arg2)
fn54()
if workspace:GetAttribute("PvPDisabled") == true then return "Player hits are off right now" end
local character = localPlayer.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local v15 = combat.Humanoid(character)
if not humanoidRootPart or not v15 or v15.Health <= 0 then return "Waiting for your character" end
local v16 = combat.PickBat(character)
if not v16 then return "No bat found" end
if not fn45(character, v15, v16) then return "Equipping ".. tostring(v16:GetAttribute("GearName") or v16.Name) end
if not combat.Hittable(arg) or combat.Ragdolled(arg) then return nil end
arg2 = arg2 or combat.Plan(arg, humanoidRootPart)
if not arg2 then return nil end
local n37 = combat.Range(v16) - n23
local n38 = humanoidRootPart.Position - humanoidRootPart.AssemblyLinearVelocity * n24
if (arg2.Historical - n38).Magnitude > n37 and (arg2.Current - n38).Magnitude > n37 then return nil end
local v17 = fn42()
if not v17 then return nil end
local n39 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
local n40 = tonumber(v16:GetAttribute("CooldownEndTime")) or 0
if fn41() < n40 - n39 * 0.5 then return nil end
local lastFire = tbl34.LastFire
if os.clock() - lastFire < math.max(0.12, n39 * 1.5) then return nil end
tbl34.LastFire = os.clock()
tbl34.Trace = tbl34.Trace + 1
table.insert(tbl34.Pending, {Target = arg, Option = arg2.Option, At = os.clock(), Wait = math.max(0.5, n39 * 2 + 0.3), RagdollBefore = fn43(arg), CooldownBefore = n40, Tool = v16})
local str4 = string.format("%d:%d:%d", localPlayer.UserId, tbl34.Trace, math.floor(fn41() * 1000))
pcall(function() v17:FireServer(arg, str4) end)
return "Hitting ".. arg.DisplayName
end
combat.ReadyBat = function()
local character = localPlayer.Character
local v15 = combat.Humanoid(character)
if not character or not v15 or v15.Health <= 0 then return false end
local v16 = combat.PickBat(character)
return v16 ~= nil and fn45(character, v15, v16)
end
combat.Swing = function()
if tbl4.Steal.Active or tbl4.Steal.Carrying then return false end
local lastFire = tbl34.LastFire
local flag4 = os.clock() - lastFire < 0.3
if not flag4 then flag4 = os.clock() - (tbl34.LastSwing or 0) < 0.15 end
if flag4 then return false end
local character = localPlayer.Character
local v15 = combat.Humanoid(character)
if not character or not v15 or v15.Health <= 0 then return false end
local v16 = combat.PickBat(character)
if not v16 or not fn45(character, v15, v16) then return false end
tbl34.LastSwing = os.clock()
pcall(function() v16:Activate() end)
return true
end
combat.HolderOf = function(arg)
local v15 = workspace:FindFirstChild(arg)
if not v15 then return nil end
for _, descendant in ipairs(v15:GetDescendants()) do
if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
local ok, result, result2 = pcall(function() return descendant.Part0, descendant.Part1 end)
if ok then
for _, v16 in ipairs({result, result2}) do
if typeof(v16) == "Instance" and not v16:IsDescendantOf(v15) then
local model = v16:FindFirstAncestorOfClass("Model")
local playerFromCharacter
if model then playerFromCharacter = Players:GetPlayerFromCharacter(model) or Players:FindFirstChild(model.Name)
else playerFromCharacter = model end
playerFromCharacter = playerFromCharacter or nil
if playerFromCharacter and playerFromCharacter ~= localPlayer and playerFromCharacter:IsA("Player") then
return playerFromCharacter
end
end
end
end
end
end
return nil
end
task.spawn(function()
while not tbl4.CombatDisposed do
local holders = {}
if tbl4.CombatWantsHolders then
local eggState = tbl.EggState
if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
local ok, result = pcall(eggState.ReadFieldEggs)
local records = ok and type(result) == "table" and result.Records or nil
if type(records) == "table" then
for _, record in pairs(records) do
if type(record) == "table" and record.State == "Carried" and type(record.Uid) == "string" then
local v15 = combat.HolderOf(record.Uid)
if v15 then holders[v15] = true end
end
end
end
end
end
tbl34.Holders = holders
task.wait(0.3)
end
end)
combat.IsHolder = function(arg)
return tbl34.Holders[arg] == true
end
local tbl35 = {}
combat.OnNewLife = function(arg)
table.insert(tbl35, arg)
end
local function fn55()
table.clear(tbl34.Pending)
tbl34.LastFire = 0
tbl34.LastSwing = 0
tbl34.EquipAt = 0
table.clear(tbl34.Tracks)
table.clear(tbl34.WallSide)
tbl34.SpawnRagdoll = fn43(localPlayer)
for _, v15 in ipairs(tbl35) do pcall(v15) end
end
local characterAdded = localPlayer.CharacterAdded
local connect = characterAdded.Connect
local tbl36 = {localPlayer.CharacterRemoving:Connect(fn55), connect(characterAdded, fn55)}
fn4(function()
tbl4.CombatDisposed = true
for _, v15 in ipairs(tbl36) do pcall(function() v15:Disconnect() end) end
end)
end
-- Combat Tab
do
local combat2 = tbl4.Combat
local tbl32 = {"Nearest", "Egg Holders", "Specific Player"}
local n20 = 0.7
local str4 = "No other players"
local tbl33 = {
Handles = {},
AuraHandle = nil,
Row = nil,
Picker = nil,
TargetMode = tbl32[1],
Picked = nil,
LabelToName = {},
Speed = 400,
MaxSpeed = 750,
Target = nil,
Plan = nil,
Moving = false,
Status = "Idle",
Shown = nil,
NamesDirty = true,
}
local function fn41()
for i, v14 in ipairs(tbl32) do
if tbl4.Toggle(tbl33.Handles[i], false) then return v14 end
end
return nil
end
local function fn42()
return tbl4.Toggle(tbl33.AuraHandle, false) == true
end
tbl4.CombatActive = function()
return fn41() ~= nil or fn42()
end
local function fn43(arg)
if not combat2.Hittable(arg) then return false end
if tbl33.TargetMode == tbl32[2] then return combat2.IsHolder(arg) end
if tbl33.TargetMode == tbl32[3] then return tbl33.Picked ~= nil and arg.Name == tbl33.Picked end
return true
end
local function fn44(arg)
local target = tbl33.Target
local magnitude
if target and fn43(target) then
local v14, v15 = combat2.Parts(target)
magnitude = (v15.Position - arg).Magnitude
else
magnitude = math.huge
target = nil
end
local huge = math.huge
local v14 = nil
for _, player in ipairs(Players:GetPlayers()) do
if player ~= target and fn43(player) and not combat2.Ragdolled(player) then
local v15, v16 = combat2.Parts(player)
local magnitude2 = (v16.Position - arg).Magnitude
if magnitude2 < huge then
huge = magnitude2
v14 = player
end
end
end
if target then
if v14 and not combat2.Ragdolled(target) and huge < magnitude * n20 then return v14 end
return target
end
return v14
end
local function fn45(arg, arg2)
local v14 = nil
for _, player in ipairs(Players:GetPlayers()) do
if player ~= localPlayer then
local character = player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
local magnitude = (humanoidRootPart.Position - arg).Magnitude
if magnitude < arg2 and combat2.Hittable(player) and not combat2.Ragdolled(player) then
arg2 = magnitude
v14 = player
end
end
end
end
return v14, arg2
end
local function fn46()
tbl33.Plan = nil
if tbl33.Moving then
tbl33.Moving = false
tbl4.EndFlight()
tbl4.GodMode(false)
tbl4.Shield("combat", false)
combat2.ResetWalls()
end
tbl4.ReleaseMovement("combat")
end
combat2.OnNewLife(function()
tbl33.AuraVictim = nil
tbl33.Target = nil
tbl33.Plan = nil
pcall(fn46)
end)
local function fn47()
local movement = tbl4.Movement
return tbl4.Steal.Active or tbl4.Steal.Carrying or tbl4.Steal.Wanted and tbl4.Toggle(v5, false) or movement.Owner ~= nil and movement.Owner ~= "combat" and movement.Owner ~= "treadmill"
end
local function fn48(arg)
local character = localPlayer.Character
local n21 = combat2.Range(character and combat2.PickBat(character) or nil) + 6
local v14, v15 = fn45(arg.Position, n21 + 24)
if not v14 or v15 > n21 then
tbl33.AuraVictim = nil
if v14 then combat2.ReadyBat() end
tbl33.Status = "Aura ready, nobody in reach"
return
end
tbl33.AuraVictim = v14
tbl33.Status = combat2.TryHit(v14, combat2.Plan(v14, arg, nil, true)) or "Aura on ".. v14.DisplayName
end
local function fn49()
local v14 = fn41()
if v14 and v14 ~= tbl33.TargetMode then
tbl33.TargetMode = v14
tbl33.Target = nil
end
tbl4.CombatWantsHolders = v14 == tbl32[2]
local v15 = fn42()
local flag4 = not v14
if flag4 then
if tbl33.Target or tbl33.Moving then
tbl33.Target = nil
fn46()
end
end
if flag4 and not v15 then
tbl33.Status = "Idle"
return
end
local character = localPlayer.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local v16 = combat2.Humanoid(character)
if not humanoidRootPart or not v16 or v16.Health <= 0 then
tbl33.Target = nil
fn46()
tbl33.Status = "Waiting for your character"
return
end
if flag4 then
fn48(humanoidRootPart)
return
end
local v17 = fn44(humanoidRootPart.Position)
tbl33.Target = v17
if not v17 then
fn46()
if v15 then fn48(humanoidRootPart); return end
tbl33.Status = v14 == tbl32[2] and "Waiting for someone to hold an egg" or v14 == tbl32[3] and "Picked player is not reachable" or "No player to hit"
return
end
local v18 = combat2.Plan(v17, humanoidRootPart)
local flag5 = v14 ~= tbl32[2]
if not fn47() and (flag5 or not combat2.SelfRagdolled()) and tbl4.ClaimMovement("combat") and not tbl4.AntiGuard.Busy then
if not tbl33.Moving then
tbl33.Moving = true
tbl4.Shield("combat", true)
tbl4.GodMode(true)
tbl4.BeginFlight()
end
tbl4.GodTick()
tbl33.Plan = v18
else
if tbl33.Moving then fn46() end
tbl33.Plan = nil
end
local v19 = combat2.TryHit(v17, v18, flag5)
local n21 = v18 and math.floor(v18.Distance + 0.5) or 0
if v19 then
tbl33.Status = v19.. string.format("  %d studs", n21)
elseif fn47() then
tbl33.Status = string.format("Waiting for Auto Steal, near %s", v17.DisplayName)
else
tbl33.Status = string.format("Chasing %s  %d studs", v17.DisplayName, n21)
end
end
local function fn50()
local tbl34 = {}
for _, player in ipairs(Players:GetPlayers()) do
if player ~= localPlayer then table.insert(tbl34, player) end
end
table.sort(tbl34, function(arg, arg2)
return string.lower(arg.DisplayName) < string.lower(arg2.DisplayName)
end)
local tbl35 = {}
for _, v14 in ipairs(tbl34) do
tbl35[v14.DisplayName] = (tbl35[v14.DisplayName] or 0) + 1
end
local tbl36 = {}
local tbl37 = {}
for _, v14 in ipairs(tbl34) do
local displayName = v14.DisplayName
if tbl35[displayName] > 1 then
displayName = string.format("%s (@%s)", v14.DisplayName, v14.Name)
end
table.insert(tbl36, displayName)
tbl37[displayName] = v14.Name
end
if #tbl36 == 0 then tbl36[1] = str4 end
return tbl36, tbl37
end
local function fn51(arg)
for k, v14 in pairs(tbl33.LabelToName) do
if v14 == arg then return k end
end
return nil
end
local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
local plan = tbl33.Plan
if not plan or not tbl33.Moving then return end
local v14 = tbl4.Root()
if v14 then combat2.Steer(v14, plan, tbl33.Speed, math.max(tbl33.Speed, tbl33.MaxSpeed), deltaTime) end
end)
local n21 = 0.05
local n22 = 0
local connection3 = RunService.Heartbeat:Connect(function()
local flag4 = fn41() ~= nil
local v14 = fn42()
if not v14 then tbl33.AuraVictim = nil end
local now = os.clock()
if flag4 or not v14 or now >= n22 then
if v14 and not flag4 then n22 = now + n21 end
if not pcall(fn49) then tbl33.Status = "Retrying" end
end
if flag4 or v14 and tbl33.AuraVictim ~= nil then pcall(combat2.Swing) end
local row = tbl33.Row
if row and tbl33.Shown ~= tbl33.Status and type(row.Set) == "function" then
tbl33.Shown = tbl33.Status
pcall(row.Set, row, tbl33.Status)
end
local picker = tbl33.Picker
if tbl33.NamesDirty and picker and type(picker.SetOptions) == "function" then
tbl33.NamesDirty = false
local v15, v16 = fn50()
tbl33.LabelToName = v16
pcall(picker.SetOptions, picker, v15, tbl33.Picked and fn51(tbl33.Picked) or v15[1], false)
end
end)
local connection4 = Players.PlayerAdded:Connect(function() tbl33.NamesDirty = true end)
local connection5 = Players.PlayerRemoving:Connect(function(player)
tbl33.NamesDirty = true
if tbl33.Target == player then tbl33.Target = nil end
end)
fn4(function()
for _, v14 in ipairs({connection2, connection3, connection4, connection5}) do
pcall(function() v14:Disconnect() end)
end
tbl33.Target = nil
fn46()
end)
local function fn52(arg, arg2)
if tbl4.Toggle(arg, false) and tbl4.Toggle(tbl4.InvisibilityHandle, false) then
tbl4.UiDefer(function()
pcall(arg.Set, arg, false, false)
tbl4.Notify(arg2, "Turn off Invisibility first, both cannot be on at the same time")
end)
return true
end
return false
end
tbl33.Row = v13:CreateText({Name = "Hit Status", Text = "Idle"})
local v14 = v2:CreateExclusiveGroup({Name = "Zyro Combat Targets", MaxActive = 1})
for i, v15 in ipairs({"Auto Hit Nearest Player", "Auto Hit Egg Holders", "Auto Hit Specific Player"}) do
local v16 = nil
v16 = v13:CreateToggle({
Name = v15,
Default = false,
Callback = function() fn52(v16, v15) end,
})
pcall(v16.JoinExclusiveGroup, v16, v14)
tbl33.Handles[i] = v16
end
local v15, v16 = fn50()
tbl33.LabelToName = v16
tbl33.Picker = v13:CreateDropdown({
Name = "Hit Player",
Options = v15,
Default = v15[1],
SubOf = tbl33.Handles[3],
Callback = function(arg)
tbl33.Picked = tbl33.LabelToName[tostring(arg)]
tbl33.Target = nil
end,
})
tbl33.AuraHandle = v13:CreateToggle({
Name = "Hit Aura",
Default = false,
Callback = function() fn52(tbl33.AuraHandle, "Hit Aura") end,
})
pcall(tbl33.AuraHandle.JoinExclusiveGroup, tbl33.AuraHandle, v14)
local v17 = v13:CreateLabel({Name = "Chase Settings", Text = "Chase Settings"})
v13:CreateSlider({
Name = "Hit Tween Speed", SubOf = v17, Min = 100, Max = 1000, Default = 400, Increment = 10, Unit = "studs/s",
Callback = function(arg) tbl33.Speed = math.clamp(tonumber(arg) or 400, 100, 1000) end,
})
v13:CreateSlider({
Name = "Hit Max Speed", SubOf = v17, Min = 100, Max = 1000, Default = 750, Increment = 10, Unit = "studs/s",
Callback = function(arg) tbl33.MaxSpeed = math.clamp(tonumber(arg) or 750, 100, 1000) end,
})
v13:CreateSlider({
Name = "Hit Lead", SubOf = v17, Note = "Stand further ahead of the target (+) or closer to them (-)",
Min = -400, Max = 100, Default = -275, Increment = 1,
Callback = function(arg) combat2.SetLead(arg) end,
})
v13:CreateSlider({
Name = "Hit Sweep", SubOf = v17, Note = "How far you move back and forth in front of the target",
Min = 0, Max = 250, Default = 60, Increment = 1, Unit = "%",
Callback = function(arg) combat2.SetSweep(arg) end,
})
end
-- ESP (setup básico)
espSection = tbl4.EspSection
local function fn41(arg, arg2)
local ok, result = pcall(Font.new, arg, arg2, Enum.FontStyle.Normal)
return ok and result or nil
end
local tbl6_esp = {
MainFont = fn41("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
StatusFont = fn41("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular),
Sequence = function(arg)
local v14 = table.create(#arg)
for i, v15 in ipairs(arg) do v14[i] = ColorSequenceKeypoint.new(v15[1], v15[2]) end
return ColorSequence.new(v14)
end,
}
local color = Color3.fromRGB
local sequence = tbl6_esp.Sequence
local palettes = {}
do
local gold = {}
local tbl32 = {}
tbl32[1] = {0, color(255, 231, 158)}
tbl32[2] = {0.4, color(255, 196, 66)}
tbl32[3] = {1, color(214, 142, 12)}
gold.Text = sequence(tbl32)
local tbl36 = {}
tbl36[1] = {0, color(122, 76, 0)}
tbl36[2] = {0.55, color(62, 38, 0)}
tbl36[3] = {1, color(20, 12, 0)}
gold.Stroke = sequence(tbl36)
gold.Outline = color(255, 232, 152)
palettes.Gold = gold
end
do
local orange = {}
local tbl32 = {}
tbl32[1] = {0, color(255, 198, 132)}
tbl32[2] = {0.4, color(255, 146, 40)}
tbl32[3] = {1, color(206, 92, 0)}
orange.Text = sequence(tbl32)
local tbl36 = {}
tbl36[1] = {0, color(112, 54, 0)}
tbl36[2] = {0.55, color(56, 27, 0)}
tbl36[3] = {1, color(18, 8, 0)}
orange.Stroke = sequence(tbl36)
orange.Outline = color(255, 194, 112)
palettes.Orange = orange
end
do
local red = {}
local tbl32 = {}
tbl32[1] = {0, color(255, 105, 105)}
tbl32[2] = {0.4, color(255, 28, 40)}
tbl32[3] = {1, color(184, 0, 18)}
red.Text = sequence(tbl32)
local tbl36 = {}
tbl36[1] = {0, color(124, 0, 15)}
tbl36[2] = {0.55, color(61, 0, 9)}
tbl36[3] = {1, color(18, 0, 3)}
red.Stroke = sequence(tbl36)
red.Outline = color(255, 128, 138)
palettes.Red = red
end
do
local accent = {}
local tbl32 = {}
tbl32[1] = {0, color(170, 255, 160)}
tbl32[2] = {0.45, color(58, 255, 55)}
tbl32[3] = {1, color(20, 109, 0)}
accent.Text = sequence(tbl32)
local tbl36 = {}
tbl36[1] = {0, color(10, 52, 6)}
tbl36[2] = {1, color(3, 16, 0)}
accent.Stroke = sequence(tbl36)
accent.Outline = color(58, 255, 55)
palettes.Accent = accent
end
do
local sheen = {}
local tbl32 = {}
tbl32[1] = {0, color(255, 255, 255)}
tbl32[2] = {0.5, color(222, 222, 222)}
tbl32[3] = {1, color(255, 255, 255)}
sheen.Text = sequence(tbl32)
local tbl36 = {}
tbl36[1] = {0, color(8, 8, 8)}
tbl36[2] = {1, color(8, 8, 8)}
sheen.Stroke = sequence(tbl36)
sheen.Outline = color(255, 255, 255)
palettes.Sheen = sheen
end
tbl6_esp.Palettes = palettes
tbl6_esp.PaletteFromColor = function(arg)
local color2 = Color3.new(1, 1, 1)
local color3 = Color3.new(0, 0, 0)
local tbl32 = {}
tbl32.Text = sequence({{0, arg:Lerp(color2, 0.5)}, {0.4, arg:Lerp(color2, 0.1)}, {1, arg:Lerp(color3, 0.25)}})
tbl32.Stroke = sequence({{0, arg:Lerp(color3, 0.55)}, {0.55, arg:Lerp(color3, 0.75)}, {1, arg:Lerp(color3, 0.92)}})
tbl32.Outline = arg:Lerp(color2, 0.25)
return tbl32
end
-- ESP Finalize
if type(espSection.CreateToggle) == "function" then
-- (Placeholder: ESP eggs/players configurado no Bloco 1)
end
-- Auto Buy Scramble Shop (que ficou pendente no Extra B)
if v7 and type(v7.CreateToggle) == "function" and tbl26 and tbl26.Handle then
-- (Já criado no Extra B)
end
-- Finalize
v:Finalize({Window = v2, MainTab = defaultTab, ShowMainTab = true})
-- Auto Load Script (loader final)
task.spawn(function()
task.wait(20)
local str = "\0zyro_guard"
local genv = typeof(getgenv) == "function" and getgenv() or _G
local function fn19()
local v15 = genv[str]
if type(v15) == "table" and type(v15.Ask) == "function" then return v15 end
return nil
end
local v15 = fn19()
if not v15 then
task.spawn(function()
local v16 = nil
for i = 1, 4 do
task.wait()
local ok, result = pcall(function()
local v17 = v16
local response
if v16 then response = v17
else response = game:HttpGet("https://raw.githubusercontent.com/ZyroHub/zyrohub/main/ZyroGD") end
v16 = response
local chunk, v18 = loadstring(v16)
assert(chunk, v18)
return chunk()
end)
if ok then
fn("guard: loader ran on try ".. i)
return
end
if type(result) == "string" and string.find(result, "HttpGet", 1, true) then v16 = nil end
fn("guard: loader try ".. i.. " failed: ".. tostring(result))
task.wait(1 + i)
end
end)
local n14 = os.clock() + 30
while true do
task.wait(0.25)
v15 = fn19()
if not(v15 or os.clock() > n14) then continue end
break
end
end
local flag4 = false
if v15 then
local result
flag4, result = pcall(v15.Ask, "v202")
flag4 = flag4 and type(result) == "string" and #result > 0
end
genv[str] = nil
if flag4 then return end
pcall(function()
local zyroHubSaeCleanup = genv.ZyroHubSaeCleanup
if type(zyroHubSaeCleanup) == "function" then zyroHubSaeCleanup() end
end)
genv.ZyroHubSaeCleanup = nil
end)
-- Restore Steal Panel
task.defer(function()
for i = 1, 3 do RunService.Heartbeat:Wait() end
if type(tbl4.RestoreStealPanel) == "function" then
pcall(tbl4.RestoreStealPanel)
end
end)
-- ============================================================
-- FIM DO ZYRO HUB
-- Discord: discord.gg/YjEa2NSbTX
-- ============================================================
