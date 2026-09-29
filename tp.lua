-- ============================================================
-- ZYRO TP MENU
-- Discord: discord.gg/YjEa2NSbTX
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local localPlayer = Players.LocalPlayer

-- ============================================================
-- Setup do jogo (EggState, networking)
-- ============================================================
local networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")
local EggState = nil
pcall(function()
    EggState = require(ReplicatedStorage.Client.EggState)
end)

-- ============================================================
-- Helpers
-- ============================================================
local function getRoot()
    local char = localPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getStealHome()
    -- Posição home (safe zone / base)
    local paths = {
        {"GearGiver_Slap", "Podium"},
        {"World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"},
        {"__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"},
    }
    local offsets = {
        Vector3.new(-16.415, 21.072, -6.106),
        Vector3.new(-26.776, 1.75, 18.665),
        Vector3.new(-26.776, 1.75, 18.665),
    }
    for i, path in ipairs(paths) do
        local obj = workspace
        for _, name in ipairs(path) do
            obj = obj and obj:FindFirstChild(name)
        end
        if obj and obj:IsA("BasePart") then
            return obj.CFrame:PointToWorldSpace(offsets[i])
        end
    end
    return Vector3.new(528.7, 70.57, -364.11) -- fallback
end

local function getBestEgg()
    -- Retorna o melhor ovo do campo (maior valor)
    if type(EggState) ~= "table" or type(EggState.ReadFieldEggs) ~= "function" then
        return nil
    end
    local ok, result = pcall(EggState.ReadFieldEggs)
    if not ok or type(result) ~= "table" or type(result.Records) ~= "table" then
        return nil
    end
    local best = nil
    local bestValue = -1
    for _, record in pairs(result.Records) do
        if type(record) == "table"
            and record.Uid
            and (record.State == "Slot" or record.State == "Dropped")
            and typeof(record.BottomCFrame) == "CFrame"
        then
            local rarity = 0
            local ok2, asset = pcall(function()
                local dir = require(ReplicatedStorage.Data.Assets).Directory
                return dir[record.AssetCategory]
            end)
            if ok2 and type(asset) == "table" and type(asset.Rarity) == "table" then
                rarity = tonumber(asset.Rarity.RarityNumber or asset.Rarity.Rank) or 0
            end
            local scale = tonumber(record.AssetScale) or 1
            local value = rarity * 1000 + scale
            if value > bestValue then
                bestValue = value
                best = record
            end
        end
    end
    return best
end

local function tpTo(pos)
    if not pos then return false end
    local root = getRoot()
    if not root then return false end
    local char = localPlayer.Character
    -- Teleporta o personagem
    pcall(function()
        char:PivotTo(CFrame.new(pos + Vector3.new(0, 3, 0)))
    end)
    -- Também força o CFrame do root
    pcall(function()
        root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
    -- Tenta dar uma "sacudida" pra enganar o anti-cheat
    task.wait(0.05)
    pcall(function()
        root.CFrame = CFrame.new(pos + Vector3.new(0, 3.2, 0))
    end)
    return true
end

-- ============================================================
-- UI
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZyroTP"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.fromOffset(240, 170)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 72, 72)
UIStroke.Thickness = 1.5
UIStroke.Parent = Frame

-- Título
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 36)
Title.BackgroundTransparency = 1
Title.Text = "ZYRO HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

-- Subtítulo
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 16)
Subtitle.Position = UDim2.new(0, 0, 0, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Teleport Menu"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = Frame

-- Botão TP Steal Egg
local btnSteal = Instance.new("TextButton")
btnSteal.Name = "TPSteal"
btnSteal.Size = UDim2.new(0.85, 0, 0, 38)
btnSteal.Position = UDim2.new(0.075, 0, 0, 60)
btnSteal.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
btnSteal.BorderSizePixel = 0
btnSteal.Text = "🎯 TP STEAL EGG"
btnSteal.TextColor3 = Color3.fromRGB(255, 255, 255)
btnSteal.TextSize = 14
btnSteal.Font = Enum.Font.GothamBold
btnSteal.Parent = Frame

local btnStealCorner = Instance.new("UICorner")
btnStealCorner.CornerRadius = UDim.new(0, 8)
btnStealCorner.Parent = btnSteal

local btnStealStroke = Instance.new("UIStroke")
btnStealStroke.Color = Color3.fromRGB(255, 72, 72)
btnStealStroke.Thickness = 1
btnStealStroke.Parent = btnSteal

-- Botão TP Home
local btnHome = Instance.new("TextButton")
btnHome.Name = "TPHome"
btnHome.Size = UDim2.new(0.85, 0, 0, 38)
btnHome.Position = UDim2.new(0.075, 0, 0, 108)
btnHome.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
btnHome.BorderSizePixel = 0
btnHome.Text = "🏠 TP HOME"
btnHome.TextColor3 = Color3.fromRGB(255, 255, 255)
btnHome.TextSize = 14
btnHome.Font = Enum.Font.GothamBold
btnHome.Parent = Frame

local btnHomeCorner = Instance.new("UICorner")
btnHomeCorner.CornerRadius = UDim.new(0, 8)
btnHomeCorner.Parent = btnHome

local btnHomeStroke = Instance.new("UIStroke")
btnHomeStroke.Color = Color3.fromRGB(72, 200, 255)
btnHomeStroke.Thickness = 1
btnHomeStroke.Parent = btnHome

-- Status
local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Size = UDim2.new(1, 0, 0, 16)
Status.Position = UDim2.new(0, 0, 1, -20)
Status.BackgroundTransparency = 1
Status.Text = "Ready"
Status.TextColor3 = Color3.fromRGB(150, 150, 170)
Status.TextSize = 11
Status.Font = Enum.Font.Gotham
Status.Parent = Frame

-- ============================================================
-- Feedback visual
-- ============================================================
local function flash(btn, color)
    btn.BackgroundColor3 = color
    task.delay(0.25, function()
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    end)
end

local function setStatus(text, color)
    Status.Text = text
    Status.TextColor3 = color or Color3.fromRGB(150, 150, 170)
end

-- ============================================================
-- TP Steal Egg
-- ============================================================
btnSteal.MouseButton1Click:Connect(function()
    setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
    local egg = getBestEgg()
    if not egg then
        setStatus("Nenhum ovo encontrado!", Color3.fromRGB(255, 100, 100))
        flash(btnSteal, Color3.fromRGB(120, 40, 40))
        return
    end
    local pos = egg.BottomCFrame.Position
    setStatus("Teleportando...", Color3.fromRGB(255, 200, 100))
    local ok = tpTo(pos)
    if ok then
        setStatus("TP OK: ".. tostring(egg.AssetCategory), Color3.fromRGB(100, 255, 140))
        flash(btnSteal, Color3.fromRGB(40, 120, 60))
    else
        setStatus("Falha no TP", Color3.fromRGB(255, 100, 100))
        flash(btnSteal, Color3.fromRGB(120, 40, 40))
    end
end)

-- ============================================================
-- TP Home
-- ============================================================
btnHome.MouseButton1Click:Connect(function()
    setStatus("Indo pra base...", Color3.fromRGB(100, 200, 255))
    local pos = getStealHome()
    if not pos then
        setStatus("Base não encontrada!", Color3.fromRGB(255, 100, 100))
        flash(btnHome, Color3.fromRGB(120, 40, 40))
        return
    end
    local ok = tpTo(pos)
    if ok then
        setStatus("TP Home OK", Color3.fromRGB(100, 255, 140))
        flash(btnHome, Color3.fromRGB(40, 100, 140))
    else
        setStatus("Falha no TP", Color3.fromRGB(255, 100, 100))
        flash(btnHome, Color3.fromRGB(120, 40, 40))
    end
end)

-- ============================================================
-- FIM
-- ============================================================
print("[Zyro Hub] TP Menu carregado! Discord: discord.gg/YjEa2NSbTX")
