-- ZYRO TP - Versão simples que FUNCIONA
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

-- Pega o EggState do jogo
local EggState
pcall(function()
    EggState = require(ReplicatedStorage.Client.EggState)
end)

-- Função de TP (o que o Chilli faz por baixo)
local function teleportar(pos)
    if not pos then return false end
    local char = lp.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    
    -- Move o personagem
    pcall(function()
        char:PivotTo(CFrame.new(pos + Vector3.new(0, 3, 0)))
    end)
    
    -- Reforça no root (o que o Chilli faz)
    pcall(function()
        root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
    
    return true
end

-- Pega o melhor ovo
local function getBestEgg()
    if type(EggState) ~= "table" or type(EggState.ReadFieldEggs) ~= "function" then
        return nil
    end
    local ok, result = pcall(EggState.ReadFieldEggs)
    if not ok or type(result) ~= "table" or type(result.Records) ~= "table" then
        return nil
    end
    
    local melhor = nil
    local melhorValor = -1
    for _, record in pairs(result.Records) do
        if type(record) == "table" 
            and record.Uid 
            and (record.State == "Slot" or record.State == "Dropped")
            and typeof(record.BottomCFrame) == "CFrame" then
            -- Pega raridade
            local rarity = 0
            pcall(function()
                local dir = require(ReplicatedStorage.Data.Assets).Directory
                local asset = dir[record.AssetCategory]
                if asset and asset.Rarity then
                    rarity = tonumber(asset.Rarity.RarityNumber or asset.Rarity.Rank) or 0
                end
            end)
            local scale = tonumber(record.AssetScale) or 1
            local valor = rarity * 1000 + scale
            if valor > melhorValor then
                melhorValor = valor
                melhor = record
            end
        end
    end
    return melhor
end

-- Pega a posição Home (base)
local function getHome()
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
    return Vector3.new(528.7, 70.57, -364.11)
end

-- ============================================================
-- UI
-- ============================================================
local sg = Instance.new("ScreenGui")
sg.Name = "ZyroTP"
sg.ResetOnSpawn = false
sg.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 160)
frame.Position = UDim2.new(0, 20, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 72, 72)
stroke.Thickness = 1.5
stroke.Parent = frame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "ZYRO HUB"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Botão TP Steal
local btnSteal = Instance.new("TextButton")
btnSteal.Size = UDim2.new(0.9, 0, 0, 38)
btnSteal.Position = UDim2.new(0.05, 0, 0, 40)
btnSteal.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
btnSteal.Text = "TP STEAL BEST EGG"
btnSteal.TextColor3 = Color3.new(1,1,1)
btnSteal.TextSize = 13
btnSteal.Font = Enum.Font.GothamBold
btnSteal.Parent = frame

local c1 = Instance.new("UICorner")
c1.CornerRadius = UDim.new(0, 8)
c1.Parent = btnSteal

-- Botão TP Home
local btnHome = Instance.new("TextButton")
btnHome.Size = UDim2.new(0.9, 0, 0, 38)
btnHome.Position = UDim2.new(0.05, 0, 0, 85)
btnHome.BackgroundColor3 = Color3.fromRGB(40, 80, 180)
btnHome.Text = "TP HOME"
btnHome.TextColor3 = Color3.new(1,1,1)
btnHome.TextSize = 13
btnHome.Font = Enum.Font.GothamBold
btnHome.Parent = frame

local c2 = Instance.new("UICorner")
c2.CornerRadius = UDim.new(0, 8)
c2.Parent = btnHome

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -22)
status.BackgroundTransparency = 1
status.Text = "Pronto"
status.TextColor3 = Color3.fromRGB(180, 180, 200)
status.TextSize = 11
status.Font = Enum.Font.Gotham
status.Parent = frame

-- ============================================================
-- Ações dos botões
-- ============================================================
btnSteal.MouseButton1Click:Connect(function()
    status.Text = "Procurando ovo..."
    status.TextColor3 = Color3.fromRGB(255, 200, 100)
    
    local egg = getBestEgg()
    if not egg then
        status.Text = "Nenhum ovo encontrado"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    local pos = egg.BottomCFrame.Position
    local ok = teleportar(pos)
    if ok then
        status.Text = "TP feito: ".. tostring(egg.AssetCategory)
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha no TP"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

btnHome.MouseButton1Click:Connect(function()
    status.Text = "Indo pra base..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    
    local pos = getHome()
    local ok = teleportar(pos)
    if ok then
        status.Text = "TP Home feito"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha no TP"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

print("[Zyro TP] Carregado!")
