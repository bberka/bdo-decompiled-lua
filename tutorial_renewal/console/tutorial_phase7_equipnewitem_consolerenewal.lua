PaGlobal_TutorialPhase_EquipNewItem = {
  _phaseNo = 7,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _updateTime = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {9},
  _startLimitLevel = 15
}
local newEquipItemNo = 11505
local eventID = PaGlobal_TutorialEventList
function PaGlobal_TutorialPhase_EquipNewItem:setState(state)
  self._state = state
end
function PaGlobal_TutorialPhase_EquipNewItem:getState()
  return self._state
end
function PaGlobal_TutorialPhase_EquipNewItem:checkPossibleForPhaseStart(stepNo)
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
    _PA_LOG("íŠœí† ë¦¬ì–¼", "íŠœí† ë¦¬ì–¼ì´ ê°€ëŠ¥í•œ ì§€ì—­ì´ ì•„ë‹ˆë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹¤í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo) .. "currentRegionKeyRaw : " .. tostring(currentRegionKeyRaw))
    return false
  end
  if self._startLimitLevel < getSelfPlayer():get():getLevel() then
    _PA_LOG("íŠœí† ë¦¬ì–¼", "ìºë¦­í„°ì˜ ë ˆë²¨ì´ " .. tostring(self._startLimitLevel) .. "ë¥¼ ì´ˆê³¼í–ˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì§„í–‰í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_EquipNewItem:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_EquipNewItem:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_EquipNewItem:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("íŠœí† ë¦¬ì–¼", "PaGlobal_TutorialPhase_EquipNewItem:startStep() stepNo : " .. tostring(stepNo))
  self._currentStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialUiManager:repositionScreen()
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  Panel_Tutorial_Renew:SetShow(true, true)
  _PA_LOG("íŠœí† ë¦¬ì–¼", "Panel_Tutorial_Renew:GetShow() : " .. tostring(Panel_Tutorial_Renew:GetShow()))
  self:setState(PaGlobal_TutorialState.eState_Start)
end
function PaGlobal_TutorialPhase_EquipNewItem:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_EquipNewItem:updatePerFrame(deltaTime)
  self:handleStep(deltaTime)
end
function PaGlobal_TutorialPhase_EquipNewItem:handleStep(deltaTime)
  if 1 == self._currentStep then
    self:Step01_SuggestCallBlackSpirit(deltaTime)
  elseif 2 == self._currentStep then
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_EquipNewItem:Step01_SuggestCallBlackSpirit(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step01_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step01_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step01_Done()
  end
end
local gainedNewEquip = false
function PaGlobal_TutorialPhase_EquipNewItem:Step01_Prepare()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:ClearEventFunctor()
  PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_UpdateInventory, function(param)
    if param._slotItemKey == newEquipItemNo then
      _PA_LOG("íŠœí† ë¦¬ì–¼", " param._currentWhereType : " .. param._currentWhereType)
      gainedNewEquip = true
    end
  end)
  Inventory_updateSlotData(true)
  if false == gainedNewEquip then
    _PA_LOG("íŠœí† ë¦¬ì–¼", "ì•„ì´í…œì´ ì—†ì–´ì„œ.. ë”ì´ìƒ ì§„í–‰í•˜ì§€ ì•ŠëŠ”ë‹¤")
    self:setState(PaGlobal_TutorialState.eState_Done)
    return
  end
  PaGlobal_TutorialUiManager:getUiBlackSpirit():showSuggestCallSpiritUi()
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_EquipNewItem:Step01_DoStep(deltaTime)
  if 1 == self._currentProgress then
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_54") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_55")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_OpenInventory, function()
      self._currentProgress = 3
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_UpdateInventory, function(param)
      if newEquipItemNo == param._slotItemKey then
        if true == _ContentsGroup_NewUI_Inventory_All then
          PaGlobalFunc_Inventory_All_AddSlotEffectForTutorial(param._slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
        else
          PaGlobal_Inventory:addSlotEffectForTutorial(param._slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
        end
      end
    end)
    self._currentProgress = self._currentProgress + 1
  elseif 2 == self._currentProgress then
  elseif 3 == self._currentProgress then
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_56")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_CloseInventory, function()
      PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
      self._currentProgress = 1
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_InventorySlotRClick, function(rClickedItemKey)
      if rClickedItemKey == newEquipItemNo then
        self._currentProgress = 5
      end
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_UpdateInventory, function(param)
      if newEquipItemNo == param._slotItemKey then
        if true == _ContentsGroup_NewUI_Inventory_All then
          PaGlobalFunc_Inventory_All_AddSlotEffectForTutorial(param._slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
        else
          PaGlobal_Inventory:addSlotEffectForTutorial(param._slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
        end
      end
    end)
    self._currentProgress = self._currentProgress + 1
  elseif 4 == self._currentProgress then
  elseif 5 == self._currentProgress then
    PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_57")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_CloseInventory, function()
      self._currentProgress = 7
    end)
    self._currentProgress = self._currentProgress + 1
  elseif 6 == self._currentProgress then
  elseif 7 == self._currentProgress then
    self:setState(PaGlobal_TutorialState.eState_Done)
  end
end
function PaGlobal_TutorialPhase_EquipNewItem:Step01_Done()
  PaGlobal_TutorialManager:ClearEventFunctor()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
