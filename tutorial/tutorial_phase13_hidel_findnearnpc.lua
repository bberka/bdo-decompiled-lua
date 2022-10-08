PaGlobal_TutorialPhase_Hidel_FindNearNpc = {
  _phaseNo = 13,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 0,
  _prevProgress = 0,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = false,
  _talkerCharacterKeyData = {
    [1] = 41051,
    [2] = 41056
  }
}
local getNpcNaviPanel = function()
  return Panel_NpcNavi_All
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:checkPossibleForPhaseStart(stepNo)
  if false == self._isPhaseOpen then
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ Phaseê°€ ë‹«í˜€ìˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:startPhase(stepNo)
  if false == self:checkPossibleForPhaseStart(stepNo) then
    return
  end
  if true == PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ phase(" .. tostring(self._phaseNo) .. ")ê°€ ë³´ìŠ¤ ì†Œí™˜ íŠœí† ë¦¬ì–¼ì„ ì¢…ë£Œì‹œí‚´! _phaseNo : " .. tostring(self._phaseNo))
  end
  local isSkippable = self:checkSkippablePhase()
  if true == isSkippable and false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_Hidel_FindNearNpc:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:endPhase()
  FGlobal_TownNpcNavi_EraseAllEffect()
  FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7):EraseAllEffect()
  FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16):EraseAllEffect()
  PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleChangeStep(currentStep)
  if 1 == self._currentStep then
    self:changeStep1()
  elseif 2 == self._currentStep then
    self:changeStep2()
  elseif 3 == self._currentStep then
    self:changeStep3()
  elseif 4 == self._currentStep then
    self:changeStep4()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:toNextProgress()
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:toNextStep()
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
  self:updatePerFrame(0)
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:toStep(destStep, destProgress)
  self._nextStep = destStep
  if nil == destProgress then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
  if self._currentStep == self._nextStep then
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:changeStep1()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_89"), "", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_90"), "", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
  elseif 3 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_91"), "", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep1MouseLUpBubble()
  if 3 == self._currentProgress then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:changeStep2()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_92"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_93"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    FGlobal_TownNpcNavi_AddEffect("UI_Tutorial_MouseMove", true, 0, 0)
    PaGlobal_TutorialUiManager:getUiMasking():showChildControlMasking(Panel_Widget_TownNpcNavi, FGlobal_TownNpcNavi_GetFindNaviButton())
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_94"), "", true, getNpcNaviPanel():GetPosX() - getNpcNaviPanel():GetSizeX() / 3, getNpcNaviPanel():GetPosY() + getNpcNaviPanel():GetSizeY() / 3, false)
    end)
  elseif 3 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_95"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_96"), true, getNpcNaviPanel():GetPosX() - getNpcNaviPanel():GetSizeX() / 3, getNpcNaviPanel():GetPosY() + getNpcNaviPanel():GetSizeY() / 3, true)
    end)
    ToClient_DeleteNaviGuideByGroup(0)
    if false == getNpcNaviPanel():GetShow() then
      getNpcNaviPanel():SetShow(true, true)
    end
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
    PaGlobal_TutorialUiManager:getUiMasking():showChildControlMasking(getNpcNaviPanel(), FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7))
  elseif 4 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_97"), "", true, getNpcNaviPanel():GetPosX() - getNpcNaviPanel():GetSizeX() / 3, getNpcNaviPanel():GetPosY() + getNpcNaviPanel():GetSizeY() / 3, false)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep2NpcNavi_ShowToggle(isShow)
  if 1 == self._currentProgress and true == isShow then
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep2ClickedTownNpcIconNaviStart(spawnType, isAuto)
  if 3 == self._currentProgress and CppEnums.SpawnType.eSpawnType_TradeMerchant == spawnType then
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(7):EraseAllEffect()
    PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
    PaGlobal_NpcNavi_All_HideAni()
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep2MouseLUpBubble()
  if 4 == self._currentProgress then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:changeStep3()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_98"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_99"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
    ToClient_DeleteNaviGuideByGroup(0)
    worldmapNavigatorStart(float3(38530,9, -995,69, -29238,2), NavigationGuideParam(), false, false, true)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep3ShowDialog(dialogData)
  if 1 == self._currentProgress then
    if 0 == dialog_getTalkNpcKey() then
      _PA_LOG("ê³½ë¯¼ìš°", "ëŒ€í™”ì¤‘ì¸ NPCí‚¤ ê°’ì´ 0ì´ ë‚˜ì™”ë‹¤! NPCì •ë³´ê°€ ì—†ê±°ë‚˜ ì •ìƒì ìœ¼ë¡œ ì •ë³´ë¥¼ ë°›ì§€ ëª»í–ˆìŒ!")
      return
    end
    if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
      self:toNextStep()
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:changeStep4()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_100"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_101"), true, getNpcNaviPanel():GetPosX() - getNpcNaviPanel():GetSizeX() / 3, getNpcNaviPanel():GetPosY() + getNpcNaviPanel():GetSizeY() / 3, true)
    end)
    ToClient_DeleteNaviGuideByGroup(0)
    if false == getNpcNaviPanel():GetShow() then
      getNpcNaviPanel():SetShow(true, true)
    end
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
  elseif 2 == self._currentProgress then
    self._updateTime = 0
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_102"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_103"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
    if true == getNpcNaviPanel():GetShow() then
      getNpcNaviPanel():SetShow(false, true)
    end
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16):EraseAllEffect()
    PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep4ClickedExitButton(talker)
  if 1 == self._currentProgress and self._talkerCharacterKeyData[2] == talker:getCharacterKey() then
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:eventCallStep4MouseLUpBubble()
  if 2 == self._currentProgress then
    self:endPhase()
  else
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleRegionChanged(regionInfo)
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleNpcNavi_ShowToggle(isShow)
  if 2 == self._currentStep then
    self:eventCallStep2NpcNavi_ShowToggle(isShow)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleClickedTownNpcIconNaviStart(spawnType, isAuto)
  if 2 == self._currentStep then
    self:eventCallStep2ClickedTownNpcIconNaviStart(spawnType, isAuto)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleShowDialog(dialogData)
  if 3 == self._currentStep then
    self:eventCallStep3ShowDialog(dialogData)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleClickedExitButton(talker)
  if 4 == self._currentStep then
    self:eventCallStep4ClickedExitButton(talker)
  end
end
function PaGlobal_TutorialPhase_Hidel_FindNearNpc:handleMouseLUpBubble()
  if 1 == self._currentStep then
    self:eventCallStep1MouseLUpBubble()
  elseif 2 == self._currentStep then
    self:eventCallStep2MouseLUpBubble()
  elseif 4 == self._currentStep then
    self:eventCallStep4MouseLUpBubble()
  end
end
