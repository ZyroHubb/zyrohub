-- ZYRO AUTO STEAL v6 - com waypoints do Lennon + anti-anti-cheat
print("[Zyro] v6 iniciando...")

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
frame.Size = UDim2.fromOffset(240, 140)
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
local btnInstant = btn("INSTANT STEAL", 78, Color3.fromRGB(140, 60, 40))

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
local EggState, networking, Assets, Mutations, AreaEggSlotIdentity
pcall(function() EggState = require(ReplicatedStorage:WaitForChild("Client", 5):WaitForChild("EggState", 5)) end)
pcall(function() networking = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Networking", 5) end)
pcall(function() Assets = require(ReplicatedStorage:WaitForChild("Data", 5):WaitForChild("Assets", 5)) end)
pcall(function() Mutations = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("Modules", 5):WaitForChild("Mutations", 5)) end)
pcall(function() AreaEggSlotIdentity = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("Util", 5):WaitForChild("AreaEggSlotIdentity", 5)) end)

-- ============================================================
-- WAYPOINTS DO LENNON (exatos)
-- ============================================================
local WP = {
    {name="WP1", pos=Vector3.new(3340.17, 70.52, -331.08), speed=4000},
    {name="WP2", pos=Vector3.new(2894.71, 75.64, -327.45), speed=4000},
    {name="WP3", pos=Vector3.new(1923.22, 75.64, -330.11), speed=4000},
    {name="WP4", pos=Vector3.new(767.54, 70.51, -327.81), speed=4000},
    {name="WP5", pos=Vector3.new(596.65, 70.52, -316.80), speed=1000},
    {name="WP6", pos=Vector3.new(573.61, 70.52, -327.54), speed=1000},
    {name="WP7", pos=Vector3.new(540.18, 70.52, -356.74), speed=1000},
}

-- ============================================================
-- DESYNC
-- ============================================================
local ds = {real=nil, fake=nil, char=nil, active=false}
local moveState = {token=0, active=false, reason=nil}

local function cancelGuidedMove(reason)
    moveState.token += 1
    moveState.active = false
    moveState.reason = reason or "cancelado"
    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        pcall(function()
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end)
    end
end

local function restoreDS()
    cancelGuidedMove("desync restaurado")
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

-- MOTOR DE TP/TELEGUIADO
-- Movimento incremental por frame, inspirado no motor da source:
-- evita um CFrame único instantâneo, mantém orientação e permite cancelamento.
local function guidedMove(pos, speed, offsetStuds, lookAtTarget, opts)
    opts = opts or {}
    speed = math.clamp(tonumber(speed) or 500, 25, tonumber(opts.maxSpeed) or 4000)
    offsetStuds = tonumber(offsetStuds) or 0
    if typeof(pos) ~= "Vector3" then return false, "pos invalida" end

    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not char or not root then return false, "sem HRP" end
    if opts.useDesync ~= false and not applyDS() then return false, "desync indisponivel" end
    RunService.Heartbeat:Wait()
    root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false, "HRP sumiu" end

    local dest = pos
    local flat = Vector3.new(pos.X - root.Position.X, 0, pos.Z - root.Position.Z)
    local lookDir = flat.Magnitude > 0.01 and flat.Unit or nil
    if offsetStuds > 0 and lookDir then
        dest = pos - lookDir * offsetStuds
    elseif not lookAtTarget then
        lookDir = nil
    end

    local token = moveState.token + 1
    moveState.token = token
    moveState.active = true
    moveState.reason = nil
    local started = os.clock()
    local timeout = tonumber(opts.timeout) or math.max(10, ((dest-root.Position).Magnitude / speed) + 5)
    local tolerance = tonumber(opts.tolerance) or 1.25
    local ok, result = false, "cancelado"

    pcall(function()
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)

    while moveState.token == token and os.clock() - started < timeout do
        if not autoRunning and opts.requireRunning then result = "parado"; break end
        if lp.Character ~= char then result = "character mudou"; break end
        root = char:FindFirstChild("HumanoidRootPart")
        if not root then result = "HRP sumiu"; break end

        local delta = dest - root.Position
        local distance = delta.Magnitude
        if distance <= tolerance then
            ok, result = true, "ok"
            break
        end

        local dt = RunService.Heartbeat:Wait()
        local step = math.min(distance, speed * math.max(dt, 1/240))
        local nextPos = root.Position + delta.Unit * step
        local rotation = root.CFrame.Rotation
        if lookDir then rotation = CFrame.lookAt(Vector3.zero, lookDir) end
        pcall(function()
            root.CFrame = CFrame.new(nextPos) * rotation
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    if not ok and result == "cancelado" and os.clock() - started >= timeout then result = "timeout" end
    moveState.active = false
    if ok then
        pcall(function()
            root.CFrame = CFrame.new(dest) * (lookDir and CFrame.lookAt(Vector3.zero, lookDir) or root.CFrame.Rotation)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end)
    end
    return ok, result
end

-- Compatibilidade com os callbacks existentes.
local function tpSlow(pos, speed, offsetStuds, lookAtTarget)
    return guidedMove(pos, speed, offsetStuds, lookAtTarget, {useDesync=true})
end

-- Rota teleguiada: atravessa waypoints sequencialmente e pode ser cancelada.
local function guidedRoute(route, opts)
    opts = opts or {}
    if type(route) ~= "table" then return false, "rota invalida" end
    for _, point in ipairs(route) do
        local pos = type(point) == "table" and (point.pos or point.Position) or point
        local speed = type(point) == "table" and point.speed or opts.speed
        local ok, reason = guidedMove(pos, speed, opts.offsetStuds or 0, opts.lookAtTarget, opts)
        if not ok then return false, reason end
        if opts.gap then task.wait(opts.gap) end
    end
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

local function getBestEgg(excludeUid)
    if EggState then
        local ok, r = pcall(function() return EggState.SyncFieldEggs() end)
        if ok and type(r) == "table" and type(r.Records) == "table" then
            local best, bv = nil, -1
            for _, rec in pairs(r.Records) do
                if type(rec) == "table" and rec.Uid and tostring(rec.Uid) ~= tostring(excludeUid) and rec.BottomCFrame
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
                    if type(rec) == "table" and rec.Uid and tostring(rec.Uid) ~= tostring(excludeUid) and rec.BottomCFrame
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


local function isFirstStageEgg(rec)
    if type(rec) ~= "table" or not rec.Uid then return false end
    if AreaEggSlotIdentity and type(AreaEggSlotIdentity.LooksLikeFirstAreaUid) == "function" then
        local ok, result = pcall(AreaEggSlotIdentity.LooksLikeFirstAreaUid, rec.Uid)
        if ok then return result == true end
    end
    local area = string.lower(tostring(rec.AreaId or rec.AreaName or rec.Area or ""))
    return area:find("forest", 1, true) ~= nil
end

local function getForestEgg(excludeUid)
    local records
    if EggState and type(EggState.SyncFieldEggs) == "function" then
        local ok, result = pcall(EggState.SyncFieldEggs)
        if ok and type(result) == "table" then records = result.Records end
    end
    if type(records) ~= "table" and networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
        if rf then
            local ok, result = pcall(rf.InvokeServer, rf)
            if ok and type(result) == "table" then records = result.Records end
        end
    end
    if type(records) ~= "table" then return nil, "snapshot indisponivel" end
    local best, bestScore = nil, math.huge
    local forest = WP[7].pos
    for _, rec in pairs(records) do
        if type(rec) == "table" and rec.Uid and tostring(rec.Uid) ~= tostring(excludeUid)
            and rec.BottomCFrame and (rec.State == "Slot" or rec.State == "Dropped")
            and isFirstStageEgg(rec) then
            local pos = rec.BottomCFrame.Position
            local score = (Vector3.new(pos.X, 0, pos.Z) - Vector3.new(forest.X, 0, forest.Z)).Magnitude
            if rec.NestId ~= nil then score -= 1000 end
            if score < bestScore then best, bestScore = rec, score end
        end
    end
    return best, best and "ok" or "nenhum ovo de primeiro estagio"
end

-- Movimento de retorno do Lennon: um único Tween por destino, não micro-teleportes.
local function tweenMove(pos, speed, lookAtTarget)
    if typeof(pos) ~= "Vector3" then return false, "pos invalida" end
    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false, "sem HRP" end
    speed = math.max(tonumber(speed) or 500, 25)
    local delta = pos - root.Position
    local rotation = root.CFrame.Rotation
    local flat = Vector3.new(delta.X, 0, delta.Z)
    if lookAtTarget and flat.Magnitude > 0.01 then
        rotation = CFrame.lookAt(Vector3.zero, flat.Unit)
    end
    local target = CFrame.new(pos) * rotation
    local tween = TweenService:Create(root, TweenInfo.new(math.max(delta.Magnitude / speed, 0.05), Enum.EasingStyle.Linear), {CFrame=target})
    tween:Play()
    local state = tween.Completed:Wait()
    if state ~= Enum.PlaybackState.Completed then return false, "retorno cancelado" end
    pcall(function()
        root.CFrame = target
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
    return true, "ok"
end

local function tweenRoute(route)
    if type(route) ~= "table" then return false, "rota invalida" end
    for _, point in ipairs(route) do
        local pos = type(point) == "table" and (point.pos or point.Position) or point
        local speed = type(point) == "table" and point.speed or 500
        local ok, reason = tweenMove(pos, speed, true)
        if not ok then return false, reason end
        RunService.Heartbeat:Wait()
    end
    return true, "ok"
end

local function carryEgg(uid, timeout, record)
    timeout = tonumber(timeout) or 2.5
    if not uid or not networking then return false, "uid invalido" end
    local invoke = networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
    local event = networking:FindFirstChild("RE/EggWorld/FieldEggCarry")
    local confirmed = false
    local connection
    if event and event:IsA("RemoteEvent") then
        connection = event.OnClientEvent:Connect(function(payload)
            if type(payload) == "table" and tostring(payload.Uid) == tostring(uid)
                and (payload.CarrierUserId == nil or payload.CarrierUserId == lp.UserId) then
                confirmed = true
            end
        end)
    end
    local slotKey
    if record and AreaEggSlotIdentity and record.NestId
        and type(AreaEggSlotIdentity.SlotKey) == "function" then
        pcall(function() slotKey = AreaEggSlotIdentity.SlotKey(record.AreaId, record.NestId) end)
    end
    local started = os.clock()
    local last = 0
    local source = "none"
    while os.clock() - started < timeout do
        if confirmed then
            if connection then connection:Disconnect() end
            return true, "event"
        end
        if os.clock() - last >= 0.05 then
            last = os.clock()
            if EggState and type(EggState.CarryFieldEgg) == "function" then
                local ok, result = pcall(EggState.CarryFieldEgg, uid, slotKey)
                if ok and result ~= false then source = "EggState"; confirmed = true end
            end
            if invoke and invoke:IsA("RemoteFunction") then
                local payload = {Uid = uid}
                if slotKey ~= nil then payload.SlotKey = slotKey end
                local ok, result = pcall(invoke.InvokeServer, invoke, payload)
                if ok and result == true then confirmed = true; source = "Remote" end
            end
        end
        RunService.Heartbeat:Wait()
    end
    if connection then connection:Disconnect() end
    return confirmed, confirmed and source or "timeout"
end

-- ============================================================
-- AUTO STEAL (ciclo completo com anti-anti-cheat)
-- ============================================================
local autoRunning = false
local function setStatus(txt, color)
    status.Text = txt
    status.TextColor3 = color or Color3.fromRGB(180, 180, 200)
end

local function walkToDelivery()
    restoreDS()
    task.wait(0.15)
    local char = lp.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return false, "personagem indisponivel" end
    local started = os.clock()
    while autoRunning and os.clock() - started < 10 do
        char = lp.Character
        hum = char and char:FindFirstChildOfClass("Humanoid")
        root = char and char:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return false, "personagem morreu" end
        pcall(function() hum:Move(Vector3.new(1, 0, 0), false) end)
        RunService.Heartbeat:Wait()
    end
    pcall(function() hum:MoveTo(root.Position) end)
    return true, "ok"
end

local function chilliCarryAtEgg(egg, timeout)
    timeout = tonumber(timeout) or 1.5
    if not egg or not egg.Uid or not egg.BottomCFrame then return false, "ovo invalido" end
    local targetPos = egg.BottomCFrame.Position
    local invoke = networking and networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
    local event = networking and networking:FindFirstChild("RE/EggWorld/FieldEggCarry")
    local confirmed = false
    local connection
    if event and event:IsA("RemoteEvent") then
        connection = event.OnClientEvent:Connect(function(payload)
            if type(payload) == "table" and tostring(payload.Uid) == tostring(egg.Uid)
                and (payload.CarrierUserId == nil or payload.CarrierUserId == lp.UserId) then
                confirmed = true
            end
        end)
    end
    local started = os.clock()
    local misses = 0
    while os.clock() - started < timeout and not confirmed do
        local nearest, distance
        for _, child in ipairs(workspace:GetChildren()) do
            if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
                local prompt = child:FindFirstChild("CarryAreaEgg")
                if prompt and prompt:IsA("ProximityPrompt") then
                    local d = (child.Position - targetPos).Magnitude
                    if d <= 14 and (not distance or d < distance) then
                        nearest, distance = prompt, d
                    end
                end
            end
        end
        if nearest then
            pcall(function() nearest.HoldDuration = 0 end)
            if typeof(fireproximityprompt) == "function" then
                pcall(fireproximityprompt, nearest)
            end
            misses = 0
        else
            misses += 1
            if EggState and type(EggState.CarryFieldEgg) == "function" then
                local ok, result = pcall(EggState.CarryFieldEgg, egg.Uid)
                if ok and result == true then confirmed = true end
            end
            if invoke and invoke:IsA("RemoteFunction") then
                local ok, result = pcall(invoke.InvokeServer, invoke, {Uid = egg.Uid})
                if ok and result == true then confirmed = true end
            end
            if misses >= 4 then break end
        end
        RunService.Heartbeat:Wait()
    end
    if connection then connection:Disconnect() end
    return confirmed, confirmed and "ok" or "not confirmed"
end

local function runInstantStealLennon()
    setStatus("Instant Steal: procurando ovo...", Color3.fromRGB(255, 200, 100))
    local egg, err = getBestEgg()
    if not egg or not egg.BottomCFrame then return false, err or "ovo invalido" end
    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not root or not hum or hum.Health <= 0 then return false, "personagem indisponivel" end

    local safeCFrame = root.CFrame
    local target = egg.BottomCFrame.Position + Vector3.new(0, 3, 0)
    local flat = Vector3.new(target.X - root.Position.X, 0, target.Z - root.Position.Z)
    if flat.Magnitude > 0.01 then target -= flat.Unit * 3 end
    setStatus("Instant Steal: ida rapida...", Color3.fromRGB(100, 200, 255))
    local ok, reason = tweenMove(target, 5000, true)
    if not ok then return false, reason end
    task.wait(0.05)

    setStatus("Instant Steal: prompt/carry...", Color3.fromRGB(255, 200, 100))
    local carried, carryReason = chilliCarryAtEgg(egg, 1.5)
    if not carried then return false, carryReason end

    setStatus("Instant Steal: retorno...", Color3.fromRGB(100, 255, 140))
    root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not root then return false, "HRP sumiu" end
    pcall(function()
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        root.CFrame = safeCFrame
    end)
    task.wait(0.5)
    return true, "ok"
end

local function runStealCycle(single)
    -- Etapa 1 do Lennon: localizar o ovo do primeiro estágio/Forest.
    setStatus("Preparando ninho Forest...", Color3.fromRGB(255, 200, 100))
    local forestEgg, forestErr = getForestEgg()
    if not forestEgg then return false, forestErr end
    local bestEgg, bestErr = getBestEgg()
    if not bestEgg then return false, bestErr end
    if tostring(bestEgg.Uid) == tostring(forestEgg.Uid) then
        bestEgg = getBestEgg(forestEgg.Uid)
    end
    if not bestEgg then return false, "sem ovo prioritario separado" end

    setStatus("Clone guiado até o Forest...", Color3.fromRGB(100, 200, 255))
    if not applyDS() then return false, "desync indisponivel" end
    local ok, reason = tweenMove(forestEgg.BottomCFrame.Position - Vector3.new(0, 0, 3), 150, true)
    if not ok then return false, "Forest: " .. tostring(reason) end

    -- Auto Steal Lennon: um Tween por waypoint, sem micro-passos por Heartbeat.
    local routeOk, routeReason = tweenRoute(WP)
    if not routeOk then return false, "waypoints: " .. tostring(routeReason) end
    task.wait(0.25)

    setStatus("Instant Steal do ninho...", Color3.fromRGB(255, 200, 100))
    local forestCarried, carryReason = carryEgg(forestEgg.Uid, 3, forestEgg)
    if not forestCarried then
        restoreDS()
        return false, "Forest carry: " .. tostring(carryReason)
    end

    -- Etapa 2: o clone voa até o melhor ovo enquanto a hitbox permanece desyncada.
    setStatus("Clone voando até o melhor ovo...", Color3.fromRGB(100, 200, 255))
    local bestPos = bestEgg.BottomCFrame.Position + Vector3.new(0, 3, 0)
    local bestOk, bestReason = tweenMove(bestPos, 5000, true)
    if not bestOk then restoreDS(); return false, "melhor ovo: " .. tostring(bestReason) end
    task.wait(0.15)

    setStatus("Instant Steal do melhor ovo...", Color3.fromRGB(255, 200, 100))
    local bestCarried, bestCarryReason = carryEgg(bestEgg.Uid, 3, bestEgg)
    if not bestCarried then
        restoreDS()
        return false, "melhor carry: " .. tostring(bestCarryReason)
    end

    -- A captura confirma o retorno; só WP6/WP7 são usados, como no Lennon.
    setStatus("Ovo capturado; TP para Forest...", Color3.fromRGB(100, 255, 140))
    local back1, backReason = tweenMove(WP[6].pos, WP[6].speed, true)
    if not back1 then restoreDS(); return false, backReason end
    local back2, backReason2 = tweenMove(WP[7].pos, WP[7].speed, true)
    if not back2 then restoreDS(); return false, backReason2 end

    -- Janela de 2–3 s para a troca da hitbox fake pela real.
    setStatus("Sincronizando hitbox real...", Color3.fromRGB(255, 220, 100))
    task.wait(2.5)
    local delivered, deliveryReason = walkToDelivery()
    if not delivered then return false, deliveryReason end
    return true, "ok"
end

btnAuto.MouseButton1Click:Connect(function()
    if autoRunning then
        autoRunning = false
        cancelGuidedMove("Auto Steal parado")
        setStatus("AUTO STEAL parado", Color3.fromRGB(255, 200, 100))
        restoreDS()
        return
    end
    autoRunning = true
    setStatus("AUTO STEAL iniciado", Color3.fromRGB(100, 255, 140))
    task.spawn(function()
        while autoRunning do
            local ok, reason = runStealCycle(false)
            restoreDS()
            if not ok then
                setStatus("Auto Steal: " .. tostring(reason), Color3.fromRGB(255, 100, 100))
                task.wait(1)
            else
                setStatus("Ciclo concluído; procurando próximo...", Color3.fromRGB(100, 255, 140))
                task.wait(0.35)
            end
        end
        restoreDS()
    end)
end)

-- INSTANT STEAL manual: uma coleta completa sem iniciar o loop.
btnInstant.MouseButton1Click:Connect(function()
    if autoRunning then
        setStatus("Pare o Auto Steal antes do Instant Steal", Color3.fromRGB(255, 180, 80))
        return
    end
    autoRunning = true
    task.spawn(function()
        local ok, reason = runInstantStealLennon()
        autoRunning = false
        restoreDS()
        if ok then
            setStatus("Instant Steal concluído", Color3.fromRGB(100, 255, 140))
        else
            setStatus("Instant Steal: " .. tostring(reason), Color3.fromRGB(255, 100, 100))
        end
    end)
end)

pcall(function()
    sg.AncestryChanged:Connect(function(_, parent)
        if not parent then
            autoRunning = false
            cancelGuidedMove("interface removida")
            restoreDS()
        end
    end)
end)
