PaGlobal_TutorialPhase_BasicSkill_CombattantWomen = {
  _phaseNo = 6,
  _currentType = 0,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {88, 349},
  _startLimitLevel = 15,
  _totalScoldingCount = 3,
  _usedSkillCount = 0,
  _totalSkillCount = 2,
  _usedComboCount = 0,
  _totalComboCount = 2,
  _currentClearCount = 0,
  _totalClearCount = 2,
  _skillNoList = {
    [1] = {
      2656,
      2657,
      2658
    },
    [2] = {
      2674,
      2675,
      2676,
      2677
    },
    [3] = {
      2637,
      2638,
      2639
    }
  },
  _questData = {
    [1] = {_questGroupNo = 650, _questId = 3}
  }
}
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:checkPossibleForPhaseStart(stepNo)
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
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:startPhase(stepNo, typeNo)
  if false == self:checkPossibleForPhaseStart(stepNo) then
    return
  end
  if true == PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ phase(" .. tostring(self._phaseNo) .. ")ê°€ ë³´ìŠ¤ ì†Œí™˜ íŠœí† ë¦¬ì–¼ì„ ì¢…ë£Œì‹œí‚´! _phaseNo : " .. tostring(self._phaseNo))
  end
  local isSkippable = self:checkSkippablePhase()
  if true == isSkippable and false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo, typeNo)
  else
    self:startPhaseXXX(stepNo, typeNo)
  end
end
local navigationGuideParam
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:startPhaseXXX(stepNo, typeNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:startStep() typeNo : " .. tostring(typeNo))
  self._currentType = typeNo
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  if 1 == self._currentType then
    classType = getSelfPlayer():getClassType()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
    PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
    navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = false
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(-140505,36, 1157,95, 113244,4), navigationGuideParam, false, false, true)
    PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
    PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(false)
    PaGlobal_TutorialUiManager:hideAllTutorialUi()
    FGlobal_Panel_Radar_Show(true)
    PaGlobalFunc_Panel_TimeBar_Show(true, false)
    if false == _ContentsGroup_RenewUI then
      GameTips_Show()
      GameTips_Reposition()
    end
    FGlobal_NewQuickSlot_Update()
    QuickSlot_UpdateData()
    Panel_UIMain:SetShow(not _ContentsGroup_RenewUI_Main, true)
    Panel_SelfPlayerExpGage_SetShow(true, false)
    FGlobal_Panel_MainStatus_User_Bar_Show()
    FGlobal_ClassResource_SetShowControl(true)
    Panel_CheckedQuest:SetShow(true, false)
    PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(true)
  end
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():resetShowAll(true)
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
  PaGlobal_TutorialManager:startNextPhase()
end
local result = false
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if 1 == self._currentType then
    if 1 == self._currentStep then
      result = self:updateTryBasicSkill(deltaTime)
    elseif 2 == self._currentStep then
      result = self:updateTrySkillCombo(deltaTime)
    elseif 3 == self._currentStep then
      result = false
    end
  end
  if true == result then
    self._nextStep = self._nextStep + 1
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:handleChangeStep(currentStep)
  if 1 == self._currentType then
    if 1 == self._currentStep then
      self:changeStepTryBasicSkill()
    elseif 2 == self._currentStep then
      self:changeStepTrySkillCombo()
    elseif 3 == self._currentStep then
      self:changeStepSuggestCallBlackSpirit()
    elseif 4 == self._currentStep then
      self:endPhase()
    end
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:showUiScoldingTooManyKeyInput()
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PRESSEDKEY_DARKSPIRIT"), "", true, getScreenSizeX() * 0,5 - 150, getScreenSizeY() * 0,5)
  end)
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:changeStepTryBasicSkill()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP1"))
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyMany(false, "_button_Tab", "_m0")
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_button_Tab", "UI_ItemInstall", true, 0, 0)
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_m0", "UI_ItemInstall", true, 0, 0)
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP2"))
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyMany(false, "_m0")
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_m0", "UI_ItemInstall", true, 0, 0)
  elseif 3 == self._currentProgress then
    if self._totalSkillCount == self._usedSkillCount then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(3)
    elseif self._totalSkillCount < self._usedSkillCount then
      return
    end
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMBO_0_1") .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMMAND_0_1") .. PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyMany(false, "_button_F")
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_button_F", "UI_ItemInstall", true, 0, 0)
  elseif 4 == self._currentProgress then
    if self._totalSkillCount == self._usedSkillCount then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(4)
    elseif self._totalSkillCount < self._usedSkillCount then
      return
    end
    PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMBO_0_2") .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMMAND_0_2") .. PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
    PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyMany(false, "_button_Shift", "_m1")
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_button_Shift", "UI_ItemInstall", true, 0, 0)
    PaGlobal_TutorialUiManager:getUiKeyButton():addEffect("_m1", "UI_ItemInstall", true, 0, 0)
  end
end
local isPressedTab = false
local isPressedMouseL = false
local mouseLUpCount = 0
local isBlackSpiritScolding = false
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:updateTryBasicSkill(deltaTime)
  PaGlobal_TutorialUiManager:getUiKeyButton():ButtonToggleAll(true)
  if 1 == self._currentProgress then
    if true == keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_WeaponInOut) then
      isPressedTab = true
    end
    if true == keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      isPressedMouseL = true
    end
    if true == isPressedTab and true == isPressedMouseL then
      isPressedTab = false
      isPressedMouseL = false
      audioPostEvent_SystemUi(4, 12)
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(1)
      PaGlobal_TutorialUiManager:getUiKeyButton():eraseEffectAll()
      PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
      audioPostEvent_SystemUi(4, 12)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  elseif 2 == self._currentProgress then
    if true == keyCustom_IsUp_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      mouseLUpCount = mouseLUpCount + 1
      if self._totalScoldingCount < mouseLUpCount and false == isBlackSpiritScolding then
        isBlackSpiritScolding = true
        self:showUiScoldingTooManyKeyInput()
      end
    end
    if true == keyCustom_IsPressed_Action(CppEnums.ActionInputType.ActionInputType_Attack1) then
      self._updateTime = self._updateTime + deltaTime
    end
    if self._updateTime > 2,25 then
      audioPostEvent_SystemUi(4, 12)
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(2)
      PaGlobal_TutorialUiManager:getUiKeyButton():eraseEffectAll()
      PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
      if true == isBlackSpiritScolding then
        isBlackSpiritScolding = false
        PaGlobal_TutorialUiManager:getUiBlackSpirit():setShowAll(false)
      end
      audioPostEvent_SystemUi(4, 12)
      self._updateTime = 0
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
      return false
    end
  elseif 3 == self._currentProgress then
    if self._totalSkillCount <= self._usedSkillCount then
      self._updateTime = self._updateTime + deltaTime
      if self._updateTime > 1,25 then
        prevInputCombination = false
        isInputCombinationChanged = false
        self._usedSkillCount = 0
        self._updateTime = 0
        PaGlobal_TutorialUiManager:getUiKeyButton():eraseEffectAll()
        PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
        self._currentProgress = self._currentProgress + 1
        self:handleChangeStep(self._currentStep)
      end
    end
  elseif 4 == self._currentProgress and self._totalSkillCount <= self._usedSkillCount then
    self._updateTime = self._updateTime + deltaTime
    if self._updateTime > 1,25 then
      prevInputCombination = false
      isInputCombinationChanged = false
      self._usedSkillCount = 0
      self._updateTime = 0
      PaGlobal_TutorialUiManager:getUiKeyButton():eraseEffectAll()
      PaGlobal_TutorialUiManager:getUiKeyButton():setPrevUsingKeyAll(true)
      self._currentProgress = 1
      return true
    end
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:eventCallUsedSkill_TryBasicSkill(skillWrapper)
  local skillNo = skillWrapper:getSkillNo()
  local listNo = 0
  if 3 == self._currentProgress then
    listNo = 1
  elseif 4 == self._currentProgress then
    listNo = 2
  else
    return
  end
  for key, value in pairs(self._skillNoList[listNo]) do
    if skillNo == value then
      audioPostEvent_SystemUi(4, 12)
      self._usedSkillCount = self._usedSkillCount + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:changeStepTrySkillCombo()
  if self._totalComboCount < self._usedComboCount then
    return
  end
  self._currentClearCount = 0
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():resetClearStepEffect(true)
  PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextStep_1:SetText(PaGlobal_TutorialManager:getStringResize(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMBO_0_3"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMMAND_0_3"), 1))
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextStep_2:SetText(PaGlobal_TutorialManager:getStringResize(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMBO_0_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_STRIKERWOMEN_COMMAND_0_2"), 2))
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextStep_3:SetShow(false)
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextStep_4:SetShow(false)
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextArrow_1:SetShow(false)
  PaGlobal_TutorialUiManager:getUiHeadlineMessage()._ui._nextArrow_2:SetShow(false)
  PaGlobal_TutorialUiManager:getUiKeyButton():ButtonToggleAll(true)
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:updateTrySkillCombo(deltaTime)
  PaGlobal_TutorialUiManager:getUiKeyButton():ButtonToggleAll(true)
  if self._totalComboCount <= self._usedComboCount then
    if 1,75 < self._updateTime then
      self._updateTime = 0
      self._usedComboCount = 0
      return true
    end
    self._updateTime = self._updateTime + deltaTime
  elseif 2 == self._currentClearCount then
    if self._updateTime > 1,25 then
      self._updateTime = 0
      self:handleChangeStep(self._currentStep)
    end
    self._updateTime = self._updateTime + deltaTime
  end
  return false
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:eventCallUsedSkill_TrySkillCombo(skillWrapper)
  local listNo = 0
  local skillNo = skillWrapper:getSkillNo()
  if 0 == self._currentClearCount then
    listNo = 3
  elseif 1 == self._currentClearCount then
    listNo = 2
  else
    return
  end
  for key, value in pairs(self._skillNoList[listNo]) do
    if skillNo == value then
      PaGlobal_TutorialUiManager:getUiHeadlineMessage():addClearStepEffect(self._currentClearCount + 1)
      self._currentClearCount = self._currentClearCount + 1
      audioPostEvent_SystemUi(4, 12)
      if self._currentClearCount == self._totalClearCount then
        self._usedComboCount = self._usedComboCount + 1
        PaGlobal_TutorialUiManager:getUiHeadlineMessage():setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
      end
    end
  end
end
local isAcceptedQuest = false
local isClearQuest = false
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:changeStepSuggestCallBlackSpirit()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiBlackSpirit():showSuggestCallSpiritUi()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  if 1 == self._currentProgress and questGroupNo == self._questData[1]._questGroupNo and questId == self._questData[1]._questId then
    isAcceptedQuest = true
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:eventCallAfterBlackSpiritDialogClose()
  if 1 == self._currentProgress and true == isAcceptedQuest then
    isAcceptedQuest = false
    Panel_CheckedQuest:SetShow(false)
    Panel_CheckedQuest:SetShow(true, true)
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:handleEventQuestUpdateNotify(isAccept, questNoRaw)
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if 1 == self._currentType and 3 == self._currentStep and true == isAccept then
    self:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:handleAfterAndPopFlush()
  if 1 == self._currentType and 3 == self._currentStep then
    self:eventCallAfterBlackSpiritDialogClose()
  end
end
function PaGlobal_TutorialPhase_BasicSkill_CombattantWomen:handleEventSelfPlayerUsedSkill(skillWrapper)
  if nil ~= skillWrapper and 1 == self._currentType then
    if 1 == self._currentStep then
      self:eventCallUsedSkill_TryBasicSkill(skillWrapper)
    elseif 2 == self._currentStep then
      self:eventCallUsedSkill_TrySkillCombo(skillWrapper)
    end
  end
end
