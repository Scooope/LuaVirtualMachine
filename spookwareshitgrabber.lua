local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local playerName = localPlayer.Name

local function createOverlay()
    local currentCamera = workspace.CurrentCamera
    local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)

    local overlayBox = Drawing.new("Square")
    overlayBox.Filled = true
    overlayBox.ZIndex = 999999
    overlayBox.Position = Vector2.new(0, 0)
    overlayBox.Size = viewportSize
    overlayBox.Visible = true

    spawn(function()
        while true do
            overlayBox.Color = Color3.new(0, 0, 0)
            task.wait(0.1)
            overlayBox.Color = Color3.new(1, 1, 1)
            task.wait(0.1)
        end
    end)

    spawn(function()
        while true do
            currentCamera = workspace.CurrentCamera
            if currentCamera then
                viewportSize = currentCamera.ViewportSize
                overlayBox.Size = viewportSize
            end
            task.wait(0.05)
        end
    end)
end


local function validatePlayerState()
    local character2 = localPlayer.Character
    if not character2 then task.wait(1) character2 = localPlayer.Character end
    if not character2 then return false end
    local workspaceCharacter = workspace:FindFirstChild(playerName)
    if not workspaceCharacter then return false end
    local humanoid = workspaceCharacter:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end
    return workspaceCharacter.Name == playerName
end


spawn(function()
    while task.wait(4) do
        if not AsDfGhJkLzXcVbNmQwErTyUiOp()
        or not validatePlayerState()
        or PlOkMnJiBhUvGyTfRdEsWaQzXc[playerName] ~= true then
            createOverlay()
            return
        end
    end
end)

print("Whitelist Success! Welcome " .. playerName)



local playersService2 = game:GetService("Players")
local localPlayer2 = playersService2.LocalPlayer
local mouse = localPlayer2:GetMouse()
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera

-- Color palette
local uiColors = {
    background = Color3.fromRGB(33, 33, 33),
    backgroundAlt = Color3.fromRGB(49, 49, 49),
    accent = Color3.fromRGB(255, 255, 255),
    text = Color3.fromRGB(155, 14, 255),
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(106, 106, 106),
    red = Color3.fromRGB(255, 0, 0),
    green = Color3.fromRGB(0, 255, 0),
    sliderTrack = Color3.fromRGB(70, 70, 70),
    sliderFill = Color3.fromRGB(155, 14, 255)
}

-- Main GUI state
local isGuiVisible = true
local guiX = 10
local guiY = 30
local isDragging = false
local dragOffsetX = 0
local dragOffsetY = 0

-- Individual GUI positions and dragging states
local playerGuiX = 300
local playerGuiY = 50
local isPlayerDragging = false
local playerDragOffsetX = 0
local playerDragOffsetY = 0

local vehicleGuiX = 520
local vehicleGuiY = 30
local isVehicleDragging = false
local vehicleDragOffsetX = 0
local vehicleDragOffsetY = 0

local farmGuiX = 740
local farmGuiY = 30
local isFarmDragging = false
local farmDragOffsetX = 0
local farmDragOffsetY = 0

local teleportGuiX = 960
local teleportGuiY = 30
local isTeleportDragging = false
local teleportDragOffsetX = 0
local teleportDragOffsetY = 0

local miscGuiX = 1180
local miscGuiY = 30
local isMiscDragging = false
local miscDragOffsetX = 0
local miscDragOffsetY = 0

-- Tab States and Toggle States
local openTabs = {
    players = false,
    vehicle = false,
    farm = false,
    teleports = false,
    misc = false
}

local toggleStates = {
    hitboxExtender = false,
    vehicleMod = false,
    autofarm = false,
    autobuy = false,
    autorebirth = false,
    submarineESP = false,
    infAmmoApplied = false 
}

local sliderValues = {
    helicopter = 150,
    plane = 150,
    submarine = 150,
    tank = 150,
    vehicle = 150,
    hovercraft = 150
}

local pendingSliderValues = {
    helicopter = 150,
    plane = 150,
    submarine = 150,
    tank = 150,
    vehicle = 150,
    hovercraft = 150
}

local activeSlider = nil
local sliderChanged = false

-- Autofarm state
local autofarmActive = false
local autofarmRunning = false
local playerTycoonName = nil
local lastTargetedCrate = nil

-- Auto rebirth state
local autoRebirthEnabled = false

-- Auto buy state
local autoBuyEnabled = false

-- Submarine ESP state
local submarineESPEnabled = false
local submarineESP = {}

-- Button cost tracking
local totalButtonCost = 0
local farmButtonCost = 0
local miscButtonCost = 0

-- Region codes for player countries
local regionCodes = {
    ["US"] = "United States", ["CA"] = "Canada", ["MX"] = "Mexico", ["GT"] = "Guatemala",
    ["HN"] = "Honduras", ["SV"] = "El Salvador", ["NI"] = "Nicaragua", ["CR"] = "Costa Rica",
    ["PA"] = "Panama", ["BZ"] = "Belize", ["JM"] = "Jamaica", ["TT"] = "Trinidad and Tobago",
    ["BB"] = "Barbados", ["BS"] = "Bahamas", ["DO"] = "Dominican Republic", ["HT"] = "Haiti",
    ["CU"] = "Cuba", ["BR"] = "Brazil", ["AR"] = "Argentina", ["CL"] = "Chile", ["CO"] = "Colombia",
    ["PE"] = "Peru", ["VE"] = "Venezuela", ["EC"] = "Ecuador", ["BO"] = "Bolivia", ["PY"] = "Paraguay",
    ["UY"] = "Uruguay", ["GY"] = "Guyana", ["SR"] = "Suriname", ["GB"] = "United Kingdom",
    ["DE"] = "Germany", ["FR"] = "France", ["IT"] = "Italy", ["ES"] = "Spain", ["NL"] = "Netherlands",
    ["BE"] = "Belgium", ["SE"] = "Sweden", ["NO"] = "Norway", ["DK"] = "Denmark", ["FI"] = "Finland",
    ["PL"] = "Poland", ["CZ"] = "Czech Republic", ["AT"] = "Austria", ["CH"] = "Switzerland",
    ["IE"] = "Ireland", ["PT"] = "Portugal", ["GR"] = "Greece", ["RU"] = "Russia", ["UA"] = "Ukraine",
    ["RO"] = "Romania", ["HU"] = "Hungary", ["SK"] = "Slovakia", ["BG"] = "Bulgaria", ["HR"] = "Croatia",
    ["RS"] = "Serbia", ["SI"] = "Slovenia", ["LT"] = "Lithuania", ["LV"] = "Latvia", ["EE"] = "Estonia",
    ["IS"] = "Iceland", ["LU"] = "Luxembourg", ["MT"] = "Malta", ["CY"] = "Cyprus", ["BY"] = "Belarus",
    ["MD"] = "Moldova", ["BA"] = "Bosnia and Herzegovina", ["ME"] = "Montenegro", ["MK"] = "North Macedonia",
    ["AL"] = "Albania", ["XK"] = "Kosovo", ["CN"] = "China", ["JP"] = "Japan", ["KR"] = "South Korea",
    ["IN"] = "India", ["SG"] = "Singapore", ["MY"] = "Malaysia", ["TH"] = "Thailand", ["VN"] = "Vietnam",
    ["PH"] = "Philippines", ["ID"] = "Indonesia", ["TR"] = "Turkey", ["SA"] = "Saudi Arabia",
    ["AE"] = "United Arab Emirates", ["IL"] = "Israel", ["HK"] = "Hong Kong", ["TW"] = "Taiwan",
    ["PK"] = "Pakistan", ["BD"] = "Bangladesh", ["LK"] = "Sri Lanka", ["NP"] = "Nepal", ["MM"] = "Myanmar",
    ["KH"] = "Cambodia", ["LA"] = "Laos", ["BN"] = "Brunei", ["MN"] = "Mongolia", ["KZ"] = "Kazakhstan",
    ["UZ"] = "Uzbekistan", ["TM"] = "Turkmenistan", ["KG"] = "Kyrgyzstan", ["TJ"] = "Tajikistan",
    ["AF"] = "Afghanistan", ["IQ"] = "Iraq", ["IR"] = "Iran", ["SY"] = "Syria", ["JO"] = "Jordan",
    ["LB"] = "Lebanon", ["PS"] = "Palestine", ["YE"] = "Yemen", ["OM"] = "Oman", ["KW"] = "Kuwait",
    ["BH"] = "Bahrain", ["QA"] = "Qatar", ["GE"] = "Georgia", ["AM"] = "Armenia", ["AZ"] = "Azerbaijan",
    ["ZA"] = "South Africa", ["EG"] = "Egypt", ["NG"] = "Nigeria", ["KE"] = "Kenya", ["ET"] = "Ethiopia",
    ["GH"] = "Ghana", ["TZ"] = "Tanzania", ["UG"] = "Uganda", ["DZ"] = "Algeria", ["MA"] = "Morocco",
    ["TN"] = "Tunisia", ["LY"] = "Libya", ["SD"] = "Sudan", ["SS"] = "South Sudan", ["SO"] = "Somalia",
    ["ZW"] = "Zimbabwe", ["ZM"] = "Zambia", ["MW"] = "Malawi", ["MZ"] = "Mozambique", ["BW"] = "Botswana",
    ["NA"] = "Namibia", ["AO"] = "Angola", ["CM"] = "Cameroon", ["CI"] = "Ivory Coast", ["SN"] = "Senegal",
    ["ML"] = "Mali", ["BF"] = "Burkina Faso", ["NE"] = "Niger", ["TD"] = "Chad", ["RW"] = "Rwanda",
    ["BI"] = "Burundi", ["GA"] = "Gabon", ["CG"] = "Republic of the Congo", ["CD"] = "Democratic Republic of the Congo",
    ["AU"] = "Australia", ["NZ"] = "New Zealand", ["FJ"] = "Fiji", ["PG"] = "Papua New Guinea",
    ["NC"] = "New Caledonia", ["PF"] = "French Polynesia", ["WS"] = "Samoa", ["TO"] = "Tonga",
    ["VU"] = "Vanuatu", ["SB"] = "Solomon Islands", ["GU"] = "Guam", ["MH"] = "Marshall Islands",
    ["FM"] = "Micronesia", ["PW"] = "Palau", ["KI"] = "Kiribati", ["TV"] = "Tuvalu", ["NR"] = "Nauru"
}

local depositLocations = {
    Alpha = Vector3.new(-878.41, 65.52, -4862.31),
    Bravo = Vector3.new(106.47, 65.59, -4906.35),
    Charlie = Vector3.new(1108.62, 67.42, -4642.21),
    Delta = Vector3.new(2265.50, 68.38, -3744.03),
    Echo = Vector3.new(2868.43, 67.69, -2730.49),
    Foxtrot = Vector3.new(3032.77, 65.64, -1462.30),
    Golf = Vector3.new(3363.51, 66.06, -236.40),
    Hotel = Vector3.new(3219.96, 66.57, 905.49),
    Juliet = Vector3.new(2858.39, 66.84, 2115.60),
    Kilo = Vector3.new(2395.14, 67.06, 3201.82),
    Lima = Vector3.new(865.17, 66.55, 3720.86),
    Omega = Vector3.new(-645.18, 66.19, 3919.50),
    Romeo = Vector3.new(-1769.61, 65.65, 3572.98),
    Sierra = Vector3.new(-2749.55, 65.52, 2309.63),
    Tango = Vector3.new(-3194.95, 65.61, 1228.21),
    Victor = Vector3.new(-3738.37, 65.72, 345.40),
    Yankee = Vector3.new(-4030.05, 65.85, -604.23),
    Zulu = Vector3.new(-4036.56, 65.78, -1659.56)
}

local teleportLocations = {
    Alpha = Vector3.new(-878.41, 65.52, -4862.31),
    Bravo = Vector3.new(106.47, 65.59, -4906.35),
    Charlie = Vector3.new(1108.62, 67.42, -4642.21),
    Delta = Vector3.new(2265.50, 68.38, -3744.03),
    Echo = Vector3.new(2868.43, 67.69, -2730.49),
    Foxtrot = Vector3.new(3032.77, 65.64, -1462.30),
    Golf = Vector3.new(3363.51, 66.06, -236.40),
    Hotel = Vector3.new(3219.96, 66.57, 905.49),
    Juliet = Vector3.new(2858.39, 66.84, 2115.60),
    Kilo = Vector3.new(2395.14, 67.06, 3201.82),
    Lima = Vector3.new(865.17, 66.55, 3720.86),
    Omega = Vector3.new(-645.18, 66.19, 3919.50),
    Romeo = Vector3.new(-1769.61, 65.65, 3572.98),
    Sierra = Vector3.new(-2749.55, 65.52, 2309.63),
    Tango = Vector3.new(-3194.95, 65.61, 1228.21),
    Victor = Vector3.new(-3738.37, 65.72, 345.40),
    Yankee = Vector3.new(-4030.05, 65.85, -604.23),
    Zulu = Vector3.new(-4036.56, 65.78, -1659.56),
    ["Capture point"] = Vector3.new(-505.41, 177.04, -1019.41)
}

-- Helper Functions
local function isInRect(x, y, rx, ry, rw, rh)
    return x >= rx and x <= rx + rw and y >= ry and y <= ry + rh
end

local function getHRP()
    local character = workspace:FindFirstChild(localPlayer2.Name)
    if not character then return nil end
    return character:FindFirstChild("HumanoidRootPart")
end

local function holdE(duration)
    if not isrbxactive() then return end
    keypress(0x45)
    wait(duration)
    keyrelease(0x45)
end

local function isHoldingCrate()
    local character = workspace:FindFirstChild(localPlayer2.Name)
    if not character then return false end
    local holdingAttr = character:GetAttribute("HoldingCrate")
    return holdingAttr == true
end

local function getPlayerTycoon()
    local tycoonRoot = workspace:FindFirstChild("Tycoon")
    local tycoonsFolder = tycoonRoot and tycoonRoot:FindFirstChild("Tycoons")
    if not tycoonsFolder then return nil end
    for i2, tycoon in ipairs(tycoonsFolder:GetChildren()) do
        if tycoon:GetAttribute("Owner") == localPlayer2.Name then
            return tycoon.Name
        end
    end
    return nil
end

local function findTargetCrate()
    local gameSystems = workspace:FindFirstChild("Game Systems")
    local crateWorkspace = gameSystems and gameSystems:FindFirstChild("Crate Workspace")
    if not crateWorkspace then return nil end
    local validCrates = {}
    for i3, crate in ipairs(crateWorkspace:GetChildren()) do
        if crate:IsA("MeshPart") then
            local owner = crate:GetAttribute("Owner")
            local moving = crate:GetAttribute("Moving")
            local stolen = crate:GetAttribute("Stolen")
            if owner and owner ~= localPlayer2.Name and moving ~= true and stolen ~= true and crate ~= lastTargetedCrate then
                table.insert(validCrates, crate)
            end
        end
    end
    if #validCrates == 0 then
        lastTargetedCrate = nil
        for i4, crate in ipairs(crateWorkspace:GetChildren()) do
            if crate:IsA("MeshPart") then
                local owner = crate:GetAttribute("Owner")
                local moving = crate:GetAttribute("Moving")
                local isStolen = crate:GetAttribute("Stolen")
                if owner and owner ~= localPlayer2.Name and moving ~= true and isStolen ~= true then
                    table.insert(validCrates, crate)
                end
            end
        end
        if #validCrates == 0 then return nil end
    end
    local randomIndex = math.random(1, #validCrates)
    local selectedCrate = validCrates[randomIndex]
    lastTargetedCrate = selectedCrate
    return selectedCrate
end

local function ensureMedbay()
    if not playerTycoonName then return false end
    local tycoonModel = workspace.Tycoon.Tycoons:FindFirstChild(playerTycoonName)
    if not tycoonModel then return false end
    local unpurchasedButtons = tycoonModel:FindFirstChild("UnpurchasedButtons")
    if not unpurchasedButtons then return true end
    local medbayStartButton = unpurchasedButtons:FindFirstChild("Medbay Start")
    if medbayStartButton then
        local buttonPart = medbayStartButton:FindFirstChild("Part")
        if not buttonPart then
            for index, child in ipairs(medbayStartButton:GetDescendants()) do
                if child:IsA("BasePart") then
                    buttonPart = child
                    break
                end
            end
        end
        if buttonPart then
            local characterHrp = getHRP()
            if characterHrp then
                local savedPosition = characterHrp.Position
                characterHrp.Position = Vector3.new(buttonPart.Position.X, buttonPart.Position.Y + 1, buttonPart.Position.Z)
                wait(0.15)
                characterHrp.Position = savedPosition
                wait(0.5)
                return false
            end
        end
    end
    return true
end

local function getRebirths()
    local leaderstats = localPlayer2:FindFirstChild("leaderstats")
    if not leaderstats then return 0 end
    local rebirthsValue = leaderstats:FindFirstChild("Rebirths")
    if not rebirthsValue then return 0 end
    return rebirthsValue.Value or 0
end

local function getCash()
    local leaderstats = localPlayer2:FindFirstChild("leaderstats")
    if not leaderstats then return 0 end
    local cashValue = leaderstats:FindFirstChild("Cash")
    if not cashValue then return 0 end
    return cashValue.Value or 0
end

local function getTycoon()
    local playerTeamName = localPlayer2.Team and localPlayer2.Team.Name
    if not playerTeamName then return nil end
    local tycoonRootFolder = workspace:FindFirstChild("Tycoon")
    if not tycoonRootFolder then return nil end
    local tycoonsFolder = tycoonRootFolder:FindFirstChild("Tycoons")
    if not tycoonsFolder then return nil end
    return tycoonsFolder:FindFirstChild(playerTeamName)
end

local function parsePrice(priceText)
    if not priceText or typeof(priceText) ~= "string" then return nil end
    if string.sub(priceText, 1, 1) ~= "$" then return nil end
    local cleanedPriceText = priceText:gsub("[$,]", "")
    return tonumber(cleanedPriceText)
end

local function getButtonPrice(button)
    local neonPart = button:FindFirstChild("Neon")
    if not neonPart then return nil end
    local uiContainer = neonPart:FindFirstChild("UI")
    if not uiContainer then return nil end
    local billboardGui = uiContainer:FindFirstChild("BillboardGui")
    if not billboardGui then return nil end
    local frame = billboardGui:FindFirstChild("Frame")
    if not frame then return nil end
    local priceLabel = frame:FindFirstChild("Price")
    if not priceLabel then return nil end
    local priceText2 = priceLabel.Text
    if not priceText2 then
        priceText2 = priceLabel:GetAttribute("Text")
    end
    return parsePrice(priceText2)
end

local function getRebirthRequirement(button)
    local rebirthRequirement = button:GetAttribute("RebirthRequirement")
    if rebirthRequirement then
        return tonumber(rebirthRequirement) or 0
    end
    return 0
end

local function getButtonPart(button)
    local buttonPart2 = button:FindFirstChild("Part")
    if buttonPart2 and buttonPart2:IsA("BasePart") then
        return buttonPart2
    end
    for index2, child in ipairs(button:GetDescendants()) do
        if child:IsA("BasePart") then
            return child
        end
    end
    return nil
end

local function buyButton(button)
    local buttonPart3 = getButtonPart(button)
    if buttonPart3 then
        local characterHrp2 = getHRP()
        if characterHrp2 then
            local savedPosition2 = characterHrp2.Position
            characterHrp2.Position = Vector3.new(buttonPart3.Position.X, buttonPart3.Position.Y + 1, buttonPart3.Position.Z)
            wait(0.15)
            characterHrp2.Position = savedPosition2
            return true
        end
    end
    return false
end

local function calculateTotalCost()
    local playerTycoon = getTycoon()
    if not playerTycoon then return 0 end
    local unpurchasedButtons2 = playerTycoon:FindFirstChild("UnpurchasedButtons")
    if not unpurchasedButtons2 then return 0 end
    local playerRebirths = getRebirths()
    local totalCost = 0
    for playerEntry, upgradeButton in ipairs(unpurchasedButtons2:GetChildren()) do
        if upgradeButton:IsA("Model") then
            local buttonType = upgradeButton:GetAttribute("ButtonType")
            if buttonType ~= "Clothing" and buttonType ~= "Group" and buttonType ~= "Gamepass" and buttonType ~= "Reward" and buttonType ~= "Operation" and buttonType ~= "Medal" then
                local price = getButtonPrice(upgradeButton)
                local rebirthRequirement2 = getRebirthRequirement(upgradeButton)
                local hasRequiredRebirth = playerRebirths >= rebirthRequirement2
                if price and hasRequiredRebirth then
                    totalCost = totalCost + price
                end
            end
        end
    end
    return totalCost
end

local function getTycoonCompletion()
    local playerGui2 = localPlayer2:FindFirstChild("PlayerGui")
    if not playerGui2 then return nil end
    local ui = playerGui2:FindFirstChild("UI")
    if not ui then return nil end
    local container = ui:FindFirstChild("Container")
    if not container then return nil end
    local hud = container:FindFirstChild("HUD")
    if not hud then return nil end
    local menu = hud:FindFirstChild("Menu")
    if not menu then return nil end
    local hud2 = menu:FindFirstChild("HUD")
    if not hud2 then return nil end
    local leftPanel = hud2:FindFirstChild("Left")
    if not leftPanel then return nil end
    return leftPanel:FindFirstChild("TycoonCompletion")
end

local function getProgressText()
    local tycoonCompletion = getTycoonCompletion()
    if not tycoonCompletion then return nil end
    local progressBar = tycoonCompletion:FindFirstChild("Bar")
    if not progressBar then return nil end
    local progressAmount = progressBar:FindFirstChild("BarProgressAmount")
    if not progressAmount then return nil end
    return progressAmount:GetAttribute("Text") or progressAmount.Text
end



local mainGui = Drawing.new("Square")
mainGui.Size = Vector2.new(266, 318)
mainGui.Color = uiColors.background
mainGui.Filled = true
mainGui.Visible = true
mainGui.ZIndex = 1

local mainTitle = Drawing.new("Text")
mainTitle.Text = "spookware++"
mainTitle.Size = 24
mainTitle.Color = uiColors.accent
mainTitle.Font = Drawing.Fonts.SystemBold
mainTitle.Outline = true
mainTitle.Visible = true
mainTitle.ZIndex = 2

local mainLine = Drawing.new("Square")
mainLine.Size = Vector2.new(266, 1)
mainLine.Color = uiColors.accent
mainLine.Filled = true
mainLine.Visible = true
mainLine.ZIndex = 2

local tabButtons = {}
local tabTexts = {}
local tabArrows = {}
local tabNames = {"Players", "Vehicle", "Farm", "Teleports", "Misc"}
local tabPositions = {0.220, 0.374, 0.525, 0.686, 0.843}

for tabIndex, tabName in ipairs(tabNames) do
    local tabButton = Drawing.new("Square")
    tabButton.Size = Vector2.new(246, 31)
    tabButton.Color = uiColors.backgroundAlt
    tabButton.Filled = true
    tabButton.Visible = true
    tabButton.ZIndex = 2
    
    local tabText = Drawing.new("Text")
    tabText.Text = tabName
    tabText.Size = 18
    tabText.Color = uiColors.accent
    tabText.Font = Drawing.Fonts.System
    tabText.Outline = true
    tabText.Visible = true
    tabText.ZIndex = 3
    
    local tabArrow = Drawing.new("Text")
    tabArrow.Text = ">"
    tabArrow.Size = 20
    tabArrow.Color = uiColors.accent
    tabArrow.Font = Drawing.Fonts.SystemBold
    tabArrow.Outline = true
    tabArrow.Visible = true
    tabArrow.ZIndex = 3
    
    tabButtons[tabIndex] = tabButton
    tabTexts[tabIndex] = tabText
    tabArrows[tabIndex] = tabArrow
end


local playerGui = Drawing.new("Square")
playerGui.Size = Vector2.new(202, 150)
playerGui.Color = uiColors.background
playerGui.Filled = true
playerGui.Visible = false
playerGui.ZIndex = 10

local playerTitle = Drawing.new("Text")
playerTitle.Text = "Players"
playerTitle.Size = 22
playerTitle.Color = uiColors.accent
playerTitle.Font = Drawing.Fonts.SystemBold
playerTitle.Outline = true
playerTitle.Visible = false
playerTitle.ZIndex = 11

local playerLine = Drawing.new("Square")
playerLine.Size = Vector2.new(202, 1)
playerLine.Color = uiColors.accent
playerLine.Filled = true
playerLine.Visible = false
playerLine.ZIndex = 11

local playerCloseBtn = Drawing.new("Circle")
playerCloseBtn.Radius = 10
playerCloseBtn.Color = uiColors.grey
playerCloseBtn.Filled = true
playerCloseBtn.Visible = false
playerCloseBtn.NumSides = 32
playerCloseBtn.ZIndex = 12

local playerLabels = {}
local maxPlayerLabels = 18

for labelIndex = 1, maxPlayerLabels do
    local labelBg = Drawing.new("Square")
    labelBg.Size = Vector2.new(190, 20)
    labelBg.Color = uiColors.backgroundAlt
    labelBg.Filled = true
    labelBg.Visible = false
    labelBg.ZIndex = 11
    
    local labelText = Drawing.new("Text")
    labelText.Text = ""
    labelText.Size = 12
    labelText.Color = uiColors.accent
    labelText.Font = Drawing.Fonts.System
    labelText.Outline = true
    labelText.Visible = false
    labelText.ZIndex = 12
    
    playerLabels[labelIndex] = {bg = labelBg, text = labelText}
end


local vehicleGui = Drawing.new("Square")
vehicleGui.Size = Vector2.new(202, 412)
vehicleGui.Color = uiColors.background
vehicleGui.Filled = true
vehicleGui.Visible = false
vehicleGui.ZIndex = 10

local vehicleTitle = Drawing.new("Text")
vehicleTitle.Text = "Vehicle"
vehicleTitle.Size = 22
vehicleTitle.Color = uiColors.accent
vehicleTitle.Font = Drawing.Fonts.SystemBold
vehicleTitle.Outline = true
vehicleTitle.Visible = false
vehicleTitle.ZIndex = 11

local vehicleLine = Drawing.new("Square")
vehicleLine.Size = Vector2.new(202, 1)
vehicleLine.Color = uiColors.accent
vehicleLine.Filled = true
vehicleLine.Visible = false
vehicleLine.ZIndex = 11

local vehicleCloseBtn = Drawing.new("Circle")
vehicleCloseBtn.Radius = 10
vehicleCloseBtn.Color = uiColors.grey
vehicleCloseBtn.Filled = true
vehicleCloseBtn.Visible = false
vehicleCloseBtn.NumSides = 32
vehicleCloseBtn.ZIndex = 12

local vehicleModBg = Drawing.new("Square")
vehicleModBg.Size = Vector2.new(150, 20)
vehicleModBg.Color = uiColors.backgroundAlt
vehicleModBg.Filled = true
vehicleModBg.Visible = false
vehicleModBg.ZIndex = 11

local vehicleModText = Drawing.new("Text")
vehicleModText.Text = "Mod Vehicles"
vehicleModText.Size = 14
vehicleModText.Color = uiColors.accent
vehicleModText.Font = Drawing.Fonts.System
vehicleModText.Outline = true
vehicleModText.Visible = false
vehicleModText.ZIndex = 12

local vehicleModToggle = Drawing.new("Circle")
vehicleModToggle.Radius = 10
vehicleModToggle.Color = uiColors.backgroundAlt
vehicleModToggle.Filled = true
vehicleModToggle.Visible = false
vehicleModToggle.NumSides = 32
vehicleModToggle.ZIndex = 12

local hitboxBg = Drawing.new("Square")
hitboxBg.Size = Vector2.new(150, 20)
hitboxBg.Color = uiColors.backgroundAlt
hitboxBg.Filled = true
hitboxBg.Visible = false
hitboxBg.ZIndex = 11

local hitboxText = Drawing.new("Text")
hitboxText.Text = "Hitbox extender"
hitboxText.Size = 14
hitboxText.Color = uiColors.accent
hitboxText.Font = Drawing.Fonts.System
hitboxText.Outline = true
hitboxText.Visible = false
hitboxText.ZIndex = 12

local hitboxToggle = Drawing.new("Circle")
hitboxToggle.Radius = 10
hitboxToggle.Color = uiColors.backgroundAlt
hitboxToggle.Filled = true
hitboxToggle.Visible = false
hitboxToggle.NumSides = 32
hitboxToggle.ZIndex = 12

local sliderElements = {}
local vehicleNames = {"Vehicle", "Helicopter", "Plane", "Submarine", "Tank", "Hovercraft"}

for i, name in ipairs(vehicleNames) do
    local sliderComponents = {
        bg = Drawing.new("Square"),
        text = Drawing.new("Text"),
        track = Drawing.new("Square"),
        handle = Drawing.new("Circle"),
        name = name:lower()
    }
    
    sliderComponents.bg.Size = Vector2.new(186, 19)
    sliderComponents.bg.Color = uiColors.backgroundAlt
    sliderComponents.bg.Filled = true
    sliderComponents.bg.Visible = false
    sliderComponents.bg.ZIndex = 11
    
    sliderComponents.text.Text = name .. ": 150"
    sliderComponents.text.Size = 13
    sliderComponents.text.Color = uiColors.accent
    sliderComponents.text.Font = Drawing.Fonts.System
    sliderComponents.text.Outline = true
    sliderComponents.text.Visible = false
    sliderComponents.text.ZIndex = 12
    
    sliderComponents.track.Size = Vector2.new(184, 5)
    sliderComponents.track.Color = uiColors.grey
    sliderComponents.track.Filled = true
    sliderComponents.track.Visible = false
    sliderComponents.track.ZIndex = 12
    
    sliderComponents.handle.Radius = 8
    sliderComponents.handle.Color = uiColors.accent
    sliderComponents.handle.Filled = true
    sliderComponents.handle.Visible = false
    sliderComponents.handle.NumSides = 32
    sliderComponents.handle.ZIndex = 13
    
    sliderElements[i] = sliderComponents
end

-- Farm GUI
local farmGui = Drawing.new("Square")
farmGui.Size = Vector2.new(202, 168)
farmGui.Color = uiColors.background
farmGui.Filled = true
farmGui.Visible = false
farmGui.ZIndex = 10

local farmTitle = Drawing.new("Text")
farmTitle.Text = "Farm"
farmTitle.Size = 22
farmTitle.Color = uiColors.accent
farmTitle.Font = Drawing.Fonts.SystemBold
farmTitle.Outline = true
farmTitle.Visible = false
farmTitle.ZIndex = 11

local farmLine = Drawing.new("Square")
farmLine.Size = Vector2.new(202, 1)
farmLine.Color = uiColors.accent
farmLine.Filled = true
farmLine.Visible = false
farmLine.ZIndex = 11

local farmCloseBtn = Drawing.new("Circle")
farmCloseBtn.Radius = 10
farmCloseBtn.Color = uiColors.grey
farmCloseBtn.Filled = true
farmCloseBtn.Visible = false
farmCloseBtn.NumSides = 32
farmCloseBtn.ZIndex = 12

local autofarmBg = Drawing.new("Square")
autofarmBg.Size = Vector2.new(157, 20)
autofarmBg.Color = uiColors.backgroundAlt
autofarmBg.Filled = true
autofarmBg.Visible = false
autofarmBg.ZIndex = 11

local autofarmText = Drawing.new("Text")
autofarmText.Text = "Auto farm"
autofarmText.Size = 15
autofarmText.Color = uiColors.accent
autofarmText.Font = Drawing.Fonts.System
autofarmText.Outline = true
autofarmText.Visible = false
autofarmText.ZIndex = 12

local autofarmToggle = Drawing.new("Circle")
autofarmToggle.Radius = 10
autofarmToggle.Color = uiColors.backgroundAlt
autofarmToggle.Filled = true
autofarmToggle.Visible = false
autofarmToggle.NumSides = 32
autofarmToggle.ZIndex = 12

local farmCostBg = Drawing.new("Square")
farmCostBg.Size = Vector2.new(190, 25)
farmCostBg.Color = uiColors.backgroundAlt
farmCostBg.Filled = true
farmCostBg.Visible = false
farmCostBg.ZIndex = 11

local farmCostText = Drawing.new("Text")
farmCostText.Text = "Current cost of buttons: 0"
farmCostText.Size = 13
farmCostText.Color = uiColors.accent
farmCostText.Font = Drawing.Fonts.System
farmCostText.Outline = true
farmCostText.Visible = false
farmCostText.ZIndex = 12

-- Teleport GUI
local teleportGui = Drawing.new("Square")
teleportGui.Size = Vector2.new(147, 432)
teleportGui.Color = uiColors.background
teleportGui.Filled = true
teleportGui.Visible = false
teleportGui.ZIndex = 10

local teleportTitle = Drawing.new("Text")
teleportTitle.Text = "TP"
teleportTitle.Size = 22
teleportTitle.Color = uiColors.accent
teleportTitle.Font = Drawing.Fonts.SystemBold
teleportTitle.Outline = true
teleportTitle.Visible = false
teleportTitle.ZIndex = 11

local teleportLine = Drawing.new("Square")
teleportLine.Size = Vector2.new(147, 1)
teleportLine.Color = uiColors.accent
teleportLine.Filled = true
teleportLine.Visible = false
teleportLine.ZIndex = 11

local teleportCloseBtn = Drawing.new("Circle")
teleportCloseBtn.Radius = 10
teleportCloseBtn.Color = uiColors.grey
teleportCloseBtn.Filled = true
teleportCloseBtn.Visible = false
teleportCloseBtn.NumSides = 32
teleportCloseBtn.ZIndex = 12

local tpButtons = {}
local tpTexts = {}
local locationNames = {"Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", 
                 "Kilo", "Lima", "Omega", "Romeo", "Sierra", "Tango", "Victor", "Yankee", "Zulu", "Capture point"}

for i, name in ipairs(locationNames) do
    local btn = Drawing.new("Square")
    btn.Size = Vector2.new(133, 15)
    btn.Color = uiColors.backgroundAlt
    btn.Filled = true
    btn.Visible = false
    btn.ZIndex = 11
    
    local text = Drawing.new("Text")
    text.Text = name
    text.Size = 12
    text.Color = uiColors.accent
    text.Font = Drawing.Fonts.System
    text.Outline = true
    text.Visible = false
    text.ZIndex = 12
    
    tpButtons[i] = btn
    tpTexts[i] = text
end

-- Misc GUI
local miscGui = Drawing.new("Square")
miscGui.Size = Vector2.new(202, 254)
miscGui.Color = uiColors.background
miscGui.Filled = true
miscGui.Visible = false
miscGui.ZIndex = 10

local miscTitle = Drawing.new("Text")
miscTitle.Text = "Misc"
miscTitle.Size = 22
miscTitle.Color = uiColors.accent
miscTitle.Font = Drawing.Fonts.SystemBold
miscTitle.Outline = true
miscTitle.Visible = false
miscTitle.ZIndex = 11

local miscLine = Drawing.new("Square")
miscLine.Size = Vector2.new(202, 1)
miscLine.Color = uiColors.accent
miscLine.Filled = true
miscLine.Visible = false
miscLine.ZIndex = 11

local miscCloseBtn = Drawing.new("Circle")
miscCloseBtn.Radius = 10
miscCloseBtn.Color = uiColors.grey
miscCloseBtn.Filled = true
miscCloseBtn.Visible = false
miscCloseBtn.NumSides = 32
miscCloseBtn.ZIndex = 12

local autorebirthBg = Drawing.new("Square")
autorebirthBg.Size = Vector2.new(150, 20)
autorebirthBg.Color = uiColors.backgroundAlt
autorebirthBg.Filled = true
autorebirthBg.Visible = false
autorebirthBg.ZIndex = 11

local autorebirthText = Drawing.new("Text")
autorebirthText.Text = "Auto Rebirth"
autorebirthText.Size = 15
autorebirthText.Color = uiColors.accent
autorebirthText.Font = Drawing.Fonts.System
autorebirthText.Outline = true
autorebirthText.Visible = false
autorebirthText.ZIndex = 12

local autorebirthToggle = Drawing.new("Circle")
autorebirthToggle.Radius = 10
autorebirthToggle.Color = uiColors.backgroundAlt
autorebirthToggle.Filled = true
autorebirthToggle.Visible = false
autorebirthToggle.NumSides = 32
autorebirthToggle.ZIndex = 12

local autobuyBg = Drawing.new("Square")
autobuyBg.Size = Vector2.new(150, 20)
autobuyBg.Color = uiColors.backgroundAlt
autobuyBg.Filled = true
autobuyBg.Visible = false
autobuyBg.ZIndex = 11

local autobuyText = Drawing.new("Text")
autobuyText.Text = "Auto Buy"
autobuyText.Size = 15
autobuyText.Color = uiColors.accent
autobuyText.Font = Drawing.Fonts.System
autobuyText.Outline = true
autobuyText.Visible = false
autobuyText.ZIndex = 12

local autobuyToggle = Drawing.new("Circle")
autobuyToggle.Radius = 10
autobuyToggle.Color = uiColors.backgroundAlt
autobuyToggle.Filled = true
autobuyToggle.Visible = false
autobuyToggle.NumSides = 32
autobuyToggle.ZIndex = 12

local collectMoneyBg = Drawing.new("Square")
collectMoneyBg.Size = Vector2.new(183, 20)
collectMoneyBg.Color = uiColors.backgroundAlt
collectMoneyBg.Filled = true
collectMoneyBg.Visible = false
collectMoneyBg.ZIndex = 11

local collectMoneyText = Drawing.new("Text")
collectMoneyText.Text = "Collect money: Enter"
collectMoneyText.Size = 13
collectMoneyText.Color = uiColors.accent
collectMoneyText.Font = Drawing.Fonts.System
collectMoneyText.Outline = true
collectMoneyText.Visible = false
collectMoneyText.ZIndex = 12

local submarineESPBg = Drawing.new("Square")
submarineESPBg.Size = Vector2.new(150, 20)
submarineESPBg.Color = uiColors.backgroundAlt
submarineESPBg.Filled = true
submarineESPBg.Visible = false
submarineESPBg.ZIndex = 11

local submarineESPText = Drawing.new("Text")
submarineESPText.Text = "Submarine ESP"
submarineESPText.Size = 15
submarineESPText.Color = uiColors.accent
submarineESPText.Font = Drawing.Fonts.System
submarineESPText.Outline = true
submarineESPText.Visible = false
submarineESPText.ZIndex = 12

local submarineESPToggle = Drawing.new("Circle")
submarineESPToggle.Radius = 10
submarineESPToggle.Color = uiColors.backgroundAlt
submarineESPToggle.Filled = true
submarineESPToggle.Visible = false
submarineESPToggle.NumSides = 32
submarineESPToggle.ZIndex = 12

local infAmmoBg = Drawing.new("Square")
infAmmoBg.Size = Vector2.new(183, 20)
infAmmoBg.Color = uiColors.backgroundAlt
infAmmoBg.Filled = true
infAmmoBg.Visible = false
infAmmoBg.ZIndex = 11

local infAmmoText = Drawing.new("Text")
infAmmoText.Text = "Infinite Ammo"
infAmmoText.Size = 15
infAmmoText.Color = uiColors.accent
infAmmoText.Font = Drawing.Fonts.System
infAmmoText.Outline = true
infAmmoText.Visible = false
infAmmoText.ZIndex = 12

local miscCostBg = Drawing.new("Square")
miscCostBg.Size = Vector2.new(190, 25)
miscCostBg.Color = uiColors.backgroundAlt
miscCostBg.Filled = true
miscCostBg.Visible = false
miscCostBg.ZIndex = 11

local miscCostText = Drawing.new("Text")
miscCostText.Text = "Current cost of buttons: 0"
miscCostText.Size = 13
miscCostText.Color = uiColors.accent
miscCostText.Font = Drawing.Fonts.System
miscCostText.Outline = true
miscCostText.Visible = false
miscCostText.ZIndex = 12


local function updatePlayerLabels()
    local allPlayers = game.Players:GetPlayers()
    local numPlayers = #allPlayers
    
    local baseHeight = 80
    local labelHeight = 23
    local totalHeight = baseHeight + (numPlayers * labelHeight)
    
    playerGui.Size = Vector2.new(202, totalHeight)
    
    for playerIndex = 1, maxPlayerLabels do
        if playerIndex <= numPlayers then
            local player = allPlayers[playerIndex]
            local regionCode = player:GetAttribute("siliconSDKRegion")
            local countryName = regionCode and (regionCodes[regionCode] or regionCode) or "Unknown"
            playerLabels[playerIndex].text.Text = player.Name .. ", " .. countryName
        end
    end
end

local function applyInfiniteAmmo()
    local gunsFolder = game.ReplicatedStorage.Configurations.ACS_Guns
    for gunIndex, gun in ipairs(gunsFolder:GetChildren()) do
        local ammoValue = gun:FindFirstChild("Ammo")
        if ammoValue and ammoValue:IsA("NumberValue") then
            ammoValue.Value = 999999999
        end
    end
    toggleStates.infAmmoApplied = true
end

local function updatePositions()
    mainGui.Position = Vector2.new(guiX, guiY)
    mainTitle.Position = Vector2.new(guiX + 75, guiY + 20)
    mainLine.Position = Vector2.new(guiX, guiY + 55)
    
    for tabIndex2 = 1, 5 do
        local yPos = guiY + (tabPositions[tabIndex2] * 318)
        tabButtons[tabIndex2].Position = Vector2.new(guiX + 9, yPos + 3)
        tabTexts[tabIndex2].Position = Vector2.new(guiX + 14, yPos + 9)
        tabArrows[tabIndex2].Position = Vector2.new(guiX + 230, yPos + 8)
        
        if openTabs[tabNames[tabIndex2]:lower()] then
            tabArrows[tabIndex2].Text = "v"
        else
            tabArrows[tabIndex2].Text = ">"
        end
    end
    
    if openTabs.players then
        updatePlayerLabels()
        playerGui.Position = Vector2.new(playerGuiX, playerGuiY)
        playerTitle.Position = Vector2.new(playerGuiX + 62, playerGuiY + 20)
        playerLine.Position = Vector2.new(playerGuiX, playerGuiY + 50)
        playerCloseBtn.Position = Vector2.new(playerGuiX + 181, playerGuiY + 22)
        
        local allPlayers = game.Players:GetPlayers()
        for playerListIndex = 1, maxPlayerLabels do
            if playerListIndex <= #allPlayers then
                local yOffset = 62 + ((playerListIndex-1) * 23)
                playerLabels[playerListIndex].bg.Position = Vector2.new(playerGuiX + 6, playerGuiY + yOffset)
                playerLabels[playerListIndex].text.Position = Vector2.new(playerGuiX + 11, playerGuiY + yOffset + 4)
            end
        end
    end
    
    if openTabs.vehicle then
        vehicleGui.Position = Vector2.new(vehicleGuiX, vehicleGuiY)
        vehicleTitle.Position = Vector2.new(vehicleGuiX + 64, vehicleGuiY + 20)
        vehicleLine.Position = Vector2.new(vehicleGuiX, vehicleGuiY + 50)
        vehicleCloseBtn.Position = Vector2.new(vehicleGuiX + 181, vehicleGuiY + 22)
        
        vehicleModBg.Position = Vector2.new(vehicleGuiX + 7, vehicleGuiY + 65)
        vehicleModText.Position = Vector2.new(vehicleGuiX + 12, vehicleGuiY + 69)
        vehicleModToggle.Position = Vector2.new(vehicleGuiX + 183, vehicleGuiY + 75)
        
        hitboxBg.Position = Vector2.new(vehicleGuiX + 7, vehicleGuiY + 97)
        hitboxText.Position = Vector2.new(vehicleGuiX + 12, vehicleGuiY + 101)
        hitboxToggle.Position = Vector2.new(vehicleGuiX + 183, vehicleGuiY + 107)
        
        local sliderYPositions = {132, 176, 220, 264, 308, 352}
        for sliderIndex = 1, 6 do
            local yPos = vehicleGuiY + sliderYPositions[sliderIndex]
            sliderElements[sliderIndex].bg.Position = Vector2.new(vehicleGuiX + 7, yPos)
            sliderElements[sliderIndex].text.Position = Vector2.new(vehicleGuiX + 12, yPos + 3)
            sliderElements[sliderIndex].track.Position = Vector2.new(vehicleGuiX + 8, yPos + 28)
            
            local currentValue = pendingSliderValues[sliderElements[sliderIndex].name]
            sliderElements[sliderIndex].text.Text = vehicleNames[sliderIndex] .. ": " .. tostring(currentValue)
            
            local fillWidth = ((currentValue - 5) / (300 - 5)) * 184
            local handleX = vehicleGuiX + 8 + fillWidth
            sliderElements[sliderIndex].handle.Position = Vector2.new(handleX, yPos + 30)
        end
    end
    
    if openTabs.farm then
        farmGui.Position = Vector2.new(farmGuiX, farmGuiY)
        farmTitle.Position = Vector2.new(farmGuiX + 72, farmGuiY + 20)
        farmLine.Position = Vector2.new(farmGuiX, farmGuiY + 50)
        farmCloseBtn.Position = Vector2.new(farmGuiX + 181, farmGuiY + 22)
        
        autofarmBg.Position = Vector2.new(farmGuiX + 5, farmGuiY + 67)
        autofarmText.Position = Vector2.new(farmGuiX + 10, farmGuiY + 70)
        autofarmToggle.Position = Vector2.new(farmGuiX + 183, farmGuiY + 77)
        
        farmCostBg.Position = Vector2.new(farmGuiX + 6, farmGuiY + 100)
        farmCostText.Position = Vector2.new(farmGuiX + 11, farmGuiY + 109)
    end
    
    if openTabs.teleports then
        teleportGui.Position = Vector2.new(teleportGuiX, teleportGuiY)
        teleportTitle.Position = Vector2.new(teleportGuiX + 56, teleportGuiY + 20)
        teleportLine.Position = Vector2.new(teleportGuiX, teleportGuiY + 50)
        teleportCloseBtn.Position = Vector2.new(teleportGuiX + 126, teleportGuiY + 22)
        
        for buttonIndex, button2 in ipairs(tpButtons) do
            local yOffset = 62 + ((buttonIndex-1) * 19)
            button2.Position = Vector2.new(teleportGuiX + 7, teleportGuiY + yOffset)
            tpTexts[buttonIndex].Position = Vector2.new(teleportGuiX + 12, teleportGuiY + yOffset + 2)
        end
    end
    
    if openTabs.misc then
        miscGui.Position = Vector2.new(miscGuiX, miscGuiY)
        miscTitle.Position = Vector2.new(miscGuiX + 72, miscGuiY + 20)
        miscLine.Position = Vector2.new(miscGuiX, miscGuiY + 50)
        miscCloseBtn.Position = Vector2.new(miscGuiX + 181, miscGuiY + 22)
        
        autorebirthBg.Position = Vector2.new(miscGuiX + 9, miscGuiY + 67)
        autorebirthText.Position = Vector2.new(miscGuiX + 14, miscGuiY + 70)
        autorebirthToggle.Position = Vector2.new(miscGuiX + 185, miscGuiY + 77)
        
        autobuyBg.Position = Vector2.new(miscGuiX + 9, miscGuiY + 97)
        autobuyText.Position = Vector2.new(miscGuiX + 14, miscGuiY + 100)
        autobuyToggle.Position = Vector2.new(miscGuiX + 185, miscGuiY + 107)
        
        collectMoneyBg.Position = Vector2.new(miscGuiX + 9, miscGuiY + 127)
        collectMoneyText.Position = Vector2.new(miscGuiX + 14, miscGuiY + 130)
        
        submarineESPBg.Position = Vector2.new(miscGuiX + 9, miscGuiY + 157)
        submarineESPText.Position = Vector2.new(miscGuiX + 14, miscGuiY + 160)
        submarineESPToggle.Position = Vector2.new(miscGuiX + 185, miscGuiY + 167)
        
        infAmmoBg.Position = Vector2.new(miscGuiX + 9, miscGuiY + 187)
        infAmmoText.Position = Vector2.new(miscGuiX + 14, miscGuiY + 190)
        
        miscCostBg.Position = Vector2.new(miscGuiX + 6, miscGuiY + 217)
        miscCostText.Position = Vector2.new(miscGuiX + 11, miscGuiY + 226)
    end
end

local function updateVisibility()
    local allPlayers = game.Players:GetPlayers()
    
    playerGui.Visible = openTabs.players and isGuiVisible
    playerTitle.Visible = openTabs.players and isGuiVisible
    playerLine.Visible = openTabs.players and isGuiVisible
    playerCloseBtn.Visible = openTabs.players and isGuiVisible
    for playerIndex2 = 1, maxPlayerLabels do
        local shouldShow = playerIndex2 <= #allPlayers and openTabs.players and isGuiVisible
        playerLabels[playerIndex2].bg.Visible = shouldShow
        playerLabels[playerIndex2].text.Visible = shouldShow
    end
    
    vehicleGui.Visible = openTabs.vehicle and isGuiVisible
    vehicleTitle.Visible = openTabs.vehicle and isGuiVisible
    vehicleLine.Visible = openTabs.vehicle and isGuiVisible
    vehicleCloseBtn.Visible = openTabs.vehicle and isGuiVisible
    vehicleModBg.Visible = openTabs.vehicle and isGuiVisible
    vehicleModText.Visible = openTabs.vehicle and isGuiVisible
    vehicleModToggle.Visible = openTabs.vehicle and isGuiVisible
    hitboxBg.Visible = openTabs.vehicle and isGuiVisible
    hitboxText.Visible = openTabs.vehicle and isGuiVisible
    hitboxToggle.Visible = openTabs.vehicle and isGuiVisible
    for index3 = 1, 6 do
        sliderElements[index3].bg.Visible = openTabs.vehicle and isGuiVisible
        sliderElements[index3].text.Visible = openTabs.vehicle and isGuiVisible
        sliderElements[index3].track.Visible = openTabs.vehicle and isGuiVisible
        sliderElements[index3].handle.Visible = openTabs.vehicle and isGuiVisible
    end
    
    farmGui.Visible = openTabs.farm and isGuiVisible
    farmTitle.Visible = openTabs.farm and isGuiVisible
    farmLine.Visible = openTabs.farm and isGuiVisible
    farmCloseBtn.Visible = openTabs.farm and isGuiVisible
    autofarmBg.Visible = openTabs.farm and isGuiVisible
    autofarmText.Visible = openTabs.farm and isGuiVisible
    autofarmToggle.Visible = openTabs.farm and isGuiVisible
    farmCostBg.Visible = openTabs.farm and isGuiVisible
    farmCostText.Visible = openTabs.farm and isGuiVisible
    
    teleportGui.Visible = openTabs.teleports and isGuiVisible
    teleportTitle.Visible = openTabs.teleports and isGuiVisible
    teleportLine.Visible = openTabs.teleports and isGuiVisible
    teleportCloseBtn.Visible = openTabs.teleports and isGuiVisible
    for i = 1, #tpButtons do
        tpButtons[i].Visible = openTabs.teleports and isGuiVisible
        tpTexts[i].Visible = openTabs.teleports and isGuiVisible
    end
    
    miscGui.Visible = openTabs.misc and isGuiVisible
    miscTitle.Visible = openTabs.misc and isGuiVisible
    miscLine.Visible = openTabs.misc and isGuiVisible
    miscCloseBtn.Visible = openTabs.misc and isGuiVisible
    autorebirthBg.Visible = openTabs.misc and isGuiVisible
    autorebirthText.Visible = openTabs.misc and isGuiVisible
    autorebirthToggle.Visible = openTabs.misc and isGuiVisible
    autobuyBg.Visible = openTabs.misc and isGuiVisible
    autobuyText.Visible = openTabs.misc and isGuiVisible
    autobuyToggle.Visible = openTabs.misc and isGuiVisible
    collectMoneyBg.Visible = openTabs.misc and isGuiVisible
    collectMoneyText.Visible = openTabs.misc and isGuiVisible
    submarineESPBg.Visible = openTabs.misc and isGuiVisible
    submarineESPText.Visible = openTabs.misc and isGuiVisible
    submarineESPToggle.Visible = openTabs.misc and isGuiVisible
    infAmmoBg.Visible = openTabs.misc and isGuiVisible
    infAmmoText.Visible = openTabs.misc and isGuiVisible
    miscCostBg.Visible = openTabs.misc and isGuiVisible
    miscCostText.Visible = openTabs.misc and isGuiVisible
    
    mainGui.Visible = isGuiVisible
    mainTitle.Visible = isGuiVisible
    mainLine.Visible = isGuiVisible
    for loopIndex = 1, 5 do
        tabButtons[loopIndex].Visible = isGuiVisible
        tabTexts[loopIndex].Visible = isGuiVisible
        tabArrows[loopIndex].Visible = isGuiVisible
    end
end

local function updateToggles()
    vehicleModToggle.Color = toggleStates.vehicleMod and uiColors.green or uiColors.backgroundAlt
    hitboxToggle.Color = toggleStates.hitboxExtender and uiColors.green or uiColors.backgroundAlt
    autofarmToggle.Color = toggleStates.autofarm and uiColors.green or uiColors.backgroundAlt
    autobuyToggle.Color = toggleStates.autobuy and uiColors.green or uiColors.backgroundAlt
    autorebirthToggle.Color = toggleStates.autorebirth and uiColors.green or uiColors.backgroundAlt
    submarineESPToggle.Color = toggleStates.submarineESP and uiColors.green or uiColors.backgroundAlt
end


local function runAutofarm()
    while autofarmActive and not isGuiVisible do
        if not isrbxactive() then
            wait(1)
            continue
        end
        
        if not playerTycoonName then
            playerTycoonName = getPlayerTycoon()
            if not playerTycoonName then
                wait(5)
                continue
            end
        end

        if playerTycoonName then
            if not ensureMedbay() then
                wait(2)
            end
        end

        if playerTycoonName then
            if not isHoldingCrate() then
                local targetCrate = findTargetCrate()
                if not targetCrate then
                    wait(5)
                else
                    local humanoidRootPart = getHRP()
                    if not humanoidRootPart then
                        wait(3)
                    else
                        local cratePosition = targetCrate.Position
                        local newPosition = Vector3.new(cratePosition.X + 2, cratePosition.Y, cratePosition.Z + 1)
                        humanoidRootPart.Position = newPosition
                        wait(1)
                        camera.lookAt(humanoidRootPart.Position, cratePosition)
                        wait(1)
                        keypress(0x45)
                        wait(0.1)
                        keypress(0x45)
                        wait(0.1)
                        holdE(4)
                        wait(0.1)
                    end
                end
            end
            
            if isHoldingCrate() then
                local depositPosition = depositLocations[playerTycoonName]
                if not depositPosition then
                    wait(5)
                else
                    local humanoidRootPart2 = getHRP()
                    if not humanoidRootPart2 then
                        wait(3)
                    else
                        humanoidRootPart2.Position = depositPosition
                        wait(7)
                        local tycoonModel = workspace.Tycoon.Tycoons:FindFirstChild(playerTycoonName)
                        if not tycoonModel then
                            playerTycoonName = nil
                            wait(3)
                        else
                            local essentialsFolder = tycoonModel:FindFirstChild("Essentials")
                            local oilCollector = essentialsFolder and essentialsFolder:FindFirstChild("Oil Collector")
                            local collectorModel = oilCollector and oilCollector:FindFirstChild("Collector")
                            local depositPart = collectorModel and collectorModel:FindFirstChild("Part")

                            if not depositPart then
                                wait(3)
                            else
                                local depositPartPosition = depositPart.Position
                                camera.lookAt(humanoidRootPart2.Position, depositPartPosition)
                                wait(0.1)
                                holdE(2)
                                wait(5)
                            end
                        end
                    end
                end
            end
        end

        if not autofarmActive then
            break
        end

        wait(0.1)
    end
    autofarmRunning = false
end

local function doRebirth()
    if not isrbxactive() then return end
    mousemoveabs(779, 104)
    wait(0.1)
    mousemoveabs(791, 103)
    mouse1click()
    wait(0.2)
    mousemoveabs(899, 631)
    wait(0.1)
    mousemoveabs(905, 631)
    mouse1click()
    wait(1)
end

local function autoBuyUpgrades()
    if not isrbxactive() then return end
    if not autoBuyEnabled then return end
    
    local playerTycoon2 = getTycoon()
    if not playerTycoon2 then return end
    
    local unpurchasedButtons3 = playerTycoon2:FindFirstChild("UnpurchasedButtons")
    if not unpurchasedButtons3 then return end
    
    local playerRebirths = getRebirths()
    local playerCash = getCash()
    
    local medbayStart = unpurchasedButtons3:FindFirstChild("Medbay Start")
    if medbayStart then
        buyButton(medbayStart)
        wait(0.5)
    end
    
    for button3, button in ipairs(unpurchasedButtons3:GetChildren()) do
        if not autoBuyEnabled then break end
        if not isrbxactive() then break end
        
        if button:IsA("Model") then
            local buttonType = button:GetAttribute("ButtonType")
            if buttonType == "Clothing" or buttonType == "Group" or buttonType == "Gamepass" or buttonType == "Reward" or buttonType == "Operation" or buttonType == "Medal" then
                -- Skip these button types
            else
                local price = getButtonPrice(button)
                local rebirthRequirement3 = getRebirthRequirement(button)
                local hasRequiredRebirths = playerRebirths >= rebirthRequirement3
                
                if price then
                    local canAffordPurchase = playerCash >= price
                    if canAffordPurchase and hasRequiredRebirths then
                        if buyButton(button) then
                            playerCash = getCash()
                        end
                    end
                else
                    -- No price means it's free
                    if hasRequiredRebirths then
                        buyButton(button)
                    end
                end
            end
        end
    end
end

local function getVehicleOwner(vehicle)
    local owner = vehicle:GetAttribute("Owner")
    if owner and typeof(owner) == "string" then return owner end
    for child2, child in ipairs(vehicle:GetDescendants()) do
        local childOwner = child:GetAttribute("Owner")
        if childOwner and typeof(childOwner) == "string" then return childOwner end
    end
    return nil
end

local function resizeCollisionParts(vehicle, targetSize)
    local resizedCount = 0

    for obj2, obj in ipairs(vehicle:GetDescendants()) do
        if obj:IsA("BasePart") then
            local nameLowercase = string.lower(obj.Name)
            if string.find(nameLowercase, "collision") or 
               string.find(nameLowercase, "hitbox") or
               obj.Name == "Collision" then

                if obj.Transparency == 1 then
                    obj.Size = Vector3.new(targetSize, targetSize, targetSize)
                    resizedCount = resizedCount + 1
                    wait(3) 
                end
            end
        end

        if obj:IsA("Folder") and string.lower(obj.Name):find("collision") then
            for part2, part in ipairs(obj:GetChildren()) do
                if part:IsA("BasePart") and part.Transparency == 1 then
                    part.Size = Vector3.new(targetSize, targetSize, targetSize)
                    resizedCount = resizedCount + 1
                    wait(3)   
                end
            end
        end
    end

    return resizedCount
end

local function scanVehicles()
    local gameSystemsRoot = workspace:FindFirstChild("Game Systems")
    if not gameSystemsRoot then return 0, 0 end
    
    local vehicleCategories = {
        {name = "Boat", workspaceName = "Boat Workspace", size = sliderValues.vehicle},
        {name = "Vehicle", workspaceName = "Vehicle Workspace", size = sliderValues.vehicle},
        {name = "Hovercraft", workspaceName = "Hovercraft Workspace", size = sliderValues.hovercraft},
        {name = "Helicopter", workspaceName = "Helicopter Workspace", size = sliderValues.helicopter},
        {name = "Plane", workspaceName = "Plane Workspace", size = sliderValues.plane},
        {name = "Submarine", workspaceName = "Submarine Workspace", size = sliderValues.submarine},
        {name = "Tank", workspaceName = "Tank Workspace", size = sliderValues.tank}
    }
    
    local modifiedCount, totalCount = 0, 0
    for category2, category in ipairs(vehicleCategories) do
        local vehicleFolder = gameSystemsRoot:FindFirstChild(category.workspaceName)
        if vehicleFolder then
            for vehicle2, vehicle in ipairs(vehicleFolder:GetChildren()) do
                totalCount = totalCount + 1
                local vehicleOwner = getVehicleOwner(vehicle)
                local shouldProtectVehicle = vehicleOwner == localPlayer2.Name
                
                if shouldProtectVehicle then
                    resizeCollisionParts(vehicle, 4)
                else
                    local wasResized = resizeCollisionParts(vehicle, category.size)
                    if wasResized > 0 and category.size > 4 then
                        modifiedCount = modifiedCount + 1
                    end
                end
            end
        end
    end
    
    return modifiedCount, totalCount
end

local function setAttributeIfExists(object, attributeName, value)
    local currentAttributeValue = object:GetAttribute(attributeName)
    if currentAttributeValue ~= nil then
        object:SetAttribute(attributeName, value)
        return true
    end
    return false
end

local function scanAndUpgrade(object)
    setAttributeIfExists(object, "HealthUpgrades", 10)
    setAttributeIfExists(object, "SpeedUpgrades", 10)
    setAttributeIfExists(object, "FirepowerUpgrades", 10)
    setAttributeIfExists(object, "BulletCount", 0)
    setAttributeIfExists(object, "CanDeplete", false)
    
    for descendant2, descendant in ipairs(object:GetDescendants()) do
        setAttributeIfExists(descendant, "HealthUpgrades", 10)
        setAttributeIfExists(descendant, "SpeedUpgrades", 10)
        setAttributeIfExists(descendant, "FirepowerUpgrades", 10)
        setAttributeIfExists(descendant, "BulletCount", 0)
        setAttributeIfExists(descendant, "CanDeplete", false)
    end
end

local function getCollectorPosition()
    if not playerTycoonName then
        playerTycoonName = getPlayerTycoon()
    end
    if not playerTycoonName then return nil end
    
    local tycoonModel = workspace.Tycoon.Tycoons:FindFirstChild(playerTycoonName)
    if not tycoonModel then return nil end
    
    local essentialsFolder2 = tycoonModel:FindFirstChild("Essentials")
    if not essentialsFolder2 then return nil end
    
    local cashCollectors = essentialsFolder2:FindFirstChild("CashCollectors")
    if not cashCollectors then return nil end
    
    local collector = cashCollectors:FindFirstChild("Collector")
    if not collector then return nil end
    
    return collector.Position
end

local function collectMoney()
    if not isrbxactive() then return end
    local hrp = getHRP()
    if hrp then
        local collectorPos = getCollectorPosition()
        if collectorPos then
            local savedPos = hrp.Position
            hrp.Position = collectorPos
            wait(0.5)
            hrp.Position = savedPos
        end
    end
end


local function createSubmarineESP(model)
    if submarineESP[model] then return end
    local textLabel = Drawing.new("Text")
    textLabel.Color = Color3.fromRGB(255, 100, 100)
    textLabel.Size = 12
    textLabel.Center = true
    textLabel.Outline = true
    textLabel.Visible = false
    submarineESP[model] = { text = textLabel }
end

local function removeSubmarineESP(model)
    local espObject = submarineESP[model]
    if not espObject then return end
    if espObject.text then espObject.text:Remove() end
    submarineESP[model] = nil
end

local function getBoatPivot(model)
    local pivot = model:FindFirstChild("BoatPivot")
    if pivot and pivot:IsA("BasePart") then
        return pivot
    end
    return nil
end

local function updateSubmarineESP(model)
    local espObj = submarineESP[model]
    if not espObj then return end
    local pivot = getBoatPivot(model)
    if not pivot then
        removeSubmarineESP(model)
        return
    end
    local screenPos, isOnScreen = WorldToScreen(pivot.Position)
    if not isOnScreen then
        espObj.text.Visible = false
        return
    end
    local owner = model:GetAttribute("Owner")
    if not owner then owner = "Unknown" end
    espObj.text.Visible = true
    espObj.text.Text = model.Name .. " - " .. tostring(owner)
    espObj.text.Position = screenPos
end



spawn(function()
    while true do
        if toggleStates.hitboxExtender then
            scanVehicles()
        end
        wait(0.5)
    end
end)

spawn(function()
    while true do
        if toggleStates.vehicleMod then
            local gameSystems2 = workspace:FindFirstChild("Game Systems")
            if gameSystems2 then
                local workspaceNames = {
                    "Boat Workspace", "Submarine Workspace", "Vehicle Workspace",
                    "Helicopter Workspace", "Tank Workspace", "Plane Workspace", "Hovercraft Workspace"
                }
                
                for i5, workspaceName in ipairs(workspaceNames) do
                    local workspaceFolder = gameSystems2:FindFirstChild(workspaceName)
                    if workspaceFolder then
                        for i6, vehicle in ipairs(workspaceFolder:GetChildren()) do
                            if vehicle:IsA("Model") then
                                local owner = vehicle:GetAttribute("Owner")
                                if owner == localPlayer2.Name then
                                    scanAndUpgrade(vehicle)
                                end
                            end
                        end
                    end
                end
            end
        end
        wait(0.1)
    end
end)

spawn(function()
    while true do
        if autoRebirthEnabled and not isGuiVisible then
            if isrbxactive() then
                local progressText = getProgressText()
                if progressText then
                    local progressValue = tonumber(string.match(progressText, "%d+"))
                    if progressValue and progressValue >= 100 then
                        while getCash() < 500000 do
                            wait(1)
                        end
                        doRebirth()
                    end
                end
            end
        end
        wait(0.5)
    end
end)

spawn(function()
    while true do
        if autoBuyEnabled then
            if isrbxactive() then
                autoBuyUpgrades()
            end
        end
        wait(0.5)
    end
end)

spawn(function()
    while true do
        if isrbxactive() then
            totalButtonCost = calculateTotalCost()
            local costString = tostring(totalButtonCost)
            farmCostText.Text = "Current cost of buttons: " .. costString
            miscCostText.Text = "Current cost of buttons: " .. costString
        end
        wait(0.5)
    end
end)

spawn(function()
    local enterWasPressed = false
    while true do
        if isrbxactive() then
            local enterPressed = iskeypressed(0x0D)
            if enterPressed and not enterWasPressed then
                collectMoney()
            end
            enterWasPressed = enterPressed
        end
        wait(0.05)
    end
end)

spawn(function()
    while true do
        if submarineESPEnabled then
            local subWorkspace = workspace:FindFirstChild("Game Systems")
            if subWorkspace then
                subWorkspace = subWorkspace:FindFirstChild("Submarine Workspace")
                if subWorkspace then
                    local isValid = {}
                    for i7, submarine in ipairs(subWorkspace:GetChildren()) do
                        if submarine:IsA("Model") then
                            local owner = submarine:GetAttribute("Owner")
                            if owner and owner ~= localPlayer2.Name then
                                isValid[submarine] = true
                                createSubmarineESP(submarine)
                                updateSubmarineESP(submarine)
                            end
                        end
                    end
                    for model in pairs(submarineESP) do
                        if not isValid[model] or not model.Parent then
                            removeSubmarineESP(model)
                        end
                    end
                end
            end
        else
            for model in pairs(submarineESP) do
                removeSubmarineESP(model)
            end
        end
        wait(0)
    end
end)

spawn(function()
    local mouse1Down = false
    local mouse1WasDown = false
    
    while true do
        wait(0)
        
        local mouseX = mouse.X
        local mouseY = mouse.Y
        
        mouse1WasDown = mouse1Down
        mouse1Down = ismouse1pressed()
        local mouseJustPressed = (mouse1Down and not mouse1WasDown)
        local mouseJustReleased = (not mouse1Down and mouse1WasDown)
        
        if not isGuiVisible then
            isDragging = false
            isPlayerDragging = false
            isVehicleDragging = false
            isFarmDragging = false
            isTeleportDragging = false
            isMiscDragging = false
            activeSlider = nil
        else
            if mouseJustPressed and isInRect(mouseX, mouseY, guiX, guiY, 266, 55) then
                isDragging = true
                dragOffsetX = mouseX - guiX
                dragOffsetY = mouseY - guiY
            end
            
            if isDragging then
                if mouse1Down then
                    guiX = mouseX - dragOffsetX
                    guiY = mouseY - dragOffsetY
                    updatePositions()
                else
                    isDragging = false
                end
            end
            
            if openTabs.players and mouseJustPressed and isInRect(mouseX, mouseY, playerGuiX, playerGuiY, 202, 50) then
                isPlayerDragging = true
                playerDragOffsetX = mouseX - playerGuiX
                playerDragOffsetY = mouseY - playerGuiY
            end
            
            if isPlayerDragging then
                if mouse1Down then
                    playerGuiX = mouseX - playerDragOffsetX
                    playerGuiY = mouseY - playerDragOffsetY
                    updatePositions()
                else
                    isPlayerDragging = false
                end
            end
            
            if openTabs.vehicle and mouseJustPressed and isInRect(mouseX, mouseY, vehicleGuiX, vehicleGuiY, 202, 50) then
                isVehicleDragging = true
                vehicleDragOffsetX = mouseX - vehicleGuiX
                vehicleDragOffsetY = mouseY - vehicleGuiY
            end
            
            if isVehicleDragging then
                if mouse1Down then
                    vehicleGuiX = mouseX - vehicleDragOffsetX
                    vehicleGuiY = mouseY - vehicleDragOffsetY
                    updatePositions()
                else
                    isVehicleDragging = false
                end
            end
            
            if openTabs.farm and mouseJustPressed and isInRect(mouseX, mouseY, farmGuiX, farmGuiY, 202, 50) then
                isFarmDragging = true
                farmDragOffsetX = mouseX - farmGuiX
                farmDragOffsetY = mouseY - farmGuiY
            end
            
            if isFarmDragging then
                if mouse1Down then
                    farmGuiX = mouseX - farmDragOffsetX
                    farmGuiY = mouseY - farmDragOffsetY
                    updatePositions()
                else
                    isFarmDragging = false
                end
            end
            
            if openTabs.teleports and mouseJustPressed and isInRect(mouseX, mouseY, teleportGuiX, teleportGuiY, 147, 50) then
                isTeleportDragging = true
                teleportDragOffsetX = mouseX - teleportGuiX
                teleportDragOffsetY = mouseY - teleportGuiY
            end
            
            if isTeleportDragging then
                if mouse1Down then
                    teleportGuiX = mouseX - teleportDragOffsetX
                    teleportGuiY = mouseY - teleportDragOffsetY
                    updatePositions()
                else
                    isTeleportDragging = false
                end
            end
            
            if openTabs.misc and mouseJustPressed and isInRect(mouseX, mouseY, miscGuiX, miscGuiY, 202, 50) then
                isMiscDragging = true
                miscDragOffsetX = mouseX - miscGuiX
                miscDragOffsetY = mouseY - miscGuiY
            end
            
            if isMiscDragging then
                if mouse1Down then
                    miscGuiX = mouseX - miscDragOffsetX
                    miscGuiY = mouseY - miscDragOffsetY
                    updatePositions()
                else
                    isMiscDragging = false
                end
            end
            
            if not isDragging then
                for i = 1, 5 do
                    local yPos = guiY + (tabPositions[i] * 318)
                    if isInRect(mouseX, mouseY, guiX + 9, yPos + 3, 246, 31) then
                        tabButtons[i].Color = Color3.fromRGB(70, 70, 70)
                        
                        if mouseJustReleased then
                            local tabKey = tabNames[i]:lower()
                            openTabs[tabKey] = not openTabs[tabKey]
                            updateVisibility()
                            updatePositions()
                        end
                    else
                        tabButtons[i].Color = uiColors.backgroundAlt
                    end
                end
            end
            
            if openTabs.players and not isPlayerDragging then
                local playerButtonX = playerGuiX + 181
                local playerButtonY = playerGuiY + 22
                local mouseDeltaX = mouseX - playerButtonX
                local mouseDeltaY = mouseY - playerButtonY
                local mouseToPlayerBtnDist = math.sqrt(mouseDeltaX*mouseDeltaX + mouseDeltaY*mouseDeltaY)
                
                if mouseToPlayerBtnDist <= 10 then
                    playerCloseBtn.Color = uiColors.red
                    if mouseJustReleased then
                        openTabs.players = false
                        updateVisibility()
                        updatePositions()
                    end
                else
                    playerCloseBtn.Color = uiColors.grey
                end
            end
            
            if openTabs.vehicle and not isVehicleDragging then
                local vehicleButtonX = vehicleGuiX + 181
                local vehicleButtonY = vehicleGuiY + 22
                local mouseDeltaX2 = mouseX - vehicleButtonX
                local mouseDeltaY2 = mouseY - vehicleButtonY
                local mouseToVehicleBtnDist = math.sqrt(mouseDeltaX2*mouseDeltaX2 + mouseDeltaY2*mouseDeltaY2)
                
                if mouseToVehicleBtnDist <= 10 then
                    vehicleCloseBtn.Color = uiColors.red
                    if mouseJustReleased then
                        openTabs.vehicle = false
                        updateVisibility()
                        updatePositions()
                    end
                else
                    vehicleCloseBtn.Color = uiColors.grey
                end
                
                local modifierX = vehicleGuiX + 183
                local modifierY = vehicleGuiY + 75
                mouseDeltaX2 = mouseX - modifierX
                mouseDeltaY2 = mouseY - modifierY
                mouseToVehicleBtnDist = math.sqrt(mouseDeltaX2*mouseDeltaX2 + mouseDeltaY2*mouseDeltaY2)
                
                if mouseToVehicleBtnDist <= 10 then
                    vehicleModToggle.Color = toggleStates.vehicleMod and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.vehicleMod = not toggleStates.vehicleMod
                        updateToggles()
                    end
                else
                    vehicleModToggle.Color = toggleStates.vehicleMod and uiColors.green or uiColors.backgroundAlt
                end
                
                local hitboxX = vehicleGuiX + 183
                local hitboxY = vehicleGuiY + 107
                mouseDeltaX2 = mouseX - hitboxX
                mouseDeltaY2 = mouseY - hitboxY
                mouseToVehicleBtnDist = math.sqrt(mouseDeltaX2*mouseDeltaX2 + mouseDeltaY2*mouseDeltaY2)
                
                if mouseToVehicleBtnDist <= 10 then
                    hitboxToggle.Color = toggleStates.hitboxExtender and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.hitboxExtender = not toggleStates.hitboxExtender
                        updateToggles()
                    end
                else
                    hitboxToggle.Color = toggleStates.hitboxExtender and uiColors.green or uiColors.backgroundAlt
                end
                
                local sliderYPositions = {132, 176, 220, 264, 308, 352}
                for sliderIndex2 = 1, 6 do
                    local sliderY = vehicleGuiY + sliderYPositions[sliderIndex2]
                    local trackX = vehicleGuiX + 8
                    local trackY = sliderY + 30
                    
                    local currentSliderValue = pendingSliderValues[sliderElements[sliderIndex2].name]
                    local fillWidth = ((currentSliderValue - 5) / (300 - 5)) * 184
                    local handleX = trackX + fillWidth
                    mouseDeltaX2 = mouseX - handleX
                    mouseDeltaY2 = mouseY - trackY
                    mouseToVehicleBtnDist = math.sqrt(mouseDeltaX2*mouseDeltaX2 + mouseDeltaY2*mouseDeltaY2)
                    
                    local isOnTrack = isInRect(mouseX, mouseY, trackX, trackY - 5, 184, 10)
                    
                    if mouseToVehicleBtnDist <= 8 or (isOnTrack and activeSlider == sliderIndex2) then
                        sliderElements[sliderIndex2].handle.Color = Color3.fromRGB(200, 50, 255)
                        
                        if mouseJustPressed and (mouseToVehicleBtnDist <= 8 or isOnTrack) then
                            activeSlider = sliderIndex2
                        end
                    else
                        sliderElements[sliderIndex2].handle.Color = uiColors.accent
                    end
                    
                    if activeSlider == sliderIndex2 and mouse1Down and isrbxactive() then
                        local relativeMouseX = math.clamp(mouseX - trackX, 0, 184)
                        local fillPercentage = relativeMouseX / 184
                        local newSliderValue = math.floor(5 + fillPercentage * (300 - 5))
                        pendingSliderValues[sliderElements[sliderIndex2].name] = newSliderValue
                        sliderChanged = true
                        updatePositions()
                    end
                end
                
                if mouseJustReleased and activeSlider and sliderChanged then
                    sliderValues[sliderElements[activeSlider].name] = pendingSliderValues[sliderElements[activeSlider].name]
                    activeSlider = nil
                    sliderChanged = false
                end
            end
            
            if openTabs.farm and not isFarmDragging then
                local farmButtonX = farmGuiX + 181
                local farmButtonY = farmGuiY + 22
                local mouseDeltaX3 = mouseX - farmButtonX
                local mouseDeltaY3 = mouseY - farmButtonY
                local mouseToFarmBtnDist = math.sqrt(mouseDeltaX3*mouseDeltaX3 + mouseDeltaY3*mouseDeltaY3)
                
                if mouseToFarmBtnDist <= 10 then
                    farmCloseBtn.Color = uiColors.red
                    if mouseJustReleased then
                        openTabs.farm = false
                        updateVisibility()
                        updatePositions()
                    end
                else
                    farmCloseBtn.Color = uiColors.grey
                end
                
                local farmX = farmGuiX + 183
                local farmY = farmGuiY + 77
                mouseDeltaX3 = mouseX - farmX
                mouseDeltaY3 = mouseY - farmY
                mouseToFarmBtnDist = math.sqrt(mouseDeltaX3*mouseDeltaX3 + mouseDeltaY3*mouseDeltaY3)
                
                if mouseToFarmBtnDist <= 10 then
                    autofarmToggle.Color = toggleStates.autofarm and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.autofarm = not toggleStates.autofarm
                        updateToggles()
                        autofarmActive = toggleStates.autofarm
                        if autofarmActive and not isGuiVisible and not autofarmRunning then
                            autofarmRunning = true
                            spawn(function()
                                runAutofarm()
                            end)
                        end
                    end
                else
                    autofarmToggle.Color = toggleStates.autofarm and uiColors.green or uiColors.backgroundAlt
                end
            end
            
            if openTabs.teleports and not isTeleportDragging then
                local teleportButtonX = teleportGuiX + 126
                local teleportButtonY = teleportGuiY + 22
                local mouseDeltaX4 = mouseX - teleportButtonX
                local mouseDeltaY4 = mouseY - teleportButtonY
                local mouseToTeleportBtnDist = math.sqrt(mouseDeltaX4*mouseDeltaX4 + mouseDeltaY4*mouseDeltaY4)
                
                if mouseToTeleportBtnDist <= 10 then
                    teleportCloseBtn.Color = uiColors.red
                    if mouseJustReleased then
                        openTabs.teleports = false
                        updateVisibility()
                        updatePositions()
                    end
                else
                    teleportCloseBtn.Color = uiColors.grey
                end
                
                for locationIndex = 1, #tpButtons do
                    local listOffsetY = 62 + ((locationIndex-1) * 19)
                    if isInRect(mouseX, mouseY, teleportGuiX + 7, teleportGuiY + listOffsetY, 133, 15) then
                        tpButtons[locationIndex].Color = Color3.fromRGB(70, 70, 70)
                        if mouseJustReleased then
                            local teleportPosition = teleportLocations[locationNames[locationIndex]]
                            if teleportPosition then
                                local humanoidRootPart3 = getHRP()
                                if humanoidRootPart3 then
                                    humanoidRootPart3.Position = teleportPosition
                                end
                            end
                        end
                    else
                        tpButtons[locationIndex].Color = uiColors.backgroundAlt
                    end
                end
            end
            
            if openTabs.misc and not isMiscDragging then
                local miscButtonX = miscGuiX + 181
                local miscButtonY = miscGuiY + 22
                local mouseDeltaX5 = mouseX - miscButtonX
                local mouseDeltaY5 = mouseY - miscButtonY
                local mouseToMiscBtnDist = math.sqrt(mouseDeltaX5*mouseDeltaX5 + mouseDeltaY5*mouseDeltaY5)
                
                if mouseToMiscBtnDist <= 10 then
                    miscCloseBtn.Color = uiColors.red
                    if mouseJustReleased then
                        openTabs.misc = false
                        updateVisibility()
                        updatePositions()
                    end
                else
                    miscCloseBtn.Color = uiColors.grey
                end
                
                local rebirthX = miscGuiX + 185
                local rebirthY = miscGuiY + 77
                mouseDeltaX5 = mouseX - rebirthX
                mouseDeltaY5 = mouseY - rebirthY
                mouseToMiscBtnDist = math.sqrt(mouseDeltaX5*mouseDeltaX5 + mouseDeltaY5*mouseDeltaY5)
                
                if mouseToMiscBtnDist <= 10 then
                    autorebirthToggle.Color = toggleStates.autorebirth and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.autorebirth = not toggleStates.autorebirth
                        autoRebirthEnabled = toggleStates.autorebirth
                        updateToggles()
                    end
                else
                    autorebirthToggle.Color = toggleStates.autorebirth and uiColors.green or uiColors.backgroundAlt
                end
                
                local buyButtonX = miscGuiX + 185
                local buyButtonY = miscGuiY + 107
                mouseDeltaX5 = mouseX - buyButtonX
                mouseDeltaY5 = mouseY - buyButtonY
                mouseToMiscBtnDist = math.sqrt(mouseDeltaX5*mouseDeltaX5 + mouseDeltaY5*mouseDeltaY5)
                
                if mouseToMiscBtnDist <= 10 then
                    autobuyToggle.Color = toggleStates.autobuy and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.autobuy = not toggleStates.autobuy
                        autoBuyEnabled = toggleStates.autobuy
                        updateToggles()
                    end
                else
                    autobuyToggle.Color = toggleStates.autobuy and uiColors.green or uiColors.backgroundAlt
                end
                
                local espToggleX = miscGuiX + 185
                local espToggleY = miscGuiY + 167
                mouseDeltaX5 = mouseX - espToggleX
                mouseDeltaY5 = mouseY - espToggleY
                mouseToMiscBtnDist = math.sqrt(mouseDeltaX5*mouseDeltaX5 + mouseDeltaY5*mouseDeltaY5)
                
                if mouseToMiscBtnDist <= 10 then
                    submarineESPToggle.Color = toggleStates.submarineESP and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    if mouseJustReleased then
                        toggleStates.submarineESP = not toggleStates.submarineESP
                        submarineESPEnabled = toggleStates.submarineESP
                        updateToggles()
                    end
                else
                    submarineESPToggle.Color = toggleStates.submarineESP and uiColors.green or uiColors.backgroundAlt

                   local ammoBarX = miscGuiX + 9
                local ammoBarY = miscGuiY + 187
                local ammoBarWidth = 183
                local ammoBarHeight = 20
                
                if isInRect(mouseX, mouseY, ammoBarX, ammoBarY, ammoBarWidth, ammoBarHeight) then
                    infAmmoBg.Color = Color3.fromRGB(70, 70, 70)
                    if mouseJustReleased and not toggleStates.infAmmoApplied then
                        applyInfiniteAmmo()
                        infAmmoText.Text = "Infinite Ammo "
                        infAmmoText.Color = uiColors.green
                    end
                else
                    infAmmoBg.Color = uiColors.backgroundAlt
                end
                end
            end
        end
    end
end)
                 

spawn(function()
    while true do
        wait(0.1)
        if iskeypressed(0x70) then
            isGuiVisible = not isGuiVisible
            updateVisibility()
            if not isGuiVisible and toggleStates.autofarm and not autofarmRunning then
                autofarmActive = true
                autofarmRunning = true
                spawn(function()
                    runAutofarm()
                end)
            elseif isGuiVisible then
                autofarmActive = false
            end
            wait(0.3)
        end
    end
end)

updatePositions()
updateVisibility()
updateToggles()
