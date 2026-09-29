-- ZYRO AUTO STEAL v19 - NÃO desce no meio
print("[Zyro] v19 iniciando...")

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
pcall(function() sg.Sparent = parent end)

-- ... (todo o resto da UI igual à v18)

-- ============================================================
-- TP DIRETO (NÃO desce, só no final)
-- ============================================================
local function tpDireto(destino, descerNoFinal)
    descerNoFinal = descerNoFinal or false  -- Padrão: NÃO desce
    local char = lp.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    applyDS()
    RunService.Heartbeat:Wait()

    local seguranca = 0
    while seguranca < 150 do
        if not autoRunning then return false end
        seguranca = seguranca + 1
        char = lp.Character
        if not char then break end
        hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then break end

        local myPos = hrp.Position
        local vector = Vector3.new(destino.X - myPos.X, 0, destino.Z - myPos.Z)
        local dist = vector.Magnitude

        -- Se descerNoFinal == true E chegou perto, desce
        if descerNoFinal and dist < 5 then
            local groundPos = Vector3.new(destino.X, destino.Y, destino.Z)
            local downTween = TweenService:Create(hrp, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {CFrame = CFrame.new(groundPos)})
            tweenAtual = downTween
            downTween:Play()
            downTween.Completed:Wait()
            tweenAtual = nil
            pcall(function()
                hrp.CFrame = CFrame.new(groundPos)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end)
            return true
        end

        -- Se NÃO é pra descer E chegou perto, retorna (mas SEM descer)
        if not descerNoFinal and dist < 5 then
            return true
        end

        local step = math.min(dist, SEGMENTO)
        local dir = vector.Unit
        local nextPos = Vector3.new(
            myPos.X + dir.X * step,
            destino.Y + VOO_ALTO,  -- VOA ALTO o tempo todo
            myPos.Z + dir.Z * step
        )

        local duration = math.max(step / VELOCIDADE, 0.15)
        local targetCF = CFrame.new(nextPos)
        local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCF})
        tweenAtual = tween
        tween:Play()

        local timedOut = false
        task.delay(5, function() timedOut = true end)
        while tween.PlaybackState == Enum.PlaybackState.Playing and not timedOut do
            if not autoRunning then
                pcall(function() tween:Cancel() end)
                return false
            end
            pcall(function()
                hrp.CanCollide = true
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end)
            RunService.Heartbeat:Wait()
        end
        tweenAtual = nil

        pcall(function()
            hrp.CFrame = targetCF
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end)
    end
    return false
end
