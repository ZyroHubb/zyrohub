-- ZYRO TP v3 - SIMPLES E A PROVA DE FALHAS
print("[Zyro] Iniciando...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

print("[Zyro] Services OK")

-- ============================================================
-- UI (faz primeiro pra garantir que aparece)
-- ============================================================
local parent = nil
pcall(function()
    parent = game:GetService("CoreGui")
end)
if not parent then
    parent = lp:WaitForChild("PlayerGui")
end

-- Remove UI antiga
pcall(function()
    local old = parent:FindFirstChild("ZyroTP")
    if old then old:Destroy() end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "ZyroTP"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() sg.Parent = parent end)

if not sg.Parent then
    warn("[Zyro] Nao consegui criar ScreenGui")
    return
end

print("[Zyro] ScreenGui OK")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 140)
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
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function criarBotao(texto, y, cor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = cor
    btn.Text = texto
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

local btnSteal = criarBotao("TP STEAL BEST EGG", 38, Color3.fromRGB(180, 40, 40))
local btnHome = criarBotao("TP HOME", 84, Color3.fromRGB(40, 80, 180))

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -22)
status.BackgroundTransparency = 1
status.Text = "UI OK - carregando logica..."
status.TextColor3 = Color3.fromRGB(180, 180, 200)
status.TextSize = 11
status.Font = Enum.Font.Gotham
status.Parent = frame

print("[Zyro] UI OK")

-- ============================================================
-- LOGICA (com pcall pra nao quebrar)
-- ============================================================
local EggState = nil
pcall(function()
    EggState = require(ReplicatedStorage:WaitForChild("Client", 5):WaitForChild("EggState", 5))
end)

local networking = nil
pcall(function()
    networking = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Networking", 5)
end)

local Assets = nil
pcall(function()
    Assets = require(ReplicatedStorage:WaitForChild("Data", 5):WaitForChild("Assets", 5))
end)

local Mutations = nil
pcall(function()
    Mutations = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("Modules", 5):WaitForChild("Mutations", 5))
end)

print("[Zyro] EggState:", EggState and "OK" or "FAIL")
print("[Zyro] networking:", networking and "OK" or "FAIL")
print("[Zyro] Assets:", Assets and "OK" or "FAIL")

-- ============================================================
-- DESYNC TP
-- ============================================================
local desyncState = {realHum = nil, fakeHum = nil, character = nil, active = false}

local function restoreDesync()
    if not desyncState.active then return end
    desyncState.active = false
    local char = desyncState.character or lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local real = desyncState.realHum
    local fake = desyncState.fakeHum
    if fake then pcall(function() fake:Destroy() end) end
    if real then
        real.Parent = char
        pcall(function()
            real.PlatformStand = false
            real.AutoRotate = true
            real.Sit = false
            real:ChangeState(Enum.HumanoidStateType.GettingUp)
        end)
        if workspace.CurrentCamera then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            workspace.CurrentCamera.CameraSubject = real
        end
    end
    if hrp then
        pcall(function()
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end)
    end
    desyncState.realHum = nil
    desyncState.fakeHum = nil
    desyncState.character = nil
end

local function applyDesync()
    if desyncState.active then return true end
    local char = lp.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local realHum = hum
    local fakeHum = hum:Clone()
    fakeHum.Name = "Humanoid"
    fakeHum.BreakJointsOnDeath = false
    fakeHum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    fakeHum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    fakeHum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    pcall(function() fakeHum:SetStateEnabled(Enum.HumanoidStateType.Physics, false) end)
    fakeHum.Health = fakeHum.MaxHealth
    pcall(function() fakeHum.RequiresNeck = false end)

    realHum.Parent = nil
    fakeHum.Parent = char
    fakeHum.PlatformStand = false
    fakeHum.Sit = false
    fakeHum.AutoRotate = true

    if workspace.CurrentCamera then
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        workspace.CurrentCamera.CameraSubject = fakeHum
    end

    desyncState.realHum = realHum
    desyncState.fakeHum = fakeHum
    desyncState.character = char
    desyncState.active = true

    fakeHum.StateChanged:Connect(function(_, new)
        if desyncState.fakeHum ~= fakeHum then return end
        if new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.Physics then
            fakeHum.PlatformStand = false
            fakeHum.Sit = false
            pcall(function() fakeHum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
        end
    end)

    return true
end

local function desyncTP(pos, speed)
    speed = speed or 500
    if not pos then return false, "pos nil" end
    local char = lp.Character
    if not char then return false, "sem char" end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false, "sem HRP" end

    applyDesync()
    RunService.Heartbeat:Wait()

    hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        restoreDesync()
        return false, "HRP sumiu"
    end

    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)

    local dist = (pos - hrp.Position).Magnitude
    local duration = math.max(dist / speed, 0.01)
    local targetCF = CFrame.new(pos)
    local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCF})
    tween:Play()
    tween.Completed:Wait()

    pcall(function()
        hrp.CFrame = targetCF
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)

    RunService.Heartbeat:Wait()
    restoreDesync()
    return true, "ok"
end

-- ============================================================
-- HELPERS
-- ============================================================
local function getScaleMult(scale)
    scale = tonumber(scale) or 1
    if scale <= 5 then return scale ^ 1.85 end
    return (scale / 5) ^ 1.2 * 19.637875755794113
end

local function getEggValue(record)
    if not Assets then return 0 end
    local data = Assets.Directory[record.AssetCategory]
    if not data then return 0 end
    local rate = tonumber(data.EarningRate) or 0
    local scale = tonumber(record.AssetScale) or 1
    local mutMult = 1
    if type(record.Mutations) == "table" and #record.Mutations > 0 and Mutations then
        local ok, r = pcall(Mutations.EarningsFor, record.Mutations)
        if ok and tonumber(r) then mutMult = tonumber(r) end
    end
    return rate * getScaleMult(scale) * mutMult
end

local function getBestEgg()
    -- Tenta EggState
    if EggState then
        local ok, result = pcall(function()
            return EggState.SyncFieldEggs()
        end)
        if ok and type(result) == "table" and type(result.Records) == "table" then
            local best, bestVal = nil, -1
            for _, rec in pairs(result.Records) do
                if type(rec) == "table" and rec.Uid and rec.BottomCFrame
                    and (rec.State == "Slot" or rec.State == "Dropped") then
                    local val = getEggValue(rec)
                    if val > bestVal then bestVal = val; best = rec end
                end
            end
            if best then return best, "ok (EggState)" end
        end
    end
    -- Tenta remote
    if networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
        if rf then
            local ok, r = pcall(function() return rf:InvokeServer() end)
            if ok and type(r) == "table" and type(r.Records) == "table" then
                local best, bestVal = nil, -1
                for _, rec in pairs(r.Records) do
                    if type(rec) == "table" and rec.Uid and rec.BottomCFrame
                        and (rec.State == "Slot" or rec.State == "Dropped") then
                        local val = getEggValue(rec)
                        if val > bestVal then bestVal = val; best = rec end
                    end
                end
                if best then return best, "ok (Remote)" end
            end
        end
    end
    return nil, "sem acesso a ovos"
end

local HOME_POS = Vector3.new(573.61, 70.52, -327.54)

-- ============================================================
-- BOTOES
-- ============================================================
local busy = false

btnSteal.MouseButton1Click:Connect(function()
    if busy then return end
    busy = true
    status.Text = "Procurando ovo..."
    status.TextColor3 = Color3.fromRGB(255, 200, 100)

    local egg, err = getBestEgg()
    if not egg then
        status.Text = "Erro: " .. tostring(err)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        warn("[Zyro] getBestEgg falhou:", err)
        busy = false
        return
    end

    status.Text = "TP para " .. tostring(egg.AssetCategory) .. "..."
    print("[Zyro] TP para", egg.AssetCategory, egg.BottomCFrame.Position)
    local ok, msg = desyncTP(egg.BottomCFrame.Position, 5000)
    if ok then
        status.Text = "OK: " .. tostring(egg.AssetCategory)
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha: " .. tostring(msg)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    busy = false
end)

btnHome.MouseButton1Click:Connect(function()
    if busy then return end
    busy = true
    status.Text = "Indo pra base..."
    status.TextColor3 = Color3.fromRGB(100, 200, 255)
    print("[Zyro] TP Home para", HOME_POS)
    local ok, msg = desyncTP(HOME_POS, 5000)
    if ok then
        status.Text = "TP Home OK"
        status.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        status.Text = "Falha: " .. tostring(msg)
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    busy = false
end)

status.Text = "PRONTO - clica em um botao"
status.TextColor3 = Color3.fromRGB(100, 255, 140)
print("[Zyro] TUDO CARREGADO!")
