-- ZYRO TP - Método REAL do Chilli (Humanoid Swap + TP)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

local EggState
pcall(function()
    EggState = require(ReplicatedStorage.Client.EggState)
end)

-- ============================================================
-- HUMAN SWAP (a chave do TP do Chilli)
-- ============================================================
local swapState = {Original = nil, Clone = nil, Links = {}}

local function undoSwap()
    for _, link in ipairs(swapState.Links) do
        pcall(function() link:Disconnect() end)
    end
    table.clear(swapState.Links)

    local char = lp.Character
    local orig = swapState.Original
    local clone = swapState.Clone
    swapState.Original = nil
    swapState.Clone = nil

    if orig and clone and char and orig.Parent == nil and clone.Parent == char then
        orig.Parent = char
        workspace.CurrentCamera.CameraSubject = orig
        pcall(function() clone:Destroy() end)
    end
end

local function isGrounded(humanoid)
    if not humanoid or humanoid.Health <= 0 or humanoid.FloorMaterial == Enum.Material.Air then
        return false
    end
    local state = humanoid:GetState()
    return state == Enum.HumanoidStateType.Running
        or state == Enum.HumanoidStateType.RunningNoPhysics
        or state == Enum.HumanoidStateType.Landed
end

local function doSwap()
    local char = lp.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end
    if swapState.Clone and swapState.Clone.Parent == char then return true end
    if not isGrounded(humanoid) then return false end

    local clone = humanoid:Clone()
    humanoid.Parent = nil
    clone.Parent = char
    workspace.CurrentCamera.CameraSubject = clone

    swapState.Original = humanoid
    swapState.Clone = clone

    table.insert(swapState.Links, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if clone.Parent ~= nil then clone.WalkSpeed = humanoid.WalkSpeed end
    end))

    table.insert(swapState.Links, clone.Died:Connect(function()
        undoSwap()
        local char2 = lp.Character
        if char2 and humanoid.Parent == nil then
            humanoid.Parent = char2
            workspace.CurrentCamera.CameraSubject = humanoid
        end
        pcall(function() clone:Destroy() end)
        humanoid.Health = 0
    end))

    return true
end

-- ============================================================
-- TP com método do Chilli
-- ============================================================
local function teleportar(pos)
    if not pos then return false, "pos nil" end
    local char = lp.Character
    if not char then return false, "no char" end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false, "no root" end

    -- 1) Ativa humanoid swap (tira o monitor do humanoid original)
    doSwap()

    -- 2) Espera um tick pro swap aplicar
    RunService.Heartbeat:Wait()

    -- 3) Pega o root de novo (pode ter mudado com o swap)
    root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false, "no root after swap" end

    -- 4) TP mantendo a rotação (igual Chilli faz)
    local rotation = root.CFrame.Rotation
    local targetCFrame = CFrame.new(pos + Vector3.new(0, 3, 0)) * rotation

    pcall(function()
        char:PivotTo(targetCFrame)
    end)
    pcall(function()
        root.CFrame = targetCFrame
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)

    -- 5) Espera um tick pra garantir
    RunService.Heartbeat:Wait()

    -- 6) Desativa swap (volta humanoid original)
    undoSwap()

    return true, "ok"
end

local function getBestEgg()
    if type(EggState) ~= "table" or type(EggState.ReadFieldEggs) ~= "function" then
        return nil, "EggState sem ReadFieldEggs"
    end
    local ok, result = pcall(EggState.ReadFieldEggs)
    if not ok or type(result) ~= "table" or type(result.Records) ~= "table" then
        return nil, "ReadFieldEggs falhou"
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
    if not melhor then return nil, "Nenhum ovo no campo" end
    return melhor, "ok"
end

-- ============================================================
-- Home / Safe Zone (mesmo método do Chilli)
-- ============================================================
local function getSeparationLine()
    local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
    world = world and world:FindFirstChild("Areas")
    return world and world:FindFirstChild("SeparationLine")
end

local function getSafeZonePos()
    local line = getSeparationLine()
    if not line or not line:IsA("BasePart") then
        return nil, "SeparationLine não encontrada"
    end
    -- Chilli usa: X do line - 7 (lado de fora)
    -- E mantém Y próximo do line
    local targetX = line.Position.X - 7
    local targetY = line.Position.Y + 3
    local targetZ = line.Position.Z
    return Vector3.new(targetX, targetY, targetZ), "ok"
end

local function getOwnPlot()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    local nome = string.lower(lp.Name)
    local disp = string.lower(lp.DisplayName)
    for _, plot in ipairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        sign = sign and sign:FindFirstChild("PlayerPlotSign")
        sign = sign and sign:FindFirstChild("Frame")
        local pl = sign and sign:FindFirstChild("PlayerName")
        if pl and pl:IsA("TextLabel") then
            local t = string.lower(pl.Text)
            if t == nome or t == disp then
                return plot
            end
        end
    end
    return nil
end

local function getPlotPos()
    local plot = getOwnPlot()
    if not plot then return nil, "plot não achado" end
    local ok, result = pcall(function() return plot:GetPivot().Position end)
    if not ok then return nil, "GetPivot falhou" end
    return result, "ok"
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
    local egg, err = getBestEgg()
    if not egg then
        status.Text = "Erro: ".. tostring(err)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    local pos = egg.BottomCFrame.Position
    local ok, msg = teleportar(pos)
    if ok then
        status.Text = "TP OK: ".. tostring(egg.AssetCategory)
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha: ".. tostring(msg)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

btnSafe.MouseButton1Click:Connect(function()
    status.Text = "Indo pra safe zone..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    local pos, err = getSafeZonePos()
    if not pos then
        status.Text = "Erro: ".. tostring(err)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    local ok, msg = teleportar(pos)
    if ok then
        status.Text = "TP Safe Zone OK"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha: ".. tostring(msg)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

btnHome.MouseButton1Click:Connect(function()
    status.Text = "Procurando plot..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    local pos, err = getPlotPos()
    if not pos then
        status.Text = "Erro: ".. tostring(err)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    local ok, msg = teleportar(pos)
    if ok then
        status.Text = "TP Home OK"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha: ".. tostring(msg)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

print("[Zyro TP] Carregado com HUMAN SWAP!")
