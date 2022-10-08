PaGlobal_TutorialPhase_CallBlackSpirit = {
  _phaseNo = 5,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {9},
  _startLimitLevel = 15,
  _questData = {
    [1] = {_questGroupNo = 21001, _questId = 1},
    [2] = {_questGroupNo = 21001, _questId = 2}
  },
  _posData = {
    [1] = float3(-60165,2, -3857,59, 47040,2),
    [2] = float3(-65848,13, -3927,43, 46123,3)
  },
  _NpcKeyData = {
    [1] = 40751,
    [2] = 40036
  },
  _lastSpiritUiData = {_stringBlack = nil, _stringYellow = nil}
}
local eventID = PaGlobal_TutorialEventList
local isAcceptedQuest = false
local isClearQuest = false
function PaGlobal_TutorialPhase_CallBlackSpirit:setState(state)
  self._state = state
end
function PaGlobal_TutorialPhase_CallBlackSpirit:getState()
  return self._state
end
function PaGlobal_TutorialPhase_CallBlackSpirit:checkPossibleForPhaseStart(stepNo)
  if false == self._isPhaseOpen then
    _PA_LOG("íŠœí† ë¦¬ì–¼", "íŠœí† ë¦¬ì–¼ Phaseê°€ ë‹«í˜€ìˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    _PA_LOG("íŠœí† ë¦¬ì–¼", "íŠœí† ë¦¬ì–¼ ì‹œì‘ ê°€ëŠ¥ ì—¬ë¶€ ê²€ì‚¬ì¤‘ì— selfPlayerê°€ ì—†ìŠµë‹ˆë‹¤! _phaseNo : " .. tostring(self._phaseNo))
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
    _PA_LOG("íŠœí† ë¦¬ì–¼", "íŠœí† ë¦¬ì–¼ì´ ê°€ëŠ¥í•œ ì§€ì—­ì´ ì•„ë‹ˆë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹¤í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  if self._startLimitLevel < getSelfPlayer():get():getLevel() then
    _PA_LOG("íŠœí† ë¦¬ì–¼", "ìºë¦­í„°ì˜ ë ˆë²¨ì´ " .. tostring(self._startLimitLevel) .. "ë¥¼ ì´ˆê³¼í–ˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì§„í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_CallBlackSpirit:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_CallBlackSpirit:startPhase(stepNo)
  if false == self:checkPossibleForPhaseStart(stepNo) then
    return
  end
  local isSkippable = self:checkSkippablePhase()
  if true == isSkippable and false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("íŠœí† ë¦¬ì–¼", "PaGlobal_TutorialPhase_CallBlackSpirit:startPhase()")
  self._currentStep = stepNo
  self._currentProgress = 1
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial_Renew:SetShow(true, true)
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:startNextPhase()
end
function PaGlobal_TutorialPhase_CallBlackSpirit:updatePerFrame(deltaTime)
  self:handleStep(deltaTime)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:handleStep(deltaTime)
  if 1 == self._currentStep then
    self:Step01_SuggestCallBlackSpirit(deltaTime)
  elseif 2 == self._currentStep then
    self:Step02_FollowQuest(deltaTime)
  elseif 3 == self._currentStep then
    self:Step03_FindSkillInstructor(deltaTime)
  elseif 4 == self._currentStep then
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step01_SuggestCallBlackSpirit(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step01_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step01_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step01_Done()
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step01_Prepare()
  PaGlobal_TutorialUiManager:getUiBlackSpirit():showSuggestCallSpiritUi()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:ClearEventFunctor()
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_ShowDialog, function(dialogData)
    if false == isAcceptedQuest then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 80, -50)
    end
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_QuestUpdateNotify, function(param)
    local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(param._questNoRaw)
    local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(param._questNoRaw)
    if questGroupNo == self._questData[1]._questGroupNo and questId == self._questData[1]._questId then
      isAcceptedQuest = true
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_EraseAllEffect_ExitButton()
      FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 80, -50)
    end
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_AfterAndPopFlush, function()
    if true == isAcceptedQuest then
      isAcceptedQuest = false
      FGlobal_EraseAllEffect_ExitButton()
      self._currentProgress = 2
    end
  end)
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step01_DoStep(deltaTime)
  if 1 == self._currentProgress then
  elseif 2 == self._currentProgress then
    self:setState(PaGlobal_TutorialState.eState_Done)
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step01_Done()
  PaGlobal_TutorialManager:ClearEventFunctor()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step02_FollowQuest(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step02_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step02_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step02_Done()
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step02_Prepare()
  self._lastSpiritUiData._stringBlack = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_74")
  self._lastSpiritUiData._stringYellow = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_75")
  PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(self._lastSpiritUiData._stringBlack .. " " .. self._lastSpiritUiData._stringYellow)
  PaGlobal_TutorialManager:ClearEventFunctor()
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_ShowDialog, function(dialogData)
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 80, -50)
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_QuestUpdateNotify, function(param)
    local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(param._questNoRaw)
    local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(param._questNoRaw)
    if questGroupNo == self._questData[2]._questGroupNo and questId == self._questData[2]._questId then
      isClearQuest = true
      isAcceptedQuest = true
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_EraseAllEffect_ExitButton()
      FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 80, -50)
    end
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_AfterAndPopFlush, function()
    if true == isClearQuest and true == isAcceptedQuest then
      isClearQuest = false
      isAcceptedQuest = false
      FGlobal_EraseAllEffect_ExitButton()
      self._currentProgress = 2
    end
  end)
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step02_DoStep(deltaTime)
  if 1 == self._currentProgress then
    self:showSuggestInteraction(self:updateCheckInteraction())
  elseif 2 == self._currentProgress then
    self:setState(PaGlobal_TutorialState.eState_Done)
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step02_Done()
  PaGlobal_TutorialManager:ClearEventFunctor()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step03_FindSkillInstructor(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step03_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step03_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step03_Done()
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step03_Prepare()
  self._lastSpiritUiData._stringBlack = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_74")
  self._lastSpiritUiData._stringYellow = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_75")
  PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(self._lastSpiritUiData._stringBlack .. " " .. self._lastSpiritUiData._stringYellow)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_ShowDialog, function(dialogData)
    local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
    FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
    FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 80, -50)
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_QuestUpdateNotify, function(param)
    local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(param._questNoRaw)
    local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(param._questNoRaw)
    if questGroupNo == self._questData[2]._questGroupNo and questId == self._questData[2]._questId then
      isClearQuest = true
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_EraseAllEffect_ExitButton()
      FGlobal_AddEffect_ExitButton("UI_ArrowMark02", true, 80, -50)
    end
  end)
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_AfterAndPopFlush, function()
    if true == isClearQuest then
      isClearQuest = false
      isAcceptedQuest = false
      FGlobal_EraseAllEffect_ExitButton()
      self._currentProgress = 2
    end
  end)
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step03_DoStep(deltaTime)
  if 1 == self._currentProgress then
    self:showSuggestInteraction(self:updateCheckInteraction())
  elseif 2 == self._currentProgress then
    self:setState(PaGlobal_TutorialState.eState_Done)
  end
end
function PaGlobal_TutorialPhase_CallBlackSpirit:Step03_Done()
  PaGlobal_TutorialManager:ClearEventFunctor()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
local currentInteractableActor, isMatchCharacterKey
function PaGlobal_TutorialPhase_CallBlackSpirit:updateCheckInteraction()
  currentInteractableActor = interaction_getInteractable()
  isMatchCharacterKey = false
  if nil ~= currentInteractableActor then
    if 2 == self._currentStep then
      isMatchCharacterKey = self._NpcKeyData[1] == currentInteractableActor:getCharacterKeyRaw()
    elseif 3 == self._currentStep then
      isMatchCharacterKey = self._NpcKeyData[2] == currentInteractableActor:getCharacterKeyRaw()
    end
  end
  return isMatchCharacterKey
end
function PaGlobal_TutorialPhase_CallBlackSpirit:showSuggestInteraction(isInteractable)
  if false == isInteractable then
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(self._lastSpiritUiData._stringBlack .. " " .. self._lastSpiritUiData._stringYellow)
  else
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_TEXT_9") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_TEXT_10")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
  end
end
