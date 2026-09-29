-- ZYRO AUTO STEAL v8 - TP em pedaços (anti-anti-cheat) + voar de volta
print("[Zyro] v8 iniciando...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

-- UI
local parent = nil
pcall(function() parent = game:GetService("CoreGui") end)
if not parent then parent = lp:WaitForChild("PlayerGui") end
pcall(function()
    local old = parent:FindFirstChild("ZyroTP")
    if old then old:Destroy() end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "ZyroTP"
sg.ResetOnSpawn = false
pcall(function() sg.Parent = parent end)
if not sg.Parent then warn("[Zyro] sem ScreenGui"); return end

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(260, 140)
frame.Position = UDim2.new(0, 20, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 72, 72)
stroke.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "ZYRO HUB"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Toggles iOS
local function criarToggle(texto, y, corAtivo)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -70, 0, 30)
    label.Position = UDim2.new(0, 12, 0, y)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(235, 235, 240)
    label.TextSize = 13
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local trilho = Instance.new("Frame")
    trilho.Size = UDim2.fromOffset(46, 24)
    trilho.Position = UDim2.new(1, -58, 0, y + 3)
    trilho.BackgroundColor3 = Color3.fromRGB(50, 50, 58)
    trilho.BorderSizePixel = 0
    trilho.Parent = frame
    Instance.new("UICorner", trilho).CornerRadius = UDim.new(1, 0)

    local bola = Instance.new("Frame")
    bola.Size = UDim2.fromOffset(18, 18)
    bola.Position = UDim2.new(0, 3, 0.5, -9)
    bola.BackgroundColor3 = Color3.fromRGB(200, 200, 205)
    bola.BorderSizePixel = 0
    bola.Parent = trilho
    Instance.new("UICorner", bola).CornerRadius = UDim.new(1, 0)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = trilho

    local ativo = false
    local function atualizar()
        if ativo then
            TweenService:Create(trilho, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3 = corAtivo}):Play()
            TweenService:Create(bola, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -21, 0.5, -9), BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
        else
            TweenService:Create(trilho, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3 = Color3.fromRGB(50, 50, 58)}):Play()
            TweenService:Create(bola, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = UDim2.new(0, 3, 0.5, -9), BackgroundColor3 = Color3.fromRGB(200, 200, 205)}):Play()
        end
    end

    btn.MouseButton1Click:Connect(function()
        ativo = not ativo
        atualizar()
        if _G._zyroCallbacks and _G._zyroCallbacks[texto] then
            _G._zyroCallbacks[texto](ativo)
        end
    end)

    return {
        Set = function(v) ativo = v; atualizar() end,
        Get = function() return ativo end,
    }
end

_G._zyroCallbacks = _G._zyroCallbacks or {}

local toggleAuto = criarToggle("Auto Steal", 38, Color3.fromRGB(50, 200, 90))
local toggleTP = criarToggle("TP pro melhor ovo", 76, Color3.fromRGB(200, 80, 80))

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -22)
status.BackgroundTransparency = 1
status.Text = "PRONTO"
status.TextColor3 = Color3.fromRGB(100, 255, 140)
status.TextSize = 10
status.Font = Enum.Font.Gotham
status.Parent = frame

local function setStatus(txt, color)
    status.Text = txt
    status.TextColor3 = color or Color3.fromRGB(180, 180, 200)
end

-- ============================================================
-- SETUP
-- ============================================================
local EggState, networking, Assets, Mutations
pcall(function() EggState = require(ReplicatedStorage:WaitForChild("Client", 5):WaitForChild("EggState", 5)) end)
pcall(function() networking = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Networking", 5) end)
pcall(function() Assets = require(ReplicatedStorage:WaitForChild("Data", 5):WaitForChild("Assets", 5)) end)
pcall(function() Mutations = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("Modules", 5):WaitForChild("Mutations", 5)) end)

-- Waypoints do Lennon (usados pra voltar)
local WP = {
    [1] = Vector3.new(3340.17, 70.52, -331.08),
    [2] = Vector3.new(2894.71, 75.64, -327.45),
    [3] = Vector3.new(1923.22, 75.64, -330.11),
    [4] = Vector3.new(767.54, 70.51, -327.81),
    [5] = Vector3.new(596.65, 70.52, -316.80),
    [6] = Vector3.new(573.61, 70.52, -327.54),
    [7] = Vector3.new(540.18, 70.52, -356.74),
}

-- ============================================================
-- DESYNC
-- ============================================================
local ds = {real=nil, fake=nil, char=nil, active=false}

local function restoreDS()
    if not ds.active then return end
    ds.active = false
    local char = ds.char or lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if ds.fake then pcall(function() ds.fake:Destroy() end) end
    if ds.real then
        ds.real.Parent = char
        pcall(function()
            ds.real.PlatformStand = false
            ds.real.AutoRotate = true
            ds.real.Sit = false
            ds.real:ChangeState(Enum.HumanoidStateType.GettingUp)
        end)
        if workspace.CurrentCamera then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            workspace.CurrentCamera.CameraSubject = ds.real
        end
    end
    if hrp then pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end) end
    ds.real = nil; ds.fake = nil; ds.char = nil
end

local function applyDS()
    if ds.active then return true end
    local char = lp.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local real = hum
    local fake = hum:Clone()
    fake.Name = "Humanoid"
    fake.BreakJointsOnDeath = false
    fake:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    fake:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    fake:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    pcall(function() fake:SetStateEnabled(Enum.HumanoidStateType.Physics, false) end)
    fake.Health = fake.MaxHealth
    pcall(function() fake.RequiresNeck = false end)

    real.Parent = nil
    fake.Parent = char
    fake.PlatformStand = false
    fake.Sit = false
    fake.AutoRotate = true

    if workspace.CurrentCamera then
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        workspace.CurrentCamera.CameraSubject = fake
    end

    ds.real = real; ds.fake = fake; ds.char = char; ds.active = true

    fake.StateChanged:Connect(function(_, new)
        if ds.fake ~= fake then return end
        if new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.Physics then
            fake.PlatformStand = false
            fake.Sit = false
            pcall(function() fake:ChangeState(Enum.HumanoidStateType.GettingUp) end)
        end
    end)
    return true
end

-- ============================================================
-- TP SEGMENTADO (a chave do anti-anti-cheat)
-- Em vez de um TP gigante, quebra em pedaços de ~500 studs
-- ============================================================
local function tpSegmentado(destino, maxSegmento)
    maxSegmento = maxSegmento or 500
    local char = lp.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    applyDS()
    RunService.Heartbeat:Wait()

    local seguranca = 0
    while seguranca < 50 do
        seguranca = seguranca + 1
        char = lp.Character
        if not char then break end
        hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then break end

        local myPos = hrp.Position
        local vector = Vector3.new(destino.X - myPos.X, 0, destino.Z - myPos.Z)
        local dist = vector.Magnitude

        if dist < 5 then
            -- chegou
            pcall(function()
                hrp.CFrame = CFrame.new(destino)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end)
            return true
        end

        -- Ponto intermediário
        local step = math.min(dist, maxSegmento)
        local dir = vector.Unit
        local nextPos = Vector3.new(
            myPos.X + dir.X * step,
            destino.Y,  -- Y do destino (pra não cair)
            myPos.Z + dir.Z * step
        )

        -- Tween do segmento (velocidade moderada)
        local duration = math.max(step / 1200, 0.15)
        local targetCF = CFrame.new(nextPos)
        local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCF})
        tween:Play()

        local timedOut = false
        task.delay(5, function() timedOut = true end)
        while tween.PlaybackState == Enum.PlaybackState.Playing and not timedOut do
            RunService.Heartbeat:Wait()
        end

        pcall(function()
            hrp.CFrame = targetCF
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end)
        RunService.Heartbeat:Wait()
    end
    return false
end

-- ============================================================
-- HELPERS
-- ============================================================
local function scaleMult(s)
    s = tonumber(s) or 1
    if s <= 5 then return s ^ 1.85 end
    return (s / 5) ^ 1.2 * 19.637875755794113
end

local function eggValue(rec)
    if not Assets then return 0 end
    local d = Assets.Directory[rec.AssetCategory]
    if not d then return 0 end
    local rate = tonumber(d.EarningRate) or 0
    local s = tonumber(rec.AssetScale) or 1
    local m = 1
    if type(rec.Mutations) == "table" and #rec.Mutations > 0 and Mutations then
        local ok, r = pcall(Mutations.EarningsFor, rec.Mutations)
        if ok and tonumber(r) then m = tonumber(r) end
    end
    return rate * scaleMult(s) * m
end

local function getBestEgg()
    if EggState then
        local ok, r = pcall(function() return EggState.SyncFieldEggs() end)
        if ok and type(r) == "table" and type(r.Records) == "table" then
            local best, bv = nil, -1
            for _, rec in pairs(r.Records) do
                if type(rec) == "table" and rec.Uid and rec.BottomCFrame
                    and (rec.State == "Slot" or rec.State == "Dropped") then
                    local v = eggValue(rec)
                    if v > bv then bv = v; best = rec end
                end
            end
            if best then return best end
        end
    end
    if networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
        if rf then
            local ok, r = pcall(function() return rf:InvokeServer() end)
            if ok and type(r) == "table" and type(r.Records) == "table" then
                local best, bv = nil, -1
                for _, rec in pairs(r.Records) do
                    if type(rec) == "table" and rec.Uid and rec.BottomCFrame
                        and (rec.State == "Slot" or rec.State == "Dropped") then
                        local v = eggValue(rec)
                        if v > bv then bv = v; best = rec end
                    end
                end
                if best then return best end
            end
        end
    end
    return nil
end

local function carryEgg(uid)
    if EggState and type(EggState.CarryFieldEgg) == "function" then
        local ok, r = pcall(EggState.CarryFieldEgg, uid)
        if ok and r ~= false then return true end
    end
    if networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
        if rf then
            local ok, r = pcall(function()
                return rf:InvokeServer({Uid = uid})
            end)
            if ok and r == true then return true end
        end
    end
    return false
end

-- ============================================================
-- AUTO STEAL v8
-- ============================================================
local autoRunning = false

_G._zyroCallbacks["Auto Steal"] = function(ativo)
    if ativo then
        if autoRunning then return end
        autoRunning = true
        task.spawn(function()
            while autoRunning do
                -- 1) Achar ovo
                setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
                local egg = getBestEgg()
                if not egg then
                    setStatus("Sem ovo, esperando...", Color3.fromRGB(255, 100, 100))
                    task.wait(2)
                    continue
                end

                -- 2) TP pro ovo SEGMENTADO (não morre)
                setStatus("Voando p/ " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 200, 255))
                local posOvo = egg.BottomCFrame.Position
                tpSegmentado(posOvo, 500)
                if not autoRunning then break end
                task.wait(0.3)

                -- 3) Spam carry
                setStatus("Pegando ovo...", Color3.fromRGB(255, 200, 100))
                local carried = false
                for i = 1, 20 do
                    if not autoRunning then break end
                    if carryEgg(egg.Uid) then
                        carried = true
                        break
                    end
                    task.wait(0.05)
                end
                if not carried then
                    setStatus("Nao peguei, tentando de novo", Color3.fromRGB(255, 100, 100))
                    task.wait(0.5)
                    continue
                end
                setStatus("Ovo na mao!", Color3.fromRGB(100, 255, 140))

                -- 4) Volta VOANDO (igual Lennon) - segmentado
                task.wait(0.3)
                
                -- WP4 (mais próximo do ovo)
                setStatus("Voando p/ WP4...", Color3.fromRGB(100, 200, 255))
                tpSegmentado(WP[4], 500)
                if not autoRunning then break end

                -- WP5
                setStatus("Voando p/ WP5...", Color3.fromRGB(100, 200, 255))
                tpSegmentado(WP[5], 500)
                if not autoRunning then break end

                -- WP6
                setStatus("Voando p/ WP6...", Color3.fromRGB(100, 200, 255))
                tpSegmentado(WP[6], 500)
                if not autoRunning then break end

                -- WP7 (Forest)
                setStatus("Voando p/ WP7 (Forest)...", Color3.fromRGB(100, 200, 255))
                tpSegmentado(WP[7], 500)
                if not autoRunning then break end

                -- 5) Cruza a safe zone (X+)
                setStatus("Cruzando safe zone...", Color3.fromRGB(100, 255, 140))
                local char = lp.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local safeZone = hrp.Position + Vector3.new(60, 0, 0)
                    tpSegmentado(safeZone, 300)
                end

                setStatus("Ciclo ok! Reiniciando...", Color3.fromRGB(100, 255, 140))
                task.wait(0.5)
            end
        end)
    else
        autoRunning = false
        setStatus("Auto Steal parado", Color3.fromRGB(255, 200, 100))
        restoreDS()
    end
end

-- ============================================================
-- TP PRO MELHOR OVO (segmentado também)
-- ============================================================
_G._zyroCallbacks["TP pro melhor ovo"] = function(ativo)
    if ativo then
        setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
        local egg = getBestEgg()
        if not egg then
            setStatus("Sem ovo", Color3.fromRGB(255, 100, 100))
            toggleTP.Set(false)
            return
        end
        setStatus("Voando p/ " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 200, 255))
        tpSegmentado(egg.BottomCFrame.Position, 500)
        task.wait(0.3)
        restoreDS()
        setStatus("OK: " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 255, 140))
        toggleTP.Set(false)
    end
end

print("[Zyro] v8 carregado! TP segmentado ativo.")
