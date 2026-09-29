-- ZYRO SAFE STEAL v21 - Motor do Chilli
print("[Zyro] v21 iniciando...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

-- ============================================================
-- SETUP
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

-- ============================================================
-- SHIELD (Humanoid Swap - desabilita UGI monitor)
-- ============================================================
local shieldState = {Original = nil, Clone = nil, Links = {}}

local function shieldDisconnect()
    for _, link in ipairs(shieldState.Links) do
        pcall(function() link:Disconnect() end)
    end
    table.clear(shieldState.Links)
end

local function shieldUndo()
    shieldDisconnect()
    local char = lp.Character
    local orig = shieldState.Original
    local clone = shieldState.Clone
    shieldState.Original = nil
    shieldState.Clone = nil
    if orig and clone and char and orig.Parent == nil and clone.Parent == char then
        orig.Parent = char
        workspace.CurrentCamera.CameraSubject = orig
        pcall(function() clone:Destroy() end)
    end
end

local function shieldApply()
    if shieldState.Clone and shieldState.Clone.Parent then return true end
    local char = lp.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    local state = hum:GetState()
    if state ~= Enum.HumanoidStateType.Running 
       and state ~= Enum.HumanoidStateType.RunningNoPhysics 
       and state ~= Enum.HumanoidStateType.Landed then
        return false
    end
    local clone = hum:Clone()
    hum.Parent = nil
    clone.Parent = char
    workspace.CurrentCamera.CameraSubject = clone
    shieldState.Original = hum
    shieldState.Clone = clone
    
    table.insert(shieldState.Links, hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if clone.Parent ~= nil then clone.WalkSpeed = hum.WalkSpeed end
    end))
    table.insert(shieldState.Links, clone.Died:Connect(function()
        shieldUndo()
        if char then
            hum.Parent = char
            workspace.CurrentCamera.CameraSubject = hum
        end
        pcall(function() clone:Destroy() end)
        hum.Health = 0
    end))
    return true
end

-- Desabilita o monitor do UGI (que detecta teleporte)
local function disableUGI()
    if type(getconnections) ~= "function" then return end
    for _, conn in ipairs({RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation}) do
        local ok, conns = pcall(getconnections, conn)
        if ok and type(conns) == "table" then
            for _, c in ipairs(conns) do
                local ok2, fn = pcall(function() return c.Function end)
                if ok2 and type(fn) == "function" then
                    local ok3, info = pcall(debug.info, fn, "s")
                    if ok3 and string.find(tostring(info), "UGI", 1, true) then
                        pcall(function() c:Disable() end)
                    end
                end
            end
        end
    end
end

-- ============================================================
-- STEAL HOME (posição exata do Chilli)
-- ============================================================
local function getStealHome()
    local paths = {
        {{"GearGiver_Slap", "Podium"}, Vector3.new(-16.415, 21.072, -6.106)},
        {{"World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"}, Vector3.new(-26.776, 1.75, 18.665)},
        {{"__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003"}, Vector3.new(-26.776, 1.75, 18.665)},
    }
    for _, entry in ipairs(paths) do
        local obj = workspace
        for _, name in ipairs(entry[1]) do
            obj = obj and obj:FindFirstChild(name)
        end
        if obj and obj:IsA("BasePart") then
            return obj.CFrame:PointToWorldSpace(entry[2])
        end
    end
    return Vector3.new(528.7, 70.57, -364.11)
end

-- ============================================================
-- WALKTO (caminhar devagar - igual Chilli)
-- ============================================================
local function walkTo(pos, closeDist, maxTime, shouldStop)
    closeDist = closeDist or 6
    maxTime = maxTime or 10
    local t = 0
    local lastPos = nil
    local stuckTime = 0
    local jumpCooldown = 0
    while t < maxTime do
        if shouldStop and shouldStop() then
            return false
        end
        local char = lp.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp or hum.Health <= 0 then return false end
        if (hrp.Position - pos).Magnitude <= closeDist then
            pcall(function() hum:MoveTo(hrp.Position) end)
            return true
        end
        local stuck = lastPos and (hrp.Position - lastPos).Magnitude < 1
        if stuck then stuckTime += 0.2 else stuckTime = 0 end
        lastPos = hrp.Position
        jumpCooldown = math.max(0, jumpCooldown - 0.2)
        if stuckTime >= 0.8 and jumpCooldown <= 0 then
            local rfTreadmillAskDoff = networking and networking:FindFirstChild("RF/Treadmill/AskDoff")
            if rfTreadmillAskDoff then pcall(function() rfTreadmillAskDoff:InvokeServer() end) end
            pcall(function() hum.Jump = true end)
            stuckTime = 0
            jumpCooldown = 1.5
        end
        hum:MoveTo(pos)
        t += task.wait(0.2)
    end
    pcall(function() 
        local char = lp.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum:MoveTo(lp.Character.HumanoidRootPart.Position) end
    end)
    return false
end

-- ============================================================
-- ÁREAS DO MAPA (dinâmico)
-- ============================================================
local AREAS = {"Forest", "Desert", "Snow", "Lake", "Jungle", "Volcano", "Prehistoric", "Cosmic", "Abyss Ocean", "Cherry Blossom", "Light Dark", "Titan Temple"}
local areaSet = {}
for _, a in ipairs(AREAS) do areaSet[a] = true end

-- Lê áreas do jogo (adiciona se tiver alguma nova)
task.spawn(function()
    if not EggState then return end
    local ok, r = pcall(function() return EggState.ReadFieldEggs() end)
    if ok and type(r) == "table" and type(r.Records) == "table" then
        for _, rec in pairs(r.Records) do
            local a = type(rec) == "table" and rec.AreaId or nil
            if type(a) == "string" and not areaSet[a] then
                areaSet[a] = true
                table.insert(AREAS, a)
            end
        end
    end
end)

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
    if not EggState then return nil end
    local ok, r = pcall(function() return EggState.ReadFieldEggs() end)
    if not ok or type(r) ~= "table" or type(r.Records) ~= "table" then return nil end
    local best, bv = nil, -1
    for _, rec in pairs(r.Records) do
        if type(rec) == "table" and rec.Uid and rec.BottomCFrame
            and (rec.State == "Slot" or rec.State == "Dropped") then
            local v = eggValue(rec)
            if v > bv then bv = v; best = rec end
        end
    end
    return best
end

local function carryEgg(uid)
    if EggState and type(EggState.CarryFieldEgg) == "function" then
        local ok, r = pcall(EggState.CarryFieldEgg, uid)
        if ok and r ~= false then return true end
    end
    if networking then
        local rf = networking:FindFirstChild("RF/EggWorld/AskFieldEggCarry")
        if rf then
            local ok, r = pcall(function() return rf:InvokeServer({Uid = uid}) end)
            if ok and r == true then return true end
        end
    end
    return false
end

local function dropEgg()
    if EggState and type(EggState.DropFieldEgg) == "function" then
        pcall(EggState.DropFieldEgg, "PlayerRequest")
    end
end

local function isCarrying(uid)
    if EggState and type(EggState.ReadOwnerEggs) == "function" then
        local ok, r = pcall(EggState.ReadOwnerEggs, lp.UserId)
        if ok and type(r) == "table" then
            for _, rec in pairs(r) do
                if type(rec) == "table" and rec.Uid == uid and rec.CarrierUserId == lp.UserId then
                    return true
                end
            end
        end
    end
    return false
end

-- Exporta funções globais pra usar nos próximos blocos
_G._zyro = {
    shieldApply = shieldApply,
    shieldUndo = shieldUndo,
    disableUGI = disableUGI,
    getStealHome = getStealHome,
    walkTo = walkTo,
    getBestEgg = getBestEgg,
    carryEgg = carryEgg,
    dropEgg = dropEgg,
    isCarrying = isCarrying,
    AREAS = AREAS,
    areaSet = areaSet,
}

print("[Zyro] BLOCO 1/3 carregado (Shield + Home + WalkTo)")
-- ============================================================
-- ZYRO BLOCO 2/3 - SafeCarry (motor do Chilli)
-- ============================================================
local _G_zyro = _G._zyro
if not _G_zyro then warn("[Zyro] BLOCO 1/3 nao carregado!"); return end

local lp = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EggState, networking, Assets
pcall(function() EggState = require(ReplicatedStorage:WaitForChild("Client", 5):WaitForChild("EggState", 5)) end)
pcall(function() networking = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Networking", 5) end)
pcall(function() Assets = require(ReplicatedStorage:WaitForChild("Data", 5):WaitForChild("Assets", 5)) end)

-- Pega as funções do Bloco 1
local shieldApply = _G_zyro.shieldApply
local shieldUndo = _G_zyro.shieldUndo
local disableUGI = _G_zyro.disableUGI
local getStealHome = _G_zyro.getStealHome
local walkTo = _G_zyro.walkTo
local getBestEgg = _G_zyro.getBestEgg
local carryEgg = _G_zyro.carryEgg
local dropEgg = _G_zyro.dropEgg
local isCarrying = _G_zyro.isCarrying

-- ============================================================
-- SAFECARRY CONFIG (valores do Chilli)
-- ============================================================
local SafeCarry = {
    Enabled = true,
    LineDrop = true,        -- Técnica do Chilli: dropa ovo perto da linha
    Height = 70,
    ClimbShare = 0.5,
    RunSpeed = 1,
    RunWait = 0,
    RunAnimate = true,
    RunHeight = 50,
    StraightRun = true,
    RunStyle = "Velocity",
    CarryStyle = "Velocity",
    SpeedJitter = 0,
    LaneOffset = 0,
    LineGap = 12,
    LineWait = 15,
    DropDelay = 0.19,
    LineApproach = 0.97,
    Hops = true,
    HopStep = 350,
    BackRunRatio = 15,
    BackRunMax = 2000,
    QuickRegrab = 1,
    MidDrops = {0.33, 0.66},
    MidRest = 0.1,
    HopGap = 0.1,
    HopLift = 42,
    HopStop = 48,
    GetUp = true,
    ShakeTime = 0,
    ShakeInside = 1,
    CarryScale = 1,
    EasyRatio = 1.3,
    LightMult = 0.96,
    SnapLimit = 90,
    SnapPickup = false,
    DirectBudget = 450,
    DirectMargin = 0.3,
    CrossNow = false,
    CrossSpeed = 231,
    PickupSpeed = 154,
    HopRatio = 1.515,
    CrossRatio = 1,
    PickupRatio = 0.667,
    FarFromLine = 150,
    ReJump = true,
    LockCamera = false,
    ReactMin = 0.2,
    ReactMax = 0.6,
    CarryReact = 0,
    ExcessSeconds = 5.5,
    GuardMargin = 4,
    GuardRatio = 1.06,
    MinRatio = 1.1,
    BaseWait = 6.5,
    WaitRate = 0.9,
    GuessMult = 0.93,
    CarryRatio = 0.9,
    Mult = 1,
    Seen = {},
    LastDelivered = 0,
    LastFailed = 0,
    LastSkip = nil,
    Blocked = {},
    PlanOk = true,
}

local function getRoot()
    local char = lp.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = lp.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getWalkSpeed()
    local hum = getHumanoid()
    return hum and hum.WalkSpeed or 16
end

local function isNight()
    return false
end

-- ============================================================
-- SAFECARRY.PLAN (decide se dá pra fugir do guard)
-- ============================================================
SafeCarry.Plan = function(category, distanceToHome, mult)
    local ws = getWalkSpeed()
    mult = mult or SafeCarry.Mult or 1
    if SafeCarry.SameSpeedBigEggs then
        mult = math.max(mult, SafeCarry.LightMult)
    end
    local baseSpeed = ws * SafeCarry.CarryRatio * mult
    local maxSpeed = baseSpeed * 1.5
    local excessDist = SafeCarry.ExcessSeconds * baseSpeed
    local effectiveMax
    if distanceToHome and distanceToHome > excessDist then
        effectiveMax = math.min(maxSpeed, baseSpeed * distanceToHome / (distanceToHome - excessDist))
    else
        effectiveMax = maxSpeed
    end
    -- Pega velocidade do guard
    local guards = nil
    pcall(function()
        local Data = ReplicatedStorage:FindFirstChild("Data")
        local Guards = Data and Data:FindFirstChild("Guards")
        guards = Guards and require(Guards) or nil
    end)
    local guardSpeed = 0
    if type(guards) == "table" and type(guards.Directory) == "table" then
        local g = guards.Directory[tostring(category)]
        if type(g) == "table" then
            guardSpeed = tonumber(g.WalkSpeed) or 0
        end
    end
    if not SafeCarry.BeatGuard then
        return math.max(math.min(baseSpeed * SafeCarry.EasyRatio, effectiveMax), baseSpeed), true, baseSpeed, effectiveMax, guardSpeed
    end
    local minSafe = math.max(guardSpeed + SafeCarry.GuardMargin, baseSpeed * SafeCarry.MinRatio)
    local safe = math.max(minSafe, guardSpeed * SafeCarry.GuardRatio)
    if effectiveMax < minSafe then
        local newMax = baseSpeed * 1.5
        local newExcess = SafeCarry.StretchSeconds * baseSpeed
        local effNew
        if distanceToHome and distanceToHome > newExcess then
            effNew = math.min(newMax, baseSpeed * distanceToHome / (distanceToHome - newExcess))
        else
            effNew = newMax
        end
        local gMin = guardSpeed + math.max(SafeCarry.GuardMargin, 1)
        if gMin <= effNew then
            return gMin, true, baseSpeed, effNew, guardSpeed
        end
    end
    return math.max(math.min(safe, effectiveMax), baseSpeed), minSafe <= effectiveMax, baseSpeed, effectiveMax, guardSpeed
end

-- ============================================================
-- SAFECARRY.PACE (velocidade de corrida)
-- ============================================================
SafeCarry.Pace = function()
    local spd = tonumber(SafeCarry.RunSpeed) or 1
    return math.max(getWalkSpeed() * spd, 16)
end

-- ============================================================
-- SAFECARRY.AVOID (desviar de perigos)
-- ============================================================
SafeCarry.Dangers = {}
SafeCarry.DangerAt = 0

SafeCarry.RefreshDangers = function()
    if os.clock() - SafeCarry.DangerAt < 1 then
        return SafeCarry.Dangers
    end
    SafeCarry.DangerAt = os.clock()
    local dangers = {}
    local function addDanger(obj)
        local ok, cf, size = pcall(function()
            if obj:IsA("Model") then
                local c, s = obj:GetBoundingBox()
                return c, s
            elseif obj:IsA("BasePart") then
                return obj.CFrame, obj.Size
            end
        end)
        if ok and cf and size then
            local half = Vector3.new(math.abs(size.X), 0, math.abs(size.Z)) * 0.5
            local corner = (cf - cf.Position):VectorToWorldSpace(half)
            local ex = math.max(math.abs(corner.X), half.X, half.Z)
            local ez = math.max(math.abs(corner.Z), half.X, half.Z)
            table.insert(dangers, {
                MinX = cf.Position.X - ex, MaxX = cf.Position.X + ex,
                MinZ = cf.Position.Z - ez, MaxZ = cf.Position.Z + ez,
                Name = obj.Name,
            })
        end
    end
    local function isDanger(name)
        if name == "ScrambleLocalVisuals" or name == "DrScrambleEvent" then return false end
        local low = string.lower(name)
        return string.find(low, "portal", 1, true)
            or string.find(low, "teleport", 1, true)
            or string.find(low, "mech", 1, true)
            or string.find(low, "arena", 1, true)
            or string.find(low, "scramble", 1, true)
    end
    for _, child in ipairs(workspace:GetChildren()) do
        if (child:IsA("Model") or child:IsA("BasePart") or child:IsA("Folder")) and isDanger(child.Name) then
            if child:IsA("Folder") then
                for _, c2 in ipairs(child:GetChildren()) do addDanger(c2) end
            else
                addDanger(child)
            end
        end
    end
    SafeCarry.Dangers = dangers
    return dangers
end

SafeCarry.Avoid = function(from, to)
    for _, d in ipairs(SafeCarry.RefreshDangers()) do
        local mnx, mxx = d.MinX - 12, d.MaxX + 12
        local mnz, mxz = d.MinZ - 12, d.MaxZ + 12
        local inside = from.X >= mnx and from.X <= mxx and from.Z >= mnz and from.Z <= mxz
        if not inside then
            -- Checa se a linha cruza o retângulo
            local dx, dz = to.X - from.X, to.Z - from.Z
            local tmin, tmax = 0, 1
            local hit = true
            for _, axis in ipairs({{from.X, dx, mnx, mxx}, {from.Z, dz, mnz, mxz}}) do
                local p, d2, m1, m2 = axis[1], axis[2], axis[3], axis[4]
                if math.abs(d2) < 1e-6 then
                    if p < m1 or p > m2 then hit = false; break end
                else
                    local t1 = (m1 - p) / d2
                    local t2 = (m2 - p) / d2
                    if t1 > t2 then t1, t2 = t2, t1 end
                    tmin = math.max(tmin, t1)
                    tmax = math.min(tmax, t2)
                    if tmin > tmax then hit = false; break end
                end
            end
            if hit then
                -- Desvia
                local nz1 = mnz - 2
                local nz2 = mxz + 2
                local side = math.abs(from.Z - nz1) <= math.abs(from.Z - nz2) and nz1 or nz2
                if side < -440 or side > -290 then
                    side = side == nz1 and nz2 or nz1
                end
                local nx = math.abs(from.X - mnx) <= math.abs(from.X - mxx) and mnx or mxx
                if math.abs(from.Z - side) < 3 then
                    nx = math.abs(to.X - mnx) <= math.abs(to.X - mxx) and mnx or mxx
                end
                return Vector3.new(nx, to.Y, side), d.Name
            end
        end
    end
    return to, nil
end

-- ============================================================
-- SAFECARRY.HOME (carregar ovo pra base andando)
-- ============================================================
SafeCarry.Home = function(shouldStop)
    local home = getStealHome()
    local hrp = getRoot()
    if not home or not hrp then return false end
    
    shieldApply()
    
    local char = lp.Character
    local hum = getHumanoid()
    if hum then hum.PlatformStand = false end
    
    -- Ponto seguro (perto do SeparationLine)
    local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
    world = world and world:FindFirstChild("Areas")
    local line = world and world:FindFirstChild("SeparationLine")
    local safeX = (line and line:IsA("BasePart") and line.Position.X or 552) - 7
    
    -- Aplica shield no character
    pcall(function()
        local char = lp.Character
        if char then
            for _, d in ipairs(char:GetDescendants()) do
                if d:IsA("BasePart") and d.CanCollide then
                    -- ok
                end
            end
        end
    end)
    
    -- Loop de corrida até home
    local startTime = tick()
    while tick() - startTime < 30 do
        if shouldStop and shouldStop() then return false end
        local curHrp = getRoot()
        local curHum = getHumanoid()
        if not curHrp or not curHum then return false end
        
        if (curHrp.Position - home).Magnitude < 8 then
            pcall(function() curHum:MoveTo(curHrp.Position) end)
            return true
        end
        
        -- Move em direção à home
        local target = home
        local v, name = SafeCarry.Avoid(curHrp.Position, target)
        curHum:MoveTo(v)
        RunService.Heartbeat:Wait()
    end
    return false
end

-- ============================================================
-- SAFECARRY.LINEDROPHOME (o SEGREDO do Chilli)
-- ============================================================
-- Técnica: pega o ovo, vai perto da linha (não cruza), dropa o ovo,
-- espera ele "cair" do lado certo, pega de novo e entrega
SafeCarry.LineDropHome = function(shouldStop)
    local steal = _G._zyro and _G._zyro.steal
    local carryUid = nil
    if EggState and type(EggState.ReadOwnerEggs) == "function" then
        local ok, r = pcall(EggState.ReadOwnerEggs, lp.UserId)
        if ok and type(r) == "table" then
            for k, rec in pairs(r) do
                if type(rec) == "table" and rec.CarrierUserId == lp.UserId then
                    carryUid = k
                    break
                end
            end
        end
    end
    if type(carryUid) ~= "string" then return false end
    
    local home = getStealHome()
    local hrp = getRoot()
    if not home or not hrp then return false end
    
    -- Referência: linha do mapa
    local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
    world = world and world:FindFirstChild("Areas")
    local line = world and world:FindFirstChild("SeparationLine")
    local lineX = (line and line:IsA("BasePart") and line.Position.X or 552.2)
    local lineY = (line and line:IsA("BasePart") and line.Position.Y or 67.67)
    
    -- Ponto de "espera" perto da linha (antes de cruzar)
    local waitPos = Vector3.new(lineX - SafeCarry.LineGap, lineY + 3, hrp.Position.Z)
    
    -- 1) Vai até o ponto de espera
    if not walkTo(waitPos, 8, 15, shouldStop) then
        return false
    end
    
    -- 2) Dropa o ovo
    if type(EggState) == "table" and type(EggState.DropFieldEgg) == "function" then
        pcall(EggState.DropFieldEgg, "PlayerRequest")
    end
    
    -- 3) Espera o ovo cair
    task.wait(SafeCarry.DropDelay + 0.3)
    
    -- 4) Pega o ovo de novo
    local picked = false
    for i = 1, 10 do
        if shouldStop and shouldStop() then return false end
        if carryEgg(carryUid) then
            picked = true
            break
        end
        task.wait(0.1)
    end
    if not picked then return false end
    
    -- 5) Agora sim, anda pra safe zone
    local safePos = Vector3.new(lineX + 30, lineY + 3, hrp.Position.Z)
    if not walkTo(safePos, 10, 15, shouldStop) then
        return false
    end
    
    return true
end

-- ============================================================
-- EXPORTA PRA USO NO BLOCO 3
-- ============================================================
_G._zyro.SafeCarry = SafeCarry

print("[Zyro] BLOCO 2/3 carregado (SafeCarry + Plan + Avoid + Home + LineDrop)")
-- ============================================================
-- ZYRO BLOCO 3/3 - UI + Auto Steal principal
-- ============================================================
local _G_zyro = _G._zyro
if not _G_zyro then warn("[Zyro] BLOCO 1/3 nao carregado!"); return end
if not _G_zyro.SafeCarry then warn("[Zyro] BLOCO 2/3 nao carregado!"); return end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

-- Funções do Bloco 1
local shieldApply = _G_zyro.shieldApply
local shieldUndo = _G_zyro.shieldUndo
local disableUGI = _G_zyro.disableUGI
local getStealHome = _G_zyro.getStealHome
local walkTo = _G_zyro.walkTo
local getBestEgg = _G_zyro.getBestEgg
local carryEgg = _G_zyro.carryEgg
local dropEgg = _G_zyro.dropEgg
local isCarrying = _G_zyro.isCarrying

-- Funções do Bloco 2
local SafeCarry = _G_zyro.SafeCarry

-- ============================================================
-- UI
-- ============================================================
local parent = nil
pcall(function() parent = game:GetService("CoreGui") end)
if not parent then parent = lp:WaitForChild("PlayerGui") end
pcall(function()
    local old = parent:FindFirstChild("ZyroSafeSteal")
    if old then old:Destroy() end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "ZyroSafeSteal"
sg.ResetOnSpawn = false
pcall(function() sg.Parent = parent end)
if not sg.Parent then warn("[Zyro] sem ScreenGui"); return end

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(280, 200)
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
title.Text = "ZYRO SAFE STEAL"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.Parent = frame

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
            TweenService:Create(bola, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -21, 0.5, -9), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
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
local toggleInstant = criarToggle("Instant Steal (LineDrop)", 76, Color3.fromRGB(255, 160, 60))

-- Botão SALVAR LOCAL
local btnSalvar = Instance.new("TextButton")
btnSalvar.Size = UDim2.new(0.9, 0, 0, 32)
btnSalvar.Position = UDim2.new(0.05, 0, 0, 114)
btnSalvar.BackgroundColor3 = Color3.fromRGB(40, 140, 200)
btnSalvar.Text = "SALVAR LOCAL ATUAL"
btnSalvar.TextColor3 = Color3.new(1, 1, 1)
btnSalvar.TextSize = 12
btnSalvar.Font = Enum.Font.GothamBold
btnSalvar.Parent = frame
Instance.new("UICorner", btnSalvar).CornerRadius = UDim.new(0, 8)

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
-- LOCAL SALVO
-- ============================================================
local LocalSalvo = nil
pcall(function()
    if type(readfile) == "function" and type(isfile) == "function" and isfile("ZyroLocal.txt") then
        local c = readfile("ZyroLocal.txt")
        if c and c ~= "" then
            local x, y, z = string.match(c, "([%-%d%.]+),([%-%d%.]+),([%-%d%.]+)")
            if x and y and z then
                LocalSalvo = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
            end
        end
    end
end)

btnSalvar.MouseButton1Click:Connect(function()
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then setStatus("Sem personagem", Color3.fromRGB(255, 100, 100)); return end
    LocalSalvo = hrp.Position
    pcall(function()
        if type(writefile) == "function" then
            writefile("ZyroLocal.txt", tostring(LocalSalvo.X) .. "," .. tostring(LocalSalvo.Y) .. "," .. tostring(LocalSalvo.Z))
        end
    end)
    setStatus("Salvo: " .. math.floor(LocalSalvo.X) .. "," .. math.floor(LocalSalvo.Y) .. "," .. math.floor(LocalSalvo.Z), Color3.fromRGB(100, 255, 140))
end)

if LocalSalvo then
    setStatus("Local carregado", Color3.fromRGB(100, 255, 140))
end

-- ============================================================
-- AUTO STEAL (usando SafeCarry do Chilli)
-- ============================================================
local autoRunning = false

_G._zyroCallbacks["Auto Steal"] = function(ativo)
    if ativo then
        if autoRunning then return end
        if not LocalSalvo then
            setStatus("Salve um local primeiro!", Color3.fromRGB(255, 100, 100))
            toggleAuto.Set(false)
            return
        end
        autoRunning = true
        task.spawn(function()
            while autoRunning do
                -- 1) Achar melhor ovo
                setStatus("Procurando ovo...", Color3.fromRGB(255, 200, 100))
                local egg = getBestEgg()
                if not egg then
                    setStatus("Sem ovo, esperando...", Color3.fromRGB(255, 100, 100))
                    task.wait(2)
                    continue
                end

                -- 2) Aplicar Shield (tira o monitor de teleporte)
                disableUGI()
                shieldApply()
                task.wait(0.2)

                -- 3) Voar pro ovo (Tween rápido)
                setStatus("Voando p/ " .. tostring(egg.AssetCategory), Color3.fromRGB(100, 200, 255))
                local char = lp.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then
                    shieldUndo()
                    task.wait(0.5)
                    continue
                end
                
                local posOvo = egg.BottomCFrame.Position
                local dist = (posOvo - hrp.Position).Magnitude
                local speed = 800
                local duration = math.max(dist / speed, 0.1)
                local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posOvo + Vector3.new(0, 3, 0))})
                tween:Play()
                tween.Completed:Wait()
                
                if not autoRunning then break end
                task.wait(0.3)

                -- 4) Pega o ovo
                setStatus("Pegando ovo...", Color3.fromRGB(255, 200, 100))
                local carried = false
                for i = 1, 25 do
                    if not autoRunning then break end
                    if carryEgg(egg.Uid) then
                        carried = true
                        break
                    end
                    task.wait(0.05)
                end

                if not carried then
                    setStatus("Nao peguei, tentando de novo", Color3.fromRGB(255, 100, 100))
                    shieldUndo()
                    task.wait(0.5)
                    continue
                end
                
                -- 5) Desfaz shield pra andar
                shieldUndo()
                task.wait(0.2)
                setStatus("Ovo na mao!", Color3.fromRGB(100, 255, 140))

                -- 6) Volta ANDANDO (SafeCarry.Home) — não teleporta com ovo
                if SafeCarry.Enabled then
                    setStatus("Correndo com SafeCarry...", Color3.fromRGB(100, 255, 140))
                    SafeCarry.Home(function() return not autoRunning end)
                else
                    -- Fallback: WalkTo simples
                    setStatus("Correndo pra base...", Color3.fromRGB(100, 255, 140))
                    walkTo(LocalSalvo, 8, 20, function() return not autoRunning end)
                end

                if not autoRunning then break end
                setStatus("Entregue! Reiniciando...", Color3.fromRGB(100, 255, 140))
                task.wait(0.5)
            end
            shieldUndo()
            setStatus("Parado", Color3.fromRGB(255, 200, 100))
        end)
    else
        autoRunning = false
        setStatus("Parando...", Color3.fromRGB(255, 200, 100))
        shieldUndo()
        task.wait(0.3)
        setStatus("Parado", Color3.fromRGB(255, 200, 100))
    end
end

-- ============================================================
-- INSTANT STEAL (LineDrop - técnica do Chilli)
-- ============================================================
local instantRunning = false

_G._zyroCallbacks["Instant Steal (LineDrop)"] = function(ativo)
    if ativo then
        if instantRunning then return end
        if not LocalSalvo then
            setStatus("Salve um local primeiro!", Color3.fromRGB(255, 100, 100))
            toggleInstant.Set(false)
            return
        end
        instantRunning = true
        SafeCarry.LineDrop = true
        task.spawn(function()
            while instantRunning do
                setStatus("[Instant] Procurando ovo...", Color3.fromRGB(255, 200, 100))
                local egg = getBestEgg()
                if not egg then
                    task.wait(2)
                    continue
                end

                -- Vai pro ovo
                disableUGI()
                shieldApply()
                task.wait(0.2)
                setStatus("[Instant] Voando...", Color3.fromRGB(100, 200, 255))
                
                local char = lp.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local posOvo = egg.BottomCFrame.Position
                    local dist = (posOvo - hrp.Position).Magnitude
                    local duration = math.max(dist / 800, 0.1)
                    local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posOvo + Vector3.new(0, 3, 0))})
                    tween:Play()
                    tween.Completed:Wait()
                end
                
                if not instantRunning then break end
                task.wait(0.3)

                -- Pega o ovo
                setStatus("[Instant] Pegando...", Color3.fromRGB(255, 200, 100))
                local carried = false
                for i = 1, 25 do
                    if not instantRunning then break end
                    if carryEgg(egg.Uid) then carried = true; break end
                    task.wait(0.05)
                end

                if not carried then
                    shieldUndo()
                    task.wait(0.5)
                    continue
                end

                -- LineDrop pra entregar
                shieldUndo()
                task.wait(0.2)
                setStatus("[Instant] LineDrop...", Color3.fromRGB(255, 160, 60))
                SafeCarry.LineDropHome(function() return not instantRunning end)
                
                if not instantRunning then break end
                task.wait(0.5)
            end
            shieldUndo()
            setStatus("Parado", Color3.fromRGB(255, 200, 100))
        end)
    else
        instantRunning = false
        setStatus("Parando...", Color3.fromRGB(255, 200, 100))
        shieldUndo()
        task.wait(0.3)
        setStatus("Parado", Color3.fromRGB(255, 200, 100))
    end
end

print("[Zyro] BLOCO 3/3 carregado! UI pronta.")
print("[Zyro] Tudo carregado. Use os toggles pra ativar.")
