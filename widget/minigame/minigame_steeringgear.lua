Panel_SteeringWheel:SetShow(false, false)
local MGKT = CppEnums.MiniGameKeyType
local purposeText = UI.getChildControl(Panel_SteeringWheel, "StaticText_Purpose")
local _LButton_L = UI.getChildControl(Panel_SteeringWheel, "Static_L_Btn_L")
local _RButton_R = UI.getChildControl(Panel_SteeringWheel, "Static_R_Btn_R")
local _marble = UI.getChildControl(Panel_SteeringWheel, "Static_Marble")
local _fontGood = UI.getChildControl(Panel_SteeringWheel, "Static_Result_Good")
local _fontBad = UI.getChildControl(Panel_SteeringWheel, "Static_Result_Bad")
local _math_random = math.random
local _math_randomseed = math.randomseed
local _math_lerp = Util.Math.Lerp
local ClickDirection = {
  None = 0,
  Left = -1,
  Right = 1,
  baseX = 141,
  baseY = 154,
  startX = 40,
  startY = 66
}
local vector = 1
local speed = 0,5
local isSteering = false
local deltaTime = 0
local isSuccess = true
function MiniGame_SteeringWhellMoveCalc(fDeltaTime)
  if not isSteering then
    return
  end
  deltaTime = deltaTime + fDeltaTime
  if deltaTime < 3 then
    purposeText:SetText("ì´ìƒê¸°ë¥˜ë¥¼ ë§Œë‚¬ìŠµë‹ˆë‹¤. ì„œë‘˜ëŸ¬ ì¡°íƒ€ë¥œì„ ì¡ì•„ì£¼ì„¸ìš”!(" .. math.ceil(3 - deltaTime) .. " ì´ˆ)")
    return
  end
  if ClickDirection.startX < 38 or ClickDirection.startX > 243 then
    purposeText:SetText("ì‹¤íŒ¨")
    isSteering = false
    isSuccess = false
    return
  end
  if deltaTime > 8 and isSuccess then
    purposeText:SetText("ì´ìƒê¸°ë¥˜ë¥¼ ë¬´ì‚¬íˆ í—¤ì³ë‚˜ê°”ìŠµë‹ˆë‹¤.")
    if deltaTime > 9,1 then
      isSteering = false
    end
    return
  end
  speed = speed * 1,01
  purposeText:SetText("ì‹œì‘")
  local posX = (ClickDirection.startX - ClickDirection.baseX) * math.cos(fDeltaTime * vector * speed) - (ClickDirection.startY - ClickDirection.baseY) * math.sin(fDeltaTime * vector * speed) + ClickDirection.baseX
  local posY = (ClickDirection.startX - ClickDirection.baseX) * math.sin(fDeltaTime * vector * speed) + (ClickDirection.startY - ClickDirection.baseY) * math.cos(fDeltaTime * vector * speed) + ClickDirection.baseY
  ClickDirection.startX = posX
  ClickDirection.startY = posY
  _marble:SetPosX(ClickDirection.startX - 21)
  _marble:SetPosY(ClickDirection.startY - 21)
end
function Panel_Minigame_SteeringWheel_Init()
  speed = 0,5
  ClickDirection.startX = 40
  ClickDirection.startY = 66
  deltaTime = 0
  isSuccess = true
end
function Panel_Minigame_SteeringWheel_Start()
  Panel_Minigame_SteeringWheel_Init()
  local randomAngle = math.random(0, 45) + 22,5
  local randomRadian = math.rad(randomAngle)
  local posX = (ClickDirection.startX - ClickDirection.baseX) * math.cos(randomRadian) - (ClickDirection.startY - ClickDirection.baseY) * math.sin(randomRadian) + ClickDirection.baseX
  local posY = (ClickDirection.startX - ClickDirection.baseX) * math.sin(randomRadian) + (ClickDirection.startY - ClickDirection.baseY) * math.cos(randomRadian) + ClickDirection.baseY
  ClickDirection.startX = posX
  ClickDirection.startY = posY
  _marble:SetPosX(ClickDirection.startX - 21)
  _marble:SetPosY(ClickDirection.startY - 21)
  if randomAngle > 45 then
    vector = -1
  else
    vector = 1
  end
  purposeText:SetText("ì‹œì‘")
  isSteering = true
  Panel_SteeringWheel:SetShow(true, true)
  Panel_SteeringWheel:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
end
function Panel_Minigame_SteeringWheel_End()
  if isSuccess then
    getSelfPlayer():get():SetMiniGameResult(0)
  else
    getSelfPlayer():get():SetMiniGameResult(1)
  end
  Panel_SteeringWheel:SetShow(false, false)
end
local function Panel_Minigame_SteeringWheel_GaugeMove_Left()
  local randomSpeed = (math.random(0, 3) + 1) / 10
  if vector > 0 then
    if randomSpeed > speed then
      speed = math.max(randomSpeed - speed, 0,1)
      vector = -1
    else
      speed = math.max(speed - randomSpeed, 0,1)
    end
  else
    speed = speed + randomSpeed
  end
  _LButton_L:ResetVertexAni()
  _LButton_L:SetVertexAniRun("Ani_Color_Left", true)
end
local function Panel_Minigame_SteeringWheel_GaugeMove_Right()
  local randomSpeed = (math.random(0, 3) + 1) / 10
  if vector < 0 then
    if randomSpeed > speed then
      speed = math.max(randomSpeed - speed, 0,1)
      vector = 1
    else
      speed = math.max(speed - randomSpeed, 0,1)
    end
  else
    speed = speed + randomSpeed
  end
  _RButton_R:ResetVertexAni()
  _RButton_R:SetVertexAniRun("Ani_Color_Right", true)
end
function MiniGame_SteeringWheel_KeyPress(keyType)
  if not isSteering then
    return
  end
  if MGKT.MiniGameKeyType_M0 == keyType then
    Panel_Minigame_SteeringWheel_GaugeMove_Left()
  elseif MGKT.MiniGameKeyType_M1 == keyType then
    Panel_Minigame_SteeringWheel_GaugeMove_Right()
  end
end
registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_SteeringWheel_KeyPress")
