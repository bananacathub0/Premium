
--================================================
--             BANANA CAT HUB V3
--             KEY SYSTEM
--================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local Player = Players.LocalPlayer

--============== CONFIGURATION ===================

local HUB_NAME = "BANANA CAT HUB"
local CORRECT_KEY = "BANANACAT2026"

local KEY_LINK = "https://your-getkey-link.com"

local LOGO_ID = "rbxassetid://97143223594948"

--============== COLORS ==========================

local BLACK = Color3.fromRGB(8,8,8)
local DARK = Color3.fromRGB(30,30,30)
local YELLOW = Color3.fromRGB(255,210,0)
local WHITE = Color3.fromRGB(255,255,255)
local GRAY = Color3.fromRGB(150,150,150)

--============== SCREEN GUI ======================

local Gui = Instance.new("ScreenGui")
Gui.Name = "BananaCatHub"
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 999
Gui.Parent = Player:WaitForChild("PlayerGui")

--============== MAIN FRAME ======================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(700,370)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.Position = UDim2.fromScale(0.5,0.5)
Main.BackgroundColor3 = BLACK
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,28)
Corner.Parent = Main

local Border = Instance.new("UIStroke")
Border.Color = YELLOW
Border.Thickness = 3
Border.Parent = Main

--============== RESPONSIVE ======================

local UIScale = Instance.new("UIScale")
UIScale.Parent = Main

local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end

    local size = camera.ViewportSize

    UIScale.Scale = math.min(
        size.X / 760,
        size.Y / 430,
        1
    )
end

UpdateScale()

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(UpdateScale)

if workspace.CurrentCamera then
    workspace.CurrentCamera:GetPropertyChangedSignal(
        "ViewportSize"
    ):Connect(UpdateScale)
end

--============== GLOW EFFECT =====================

local Glow = Instance.new("UIStroke")
Glow.Color = YELLOW
Glow.Thickness = 6
Glow.Transparency = 0.55
Glow.Parent = Main

--============== DECORATION ======================

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1,0,0,4)
TopLine.BackgroundColor3 = YELLOW
TopLine.BorderSizePixel = 0
TopLine.Parent = Main

--============== LOGO ============================

local Logo = Instance.new("ImageLabel")
Logo.Name = "BananaCatLogo"
Logo.Size = UDim2.fromOffset(220,260)
Logo.Position = UDim2.new(0,30,0.5,0)
Logo.AnchorPoint = Vector2.new(0,0.5)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_ID
Logo.ScaleType = Enum.ScaleType.Fit
Logo.Parent = Main

--============== TITLE ===========================

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(440,65)
Title.Position = UDim2.fromOffset(250,65)
Title.BackgroundTransparency = 1
Title.Text = HUB_NAME
Title.TextColor3 = YELLOW
Title.TextSize = 35
Title.Font = Enum.Font.GothamBlack
Title.Parent = Main

--============== CLOSE BUTTON ====================

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(45,45)
Close.Position = UDim2.new(1,-60,0,15)
Close.BackgroundColor3 = BLACK
Close.Text = "X"
Close.TextColor3 = YELLOW
Close.TextSize = 25
Close.Font = Enum.Font.GothamBlack
Close.Parent = Main

Instance.new("UICorner",Close).CornerRadius =
    UDim.new(0,12)

local CloseBorder = Instance.new("UIStroke")
CloseBorder.Color = YELLOW
CloseBorder.Thickness = 2
CloseBorder.Parent = Close

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

--============== KEY INPUT =======================

local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyInput"
KeyBox.Size = UDim2.fromOffset(420,60)
KeyBox.Position = UDim2.fromOffset(260,145)
KeyBox.BackgroundColor3 = DARK
KeyBox.PlaceholderText = "Enter Your Key..."
KeyBox.PlaceholderColor3 = GRAY
KeyBox.Text = ""
KeyBox.TextColor3 = WHITE
KeyBox.TextSize = 20
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

Instance.new("UICorner",KeyBox).CornerRadius =
    UDim.new(0,17)

local InputBorder = Instance.new("UIStroke")
InputBorder.Color = Color3.fromRGB(100,100,100)
InputBorder.Thickness = 2
InputBorder.Parent = KeyBox

--============== STATUS ==========================

local Status = Instance.new("TextLabel")
Status.Size = UDim2.fromOffset(420,28)
Status.Position = UDim2.fromOffset(260,210)
Status.BackgroundTransparency = 1
Status.Text = "Welcome to Banana Cat Hub"
Status.TextColor3 = GRAY
Status.TextSize = 15
Status.Font = Enum.Font.Gotham
Status.Parent = Main

--============== BUTTON FUNCTION =================

local function CreateButton(name,text,x,color,textColor)

    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.fromOffset(190,55)
    Button.Position = UDim2.fromOffset(x,270)
    Button.BackgroundColor3 = color
    Button.Text = text
    Button.TextColor3 = textColor
    Button.TextSize = 19
    Button.Font = Enum.Font.GothamBlack
    Button.AutoButtonColor = false
    Button.Parent = Main

    Instance.new("UICorner",Button).CornerRadius =
        UDim.new(0,16)

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = YELLOW
    Stroke.Thickness = 1.5
    Stroke.Transparency = 0.2
    Stroke.Parent = Button

    Button.MouseEnter:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.2),
            {BackgroundColor3 = YELLOW}
        ):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.2),
            {BackgroundColor3 = color}
        ):Play()
    end)

    return Button
end

--============== GET KEY =========================

local GetKey = CreateButton(
    "GetKey",
    "GET KEY",
    255,
    Color3.fromRGB(45,45,45),
    WHITE
)

--============== CHECK KEY =======================

local CheckKey = CreateButton(
    "CheckKey",
    "CHECK KEY",
    475,
    YELLOW,
    BLACK
)

--============== GET KEY ACTION ==================

GetKey.MouseButton1Click:Connect(function()

    if KEY_LINK == "" then
        Status.Text = "GET KEY LINK NOT SET!"
        Status.TextColor3 = Color3.fromRGB(255,70,70)
        return
    end

    local success = pcall(function()
        GuiService:OpenBrowserWindow(KEY_LINK)
    end)

    if success then
        Status.Text = "Opening Get Key..."
    else
        Status.Text = "Unable to open link. Check KEY_LINK."
    end

    Status.TextColor3 = YELLOW
end)

--============== SUCCESS HUB =====================

local function OpenHub()

    local Hub = Instance.new("Frame")
    Hub.Name = "HubContent"
    Hub.Size = UDim2.fromScale(1,1)
    Hub.BackgroundColor3 = BLACK
    Hub.BorderSizePixel = 0
    Hub.Parent = Main

    local HubTitle = Instance.new("TextLabel")
    HubTitle.Size = UDim2.new(1,0,0,80)
    HubTitle.Position = UDim2.fromOffset(0,100)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = "BANANA CAT HUB"
    HubTitle.TextColor3 = YELLOW
    HubTitle.TextSize = 35
    HubTitle.Font = Enum.Font.GothamBlack
    HubTitle.Parent = Hub

    local Welcome = Instance.new("TextLabel")
    Welcome.Size = UDim2.new(1,0,0,50)
    Welcome.Position = UDim2.fromOffset(0,190)
    Welcome.BackgroundTransparency = 1
    Welcome.Text = "KEY VERIFIED - WELCOME!"
    Welcome.TextColor3 = WHITE
    Welcome.TextSize = 20
    Welcome.Font = Enum.Font.GothamBold
    Welcome.Parent = Hub

    print("BANANA CAT HUB UNLOCKED!")
end

--============== CHECK KEY ACTION ================

local unlocked = false

CheckKey.MouseButton1Click:Connect(function()

    if unlocked then return end

    if KeyBox.Text == CORRECT_KEY then

        unlocked = true

        Status.Text = "KEY VERIFIED SUCCESSFULLY!"
        Status.TextColor3 = Color3.fromRGB(0,255,100)

        task.wait(0.5)

        OpenHub()

    else

        Status.Text = "INVALID KEY! TRY AGAIN"
        Status.TextColor3 = Color3.fromRGB(255,60,60)

        TweenService:Create(
            KeyBox,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(75,20,20)}
        ):Play()

        task.wait(0.3)

        TweenService:Create(
            KeyBox,
            TweenInfo.new(0.15),
            {BackgroundColor3 = DARK}
        ):Play()

        KeyBox.Text = ""
    end
end)

--============== DRAG GUI ========================

local dragging = false
local dragStart
local startPosition

local DragArea = Instance.new("Frame")
DragArea.Size = UDim2.new(1,-120,0,45)
DragArea.BackgroundTransparency = 1
DragArea.Parent = Main

DragArea.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)

    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false
    end
end)

--============== OPEN ANIMATION ==================

Main.Size = UDim2.fromOffset(0,0)

TweenService:Create(
    Main,
    TweenInfo.new(
        0.65,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {Size = UDim2.fromOffset(700,370)}
):Play()

print("BANANA CAT HUB V3 LOADED!")