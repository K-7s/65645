return(function(sTnXB, ...)
local ew0a1F = {"jlGF8x";"T9ZT3pVU7aFM72";"PcxF9cJ0k0V8aWfB1";"CMvQ";"ijDeDm7Bn4ozJ6hVL";"7NZH";"YGGIfHPK7LtEib";"w6m8jqdjxrRd";"wXk3rrWy";"6rnkQbG7"}
local ldkdg6Lv = function(...)
-- ============================================================================
-- PROJECT: S7LE HUB // ULTRA EDITION (v4.0)
-- DEVELOPER & RIGHTS: s7le
-- COMPLIANCE: 100% Legal Client-Side Visuals, Performance, Camera & Utility
-- ============================================================================

local Players = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local Lighting = game:GetService(loadstring(base64decode("TGlnaHRpbmc="))())
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local Stats = game:GetService(loadstring(base64decode("U3RhdHM="))())
local VirtualUser = game:GetService(loadstring(base64decode("VmlydHVhbFVzZXI="))())
local UserInputService = game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local TeleportService = game:GetService(loadstring(base64decode("VGVsZXBvcnRTZXJ2aWNl"))())
local HttpService = game:GetService(loadstring(base64decode("SHR0cFNlcnZpY2U="))())
local SoundService = game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))())
local TweenService = game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))())
local StarterGui = game:GetService(loadstring(base64decode("U3RhcnRlckd1aQ=="))())
local CoreGui = game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())
local GuiService = game:GetService(loadstring(base64decode("R3VpU2VydmljZQ=="))())
local Debris = game:GetService(loadstring(base64decode("RGVicmlz"))())
local ChatService = game:GetService(loadstring(base64decode("Q2hhdA=="))())

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local SessionStart = os.clock()

-- ============================================================================
-- [01] ORIGINAL ENVIRONMENT STATE SNAPSHOT
-- ============================================================================
local OriginalState = {
    GlobalShadows = Lighting.GlobalShadows,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FieldOfView = Camera and Camera.FieldOfView or 70,
    MaxZoom = LocalPlayer.CameraMaxZoomDistance,
    WaterWaveSize = 0.15,
    WaterWaveSpeed = 10,
    WaterReflectance = 1
}

local TerrainRef = workspace:FindFirstChildOfClass(loadstring(base64decode("VGVycmFpbg=="))())
if TerrainRef then
    OriginalState.WaterWaveSize = TerrainRef.WaterWaveSize
    OriginalState.WaterWaveSpeed = TerrainRef.WaterWaveSpeed
    OriginalState.WaterReflectance = TerrainRef.WaterReflectance
end

-- ============================================================================
-- [02] CONNECTION & LIFECYCLE MANAGER
-- ============================================================================
local Lifecycle = {
    Connections = {},
    CreatedObjects = {},
    ResetCallbacks = {},
    ConfigValues = {}
}

function Lifecycle:TrackConnection(conn)
    if conn then table.insert(self.Connections, conn) end
    return conn
end

function Lifecycle:TrackObject(obj)
    if obj then table.insert(self.CreatedObjects, obj) end
    return obj
end

function Lifecycle:RegisterReset(fn)
    if type(fn) == loadstring(base64decode("ZnVuY3Rpb24="))() then table.insert(self.ResetCallbacks, fn) end
end

function Lifecycle:DestroyAll()
    for _, conn in ipairs(self.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    self.Connections = {}
    for _, obj in ipairs(self.CreatedObjects) do
        pcall(function() if obj and obj.Parent then obj:Destroy() end end)
    end
    self.CreatedObjects = {}
end

local RootGuiParent = (gethui and gethui()) or CoreGui
if RootGuiParent:FindFirstChild(loadstring(base64decode("UzdMRV9VTFRSQV9WNA=="))()) then
    RootGuiParent.S7LE_ULTRA_V4:Destroy()
end

local ScreenGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
ScreenGui.Name = loadstring(base64decode("UzdMRV9VTFRSQV9WNA=="))()
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = RootGuiParent
Lifecycle:TrackObject(ScreenGui)

-- ============================================================================
-- [03] MULTI-THEME ENGINE (7 THEMES)
-- ============================================================================
local ThemeCatalog = {
    {
        Name = loadstring(base64decode("2LPYp9mK2KjYsSDYo9iu2LbYsSAoRW1lcmFsZCBDeWJlcik="))(),
        Base = Color3.fromRGB(10, 11, 15),
        Sidebar = Color3.fromRGB(7, 8, 11),
        Card = Color3.fromRGB(16, 18, 25),
        CardHover = Color3.fromRGB(23, 26, 36),
        CardActive = Color3.fromRGB(29, 33, 46),
        Primary = Color3.fromRGB(0, 235, 150),
        Secondary = Color3.fromRGB(0, 165, 255),
        Text = Color3.fromRGB(245, 247, 252),
        SubText = Color3.fromRGB(148, 155, 175),
        Border = Color3.fromRGB(36, 40, 54),
        Success = Color3.fromRGB(0, 230, 135),
        Warning = Color3.fromRGB(255, 195, 65),
        Danger = Color3.fromRGB(245, 75, 95)
    },
    {
        Name = loadstring(base64decode("2YbZitmI2YYg2YXYrdmK2LfZiiAoT2NlYW5pYyBOZW9uKQ=="))(),
        Base = Color3.fromRGB(9, 12, 18),
        Sidebar = Color3.fromRGB(6, 9, 14),
        Card = Color3.fromRGB(14, 19, 29),
        CardHover = Color3.fromRGB(20, 28, 42),
        CardActive = Color3.fromRGB(26, 36, 54),
        Primary = Color3.fromRGB(0, 185, 255),
        Secondary = Color3.fromRGB(115, 85, 255),
        Text = Color3.fromRGB(242, 246, 255),
        SubText = Color3.fromRGB(145, 160, 182),
        Border = Color3.fromRGB(32, 43, 62),
        Success = Color3.fromRGB(0, 225, 165),
        Warning = Color3.fromRGB(255, 200, 70),
        Danger = Color3.fromRGB(245, 80, 105)
    },
    {
        Name = loadstring(base64decode("2KzZhdi02Kog2YXZhNmD2YogKFJveWFsIEFtZXRoeXN0KQ=="))(),
        Base = Color3.fromRGB(13, 10, 18),
        Sidebar = Color3.fromRGB(9, 7, 13),
        Card = Color3.fromRGB(21, 16, 28),
        CardHover = Color3.fromRGB(29, 22, 39),
        CardActive = Color3.fromRGB(38, 29, 51),
        Primary = Color3.fromRGB(185, 85, 255),
        Secondary = Color3.fromRGB(255, 75, 145),
        Text = Color3.fromRGB(248, 244, 255),
        SubText = Color3.fromRGB(165, 150, 182),
        Border = Color3.fromRGB(46, 36, 62),
        Success = Color3.fromRGB(70, 235, 155),
        Warning = Color3.fromRGB(255, 190, 75),
        Danger = Color3.fromRGB(255, 75, 105)
    },
    {
        Name = loadstring(base64decode("2LPYqNisINmC2LHZhdiy2YogKENyaW1zb24gT2JzaWRpYW4p"))(),
        Base = Color3.fromRGB(14, 10, 12),
        Sidebar = Color3.fromRGB(10, 7, 8),
        Card = Color3.fromRGB(23, 16, 19),
        CardHover = Color3.fromRGB(33, 23, 28),
        CardActive = Color3.fromRGB(44, 30, 36),
        Primary = Color3.fromRGB(255, 65, 95),
        Secondary = Color3.fromRGB(255, 145, 55),
        Text = Color3.fromRGB(252, 245, 247),
        SubText = Color3.fromRGB(175, 150, 158),
        Border = Color3.fromRGB(54, 36, 43),
        Success = Color3.fromRGB(55, 230, 145),
        Warning = Color3.fromRGB(255, 195, 65),
        Danger = Color3.fromRGB(255, 65, 85)
    },
    {
        Name = loadstring(base64decode("2LDZh9io2Yog2YXZhNmD2YogKFNvbGFyIEdvbGQp"))(),
        Base = Color3.fromRGB(13, 12, 10),
        Sidebar = Color3.fromRGB(9, 8, 7),
        Card = Color3.fromRGB(22, 20, 16),
        CardHover = Color3.fromRGB(32, 29, 23),
        CardActive = Color3.fromRGB(42, 38, 30),
        Primary = Color3.fromRGB(255, 195, 45),
        Secondary = Color3.fromRGB(255, 115, 45),
        Text = Color3.fromRGB(252, 250, 244),
        SubText = Color3.fromRGB(172, 165, 148),
        Border = Color3.fromRGB(52, 47, 36),
        Success = Color3.fromRGB(70, 230, 140),
        Warning = Color3.fromRGB(255, 200, 60),
        Danger = Color3.fromRGB(245, 80, 85)
    },
    {
        Name = loadstring(base64decode("2KzZhNmK2K8g2YLYt9io2YogKEFyY3RpYyBGcm9zdCk="))(),
        Base = Color3.fromRGB(10, 14, 18),
        Sidebar = Color3.fromRGB(7, 10, 14),
        Card = Color3.fromRGB(16, 22, 29),
        CardHover = Color3.fromRGB(22, 31, 41),
        CardActive = Color3.fromRGB(29, 40, 53),
        Primary = Color3.fromRGB(110, 235, 255),
        Secondary = Color3.fromRGB(180, 245, 255),
        Text = Color3.fromRGB(245, 252, 255),
        SubText = Color3.fromRGB(150, 172, 188),
        Border = Color3.fromRGB(36, 50, 64),
        Success = Color3.fromRGB(80, 240, 180),
        Warning = Color3.fromRGB(255, 210, 85),
        Danger = Color3.fromRGB(255, 90, 110)
    },
    {
        Name = loadstring(base64decode("2KPYrdin2K/ZiiDYr9in2YPZhiAoTW9ub2Nocm9tZSBQcm8p"))(),
        Base = Color3.fromRGB(10, 10, 10),
        Sidebar = Color3.fromRGB(6, 6, 6),
        Card = Color3.fromRGB(18, 18, 18),
        CardHover = Color3.fromRGB(26, 26, 26),
        CardActive = Color3.fromRGB(35, 35, 35),
        Primary = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(135, 135, 135),
        Text = Color3.fromRGB(250, 250, 250),
        SubText = Color3.fromRGB(150, 150, 150),
        Border = Color3.fromRGB(42, 42, 42),
        Success = Color3.fromRGB(190, 250, 200),
        Warning = Color3.fromRGB(255, 235, 160),
        Danger = Color3.fromRGB(255, 130, 130)
    }
}

local ActiveThemeIndex = 1
local Colors = {}
for k, v in pairs(ThemeCatalog[1]) do Colors[k] = v end

-- ============================================================================
-- [04] VFX, ANIMATION & AUDIO ENGINE
-- ============================================================================
local VFXEngine = {
    SoundEnabled = true,
    ParticlesEnabled = true,
    RipplesEnabled = true,
    GlowPulseEnabled = true,
    AnimationSpeed = 1.0
}

local SoundBank = {
    Click = loadstring(base64decode("cmJ4YXNzZXRpZDovLzY4OTUwNzk4NTM="))(),
    ToggleOn = loadstring(base64decode("cmJ4YXNzZXRpZDovLzY4OTUwNzk4NTM="))(),
    ToggleOff = loadstring(base64decode("cmJ4YXNzZXRpZDovLzY4OTUwNzk4NTM="))(),
    Notify = loadstring(base64decode("cmJ4YXNzZXRpZDovLzQ1OTA2NTczOTE="))(),
    WindowOpen = loadstring(base64decode("cmJ4YXNzZXRpZDovLzkxMTk3MTM5NTE="))()
}

function VFXEngine:PlaySound(key, pitch, vol)
    if not self.SoundEnabled then return end
    task.spawn(function()
        pcall(function()
            local s = Instance.new(loadstring(base64decode("U291bmQ="))())
            s.SoundId = SoundBank[key] or SoundBank.Click
            s.Volume = vol or 0.22
            s.PlaybackSpeed = pitch or 1.0
            s.Parent = ScreenGui
            s:Play()
            Debris:AddItem(s, 1.5)
        end)
    end)
end

function VFXEngine:Tween(obj, dur, props, style, dir)
    if not obj or not obj.Parent then return nil end
    local t = math.max(0.03, (dur or 0.22) / math.max(0.25, self.AnimationSpeed))
    local tw = TweenService:Create(obj, TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end

function VFXEngine:CreateGradient(parent, c1, c2, rot)
    local g = Instance.new(loadstring(base64decode("VUlHcmFkaWVudA=="))())
    g.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, c1), ColorSequenceKeypoint.new(1, c2)})
    g.Rotation = rot or 45
    g.Parent = parent
    return g
end

function VFXEngine:SpawnRipple(btn, col)
    if not self.RipplesEnabled or not btn or not btn.Parent then return end
    btn.ClipsDescendants = true
    local r = Instance.new(loadstring(base64decode("RnJhbWU="))())
    r.BackgroundColor3 = col or Colors.Primary
    r.BackgroundTransparency = 0.62
    r.BorderSizePixel = 0
    r.AnchorPoint = Vector2.new(0.5, 0.5)
    r.ZIndex = btn.ZIndex + 3
    local m = UserInputService:GetMouseLocation()
    local inset = GuiService:GetGuiInset()
    r.Position = UDim2.new(0, (m.X - inset.X) - btn.AbsolutePosition.X, 0, (m.Y - inset.Y) - btn.AbsolutePosition.Y)
    r.Size = UDim2.new(0, 0, 0, 0)
    r.Parent = btn
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), r).CornerRadius = UDim.new(1, 0)
    local d = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2.5
    self:Tween(r, 0.45, {Size = UDim2.new(0, d, 0, d), BackgroundTransparency = 1}, Enum.EasingStyle.Quad)
    Debris:AddItem(r, 0.5)
end

function VFXEngine:SpawnSparkles(box, count)
    if not self.ParticlesEnabled or not box or not box.Parent then return end
    for i = 1, (count or 6) do
        local sp = Instance.new(loadstring(base64decode("RnJhbWU="))())
        local sz = math.random(3, 6)
        sp.Size = UDim2.new(0, sz, 0, sz)
        sp.Position = UDim2.new(math.random(12, 88) / 100, 0, math.random(20, 80) / 100, 0)
        sp.BackgroundColor3 = (i % 2 == 0) and Colors.Primary or Colors.Secondary
        sp.BorderSizePixel = 0
        sp.ZIndex = box.ZIndex + 6
        sp.Parent = box
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), sp).CornerRadius = UDim.new(1, 0)
        self:Tween(sp, 0.55, {
            Position = UDim2.new(sp.Position.X.Scale + (math.random(-18, 18) / 100), 0, sp.Position.Y.Scale - 0.25, 0),
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }, Enum.EasingStyle.Sine)
        Debris:AddItem(sp, 0.65)
    end
end

function VFXEngine:SpawnShimmer(card)
    if not self.ParticlesEnabled or not card or not card.Parent then return end
    card.ClipsDescendants = true
    local beam = Instance.new(loadstring(base64decode("RnJhbWU="))())
    beam.Size = UDim2.new(0, 40, 1.6, 0)
    beam.Position = UDim2.new(-0.2, 0, -0.3, 0)
    beam.Rotation = 20
    beam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    beam.BackgroundTransparency = 0.88
    beam.BorderSizePixel = 0
    beam.ZIndex = card.ZIndex + 2
    beam.Parent = card
    self:Tween(beam, 0.55, {Position = UDim2.new(1.2, 0, -0.3, 0), BackgroundTransparency = 1}, Enum.EasingStyle.Quad)
    Debris:AddItem(beam, 0.6)
end

local function AttachSmoothDrag(handle, target)
    target = target or handle
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    Lifecycle:TrackConnection(handle.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = inp.Position
            startPos = target.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end))
    Lifecycle:TrackConnection(handle.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
            dragInput = inp
        end
    end))
    Lifecycle:TrackConnection(UserInputService.InputChanged:Connect(function(inp)
        if inp == dragInput and dragging then
            local delta = inp.Position - dragStart
            VFXEngine:Tween(target, 0.07, {
                Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            }, Enum.EasingStyle.Quad)
        end
    end))
end

-- ============================================================================
-- [05] TOAST NOTIFICATION SYSTEM & HUD BAR
-- ============================================================================
local ToastHolder = Instance.new(loadstring(base64decode("RnJhbWU="))())
ToastHolder.Size = UDim2.new(0, 310, 0, 440)
ToastHolder.Position = UDim2.new(1, -326, 1, -456)
ToastHolder.BackgroundTransparency = 1
ToastHolder.ZIndex = 60
ToastHolder.Parent = ScreenGui

local ToastList = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))())
ToastList.VerticalAlignment = Enum.VerticalAlignment.Bottom
ToastList.HorizontalAlignment = Enum.HorizontalAlignment.Right
ToastList.Padding = UDim.new(0, 10)
ToastList.Parent = ToastHolder

local NotificationsEnabled = true
local function Notify(title, text, duration, kind)
    if not NotificationsEnabled then return end
    duration = duration or 2.8
    local accent = (kind == loadstring(base64decode("d2Fybg=="))() and Colors.Warning) or (kind == loadstring(base64decode("ZXJyb3I="))() and Colors.Danger) or (kind == loadstring(base64decode("c3VjY2Vzcw=="))() and Colors.Success) or Colors.Primary
    VFXEngine:PlaySound(loadstring(base64decode("Tm90aWZ5"))(), 1.05, 0.2)
    task.spawn(function()
        local slot = Instance.new(loadstring(base64decode("RnJhbWU="))())
        slot.Size = UDim2.new(1, 0, 0, 66)
        slot.BackgroundTransparency = 1
        slot.Parent = ToastHolder

        local box = Instance.new(loadstring(base64decode("RnJhbWU="))())
        box.Size = UDim2.new(1, 0, 1, 0)
        box.Position = UDim2.new(1, 45, 0, 0)
        box.BackgroundColor3 = Colors.Base
        box.BackgroundTransparency = 0.05
        box.ZIndex = 61
        box.Parent = slot
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), box).CornerRadius = UDim.new(0, 10)

        local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
        stroke.Color = accent
        stroke.Thickness = 1.4
        stroke.Parent = box

        local pill = Instance.new(loadstring(base64decode("RnJhbWU="))())
        pill.Size = UDim2.new(0, 4, 0, 38)
        pill.Position = UDim2.new(0, 8, 0.5, -19)
        pill.BackgroundColor3 = accent
        pill.BorderSizePixel = 0
        pill.ZIndex = 62
        pill.Parent = box
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), pill).CornerRadius = UDim.new(1, 0)

        local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        tLbl.Size = UDim2.new(1, -28, 0, 20)
        tLbl.Position = UDim2.new(0, 20, 0, 8)
        tLbl.BackgroundTransparency = 1
        tLbl.Text = loadstring(base64decode("UzdMRSAvLyA="))() .. tostring(title)
        tLbl.Font = Enum.Font.GothamBold
        tLbl.TextSize = 12
        tLbl.TextColor3 = accent
        tLbl.TextXAlignment = Enum.TextXAlignment.Left
        tLbl.ZIndex = 62
        tLbl.Parent = box

        local mLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
        mLbl.Size = UDim2.new(1, -28, 0, 26)
        mLbl.Position = UDim2.new(0, 20, 0, 28)
        mLbl.BackgroundTransparency = 1
        mLbl.Text = tostring(text)
        mLbl.Font = Enum.Font.Gotham
        mLbl.TextSize = 11
        mLbl.TextColor3 = Colors.Text
        mLbl.TextXAlignment = Enum.TextXAlignment.Left
        mLbl.TextWrapped = true
        mLbl.ZIndex = 62
        mLbl.Parent = box

        local track = Instance.new(loadstring(base64decode("RnJhbWU="))())
        track.Size = UDim2.new(1, -16, 0, 3)
        track.Position = UDim2.new(0, 8, 1, -6)
        track.BackgroundColor3 = Colors.Card
        track.BorderSizePixel = 0
        track.ZIndex = 62
        track.Parent = box
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), track).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new(loadstring(base64decode("RnJhbWU="))())
        fill.Size = UDim2.new(1, 0, 1, 0)
        fill.BackgroundColor3 = accent
        fill.BorderSizePixel = 0
        fill.ZIndex = 63
        fill.Parent = track
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), fill).CornerRadius = UDim.new(1, 0)

        VFXEngine:Tween(box, 0.36, {Position = UDim2.new(0, 0, 0, 0)}, Enum.EasingStyle.Back)
        VFXEngine:Tween(fill, duration, {Size = UDim2.new(0, 0, 1, 0)}, Enum.EasingStyle.Linear)
        task.wait(duration)
        if box and box.Parent then
            local tw = VFXEngine:Tween(box, 0.28, {Position = UDim2.new(1, 55, 0, 0), BackgroundTransparency = 1}, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
            VFXEngine:Tween(stroke, 0.25, {Transparency = 1})
            VFXEngine:Tween(tLbl, 0.2, {TextTransparency = 1})
            VFXEngine:Tween(mLbl, 0.2, {TextTransparency = 1})
            if tw then tw.Completed:Wait() end
        end
        if slot then slot:Destroy() end
    end)
end

-- HUD Bar
local HudBar = Instance.new(loadstring(base64decode("RnJhbWU="))())
HudBar.Size = UDim2.new(0, 510, 0, 38)
HudBar.Position = UDim2.new(0.5, -255, 0, 14)
HudBar.BackgroundColor3 = Colors.Base
HudBar.BackgroundTransparency = 0.08
HudBar.ZIndex = 25
HudBar.Parent = ScreenGui
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), HudBar).CornerRadius = UDim.new(0, 11)

local HudStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
HudStroke.Color = Colors.Primary
HudStroke.Thickness = 1.3
HudStroke.Transparency = 0.3
HudStroke.Parent = HudBar
local HudGrad = VFXEngine:CreateGradient(HudStroke, Colors.Primary, Colors.Secondary, 0)

local HudLogo = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
HudLogo.Size = UDim2.new(0, 64, 1, 0)
HudLogo.Position = UDim2.new(0, 8, 0, 0)
HudLogo.BackgroundTransparency = 1
HudLogo.Text = loadstring(base64decode("UzdMRQ=="))()
HudLogo.Font = Enum.Font.Arcade
HudLogo.TextSize = 23
HudLogo.TextColor3 = Colors.Primary
HudLogo.ZIndex = 26
HudLogo.Parent = HudBar

local HudText = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
HudText.Size = UDim2.new(1, -76, 1, 0)
HudText.Position = UDim2.new(0, 70, 0, 0)
HudText.BackgroundTransparency = 1
HudText.Font = Enum.Font.GothamBold
HudText.TextSize = 12
HudText.RichText = true
HudText.TextColor3 = Colors.Text
HudText.TextXAlignment = Enum.TextXAlignment.Left
HudText.Text = loadstring(base64decode("RlBTOiA2MCAgfCAgUGluZzogMG1zICB8ICBSQU06IDBNQiAgfCAgUGxheWVyczogMSAgfCAgMDA6MDA="))()
HudText.ZIndex = 26
HudText.Parent = HudBar
AttachSmoothDrag(HudBar, HudBar)

-- Floating Restore Pill
local RestorePill = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
RestorePill.Size = UDim2.new(0, 114, 0, 42)
RestorePill.Position = UDim2.new(0, 18, 0.5, -21)
RestorePill.BackgroundColor3 = Colors.Base
RestorePill.Text = loadstring(base64decode("UzdMRQ=="))()
RestorePill.Font = Enum.Font.Arcade
RestorePill.TextSize = 27
RestorePill.TextColor3 = Colors.Text
RestorePill.AutoButtonColor = false
RestorePill.Visible = false
RestorePill.ZIndex = 40
RestorePill.Parent = ScreenGui
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), RestorePill).CornerRadius = UDim.new(0, 12)
local RestoreStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
RestoreStroke.Color = Colors.Primary
RestoreStroke.Thickness = 1.8
RestoreStroke.Parent = RestorePill
local RestoreGrad = VFXEngine:CreateGradient(RestoreStroke, Colors.Primary, Colors.Secondary, 45)
AttachSmoothDrag(RestorePill, RestorePill)

-- ============================================================================
-- [06] MAIN WINDOW SHELL & SIDEBAR
-- ============================================================================
local MainWindow = Instance.new(loadstring(base64decode("RnJhbWU="))())
MainWindow.Size = UDim2.new(0, 720, 0, 500)
MainWindow.Position = UDim2.new(0.5, -360, 0.5, -250)
MainWindow.BackgroundColor3 = Colors.Base
MainWindow.BackgroundTransparency = 0.03
MainWindow.ZIndex = 10
MainWindow.Parent = ScreenGui
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), MainWindow).CornerRadius = UDim.new(0, 15)

local WindowScale = Instance.new(loadstring(base64decode("VUlTY2FsZQ=="))())
WindowScale.Scale = 0.82
WindowScale.Parent = MainWindow

local WindowStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
WindowStroke.Color = Color3.fromRGB(255, 255, 255)
WindowStroke.Thickness = 2.1
WindowStroke.Parent = MainWindow
local WindowBorderGrad = VFXEngine:CreateGradient(WindowStroke, Colors.Primary, Colors.Secondary, 0)

local AmbientShadow = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
AmbientShadow.Size = UDim2.new(1, 52, 1, 52)
AmbientShadow.Position = UDim2.new(0, -26, 0, -26)
AmbientShadow.BackgroundTransparency = 1
AmbientShadow.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzUwMjg4NTcwODQ="))()
AmbientShadow.ImageColor3 = Colors.Primary
AmbientShadow.ImageTransparency = 0.72
AmbientShadow.ScaleType = Enum.ScaleType.Slice
AmbientShadow.SliceCenter = Rect.new(24, 24, 276, 276)
AmbientShadow.ZIndex = 9
AmbientShadow.Parent = MainWindow

VFXEngine:Tween(WindowScale, 0.48, {Scale = 1}, Enum.EasingStyle.Back)
VFXEngine:PlaySound(loadstring(base64decode("V2luZG93T3Blbg=="))(), 1.0, 0.28)

task.spawn(function()
    local rot, pulse = 0, 0
    while MainWindow and MainWindow.Parent do
        rot = (rot + 2.2) % 360
        pulse = pulse + 0.06
        WindowBorderGrad.Rotation = rot
        HudGrad.Rotation = (rot * 1.4) % 360
        RestoreGrad.Rotation = (rot * 1.8) % 360
        if VFXEngine.GlowPulseEnabled then
            AmbientShadow.ImageTransparency = 0.68 + math.sin(pulse) * 0.08
        end
        task.wait(0.03)
    end
end)

local Sidebar = Instance.new(loadstring(base64decode("RnJhbWU="))())
Sidebar.Size = UDim2.new(0, 195, 1, 0)
Sidebar.BackgroundColor3 = Colors.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 11
Sidebar.Parent = MainWindow
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), Sidebar).CornerRadius = UDim.new(0, 15)

local BrandPanel = Instance.new(loadstring(base64decode("RnJhbWU="))())
BrandPanel.Size = UDim2.new(1, -20, 0, 78)
BrandPanel.Position = UDim2.new(0, 10, 0, 10)
BrandPanel.BackgroundColor3 = Colors.Card
BrandPanel.BackgroundTransparency = 0.4
BrandPanel.ZIndex = 12
BrandPanel.Parent = Sidebar
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), BrandPanel).CornerRadius = UDim.new(0, 11)
local BrandStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
BrandStroke.Color = Colors.Border
BrandStroke.Parent = BrandPanel

local BrandLogo = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
BrandLogo.Size = UDim2.new(1, 0, 0, 44)
BrandLogo.Position = UDim2.new(0, 0, 0, 6)
BrandLogo.BackgroundTransparency = 1
BrandLogo.Text = loadstring(base64decode("UzdMRQ=="))()
BrandLogo.Font = Enum.Font.Arcade
BrandLogo.TextSize = 44
BrandLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
BrandLogo.ZIndex = 13
BrandLogo.Parent = BrandPanel
local BrandLogoGrad = VFXEngine:CreateGradient(BrandLogo, Color3.fromRGB(255, 255, 255), Colors.Primary, 90)

local BrandSubtitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
BrandSubtitle.Size = UDim2.new(1, 0, 0, 16)
BrandSubtitle.Position = UDim2.new(0, 0, 0, 52)
BrandSubtitle.BackgroundTransparency = 1
BrandSubtitle.Text = loadstring(base64decode("VUxUUkEgdjQuMCAg4oCiICBieSBzN2xl"))()
BrandSubtitle.Font = Enum.Font.GothamBold
BrandSubtitle.TextSize = 10
BrandSubtitle.TextColor3 = Colors.Primary
BrandSubtitle.ZIndex = 13
BrandSubtitle.Parent = BrandPanel
AttachSmoothDrag(BrandPanel, MainWindow)

local TabScroller = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))())
TabScroller.Size = UDim2.new(1, -18, 1, -162)
TabScroller.Position = UDim2.new(0, 9, 0, 96)
TabScroller.BackgroundTransparency = 1
TabScroller.BorderSizePixel = 0
TabScroller.ScrollBarThickness = 2
TabScroller.ScrollBarImageColor3 = Colors.Primary
TabScroller.ZIndex = 12
TabScroller.Parent = Sidebar

local TabLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))())
TabLayout.Padding = UDim.new(0, 6)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabScroller

local UserCard = Instance.new(loadstring(base64decode("RnJhbWU="))())
UserCard.Size = UDim2.new(1, -18, 0, 52)
UserCard.Position = UDim2.new(0, 9, 1, -60)
UserCard.BackgroundColor3 = Colors.Card
UserCard.ZIndex = 12
UserCard.Parent = Sidebar
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), UserCard).CornerRadius = UDim.new(0, 10)

local UserAvatar = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
UserAvatar.Size = UDim2.new(0, 36, 0, 36)
UserAvatar.Position = UDim2.new(0, 8, 0.5, -18)
UserAvatar.BackgroundColor3 = Colors.Base
UserAvatar.ZIndex = 13
UserAvatar.Parent = UserCard
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), UserAvatar).CornerRadius = UDim.new(1, 0)
task.spawn(function()
    pcall(function()
        UserAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
end)

local UserDisplay = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
UserDisplay.Size = UDim2.new(1, -54, 0, 18)
UserDisplay.Position = UDim2.new(0, 50, 0, 8)
UserDisplay.BackgroundTransparency = 1
UserDisplay.Text = LocalPlayer.DisplayName
UserDisplay.Font = Enum.Font.GothamBold
UserDisplay.TextSize = 11
UserDisplay.TextColor3 = Colors.Text
UserDisplay.TextXAlignment = Enum.TextXAlignment.Left
UserDisplay.TextTruncate = Enum.TextTruncate.AtEnd
UserDisplay.ZIndex = 13
UserDisplay.Parent = UserCard

local KeyHint = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
KeyHint.Size = UDim2.new(1, -54, 0, 16)
KeyHint.Position = UDim2.new(0, 50, 0, 26)
KeyHint.BackgroundTransparency = 1
KeyHint.Text = loadstring(base64decode("W1JpZ2h0Q3RybF0g2KXYrtmB2KfYoQ=="))()
KeyHint.Font = Enum.Font.Gotham
KeyHint.TextSize = 10
KeyHint.TextColor3 = Colors.Primary
KeyHint.TextXAlignment = Enum.TextXAlignment.Left
KeyHint.ZIndex = 13
KeyHint.Parent = UserCard

-- Top Search Bar & Window Controls
local HeaderBar = Instance.new(loadstring(base64decode("RnJhbWU="))())
HeaderBar.Size = UDim2.new(1, -215, 0, 42)
HeaderBar.Position = UDim2.new(0, 205, 0, 12)
HeaderBar.BackgroundTransparency = 1
HeaderBar.ZIndex = 12
HeaderBar.Parent = MainWindow
AttachSmoothDrag(HeaderBar, MainWindow)

local SearchContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
SearchContainer.Size = UDim2.new(1, -92, 1, 0)
SearchContainer.BackgroundColor3 = Colors.Card
SearchContainer.ZIndex = 12
SearchContainer.Parent = HeaderBar
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), SearchContainer).CornerRadius = UDim.new(0, 10)
local SearchStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
SearchStroke.Color = Colors.Border
SearchStroke.Parent = SearchContainer

local SearchBox = Instance.new(loadstring(base64decode("VGV4dEJveA=="))())
SearchBox.Size = UDim2.new(1, -24, 1, 0)
SearchBox.Position = UDim2.new(0, 12, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.PlaceholderText = loadstring(base64decode("8J+UjSAg2KfYqNit2Ksg2LnZhiDYo9mKINmF2YrYstipINij2Ygg2KPYr9in2Kkg2YHZiNix2KfZiy4uLg=="))()
SearchBox.PlaceholderColor3 = Colors.SubText
SearchBox.Text = loadstring(base64decode(""))()
SearchBox.TextColor3 = Colors.Text
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 12
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.ZIndex = 13
SearchBox.Parent = SearchContainer

local MinButton = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
MinButton.Size = UDim2.new(0, 40, 0, 40)
MinButton.Position = UDim2.new(1, -84, 0, 1)
MinButton.BackgroundColor3 = Colors.Card
MinButton.Text = loadstring(base64decode("4oCU"))()
MinButton.Font = Enum.Font.GothamBold
MinButton.TextSize = 14
MinButton.TextColor3 = Colors.Text
MinButton.AutoButtonColor = false
MinButton.ZIndex = 13
MinButton.Parent = HeaderBar
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), MinButton).CornerRadius = UDim.new(0, 10)

local ExitButton = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
ExitButton.Size = UDim2.new(0, 40, 0, 40)
ExitButton.Position = UDim2.new(1, -40, 0, 1)
ExitButton.BackgroundColor3 = Color3.fromRGB(165, 42, 58)
ExitButton.Text = loadstring(base64decode("4pyV"))()
ExitButton.Font = Enum.Font.GothamBold
ExitButton.TextSize = 14
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.AutoButtonColor = false
ExitButton.ZIndex = 13
ExitButton.Parent = HeaderBar
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), ExitButton).CornerRadius = UDim.new(0, 10)

local WindowOpen = true
local function ToggleMainWindow(show)
    WindowOpen = show
    if show then
        RestorePill.Visible = false
        MainWindow.Visible = true
        WindowScale.Scale = 0.85
        VFXEngine:Tween(WindowScale, 0.36, {Scale = 1}, Enum.EasingStyle.Back)
        VFXEngine:PlaySound(loadstring(base64decode("V2luZG93T3Blbg=="))(), 1.1, 0.24)
    else
        local tw = VFXEngine:Tween(WindowScale, 0.22, {Scale = 0.82}, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
        VFXEngine:PlaySound(loadstring(base64decode("Q2xpY2s="))(), 0.85, 0.2)
        if tw then tw.Completed:Wait() end
        if not WindowOpen then
            MainWindow.Visible = false
            RestorePill.Visible = true
        end
    end
end

Lifecycle:TrackConnection(MinButton.MouseButton1Click:Connect(function()
    VFXEngine:SpawnRipple(MinButton)
    ToggleMainWindow(false)
end))
Lifecycle:TrackConnection(RestorePill.MouseButton1Click:Connect(function()
    VFXEngine:SpawnRipple(RestorePill)
    ToggleMainWindow(true)
end))
Lifecycle:TrackConnection(ExitButton.MouseButton1Click:Connect(function()
    VFXEngine:SpawnRipple(ExitButton, Color3.fromRGB(255, 255, 255))
    local tw = VFXEngine:Tween(WindowScale, 0.24, {Scale = 0.72}, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    if tw then tw.Completed:Wait() end
    Lifecycle:DestroyAll()
end))

-- ============================================================================
-- [07] UI COMPONENT BUILDERS
-- ============================================================================
local ContentViewport = Instance.new(loadstring(base64decode("RnJhbWU="))())
ContentViewport.Size = UDim2.new(1, -215, 1, -68)
ContentViewport.Position = UDim2.new(0, 205, 0, 60)
ContentViewport.BackgroundTransparency = 1
ContentViewport.ZIndex = 12
ContentViewport.Parent = MainWindow

local UI = {Pages = {}, Tabs = {}, AllCards = {}, ActiveTab = nil, TabCounter = 0}

function UI:SelectTab(tabName)
    if self.ActiveTab == tabName and SearchBox.Text == loadstring(base64decode(""))() then return end
    self.ActiveTab = tabName
    SearchBox.Text = loadstring(base64decode(""))()
    VFXEngine:PlaySound(loadstring(base64decode("Q2xpY2s="))(), 1.05, 0.18)

    for name, pData in pairs(self.Pages) do
        local isCurrent = (name == tabName)
        pData.frame.Visible = isCurrent
        if isCurrent then
            pData.frame.CanvasPosition = Vector2.new(0, 0)
            pData.frame.CanvasSize = UDim2.new(0, 0, 0, pData.layout.AbsoluteContentSize.Y + 26)
            for idx, entry in ipairs(pData.items) do
                entry.card.Visible = true
                if idx <= 12 then
                    entry.card.BackgroundTransparency = 0.45
                    VFXEngine:Tween(entry.card, 0.2 + (idx * 0.02), {BackgroundTransparency = entry.defaultTransparency or 0})
                end
            end
        end
    end

    for name, tData in pairs(self.Tabs) do
        local selected = (name == tabName)
        tData.grad.Enabled = selected
        VFXEngine:Tween(tData.btn, 0.22, {
            BackgroundColor3 = selected and Color3.fromRGB(255, 255, 255) or Colors.Card,
            TextColor3 = selected and Colors.Sidebar or Colors.SubText
        })
        VFXEngine:Tween(tData.bar, 0.24, {
            Size = selected and UDim2.new(0, 4, 0, 20) or UDim2.new(0, 0, 0, 0)
        }, Enum.EasingStyle.Back)
    end
end

function UI:CreateTab(tabName, iconText)
    self.TabCounter = self.TabCounter + 1
    local btn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Colors.Card
    btn.Text = loadstring(base64decode("ICAg"))() .. (iconText or loadstring(base64decode("4oCi"))()) .. loadstring(base64decode("ICA="))() .. tabName
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    btn.TextColor3 = Colors.SubText
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.AutoButtonColor = false
    btn.LayoutOrder = self.TabCounter
    btn.ZIndex = 13
    btn.Parent = TabScroller
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), btn).CornerRadius = UDim.new(0, 9)

    local bar = Instance.new(loadstring(base64decode("RnJhbWU="))())
    bar.Size = UDim2.new(0, 0, 0, 0)
    bar.Position = UDim2.new(0, 4, 0.5, -10)
    bar.BackgroundColor3 = Colors.Sidebar
    bar.BorderSizePixel = 0
    bar.ZIndex = 14
    bar.Parent = btn
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), bar).CornerRadius = UDim.new(1, 0)

    local grad = VFXEngine:CreateGradient(btn, Colors.Primary, Colors.Secondary, 0)
    grad.Enabled = false

    local page = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))())
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Colors.Primary
    page.Visible = false
    page.ZIndex = 12
    page.Parent = ContentViewport

    local layout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))())
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    Lifecycle:TrackConnection(layout:GetPropertyChangedSignal(loadstring(base64decode("QWJzb2x1dGVDb250ZW50U2l6ZQ=="))()):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 28)
    end))

    self.Pages[tabName] = {frame = page, layout = layout, order = 0, items = {}}
    self.Tabs[tabName] = {btn = btn, grad = grad, bar = bar}
    TabScroller.CanvasSize = UDim2.new(0, 0, 0, self.TabCounter * 42 + 12)

    Lifecycle:TrackConnection(btn.MouseEnter:Connect(function()
        if self.ActiveTab ~= tabName then
            VFXEngine:Tween(btn, 0.16, {BackgroundColor3 = Colors.CardHover, TextColor3 = Colors.Text})
        end
    end))
    Lifecycle:TrackConnection(btn.MouseLeave:Connect(function()
        if self.ActiveTab ~= tabName then
            VFXEngine:Tween(btn, 0.16, {BackgroundColor3 = Colors.Card, TextColor3 = Colors.SubText})
        end
    end))
    Lifecycle:TrackConnection(btn.MouseButton1Click:Connect(function()
        VFXEngine:SpawnRipple(btn)
        self:SelectTab(tabName)
    end))
    return tabName
end

function UI:AddSection(tabName, headingText)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local holder = Instance.new(loadstring(base64decode("RnJhbWU="))())
    holder.Size = UDim2.new(1, -8, 0, 26)
    holder.BackgroundTransparency = 1
    holder.LayoutOrder = pData.order
    holder.ZIndex = 13
    holder.Parent = pData.frame

    local rule = Instance.new(loadstring(base64decode("RnJhbWU="))())
    rule.Size = UDim2.new(1, 0, 0, 1)
    rule.Position = UDim2.new(0, 0, 0.5, 0)
    rule.BackgroundColor3 = Colors.Border
    rule.BorderSizePixel = 0
    rule.ZIndex = 13
    rule.Parent = holder

    local tag = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tag.Size = UDim2.new(0, 160, 0, 22)
    tag.Position = UDim2.new(0, 0, 0.5, -11)
    tag.BackgroundColor3 = Colors.Base
    tag.Text = loadstring(base64decode("ICA="))() .. headingText .. loadstring(base64decode("ICA="))()
    tag.Font = Enum.Font.GothamBold
    tag.TextSize = 11
    tag.TextColor3 = Colors.Primary
    tag.TextXAlignment = Enum.TextXAlignment.Left
    tag.AutomaticSize = Enum.AutomaticSize.X
    tag.ZIndex = 14
    tag.Parent = holder

    table.insert(pData.items, {card = holder, defaultTransparency = 1, isHeader = true})
end

function UI:AddInfoBanner(tabName, title, bodyText)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local banner = Instance.new(loadstring(base64decode("RnJhbWU="))())
    banner.Size = UDim2.new(1, -8, 0, 68)
    banner.BackgroundColor3 = Colors.Card
    banner.LayoutOrder = pData.order
    banner.ZIndex = 13
    banner.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), banner).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = Colors.Primary
    stroke.Transparency = 0.45
    stroke.Parent = banner

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(1, -28, 0, 20)
    tLbl.Position = UDim2.new(0, 16, 0, 9)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Primary
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = banner

    local bLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    bLbl.Size = UDim2.new(1, -28, 0, 30)
    bLbl.Position = UDim2.new(0, 16, 0, 29)
    bLbl.BackgroundTransparency = 1
    bLbl.Text = bodyText
    bLbl.Font = Enum.Font.Gotham
    bLbl.TextSize = 11
    bLbl.TextColor3 = Colors.SubText
    bLbl.TextXAlignment = Enum.TextXAlignment.Left
    bLbl.TextWrapped = true
    bLbl.ZIndex = 14
    bLbl.Parent = banner

    local item = {card = banner, page = pData.frame, defaultTransparency = 0, key = string.lower(title .. loadstring(base64decode("IA=="))() .. bodyText)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
    return bLbl
end

function UI:AddAction(tabName, title, desc, btnText, callback)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local card = Instance.new(loadstring(base64decode("RnJhbWU="))())
    card.Size = UDim2.new(1, -8, 0, 62)
    card.BackgroundColor3 = Colors.Card
    card.LayoutOrder = pData.order
    card.ZIndex = 13
    card.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = Colors.Border
    stroke.Parent = card

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(1, -120, 0, 20)
    tLbl.Position = UDim2.new(0, 14, 0, 10)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Text
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = card

    local dLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    dLbl.Size = UDim2.new(1, -120, 0, 18)
    dLbl.Position = UDim2.new(0, 14, 0, 32)
    dLbl.BackgroundTransparency = 1
    dLbl.Text = desc
    dLbl.Font = Enum.Font.Gotham
    dLbl.TextSize = 11
    dLbl.TextColor3 = Colors.SubText
    dLbl.TextXAlignment = Enum.TextXAlignment.Left
    dLbl.ZIndex = 14
    dLbl.Parent = card

    local btn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    btn.Size = UDim2.new(0, 94, 0, 34)
    btn.Position = UDim2.new(1, -106, 0.5, -17)
    btn.BackgroundColor3 = Colors.CardActive
    btn.Text = btnText
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = Colors.Text
    btn.AutoButtonColor = false
    btn.ZIndex = 14
    btn.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), btn).CornerRadius = UDim.new(0, 8)

    Lifecycle:TrackConnection(card.MouseEnter:Connect(function()
        VFXEngine:Tween(card, 0.18, {BackgroundColor3 = Colors.CardHover})
        VFXEngine:Tween(stroke, 0.18, {Color = Colors.Primary})
    end))
    Lifecycle:TrackConnection(card.MouseLeave:Connect(function()
        VFXEngine:Tween(card, 0.18, {BackgroundColor3 = Colors.Card})
        VFXEngine:Tween(stroke, 0.18, {Color = Colors.Border})
    end))
    Lifecycle:TrackConnection(btn.MouseEnter:Connect(function()
        VFXEngine:Tween(btn, 0.15, {BackgroundColor3 = Colors.Primary, TextColor3 = Colors.Sidebar})
    end))
    Lifecycle:TrackConnection(btn.MouseLeave:Connect(function()
        VFXEngine:Tween(btn, 0.15, {BackgroundColor3 = Colors.CardActive, TextColor3 = Colors.Text})
    end))
    Lifecycle:TrackConnection(btn.MouseButton1Click:Connect(function()
        VFXEngine:PlaySound(loadstring(base64decode("Q2xpY2s="))(), 1.1, 0.2)
        VFXEngine:SpawnRipple(btn, Color3.fromRGB(255, 255, 255))
        VFXEngine:SpawnSparkles(card, 6)
        VFXEngine:SpawnShimmer(card)
        pcall(function() callback(btn) end)
    end))

    local item = {card = card, page = pData.frame, defaultTransparency = 0, key = string.lower(title .. loadstring(base64decode("IA=="))() .. desc)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
    return btn
end

function UI:AddToggle(tabName, title, desc, defaultVal, callback, configKey)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local current = defaultVal or false

    local card = Instance.new(loadstring(base64decode("RnJhbWU="))())
    card.Size = UDim2.new(1, -8, 0, 62)
    card.BackgroundColor3 = Colors.Card
    card.LayoutOrder = pData.order
    card.ZIndex = 13
    card.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = current and Colors.Primary or Colors.Border
    stroke.Parent = card

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(1, -88, 0, 20)
    tLbl.Position = UDim2.new(0, 14, 0, 10)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Text
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = card

    local dLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    dLbl.Size = UDim2.new(1, -88, 0, 18)
    dLbl.Position = UDim2.new(0, 14, 0, 32)
    dLbl.BackgroundTransparency = 1
    dLbl.Text = desc
    dLbl.Font = Enum.Font.Gotham
    dLbl.TextSize = 11
    dLbl.TextColor3 = Colors.SubText
    dLbl.TextXAlignment = Enum.TextXAlignment.Left
    dLbl.ZIndex = 14
    dLbl.Parent = card

    local track = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    track.Size = UDim2.new(0, 54, 0, 28)
    track.Position = UDim2.new(1, -68, 0.5, -14)
    track.BackgroundColor3 = current and Colors.Primary or Color3.fromRGB(36, 40, 52)
    track.Text = loadstring(base64decode(""))()
    track.AutoButtonColor = false
    track.ZIndex = 14
    track.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), track).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new(loadstring(base64decode("RnJhbWU="))())
    knob.Size = UDim2.new(0, 22, 0, 22)
    knob.Position = current and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.ZIndex = 15
    knob.Parent = track
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), knob).CornerRadius = UDim.new(1, 0)

    local function SetState(uya2OHVP, runCb)
        current = uya2OHVP
        if configKey then Lifecycle.ConfigValues[configKey] = current end
        VFXEngine:Tween(track, 0.22, {BackgroundColor3 = current and Colors.Primary or Color3.fromRGB(36, 40, 52)})
        VFXEngine:Tween(knob, 0.24, {Position = current and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)}, Enum.EasingStyle.Back)
        VFXEngine:Tween(stroke, 0.22, {Color = current and Colors.Primary or Colors.Border})
        if current then VFXEngine:SpawnSparkles(card, 5) end
        if runCb then pcall(function() callback(current) end) end
    end

    if configKey then Lifecycle.ConfigValues[configKey] = current end
    Lifecycle:TrackConnection(track.MouseButton1Click:Connect(function()
        VFXEngine:PlaySound(current and loadstring(base64decode("VG9nZ2xlT2Zm"))() or loadstring(base64decode("VG9nZ2xlT24="))(), current and 0.92 or 1.15, 0.2)
        SetState(not current, true)
    end))
    Lifecycle:RegisterReset(function()
        if current ~= (defaultVal or false) then SetState(defaultVal or false, true) end
    end)

    local item = {card = card, page = pData.frame, defaultTransparency = 0, key = string.lower(title .. loadstring(base64decode("IA=="))() .. desc)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
    return SetState
end

function UI:AddSlider(tabName, title, minVal, maxVal, defaultVal, suffix, callback, configKey)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    suffix = suffix or loadstring(base64decode(""))()
    local currentVal = defaultVal

    local card = Instance.new(loadstring(base64decode("RnJhbWU="))())
    card.Size = UDim2.new(1, -8, 0, 70)
    card.BackgroundColor3 = Colors.Card
    card.LayoutOrder = pData.order
    card.ZIndex = 13
    card.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = Colors.Border
    stroke.Parent = card

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(0.7, 0, 0, 22)
    tLbl.Position = UDim2.new(0, 14, 0, 9)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Text
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = card

    local valPill = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    valPill.Size = UDim2.new(0, 78, 0, 22)
    valPill.Position = UDim2.new(1, -92, 0, 9)
    valPill.BackgroundColor3 = Colors.CardActive
    valPill.Text = tostring(defaultVal) .. suffix
    valPill.Font = Enum.Font.GothamBold
    valPill.TextSize = 12
    valPill.TextColor3 = Colors.Primary
    valPill.ZIndex = 14
    valPill.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), valPill).CornerRadius = UDim.new(0, 6)

    local trackBg = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    trackBg.Size = UDim2.new(1, -28, 0, 10)
    trackBg.Position = UDim2.new(0, 14, 0, 44)
    trackBg.BackgroundColor3 = Color3.fromRGB(32, 36, 48)
    trackBg.Text = loadstring(base64decode(""))()
    trackBg.AutoButtonColor = false
    trackBg.ZIndex = 14
    trackBg.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), trackBg).CornerRadius = UDim.new(1, 0)

    local initPct = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)
    local fill = Instance.new(loadstring(base64decode("RnJhbWU="))())
    fill.Size = UDim2.new(initPct, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0
    fill.ZIndex = 15
    fill.Parent = trackBg
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), fill).CornerRadius = UDim.new(1, 0)
    VFXEngine:CreateGradient(fill, Colors.Primary, Colors.Secondary, 0)

    local thumb = Instance.new(loadstring(base64decode("RnJhbWU="))())
    thumb.Size = UDim2.new(0, 16, 0, 16)
    thumb.AnchorPoint = Vector2.new(0.5, 0.5)
    thumb.Position = UDim2.new(1, 0, 0.5, 0)
    thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    thumb.ZIndex = 16
    thumb.Parent = fill
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), thumb).CornerRadius = UDim.new(1, 0)

    local function SetSliderValue(uya2OHVP, runCb)
        uya2OHVP = math.clamp(math.floor(uya2OHVP + 0.5), minVal, maxVal)
        currentVal = uya2OHVP
        if configKey then Lifecycle.ConfigValues[configKey] = currentVal end
        local pct = math.clamp((uya2OHVP - minVal) / (maxVal - minVal), 0, 1)
        VFXEngine:Tween(fill, 0.08, {Size = UDim2.new(pct, 0, 1, 0)})
        valPill.Text = tostring(uya2OHVP) .. suffix
        if runCb then pcall(function() callback(uya2OHVP) end) end
    end

    if configKey then Lifecycle.ConfigValues[configKey] = currentVal end
    local dragging = false
    local function HandleDrag(pos)
        local pct = math.clamp((pos.X - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X, 0, 1)
        SetSliderValue(minVal + (maxVal - minVal) * pct, true)
    end

    Lifecycle:TrackConnection(trackBg.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            VFXEngine:Tween(thumb, 0.15, {Size = UDim2.new(0, 21, 0, 21)})
            HandleDrag(inp.Position)
        end
    end))
    Lifecycle:TrackConnection(UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                VFXEngine:Tween(thumb, 0.15, {Size = UDim2.new(0, 16, 0, 16)})
            end
        end
    end))
    Lifecycle:TrackConnection(UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
            HandleDrag(inp.Position)
        end
    end))
    Lifecycle:RegisterReset(function() SetSliderValue(defaultVal, true) end)

    local item = {card = card, page = pData.frame, defaultTransparency = 0, key = string.lower(title)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
    return SetSliderValue
end

function UI:AddDropdown(tabName, title, optionsList, defaultOption, callback)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local selected = defaultOption or optionsList[1] or loadstring(base64decode("2KfYrtiq2LE="))()
    local expanded = false

    local card = Instance.new(loadstring(base64decode("RnJhbWU="))())
    card.Size = UDim2.new(1, -8, 0, 62)
    card.BackgroundColor3 = Colors.Card
    card.ClipsDescendants = true
    card.LayoutOrder = pData.order
    card.ZIndex = 13
    card.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = Colors.Border
    stroke.Parent = card

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(0.55, 0, 0, 62)
    tLbl.Position = UDim2.new(0, 14, 0, 0)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Text
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = card

    local dropBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    dropBtn.Size = UDim2.new(0, 175, 0, 34)
    dropBtn.Position = UDim2.new(1, -187, 0, 14)
    dropBtn.BackgroundColor3 = Colors.CardActive
    dropBtn.Text = selected .. loadstring(base64decode("ICDilrw="))()
    dropBtn.Font = Enum.Font.GothamSemibold
    dropBtn.TextSize = 11
    dropBtn.TextColor3 = Colors.Primary
    dropBtn.AutoButtonColor = false
    dropBtn.ZIndex = 14
    dropBtn.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), dropBtn).CornerRadius = UDim.new(0, 8)

    local listContainer = Instance.new(loadstring(base64decode("RnJhbWU="))())
    listContainer.Size = UDim2.new(1, -24, 0, #optionsList * 32)
    listContainer.Position = UDim2.new(0, 12, 0, 64)
    listContainer.BackgroundTransparency = 1
    listContainer.ZIndex = 14
    listContainer.Parent = card

    local listLayout = Instance.new(loadstring(base64decode("VUlMaXN0TGF5b3V0"))())
    listLayout.Padding = UDim.new(0, 4)
    listLayout.Parent = listContainer

    for _, opt in ipairs(optionsList) do
        local optBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
        optBtn.Size = UDim2.new(1, 0, 0, 28)
        optBtn.BackgroundColor3 = Colors.Base
        optBtn.Text = loadstring(base64decode("ICAg"))() .. tostring(opt)
        optBtn.Font = Enum.Font.Gotham
        optBtn.TextSize = 11
        optBtn.TextColor3 = Colors.Text
        optBtn.TextXAlignment = Enum.TextXAlignment.Left
        optBtn.AutoButtonColor = false
        optBtn.ZIndex = 15
        optBtn.Parent = listContainer
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), optBtn).CornerRadius = UDim.new(0, 6)

        Lifecycle:TrackConnection(optBtn.MouseEnter:Connect(function()
            VFXEngine:Tween(optBtn, 0.14, {BackgroundColor3 = Colors.Primary, TextColor3 = Colors.Sidebar})
        end))
        Lifecycle:TrackConnection(optBtn.MouseLeave:Connect(function()
            VFXEngine:Tween(optBtn, 0.14, {BackgroundColor3 = Colors.Base, TextColor3 = Colors.Text})
        end))
        Lifecycle:TrackConnection(optBtn.MouseButton1Click:Connect(function()
            selected = opt
            dropBtn.Text = tostring(selected) .. loadstring(base64decode("ICDilrw="))()
            expanded = false
            VFXEngine:Tween(card, 0.24, {Size = UDim2.new(1, -8, 0, 62)})
            VFXEngine:Tween(stroke, 0.24, {Color = Colors.Border})
            VFXEngine:PlaySound(loadstring(base64decode("Q2xpY2s="))(), 1.15, 0.2)
            pcall(function() callback(selected) end)
        end))
    end

    Lifecycle:TrackConnection(dropBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        VFXEngine:PlaySound(loadstring(base64decode("Q2xpY2s="))(), 1.0, 0.18)
        local targetH = expanded and (72 + #optionsList * 32) or 62
        dropBtn.Text = tostring(selected) .. (expanded and loadstring(base64decode("ICDilrI="))() or loadstring(base64decode("ICDilrw="))())
        VFXEngine:Tween(card, 0.26, {Size = UDim2.new(1, -8, 0, targetH)})
        VFXEngine:Tween(stroke, 0.2, {Color = expanded and Colors.Primary or Colors.Border})
    end))

    local item = {card = card, page = pData.frame, defaultTransparency = 0, key = string.lower(title)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
end

function UI:AddKeybind(tabName, title, desc, defaultKey, callback)
    local pData = self.Pages[tabName]
    pData.order = pData.order + 1
    local boundKey = defaultKey or Enum.KeyCode.F
    local listening = false

    local card = Instance.new(loadstring(base64decode("RnJhbWU="))())
    card.Size = UDim2.new(1, -8, 0, 62)
    card.BackgroundColor3 = Colors.Card
    card.LayoutOrder = pData.order
    card.ZIndex = 13
    card.Parent = pData.frame
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
    stroke.Color = Colors.Border
    stroke.Parent = card

    local tLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    tLbl.Size = UDim2.new(1, -125, 0, 20)
    tLbl.Position = UDim2.new(0, 14, 0, 10)
    tLbl.BackgroundTransparency = 1
    tLbl.Text = title
    tLbl.Font = Enum.Font.GothamBold
    tLbl.TextSize = 13
    tLbl.TextColor3 = Colors.Text
    tLbl.TextXAlignment = Enum.TextXAlignment.Left
    tLbl.ZIndex = 14
    tLbl.Parent = card

    local dLbl = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
    dLbl.Size = UDim2.new(1, -125, 0, 18)
    dLbl.Position = UDim2.new(0, 14, 0, 32)
    dLbl.BackgroundTransparency = 1
    dLbl.Text = desc
    dLbl.Font = Enum.Font.Gotham
    dLbl.TextSize = 11
    dLbl.TextColor3 = Colors.SubText
    dLbl.TextXAlignment = Enum.TextXAlignment.Left
    dLbl.ZIndex = 14
    dLbl.Parent = card

    local keyBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))())
    keyBtn.Size = UDim2.new(0, 96, 0, 34)
    keyBtn.Position = UDim2.new(1, -108, 0.5, -17)
    keyBtn.BackgroundColor3 = Colors.CardActive
    keyBtn.Text = loadstring(base64decode("Ww=="))() .. boundKey.Name .. loadstring(base64decode("XQ=="))()
    keyBtn.Font = Enum.Font.GothamBold
    keyBtn.TextSize = 11
    keyBtn.TextColor3 = Colors.Primary
    keyBtn.AutoButtonColor = false
    keyBtn.ZIndex = 14
    keyBtn.Parent = card
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), keyBtn).CornerRadius = UDim.new(0, 8)

    Lifecycle:TrackConnection(keyBtn.MouseButton1Click:Connect(function()
        listening = true
        keyBtn.Text = loadstring(base64decode("2KfYtti62Lcg2LLYsdin2YsuLi4="))()
        VFXEngine:Tween(stroke, 0.18, {Color = Colors.Warning})
    end))

    Lifecycle:TrackConnection(UserInputService.InputBegan:Connect(function(inp, gp)
        if listening and inp.UserInputType == Enum.UserInputType.Keyboard then
            listening = false
            boundKey = inp.KeyCode
            keyBtn.Text = loadstring(base64decode("Ww=="))() .. boundKey.Name .. loadstring(base64decode("XQ=="))()
            VFXEngine:Tween(stroke, 0.18, {Color = Colors.Border})
            Notify(loadstring(base64decode("2KfZhNin2K7Yqti12KfYsdin2Ko="))(), loadstring(base64decode("2KrZhSDYqti52YrZitmGIA=="))() .. title .. loadstring(base64decode("INil2YTZiSA="))() .. boundKey.Name, 2, loadstring(base64decode("c3VjY2Vzcw=="))())
            return
        end
        if not gp and not listening and inp.KeyCode == boundKey then pcall(callback) end
    end))

    local item = {card = card, page = pData.frame, defaultTransparency = 0, key = string.lower(title .. loadstring(base64decode("IA=="))() .. desc)}
    table.insert(pData.items, item)
    table.insert(self.AllCards, item)
end

-- ============================================================================
-- [08] CREATE 11 TABS & POPULATE ALL FEATURES
-- ============================================================================
local T_DASH = UI:CreateTab(loadstring(base64decode("2YTZiNit2Kkg2KfZhNmF2LnZhNmI2YXYp9iq"))(), loadstring(base64decode("8J+Tig=="))())
local T_FPS  = UI:CreateTab(loadstring(base64decode("2KfZhNmB2LHZitmF2KfYqiDZiNin2YTYo9iv2KfYoQ=="))(), loadstring(base64decode("4pqh"))())
local T_GFX  = UI:CreateTab(loadstring(base64decode("2KfZhNil2LbYp9ih2Kkg2YjYp9mE2KzYsdin2YHZitmD"))(), loadstring(base64decode("8J+OqA=="))())
local T_CAM  = UI:CreateTab(loadstring(base64decode("2KfZhNmD2KfZhdmK2LHYpyDZiNin2YTYqti12YjZitix"))(), loadstring(base64decode("8J+OpQ=="))())
local T_MOV  = UI:CreateTab(loadstring(base64decode("2KfZhNi02K7YtdmK2Kkg2YjYp9mE2K3YsdmD2Kk="))(), loadstring(base64decode("8J+Pgw=="))())
local T_WAY  = UI:CreateTab(loadstring(base64decode("2YbZgtin2Lcg2KfZhNit2YHYuA=="))(), loadstring(base64decode("8J+TjQ=="))())
local T_VIS  = UI:CreateTab(loadstring(base64decode("2KfZhNmF2KTYtNix2KfYqiDZiNin2YTYsdin2K/Yp9ix"))(), loadstring(base64decode("8J+Rge+4jw=="))())
local T_PLR  = UI:CreateTab(loadstring(base64decode("2YLYp9im2YXYqSDYp9mE2YTYp9i52KjZitmG"))(), loadstring(base64decode("8J+RpQ=="))())
local T_AUD  = UI:CreateTab(loadstring(base64decode("2KfZhNi12YjYqtmK2KfYqiDZiNin2YTYo9iv2YjYp9iq"))(), loadstring(base64decode("8J+Uig=="))())
local T_SRV  = UI:CreateTab(loadstring(base64decode("2KfZhNiz2YrYsdmB2LEg2YjYp9mE2LTYqNmD2Kk="))(), loadstring(base64decode("8J+MkA=="))())
local T_SET  = UI:CreateTab(loadstring(base64decode("2KfZhNmF2LjZh9ixINmI2KfZhNil2LnYr9in2K/Yp9iq"))(), loadstring(base64decode("4pqZ77iP"))())

UI:SelectTab(T_DASH)

-- 1. Dashboard
UI:AddSection(T_DASH, loadstring(base64decode("2YXYsdit2KjYp9mLINio2YMg2YHZiiBTN0xFIFVMVFJBIHY0LjA="))())
local DashStatsBanner = UI:AddInfoBanner(T_DASH, loadstring(base64decode("2KXYrdi12KfYptmK2KfYqiDYp9mE2KzZhNiz2Kkg2KfZhNmF2KjYp9i02LHYqQ=="))(), loadstring(base64decode("2KzYp9ix2Yog2YLYsdin2KHYqSDYp9mE2YHYsdmK2YXYp9iqINmI2KfZhNio2YbYrCDZiNin2YTYsNin2YPYsdipLi4u"))())
UI:AddAction(T_DASH, loadstring(base64decode("2KrZgdi52YrZhCDZiNi22Lkg2KfZhNij2K/Yp9ihINin2YTYo9mC2LXZiSAoT25lLUNsaWNrIE1heCBGUFMp"))(), loadstring(base64decode("2KrYt9io2YrZgiDYqNmI2LPYqiDYp9mE2YHYsdmK2YXYp9iqICsg2KXYstin2YTYqSDYp9mE2LbYqNin2KggKyDYqtmG2LjZitmBINin2YTYsdin2YUg2YHZiNix2KfZiw=="))(), loadstring(base64decode("2KrYtNi62YrZhA=="))(), function(b)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            obj.Material = Enum.Material.SmoothPlastic
            obj.CastShadow = false
        elseif obj:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or obj:IsA(loadstring(base64decode("VHJhaWw="))()) then
            obj.Enabled = false
        end
    end
    collectgarbage(loadstring(base64decode("Y29sbGVjdA=="))())
    b.Text = loadstring(base64decode("2YXZgdi52ZHZhCDinJM="))()
    Notify(loadstring(base64decode("2KfZhNmI2LbYuSDYp9mE2KPZgti12Yk="))(), loadstring(base64decode("2KrZhSDYqtmB2LnZitmEINit2LLZhdipINin2YTYo9iv2KfYoSDYp9mE2LTYp9mF2YTYqSE="))(), 3, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

-- 2. FPS & Performance
UI:AddSection(T_FPS, loadstring(base64decode("2KrYrdiz2YrZhiDYp9mE2YHYsdmK2YXYp9iqINmI2KfZhNiw2KfZg9ix2Kk="))())
UI:AddAction(T_FPS, loadstring(base64decode("2KjZiNiz2Kog2YHYsdmK2YXYp9iqINi02KfZhdmEIChVbHRyYSBGUFMgQm9vc3Qp"))(), loadstring(base64decode("2KrYrdmI2YrZhCDYp9mE2K7Yp9mF2KfYqiDYpdmE2YkgU21vb3RoUGxhc3RpYyDZiNil2YTYutin2KEg2KfZhNi42YTYp9mEINmI2KfZhNin2YbYudmD2KfYs9in2Ko="))(), loadstring(base64decode("2KrYt9io2YrZgg=="))(), function(b)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Reflectance = 0
            obj.CastShadow = false
        elseif obj:IsA(loadstring(base64decode("RGVjYWw="))()) or obj:IsA(loadstring(base64decode("VGV4dHVyZQ=="))()) then
            obj.Transparency = 1
        end
    end
    b.Text = loadstring(base64decode("2KrZhSDinJM="))()
    Notify(loadstring(base64decode("2KfZhNmB2LHZitmF2KfYqg=="))(), loadstring(base64decode("2KrZhSDYqti32KjZitmCINio2YjYs9iqINin2YTZgdix2YrZhdin2Kog2KfZhNi02KfZhdmE"))(), 2.8, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddAction(T_FPS, loadstring(base64decode("2YHZgyDZgtmB2YQg2KfZhNmB2LHZitmF2KfYqiAoVW5sb2NrIEZQUyA5OTkp"))(), loadstring(base64decode("2YHYqtitINit2K8g2KfZhNmB2LHZitmF2KfYqiDZhNij2YLYtdmJINiz2LHYudipINmK2K/YudmF2YfYpyDYrNmH2KfYstmD"))(), loadstring(base64decode("2KrZgdi52YrZhA=="))(), function(b)
    if setfpscap then
        setfpscap(999)
        b.Text = loadstring(base64decode("OTk5IOKckw=="))()
        Notify(loadstring(base64decode("2KfZhNmB2LHZitmF2KfYqg=="))(), loadstring(base64decode("2KrZhSDZgdiq2K0g2KfZhNmB2LHZitmF2KfYqiDYpdmE2YkgOTk5IEZQUw=="))(), 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
    else
        Notify(loadstring(base64decode("2KrZhtio2YrZhw=="))(), loadstring(base64decode("2YXYtNi62YTZgyDZhNinINmK2K/YudmFIHNldGZwc2NhcA=="))(), 2.5, loadstring(base64decode("d2Fybg=="))())
    end
end)

UI:AddSlider(T_FPS, loadstring(base64decode("2KrYrdiv2YrYryDYs9mC2YEg2KfZhNmB2LHZitmF2KfYqiAoQ3VzdG9tIEZQUyBDYXAp"))(), 30, 360, 144, loadstring(base64decode("IEZQUw=="))(), function(uya2OHVP)
    if setfpscap then setfpscap(uya2OHVP) end
end, loadstring(base64decode("Q3VzdG9tRlBT"))())

UI:AddAction(T_FPS, loadstring(base64decode("2KrZhti42YrZgSDYp9mE2LHYp9mFIChEZWVwIFJBTSBDbGVhbmVyKQ=="))(), loadstring(base64decode("2KrZgdix2YrYuiDYp9mE2LDYp9mD2LHYqSDYp9mE2YXYpNmC2KrYqSDZhNiq2YLZhNmK2YQg2KfZhNiq2YLYt9mK2Lk="))(), loadstring(base64decode("2KrZhti42YrZgQ=="))(), function(b)
    local m1 = math.floor(Stats:GetTotalMemoryUsageMb())
    collectgarbage(loadstring(base64decode("Y29sbGVjdA=="))())
    task.wait(0.15)
    local m2 = math.floor(Stats:GetTotalMemoryUsageMb())
    b.Text = loadstring(base64decode("2KrZhSDinJM="))()
    Notify(loadstring(base64decode("2KfZhNiw2KfZg9ix2Kk="))(), string.format(loadstring(base64decode("2KrZhSDYqtmG2LjZitmBINin2YTYsdin2YUgKCVkTUIgLT4gJWRNQik="))(), m1, m2), 3, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddToggle(T_FPS, loadstring(base64decode("2KrYudi32YrZhCDYp9mE2KzYstmK2KbYp9iqINmI2KfZhNiv2K7Yp9mGIChObyBQYXJ0aWNsZXMp"))(), loadstring(base64decode("2KXZitmC2KfZgSDYp9mE2YbYp9ixINmI2KfZhNiv2K7Yp9mGINmI2KfZhNi02LHYp9ixINio2KfZhNmF2KfYqA=="))(), false, function(on)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or obj:IsA(loadstring(base64decode("VHJhaWw="))()) or obj:IsA(loadstring(base64decode("U21va2U="))()) or obj:IsA(loadstring(base64decode("RmlyZQ=="))()) then
            obj.Enabled = not on
        end
    end
    Notify(loadstring(base64decode("2KfZhNmF2KTYq9ix2KfYqg=="))(), on and loadstring(base64decode("2KrZhSDYqti52LfZitmEINin2YTYrNiy2YrYptin2Ko="))() or loadstring(base64decode("2KrZhdiqINil2LnYp9iv2Kkg2KfZhNis2LLZitim2KfYqg=="))())
end, loadstring(base64decode("Tm9QYXJ0aWNsZXM="))())

UI:AddAction(T_FPS, loadstring(base64decode("2KrYq9io2YrYqiDYrdix2YPYqSDYp9mE2YXZitin2YcgKFN0YXRpYyBXYXRlcik="))(), loadstring(base64decode("2KXZitmC2KfZgSDYqtmF2YjYrNin2Kog2YjYp9mG2LnZg9in2LPYp9iqINin2YTYqNit2LE="))(), loadstring(base64decode("2KrYt9io2YrZgg=="))(), function(b)
    local tr = workspace:FindFirstChildOfClass(loadstring(base64decode("VGVycmFpbg=="))())
    if tr then tr.WaterWaveSize, tr.WaterWaveSpeed, tr.WaterReflectance = 0, 0, 0 end
    b.Text = loadstring(base64decode("2KrZhSDinJM="))()
    Notify(loadstring(base64decode("2KfZhNmF2YrYp9mH"))(), loadstring(base64decode("2KrZhSDYqtir2KjZitiqINit2LHZg9ipINin2YTZhdmK2KfZhw=="))(), 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddToggle(T_FPS, loadstring(base64decode("2KXYrtmB2KfYoSDYrNmF2YrYuSDYp9mE2YTYp9i52KjZitmGIChIaWRlIFBsYXllcnMp"))(), loadstring(base64decode("2KXYrtmB2KfYoSDYtNiu2LXZitin2Kog2KfZhNmE2KfYudio2YrZhiDZiNmC2Kog2KfZhNiy2K3Zhdip"))(), false, function(on)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, pt in ipairs(plr.Character:GetDescendants()) do
                if pt:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or pt:IsA(loadstring(base64decode("RGVjYWw="))()) then pt.LocalTransparencyModifier = on and 1 or 0 end
            end
        end
    end
    Notify(loadstring(base64decode("2KfZhNmE2KfYudio2YrZhg=="))(), on and loadstring(base64decode("2KrZhSDYpdiu2YHYp9ihINin2YTZhNin2LnYqNmK2YY="))() or loadstring(base64decode("2KrZhSDYpdi42YfYp9ixINin2YTZhNin2LnYqNmK2YY="))())
end, loadstring(base64decode("SGlkZVBsYXllcnM="))())

UI:AddToggle(T_FPS, loadstring(base64decode("2KXYrtmB2KfYoSDYp9mE2KXZg9iz2LPZiNin2LHYp9iqIChIaWRlIEFjY2Vzc29yaWVzKQ=="))(), loadstring(base64decode("2KXYstin2YTYqSDYp9mE2YLYqNi52KfYqiDZiNin2YTYtNi52LEg2KfZhNir2YLZitmEINi52YYg2KfZhNmE2KfYudio2YrZhg=="))(), false, function(on)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            for _, acc in ipairs(plr.Character:GetChildren()) do
                if acc:IsA(loadstring(base64decode("QWNjZXNzb3J5"))()) and acc:FindFirstChild(loadstring(base64decode("SGFuZGxl"))()) then
                    acc.Handle.LocalTransparencyModifier = on and 1 or 0
                end
            end
        end
    end
    Notify(loadstring(base64decode("2KfZhNil2YPYs9iz2YjYp9ix2KfYqg=="))(), on and loadstring(base64decode("2KrZhSDYpdiu2YHYp9ihINin2YTYpdmD2LPYs9mI2KfYsdin2Ko="))() or loadstring(base64decode("2KrZhdiqINil2LnYp9iv2KrZh9in"))())
end)

UI:AddAction(T_FPS, loadstring(base64decode("2KrYrtmB2YrZgSDYp9mE2KPYtNis2KfYsSDZiNin2YTZhtio2KfYqtin2Ko="))(), loadstring(base64decode("2KXYrtmB2KfYoSDYo9mI2LHYp9mCINin2YTYo9i02KzYp9ixINmI2KfZhNi02KzZitix2KfYqiDYp9mE2YXYqtit2LHZg9ip"))(), loadstring(base64decode("2KrYt9io2YrZgg=="))(), function(b)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            local n = string.lower(obj.Name)
            if string.find(n, loadstring(base64decode("bGVhZg=="))()) or string.find(n, loadstring(base64decode("dHJlZQ=="))()) or string.find(n, loadstring(base64decode("YnVzaA=="))()) then
                obj.Transparency = 1
                obj.CastShadow = false
            end
        end
    end
    b.Text = loadstring(base64decode("2KrZhSDinJM="))()
    Notify(loadstring(base64decode("2KfZhNio2YrYptip"))(), loadstring(base64decode("2KrZhSDYqtiu2YHZitmBINin2YTYo9i02KzYp9ix"))(), 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddToggle(T_FPS, loadstring(base64decode("2YjYtti5INin2YTYrtmF2YjZhCDYp9mE2LDZg9mKIChEaXNhYmxlIDNEIFJlbmRlcik="))(), loadstring(base64decode("2KXZitmC2KfZgSDYp9mE2LHZhtiv2LEg2KvZhNin2KvZiiDYp9mE2KPYqNi52KfYryDZhNiq2KjYsdmK2K8g2KfZhNis2YfYp9iyINmI2YLYqiDYp9mE2YAgQUZL"))(), false, function(on)
    RunService:Set3dRenderingEnabled(not on)
    Notify(loadstring(base64decode("2KfZhNi32KfZgtip"))(), on and loadstring(base64decode("2KrZhSDYpdmK2YLYp9mBINin2YTYsdmG2K/YsSDZhdik2YLYqtin2Ys="))() or loadstring(base64decode("2KrZhdiqINil2LnYp9iv2Kkg2KfZhNix2YbYr9ix"))(), 2.5, on and loadstring(base64decode("d2Fybg=="))() or loadstring(base64decode("c3VjY2Vzcw=="))())
end)

-- 3. Lighting & Graphics
UI:AddSection(T_GFX, loadstring(base64decode("2KfZhNiq2K3Zg9mFINio2KfZhNil2LbYp9ih2Kkg2YjYp9mE2KPYrNmI2KfYoQ=="))())
UI:AddDropdown(T_GFX, loadstring(base64decode("2YLZiNin2YTYqCDYp9mE2KPYrNmI2KfYoSDYp9mE2KzYp9mH2LLYqSAoQXRtb3NwaGVyZSk="))(), {
    loadstring(base64decode("2KfZhNmI2LbYuSDYp9mE2KPYtdmE2YogKERlZmF1bHQp"))(),
    loadstring(base64decode("2YbZh9in2LEg2YXYtNix2YIgKEJyaWdodCBEYXkp"))(),
    loadstring(base64decode("2LrYsdmI2Kgg2K/Yp9mB2KYgKEdvbGRlbiBTdW5zZXQp"))(),
    loadstring(base64decode("2YTZitmEINmG2YrZiNmGIChDeWJlciBOaWdodCk="))(),
    loadstring(base64decode("2LHYpNmK2Kkg2YTZitmE2YrYqSDZg9in2YXZhNipIChGdWxsQnJpZ2h0KQ=="))()
}, loadstring(base64decode("2KfZhNmI2LbYuSDYp9mE2KPYtdmE2YogKERlZmF1bHQp"))(), function(choice)
    if choice == loadstring(base64decode("2KfZhNmI2LbYuSDYp9mE2KPYtdmE2YogKERlZmF1bHQp"))() then
        Lighting.ClockTime = OriginalState.ClockTime
        Lighting.Brightness = OriginalState.Brightness
        Lighting.Ambient = OriginalState.Ambient
        Lighting.GlobalShadows = OriginalState.GlobalShadows
    elseif choice == loadstring(base64decode("2YbZh9in2LEg2YXYtNix2YIgKEJyaWdodCBEYXkp"))() then
        Lighting.ClockTime, Lighting.Brightness = 14, 2.2
    elseif choice == loadstring(base64decode("2LrYsdmI2Kgg2K/Yp9mB2KYgKEdvbGRlbiBTdW5zZXQp"))() then
        Lighting.ClockTime, Lighting.Brightness = 17.8, 1.8
    elseif choice == loadstring(base64decode("2YTZitmEINmG2YrZiNmGIChDeWJlciBOaWdodCk="))() then
        Lighting.ClockTime, Lighting.Brightness = 22, 1.1
    elseif choice == loadstring(base64decode("2LHYpNmK2Kkg2YTZitmE2YrYqSDZg9in2YXZhNipIChGdWxsQnJpZ2h0KQ=="))() then
        Lighting.ClockTime, Lighting.Brightness = 14, 2.5
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.GlobalShadows = false
    end
    Notify(loadstring(base64decode("2KfZhNij2KzZiNin2KE="))(), loadstring(base64decode("2KrZhSDYqti32KjZitmCOiA="))() .. choice, 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddSlider(T_GFX, loadstring(base64decode("2LPYp9i52Kkg2KfZhNmK2YjZhSAoQ2xvY2sgVGltZSk="))(), 0, 24, 14, loadstring(base64decode("aA=="))(), function(uya2OHVP) Lighting.ClockTime = uya2OHVP end)
UI:AddSlider(T_GFX, loadstring(base64decode("2YXYs9iq2YjZiSDYp9mE2LPYt9mI2LkgKEJyaWdodG5lc3Mp"))(), 0, 5, 1, loadstring(base64decode(""))(), function(uya2OHVP) Lighting.Brightness = uya2OHVP end)

UI:AddToggle(T_GFX, loadstring(base64decode("2KXYstin2YTYqSDYp9mE2LbYqNin2Kgg2YjYp9mE2LrYqNin2LQgKE5vIEZvZyk="))(), loadstring(base64decode("2YXYs9itINin2YTYttio2KfYqCDZiNiq2KPYq9mK2LHYp9iqINin2YTZgCBCbHVyINmE2LXZgdin2KEg2KfZhNix2KTZitip"))(), false, function(on)
    Lighting.FogEnd = on and 100000 or OriginalState.FogEnd
    for _, ef in ipairs(Lighting:GetChildren()) do
        if ef:IsA(loadstring(base64decode("UG9zdEVmZmVjdA=="))()) and ef.Name ~= loadstring(base64decode("UzdMRV9WaWJyYW5jZQ=="))() then ef.Enabled = not on end
    end
    Notify(loadstring(base64decode("2KfZhNix2KTZitip"))(), on and loadstring(base64decode("2KrZhSDZhdiz2K0g2KfZhNi22KjYp9io"))() or loadstring(base64decode("2KrZhdiqINil2LnYp9iv2Kkg2KfZhNi22KjYp9io"))())
end)

UI:AddToggle(T_GFX, loadstring(base64decode("2KrYtNio2Lkg2KfZhNij2YTZiNin2YYg2KfZhNiz2YrZhtmF2KfYptmKIChWaWJyYW5jZSk="))(), loadstring(base64decode("2KrYrdiz2YrZhiDZiNi22YjYrSDZiNit2YrZiNmK2Kkg2KPZhNmI2KfZhiDYp9mE2YTYudio2Kk="))(), false, function(on)
    local cc = Lighting:FindFirstChild(loadstring(base64decode("UzdMRV9WaWJyYW5jZQ=="))())
    if on and not cc then
        cc = Instance.new(loadstring(base64decode("Q29sb3JDb3JyZWN0aW9uRWZmZWN0"))())
        cc.Name = loadstring(base64decode("UzdMRV9WaWJyYW5jZQ=="))()
        cc.Saturation = 0.28
        cc.Contrast = 0.1
        cc.Parent = Lighting
    elseif not on and cc then cc:Destroy() end
    Notify(loadstring(base64decode("2KfZhNij2YTZiNin2YY="))(), on and loadstring(base64decode("2KrZhSDYqtmB2LnZitmEINiq2LTYqNi5INin2YTYo9mE2YjYp9mG"))() or loadstring(base64decode("2KrZhSDYpdmK2YLYp9mBINiq2LTYqNi5INin2YTYo9mE2YjYp9mG"))())
end)

UI:AddToggle(T_GFX, loadstring(base64decode("2KXZhNi62KfYoSDYp9mE2LjZhNin2YQg2KjYp9mE2YPYp9mF2YQgKE5vIFNoYWRvd3Mp"))(), loadstring(base64decode("2KrYudi32YrZhCDYuNmE2KfZhCDYp9mE2LTZhdizINmI2KfZhNij2KzYs9in2YUg2YTYstmK2KfYr9ipINin2YTZgdix2YrZhdin2Ko="))(), false, function(on)
    Lighting.GlobalShadows = not on
end)

-- 4. Camera & Crosshair Studio
UI:AddSection(T_CAM, loadstring(base64decode("2KfZhNmD2KfZhdmK2LHYpyDZiNin2LPYqtmI2K/ZitmIINin2YTYqti12YjZitio"))())
local BaseCameraFOV = 70
UI:AddSlider(T_CAM, loadstring(base64decode("2LLYp9mI2YrYqSDYp9mE2LHYpNmK2KkgKENhbWVyYSBGT1Yp"))(), 45, 120, 70, loadstring(base64decode("wrA="))(), function(uya2OHVP)
    BaseCameraFOV = uya2OHVP
    Camera.FieldOfView = uya2OHVP
end)

UI:AddToggle(T_CAM, loadstring(base64decode("2KrZiNiz2YrYuSDYstmI2YUg2KfZhNmD2KfZhdmK2LHYpyAoTWF4IFpvb20gODAwKQ=="))(), loadstring(base64decode("2KfZhNiz2YXYp9itINio2KXYqNi52KfYryDYp9mE2YPYp9mF2YrYsdinINmE2YTYrtmE2YEg2YTZhdiz2KfZgdipINmD2KjZitix2Kk="))(), false, function(on)
    LocalPlayer.CameraMaxZoomDistance = on and 800 or OriginalState.MaxZoom
end)

local ZoomKeyEnabled = false
UI:AddToggle(T_CAM, loadstring(base64decode("2YXZhti42KfYsSDYqtmC2LHZitioINiz2LHZiti5IFvYrdix2YEgWl0="))(), loadstring(base64decode("2KfYtti62Lcg2KjYp9iz2KrZhdix2KfYsSDYudmE2YkgWiDZhNiq2YLYsdmK2Kgg2KfZhNi02KfYtNip"))(), false, function(on)
    ZoomKeyEnabled = on
end)

local CrosshairEnabled, CrosshairStyle, CrosshairSize = false, loadstring(base64decode("2YbZgti32Kkg2YXYqtmI2YfYrNipIChEb3Qp"))(), 8
local function RebuildCrosshair()
    local old = ScreenGui:FindFirstChild(loadstring(base64decode("UzdMRV9Dcm9zc2hhaXJSb290"))())
    if old then old:Destroy() end
    if not CrosshairEnabled then return end
    local holder = Instance.new(loadstring(base64decode("RnJhbWU="))())
    holder.Name = loadstring(base64decode("UzdMRV9Dcm9zc2hhaXJSb290"))()
    holder.Size = UDim2.new(0, 40, 0, 40)
    holder.Position = UDim2.new(0.5, -20, 0.5, -20)
    holder.BackgroundTransparency = 1
    holder.ZIndex = 45
    holder.Parent = ScreenGui
    if CrosshairStyle == loadstring(base64decode("2YbZgti32Kkg2YXYqtmI2YfYrNipIChEb3Qp"))() then
        local dot = Instance.new(loadstring(base64decode("RnJhbWU="))())
        dot.Size = UDim2.new(0, CrosshairSize, 0, CrosshairSize)
        dot.AnchorPoint = Vector2.new(0.5, 0.5)
        dot.Position = UDim2.new(0.5, 0, 0.5, 0)
        dot.BackgroundColor3 = Colors.Primary
        dot.Parent = holder
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), dot).CornerRadius = UDim.new(1, 0)
    elseif CrosshairStyle == loadstring(base64decode("2LXZhNmK2Kgg2KfYrdiq2LHYp9mB2YogKENyb3NzKQ=="))() then
        local h = Instance.new(loadstring(base64decode("RnJhbWU="))())
        h.Size = UDim2.new(0, CrosshairSize * 2.2, 0, 2)
        h.AnchorPoint = Vector2.new(0.5, 0.5)
        h.Position = UDim2.new(0.5, 0, 0.5, 0)
        h.BackgroundColor3 = Colors.Primary
        h.BorderSizePixel = 0
        h.Parent = holder
        local v = Instance.new(loadstring(base64decode("RnJhbWU="))())
        v.Size = UDim2.new(0, 2, 0, CrosshairSize * 2.2)
        v.AnchorPoint = Vector2.new(0.5, 0.5)
        v.Position = UDim2.new(0.5, 0, 0.5, 0)
        v.BackgroundColor3 = Colors.Primary
        v.BorderSizePixel = 0
        v.Parent = holder
    else
        local ring = Instance.new(loadstring(base64decode("RnJhbWU="))())
        ring.Size = UDim2.new(0, CrosshairSize * 2.4, 0, CrosshairSize * 2.4)
        ring.AnchorPoint = Vector2.new(0.5, 0.5)
        ring.Position = UDim2.new(0.5, 0, 0.5, 0)
        ring.BackgroundTransparency = 1
        ring.Parent = holder
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), ring).CornerRadius = UDim.new(1, 0)
        local st = Instance.new(loadstring(base64decode("VUlTdHJva2U="))())
        st.Color = Colors.Primary
        st.Thickness = 2
        st.Parent = ring
    end
end

UI:AddToggle(T_CAM, loadstring(base64decode("2KrZgdi52YrZhCDZhtmC2LfYqSDYp9mE2KrYtdmI2YrYqCAoQ3Jvc3NoYWlyKQ=="))(), loadstring(base64decode("2KXYuNmH2KfYsSDYudmE2KfZhdipINiq2LXZiNmK2Kgg2KjZiNiz2Lcg2KfZhNi02KfYtNip"))(), false, function(on)
    CrosshairEnabled = on
    RebuildCrosshair()
end)

UI:AddDropdown(T_CAM, loadstring(base64decode("2LTZg9mEINmG2YLYt9ipINin2YTYqti12YjZitio"))(), {loadstring(base64decode("2YbZgti32Kkg2YXYqtmI2YfYrNipIChEb3Qp"))(), loadstring(base64decode("2LXZhNmK2Kgg2KfYrdiq2LHYp9mB2YogKENyb3NzKQ=="))(), loadstring(base64decode("2K3ZhNmC2Kkg2K/Yp9im2LHZitipIChDaXJjbGUp"))()}, loadstring(base64decode("2YbZgti32Kkg2YXYqtmI2YfYrNipIChEb3Qp"))(), function(opt)
    CrosshairStyle = opt
    RebuildCrosshair()
end)

UI:AddSlider(T_CAM, loadstring(base64decode("2K3YrNmFINmG2YLYt9ipINin2YTYqti12YjZitio"))(), 4, 20, 8, loadstring(base64decode("cHg="))(), function(uya2OHVP)
    CrosshairSize = uya2OHVP
    RebuildCrosshair()
end)

UI:AddToggle(T_CAM, loadstring(base64decode("2YjYtti5INin2YTYqti12YjZitixINin2YTYs9mK2YbZhdin2KbZiiAoQ2luZW1hIE1vZGUp"))(), loadstring(base64decode("2KXYrtmB2KfYoSDZgtmI2KfYptmFINix2YjYqNmE2YjZg9izINmI2KfZhNi02KfYqiDZhNmE2KrYtdmI2YrYsQ=="))(), false, function(on)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, not on)
end)

UI:AddAction(T_CAM, loadstring(base64decode("2KXYtdmE2KfYrSDYp9mE2YPYp9mF2YrYsdinIChGaXggQ2FtZXJhKQ=="))(), loadstring(base64decode("2KXYudin2K/YqSDYttio2Lcg2KfZhNmD2KfZhdmK2LHYpyDZgdmI2LHYp9mLINmE2LTYrti12YrYqtmD"))(), loadstring(base64decode("2KXYtdmE2KfYrQ=="))(), function()
    Camera.CameraType = Enum.CameraType.Custom
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    end
    Notify(loadstring(base64decode("2KfZhNmD2KfZhdmK2LHYpw=="))(), loadstring(base64decode("2KrZhSDYpdi12YTYp9itINin2YTZg9in2YXZitix2Kc="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

-- 5. Character & Safe Local VFX
UI:AddSection(T_MOV, loadstring(base64decode("2KfZhNiq2K3Zg9mFINio2KfZhNi02K7YtdmK2Kkg2YjYp9mE2YXYpNir2LHYp9iqINin2YTZhdit2YTZitip"))())
UI:AddToggle(T_MOV, loadstring(base64decode("2KrZgdi52YrZhCDZgtmB2YQg2KfZhNmF2KfZiNizIChGb3JjZSBTaGlmdExvY2sp"))(), loadstring(base64decode("2KfZhNiz2YXYp9itINio2KrZgdi52YrZhCBTaGlmdExvY2sg2YHZiiDYo9mKINmF2KfYqA=="))(), false, function(on)
    LocalPlayer.DevEnableMouseLock = on
end)

UI:AddToggle(T_MOV, loadstring(base64decode("2KrYq9io2YrYqiDYp9mE2LTYrti12YrYqSDZgdmKINmF2YPYp9mG2YfYpyAoQW5jaG9yIFNlbGYp"))(), loadstring(base64decode("2KrYrNmF2YrYryDZhdmI2YLYuSDYtNiu2LXZitiq2YMg2YTZhdmG2Lkg2KfZhNin2YbYstmE2KfZgg=="))(), false, function(on)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) then
        LocalPlayer.Character.HumanoidRootPart.Anchored = on
    end
end)

UI:AddToggle(T_MOV, loadstring(base64decode("2YXYs9in2LEg2LbZiNim2Yog2K7ZhNmBINin2YTYtNiu2LXZitipIChOZW9uIFRyYWlsKQ=="))(), loadstring(base64decode("2KXYttin2YHYqSDYrti3INi22YjYptmKINmF2KrZiNmH2Kwg2YrYqtio2Lkg2K3YsdmD2KrZgyDZhdit2YTZitin2Ys="))(), false, function(on)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if not hrp then return end
    if on and not hrp:FindFirstChild(loadstring(base64decode("UzdMRV9Mb2NhbFRyYWls"))()) then
        local a0 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), hrp); a0.Name = loadstring(base64decode("UzdMRV9BMA=="))(); a0.Position = Vector3.new(0, 1.2, 0)
        local a1 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), hrp); a1.Name = loadstring(base64decode("UzdMRV9BMQ=="))(); a1.Position = Vector3.new(0, -1.2, 0)
        local tr = Instance.new(loadstring(base64decode("VHJhaWw="))(), hrp); tr.Name = loadstring(base64decode("UzdMRV9Mb2NhbFRyYWls"))(); tr.Attachment0 = a0; tr.Attachment1 = a1; tr.Lifetime = 0.6
        tr.Color = ColorSequence.new(Colors.Primary, Colors.Secondary)
    elseif not on then
        for _, n in ipairs({loadstring(base64decode("UzdMRV9Mb2NhbFRyYWls"))(), loadstring(base64decode("UzdMRV9BMA=="))(), loadstring(base64decode("UzdMRV9BMQ=="))()}) do
            local obj = hrp:FindFirstChild(n)
            if obj then obj:Destroy() end
        end
    end
end)

UI:AddAction(T_MOV, loadstring(base64decode("2LHYs9io2YYg2LPYsdmK2LkgKFF1aWNrIFJlc3Bhd24p"))(), loadstring(base64decode("2KXYudin2K/YqSDYpdit2YrYp9ihINi02K7YtdmK2KrZgyDZgdmI2LHYp9mL"))(), loadstring(base64decode("2LHYs9io2YY="))(), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
        LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()).Health = 0
    end
end)

-- 6. Waypoints
UI:AddSection(T_WAY, loadstring(base64decode("2YbYuNin2YUg2K3Zgdi4INin2YTYpdit2K/Yp9ir2YrYp9iqIChXYXlwb2ludHMp"))())
local SavedWaypoints = {Slot1 = nil, Slot2 = nil}
UI:AddAction(T_WAY, loadstring(base64decode("2K3Zgdi4INin2YTZhdmI2YLYuSDZgdmKINin2YTYrtin2YbYqSAxIChTYXZlIFNsb3QgMSk="))(), loadstring(base64decode("2KrYrtiy2YrZhiDYpdit2K/Yp9ir2YrYp9iqINmF2YjZgti52YMg2KfZhNit2KfZhNmK"))(), loadstring(base64decode("2K3Zgdi4IDE="))(), function(b)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) then
        SavedWaypoints.Slot1 = LocalPlayer.Character.HumanoidRootPart.CFrame
        b.Text = loadstring(base64decode("2YXYrdmB2YjYuCDinJM="))()
        Notify(loadstring(base64decode("2KfZhNmF2YjYp9mC2Lk="))(), loadstring(base64decode("2KrZhSDYrdmB2Lgg2KfZhNmF2YjZgti5IDE="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
    end
end)
UI:AddAction(T_WAY, loadstring(base64decode("2KfZhNiw2YfYp9ioINmE2YTZhdmI2YLYuSDYp9mE2YXYrdmB2YjYuCAxIChHbyBTbG90IDEp"))(), loadstring(base64decode("2KfZhNin2YbYqtmC2KfZhCDZhNmE2KXYrdiv2KfYq9mK2KfYqiDYp9mE2YXYrtiy2YbYqSDZgdmKINin2YTYrtin2YbYqSAx"))(), loadstring(base64decode("2KfZhtiq2YLYp9mEIDE="))(), function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if hrp and SavedWaypoints.Slot1 then hrp.CFrame = SavedWaypoints.Slot1 end
end)
UI:AddAction(T_WAY, loadstring(base64decode("2YbYs9iuINil2K3Yr9in2KvZitin2Kog2YXZiNmC2LnZgyAoQ29weSBYWVop"))(), loadstring(base64decode("2YbYs9iuINil2K3Yr9in2KvZitin2KogWCwgWSwgWiDZhNmE2K3Yp9mB2LjYqQ=="))(), loadstring(base64decode("2YbYs9iu"))(), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) and setclipboard then
        local p = LocalPlayer.Character.HumanoidRootPart.Position
        setclipboard(string.format(loadstring(base64decode("JS4yZiwgJS4yZiwgJS4yZg=="))(), p.X, p.Y, p.Z))
        Notify(loadstring(base64decode("2KfZhNit2KfZgdi42Kk="))(), loadstring(base64decode("2KrZhSDZhtiz2K4g2KXYrdiv2KfYq9mK2KfYqtmD"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
    end
end)

-- 7. Visual Highlights
UI:AddSection(T_VIS, loadstring(base64decode("2KfZhNmF2KTYtNix2KfYqiDYp9mE2KjYtdix2YrYqSDZhNmE2KfYudio2YrZhg=="))())
local PlayerHighlightActive = false
local function SyncHighlights()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hl = plr.Character:FindFirstChild(loadstring(base64decode("UzdMRV9QbGF5ZXJHbG93"))())
            if PlayerHighlightActive and not hl then
                hl = Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))(), plr.Character)
                hl.Name = loadstring(base64decode("UzdMRV9QbGF5ZXJHbG93"))()
                hl.FillColor = Colors.Primary
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.FillTransparency = 0.65
            elseif not PlayerHighlightActive and hl then
                hl:Destroy()
            end
        end
    end
end

UI:AddToggle(T_VIS, loadstring(base64decode("2YfYp9mE2Kkg2LbZiNim2YrYqSDYrdmI2YQg2KfZhNmE2KfYudio2YrZhiAoSGlnaGxpZ2h0KQ=="))(), loadstring(base64decode("2KXYuNmH2KfYsSDYpdi32KfYsSDZhdi22YrYoSDYrdmI2YQg2KfZhNmE2KfYudio2YrZhiDZhNiq2YXZitmK2LIg2YXZiNin2YLYudmH2YU="))(), false, function(on)
    PlayerHighlightActive = on
    SyncHighlights()
end)

-- 8. Player Inspector
UI:AddSection(T_PLR, loadstring(base64decode("2YXYs9iq2YPYtNmBINin2YTZhNin2LnYqNmK2YYg2YHZiiDYp9mE2LPZitix2YHYsQ=="))())
local SelectedPlayerName = LocalPlayer.Name
local PlrNames = {}
for _, p in ipairs(Players:GetPlayers()) do table.insert(PlrNames, p.Name) end

UI:AddDropdown(T_PLR, loadstring(base64decode("2KfYrtiq2LEg2YTYp9i52KjYp9mLINmE2YTZgdit2LU="))(), PlrNames, LocalPlayer.Name, function(chosen)
    SelectedPlayerName = chosen
    local t = Players:FindFirstChild(chosen)
    if t then Notify(loadstring(base64decode("2YHYrdi1INin2YTZhNin2LnYqA=="))(), string.format(loadstring(base64decode("JXMgfCDYudmF2LEg2KfZhNit2LPYp9ioOiAlZCDZitmI2YUgfCBJRDogJWQ="))(), t.DisplayName, t.AccountAge or 0, t.UserId), 3.5, loadstring(base64decode("c3VjY2Vzcw=="))()) end
end)

UI:AddToggle(T_PLR, loadstring(base64decode("2YXYsdin2YLYqNipINin2YTZhNin2LnYqCDYqNin2YTZg9in2YXZitix2KcgKFNwZWN0YXRlKQ=="))(), loadstring(base64decode("2KrZiNis2YrZhyDYp9mE2YPYp9mF2YrYsdinINmE2YXYtNin2YfYr9ipINin2YTZhNin2LnYqCDYp9mE2YXYrtiq2KfYsQ=="))(), false, function(on)
    local t = Players:FindFirstChild(SelectedPlayerName)
    if on and t and t.Character and t.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
        Camera.CameraSubject = t.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    end
end)

-- 9. Audio & Smart Utilities
UI:AddSection(T_AUD, loadstring(base64decode("2KfZhNi12YjYqtmK2KfYqiDZiNin2YTYo9iv2YjYp9iqINin2YTYsNmD2YrYqQ=="))())
local AntiAFKActive = true
UI:AddToggle(T_AUD, loadstring(base64decode("2YXYp9mG2Lkg2KfZhNi32LHYryDYp9mE2KrZhNmC2KfYptmKIChBbnRpLUFGSyk="))(), loadstring(base64decode("2YrZhdmG2Lkg2KfZhNiz2YrYsdmB2LEg2YXZhiDYt9ix2K/ZgyDYudmG2K8g2KrYsdmDINin2YTYrNmH2KfYsg=="))(), true, function(on) AntiAFKActive = on end)
UI:AddToggle(T_AUD, loadstring(base64decode("2YPYqtmFINi12YjYqiDYp9mE2YTYudio2KkgKE11dGUgR2FtZSk="))(), loadstring(base64decode("2KXZitmC2KfZgSDYrNmF2YrYuSDYp9mE2KPYtdmI2KfYqiDYqNin2YTZhdin2Kg="))(), false, function(on)
    for _, s in ipairs(workspace:GetDescendants()) do if s:IsA(loadstring(base64decode("U291bmQ="))()) then s.Volume = on and 0 or 0.5 end end
end)
UI:AddSlider(T_AUD, loadstring(base64decode("2YXYs9iq2YjZiSDYtdmI2Kog2KfZhNmF2KfYqA=="))(), 0, 100, 50, loadstring(base64decode("JQ=="))(), function(uya2OHVP)
    for _, s in ipairs(workspace:GetDescendants()) do if s:IsA(loadstring(base64decode("U291bmQ="))()) then s.Volume = uya2OHVP / 100 end end
end)
UI:AddToggle(T_AUD, loadstring(base64decode("2KXYrtmB2KfYoSDZgdmC2KfYudin2Kog2KfZhNi02KfYqg=="))(), loadstring(base64decode("2KXYrtmB2KfYoSDYp9mE2LHYs9in2KbZhCDZgdmI2YIg2LHYpNmI2LMg2KfZhNmE2KfYudio2YrZhg=="))(), false, function(on)
    pcall(function() ChatService.BubbleChatEnabled = not on end)
end)

-- 10. Server & Network
UI:AddSection(T_SRV, loadstring(base64decode("2KfZhNiq2YbZgtmEINio2YrZhiDYp9mE2LPZitix2YHYsdin2Kog2YjYp9mE2LTYqNmD2Kk="))())
UI:AddAction(T_SRV, loadstring(base64decode("2KXYudin2K/YqSDYr9iu2YjZhCAoUmVqb2luKQ=="))(), loadstring(base64decode("2KXYudin2K/YqSDYp9mE2KfYqti12KfZhCDYqNmG2YHYsyDYp9mE2LPZitix2YHYsSDYp9mE2K3Yp9mE2Yo="))(), loadstring(base64decode("2K/YrtmI2YQ="))(), function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)
UI:AddAction(T_SRV, loadstring(base64decode("2LPZitix2YHYsSDZgtmE2YrZhCDYp9mE2YTYp9i52KjZitmGIChMb3cgU2VydmVyKQ=="))(), loadstring(base64decode("2KfZhNin2YbYqtmC2KfZhCDZhNij2K7ZgSDYs9mK2LHZgdixINmE2LHZgdi5INin2YTZgdix2YrZhdin2Ko="))(), loadstring(base64decode("2KjYrdir"))(), function()
    pcall(function()
        local url = loadstring(base64decode("aHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw=="))() .. game.PlaceId .. loadstring(base64decode("L3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1Bc2MmbGltaXQ9MTAw"))()
        local data = HttpService:JSONDecode(game:HttpGet(url))
        for _, srv in ipairs(data.data) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, srv.id, LocalPlayer)
                break
            end
        end
    end)
end)
UI:AddAction(T_SRV, loadstring(base64decode("2KrYutmK2YrYsSDYp9mE2LPZitix2YHYsSAoU2VydmVyIEhvcCk="))(), loadstring(base64decode("2KfZhNin2YbYqtmC2KfZhCDZhNij2Yog2LPZitix2YHYsSDYudin2YUg2KLYrtix"))(), loadstring(base64decode("2KfZhtiq2YLYp9mE"))(), function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
UI:AddAction(T_SRV, loadstring(base64decode("2YbYs9iuINmF2LnYsdmBINin2YTYs9mK2LHZgdixIChDb3B5IEpvYklkKQ=="))(), loadstring(base64decode("2YbYs9iuIEpvYklkINmE2YXYtNin2LHZg9iq2Ycg2YXYuSDYo9i12K/Zgtin2KbZgw=="))(), loadstring(base64decode("2YbYs9iu"))(), function()
    if setclipboard then setclipboard(game.JobId); Notify(loadstring(base64decode("2KfZhNit2KfZgdi42Kk="))(), loadstring(base64decode("2KrZhSDZhtiz2K4gSm9iSWQ="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))()) end
end)

-- 11. Themes & Settings
UI:AddSection(T_SET, loadstring(base64decode("2KrYrti12YrYtSDYp9mE2YXYuNmH2LEg2YjYp9mE2KXYudiv2KfYr9in2Ko="))())
local function ApplyThemeByIndex(idx)
    local t = ThemeCatalog[idx]
    if not t then return end
    ActiveThemeIndex = idx
    for k, v in pairs(t) do Colors[k] = v end
    VFXEngine:Tween(MainWindow, 0.3, {BackgroundColor3 = Colors.Base})
    VFXEngine:Tween(Sidebar, 0.3, {BackgroundColor3 = Colors.Sidebar})
    VFXEngine:Tween(HudBar, 0.3, {BackgroundColor3 = Colors.Base})
    VFXEngine:Tween(HudStroke, 0.3, {Color = Colors.Primary})
    VFXEngine:Tween(HudLogo, 0.3, {TextColor3 = Colors.Primary})
    VFXEngine:Tween(RestorePill, 0.3, {BackgroundColor3 = Colors.Base})
    VFXEngine:Tween(RestoreStroke, 0.3, {Color = Colors.Primary})
    VFXEngine:Tween(BrandSubtitle, 0.3, {TextColor3 = Colors.Primary})
    VFXEngine:Tween(KeyHint, 0.3, {TextColor3 = Colors.Primary})
    VFXEngine:Tween(AmbientShadow, 0.3, {ImageColor3 = Colors.Primary})
    WindowBorderGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Primary), ColorSequenceKeypoint.new(1, Colors.Secondary)})
    HudGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Primary), ColorSequenceKeypoint.new(1, Colors.Secondary)})
    BrandLogoGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Colors.Primary)})
    for name, tData in pairs(UI.Tabs) do
        tData.grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Primary), ColorSequenceKeypoint.new(1, Colors.Secondary)})
        if UI.ActiveTab ~= name then
            tData.btn.BackgroundColor3 = Colors.Card
            tData.btn.TextColor3 = Colors.SubText
        end
    end
    for _, item in ipairs(UI.AllCards) do
        if item.card and item.card:IsA(loadstring(base64decode("RnJhbWU="))()) then item.card.BackgroundColor3 = Colors.Card end
    end
    if CrosshairEnabled then RebuildCrosshair() end
    Notify(loadstring(base64decode("2KfZhNmF2LjZh9ix"))(), loadstring(base64decode("2KrZhSDYqti32KjZitmCINir2YrZhTog"))() .. t.Name, 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
end

local ThemeNames = {}
for _, t in ipairs(ThemeCatalog) do table.insert(ThemeNames, t.Name) end
UI:AddDropdown(T_SET, loadstring(base64decode("2KfYrtiq2YrYp9ixINir2YrZhSDYp9mE2YjYp9is2YfYqSAoNyBUaGVtZXMp"))(), ThemeNames, ThemeNames[1], function(sel)
    for i, t in ipairs(ThemeCatalog) do if t.Name == sel then ApplyThemeByIndex(i); break end end
end)

UI:AddAction(T_SET, loadstring(base64decode("2KrYqNiv2YrZhCDYs9ix2YrYuSDZhNmE2KvZitmFINin2YTYqtin2YTZig=="))(), loadstring(base64decode("2KfZhNiq2YbZgtmEINin2YTYs9ix2YrYuSDYqNmK2YYg2KzZhdmK2Lkg2KfZhNir2YrZhdin2Ko="))(), loadstring(base64decode("2KrYqNiv2YrZhA=="))(), function()
    ApplyThemeByIndex((ActiveThemeIndex % #ThemeCatalog) + 1)
end)

UI:AddSlider(T_SET, loadstring(base64decode("2LPYsdi52Kkg2KfZhNij2YbZitmF2YrYtNmGIChBbmltYXRpb24gU3BlZWQp"))(), 50, 200, 100, loadstring(base64decode("JQ=="))(), function(uya2OHVP)
    VFXEngine.AnimationSpeed = uya2OHVP / 100
end)

UI:AddToggle(T_SET, loadstring(base64decode("2YXYpNir2LHYp9iqINin2YTYtNix2KfYsSAoU3BhcmtsZSBWRlgp"))(), loadstring(base64decode("2KrZgdi52YrZhCDYrNiy2YrYptin2Kog2KfZhNi22YjYoSDYudmG2K8g2KfZhNi22LrYtw=="))(), true, function(on) VFXEngine.ParticlesEnabled = on end)
UI:AddToggle(T_SET, loadstring(base64decode("2YXYpNir2LEg2KfZhNiq2YXZiNisIChSaXBwbGUgVkZYKQ=="))(), loadstring(base64decode("2KrZgdi52YrZhCDYr9mI2KfYptixINin2YTYqtmF2YjYrCDYr9in2K7ZhCDYp9mE2KPYstix2KfYsQ=="))(), true, function(on) VFXEngine.RipplesEnabled = on end)
UI:AddToggle(T_SET, loadstring(base64decode("2KPYtdmI2KfYqiDYp9mE2YjYp9is2YfYqSAoVUkgU291bmRzKQ=="))(), loadstring(base64decode("2KrYtNi62YrZhCDYo9mIINmD2KrZhSDYo9i12YjYp9iqINin2YTZhtmC2LHYp9iq"))(), true, function(on) VFXEngine.SoundEnabled = on end)
UI:AddToggle(T_SET, loadstring(base64decode("2LTYsdmK2Lcg2KfZhNij2K/Yp9ihINin2YTYudmE2YjZiiAoSFVEKQ=="))(), loadstring(base64decode("2KXYuNmH2KfYsSDYo9mIINil2K7Zgdin2KEg2LTYsdmK2Lcg2KfZhNmB2LHZitmF2KfYqg=="))(), true, function(on) HudBar.Visible = on end)
UI:AddToggle(T_SET, loadstring(base64decode("2KfZhNil2LTYudin2LHYp9iqINin2YTZhdmG2KjYq9mC2Kk="))(), loadstring(base64decode("2KrZgdi52YrZhCDYo9mIINil2YrZgtin2YEg2KfZhNil2LTYudin2LHYp9iq"))(), true, function(on) NotificationsEnabled = on end)

UI:AddAction(T_SET, loadstring(base64decode("2LHZitiz2YrYqiDYtNin2YXZhCDZhNmD2YQg2LTZitihIChGYWN0b3J5IFJlc2V0KQ=="))(), loadstring(base64decode("2KXYsdis2KfYuSDYrNmF2YrYuSDYp9mE2K7Zitin2LHYp9iqINmE2YjYtti52YfYpyDYp9mE2KPYtdmE2Yo="))(), loadstring(base64decode("2LHZitiz2YrYqg=="))(), function(b)
    for _, fn in ipairs(Lifecycle.ResetCallbacks) do pcall(fn) end
    Lighting.GlobalShadows = OriginalState.GlobalShadows
    Lighting.Brightness = OriginalState.Brightness
    Lighting.ClockTime = OriginalState.ClockTime
    Lighting.FogEnd = OriginalState.FogEnd
    Camera.FieldOfView = OriginalState.FieldOfView
    LocalPlayer.CameraMaxZoomDistance = OriginalState.MaxZoom
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    b.Text = loadstring(base64decode("2KrZhSDinJM="))()
    Notify(loadstring(base64decode("2KfZhNmG2LjYp9mF"))(), loadstring(base64decode("2KrZhSDYudmF2YQg2LHZitiz2YrYqiDYtNin2YXZhA=="))(), 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
    task.wait(1.2)
    b.Text = loadstring(base64decode("2LHZitiz2YrYqg=="))()
end)

UI:AddAction(T_SET, loadstring(base64decode("2KXYutmE2KfZgiDYp9mE2LPZg9ix2KjYqiDZhtmH2KfYptmK2KfZiw=="))(), loadstring(base64decode("2K3YsNmBINin2YTZiNin2KzZh9ipINmI2KrZhti42YrZgSDYp9mE2LDYp9mD2LHYqQ=="))(), loadstring(base64decode("2KXYutmE2KfZgg=="))(), function() Lifecycle:DestroyAll() end)

-- ============================================================================
-- [09] BACKGROUND LOOPS, SEARCH & TELEMETRY
-- ============================================================================
Lifecycle:TrackConnection(LocalPlayer.Idled:Connect(function()
    if AntiAFKActive then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end))

Lifecycle:TrackConnection(UserInputService.InputBegan:Connect(function(inp, gp)
    if gp then return end
    if inp.KeyCode == Enum.KeyCode.RightControl then
        ToggleMainWindow(not WindowOpen)
    elseif ZoomKeyEnabled and inp.KeyCode == Enum.KeyCode.Z then
        VFXEngine:Tween(Camera, 0.22, {FieldOfView = 26})
    end
end))

Lifecycle:TrackConnection(UserInputService.InputEnded:Connect(function(inp)
    if ZoomKeyEnabled and inp.KeyCode == Enum.KeyCode.Z then
        VFXEngine:Tween(Camera, 0.22, {FieldOfView = BaseCameraFOV})
    end
end))

Lifecycle:TrackConnection(SearchBox:GetPropertyChangedSignal(loadstring(base64decode("VGV4dA=="))()):Connect(function()
    local q = string.lower(SearchBox.Text)
    if q == loadstring(base64decode(""))() then
        for _, item in ipairs(UI.AllCards) do item.card.Parent = item.page; item.card.Visible = true end
        for name, pData in pairs(UI.Pages) do pData.frame.Visible = (name == UI.ActiveTab) end
        return
    end
    for _, pData in pairs(UI.Pages) do pData.frame.Visible = false end
    local resPage = UI.Pages[T_DASH].frame
    resPage.Visible = true
    for _, item in ipairs(UI.AllCards) do
        if string.find(item.key, q, 1, true) then
            item.card.Parent = resPage
            item.card.Visible = true
        else
            item.card.Visible = false
        end
    end
end))

local frames, lastCheck = 0, os.clock()
Lifecycle:TrackConnection(RunService.RenderStepped:Connect(function()
    frames = frames + 1
    local now = os.clock()
    if now - lastCheck >= 1 then
        local ping, mem = 0, 0
        pcall(function() ping = math.floor(Stats.Network.ServerStatsItem[loadstring(base64decode("RGF0YSBQaW5n"))()]:GetValue()) end)
        pcall(function() mem = math.floor(Stats:GetTotalMemoryUsageMb()) end)
        local diff = math.floor(now - SessionStart)
        local m, s = math.floor(diff / 60), diff % 60
        local pCount = #Players:GetPlayers()
        local fpsCol = frames >= 55 and loadstring(base64decode("IzAwRUI5Ng=="))() or (frames >= 30 and loadstring(base64decode("I0ZGQzM0MQ=="))() or loadstring(base64decode("I0Y1NEI1Rg=="))())
        HudText.Text = string.format('FPS: <font color=loadstring(base64decode("JXM="))()>%d</font>  |  Ping: %dms  |  RAM: %dMB  |  Players: %d  |  %02d:%02d', fpsCol, frames, ping, mem, pCount, m, s)
        DashStatsBanner.Text = string.format(loadstring(base64decode("2KfZhNmB2LHZitmF2KfYqjogJWQgRlBTICB8ICDYp9mE2KjZhtisOiAlZCBtcyAgfCAg2KfZhNiw2KfZg9ix2Kk6ICVkIE1CICB8ICDYp9mE2YTYp9i52KjZitmGOiAlZC8lZA=="))(), frames, ping, mem, pCount, Players.MaxPlayers)
        frames = 0
        lastCheck = now
    end
end))

Notify(loadstring(base64decode("UzdMRSBVTFRSQSB2NC4w"))(), loadstring(base64decode("2KrZhSDYqtit2YXZitmEINin2YTZiNin2KzZh9ipINin2YTZhdit2K/Yq9ipINio2KfZhNmD2KfZhdmEIQ=="))(), 3.5, loadstring(base64decode("c3VjY2Vzcw=="))())
-- ============================================================================
-- [10] S7LE MATHEMATICAL & UTILITY HELPER LIBRARY
-- ============================================================================
local S7LE_Utils = {}

function S7LE_Utils.FormatTime(seconds)
    seconds = math.max(0, math.floor(seconds))
    local hrs = math.floor(seconds / 3600)
    local mins = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    if hrs > 0 then
        return string.format(loadstring(base64decode("JTAyZDolMDJkOiUwMmQ="))(), hrs, mins, secs)
    end
    return string.format(loadstring(base64decode("JTAyZDolMDJk"))(), mins, secs)
end

function S7LE_Utils.CountWorkspaceObjects()
    local parts, lights, particles, sounds = 0, 0, 0, 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then parts = parts + 1
        elseif obj:IsA(loadstring(base64decode("TGlnaHQ="))()) then lights = lights + 1
        elseif obj:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or obj:IsA(loadstring(base64decode("VHJhaWw="))()) then particles = particles + 1
        elseif obj:IsA(loadstring(base64decode("U291bmQ="))()) then sounds = sounds + 1 end
    end
    return {Parts = parts, Lights = lights, Particles = particles, Sounds = sounds}
end

UI:AddAction(T_DASH, loadstring(base64decode("2KXYrdi12KfYoSDYudmG2KfYtdixINin2YTZhdin2Kgg2KjYp9mE2KrZgdi12YrZhCAoV29ya3NwYWNlIFNjYW4p"))(), loadstring(base64decode("2K3Ys9in2Kgg2LnYr9ivINin2YTZhdis2LPZhdin2Kog2YjYp9mE2KXYttin2KHYp9iqINmI2KfZhNis2LLZitim2KfYqiDYqNin2YTZhdin2Kg="))(), loadstring(base64decode("2YHYrdi1INin2YTZhdin2Kg="))(), function()
    local data = S7LE_Utils.CountWorkspaceObjects()
    Notify(loadstring(base64decode("2YHYrdi1INin2YTZhdin2Kg="))(), string.format(loadstring(base64decode("2YXYrNiz2YXYp9iqOiAlZCB8INil2LbYp9ih2KfYqjogJWQgfCDYrNiy2YrYptin2Ko6ICVkIHwg2KPYtdmI2KfYqjogJWQ="))(), data.Parts, data.Lights, data.Particles, data.Sounds), 4, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddAction(T_DASH, loadstring(base64decode("2KrYtNiu2YrYtSDYp9mE2YbYuNin2YUg2YjYp9mE2KfYqti12KfZhCAoRGlhZ25vc3RpY3Mp"))(), loadstring(base64decode("2YHYrdi1INin2YTZgdix2YrZhdin2Kog2YjYp9mE2LDYp9mD2LHYqSDZiNio2YbYrCDYp9mE2LPZitix2YHYsSDYp9mE2K3Yp9mE2Yo="))(), loadstring(base64decode("2KrYtNiu2YrYtQ=="))(), function()
    local ping, mem = 0, 0
    pcall(function() ping = math.floor(Stats.Network.ServerStatsItem[loadstring(base64decode("RGF0YSBQaW5n"))()]:GetValue()) end)
    pcall(function() mem = math.floor(Stats:GetTotalMemoryUsageMb()) end)
    Notify(loadstring(base64decode("2KrZgtix2YrYsSDYp9mE2KrYtNiu2YrYtQ=="))(), string.format(loadstring(base64decode("2KfZhNio2YbYrDogJWQgbXMgfCDYp9iz2KrZh9mE2KfZgyDYp9mE2LDYp9mD2LHYqTogJWQgTUIgfCDYudmG2KfYtdixINin2YTZhdin2Kg6ICVk"))(), ping, mem, #workspace:GetDescendants()), 4, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

-- ============================================================================
-- [11] CINEMATIC CAMERA RIG & POST-PROCESSING FILTERS
-- ============================================================================
UI:AddSection(T_CAM, loadstring(base64decode("2YLZiNin2YTYqCDYp9mE2YPYp9mF2YrYsdinINmI2KfZhNmB2YTYp9iq2LEg2KfZhNiz2YrZhtmF2KfYptmK2Kk="))())

UI:AddDropdown(T_CAM, loadstring(base64decode("2YLYp9mE2Kgg2LLYp9mI2YrYqSDYp9mE2LHYpNmK2KkgKEZPViBQcmVzZXRzKQ=="))(), {
    loadstring(base64decode("2KfZgdiq2LHYp9i22YogKDcwwrAgRGVmYXVsdCk="))(),
    loadstring(base64decode("2YjYp9iz2Lkg2KrZhtin2YHYs9mKICg5MMKwIFBybyk="))(),
    loadstring(base64decode("2LnYsdmK2LYg2KzYr9in2YsgKDExMMKwIFVsdHJhIFdpZGUp"))(),
    loadstring(base64decode("2LLZiNmFINiq2LXZiNmK2LHZiiAoNTDCsCBDaW5lbWF0aWMp"))()
}, loadstring(base64decode("2KfZgdiq2LHYp9i22YogKDcwwrAgRGVmYXVsdCk="))(), function(preset)
    local targetFov = 70
    if preset == loadstring(base64decode("2YjYp9iz2Lkg2KrZhtin2YHYs9mKICg5MMKwIFBybyk="))() then targetFov = 90
    elseif preset == loadstring(base64decode("2LnYsdmK2LYg2KzYr9in2YsgKDExMMKwIFVsdHJhIFdpZGUp"))() then targetFov = 110
    elseif preset == loadstring(base64decode("2LLZiNmFINiq2LXZiNmK2LHZiiAoNTDCsCBDaW5lbWF0aWMp"))() then targetFov = 50 end
    BaseCameraFOV = targetFov
    VFXEngine:Tween(Camera, 0.35, {FieldOfView = targetFov}, Enum.EasingStyle.Quint)
    Notify(loadstring(base64decode("2KfZhNmD2KfZhdmK2LHYpw=="))(), loadstring(base64decode("2KrZhSDYttio2Lcg2LLYp9mI2YrYqSDYp9mE2LHYpNmK2Kkg2KXZhNmJIA=="))() .. targetFov .. loadstring(base64decode("wrA="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddDropdown(T_GFX, loadstring(base64decode("2YHZhNiq2LEg2KfZhNij2YTZiNin2YYg2KfZhNiz2YrZhtmF2KfYptmKIChDb2xvciBHcmFkaW5nKQ=="))(), {
    loadstring(base64decode("2KjYr9mI2YYg2YHZhNiq2LEgKE5vbmUp"))(),
    loadstring(base64decode("2LPZitmG2YXYp9im2Yog2KjYp9ix2K8gKENvb2wgQ2luZW1hKQ=="))(),
    loadstring(base64decode("2K/Yp9mB2KYg2LDZh9io2YogKFdhcm0gR29sZCk="))(),
    loadstring(base64decode("2KrYqNin2YrZhiDYudin2YTZiiAoSGlnaCBDb250cmFzdCk="))(),
    loadstring(base64decode("2KPYqNmK2LYg2YjYo9iz2YjYryAoTm9pciBCJlcp"))()
}, loadstring(base64decode("2KjYr9mI2YYg2YHZhNiq2LEgKE5vbmUp"))(), function(filterName)
    local existing = Lighting:FindFirstChild(loadstring(base64decode("UzdMRV9Db2xvckZpbHRlcg=="))())
    if existing then existing:Destroy() end
    if filterName == loadstring(base64decode("2KjYr9mI2YYg2YHZhNiq2LEgKE5vbmUp"))() then
        Notify(loadstring(base64decode("2KfZhNmB2YTYp9iq2LE="))(), loadstring(base64decode("2KrZhdiqINil2LLYp9mE2Kkg2YHZhNiq2LEg2KfZhNi02KfYtNip"))())
        return
    end
    local cc = Instance.new(loadstring(base64decode("Q29sb3JDb3JyZWN0aW9uRWZmZWN0"))())
    cc.Name = loadstring(base64decode("UzdMRV9Db2xvckZpbHRlcg=="))()
    cc.Parent = Lighting
    if filterName == loadstring(base64decode("2LPZitmG2YXYp9im2Yog2KjYp9ix2K8gKENvb2wgQ2luZW1hKQ=="))() then
        cc.TintColor = Color3.fromRGB(220, 240, 255)
        cc.Contrast, cc.Saturation = 0.12, 0.15
    elseif filterName == loadstring(base64decode("2K/Yp9mB2KYg2LDZh9io2YogKFdhcm0gR29sZCk="))() then
        cc.TintColor = Color3.fromRGB(255, 240, 215)
        cc.Contrast, cc.Saturation = 0.1, 0.2
    elseif filterName == loadstring(base64decode("2KrYqNin2YrZhiDYudin2YTZiiAoSGlnaCBDb250cmFzdCk="))() then
        cc.Contrast, cc.Saturation = 0.28, 0.22
    elseif filterName == loadstring(base64decode("2KPYqNmK2LYg2YjYo9iz2YjYryAoTm9pciBCJlcp"))() then
        cc.Saturation, cc.Contrast = -1, 0.2
    end
    Notify(loadstring(base64decode("2KfZhNmB2YTYp9iq2LE="))(), loadstring(base64decode("2KrZhSDYqti32KjZitmCINmB2YTYqtixOiA="))() .. filterName, 2.5, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddToggle(T_GFX, loadstring(base64decode("2KXYtNix2KfZgtipINin2YTYtNmF2LMgKFN1blJheXMgRWZmZWN0KQ=="))(), loadstring(base64decode("2KXYttin2YHYqSDYo9i02LnYqSDYtNmF2LMg2YjYp9mC2LnZitipINmB2Yog2KfZhNiz2YXYp9ih"))(), false, function(on)
    local rays = Lighting:FindFirstChild(loadstring(base64decode("UzdMRV9TdW5SYXlz"))())
    if on and not rays then
        rays = Instance.new(loadstring(base64decode("U3VuUmF5c0VmZmVjdA=="))(), Lighting)
        rays.Name = loadstring(base64decode("UzdMRV9TdW5SYXlz"))()
        rays.Intensity = 0.15
    elseif not on and rays then rays:Destroy() end
    Notify(loadstring(base64decode("2KPYtNi52Kkg2KfZhNi02YXYsw=="))(), on and loadstring(base64decode("2KrZhSDYqtmB2LnZitmEINij2LTYudipINin2YTYtNmF2LM="))() or loadstring(base64decode("2KrZhSDYpdmK2YLYp9mBINij2LTYudipINin2YTYtNmF2LM="))())
end)

-- ============================================================================
-- [12] QUICK KEYBINDS MANAGER
-- ============================================================================
UI:AddSection(T_SET, loadstring(base64decode("2KfYrtiq2LXYp9ix2KfYqiDZhNmI2K3YqSDYp9mE2YXZgdin2KrZititINin2YTYs9ix2YrYudip"))())

UI:AddKeybind(T_SET, loadstring(base64decode("2KfYrtiq2LXYp9ixINio2YjYs9iqINin2YTZgdix2YrZhdin2Kog2KfZhNiz2LHZiti5"))(), loadstring(base64decode("2KfYtti62Lcg2KfZhNiy2LEg2YTYqtmB2LnZitmEINio2YjYs9iqINin2YTZgdix2YrZhdin2Kog2YHZiiDYo9mKINmI2YLYqg=="))(), Enum.KeyCode.F6, function()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    collectgarbage(loadstring(base64decode("Y29sbGVjdA=="))())
    Notify(loadstring(base64decode("2KfYrtiq2LXYp9ixINiz2LHZiti5"))(), loadstring(base64decode("2KrZhSDYqtmB2LnZitmEINio2YjYs9iqINin2YTZgdix2YrZhdin2Kog2KfZhNiz2LHZiti5IQ=="))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddKeybind(T_SET, loadstring(base64decode("2KfYrtiq2LXYp9ixINil2LXZhNin2K0g2KfZhNmD2KfZhdmK2LHYpw=="))(), loadstring(base64decode("2KfYtti62Lcg2KfZhNiy2LEg2YTYpdi52KfYr9ipINi22KjYtyDYp9mE2YPYp9mF2YrYsdinINmB2YjYsdin2Ys="))(), Enum.KeyCode.F7, function()
    Camera.CameraType = Enum.CameraType.Custom
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    end
    Notify(loadstring(base64decode("2KfYrtiq2LXYp9ixINiz2LHZiti5"))(), loadstring(base64decode("2KrZhSDYpdi12YTYp9itINin2YTZg9in2YXZitix2Kch"))(), 2, loadstring(base64decode("c3VjY2Vzcw=="))())
end)

UI:AddKeybind(T_SET, loadstring(base64decode("2KfYrtiq2LXYp9ixINil2K7Zgdin2KEv2KXYuNmH2KfYsSDYp9mE2YjYp9is2YfYqQ=="))(), loadstring(base64decode("2LLYsSDYs9ix2YrYuSDZhNmB2KrYrSDZiNil2LrZhNin2YIg2YLYp9im2YXYqSBTN0xF"))(), Enum.KeyCode.Insert, function()
    ToggleMainWindow(not WindowOpen)
end)

print(loadstring(base64decode("W1M3TEUgVUxUUkEgdjQuMF0gQWxsIG1vZHVsZXMgYW5kIGV4dGVuc2lvbnMgbG9hZGVkIHN1Y2Nlc3NmdWxseS4gUmlnaHRzOiBzN2xl"))())
end
oHwjhOXG(WJ7pO)
end)(...)