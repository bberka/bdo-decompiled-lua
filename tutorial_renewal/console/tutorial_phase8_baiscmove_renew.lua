PaGlobal_TutorialPhase_RenewalBasicMove_1 = {
  _phaseNo = 8,
  _currentStep = 0,
  _nextStep = 1,
  _currentProgress = 1,
  _updateTime = 0,
  _classStringData = {},
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {10},
  _startLimitLevel = 5,
  _state = 0
}
local classType = 0
local isAcceptedQuest = false
local isClearQuest = false
function PaGlobal_TutorialPhase_RenewalBasicMove_1:setState(isStart)
  self._state = isStart
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:getState(isStart)
  return self._state
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:checkPossibleForPhaseStart(stepNo)
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
function PaGlobal_TutorialPhase_RenewalBasicMove_1:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:startPhase(stepNo)
  if false == self:checkPossibleForPhaseStart(stepNo) then
    _PA_LOG("ì´ë‹¤í˜œ", "ì˜ëª»ëœ íŠœí† ë¦¬ì–¼ stepNo ì…ë‹ˆë‹¤ : " .. stepNo)
    ToClient_EnterMultiplayMode()
    return
  end
  local isSkippable = self:checkSkippablePhase()
  if true == isSkippable and false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_RenewalBasicMove_1:startPhase() stepNo : " .. tostring(stepNo))
  self._currentStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  Panel_Tutorial_Renew:SetShow(true, true)
  ToClient_DeleteNaviGuideByGroup()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialUiManager:repositionScreen()
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:updatePerFrame(deltaTime)
  self:handleStep(deltaTime)
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:handleStep(deltaTime)
  if 1 == self._currentStep then
    self:Step01_BlackSpiritTalk(deltaTime)
  elseif 2 == self._currentStep then
    self:Step02_BasicMove(deltaTime)
  else
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step01_BlackSpiritTalk(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step01_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step01_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step01_Done()
  end
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step01_Prepare()
  if false == ToClient_isPS4() then
    getSelfPlayer():setActionChart("TUTORIAL_WAIT_STEP1")
  else
    getSelfPlayer():setActionChart("TUTORIAL_WAIT_STEP1_PS")
  end
  self:setState(PaGlobal_TutorialState.eState_Do)
end
local isFadeOut = false
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step01_DoStep(deltaTime)
  self._updateTime = self._updateTime + deltaTime
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(PAGetString(Defines.StringSheet_GAME, self._classStringData[classType][1]))
    self._updateTime = 0
    self._currentProgress = self._currentProgress + 1
  elseif 2 == self._currentProgress then
    if true == IsSelfPlayerWaitAction() then
      if false == isFadeOut then
        PaGlobal_TutorialPhase_RenewalBasicMove_1:fadeOutBg()
        isFadeOut = true
        self._updateTime = 0
      end
      if self._updateTime > 0,3 then
        Process_UIMode_CommonWindow_BlackSpirit()
        PaGlobal_TutorialPhase_RenewalBasicMove_1:Step05_SummonBlackSpirit()
        PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_CONSOLE_TEXT_1"))
        self._updateTime = 0
        self._currentProgress = self._currentProgress + 1
      end
    end
  elseif 3 == self._currentProgress and 1 * timeRatio < self._updateTime then
    if true == isClearQuest or true == isAcceptedQuest then
      isClearQuest = false
      isAcceptedQuest = false
      self._updateTime = 0
      self._currentProgress = 1
      self:setState(PaGlobal_TutorialState.eState_Done)
    end
    ToClient_EnterMultiplayMode()
  end
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:fadeOutBg()
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step01_Done()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step05_SummonBlackSpirit()
  PaGlobal_TutorialManager:ClearEventFunctor()
  PaGlobal_TutorialManager:AddEventFunctor(PaGlobal_TutorialEventList.TutorialEvent_ShowDialog, function(dialogData)
  end)
  PaGlobal_TutorialManager:AddEventFunctor(PaGlobal_TutorialEventList.TutorialEvent_QuestUpdateNotify, function(param)
    local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(param._questNoRaw)
    local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(param._questNoRaw)
    if questGroupNo == 21117 and (questId == 1 or questId == 2) then
      isClearQuest = true
      isAcceptedQuest = true
    end
  end)
  PaGlobal_TutorialManager:AddEventFunctor(PaGlobal_TutorialEventList.TutorialEvent_AfterAndPopFlush, function()
    if true == isClearQuest or true == isAcceptedQuest then
      self._currentProgress = 3
      self:setState(PaGlobal_TutorialState.eState_Do)
    end
    ToClient_EnterMultiplayMode()
  end)
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step02_BasicMove(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step02_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step02_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step01_Done()
  end
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step02_Prepare()
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_RenewalBasicMove_1:Step02_DoStep(deltaTime)
  if 1 == self._currentProgress then
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_101")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    self._updateTime = 0
    self._currentProgress = self._currentProgress + 1
  elseif 2 == self._currentProgress then
    if Panel_Widget_PanelInteraction_Renew:GetShow() then
      local actor = interaction_getInteractable()
      if actor ~= nil then
        local characterKey = actor:getCharacterKeyRaw()
        if 40768 == characterKey then
          self._currentProgress = self._currentProgress + 1
          self._updateTime = 0
        end
      end
    end
    if self._updateTime < 2 * timeRatio then
      local isPress = keyCustom_IsPressed_Action(CppEnums.ActionInputType.ActionInputType_MoveFront)
      if isPress then
        self._updateTime = self._updateTime + deltaTime
      end
      local isPress = keyCustom_IsPressed_Action(CppEnums.ActionInputType.ActionInputType_AutoRun)
      if isPress then
        self._updateTime = 2
      end
    else
      local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_102")
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
    end
  elseif 3 == self._currentProgress then
    if Panel_Widget_PanelInteraction_Renew:GetShow() then
      local actor = interaction_getInteractable()
      if actor ~= nil then
        local characterKey = actor:getCharacterKeyRaw()
        if 40768 == characterKey then
          self._currentProgress = self._currentProgress + 1
          self._updateTime = 0
        end
      end
    end
  elseif 4 == self._currentProgress then
    if not questList_hasProgressQuest(21117, 1) then
      PaGlobal_TutorialPhase_RenewalBasicMove_1:Step01_Done()
      return
    end
    if 0 == self._updateTime then
      local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_103")
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
      self._updateTime = self._updateTime + deltaTime
    end
    if not Panel_Widget_PanelInteraction_Renew:GetShow() then
      self._currentProgress = self._currentProgress - 1
      self._updateTime = 0
      PaGlobal_TutorialUiBlackSpirit._ui._static_BottomBg:SetShow(false)
    end
    local isPress = keyCustom_IsPressed_Action(CppEnums.ActionInputType.ActionInputType_Interaction)
    if true == isPress then
      self:setState(PaGlobal_TutorialState.eState_Done)
    end
  end
end
PaGlobal_TutorialPhase_RenewalBasicMove_1._classStringData = {
  [__eClassType_Warrior] = {
    "TUTORIAL_MOVE_WARRIOR_TALK1",
    "TUTORIAL_MOVE_WARRIOR_TALK2",
    "TUTORIAL_MOVE_WARRIOR_TALK3"
  },
  [__eClassType_ElfRanger] = {
    "TUTORIAL_MOVE_RANGER_TALK1",
    "TUTORIAL_MOVE_RANGER_TALK2",
    "TUTORIAL_MOVE_RANGER_TALK3"
  },
  [__eClassType_Sorcerer] = {
    "TUTORIAL_MOVE_SORCERER_TALK1",
    "TUTORIAL_MOVE_SORCERER_TALK2",
    "TUTORIAL_MOVE_SORCERER_TALK3"
  },
  [__eClassType_Giant] = {
    "TUTORIAL_MOVE_GIANT_TALK1",
    "TUTORIAL_MOVE_GIANT_TALK2",
    "TUTORIAL_MOVE_GIANT_TALK3"
  },
  [__eClassType_Tamer] = {
    "LUA_TUTORIAL_MOVE_TAMER_TALK1",
    "LUA_TUTORIAL_MOVE_TAMER_TALK2",
    "LUA_TUTORIAL_MOVE_TAMER_TALK3"
  },
  [__eClassType_BladeMaster] = {
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK1",
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK2",
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK3"
  },
  [__eClassType_BladeMasterWoman] = {
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK1",
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK2",
    "LUA_TUTORIAL_MOVE_BLADEMASTER_TALK3"
  },
  [__eClassType_Valkyrie] = {
    "LUA_TUTORIAL_MOVE_VALKYRIE_TALK1",
    "LUA_TUTORIAL_MOVE_VALKYRIE_TALK2",
    "LUA_TUTORIAL_MOVE_VALKYRIE_TALK3"
  },
  [__eClassType_WizardMan] = {
    "TUTORIAL_MOVE_WIZRAD_TALK1",
    "TUTORIAL_MOVE_WIZRAD_TALK2",
    "TUTORIAL_MOVE_WIZRAD_TALK3"
  },
  [__eClassType_WizardWoman] = {
    "TUTORIAL_MOVE_WIZRAD_TALK1",
    "TUTORIAL_MOVE_WIZRAD_TALK2",
    "TUTORIAL_MOVE_WIZRAD_TALK3"
  },
  [__eClassType_Kunoichi] = {
    "TUTORIAL_MOVE_NINJA_TALK1",
    "TUTORIAL_MOVE_NINJA_TALK2",
    "TUTORIAL_MOVE_NINJA_TALK3"
  },
  [__eClassType_NinjaMan] = {
    "TUTORIAL_MOVE_NINJA_TALK1",
    "TUTORIAL_MOVE_NINJA_TALK2",
    "TUTORIAL_MOVE_NINJA_TALK3"
  },
  [__eClassType_DarkElf] = {
    "TUTORIAL_MOVE_DARKELF_TALK1",
    "TUTORIAL_MOVE_DARKELF_TALK2",
    "TUTORIAL_MOVE_DARKELF_TALK3"
  },
  [__eClassType_Combattant] = {
    "TUTORIAL_MOVE_DARKELF_TALK1",
    "TUTORIAL_MOVE_DARKELF_TALK2",
    "TUTORIAL_MOVE_DARKELF_TALK3"
  },
  [__eClassType_Mystic] = {
    "TUTORIAL_MOVE_DARKELF_TALK1",
    "TUTORIAL_MOVE_DARKELF_TALK2",
    "TUTORIAL_MOVE_DARKELF_TALK3"
  },
  [__eClassType_Lhan] = {
    "TUTORIAL_MOVE_DARKELF_TALK1",
    "TUTORIAL_MOVE_DARKELF_TALK2",
    "TUTORIAL_MOVE_DARKELF_TALK3"
  },
  [__eClassType_RangerMan] = {
    "TUTORIAL_MOVE_DARKELF_TALK1",
    "TUTORIAL_MOVE_DARKELF_TALK2",
    "TUTORIAL_MOVE_DARKELF_TALK3"
  }
}
