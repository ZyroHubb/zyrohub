-- ZYRO TP - 3 botões
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

local EggState
pcall(function()
    EggState = require(ReplicatedStorage.Client.EggState)
end)

local function teleportar(pos)
    if not pos then return false end
    local char = lp.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    pcall(function()
        char:PivotTo(CFrame.new(pos + Vector3.new(0, 3, 0)))
    end)
    pcall(function()
        root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
    return true
end

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

-- Home / Safe Zone
local function getSeparationLine()
    local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
    world = world and world:FindFirstChild("Areas")
    return world and world:FindFirstChild("SeparationLine")
end

local function getSafeZonePos()
    local line = getSeparationLine()
    if not line or not line:IsA("BasePart") then
        return nil
    end
    return Vector3.new(line.Position.X - 7, line.Position.Y + 3, line.Position.Z)
end

local function getOwnPlot()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    local nomePlayer = string.lower(lp.Name)
    local nomeDisplay = string.lower(lp.DisplayName)
    for _, plot in ipairs(plots:GetChildren()) do
        local plotSign = plot:FindFirstChild("PlotSign")
        plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
        plotSign = plotSign and plotSign:FindFirstChild("Frame")
        local playerName = plotSign and plotSign:FindFirstChild("PlayerName")
        if playerName and playerName:IsA("TextLabel") then
            local texto = string.lower(playerName.Text)
            if texto == nomePlayer or texto == nomeDisplay then
                return plot
            end
        end
    end
    return nil
end

local function getPlotPos()
    local plot = getOwnPlot()
    if not plot then return nil end
    local ok, result = pcall(function()
        return plot:GetPivot().Position
    end)
    return ok and result or nil
end

-- ============================================================
-- UI
-- ============================================================
local sg = Instance.new("ScreenGui")
sg.Name = "ZyroTP"
sg.ResetOnSpawn = false
sg.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 190)
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

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "ZYRO HUB"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function criarBotao(texto, y, cor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 36)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = cor
    btn.Text = texto
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

local btnSteal = criarBotao("TP STEAL BEST EGG", 38, Color3.fromRGB(180, 40, 40))
local btnSafe  = criarBotao("TP SAFE ZONE",      80, Color3.fromRGB(40, 140, 180))
local btnHome  = criarBotao("TP HOME (PLOT)",   122, Color3.fromRGB(40, 80, 180))

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
-- Ações
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
    local ok = teleportar(egg.BottomCFrame.Position)
    if ok then
        status.Text = "TP OK: ".. tostring(egg.AssetCategory)
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

btnSafe.MouseButton1Click:Connect(function()
    status.Text = "Indo pra safe zone..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    local pos = getSafeZonePos()
    if not pos then
        status.Text = "Safe zone nao encontrada"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    local ok = teleportar(pos)
    if ok then
        status.Text = "TP Safe Zone OK"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

btnHome.MouseButton1Click:Connect(function()
    status.Text = "Procurando plot..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    local pos = getPlotPos()
    if not pos then
        status.Text = "Plot nao encontrado - use Safe Zone"
        status.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    local ok = teleportar(pos)
    if ok then
        status.Text = "TP Home OK"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

print("[Zyro TP] 3 botoes carregados!")
