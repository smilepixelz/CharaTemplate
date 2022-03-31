game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
game.ReplicatedStorage.Remotes.Functions:InvokeServer({getrenv()._G.Pass,"ChangeSetting","MorphEnabled",false})
game.Players.LocalPlayer.PlayerGui.CharacterSelection.Character.Value = "Undyne"
wait(1)
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.PName:Destroy()
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.HP:Destroy()
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.HealthLabel:Destroy()
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.StaminaBar:Destroy()
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.BackHealth:Destroy()
game.Players.LocalPlayer.Character.Head:WaitForChild("HealthBar").Frame.Health:Destroy()
wait(2)
game.Workspace.ServerEffects.ServerCooldown:Destroy()
game:GetService("Players").LocalPlayer.PlayerScripts.Music:Destroy()
game:GetService("Players").LocalPlayer.Character.ForceField:Destroy()
local v1 = {
    [1] = getrenv()._G.Pass, 
    [2] = "Damage", 
    [3] = math.huge, 
    [4] = game.Players.LocalPlayer.Character
}
local event = game:GetService("ReplicatedStorage").Remotes.Events
event:FireServer(v1)
wait(21)
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
    game.Players.LocalPlayer.Character.Humanoid.Health = 200
    end
end)

wait(3)

function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end

local args = {
    [1] = {
        [1] = getrenv()._G.Pass,
        [2] = "Effect",
        [3] = "HighJump",
        [4] = game.Players.LocalPlayer:GetMouse().Hit.p,
    },
}

game:GetService("ReplicatedStorage").Remotes.UndyneMoves:InvokeServer(unpack(args))

local XLib = {
    ["Functions"] = {
        Chat = function(Cht)
            local A_1 = 
            {
                [1] = getrenv()._G.Pass, 
                [2] = "Chatted", 
                [3] = "[Finale]\n"..cht,
                [4] = Color3.fromRGB(255, 255, 255)
            }
            local Event = game:GetService("ReplicatedStorage").Remotes.Events
            Event:FireServer(A_1)
        end,
        Shake = function(Preset)
            Preset = Preset or "Explosion"
            local CameraShaker = require(game.ReplicatedStorage.ClientModules.CameraShaker)

            local camera = game.Workspace.CurrentCamera
            
            local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
            	camera.CFrame = camera.CFrame * shakeCf
            end)
            
            camShake:Start()
            
            camShake:Shake(CameraShaker.Presets[Preset])
        end,
        Damage = function(knockback, dmg, hiteffect, hittime, type)
            hiteffect = hiteffect or "BladeHitEffect"
        	local args = {
                [1] = getrenv()._G.Pass,
                [2] = game:GetService("Players").LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value,
                [3] = {
                    ["HitTime"] = hittime, 
                    ["Type"] = type, 
                    ["HitEffect"] = hiteffect, 
                    ["CombatInv"] = true,
                    ["HurtAnimation"] = game:GetService("ReplicatedStorage").Animations.HurtAnimations.Hurt1, 
                    ["Velocity"] = knockback, 
                    ["Sound"] = game:GetService("ReplicatedStorage").Sounds.Punch,
                    ["Damage"] = dmg,
                    ["SpecialKey"] = "91203"
                }
            }
            
            game:GetService("ReplicatedStorage").Remotes.Damage:InvokeServer(unpack(args))
        end
    };
}

game.Players.LocalPlayer.Chatted:Connect(function(cht)
    if cht ~= "/console" then
        local A_1 = 
        {
            [1] = getrenv()._G.Pass, 
            [2] = "Chatted", 
            [3] = "[Finale]\n"..cht,
            [4] = Color3.fromRGB(255, 255, 255)
        }
        local Event = game:GetService("ReplicatedStorage").Remotes.Events
        Event:FireServer(A_1)
    end
end)

spawn(function()
    repeat wait()
        for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == 'DrainStamina' or v.Name == 'DrainSprint' or v.Name == 'Hit' or v.Name == 'Hitt' or v.Name == 'Grounded' or v.Name == 'StayGrounded' or v.Name == 'KnockBack' or v.Name == 'Walled' then
                v:Destroy()
            end
        end
    until false
end)

local ya = getrawmetatable(game)
local mum = ya.__namecall
setreadonly(ya, false)
ya.__namecall =
    newcclosure(
    function(name, ...)
        local tabs = {...}
        if getnamecallmethod() == "InvokeServer" and tostring(name) == "Damage" then
            if tabs[3]["Type"] == "Knockback" and tabs[3]["SpecialKey"] ~= "91203" then 
                tabs[3]["Velocity"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 175 + Vector3.new(0, 30, 0) 
                tabs[3]["Damage"] = 40 
                tabs[3]["HitEffect"] = "HeavyHitEffect"
            elseif tabs[3]["Type"] == "Normal" and tabs[3]["SpecialKey"] ~= "91203" then
                tabs[3]["Damage"] = 10
                tabs[3]["HitEffect"] = "BladeHitEffect"
            end
        end
        return mum(name, unpack(tabs))
    end
)

setreadonly(ya, true)

_G.hidechat = true
local mt = getrawmetatable(game)
    local backup = mt.__namecall
    if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
    
    mt.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}

        if tostring(args[1]) == 'SayMessageRequest' and _G.hidechat then
        return
        end
        return backup(...)
    end)

local Mouse = game.Players.LocalPlayer:GetMouse()

Mouse.KeyDown:Connect(function(key)
    if key == "r" then 
        function getlockchar()
            local char = game.Players.LocalPlayer.Backpack.Main.LockOnScript.LockOn.Value
            return char
        end
        if getlockchar() ~= nil then 
            XLib["Functions"].Shake("Explosion")
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getlockchar().HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
        end
    end
end)

function AddAura()
    local NUM = {}

    local Z

    local Rad = 0
    local Rad2 = 0
    local Inc = 0
    
    Z = game.Players.LocalPlayer.Character:WaitForChild("Attacks").ChildAdded:Connect(function(C)
            print(C.Name)
            if C.Name == "MultiSpear" then
                Rad = Rad + 2
                Inc = Inc + 0.1 
                Rad2 = Rad2 + Inc
                local X,Y,Z = Rad2, Rad2, Rad
                local Part = Instance.new("Part") Part.Name = "Part" Part.Parent = game.Players.LocalPlayer.Character Part.Anchored = false Part.CanCollide = false Part.Massless = true Part.Transparency = 1 local Weld = Instance.new("Weld") Weld.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart Weld.Part0 = game.Players.LocalPlayer.Character.Torso Weld.Part1 = Part Weld.C0 = CFrame.new(0,Y,Z) * CFrame.Angles(math.rad(90+-(Rad)), 0, 0) Weld.Name = "Weld"
                C:WaitForChild("NotTouched"):Destroy()
                C:WaitForChild("LocalScript"):Destroy()
                C:WaitForChild("ParticleEmitter"):Destroy()
                C:WaitForChild("BodyVelocity"):Destroy()
                local E = Instance.new("BodyPosition")
                E.P = 35000
                E.D = 1000-(Rad/10)
                E.Parent = C 
                E.MaxForce = Vector3.new(1,1,1) * math.huge
                E.Position = Part.Position
                local Z = Instance.new("BodyGyro")
                Z.P = 35000
                Z.D = 1000
                Z.Parent = C 
                Z.CFrame = Part.CFrame
                spawn(function()
                    while wait() do 
                        E.Position = Part.Position
                        Z.CFrame = Part.CFrame
                    end
                end)
            elseif C.Name == "HugeSpear" then 
                C:WaitForChild("NotTouched"):Destroy()
                C:WaitForChild("LocalScript"):Destroy()
                C:WaitForChild("ParticleEmitter"):Destroy()
                C:WaitForChild("BodyVelocity"):Destroy()
                local SpearC = game.Players.LocalPlayer.Character.Spear.CFrame
                local SpearP = game.Players.LocalPlayer.Character.Spear.Position
                local E = Instance.new("BodyPosition")
                E.P = 35000
                E.D = 1000
                E.Parent = C 
                E.MaxForce = Vector3.new(1,1,1) * math.huge
                E.Position = game.Players.LocalPlayer.Character.Spear.Position
                local Z = Instance.new("BodyGyro")
                Z.P = 35000
                Z.D = 1000
                Z.Parent = C 
                Z.CFrame = game.Players.LocalPlayer.Character.Spear.CFrame
                spawn(function()
                    while wait() do 
                        E.Position = game.Players.LocalPlayer.Character.Spear.Position
                        Z.CFrame = game.Players.LocalPlayer.Character.Spear.CFrame
                    end
                end)
            end
        end)

    spawn(function()
        local args = {
            [1] = {
                [1] = getrenv()._G.Pass,
                [2] = "Spear",
                [3] = "MultipleSpears",
                [4] = 20
            }
        }

        game:GetService("ReplicatedStorage").Remotes.UndyneMoves:InvokeServer(unpack(args))
        wait(1)
        local args = {
            [1] = {
                [1] = getrenv()._G.Pass,
                [2] = "Spear",
                [3] = "Special",
            },
        }

        game:GetService("ReplicatedStorage").Remotes.UndyneMoves:InvokeServer(unpack(args))
    end)
end

AddAura()

spawn(function()
    while wait() do 
        if #game.Players.LocalPlayer.Character.Attacks:GetChildren() == 0 then 
            AddAura() 
        end
    end
end)

return XLib
