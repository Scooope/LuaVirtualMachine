


local a=game:GetService"Players"
local b=game:GetService"RunService"

local c=a.LocalPlayer
local d={}

local e={
BoxColor=Color3.fromRGB(255,0,0),
OutlineColor=Color3.fromRGB(0,0,0),
BoxThickness=1.5,
OutlineThickness=3,
ShowBox=true,
MaxDistance=1000,
}


local f
if typeof(WorldToScreen)=="function"then
f=WorldToScreen
elseif typeof(worldtoscreen)=="function"then
f=worldtoscreen
else
f=function(g)
local h=workspace.CurrentCamera
if not h then return Vector2.new(0,0),false,-1 end
local i,j=h:WorldToViewportPoint(g)
return Vector2.new(i.X,i.Y),j,i.Z
end
end

local function toScreen(g)
local h={f(g)}
local i,j,k=h[1],h[2],h[3]
if typeof(i)=="Vector3"then
return Vector2.new(i.X,i.Y),(j~=false),i.Z
elseif typeof(i)=="Vector2"then
return i,(j~=false),(k or 1)
elseif type(i)=="number"then
return Vector2.new(i,j),true,(k or 1)
end
return Vector2.new(0,0),false,-1
end

local function createESPBox()
local g={
Outline=Drawing.new"Square",
Fill=Drawing.new"Square",
}

g.Outline.Visible=false
g.Outline.Color=e.OutlineColor
g.Outline.Thickness=e.OutlineThickness
g.Outline.Filled=false
g.Outline.ZIndex=1

g.Fill.Visible=false
g.Fill.Color=e.BoxColor
g.Fill.Thickness=e.BoxThickness
g.Fill.Filled=false
g.Fill.ZIndex=2

return g
end

local function removeESPBox(g)
if d[g]then
d[g].Outline:Remove()
d[g].Fill:Remove()
d[g]=nil
end
end

local function addPlayer(g)
if g==c then return end
d[g]=createESPBox()
end



local function getCharacterBounds(g)
local h=g:FindFirstChild"HumanoidRootPart"
local i=g:FindFirstChildOfClass"Humanoid"

if not h or not i or i.Health<=0 then
return nil
end

local j=h.Position
local k=5.0


local l=Vector3.new(j.X,j.Y+k/2,j.Z)
local m=Vector3.new(j.X,j.Y-k/2,j.Z)

local n,o,p=toScreen(l)
local q,r,s=toScreen(m)


if not o or not r then return nil end
if p<=0 or s<=0 then return nil end

local t=math.abs(q.Y-n.Y)
if t<=0 then return nil end


local u=t*0.5

local v=(n.X+q.X)/2
local w=math.min(n.Y,q.Y)

return{
X=v-u/2,
Y=w,
Width=u,
Height=t,
}
end

b.RenderStepped:Connect(function()
for g,h in pairs(d)do
if not g or not g.Parent then
removeESPBox(g)
continue
end

local i=g.Character
if not i then
h.Outline.Visible=false
h.Fill.Visible=false
continue
end

local j=i:FindFirstChild"HumanoidRootPart"
local k=i:FindFirstChildOfClass"Humanoid"

if not j or not k or k.Health<=0 then
h.Outline.Visible=false
h.Fill.Visible=false
continue
end

local l=c.Character
local m=l and l:FindFirstChild"HumanoidRootPart"
if m then
local n=(j.Position-m.Position).Magnitude
if n>e.MaxDistance then
h.Outline.Visible=false
h.Fill.Visible=false
continue
end
end

local n=getCharacterBounds(i)

if n and n.Width>0 and n.Height>0 then
h.Outline.Position=Vector2.new(n.X,n.Y)
h.Outline.Size=Vector2.new(n.Width,n.Height)
h.Outline.Visible=e.ShowBox

h.Fill.Position=Vector2.new(n.X,n.Y)
h.Fill.Size=Vector2.new(n.Width,n.Height)
h.Fill.Visible=e.ShowBox
else
h.Outline.Visible=false
h.Fill.Visible=false
end
end
end)

for g,h in ipairs(a:GetPlayers())do
addPlayer(h)
end

a.PlayerAdded:Connect(addPlayer)

a.PlayerRemoving:Connect(function(g)
removeESPBox(g)
end)

print("[ESP] 2D Box ESP loaded. Tracking "..#a:GetPlayers()-1 .." player(s).")
