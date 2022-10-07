local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(0,139,139), --Teal/Dark Cyan
    Background = Color3.fromRGB(24,25,25), --Dim Grey
    Header = Color3.fromRGB(29,31,31), --Light Grey
    TextColor = Color3.fromRGB(255,255,255), --White
    ElementColor = Color3.fromRGB(0,0,0) --4
}
local Window = Library.CreateLib("Azure-X | Version 1.0", colors)

    --GUI
    local GUI = Window:NewTab("GUI")
    local GUISection = GUI:NewSection("GUI Options")

    GUISection:NewButton("Infinite Yield", "FE Admin Commands", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)
    GUISection:NewButton("Chat Spoofer", "Lets you chat for other people", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
    end)
    GUISection:NewButton("Fates ESP", "Open ESP GUI", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua'))()
    end)
    GUISection:NewButton("AutoClicker", "Autoclicker GUI", function()
        loadstring(game:HttpGet('loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/JustEzpi/ROBLOX-Scripts/main/ROBLOX_AutoClicker"))()'))()
    end)
    GUISection:NewTextBox("Custom Script", "Enter script of choice", function(script)
        loadstring(game:HttpGet(script))()
    end)

    --LOCAL PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player Options")

    PlayerSection:NewSlider("Walkspeed", "Change Player Speed", 500, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerSection:NewSlider("Jumppower", "Change Player Jump Height", 350, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerSection:NewButton("Reset WS/JP", "Reset Walkspeed + Jumppower", function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end)
    PlayerSection:NewButton("Kill Self", "Reset your character", function()
        local healthplayer = game.Players.LocalPlayer.Character.Humanoid
        local healthplayer = game.Workspace[player.Name].Humanoid
        healthplayer.Health = 0
    end)
    PlayerSection:NewToggle("Infinite Jump", "Lets you jump mid air", function(state)
    local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';

    _G.JumpHeight = 50;
    function Action(Object, Function) if Object ~= nil then Function(Object); end end

    UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    if state then
                        Action(self.Parent.HumanoidRootPart, function(self)
                            self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                        end)
                    else
                        -- Don't inf jump
                    end
                end
                end)
            end  
        end)
    end)

    --Aimbot
    local Aimbot = Window:NewTab("Aimbot")
    local AimbotSection = Aimbot:NewSection("Aimbot Options")
    local Camera = workspace.CurrentCamera
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer
    local Holding = false
    
    _G.AimPart = "Head" -- Where the aimbot script would lock at.
    _G.Sensitivity = 0.2 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
    
    _G.CircleSides = 64 -- How many sides the FOV circle would have.
    _G.CircleColor = Color3.fromRGB(0,139,139) -- (RGB) Color that the FOV circle would appear as.
    _G.CircleTransparency = 0.7 -- Transparency of the circle.
    _G.CircleRadius = 80 -- The radius of the circle / FOV.
    _G.CircleFilled = false -- Determines whether or not the circle is filled.
    _G.CircleVisible = false -- Determines whether or not the circle is visible.
    _G.CircleThickness = 0 -- The thickness of the circle.
    
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness
    
    local function GetClosestPlayer()
        local MaximumDistance = _G.CircleRadius
        local Target = nil
    
        for _, v in next, Players:GetPlayers() do
            if v.Name ~= LocalPlayer.Name then
                if _G.TeamCheck == true then
                    if v.Team ~= LocalPlayer.Team then
                        if v.Character ~= nil then
                            if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                    local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                    local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                    
                                    if VectorDistance < MaximumDistance then
                                        Target = v
                                    end
                                end
                            end
                        end
                    end
                else
                    if v.Character ~= nil then
                        if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                            if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                
                                if VectorDistance < MaximumDistance then
                                    Target = v
                                end
                            end
                        end
                    end
                end
            end
        end
    
        return Target
    end
    
    UserInputService.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = false
        end
    end)
    
    RunService.RenderStepped:Connect(function()
        FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Filled = _G.CircleFilled
        FOVCircle.Color = _G.CircleColor
        FOVCircle.Visible = _G.CircleVisible
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Transparency = _G.CircleTransparency
        FOVCircle.NumSides = _G.CircleSides
        FOVCircle.Thickness = _G.CircleThickness
    
        if Holding == true and _G.AimbotEnabled == true then
            TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
        end
    end)
    AimbotSection:NewToggle("Aimbot", "Lock on to players", function(state)
        if state then
            _G.AimbotEnabled = true
        else
            _G.AimbotEnabled = false
        end
    end)
    AimbotSection:NewToggle("FOV", "Toggle Aimbot FOV", function(state)
        if state then
            _G.CircleVisible = true
        else
            _G.CircleVisible = false
        end
    end)
    AimbotSection:NewToggle("Team Check", "Check if player is in your team", function(state)
        if state then
            _G.TeamCheck = true
        else
            _G.TeamCheck = false
        end
    end)
    AimbotSection:NewSlider("FOV Thickness", "Change FOV circle thickness", 10, 0, function(s)
        _G.CircleThickness = s
    end)
    AimbotSection:NewSlider("FOV Radius", "Change FOV circle radius", 100, 25, function(s)
        _G.CircleRadius = s
    end)
    AimbotSection:NewColorPicker("FOV Color", "Change the FOV circle color", Color3.fromRGB(0,139,139), function(color)
        _G.CircleColor = color
    end)

    --Other
    local Other = Window:NewTab("Other")
    local OtherSection = Other:NewSection("Other Options")

    OtherSection:NewButton("Anti AFK", "Removes the afk kick", function()
        if not game:IsLoaded() then game.Loaded:Wait(); end

        local idledEvent = game:GetService("Players").LocalPlayer.Idled
        local function disable()
            for _, cn in ipairs(getconnections(idledEvent)) do
                cn:Disable()
            end
        end
        
        oldConnect = hookfunction(idledEvent.Connect, function(self, ...)
            local cn = oldConnect(self, ...); disable()
            return cn
        end)
        
        namecall = hookmetamethod(game, "__namecall", function(self, ...)
            if self == idledEvent and getnamecallmethod() == "Connect" then
                local cn = oldConnect(self, ...); disable()
                return cn
            end
            return namecall(self, ...)
        end)
        
        disable()
    end)
    OtherSection:NewTextBox("Teleport To Player", "Teleport to selected player", function(plyr)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local target = game.Players:FindFirstChild(plyr)
        
        character:MoveTo(target.Character.Head.Position)
    end)
    
    --Keybinds
    local Keybinds = Window:NewTab("Keybinds")
    local KeybindsSection = Keybinds:NewSection("Keybind Options")

    KeybindsSection:NewKeybind("Open UI", "Opens the GUI", Enum.KeyCode.RightShift, function()
        Library:ToggleUI()
    end)
    KeybindsSection:NewKeybind("Aimbot", "Toggle Aimbot", Enum.KeyCode.RightControl, function()
        _G.AimbotEnabled = not _G.AimbotEnabled
    end)
    KeybindsSection:NewKeybind("ClickTP", "Teleport to your cursor", Enum.KeyCode.F, function()
        mouse = game.Players.LocalPlayer:GetMouse()
        local pos = mouse.Hit+Vector3.new(0,2.5,0)
        pos = CFrame.new(pos.X,pos.Y,pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        tool.Parent = game.Players.LocalPlayer.Backpack
    end)

    --Credits
    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")

    CreditsSection:NewButton("Trixxy#4663", "Made By Trixxy#4663", function()
    end)