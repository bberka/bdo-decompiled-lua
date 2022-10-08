PaGlobal_TutorialPhase_WallRiding = {
  _phaseNo = 20,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 0,
  _prevProgress = 2,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {41},
  _questData = {
    [1] = {_questGroupNo = 658, _questId = 8}
  }
}
local uiWallRidingGuideImage = UI.getChildControl(Panel_Tutorial, "Static_KeyTutorialImage")
local function setQuestIconGuideImage(posX, posY)
  local uiWallRidingGuideImageSizeX = uiWallRidingGuideImage:GetSizeX()
  local uiWallRidingGuideImageSizeY = uiWallRidingGuideImage:GetSizeY()
  uiWallRidingGuideImage:SetPosX(posX - uiWallRidingGuideImageSizeX * 0,5)
  uiWallRidingGuideImage:SetPosY(posY - uiWallRidingGuideImageSizeY * 0,5)
end
function PaGlobal_TutorialPhase_WallRiding:checkPossibleForPhaseStart(stepNo)
  if false == self._isPhaseOpen then
    _PA_LOG("ì¡°ì¬ì›", "íŠœí† ë¦¬ì–¼ Phaseê°€ ë‹«í˜€ìˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    _PA_LOG("ì¡°ì¬ì›", "íŠœí† ë¦¬ì–¼ ì‹œì‘ ê°€ëŠ¥ ì—¬ë¶€ ê²€ì‚¬ì¤‘ì— selfPlayerê°€ ì—†ìŠµë‹ˆë‹¤! _phaseNo : " .. tostring(self._phaseNo))
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
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ì´ ê°€ëŠ¥í•œ ì§€ì—­(ë§ˆë²•ì‚¬ì˜ ì œë‹¨)ì´ ì•„ë‹ˆë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹¤í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if true == questList_isClearQuest(self._questData[1]._questGroupNo, self._questData[1]._questId) then
    _PA_LOG("ì¡°ì¬ì›", "_questGroupNo" .. tostring(self._questData[1]._questGroupNo) .. "_questId" .. tostring(self._questData[1]._questId) .. "ë¥¼ ì™„ë£Œí•˜ì—¬ íŠœí† ë¦¬ì–¼ì„ ì§„í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.")
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_WallRiding:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_WallRiding:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_WallRiding:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ì¡°ì¬ì›", "PaGlobal_TutorialPhase_WallRiding:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
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
function PaGlobal_TutorialPhase_WallRiding:endPhase()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_WallRiding:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_WallRiding:handleChangeStep(currentStep)
  if 1 == self._currentStep then
    self:changeStep1()
  end
end
function PaGlobal_TutorialPhase_WallRiding:toNextProgress()
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end
function PaGlobal_TutorialPhase_WallRiding:toNextStep()
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end
function PaGlobal_TutorialPhase_WallRiding:progressException(processNo)
  self._currentProgress = processNo
end
function PaGlobal_TutorialPhase_WallRiding:changeStep1()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_71"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_72"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, false)
    end)
  elseif 2 == self._currentProgress then
    setQuestIconGuideImage(getScreenSizeX() * 0,5, getScreenSizeY() * 0,5)
    uiWallRidingGuideImage:SetAlpha(0,5)
    uiWallRidingGuideImage:SetShow(true)
    UIAni.AlphaAnimation(1, uiWallRidingGuideImage, 0, 1,5)
    uiWallRidingGuideImage:SetIgnore(false)
    uiWallRidingGuideImage:addInputEvent("Mouse_LUp", "PaGlobal_TutorialPhase_WallRiding:handleMouseLUp_QuestIconGuideImage()")
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_73"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_74"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 320)
    end)
  elseif 3 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_75"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_A_76"), false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  end
end
function PaGlobal_TutorialPhase_WallRiding:eventCallStep1RegionChanged(regionInfo)
  local currentRegionKey = regionInfo:getRegionKey()
  for index, value in pairs(self._regionKeyRawList) do
    if value ~= currentRegionKey then
      self:endPhase()
      return
    end
  end
end
function PaGlobal_TutorialPhase_WallRiding:eventCallStep1MouseLUpBubble()
  if 1 == self._currentProgress then
    self:toNextProgress()
  end
end
function PaGlobal_TutorialPhase_WallRiding:eventCallStep1EventQuestUpdateNotify()
  if true == PaGlobal_TutorialManager:isSatisfiedQuestCondition(self._questData[1]._questGroupNo, self._questData[1]._questId) then
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_WallRiding:handleMouseLUp_QuestIconGuideImage()
  uiWallRidingGuideImage:SetIgnore(true)
  local aniInfo = UIAni.AlphaAnimation(0, uiWallRidingGuideImage, 0, 0,25)
  aniInfo:SetHideAtEnd(true)
  self:toNextProgress()
end
function PaGlobal_TutorialPhase_WallRiding:handleRegionChanged(regionInfo)
  self:eventCallStep1RegionChanged(regionInfo)
end
function PaGlobal_TutorialPhase_WallRiding:handleMouseLUpBubble()
  if 1 == self._currentStep then
    self:eventCallStep1MouseLUpBubble()
  end
end
function PaGlobal_TutorialPhase_WallRiding:handleQuestWidgetUpdate()
  self:eventCallStep1EventQuestUpdateNotify()
end
