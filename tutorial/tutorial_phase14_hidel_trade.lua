PaGlobal_TutorialPhase_Hidel_Trade = {
  _phaseNo = 14,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 0,
  _prevProgress = 1,
  _updateTime = 0,
  _isPhaseOpen = false,
  _isSkippable = true,
  _regionKeyRawList = {
    32,
    38,
    42,
    62,
    318
  },
  _waypointKeyData = {
    [1] = 323
  },
  _talkerCharacterKeyData = {
    [1] = 41085
  },
  _questData = {
    [1] = {_questGroupNo = 2039, _questId = 2}
  }
}
local isSatisfiedCondition = false
function PaGlobal_TutorialPhase_Hidel_Trade:checkPossibleForPhaseStart(stepNo)
  if false == self._isPhaseOpen then
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ Phaseê°€ ë‹«í˜€ìˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ ì‹œì‘ ê°€ëŠ¥ ì—¬ë¶€ ê²€ì‚¬ì¤‘ì— selfPlayerê°€ ì—†ìŠµë‹ˆë‹¤! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local currentRegionKeyRaw = selfPlayer:getRegionKeyRaw()
  local isPossiblePhaseRegion = false
  for index, value in pairs(self._regionKeyRawList) do
    if value == currentRegionKeyRaw then
      isPossiblePhaseRegion = true
      break
    end
  end
  if false == isPossiblePhaseRegion then
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ì´ ê°€ëŠ¥í•œ ì§€ì—­ì´ ì•„ë‹ˆë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹¤í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local explorePoint = ToClient_getExplorePointByTerritoryRaw(ToClient_getDefaultTerritoryKey())
  if nil == explorePoint then
    _PA_LOG("ê³½ë¯¼ìš°", "explorePointê°€ nil ì…ë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if explorePoint:getRemainedPoint() < 2 then
    _PA_LOG("ê³½ë¯¼ìš°", "ê³µí—Œë„ê°€ ë¶€ì¡±í•´ì„œ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. : _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_Hidel_Trade:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_Hidel_Trade:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_Hidel_Trade:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_Hidel_Trade:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end
function PaGlobal_TutorialPhase_Hidel_Trade:endPhase()
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_Hidel_Trade:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleChangeStep(currentStep)
  if 1 == self._currentStep then
    self:changeStep1()
  elseif 2 == self._currentStep then
    self:changeStep2()
  elseif 3 == self._currentStep then
    self:changeStep3()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:toNextProgress()
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end
function PaGlobal_TutorialPhase_Hidel_Trade:toNextStep()
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end
function PaGlobal_TutorialPhase_Hidel_Trade:toStep(destStep, destProgress)
  self._nextStep = destStep
  if nil == destProgress then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:addEffectUiNodeButtonByWaypointKey(waypointKey)
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if nil ~= uiNodeButton then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eraseAllEffectUiNodeButtonByWaypointKey(waypointKey)
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if nil ~= uiNodeButton then
    uiNodeButton:EraseAllEffect()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:setEffectDialogButtonByType(funcButtonType)
  local funcButtonIndex
  funcButtonIndex = PaGlobalFunc_DialogMain_All_FindFuncButtonIndexByType(funcButtonType)
  if -1 == funcButtonIndex then
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_Hidel_Trade:isInvestedContributePoint(waypointKey)
  if true == isExploreUpgradable(waypointKey) then
    if true == isWithdrawablePlant(waypointKey) then
      return true
    elseif false == isWithdrawablePlant(waypointKey) then
      return false
    end
  end
  return false
end
function PaGlobal_TutorialPhase_Hidel_Trade:changeStep1()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì˜¤", "", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
  elseif 2 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    self._updateTime = 0
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ ì£¼í™”ë¥¼ ë‹¤ë¥¸ ì§€ì—­ìœ¼ë¡œ ê°€ì„œ íŒë§¤í•´ë³´ì.", "<M>í‚¤ë¥¼ ëˆŒëŸ¬ì„œ ì›”ë“œë§µì„ ì—´ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif 3 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("í‘œì‹œëœ ëª¨ë ˆí‹° ê±°ëŒ€ ë†ì¥ì´ ë³´ì´ì§€", "ëª¨ë ˆí‹° ê±°ëŒ€ ë†ì¥ ê±°ì ì„ ìš°í´ë¦­ í•´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif 4 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
    self:eraseAllEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì˜í–ˆì–´. ëª©ì ì§€ë¥¼ ì°¾ì•„ê°€ë ¤ë©´ ì›”ë“œë§µì„ ë‹«ì•„ì•¼ê² ì§€", "ì´ë™í•´ì•¼í•˜ë‹ˆê¹Œ <ESC>ë‚˜ <M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ë‹«ì•„.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif -1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_41"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_42"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5, true)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1WorldMapOpen()
  if 2 == self._currentProgress then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1WorldMapOpenComplete()
  if 3 == self._currentProgress then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
  elseif -1 == self._currentProgress then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1WorldMapImmediatelyClose()
  if 3 == self._currentProgress then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  elseif 4 == self._currentProgress then
    if true == self:isInvestedContributePoint(self._waypointKeyData[1]) then
      self:toStep(3)
    else
      self:toNextStep()
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1ResetTownMode()
  if 3 <= self._currentProgress and self._currentProgress <= 4 then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1RClickWorldMapNode(uiNodeButton)
  if 3 == self._currentProgress and self._waypointKeyData[1] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1BeforeShowDialog()
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(true)
  else
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1ShowDialog(dialogData)
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    if true == self:isInvestedContributePoint(self._waypointKeyData[1]) then
      self:toStep(3, 2)
      self:eventCallStep3ShowDialog(dialogData)
    else
      self:toStep(2, 2)
      self:eventCallStep2ShowDialog(dialogData)
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1CheckQuestCondition()
  if false == isSatisfiedCondition then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(self._questData[1]._questGroupNo, self._questData[1]._questId)
    if true == isSatisfy then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep1MouseLUpBubble()
  if 4 == self._currentProgress then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:changeStep2()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê¸¸ì•ˆë‚´ë¥¼ ë”°ë¼ê°€ë©´ <íƒí—˜ ê±°ì  ê´€ë¦¬ì>ë©”ë¥´ì‹œì•ˆëŠ ëª¨ë ˆí‹° ì—ê²Œ ë„ë‹¬í•˜ê²Œ ë ê±°ì•¼.", "ê¸¸ì•ˆë‚´ë¥¼ ë”°ë¼ ëŒ€ìƒì„ ì°¾ì•„ ë§ì„ ê±¸ì–´ë³´ì.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif 2 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ë¬´ì—­ì„ í•˜ê¸° ì „ì— ê±°ì ì„ ê´€ë¦¬ë¥¼ í•´ë³´ì.", "ëŒ€í™”ë©”ë‰´ì¤‘ì— 'íƒí—˜ ê±°ì  ê´€ë¦¬'ë²„íŠ¼ì„ ëˆŒëŸ¬ë´.", false, getScreenSizeX() * 0,55, getScreenSizeY() * 0,45, true)
    end)
  elseif 3 == self._currentProgress then
    local positionTarget = UI.getChildControl(Panel_NodeMenu, "MainMenu_Bg")
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ë¬´ì—­ì€ ë¬¼í’ˆì˜ ì›ì‚°ì§€ ê±°ì ê³¼ íŒë§¤í•  ê±°ì ì´ ì—°ê²° ë˜ì–´ ìˆì–´ì•¼ ì œê°’ì„ ë°›ì•„.\nê±°ì ì„ ì—°ê²°í•˜ê³  ì‹¶ìœ¼ë©´ ê³µí—Œë„ë¥¼ íˆ¬ìí•´ì•¼ë¼.", "ì™¼ìª½ ìœ„ì— í‘œì‹œëœ 'ê³µí—Œë„ íˆ¬ì'ë²„íŠ¼ì„ ëˆŒëŸ¬ë³´ì.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0,5, true)
    end)
  elseif 4 == self._currentProgress then
    while true == ToClient_isTownMode() do
      FGlobal_WorldMapWindowEscape()
    end
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ì œ ê±°ì ê°„ì— ì—°ê²°ëœ ì„ ì´ ë¶‰ì–´ì§„ ê²ƒì´ ë³´ì´ì§€", "ì´ì œ <ESC>í‚¤ë‚˜ <M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ë‹«ì•„.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2BeforeShowDialog()
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(true)
  else
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2ShowDialog(dialogData)
  if 1 == self._currentProgress then
    if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
      self:setEffectDialogButtonByType(CppEnums.ContentsType.Contents_Explore)
      self:toNextProgress()
    end
  elseif 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType(CppEnums.ContentsType.Contents_Explore)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2ClickedExitButton(talker)
  if 2 == self._currentProgress then
    if 0 == dialog_getTalkNpcKey() then
      _PA_LOG("ê³½ë¯¼ìš°", "ëŒ€í™”ì¤‘ì¸ NPCí‚¤ ê°’ì´ 0ì´ ë‚˜ì™”ë‹¤! NPCì •ë³´ê°€ ì—†ê±°ë‚˜ ì •ìƒì ìœ¼ë¡œ ì •ë³´ë¥¼ ë°›ì§€ ëª»í–ˆìŒ! _phaseNo : " .. tostring(self._phaseNo))
      return
    end
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() and CppEnums.ContentsType.Contents_Explore == funcButtonType then
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2EventUpdateExplorationNode(waypointKey)
  if 3 == self._currentProgress and self._waypointKeyData[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2WorldMapImmediatelyClose()
  if self._currentProgress < 4 then
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  elseif 4 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
    self:toNextStep()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep2CheckQuestCondition()
  if false == isSatisfiedCondition then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(self._questData[1]._questGroupNo, self._questData[1]._questId)
    if true == isSatisfy then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:changeStep3()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ì œ ê³ ëŒ€ ì² ì£¼í™”ë¥¼ íŒë§¤í•˜ëŸ¬ ê°€ë³´ì.", "'ë©”ë¥´ì‹œì•ˆëŠ ëª¨ë ˆí‹°'ì—ê²Œ ê°€ì„œ ë§ì„ ê±¸ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(73723,8, -1352,55, -70902,8), NavigationGuideParam(), false, false, true)
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê³ ëŒ€ ì² ì£¼í™”ë¥¼ íŒë§¤í•´ ë³¼ê±°ì•¼.", "ëŒ€í™”ë©”ë‰´ì¤‘ì— 'ë¬´ì—­'ë²„íŠ¼ì„ ëˆŒëŸ¬ë³´ì.", false, getScreenSizeX() * 0,3, getScreenSizeY() * 0,45, true)
    end)
  elseif 3 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ë¬´ì—­í’ˆì€ ì‹œì‹œê°ê° ì‹œì„¸ê°€ ë³€í•´.\nê·¸ê±´ ì™¼ìª½ ì‹œì„¸ í˜„í™©í‘œì—ì„œ ìì„¸íˆ í™•ì¸í•  ìˆ˜ ìˆì§€.", "", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1,1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0,5, false)
    end)
  elseif 4 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ìš°ì¸¡ì˜ íŒë§¤ ë²„íŠ¼ì„ ëˆ„ë¥´ë©´ ë¬´ì—­í’ˆì„ íŒë§¤ í•  ìˆ˜ ìˆì–´.\nê¸°ìš´ì´ ë„˜ì¹œë‹¤ë©´ ê°€ê²© í¥ì •ì— ë„ì „í•˜ëŠ”ê²ƒë„ ì¢‹ì•„.", "", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1,1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0,5, false)
    end)
  elseif 5 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê¾¸ì¤€íˆ ì¬ì‚°ì„ ìŒ“ì•„ë³´ë¼ê³ .\nê·¸ëŸ¼ ë‚˜ì¤‘ì— ë³´ì.", "[íŠœí† ë¦¬ì–¼ ì¢…ë£Œ]", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1,1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0,5, false)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3BeforeShowDialog()
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(true)
  else
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3ShowDialog(dialogData)
  if 1 == self._currentProgress then
    if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
      self:setEffectDialogButtonByType(CppEnums.ContentsType.Contents_Shop)
      self:toNextProgress()
    end
  elseif (2 == self._currentProgress or 3 == self._currentProgress) and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType(CppEnums.ContentsType.Contents_Shop)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3ClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() and CppEnums.ContentsType.Contents_Shop == funcButtonType then
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3ClickedExitButton(talker)
  if 2 == self._currentProgress then
    if 0 == dialog_getTalkNpcKey() then
      _PA_LOG("ê³½ë¯¼ìš°", "ëŒ€í™”ì¤‘ì¸ NPCí‚¤ ê°’ì´ 0ì´ ë‚˜ì™”ë‹¤! NPCì •ë³´ê°€ ì—†ê±°ë‚˜ ì •ìƒì ìœ¼ë¡œ ì •ë³´ë¥¼ ë°›ì§€ ëª»í–ˆìŒ! _phaseNo : " .. tostring(self._phaseNo))
      return
    end
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
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
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3CheckQuestCondition()
  if false == isSatisfiedCondition then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(self._questData[1]._questGroupNo, self._questData[1]._questId)
    if true == isSatisfy then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:eventCallStep3MouseLUpBubble()
  if 5 == self._currentProgress then
    self:endPhase()
  else
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleRegionChanged(regionInfo)
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleQuestWidgetUpdate()
  if 1 == self._currentStep then
    self:eventCallStep1CheckQuestCondition()
  elseif 2 == self._currentStep then
    self:eventCallStep2CheckQuestCondition()
  elseif 3 == self._currentStep then
    self:eventCallStep3CheckQuestCondition()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleBeforeWorldmapOpen()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapOpen()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleWorldMapOpenComplete()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapOpenComplete()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleWorldMapImmediatelyClose()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapImmediatelyClose()
  elseif 2 == self._currentStep then
    self:eventCallStep2WorldMapImmediatelyClose()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleResetTownMode()
  if 1 == self._currentStep then
    self:eventCallStep1ResetTownMode()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleRClickWorldMapNode(uiNodeButton)
  if 1 == self._currentStep then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleBeforeShowDialog()
  if 1 == self._currentStep then
    self:eventCallStep1BeforeShowDialog()
  elseif 2 == self._currentStep then
    self:eventCallStep2BeforeShowDialog()
  elseif 3 == self._currentStep then
    self:eventCallStep3BeforeShowDialog()
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleShowDialog(dialogData)
  if 1 == self._currentStep then
    self:eventCallStep1ShowDialog(dialogData)
  elseif 2 == self._currentStep then
    self:eventCallStep2ShowDialog(dialogData)
  elseif 3 == self._currentStep then
    self:eventCallStep3ShowDialog(dialogData)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentStep then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  elseif 3 == self._currentStep then
    self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleClickedExitButton(talker)
  if 2 == self._currentStep then
    self:eventCallStep2ClickedExitButton(talker)
  elseif 3 == self._currentStep then
    self:eventCallStep3ClickedExitButton(talker)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleEventUpdateExplorationNode(waypointKey)
  if 2 == self._currentStep then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  end
end
function PaGlobal_TutorialPhase_Hidel_Trade:handleMouseLUpBubble()
  if 1 == self._currentStep then
    self:eventCallStep1MouseLUpBubble()
  elseif 3 == self._currentStep then
    self:eventCallStep3MouseLUpBubble()
  end
end
