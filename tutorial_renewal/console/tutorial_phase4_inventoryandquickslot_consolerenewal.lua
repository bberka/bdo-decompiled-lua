PaGlobal_TutorialPhase_InventoryAndQuickSlot = {
  _phaseNo = 4,
  _currentStep = 0,
  _nextStep = 0,
  _currentProgress = 1,
  _returnStep = 0,
  _returnProgress = 0,
  _isPhaseOpen = true,
  _isSkippable = true,
  _regionKeyRawList = {9},
  _startLimitLevel = 15
}
local beginnerPotionItemKey = 502
local enabledEffectSlotInQuickSlot
local eventID = PaGlobal_TutorialEventList
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:setState(state)
  self._state = state
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:getState()
  return self._state
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:checkPossibleForPhaseStart(stepNo)
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
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:startPhaseXXX(stepNo)
  self:endPhase()
  return
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:endPhase()
  self._currentStep = 0
  self._nextStep = 1
  PaGlobal_TutorialManager:startNextPhase()
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:updatePerFrame(deltaTime)
  self:handleStep(deltaTime)
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:handleStep(deltaTime)
  if 1 == self._currentStep then
    self:Step01_UsePotionInInventory()
  elseif 2 == self._currentStep then
    self:endPhase()
  elseif -1 == self._currentStep then
    self:changeStepExceptionClosedInventory()
  end
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:Step01_UsePotionInInventory(deltaTime)
  local currentState = self:getState()
  if PaGlobal_TutorialState.eState_Start == currentState then
    self:Step01_Prepare()
  elseif PaGlobal_TutorialState.eState_Do == currentState then
    self:Step01_DoStep(deltaTime)
  elseif PaGlobal_TutorialState.eState_Done == currentState then
    self:Step01_Done()
  end
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:Step01_Prepare()
  self:setState(PaGlobal_TutorialState.eState_Do)
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:Step01_DoStep(deltaTime)
  if 1 == self._currentProgress then
    PaGlobalFunc_QuickSlot_SetShow(false, false)
    local isInvenOpen = false
    if true == _ContentsGroup_NewUI_Inventory_All then
      isInvenOpen = Panel_Window_Inventory_All:GetShow()
    else
      isInvenOpen = Panel_Window_Inventory:GetShow()
    end
    if true == isInvenOpen then
      self._currentProgress = 3
      return
    end
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_38") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_TEXT_4")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_OpenInventory, function()
      _AudioPostEvent_SystemUiForXBOX(4, 12)
      self._currentProgress = 3
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_UpdateInventory, function(param)
      if beginnerPotionItemKey == param._slotItemKey then
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
    Inventory_updateSlotData(true)
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_70") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_TEXT_5")
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(message)
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_InventorySlotRClick, function(rClickedItemKey)
      if beginnerPotionItemKey == rClickedItemKey then
        _AudioPostEvent_SystemUiForXBOX(4, 12)
        self._currentProgress = 5
      end
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_CloseInventory, function()
      PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
      _AudioPostEvent_SystemUiForXBOX(4, 12)
      self._currentProgress = 1
    end)
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_UpdateInventory, function(param)
      if beginnerPotionItemKey == param._slotItemKey then
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
    Inventory_updateSlotData(true)
    PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
    PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial_Desc(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIALXB_TEXT_6"))
    PaGlobal_TutorialManager:ClearEventFunctor()
    PaGlobal_TutorialManager:AddEventFunctor(eventID.TutorialEvent_CloseInventory, function()
      _AudioPostEvent_SystemUiForXBOX(4, 12)
      self._currentProgress = 7
    end)
    self._currentProgress = self._currentProgress + 1
  elseif 6 == self._currentProgress then
  elseif 7 == self._currentProgress then
    self:setState(PaGlobal_TutorialState.eState_Done)
  end
end
function PaGlobal_TutorialPhase_InventoryAndQuickSlot:Step01_Done()
  PaGlobal_TutorialManager:ClearEventFunctor()
  self._updateTime = 0
  self._currentProgress = 1
  self._currentStep = self._currentStep + 1
  self:setState(PaGlobal_TutorialState.eState_Start)
end
