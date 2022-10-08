local IM = CppEnums.EProcessorInputMode
local autoTrain = ToClient_IsAutoLevelUp()
local function autoTraining_Init()
  if not ToClient_IsContentsGroupOpen("57") then
    return
  end
  if autoTrain then
    ToClient_RequestSetAutoLevelUp(false)
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end
function AutoTraining_Set()
  if Panel_Global_Manual:GetShow() then
    Proc_ShowMessage_Ack("ë¯¸ë‹ˆê²Œì„ ì¤‘ì—ëŠ” í‘ì •ë ¹ì˜ ìˆ˜ë ¨ì„ ì´ìš©í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
    return
  end
  if nil ~= PaGlobalFunc_GachaRoulette_GetShow and true == PaGlobalFunc_GachaRoulette_GetShow() then
    Proc_ShowMessage_Ack("ë£°ë ›ì´ ëŒì•„ê°€ëŠ” ì¤‘ì—ëŠ” í‘ì •ë ¹ì˜ ìˆ˜ë ¨ì„ ì´ìš©í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
    return
  end
  if Panel_EventNotify:GetShow() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
    if true == _ContentsGroup_NewUI_EventNotify_All then
      PaGloabl_EventNotify_All_Close()
    else
      EventNotify_Close()
    end
  end
  if Panel_ScreenShotAlbum_FullScreen:GetShow() then
    ScreenshotAlbum_FullScreen_Close()
  end
  if Panel_ScreenShotAlbum:GetShow() then
    ScreenshotAlbum_Close()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
  end
  if check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
  elseif not check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
    FGlobal_NpcNavi_Hide()
  elseif check_ShowWindow() and not FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
  end
  local pcPosition = getSelfPlayer():get():getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if not regionInfo:get():isSafeZone() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_1"))
    return
  end
  local needExp = Int64toInt32(getSelfPlayer():get():getNeedExp_s64())
  local currentexp = Int64toInt32(getSelfPlayer():get():getExp_s64())
  local expRate = currentexp * 100 / needExp
  local e1 = 10000
  local msg = ""
  ToClient_RequestSetAutoLevelUp(not autoTrain)
end
function AutoTraining_Stop()
  autoTrain = ToClient_IsAutoLevelUp()
end
function AutoTraining_ToolTip(isShow)
  if false == isShow then
    TooltipSimple_Hide()
    return
  end
  local currentLevel = getSelfPlayer():get():getLevel()
  local name, desc = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_8"), nil
  local maxExpPercent = ToClient_GetAutoLevelUpMaxExpPercent(currentLevel) / 10000
  if autoTrain then
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_6", "percent", maxExpPercent)
  else
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_7", "percent", maxExpPercent)
  end
end
function Init_AutoTraining()
  autoTraining_Init()
end
function isAutoTraining()
  return autoTrain
end
function FromClient_SetAutoLevelUp(isAuto)
  autoTrain = isAuto
  if autoTrain then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_3")
  else
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_4")
  end
  Proc_ShowMessage_Ack(msg)
end
