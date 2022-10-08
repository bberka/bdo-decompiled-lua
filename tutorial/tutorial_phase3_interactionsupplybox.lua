PaGlobal_TutorialPhase_InteractionSupplyBox = {
  _phaseNo = 3,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {88, 349},
  _startLimitLevel = 15
}
local supplyBoxCharacterKey = 35634
local beginnerPotion = 502
local navigationGuideParam, classType
function PaGlobal_TutorialPhase_InteractionSupplyBox:checkPossibleForPhaseStart(stepNo)
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
  if self._startLimitLevel < getSelfPlayer():get():getLevel() then
    _PA_LOG("ê³½ë¯¼ìš°", "ìºë¦­í„°ì˜ ë ˆë²¨ì´ " .. tostring(self._startLimitLevel) .. "ë¥¼ ì´ˆê³¼í–ˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì§„í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_InteractionSupplyBox:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_InteractionSupplyBox:startPhase()")
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  classType = getSelfPlayer():getClassType()
  ToClient_DeleteNaviGuideByGroup()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(false)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(false)
  PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
  PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
  PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  FGlobal_NewQuickSlot_Update()
  FGlobal_Panel_Radar_Show(true)
  PaGlobalFunc_Panel_TimeBar_Show(true, false)
  if false == _ContentsGroup_RenewUI then
    GameTips_Show()
    GameTips_Reposition()
  end
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:startNextPhase()
end
local result
function PaGlobal_TutorialPhase_InteractionSupplyBox:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if 1 == self._currentStep then
    result = self:updateWaitMainStatusUserBarComment(deltaTime)
  elseif 2 == self._currentStep then
    result = false
  elseif 3 == self._currentStep then
    result = self:updateCheckInteraction(deltaTime)
  elseif 4 == self._currentStep then
    self:endPhase()
  end
  if true == result then
    self._nextStep = self._nextStep + 1
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:handleChangeStep(currentStep)
  if 1 == self._currentStep then
    self:changeStepWaitMainStatusUserBarComment()
  elseif 2 == self._currentStep then
    self:changeStepMoveDestination()
  elseif 3 == self._currentStep then
    self:changeStepCheckInteraction()
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:changeStepWaitMainStatusUserBarComment()
  local isRemaster = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(__eSwapRemasterUISetting)
  local spiritPosX, spiritPosY = 0, nil
  local isSpiritLeft = false
  if true == isRemaster then
    PaGlobalFunc_MainStatus_ShowFromTutorial()
    spiritPosX = PaGlobalFunc_MainStatus_GetPosX() + PaGlobalFunc_MainStatus_GetSizeX() * 1,1
    spiritPosY = PaGlobalFunc_MainStatus_GetPosY() + PaGlobalFunc_MainStatus_GetSizeY()
    isSpiritLeft = false
  else
    FGlobal_Panel_MainStatus_User_Bar_Show()
    spiritPosX = Panel_MainStatus_User_Bar:GetPosX() + Panel_MainStatus_User_Bar:GetSizeX() * 1,1
    spiritPosY = Panel_MainStatus_User_Bar:GetPosY() - Panel_MainStatus_User_Bar:GetSizeY()
    isSpiritLeft = true
  end
  FGlobal_ClassResource_SetShowControl(true)
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_88"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_89"), isSpiritLeft, spiritPosX, spiritPosY)
  end)
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:updateWaitMainStatusUserBarComment(deltaTime)
  if 6 * timeRatio < self._updateTime then
    self._updateTime = 0
    self._nextStep = self._nextStep + 1
  end
  self._updateTime = self._updateTime + deltaTime
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:changeStepMoveDestination()
  navigationGuideParam = NavigationGuideParam()
  if 1 == self._currentProgress then
    worldmapNavigatorStart(float3(-156384,67, -518,35, 134599,7), navigationGuideParam, false, false, true)
    FGlobal_Panel_Radar_Show_AddEffect()
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_90"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_91"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 2 == self._currentProgress then
    worldmapNavigatorStart(float3(-153560,58, -300,81, 134786,77), navigationGuideParam, false, false, true)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_92"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_93"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:eventCallDeleteNavigationGuide(key)
  if 1 == self._currentProgress then
    audioPostEvent_SystemUi(4, 12)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  elseif 2 == self._currentProgress then
    self._nextStep = self._nextStep + 1
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:changeStepCheckInteraction()
  navigationGuideParam = NavigationGuideParam()
  navigationGuideParam._isAutoErase = false
  worldmapNavigatorStart(float3(-151500,78, -243,44, 132849,84), navigationGuideParam, false, false, true)
end
local currentInteractableActor, isMatchCharacterKey
function PaGlobal_TutorialPhase_InteractionSupplyBox:updateCheckInteraction()
  currentInteractableActor = interaction_getInteractable()
  isMatchCharacterKey = false
  if nil ~= currentInteractableActor then
    isMatchCharacterKey = supplyBoxCharacterKey == currentInteractableActor:getCharacterKeyRaw()
  end
  if false == isMatchCharacterKey then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_32"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_68"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif true == isMatchCharacterKey then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_36"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_37"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
      PaGlobal_TutorialUiManager:getUiBlackSpirit():addBubbleKey("_bubbleKey_R")
    end)
  end
end
local gainedBeginnerPotion = false
local isFinish = false
function PaGlobal_TutorialPhase_InteractionSupplyBox:eventCallClickedSupplyBoxExitButton(talker)
  if nil ~= talker and talker:getCharacterKey() == supplyBoxCharacterKey then
    if false == _ContentsGroup_RenewUI then
      if true == _ContentsGroup_NewUI_Inventory_All then
        PaGlobalFunc_Inventory_All_SetCheckNormalInventory(true)
      else
        Inventory_SetCheckRadioButtonNormalInventory(true)
      end
      Inventory_updateSlotData()
    else
      Inventory_updateSlotData(true)
    end
    if true == gainedBeginnerPotion then
      return true
    end
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:handleUpdateInventorySlotData(slot, slotItemKey)
  if slotItemKey == beginnerPotion then
    gainedBeginnerPotion = true
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:handleClickedExitButton(talker)
  if 3 == self._currentStep then
    isFinish = self:eventCallClickedSupplyBoxExitButton(talker)
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:handleAfterAndPopFlush()
  if true == isFinish then
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_InteractionSupplyBox:handleDeleteNavigationGuide(key)
  if 2 == self._currentStep then
    self:eventCallDeleteNavigationGuide(key)
  end
end
