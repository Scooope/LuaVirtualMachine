
local a=game.Players.LocalPlayer:GetMouse()


local b=Drawing.new"Square"
b.Visible=true
b.Transparency=1
b.ZIndex=20
b.Color=Color3.fromHex"#121212"
b.Position=Vector2.new(124,128)
b.Size=Vector2.new(570,369)
b.Filled=true


local c=Drawing.new"Square"
c.Visible=true
c.Transparency=1
c.ZIndex=10
c.Color=Color3.fromHex"#121212"
c.Position=b.Position+Vector2.new(0,0)
c.Size=Vector2.new(570,369)
c.Filled=true


local d=Drawing.new"Text"
d.Visible=true
d.Transparency=0.2
d.ZIndex=170
d.Color=Color3.fromHex"#FFFFFF"
d.Position=b.Position+Vector2.new(499,344)
d.Text="ASTRAL"
d.Size=20
d.Center=false
d.Outline=false
d.Font=Drawing.Fonts.System


local e=Drawing.new"Square"
e.Visible=true
e.Transparency=1
e.ZIndex=120
e.Color=Color3.fromHex"#121212"
e.Position=b.Position+Vector2.new(0,0)
e.Size=Vector2.new(570,369)
e.Filled=true




local f=Drawing.new"Square"
f.Visible=true
f.Transparency=1
f.Color=Color3.fromHex"#121212"
f.Filled=true
f.Size=Vector2.new(150,30)
f.Position=Vector2.new(124,128)
f.ZIndex=260
f.Corner=3
local g=Drawing.new"Text"
g.Visible=true
g.Text="ESP"
g.Size=16
g.Outline=true
g.Font=1
g.Color=Color3.fromHex"#9284b3"
g.Position=f.Position+Vector2.new(5,7)
g.ZIndex=262
local h=Drawing.new"Text"
h.Visible=true
h.Text="▼"
h.Size=12.8
h.Outline=true
h.Color=Color3.fromHex"#9284b3"
h.Position=f.Position+Vector2.new(130,7)
h.ZIndex=262
local i={}
local j=Drawing.new"Square"
j.Visible=false
j.Transparency=1
j.Color=Color3.fromHex"#333333"
j.Filled=true
j.Size=Vector2.new(150,30)
j.Position=f.Position+Vector2.new(0,30)
j.ZIndex=265
j.Corner=3
local k=Drawing.new"Text"
k.Visible=false
k.Text="ESP"
k.Size=16
k.Outline=true
k.Font=1
k.Color=Color3.fromHex"#FFFFFF"
k.Position=j.Position+Vector2.new(5,7)
k.ZIndex=266
table.insert(i,{Box=j,Text=k,Value="ESP"})
local l=Drawing.new"Square"
l.Visible=false
l.Transparency=1
l.Color=Color3.fromHex"#333333"
l.Filled=true
l.Size=Vector2.new(150,30)
l.Position=f.Position+Vector2.new(0,60)
l.ZIndex=265
l.Corner=3
local m=Drawing.new"Text"
m.Visible=false
m.Text="Aimbot"
m.Size=16
m.Outline=true
m.Font=1
m.Color=Color3.fromHex"#FFFFFF"
m.Position=l.Position+Vector2.new(5,7)
m.ZIndex=266
table.insert(i,{Box=l,Text=m,Value="Aimbot"})


local n=Drawing.new"Switch"
n.Visible=true
n.Transparency=1
n.ZIndex=80
n.Color=Color3.fromHex"#312a41"
n.Position=c.Position+Vector2.new(32,78)


local o=false
local p=Drawing.new"Square"
p.Visible=true
p.Transparency=1
p.Color=Color3.fromHex"#312a41"
p.Thickness=1
p.Filled=false
p.Size=Vector2.new(20,10)
p.Position=Vector2.new(156,206)
p.ZIndex=80
p.Corner=3
local q=Drawing.new"Square"
q.Visible=true
q.Transparency=1
q.Color=Color3.fromHex"#312a41"
q.Filled=true
q.Size=p.Size
q.Position=p.Position
q.ZIndex=80
q.Corner=3
local r=Drawing.new"Square"
r.Visible=true
r.Transparency=1
r.Color=Color3.fromHex"#312a41"
r.Thickness=1
r.Filled=false
r.Size=Vector2.new(8,8)
r.ZIndex=82
r.Corner=3
local s=Drawing.new"Square"
s.Visible=true
s.Transparency=1
s.Color=Color3.fromHex"#9284b3"
s.Filled=true
s.Size=Vector2.new(8,8)
s.ZIndex=82
s.Corner=3
if o then
r.Position=p.Position+Vector2.new(11,1)
s.Position=p.Position+Vector2.new(11,1)
else
r.Position=p.Position+Vector2.new(1,1)
s.Position=p.Position+Vector2.new(1,1)
end
local t=Drawing.new"Text"
t.Visible=true
t.Text="Aimbot"
t.Size=20
t.Color=Color3.fromHex"#9284b3"
t.Outline=true
t.Font=Drawing.Fonts.UI
t.Position=p.Position+Vector2.new(30,-5)
t.ZIndex=81


local u=Drawing.new"Text"
u.Visible=true
u.Transparency=1
u.ZIndex=50
u.Color=Color3.fromHex"#9284b3"
u.Position=c.Position+Vector2.new(317,78)
u.Text="FOV"
u.Size=14
u.Center=false
u.Outline=true
u.Font=Drawing.Fonts.System




local v=Drawing.new"Square"
v.Visible=true
v.Transparency=1
v.Color=Color3.fromHex"#444444"
v.Filled=true
v.Size=Vector2.new(162,5)
v.Position=Vector2.new(441,226)
v.ZIndex=110
v.Corner=3
local w=50
local x=Drawing.new"Square"
x.Visible=true
x.Transparency=1
x.Color=Color3.fromHex"#9284b3"
x.Filled=true
x.Size=Vector2.new(10,10)
x.Position=v.Position+Vector2.new(76,-2.5)
x.ZIndex=111
x.Corner=100
local y=Drawing.new"Text"
y.Visible=true
y.Text=tostring(math.floor(w))..""
y.Size=16
y.Center=true
y.Outline=true
y.Color=Color3.new(1,1,1)
y.Position=v.Position+Vector2.new(81,-10)
y.ZIndex=112


local z=Drawing.new"Text"
z.Visible=true
z.Transparency=1
z.ZIndex=40
z.Color=Color3.fromHex"#9284b3"
z.Position=c.Position+Vector2.new(316,147)
z.Text="Aimbot Keybind"
z.Size=15
z.Center=false
z.Outline=true
z.Font=Drawing.Fonts.System


local A=Drawing.new"Text"
A.Visible=true
A.Transparency=1
A.ZIndex=60
A.Color=Color3.fromHex"#9284b3"
A.Position=c.Position+Vector2.new(33,51)
A.Text="TOGGLING"
A.Size=12
A.Center=false
A.Outline=true
A.Font=Drawing.Fonts.System


local B=Drawing.new"Square"
B.Visible=true
B.Transparency=1
B.ZIndex=190
B.Color=Color3.fromHex"#121212"
B.Position=b.Position+Vector2.new(551,0)
B.Size=Vector2.new(19,18)
B.Filled=true

local C=Drawing.new"Text"
C.Text="X"
C.Size=16
C.Center=true
C.Outline=true
C.Font=1
C.Color=Color3.fromHex"#f3afaf"
C.Position=B.Position+Vector2.new(9.5,9)
C.Visible=true
C.ZIndex=192


local D=Drawing.new"Square"
D.Visible=true
D.Transparency=1
D.ZIndex=200
D.Color=Color3.fromHex"#121212"
D.Position=b.Position+Vector2.new(527,0)
D.Size=Vector2.new(18,17)
D.Filled=true

local E=Drawing.new"Text"
E.Text="-"
E.Size=17
E.Center=true
E.Outline=true
E.Font=1
E.Color=Color3.fromHex"#ffffff"
E.Position=D.Position+Vector2.new(9,8.5)
E.Visible=true
E.ZIndex=202


local F=Drawing.new"Square"
F.Visible=true
F.Transparency=0.2
F.ZIndex=220
F.Color=Color3.fromHex"#121212"
F.Position=e.Position+Vector2.new(25,42)
F.Size=Vector2.new(218,301)
F.Filled=true


local G=Drawing.new"Square"
G.Visible=true
G.Transparency=0.2
G.ZIndex=221
G.Color=Color3.fromHex"#737373"
G.Filled=false
G.Thickness=1
G.Position=F.Position
G.Size=F.Size


local H=Drawing.new"Square"
H.Visible=true
H.Transparency=0.2
H.ZIndex=230
H.Color=Color3.fromHex"#121212"
H.Position=e.Position+Vector2.new(309,42)
H.Size=Vector2.new(218,301)
H.Filled=true


local I=Drawing.new"Square"
I.Visible=true
I.Transparency=0.2
I.ZIndex=231
I.Color=Color3.fromHex"#737373"
I.Filled=false
I.Thickness=1
I.Position=H.Position
I.Size=H.Size


local J=Drawing.new"Square"
J.Visible=true
J.Transparency=0.2
J.ZIndex=250
J.Color=Color3.fromHex"#121212"
J.Position=c.Position+Vector2.new(309,42)
J.Size=Vector2.new(218,301)
J.Filled=true


local K=Drawing.new"Square"
K.Visible=true
K.Transparency=0.2
K.ZIndex=251
K.Color=Color3.fromHex"#737373"
K.Filled=false
K.Thickness=1
K.Position=J.Position
K.Size=J.Size


local L=Drawing.new"Square"
L.Visible=true
L.Transparency=0.2
L.ZIndex=240
L.Color=Color3.fromHex"#121212"
L.Position=c.Position+Vector2.new(25,42)
L.Size=Vector2.new(218,301)
L.Filled=true


local M=Drawing.new"Square"
M.Visible=true
M.Transparency=0.2
M.ZIndex=241
M.Color=Color3.fromHex"#737373"
M.Filled=false
M.Thickness=1
M.Position=L.Position
M.Size=L.Size


local N=Drawing.new"Text"
N.Visible=true
N.Transparency=1
N.ZIndex=70
N.Color=Color3.fromHex"#9284b3"
N.Position=c.Position+Vector2.new(316,51)
N.Text="MISC"
N.Size=12
N.Center=false
N.Outline=true
N.Font=Drawing.Fonts.System


local O=Drawing.new"Switch"
O.Visible=true
O.Transparency=1
O.ZIndex=100
O.Color=Color3.fromHex"#312a41"
O.Position=c.Position+Vector2.new(317,121)


local P=false
local Q=Drawing.new"Square"
Q.Visible=true
Q.Transparency=1
Q.Color=Color3.fromHex"#312a41"
Q.Thickness=1
Q.Filled=false
Q.Size=Vector2.new(20,10)
Q.Position=Vector2.new(441,249)
Q.ZIndex=100
Q.Corner=3
local R=Drawing.new"Square"
R.Visible=true
R.Transparency=1
R.Color=Color3.fromHex"#312a41"
R.Filled=true
R.Size=Q.Size
R.Position=Q.Position
R.ZIndex=100
R.Corner=3
local S=Drawing.new"Square"
S.Visible=true
S.Transparency=1
S.Color=Color3.fromHex"#312a41"
S.Thickness=1
S.Filled=false
S.Size=Vector2.new(8,8)
S.ZIndex=102
S.Corner=3
local T=Drawing.new"Square"
T.Visible=true
T.Transparency=1
T.Color=Color3.fromHex"#9284b3"
T.Filled=true
T.Size=Vector2.new(8,8)
T.ZIndex=102
T.Corner=3
if P then
S.Position=Q.Position+Vector2.new(11,1)
T.Position=Q.Position+Vector2.new(11,1)
else
S.Position=Q.Position+Vector2.new(1,1)
T.Position=Q.Position+Vector2.new(1,1)
end
local U=Drawing.new"Text"
U.Visible=true
U.Text="Always On"
U.Size=20
U.Color=Color3.fromHex"#9284b3"
U.Outline=true
U.Font=Drawing.Fonts.UI
U.Position=Q.Position+Vector2.new(30,-5)
U.ZIndex=101


local V=Drawing.new"Switch"
V.Visible=true
V.Transparency=1
V.ZIndex=90
V.Color=Color3.fromHex"#312a41"
V.Position=c.Position+Vector2.new(33,103)


local W=false
local X=Drawing.new"Square"
X.Visible=true
X.Transparency=1
X.Color=Color3.fromHex"#312a41"
X.Thickness=1
X.Filled=false
X.Size=Vector2.new(20,10)
X.Position=Vector2.new(157,231)
X.ZIndex=90
X.Corner=3
local Y=Drawing.new"Square"
Y.Visible=true
Y.Transparency=1
Y.Color=Color3.fromHex"#312a41"
Y.Filled=true
Y.Size=X.Size
Y.Position=X.Position
Y.ZIndex=90
Y.Corner=3
local Z=Drawing.new"Square"
Z.Visible=true
Z.Transparency=1
Z.Color=Color3.fromHex"#312a41"
Z.Thickness=1
Z.Filled=false
Z.Size=Vector2.new(8,8)
Z.ZIndex=92
Z.Corner=3
local _=Drawing.new"Square"
_.Visible=true
_.Transparency=1
_.Color=Color3.fromHex"#9284b3"
_.Filled=true
_.Size=Vector2.new(8,8)
_.ZIndex=92
_.Corner=3
if W then
Z.Position=X.Position+Vector2.new(11,1)
_.Position=X.Position+Vector2.new(11,1)
else
Z.Position=X.Position+Vector2.new(1,1)
_.Position=X.Position+Vector2.new(1,1)
end
local aa=Drawing.new"Text"
aa.Visible=true
aa.Text="AimbotFOV"
aa.Size=20
aa.Color=Color3.fromHex"#9284b3"
aa.Outline=true
aa.Font=Drawing.Fonts.UI
aa.Position=X.Position+Vector2.new(30,-5)
aa.ZIndex=91




local ab=Drawing.new"Square"
ab.Visible=true
ab.Transparency=1
ab.Color=Color3.fromHex"#121212"
ab.Filled=true
ab.Size=Vector2.new(91,10)
ab.Position=Vector2.new(542,278)
ab.ZIndex=30
ab.Corner=3
local ac=Drawing.new"Text"
ac.Text="[ RightMouse ]"
ac.Size=13
ac.Center=true
ac.Outline=true
ac.Font=1
ac.Color=Color3.fromHex"#9284b3"
ac.Position=ab.Position+Vector2.new(45.5,5)
ac.Visible=true
ac.ZIndex=32
local ad=0x2
local ae=false


local af=Drawing.new"Switch"
af.Visible=true
af.Transparency=1
af.ZIndex=160
af.Color=Color3.fromHex"#312a41"
af.Position=e.Position+Vector2.new(317,78)


local ag=false
local ah=Drawing.new"Square"
ah.Visible=true
ah.Transparency=1
ah.Color=Color3.fromHex"#312a41"
ah.Thickness=1
ah.Filled=false
ah.Size=Vector2.new(20,10)
ah.Position=Vector2.new(441,206)
ah.ZIndex=160
ah.Corner=3
local ai=Drawing.new"Square"
ai.Visible=true
ai.Transparency=1
ai.Color=Color3.fromHex"#312a41"
ai.Filled=true
ai.Size=ah.Size
ai.Position=ah.Position
ai.ZIndex=160
ai.Corner=3
local aj=Drawing.new"Square"
aj.Visible=true
aj.Transparency=1
aj.Color=Color3.fromHex"#312a41"
aj.Thickness=1
aj.Filled=false
aj.Size=Vector2.new(8,8)
aj.ZIndex=162
aj.Corner=3
local ak=Drawing.new"Square"
ak.Visible=true
ak.Transparency=1
ak.Color=Color3.fromHex"#9284b3"
ak.Filled=true
ak.Size=Vector2.new(8,8)
ak.ZIndex=162
ak.Corner=3
if ag then
aj.Position=ah.Position+Vector2.new(11,1)
ak.Position=ah.Position+Vector2.new(11,1)
else
aj.Position=ah.Position+Vector2.new(1,1)
ak.Position=ah.Position+Vector2.new(1,1)
end
local al=Drawing.new"Text"
al.Visible=true
al.Text="Teamcheck"
al.Size=20
al.Color=Color3.fromHex"#9284b3"
al.Outline=true
al.Font=Drawing.Fonts.UI
al.Position=ah.Position+Vector2.new(30,-5)
al.ZIndex=161


local am=Drawing.new"Switch"
am.Visible=true
am.Transparency=1
am.ZIndex=150
am.Color=Color3.fromHex"#312a41"
am.Position=e.Position+Vector2.new(32,78)


local an=false
local ao=Drawing.new"Square"
ao.Visible=true
ao.Transparency=1
ao.Color=Color3.fromHex"#312a41"
ao.Thickness=1
ao.Filled=false
ao.Size=Vector2.new(20,10)
ao.Position=Vector2.new(156,206)
ao.ZIndex=150
ao.Corner=3
local ap=Drawing.new"Square"
ap.Visible=true
ap.Transparency=1
ap.Color=Color3.fromHex"#312a41"
ap.Filled=true
ap.Size=ao.Size
ap.Position=ao.Position
ap.ZIndex=150
ap.Corner=3
local aq=Drawing.new"Square"
aq.Visible=true
aq.Transparency=1
aq.Color=Color3.fromHex"#312a41"
aq.Thickness=1
aq.Filled=false
aq.Size=Vector2.new(8,8)
aq.ZIndex=152
aq.Corner=3
local ar=Drawing.new"Square"
ar.Visible=true
ar.Transparency=1
ar.Color=Color3.fromHex"#9284b3"
ar.Filled=true
ar.Size=Vector2.new(8,8)
ar.ZIndex=152
ar.Corner=3
if an then
aq.Position=ao.Position+Vector2.new(11,1)
ar.Position=ao.Position+Vector2.new(11,1)
else
aq.Position=ao.Position+Vector2.new(1,1)
ar.Position=ao.Position+Vector2.new(1,1)
end
local as=Drawing.new"Text"
as.Visible=true
as.Text="ESP"
as.Size=20
as.Color=Color3.fromHex"#9284b3"
as.Outline=true
as.Font=Drawing.Fonts.UI
as.Position=ao.Position+Vector2.new(30,-5)
as.ZIndex=151


local at=Drawing.new"Text"
at.Visible=true
at.Transparency=1
at.ZIndex=140
at.Color=Color3.fromHex"#9284b3"
at.Position=e.Position+Vector2.new(316,51)
at.Text="MISC"
at.Size=12
at.Center=false
at.Outline=true
at.Font=Drawing.Fonts.System


local au=Drawing.new"Text"
au.Visible=true
au.Transparency=1
au.ZIndex=130
au.Color=Color3.fromHex"#9284b3"
au.Position=e.Position+Vector2.new(33,51)
au.Text="TOGGLING"
au.Size=12
au.Center=false
au.Outline=true
au.Font=Drawing.Fonts.System




local av=Drawing.new"Square"
av.Visible=true
av.Transparency=1
av.Color=Color3.fromHex"#121212"
av.Filled=true
av.Size=Vector2.new(104,25)
av.Position=Vector2.new(519,128)
av.ZIndex=210
local aw=Drawing.new"Text"
aw.Text="[ F2 ]"
aw.Size=15
aw.Center=true
aw.Outline=true
aw.Font=1
aw.Color=Color3.fromHex"#9284b3"
aw.Position=av.Position+Vector2.new(52,12.5)
aw.Visible=true
aw.ZIndex=212
local ax=0x71
local ay=false


local az=Drawing.new"Text"
az.Visible=true
az.Transparency=1
az.ZIndex=180
az.Color=Color3.fromHex"#9284b3"
az.Position=b.Position+Vector2.new(309,3)
az.Text="Hide/Show:"
az.Size=17
az.Center=false
az.Outline=true
az.Font=Drawing.Fonts.System

local aA={
[48]="0",
[49]="1",
[50]="2",
[51]="3",
[52]="4",
[53]="5",
[54]="6",
[55]="7",
[56]="8",
[57]="9",
[1]="LeftMouse",
[2]="RightMouse",
[4]="MiddleMouse",
[8]="Backspace",
[9]="Tab",
[13]="Enter",
[16]="Shift",
[17]="Ctrl",
[18]="Alt",
[19]="Pause",
[20]="CapsLock",
[27]="Esc",
[32]="Space",
[33]="PageUp",
[34]="PageDown",
[35]="End",
[36]="Home",
[37]="Left",
[38]="Up",
[39]="Right",
[40]="Down",
[45]="Insert",
[46]="Delete",
[65]="A",
[66]="B",
[67]="C",
[68]="D",
[69]="E",
[70]="F",
[71]="G",
[72]="H",
[73]="I",
[74]="J",
[75]="K",
[76]="L",
[77]="M",
[78]="N",
[79]="O",
[80]="P",
[81]="Q",
[82]="R",
[83]="S",
[84]="T",
[85]="U",
[86]="V",
[87]="W",
[88]="X",
[89]="Y",
[90]="Z",
[112]="F1",
[113]="F2",
[114]="F3",
[115]="F4",
[116]="F5",
[117]="F6",
[118]="F7",
[119]="F8",
[120]="F9",
[121]="F10",
[122]="F11",
[123]="F12",
}



local aB=Drawing.new"Square"
aB.Visible=false
aB.Size=Vector2.new(50,50)
aB.Position=Vector2.new(50,50)
aB.Color=Color3.fromHex"#121212"
aB.Filled=true
local aC=Drawing.new"Text"
aC.Visible=false
aC.Text="Open"
aC.Size=20
aC.Center=true
aC.Outline=true
aC.Color=Color3.fromHex"#9284b3"
aC.Position=aB.Position+Vector2.new(25,15)
aC.ZIndex=aB.ZIndex+1



local function Tab_Aimbot_SetVisible(aD)
if c then c.Visible=aD end
if p then
p.Visible=aD
p.Visible=aD
if q then q.Visible=aD end
if r then r.Visible=aD end
if s then s.Visible=aD end
if t then t.Visible=aD end
end
if u then
u.Visible=aD
end
if v then
v.Visible=aD
if x then x.Visible=aD end
if y then y.Visible=aD end
end
if z then
z.Visible=aD
end
if A then
A.Visible=aD
end
if J then
J.Visible=aD
if K then K.Visible=aD end
end
if L then
L.Visible=aD
if M then M.Visible=aD end
end
if N then
N.Visible=aD
end
if Q then
Q.Visible=aD
Q.Visible=aD
if R then R.Visible=aD end
if S then S.Visible=aD end
if T then T.Visible=aD end
if U then U.Visible=aD end
end
if X then
X.Visible=aD
X.Visible=aD
if Y then Y.Visible=aD end
if Z then Z.Visible=aD end
if _ then _.Visible=aD end
if aa then aa.Visible=aD end
end
if ab then
ab.Visible=aD
if ac then ac.Visible=aD end
end
end

local function Tab_ESP_SetVisible(aD)
if e then e.Visible=aD end
if F then
F.Visible=aD
if G then G.Visible=aD end
end
if H then
H.Visible=aD
if I then I.Visible=aD end
end
if ah then
ah.Visible=aD
ah.Visible=aD
if ai then ai.Visible=aD end
if aj then aj.Visible=aD end
if ak then ak.Visible=aD end
if al then al.Visible=aD end
end
if ao then
ao.Visible=aD
ao.Visible=aD
if ap then ap.Visible=aD end
if aq then aq.Visible=aD end
if ar then ar.Visible=aD end
if as then as.Visible=aD end
end
if at then
at.Visible=aD
end
if au then
au.Visible=aD
end
end


local aD
local aE
local aF

local aG=false

while true do
wait(0.01)
if isrbxactive()then
local aH=ismouse1pressed()
local aI=Vector2.new(a.X,a.Y)


if ae then
for aJ=1,255 do
if iskeypressed(aJ)and not ismouse1pressed()then
ad=aJ
ae=false
local aK=aA[aJ]or"Unknown"
ac.Text="[ "..aK.." ]"
ac.Color=Color3.fromHex"#9284b3"
pcall(function()onKeyChanged(aJ)end)
wait(0.2)
break
end
end
else
if iskeypressed(ad)then

pcall(function()AimActivated()end)
wait(0.2)
end
end
if ay then
for aJ=1,255 do
if iskeypressed(aJ)and not ismouse1pressed()then
ax=aJ
ay=false
local aK=aA[aJ]or"Unknown"
aw.Text="[ "..aK.." ]"
aw.Color=Color3.fromHex"#9284b3"
pcall(function()onKeyChanged(aJ)end)
wait(0.2)
break
end
end
else
if iskeypressed(ax)then

if aB.Visible then
c.Visible=true
d.Visible=true
e.Visible=true
f.Visible=true
g.Visible=true
h.Visible=true
b.Visible=true
p.Visible=true
p.Visible=true
q.Visible=true
r.Visible=true
s.Visible=true
t.Visible=true
u.Visible=true
v.Visible=true
x.Visible=true
y.Visible=true
z.Visible=true
A.Visible=true
B.Visible=true
C.Visible=true
D.Visible=true
E.Visible=true
F.Visible=true
G.Visible=true
H.Visible=true
I.Visible=true
J.Visible=true
K.Visible=true
L.Visible=true
M.Visible=true
N.Visible=true
Q.Visible=true
Q.Visible=true
R.Visible=true
S.Visible=true
T.Visible=true
U.Visible=true
X.Visible=true
X.Visible=true
Y.Visible=true
Z.Visible=true
_.Visible=true
aa.Visible=true
ab.Visible=true
ac.Visible=true
ah.Visible=true
ah.Visible=true
ai.Visible=true
aj.Visible=true
ak.Visible=true
al.Visible=true
ao.Visible=true
ao.Visible=true
ap.Visible=true
aq.Visible=true
ar.Visible=true
as.Visible=true
at.Visible=true
au.Visible=true
av.Visible=true
aw.Visible=true
az.Visible=true
aB.Visible=false
aC.Visible=false
else
c.Visible=false
d.Visible=false
e.Visible=false
f.Visible=false
g.Visible=false
h.Visible=false
for aJ,aK in ipairs(i)do
aK.Box.Visible=false
aK.Text.Visible=false
end
b.Visible=false
p.Visible=false
q.Visible=false
r.Visible=false
s.Visible=false
t.Visible=false
u.Visible=false
v.Visible=false
x.Visible=false
y.Visible=false
z.Visible=false
A.Visible=false
B.Visible=false
C.Visible=false
D.Visible=false
E.Visible=false
F.Visible=false
G.Visible=false
H.Visible=false
I.Visible=false
J.Visible=false
K.Visible=false
L.Visible=false
M.Visible=false
N.Visible=false
Q.Visible=false
R.Visible=false
S.Visible=false
T.Visible=false
U.Visible=false
X.Visible=false
Y.Visible=false
Z.Visible=false
_.Visible=false
aa.Visible=false
ab.Visible=false
ac.Visible=false
ah.Visible=false
ai.Visible=false
aj.Visible=false
ak.Visible=false
al.Visible=false
ao.Visible=false
ap.Visible=false
aq.Visible=false
ar.Visible=false
as.Visible=false
at.Visible=false
au.Visible=false
av.Visible=false
aw.Visible=false
az.Visible=false
aB.Visible=true
aC.Visible=true
end
wait(0.2)
end
end


if aH and not aG then
if aB.Visible and aI.X>=aB.Position.X and aI.X<=aB.Position.X+aB.Size.X and
aI.Y>=aB.Position.Y and aI.Y<=aB.Position.Y+aB.Size.Y then

c.Visible=true
d.Visible=true
e.Visible=true
f.Visible=true
g.Visible=true
h.Visible=true
b.Visible=true
p.Visible=true
p.Visible=true
q.Visible=true
r.Visible=true
s.Visible=true
t.Visible=true
u.Visible=true
v.Visible=true
x.Visible=true
y.Visible=true
z.Visible=true
A.Visible=true
B.Visible=true
C.Visible=true
D.Visible=true
E.Visible=true
F.Visible=true
G.Visible=true
H.Visible=true
I.Visible=true
J.Visible=true
K.Visible=true
L.Visible=true
M.Visible=true
N.Visible=true
Q.Visible=true
Q.Visible=true
R.Visible=true
S.Visible=true
T.Visible=true
U.Visible=true
X.Visible=true
X.Visible=true
Y.Visible=true
Z.Visible=true
_.Visible=true
aa.Visible=true
ab.Visible=true
ac.Visible=true
ah.Visible=true
ah.Visible=true
ai.Visible=true
aj.Visible=true
ak.Visible=true
al.Visible=true
ao.Visible=true
ao.Visible=true
ap.Visible=true
aq.Visible=true
ar.Visible=true
as.Visible=true
at.Visible=true
au.Visible=true
av.Visible=true
aw.Visible=true
az.Visible=true
aB.Visible=false
aC.Visible=false
end

if f.Visible and aI.X>=f.Position.X and aI.X<=f.Position.X+f.Size.X and
aI.Y>=f.Position.Y and aI.Y<=f.Position.Y+f.Size.Y then
pcall(function()onChanged()end)

local aJ=i[1].Box.Visible
for aK,aL in ipairs(i)do
aL.Box.Visible=not aJ
aL.Text.Visible=not aJ
end
end

if i[1].Box.Visible then
for aJ,aK in ipairs(i)do
if aI.X>=aK.Box.Position.X and aI.X<=aK.Box.Position.X+aK.Box.Size.X and
aI.Y>=aK.Box.Position.Y and aI.Y<=aK.Box.Position.Y+aK.Box.Size.Y then
g.Text=aK.Value

for aL,aM in ipairs(i)do
aM.Box.Visible=false
aM.Text.Visible=false
end
if onChanged then pcall(function()onChanged(aK.Value)end)end
if aK.Value=="ESP"then
pcall(function()Tab_ESP_SetVisible(true)end)
else
pcall(function()Tab_ESP_SetVisible(false)end)
end
if aK.Value=="Aimbot"then
pcall(function()Tab_Aimbot_SetVisible(true)end)
else
pcall(function()Tab_Aimbot_SetVisible(false)end)
end
end
end
end

if t.Visible and aI.X>=p.Position.X and aI.X<=p.Position.X+p.Size.X and
aI.Y>=p.Position.Y and aI.Y<=p.Position.Y+p.Size.Y then

o=not o
if o then
r.Position=p.Position+Vector2.new(11,1)
s.Position=p.Position+Vector2.new(11,1)
else
r.Position=p.Position+Vector2.new(1,1)
s.Position=p.Position+Vector2.new(1,1)
end
if onSwitch then pcall(function()onSwitch(o)end)end
end

if B.Visible and aI.X>=B.Position.X and aI.X<=B.Position.X+B.Size.X and
aI.Y>=B.Position.Y and aI.Y<=B.Position.Y+B.Size.Y then

c:Remove()
d:Remove()
e:Remove()
f:Remove()
g:Remove()
h:Remove()
for aJ,aK in ipairs(i)do
aK.Box:Remove()
aK.Text:Remove()
end
b:Remove()
p:Remove()
q:Remove()
r:Remove()
s:Remove()
t:Remove()
u:Remove()
v:Remove()
x:Remove()
y:Remove()
z:Remove()
A:Remove()
B:Remove()
C:Remove()
D:Remove()
E:Remove()
F:Remove()
G:Remove()
H:Remove()
I:Remove()
J:Remove()
K:Remove()
L:Remove()
M:Remove()
N:Remove()
Q:Remove()
R:Remove()
S:Remove()
T:Remove()
U:Remove()
X:Remove()
Y:Remove()
Z:Remove()
_:Remove()
aa:Remove()
ab:Remove()
ac:Remove()
ah:Remove()
ai:Remove()
aj:Remove()
ak:Remove()
al:Remove()
ao:Remove()
ap:Remove()
aq:Remove()
ar:Remove()
as:Remove()
at:Remove()
au:Remove()
av:Remove()
aw:Remove()
az:Remove()
aB:Remove()
aC:Remove()
return
end

if D.Visible and aI.X>=D.Position.X and aI.X<=D.Position.X+D.Size.X and
aI.Y>=D.Position.Y and aI.Y<=D.Position.Y+D.Size.Y then

c.Visible=false
d.Visible=false
e.Visible=false
f.Visible=false
g.Visible=false
h.Visible=false
for aJ,aK in ipairs(i)do
aK.Box.Visible=false
aK.Text.Visible=false
end
b.Visible=false
p.Visible=false
q.Visible=false
r.Visible=false
s.Visible=false
t.Visible=false
u.Visible=false
v.Visible=false
x.Visible=false
y.Visible=false
z.Visible=false
A.Visible=false
B.Visible=false
C.Visible=false
D.Visible=false
E.Visible=false
F.Visible=false
G.Visible=false
H.Visible=false
I.Visible=false
J.Visible=false
K.Visible=false
L.Visible=false
M.Visible=false
N.Visible=false
Q.Visible=false
R.Visible=false
S.Visible=false
T.Visible=false
U.Visible=false
X.Visible=false
Y.Visible=false
Z.Visible=false
_.Visible=false
aa.Visible=false
ab.Visible=false
ac.Visible=false
ah.Visible=false
ai.Visible=false
aj.Visible=false
ak.Visible=false
al.Visible=false
ao.Visible=false
ap.Visible=false
aq.Visible=false
ar.Visible=false
as.Visible=false
at.Visible=false
au.Visible=false
av.Visible=false
aw.Visible=false
az.Visible=false
aB.Visible=true
aC.Visible=true
end

if U.Visible and aI.X>=Q.Position.X and aI.X<=Q.Position.X+Q.Size.X and
aI.Y>=Q.Position.Y and aI.Y<=Q.Position.Y+Q.Size.Y then

P=not P
if P then
S.Position=Q.Position+Vector2.new(11,1)
T.Position=Q.Position+Vector2.new(11,1)
else
S.Position=Q.Position+Vector2.new(1,1)
T.Position=Q.Position+Vector2.new(1,1)
end
if onSwitch then pcall(function()onSwitch(P)end)end
end

if aa.Visible and aI.X>=X.Position.X and aI.X<=X.Position.X+X.Size.X and
aI.Y>=X.Position.Y and aI.Y<=X.Position.Y+X.Size.Y then

W=not W
if W then
Z.Position=X.Position+Vector2.new(11,1)
_.Position=X.Position+Vector2.new(11,1)
else
Z.Position=X.Position+Vector2.new(1,1)
_.Position=X.Position+Vector2.new(1,1)
end
if onSwitch then pcall(function()onSwitch(W)end)end
end

if ab.Visible and aI.X>=ab.Position.X and aI.X<=ab.Position.X+ab.Size.X and
aI.Y>=ab.Position.Y and aI.Y<=ab.Position.Y+ab.Size.Y then
pcall(function()onKeyChanged()end)

ae=true
ac.Text="..."
ac.Color=Color3.fromHex"#FFFF00"
end

if al.Visible and aI.X>=ah.Position.X and aI.X<=ah.Position.X+ah.Size.X and
aI.Y>=ah.Position.Y and aI.Y<=ah.Position.Y+ah.Size.Y then

ag=not ag
if ag then
aj.Position=ah.Position+Vector2.new(11,1)
ak.Position=ah.Position+Vector2.new(11,1)
else
aj.Position=ah.Position+Vector2.new(1,1)
ak.Position=ah.Position+Vector2.new(1,1)
end
if onSwitch then pcall(function()onSwitch(ag)end)end
end

if as.Visible and aI.X>=ao.Position.X and aI.X<=ao.Position.X+ao.Size.X and
aI.Y>=ao.Position.Y and aI.Y<=ao.Position.Y+ao.Size.Y then

an=not an
if an then
aq.Position=ao.Position+Vector2.new(11,1)
ar.Position=ao.Position+Vector2.new(11,1)
else
aq.Position=ao.Position+Vector2.new(1,1)
ar.Position=ao.Position+Vector2.new(1,1)
end
if onSwitch then pcall(function()onSwitch(an)end)end
end

if av.Visible and aI.X>=av.Position.X and aI.X<=av.Position.X+av.Size.X and
aI.Y>=av.Position.Y and aI.Y<=av.Position.Y+av.Size.Y then
pcall(function()onKeyChanged()end)

ay=true
aw.Text="..."
aw.Color=Color3.fromHex"#FFFF00"
end

if b.Visible and aI.X>=b.Position.X and aI.X<=b.Position.X+b.Size.X and
aI.Y>=b.Position.Y and aI.Y<=b.Position.Y+b.Size.Y then
aD=b
aE=aI
aF=b.Position
end

if x.Visible and aI.X>=x.Position.X and aI.X<=x.Position.X+x.Size.X and
aI.Y>=x.Position.Y and aI.Y<=x.Position.Y+x.Size.Y then
aD=x
aE=aI
aF=x.Position
end
end


if not aH and aG then
aD=nil
end


if aD and aH then
local aJ=aI-aE
aD.Position=aF+aJ
if aD==x then

local aK=v.Position.X
local aL=v.Position.X+v.Size.X
if aD.Position.X<aK then aD.Position=Vector2.new(aK,aD.Position.Y)end
if aD.Position.X>aL then aD.Position=Vector2.new(aL,aD.Position.Y)end
aD.Position=Vector2.new(aD.Position.X,v.Position.Y+2.5-aD.Size.Y/2)

local aM=(aD.Position.X-aK)/(v.Size.X)
local aN=0+(100)*aM
w=aN
y.Text=tostring(math.floor(aN))..""
pcall(function()onChanged(aN)end)
end
if aD==b then
c.Position=aD.Position+Vector2.new(0,0)
p.Position=aD.Position+Vector2.new(32,78)
q.Position=p.Position
t.Position=p.Position+Vector2.new(30,-5)
if o then
r.Position=p.Position+Vector2.new(11,1)
s.Position=p.Position+Vector2.new(11,1)
else
r.Position=p.Position+Vector2.new(1,1)
s.Position=p.Position+Vector2.new(1,1)
end
u.Position=aD.Position+Vector2.new(317,78)
v.Position=aD.Position+Vector2.new(317,98)
local aK=(w-0)/(100)
x.Position=v.Position+Vector2.new(162*aK-5,-2.5)
y.Position=v.Position+Vector2.new(81,-10)
z.Position=aD.Position+Vector2.new(316,147)
A.Position=aD.Position+Vector2.new(33,51)
J.Position=aD.Position+Vector2.new(309,42)
K.Position=J.Position
L.Position=aD.Position+Vector2.new(25,42)
M.Position=L.Position
N.Position=aD.Position+Vector2.new(316,51)
Q.Position=aD.Position+Vector2.new(317,121)
R.Position=Q.Position
U.Position=Q.Position+Vector2.new(30,-5)
if P then
S.Position=Q.Position+Vector2.new(11,1)
T.Position=Q.Position+Vector2.new(11,1)
else
S.Position=Q.Position+Vector2.new(1,1)
T.Position=Q.Position+Vector2.new(1,1)
end
X.Position=aD.Position+Vector2.new(33,103)
Y.Position=X.Position
aa.Position=X.Position+Vector2.new(30,-5)
if W then
Z.Position=X.Position+Vector2.new(11,1)
_.Position=X.Position+Vector2.new(11,1)
else
Z.Position=X.Position+Vector2.new(1,1)
_.Position=X.Position+Vector2.new(1,1)
end
ab.Position=aD.Position+Vector2.new(418,150)
ac.Position=ab.Position+Vector2.new(45.5,5)
d.Position=aD.Position+Vector2.new(499,344)
e.Position=aD.Position+Vector2.new(0,0)
F.Position=aD.Position+Vector2.new(25,42)
G.Position=F.Position
H.Position=aD.Position+Vector2.new(309,42)
I.Position=H.Position
ah.Position=aD.Position+Vector2.new(317,78)
ai.Position=ah.Position
al.Position=ah.Position+Vector2.new(30,-5)
if ag then
aj.Position=ah.Position+Vector2.new(11,1)
ak.Position=ah.Position+Vector2.new(11,1)
else
aj.Position=ah.Position+Vector2.new(1,1)
ak.Position=ah.Position+Vector2.new(1,1)
end
ao.Position=aD.Position+Vector2.new(32,78)
ap.Position=ao.Position
as.Position=ao.Position+Vector2.new(30,-5)
if an then
aq.Position=ao.Position+Vector2.new(11,1)
ar.Position=ao.Position+Vector2.new(11,1)
else
aq.Position=ao.Position+Vector2.new(1,1)
ar.Position=ao.Position+Vector2.new(1,1)
end
at.Position=aD.Position+Vector2.new(316,51)
au.Position=aD.Position+Vector2.new(33,51)
f.Position=aD.Position+Vector2.new(0,0)
g.Position=f.Position+Vector2.new(5,7)
h.Position=f.Position+Vector2.new(130,7)
for aL,aM in ipairs(i)do
aM.Box.Position=f.Position+Vector2.new(0,30*aL)
aM.Text.Position=aM.Box.Position+Vector2.new(5,7)
end
B.Position=aD.Position+Vector2.new(551,0)
C.Position=B.Position+Vector2.new(9.5,9)
D.Position=aD.Position+Vector2.new(527,0)
E.Position=D.Position+Vector2.new(9,8.5)
av.Position=aD.Position+Vector2.new(395,0)
aw.Position=av.Position+Vector2.new(52,12.5)
az.Position=aD.Position+Vector2.new(309,3)
end
end

aG=aH
end
end
