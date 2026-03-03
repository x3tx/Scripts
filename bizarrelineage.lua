---@diagnostic disable: undefined-global

loadstring(game:HttpGet("https://pastebin.com/raw/15bT0XYm"))()

local plrservice = game:GetService("Players") 
local plr = plrservice:GetChildren()
local HumanoidRootPart= game.Players.LocalPlayer.Character.HumanoidRootPart
local Huge = math.Huge

repeat wait() until game:IsLoaded() 

local VIM = game:GetService("VirtualInputManager")

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end


function getclosestmob()
    local ret = {nil, math.huge} 
    for i,v in pairs(workspace.Live:GetChildren()) do 
        if v:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer.Character  and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and not v.Name:match("Hostage") and not v.Name:match("Server") then 
            local magnitude = (HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude 
            if magnitude < ret[2] then 
                ret[2] = magnitude 
                ret[1] = v 
            end 
        end 
        for i1,v1 in pairs(v:GetChildren()) do 
            if v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and v1.Humanoid.Health > 0 then 
                local magnitude = (HumanoidRootPart.Position - v1.HumanoidRootPart.Position).Magnitude 
                if magnitude < ret[2] then 
                    ret[2] = magnitude 
                    ret[1] = v1
                end 
            end 
            for i2,v2 in pairs(v1:GetChildren()) do 
                if v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then 
                    local magnitude = (HumanoidRootPart.Position - v2.HumanoidRootPart.Position).Magnitude 
                    if magnitude < ret[2] then 
                        ret[2] = magnitude 
                        ret[1] = v2
                    end 
                end 
            end 
        end 
    end 
    return ret[1]
end 

local lib = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local subs = lib.subs 
local libclose = subs.Wait

local window = lib:CreateWindow({
    Name = "Zyrc Hub",
    Themeable = {
        Info = {"KONTOL"},
        Credit = false, 
        Background = "",
        Visible = true
    }
})

local main1 = window:CreateTab({
    Name = "Auto Farm"
})

local section1 = main1:CreateSection({
    Name = "Auto Farm"
})

local section4 = main1:CreateSection({
    Name = "Misc",
    Side = "Right"
})
local section2 = main1:CreateSection({
    Name = "Auto's",
    Side = "Right"
})

local section5 = main1:CreateSection({
    Name = "TPS"
})

local section6 = main1:CreateSection({
    Name = "Auto EXP"
})
local section4 = main1:CreateSection({
    Name = "Raids",
    Side = "Right"
})

--// =========================
--// ZYRC HUB CONFIG SYSTEM
--// =========================

local CONFIG_FOLDER = "ZyrcHubConfigs"
local DEFAULT_CONFIG = "default"

-- Create Config Tab
local configTab = window:CreateTab({
    Name = "Config"
})

local configSection = configTab:CreateSection({
    Name = "Config Manager"
})

-- Add Persistence Element
local persistence = configSection:AddPersistence({
    Name = "Config File",
    Flag = "ConfigFile",
    Workspace = CONFIG_FOLDER
})

-- Manual Save Button
configSection:AddButton({
    Name = "Save Config",
    Callback = function()
        if persistence then
            persistence:SaveFile(DEFAULT_CONFIG)
        end
    end
})

-- Manual Load Button
configSection:AddButton({
    Name = "Load Config",
    Callback = function()
        if persistence then
            persistence:LoadFile(DEFAULT_CONFIG)
        end
    end
})

-- Auto Load On Startup
task.spawn(function()
    task.wait(1) -- wait for UI to fully initialize

    if isfolder and not isfolder(CONFIG_FOLDER) then
        makefolder(CONFIG_FOLDER)
    end

    if isfile and isfile(CONFIG_FOLDER .. "/" .. DEFAULT_CONFIG .. ".json") then
        persistence:LoadFile(DEFAULT_CONFIG)
    else
        persistence:SaveFile(DEFAULT_CONFIG)
    end
end)


local xx = {}

local ff = {
    "Dr. Bosconovitch", 
    "Akira Otoishi",
    "Zombie Rudol von Stroheim",
    "Okuyasu Nijimura PRIME",
    "Miyamoto Musashi",
    "Yoshikage Kira"
}


local mm = {

    ["Spin User"] = Vector3.new(1823.47522, 979.471069, 1554.76904),
    ["Cultist"] = Vector3.new(1823.47522, 979.471069, 1554.76904),
    ["Vampire"] = Vector3.new(1823.47522, 979.471069, 1554.76904),

    ["Elite Vampire"] = Vector3.new(2125.83057, 910.52887, 1422.74438),
    ["Zombie"] = Vector3.new(2125.83057, 910.52887, 1422.74438),
    ["Zombie Grunt"] = Vector3.new(2125.83057, 910.52887, 1422.74438),

    ["Rogue Rock Human"] = Vector3.new(1633.09668, 933.146606, 1329.90857),
    ["Hamon Apprentice"] = Vector3.new(1633.09668, 933.146606, 1329.90857),

    ["Night Vampire"] = Vector3.new(1561.27332, 876.18512, 251.074799),
    ["Thug"] = Vector3.new(1561.27332, 876.18512, 251.074799),
    ["Mafia Member"] = Vector3.new(1561.27332, 876.18512, 251.074799),

    ["Thief"] = Vector3.new(1692.29956, 874.511658, 153.032227),
    ["Samurai"] = Vector3.new(1692.29956, 874.511658, 153.032227),

    ["Samurai Master"] = Vector3.new(1953.82605, 874.659729, -186.887161),

    ["Delinquent"] = Vector3.new(1383.68359, 881.792542, -485.135925),
    ["Yakuza"] = Vector3.new(1383.68359, 881.792542, -485.135925),

    ["Corrupt Police"] = Vector3.new(918.58252, 885.79248, -618.79834),
    ["Prison Escapee"] = Vector3.new(918.58252, 885.79248, -618.79834),
    ["Elite Mafia Member"] = Vector3.new(918.58252, 885.79248, -618.79834),

    ["Cyborg"] = Vector3.new(618.588684, 886.061096, -184.376724),

}

local two = {
    "Spin User",
    "Cultist",
    "Vampire",
    "Elite Vampire",
    "Zombie",
    "Zombie Grunt",
    "Rogue Rock Human",
    "Hamon Apprentice",
    "Night Vampire",
    "Thug",
    "Mafia Member",
    "Thief",
    "Samurai",
    "Samurai Master",
    "Delinquent",
    "Yakuza",
    "Corrupt Police",
    "Prison Escapee",
    "Cyborg",
    "Elite Mafia Member",
}
local function addPlayer(name)
    table.insert(xx, name)

    table.sort(xx, function(a, b)
        return a:lower() < b:lower()
    end)
end


for i,v in pairs(game:GetService("ReplicatedStorage").assets["npc_cache"]:GetChildren()) do
    addPlayer(v.Name)
end
local savedtick = tick()
local curtarget = nil 
local Bossname
local Mobname
section1:AddDropdown({
    Name = "Bosses", 
    Nothing = "Select Boss..", 
    List = ff, 
    Flag = "Bosses", 
    Callback = function(selected)
        Bossname = selected
    end 
})

section1:AddDropdown({
    Name = "NPCS", 
    Nothing = "Select NPC..", 
    List = two, 
    Flag = "NPCS", 
    Callback = function(selected)
        Mobname = selected
        HumanoidRootPart.CFrame = CFrame.new(mm[tostring(Mobname)])

    end 
})


section1:AddDropdown({
    Name = "Method", 
    Nothing = "Select Method..", 
    List = {"Above", "Below"}, 
    Flag = "SW", 
    Callback = function(selected)
        Method = selected 
    end 
})

section5:AddDropdown({
    Name = "NPC", 
    Nothing = "Select NPC..", 
    List = xx, 
    Flag = "TP", 
    Callback = function(selected)
        Something = selected 
    end 
})

section5:AddButton({
    Name = "Teleport", 
    Callback = function(selected)
        HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").assets["npc_cache"][tostring(Something)].HumanoidRootPart.CFrame
    end 
})

local Dist = 9
local bosstarget
local mobtarget

section4:AddToggle({
    Name = "Auto Kira Raid", 
    Value = false, 
    Flag = "rrrr", 
    Callback = function(state)
        l = state 
        while l do 
            if tonumber(game.PlaceId) == 14890802310 then
                HumanoidRootPart.CFrame = CFrame.new(1036.37317, 875.602539, -650.364441, 0.97298795, -8.49635668e-08, 0.230855867, 1.01950278e-07, 1, -6.16524289e-08, -0.230855867, 8.35228917e-08, 0.97298795)
                local args = {
                    workspace:WaitForChild("Npcs"):WaitForChild("Yoshikage Kira"),
                    "Raid."
                }
                game:GetService("ReplicatedStorage"):WaitForChild("requests"):WaitForChild("character"):WaitForChild("dialogue"):FireServer(unpack(args))
                
                wait()
            elseif tonumber(game.PlaceId) == 74747090658891 then
                local target = getclosestmob()
                print("ffff")
                spawn(function()
                         local args = {
                        true,
                        false
                    }
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("M1"):FireServer(unpack(args))
                end)
                if target and target:FindFirstChild("HumanoidRootPart") and not target.Name:match("Hostage") and not target.Name:match("Server") then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
                task.wait()
                end
            end
            
            
            task.wait()
        end 
    
})

section4:AddToggle({
    Name = "Auto DIO Raid", 
    Value = false, 
    Flag = "somethingelse", 
    Callback = function(state)
        l = state 
        while l do 
            if tonumber(game.PlaceId) == 14890802310 then
                HumanoidRootPart.CFrame = CFrame.new(2791.06689, 950.706116, 742.34613, 0.0956081524, 3.53645269e-09, 0.995419025, -2.09963122e-08, 1, -1.53607072e-09, -0.995419025, -2.07532675e-08, 0.0956081524)
                local args = {
                    workspace:WaitForChild("Npcs"):WaitForChild("???"),
                    "Raid."
                }
                game:GetService("ReplicatedStorage"):WaitForChild("requests"):WaitForChild("character"):WaitForChild("dialogue"):FireServer(unpack(args))

                
                wait()
            elseif tonumber(game.PlaceId) == 74747090658891 then
                local target = getclosestmob()
                print("ffff")
                spawn(function()
                         local args = {
                        true,
                        false
                    }
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("M1"):FireServer(unpack(args))
                end)
                if target and target:FindFirstChild("HumanoidRootPart") and not target.Name:match("Hostage") and not target.Name:match("Server") then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
                task.wait()
                end
            end
            
            
            task.wait()
        end 
    
})

section4:AddToggle({
    Name = "Auto Jataro Raid", 
    Value = false, 
    Flag = "racketskibidit", 
    Callback = function(state)
        l = state 
        while l do 
            if tonumber(game.PlaceId) == 14890802310 then
                HumanoidRootPart.CFrame = CFrame.new(1075.32422, 884.225525, 208.307587, 0.998804092, -1.68689027e-08, -0.0488912798, 1.53527449e-08, 1, -3.13863318e-08, 0.0488912798, 3.05981835e-08, 0.998804092)
                local args = {
                    workspace:WaitForChild("Npcs"):WaitForChild("Chumbo"),
                    "Raid."
                }
                game:GetService("ReplicatedStorage"):WaitForChild("requests"):WaitForChild("character"):WaitForChild("dialogue"):FireServer(unpack(args))
                
                wait()
            elseif tonumber(game.PlaceId) == 74747090658891 then
                local target = getclosestmob()
                print("ffff")
                spawn(function()
                         local args = {
                        true,
                        false
                    }
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("M1"):FireServer(unpack(args))
                end)
                if target and target:FindFirstChild("HumanoidRootPart") and not target.Name:match("Hostage") and not target.Name:match("Server") then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
                task.wait()
                end
            end
            
            
            task.wait()
        end 
    
})

section4:AddToggle({
    Name = "Auto Avdol Raid", 
    Value = false, 
    Flag = "Avdol", 
    Callback = function(state)
        l = state 
        while l do 
            if tonumber(game.PlaceId) == 14890802310 then
                HumanoidRootPart.CFrame = CFrame.new(345.42511, 876.082092, 1017.30103, -0.340180874, -1.34618139e-08, 0.94036001, -4.34269332e-09, 1, 1.27446e-08, -0.94036001, 2.51773963e-10, -0.340180874)
                local args = {
                    workspace:WaitForChild("Npcs"):WaitForChild("Muhammad Avdol"),
                    "Raid."
                }
                game:GetService("ReplicatedStorage"):WaitForChild("requests"):WaitForChild("character"):WaitForChild("dialogue"):FireServer(unpack(args))
                
                wait()
            elseif tonumber(game.PlaceId) == 74747090658891 then
                local target = getclosestmob()
                print("ffff")
                spawn(function()
                         local args = {
                        true,
                        false
                    }
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("M1"):FireServer(unpack(args))
                end)
                if target and target:FindFirstChild("HumanoidRootPart") and not target.Name:match("Hostage") and not target.Name:match("Server") then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
                task.wait()
                end
            end
            
            
            task.wait()
        end 
    
})

section4:AddToggle({
    Name = "Auto Retry", 
    Value = false, 
    Flag = "eeqwrqweqwe", 
    Callback = function(state)
        l = state 
        while l do 
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("raidcomplete") then
                game:GetService("ReplicatedStorage").requests.character.retryraid:FireServer()
            end
            task.wait()
        end 
        task.wait()
    end
})

local function HoldE()
	-- Press E down
	VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	
	-- Hold for 1 second
	task.wait(0.7)
	
	-- Release E
	VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

section6:AddToggle({
    Name = "Auto HOLD E", 
    Value = false, 
    Flag = "AutoHoldE", 
    Callback = function(state)
        l = state 
        while l do 
            HoldE()
            task.wait()
        end 
        task.wait()
    end
})


section6:AddToggle({
    Name = "Auto EXP (alt)", 
    Value = false, 
    Flag = "AutoEXPALT", 
    Callback = function(state)
        l = state 
        while l do 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1541.82776, 875.992432, -25.0460663, 0.995717883, -4.26393018e-11, -0.0924439579, -8.50705201e-11, 1, -1.37754308e-09, 0.0924439579, 1.37950862e-09, 0.995717883)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            task.wait()
        end 
        task.wait()
    end
})

section6:AddToggle({
    Name = "Auto EXP", 
    Value = false, 
    Flag = "AUTOEXPMAIN", 
    Callback = function(state)
        l = state 
        while l do 
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1541.82776, 875.992432, -25.0460663, 0.995717883, -4.26393018e-11, -0.0924439579, -8.50705201e-11, 1, -1.37754308e-09, 0.0924439579, 1.37950862e-09, 0.995717883)

            task.wait()
        end 
        task.wait()
    end
})
section1:AddSlider({
    Name = "Distance",
    Min = 9,
    Max = 100,
    Flag = "asdjjiwd",
       Callback = function(selected)
        print(selected)
        Dist = selected 
    end 
})

section1:AddToggle({
    Name = "Auto BOSS", 
    Value = false, 
    Flag = "asdasdwggg", 
    Callback = function(state)
        l = state 
        while l do 
            local target = getclosestmob() 
            if Bossname ~= nil then
                 for i,v in pairs(workspace.Live:GetChildren()) do
                    if v.Name:match(Bossname) then
                        print(v)
                        bosstarget = v
                    end
                end
                if bosstarget and bosstarget:FindFirstChild("HumanoidRootPart") then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(bosstarget.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, bosstarget.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(bosstarget.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, bosstarget.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(bosstarget.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, bosstarget.HumanoidRootPart.Position)
                    end
                end 
            end
        end
    end
})

section1:AddToggle({
    Name = "Auto Mobs (specific)", 
    Value = false, 
    Flag = "gggggg", 
    Callback = function(state)
        l = state 
        while l do 
            local target = getclosestmob()
                
                if target and target:FindFirstChild("HumanoidRootPart") and target.Name:match(Mobname) then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
            task.wait()
        end
           
            task.wait()
    end 
    
})


section1:AddToggle({
    Name = "Auto Near Mobs", 
    Value = false, 
    Flag = "NB", 
    Callback = function(state)
        l = state 
        while l do 
            local target = getclosestmob()
                
                if target and target:FindFirstChild("HumanoidRootPart")  then 
                    if Method == "Above" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,Dist,0).Position, target.HumanoidRootPart.Position)
                    elseif Method == "Below" then
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)

                    else
                        HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position + CFrame.new(0,-Dist,0).Position, target.HumanoidRootPart.Position)
                    end
                end 
                task.wait()
            end
           
            task.wait()
        end 
    
})




section2:AddToggle({
    Name = "Auto Summon Stand", 
    Value = false, 
    Flag = "Summon", 
    Callback = function(state)
        k = state 
        while k do 
            if not game.Players.LocalPlayer.Character:GetAttribute("SummonedStand") then
                game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("SummonStand"):FireServer()
            end
            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto M1", 
    Value = false, 
    Flag = "m1", 
    Callback = function(state)
        k = state 
        while k do 
            local args = {
                true,
                false
            }
            game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("M1"):FireServer(unpack(args))
            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (E)", 
    Value = false, 
    Flag = "E", 
    Callback = function(state)
        k = state 
        while k do 
            local args = {
                "E",
                true
            }
            game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (R)", 
    Value = false, 
    Flag = "R", 
    Callback = function(state)
        k = state 
        while k do 
local args = {
	"R",
	true
}
game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (Z)", 
    Value = false, 
    Flag = "Z", 
    Callback = function(state)
        k = state 
        while k do 
local args = {
	"Z",
	true
}
game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (X)", 
    Value = false, 
    Flag = "X", 
    Callback = function(state)
        k = state 
        while k do 
local args = {
	"X",
	true
}
game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (C)", 
    Value = false, 
    Flag = "C", 
    Callback = function(state)
        k = state 
        while k do 
local args = {
	"C",
	true
}
game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})

section2:AddToggle({
    Name = "Auto Skill (V)", 
    Value = false, 
    Flag = "V", 
    Callback = function(state)
        k = state 
        while k do 
local args = {
	"V",
	true
}
game:GetService("Players").LocalPlayer.Character:WaitForChild("client_character_controller"):WaitForChild("Skill"):FireServer(unpack(args))

            task.wait()
        end 
    end 
})


for i,v in pairs(getconnections(Player.Idled)) do 
    v:Disable()
end
