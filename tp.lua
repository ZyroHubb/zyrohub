-- ZYRO AUTO STEAL - ciclo completo
print("[Zyro] Auto Steal v5 iniciando...")

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
frame.Size = UDim2.fromOffset(240, 180)
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

local function btn(texto, y, cor)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 36)
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.BackgroundColor3 = cor
    b.Text = texto
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

local btnAuto = btn("AUTO STEAL (ciclo)", 38, Color3.fromRGB(180, 40, 40))
local btnSteal = btn("TP pro melhor ovo", 78, Color3.fromRGB(140, 60, 40))
local btnHome = btn("TP pra Forest", 118, Color3.fromRGB(40, 80, 180))

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -22)
status.BackgroundTransparency = 1
status.Text = "PRONTO"
status.TextColor3 = Color3.fromRGB(100, 255, 140)
status.TextSize = 10
status.Font = Enum.Font.Gotham
status.Parent = frame

-- ============================================================
-- SETUP
-- ============================================================
local EggState, networking, Assets, Mutations
pcall(function() EggState = require(ReplicatedStorage:WaitForChild("Client", 5):WaitForChild("EggState", 5)) end)
pcall(function() networking = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Networking", 5) end)
pcall(function() Assets = require(ReplicatedStorage:WaitForChild("Data", 5):WaitForChild("Assets", 5)) end)
pcall(function() Mutations = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("Modules", 5):WaitForChild("Mutations", 5)) end)

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

-- TP voando (com desync)
local function flyTo(pos, speed, offsetStuds, lookAtTarget)
    speed = speed or 3000
    offsetStuds = offsetStuds or 0
    if not pos then return false, "pos nil" end
    local char = lp.Character
    if not char then return false, "sem char" end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false, "sem HRP" end

    applyDS()
    RunService.Heartbeat:Wait()

    hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then restoreDS(); return false, "HRP sumiu" end

    local dest = pos
    local lookDir = nil
    if offsetStuds > 0 then
        local dir = Vector3.new(pos.X - hrp.Position.X, 0, pos.Z - hrp.Position.Z)
        if dir.Magnitude > 0.01 then
            dest = pos - dir.Unit * offsetStuds
            lookDir = dir.Unit
        end
    elseif lookAtTarget then
        local dir = Vector3.new(pos.X - hrp.Position.X, 0, pos.Z - hrp.Position.Z)
        if dir.Magnitude > 0.01 then lookDir = dir.Unit end
    end

    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)

    local dist = (dest - hrp.Position).Magnitude
    local duration = math.max(dist / speed, 0.01)
    local targetCF = CFrame.new(dest)
    if lookDir then targetCF = CFrame.lookAt(dest, dest + lookDir) end

    local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCF})
    tween:Play()
    tween.Completed:Wait()

    pcall(function()
        hrp.CFrame = targetCF
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)
    return true, "ok"
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
            if best then return best, "ok" end
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
                if best then return best, "ok" end
            end
        end
    end
    return nil, "sem ovos"
end

-- ============================================================
-- CARRY EGG
-- ============================================================
local function carryEgg(uid)
    -- Tenta EggState.CarryFieldEgg (mais direto)
    if EggState and type(EggState.CarryFieldEgg) == "function" then
        local ok, r = pcall(EggState.CarryFieldEgg, uid)
        if ok and r ~= false then return true, "EggState" end
    end
    -- Tenta o remote
    if networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
        if rf then
            local ok, r = pcall(function()
                return rf:InvokeServer({Uid = uid})
            end)
            if ok and r == true then return true, "Remote" end
        end
    end
    return false, "falha carry"
end

-- ============================================================
-- POSICOES
-- ============================================================
-- Forest fica entre o campo e a safe zone
local FOREST_POS = Vector3.new(600, 70.5, -360)
-- Safe zone fica depois do SeparationLine (X > linha)
local SAFE_ZONE_POS = Vector3.new(650, 70.5, -360)

-- ============================================================
-- AUTO STEAL (ciclo completo)
-- ============================================================
local autoRunning = false
local function setStatus(txt, color)
    status.Text = txt
    status.TextColor3 = color or Color3.fromRGB(180, 180, 200)
end

btnAuto.MouseButton1Click:Connect(function()
    if autoRunning then
        autoRunning = false
        setStatus("AUTO STEAL parado", Color3.fromRGB(255, 200, 100))
        restoreDS()
        return
    end
    autoRunning = true
    setStatus("AUTO STEAL iniciado", Color3.fromRGB(100, 255, 140))

    task.spawn(function()
        while autoRunning do
            -- 1) Achar o melhor ovo
            setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
            local egg, err = getBestEgg()
            if not egg then
                setStatus("Sem ovo: " .. tostring(err), Color3.fromRGB(255, 100, 100))
                task.wait(2)
                continue
            end

            -- 2) TP voando pro ovo
            setStatus("Voando p/ " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 200, 255))
            local ok = flyTo(egg.BottomCFrame.Position, 3000, 0, true)
            if not ok then
                setStatus("TP egg falhou", Color3.fromRGB(255, 100, 100))
                task.wait(1)
                continue
            end
            task.wait(0.2)

            -- 3) Pega o ovo
            setStatus("Pegando ovo...", Color3.fromRGB(255, 200, 100))
            local carried = false
            for i = 1, 10 do
                local cok, cmsg = carryEgg(egg.Uid)
                if cok then
                    carried = true
                    break
                end
                task.wait(0.15)
            end
            if not carried then
                setStatus("Nao consegui pegar", Color3.fromRGB(255, 100, 100))
                restoreDS()
                task.wait(1)
                continue
            end

            -- 4) TP pra Forest
            setStatus("TP pra Forest...", Color3.fromRGB(100, 200, 255))
            flyTo(FOREST_POS, 3000, 0)
            task.wait(0.2)

            -- 5) Anda até safe zone (com humanoid real)
            restoreDS()
            task.wait(0.1)
            setStatus("Andando ate safe zone...", Color3.fromRGB(100, 255, 140))
            local char = lp.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                local target = SAFE_ZONE_POS
                local start = tick()
                while autoRunning and tick() - start < 8 do
                    local curHrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                    if not curHrp then break end
                    local dist = (Vector3.new(target.X, curHrp.Position.Y, target.Z) - curHrp.Position).Magnitude
                    if dist < 4 then break end
                    local dir = (Vector3.new(target.X, curHrp.Position.Y, target.Z) - curHrp.Position).Unit
                    hum:MoveTo(curHrp.Position + dir * 20)
                    task.wait(0.1)
                end
                pcall(function() hum:MoveTo(hrp.Position) end)
            end
            task.wait(0.5)
            setStatus("Ciclo concluido, reiniciando...", Color3.fromRGB(100, 255, 140))
            task.wait(0.3)
        end
    end)
end)

-- ============================================================
-- TP pro melhor ovo (só teleporta)
-- ============================================================
btnSteal.MouseButton1Click:Connect(function()
    setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
    local egg, err = getBestEgg()
    if not egg then
        setStatus("Erro: " .. tostring(err), Color3.fromRGB(255, 100, 100))
        return
    end
    setStatus("Voando p/ " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 200, 255))
    local ok = flyTo(egg.BottomCFrame.Position, 3000, 0, true)
    if ok then
        setStatus("OK: " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 255, 140))
    else
        setStatus("Falha no TP", Color3.fromRGB(255, 100, 100))
    end
    task.wait(0.1)
    restoreDS()
end)

-- ============================================================
-- TP pra Forest
-- ============================================================
btnHome.MouseButton1Click:Connect(function()
    setStatus("TP pra Forest...", Color3.fromRGB(100, 200, 255))
    local ok = flyTo(FOREST_POS, 3000, 0)
    task.wait(0.1)
    restoreDS()
    if ok then
        setStatus("Forest OK", Color3.fromRGB(100, 255, 140))
    else
        setStatus("Falha", Color3.fromRGB(255, 100, 100))
    end
end)

print("[Zyro] Auto Steal v5 carregado!")
