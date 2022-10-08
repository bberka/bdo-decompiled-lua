PaGlobal_TutorialPhase_Hidel_Worker = {
  _phaseNo = 15,
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
    [1] = 323,
    [2] = 439
  },
  _talkerCharacterKeyData = {
    [1] = 41085
  },
  _itemKeyData = {
    [1] = 64616
  }
}
function PaGlobal_TutorialPhase_Hidel_Worker:checkPossibleForPhaseStart(stepNo)
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
  if explorePoint:getRemainedPoint() < 4 then
    _PA_LOG("ê³½ë¯¼ìš°", "ê³µí—Œë„ê°€ ë¶€ì¡±í•´ì„œ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. : _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local inventory = selfPlayer:get():getInventoryByType(CppEnums.ItemWhereType.eInventory)
  if nil == inventory then
    _PA_LOG("ê³½ë¯¼ìš°", "ì¸ë²¤í† ë¦¬ë¥¼ ì°¾ì„ ìˆ˜ ì—†ìŠµë‹ˆë‹¤! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local hasItem = true
  if toInt64(0, 0) == inventory:getItemCount_s64(ItemEnchantKey(64616, 0)) then
    hasItem = false
  end
  if false == hasItem then
    _PA_LOG("ê³½ë¯¼ìš°", "íŠœí† ë¦¬ì–¼ì— í•„ìš”í•œ ì¼ê¾¼ ê³„ì•½ì„œ(64616)ë¥¼ ì°¾ì„ ìˆ˜ ì—†ì–´ì„œ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local hidelPlantKey = ToClient_convertWaypointKeyToPlantKey(301)
  local townWorkerMaxCapacity = ToClient_getTownWorkerMaxCapacity(hidelPlantKey)
  local plantWaitWorkerListCount = ToClient_getPlantWaitWorkerListCount(hidelPlantKey)
  if townWorkerMaxCapacity - plantWaitWorkerListCount <= 0 then
    _PA_LOG("ê³½ë¯¼ìš°", "ê³ ìš©ëœ ì¼ê¾¼ ìˆ˜ :  " .. tostring(plantWaitWorkerListCount) .. " / ì¼ê¾¼ ìˆ˜ìš© ê°€ëŠ¥ ìˆ˜ : " .. tostring(townWorkerMaxCapacity))
    _PA_LOG("ê³½ë¯¼ìš°", "í•˜ì´ë¸ì˜ ì¼ê¾¼ ìˆ™ì†Œê°€ ëª¨ìë¼ì„œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local wheatPlantKey = ToClient_convertWaypointKeyToPlantKey(439)
  if 0 < ToClient_getPlantWorkingList(wheatPlantKey) then
    _PA_LOG("ê³½ë¯¼ìš°", "ëª¨ë ˆí‹° ê±°ëŒ€ ë†ì¥ ë°€ ì¬ë°° ë…¸ë“œì— ì´ë¯¸ ì¼ê¾¼ì´ ì¼í•˜ê³  ìˆìœ¼ë¯€ë¡œ íŠœí† ë¦¬ì–¼ì„ ì‹œì‘í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  return true
end
function PaGlobal_TutorialPhase_Hidel_Worker:checkSkippablePhase()
  if true == self._isSkippable and true == PaGlobal_TutorialManager:checkHaveOverLevelCharacter() then
    return true
  end
  return false
end
function PaGlobal_TutorialPhase_Hidel_Worker:startPhase(stepNo)
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
function PaGlobal_TutorialPhase_Hidel_Worker:startPhaseXXX(stepNo)
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("ê³½ë¯¼ìš°", "PaGlobal_TutorialPhase_Hidel_Worker:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiManager:getUiKeyButton():setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, false)
end
function PaGlobal_TutorialPhase_Hidel_Worker:endPhase()
  FGlobal_Worldmap_SetRenderMode({
    Defines.RenderMode.eRenderMode_WorldMap
  })
  PaGlobalFunc_DialogMain_All_SetRenderModeList({
    Defines.RenderMode.eRenderMode_Dialog
  })
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end
function PaGlobal_TutorialPhase_Hidel_Worker:updatePerFrame(deltaTime)
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleChangeStep(currentStep)
  if 1 == self._currentStep then
    self:changeStep1()
  elseif 2 == self._currentStep then
    self:changeStep2()
  elseif 3 == self._currentStep then
    self:changeStep3()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:toNextProgress()
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end
function PaGlobal_TutorialPhase_Hidel_Worker:toNextStep()
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end
function PaGlobal_TutorialPhase_Hidel_Worker:toStep(destStep, destProgress)
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
function PaGlobal_TutorialPhase_Hidel_Worker:addEffectUiNodeButtonByWaypointKey(waypointKey)
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if nil ~= uiNodeButton then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eraseAllEffectUiNodeButtonByWaypointKey(waypointKey)
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if nil ~= uiNodeButton then
    uiNodeButton:EraseAllEffect()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:changeStep1()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì¼ê¾¼ ê³„ì•½ì„œë¥¼ ë°›ì•˜êµ°.\nì‚¬ìš©í•´ì„œ ì¼ê¾¼ì„ ê³ ìš©í•´ë³´ì.", "<I>í‚¤ë¡œ ê°€ë°©ì„ ì—´ì–´ì„œ\nê³„ì•½ì„œë¥¼ <ìš°í´ë¦­>ìœ¼ë¡œ ì‚¬ìš©í•´ë³´ì.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiMasking:hideQuestMasking()
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì¢‹ì•„. ì´ì œ ê³ ìš©í•œ ì¼ê¾¼ì„ í™•ì¸í•´ë³´ì.", "ìš°ì„  <M>í‚¤ë¡œ ì›”ë“œë§µì„ ì—´ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 3 == self._currentProgress then
    local bottomWorkerButton = UI.getChildControl(Panel_WorldMap, "BottomMenu_WorkerList")
    bottomWorkerButton:EraseAllEffect()
    bottomWorkerButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    bottomWorkerButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì˜¤ë¥¸ìª½ í•˜ë‹¨ì— í‘œì‹œëœ ì¼ê¾¼ ëª©ë¡ ë²„íŠ¼ì´ ë³´ì´ì§€", "ì¼ê¾¼ ëª©ë¡ ë²„íŠ¼ì„ ì™¼í´ë¦­ í•´ë´.", true, getScreenSizeX() * 0,75, getScreenSizeY() * 0,65)
    end)
  elseif 4 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê³ ìš©ëœ ì¼ê¾¼ì´ ë³´ì¼ê±°ì•¼.\nì¼ê¾¼ì„ ê³ ìš©í•˜ë©´ ì—¬ëŸ¬ê°€ì§€ ì¼ì„ ëŒ€ì‹  ì‹œí‚¬ ìˆ˜ ìˆì–´.", "í™•ì¸í–ˆìœ¼ë©´ <ESC>í‚¤ë‚˜ <M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ë‹«ì•„.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 5 == self._currentProgress then
    local bottomWorkerButton = UI.getChildControl(Panel_WorldMap, "BottomMenu_WorkerList")
    bottomWorkerButton:EraseAllEffect()
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ì œ ëª¨ë ˆí‹° ë†ì¥ìœ¼ë¡œ ê°€ì„œ ì¼ê¾¼ì—ê²Œ ì¼ì„ ì‹œì¼œë³´ì.", "<M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ì—´ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 6 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("í‘œì‹œëœ ëª¨ë ˆí‹° ê±°ëŒ€ ë†ì¥ì´ ë³´ì´ì§€", "ëª¨ë ˆí‹° ê±°ëŒ€ ë†ì¥ ê±°ì ì„ ìš°í´ë¦­ í•´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 7 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì˜í–ˆì–´. ëª©ì ì§€ë¥¼ ì°¾ì•„ê°€ë ¤ë©´ ì›”ë“œë§µì„ ë‹«ì•„ì•¼ê² ì§€", "ì´ë™í•´ì•¼í•˜ë‹ˆê¹Œ <ESC>ë‚˜ <M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ë‹«ì•„.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif -1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì™œ ë²Œì¨ ì§€ë„ë¥¼ ë‹«ëŠ”ê±°ì§€", "<M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ì—´ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1AddEffectEmploymentContract(slot, slotItemKey)
  if 1 == self._currentProgress and self._itemKeyData[1] == slotItemKey then
    if true == _ContentsGroup_NewUI_Inventory_All then
      PaGlobalFunc_Inventory_All_AddSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
    else
      PaGlobal_Inventory:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1InventorySlotRClick(rClickedItemKey)
  if 1 == self._currentProgress and self._itemKeyData[1] == rClickedItemKey then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1WorldMapOpen()
  if 2 == self._currentProgress then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  elseif -1 == self._currentProgress then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1GrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  if 3 == self._currentProgress and 5 == openPanelEnum then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1WorldMapImmediatelyClose()
  if 3 == self._currentProgress or 6 == self._currentProgress then
    self._prevProgress = self._currentProgress
    self:toStep(1, -1)
  elseif 4 == self._currentProgress then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  elseif 7 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
    if true == isExploreUpgradable(self._waypointKeyData[1]) then
      if true == isWithdrawablePlant(self._waypointKeyData[1]) then
        self:toStep(3)
      elseif false == isWithdrawablePlant(self._waypointKeyData[1]) then
        self:toNextStep()
      end
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1WorldMapOpenComplete()
  if 5 == self._currentProgress then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  elseif 6 == self._currentProgress then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1ResetTownMode()
  if 6 == self._currentProgress then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep1RClickWorldMapNode(uiNodeButton)
  if 6 == self._currentProgress and self._waypointKeyData[1] == uiNodeButton:getWaypointKey() then
    self:eraseAllEffectUiNodeButtonByWaypointKey(self._waypointKeyData[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:changeStep2()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê¸¸ì•ˆë‚´ë¥¼ ë”°ë¼ê°€ë©´ <íƒí—˜ ê±°ì  ê´€ë¦¬ì>ë©”ë¥´ì‹œì•ˆëŠ ëª¨ë ˆí‹° ì—ê²Œ ë„ë‹¬í•˜ê²Œ ë ê±°ì•¼.", "ê¸¸ì•ˆë‚´ë¥¼ ë”°ë¼ ëŒ€ìƒì„ ì°¾ì•„ ë§ì„ ê±¸ì–´ë³´ì.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif 2 == self._currentProgress then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì¼ê¾¼ì—ê²Œ ì¼ì„ ì‹œí‚¬ ê±°ì ì€ ê´€ë¦¬ê°€ í•„ìš”í•´.", "ëŒ€í™”ë©”ë‰´ì¤‘ì— 'íƒí—˜ ê±°ì  ê´€ë¦¬'ë²„íŠ¼ì„ ëˆŒëŸ¬ë´.", false, getScreenSizeX() * 0,55, getScreenSizeY() * 0,45, true)
    end)
  elseif 3 == self._currentProgress then
    local positionTarget = UI.getChildControl(Panel_NodeMenu, "MainMenu_Bg")
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì¼ê¾¼ì˜ ì†Œì† ê±°ì ê³¼ ì¼ì„ í•  ê±°ì ì´ ì—°ê²° ë˜ì–´ ìˆì–´ì•¼ ì¼ê¾¼ì—ê²Œ ì¼ì„ ì‹œí‚¬ ìˆ˜ ìˆì–´.\nê±°ì ì„ ì—°ê²°í•˜ê³  ì‹¶ìœ¼ë©´ ê³µí—Œë„ë¥¼ íˆ¬ìí•´ì•¼ë¼.", "ì™¼ìª½ ìœ„ì— í‘œì‹œëœ 'ê³µí—Œë„ íˆ¬ì'ë²„íŠ¼ì„ ëˆŒëŸ¬ë³´ì.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0,5, true)
    end)
  elseif 4 == self._currentProgress then
    while true == ToClient_isTownMode() do
      FGlobal_WorldMapWindowEscape()
    end
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ì œ ê±°ì ê°„ì— ì—°ê²°ëœ ì„ ì´ ë¶‰ì–´ì§„ ê²ƒì´ ë³´ì´ì§€", "ì´ì œ <ESC>í‚¤ë‚˜ <M>í‚¤ë¥¼ ëˆŒëŸ¬ ì›”ë“œë§µì„ ë‹«ì•„.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep2BeforeShowDialog()
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(true)
  else
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep2ShowDialog(dialogData)
  if 1 == self._currentProgress then
    if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = PaGlobalFunc_DialogMain_All_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_Explore)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  elseif 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    local funcButtonIndex = PaGlobalFunc_DialogMain_All_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_Explore)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() and CppEnums.ContentsType.Contents_Explore == funcButtonType then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep2EventUpdateExplorationNode(waypointKey)
  if 3 == self._currentProgress and self._waypointKeyData[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep2WorldMapImmediatelyClose()
  if 4 == self._currentProgress then
    FGlobal_Worldmap_ResetRenderMode()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:changeStep3()
  if 1 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ì œ ì¼ê¾¼ì—ê²Œ ì¼ì„ ì‹œí‚¬ ì¤€ë¹„ë¥¼ í•´ ë³´ì.", "'ë©”ë¥´ì‹œì•ˆëŠ ëª¨ë ˆí‹°'ì—ê²Œ ê°€ì„œ ë§ì„ ê±¸ì–´ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300, true)
    end)
  elseif 2 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ìƒì‚° ê±°ì ì— íˆ¬ì í•´ ë³¼ê±°ì•¼.\në©”ë¥´ì‹œì•ˆëŠ ëª¨ë ˆí‹°ì™€ì˜ ëŒ€í™”ë©”ë‰´ì¤‘ì— ì•Œë§ì€ ê²ƒì´ ìˆì§€.", "'íƒí—˜ ê±°ì  ê´€ë¦¬'ë²„íŠ¼ì„ ëˆŒëŸ¬ë³´ì.", false, getScreenSizeX() * 0,45, getScreenSizeY() * 0,4, true)
    end)
  elseif 3 == self._currentProgress then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[2])
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("í‘œì‹œëœ ìƒì‚° ê±°ì ì´ ë³´ì´ì§€", "'ë°€ ì¬ë°°'ìƒì‚° ê±°ì ì„ ì™¼í´ë¦­ í•´ë´.", true, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,6)
    end)
  elseif 4 == self._currentProgress then
    local positionTarget = UI.getChildControl(Panel_NodeMenu, "MainMenu_Bg")
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ ê±°ì ì—ì„œ ìƒì‚°ì„ í•˜ê³  ì‹¶ìœ¼ë©´ ê³µí—Œë„ë¥¼ íˆ¬ìí•´ì•¼ë¼.", "ì™¼ìª½ ìœ„ì— í‘œì‹œëœ 'ê³µí—Œë„ íˆ¬ì'ë²„íŠ¼ì„ ëˆŒëŸ¬ë³´ì.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0,5)
    end)
  elseif 5 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ê³ ìš©ëœ ì¼ê¾¼ ëª©ë¡ì´ ë³´ì´ì§€", "ì‘ì—… ì‹œì‘ ë²„íŠ¼ì„ ëˆŒëŸ¬ë´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  elseif 6 == self._currentProgress then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
      PaGlobal_TutorialUiManager:getUiBlackSpirit():setSpiritUiForTutorial("ì´ëŸ°ì‹ìœ¼ë¡œ ì¼ê¾¼ì„ ìƒì‚° ê±°ì ì— ë³´ë‚´ì„œ ì¼ì„ ì‹œí‚¬ ìˆ˜ ìˆì–´.\nì¼ê¾¼ì´ ì¼ì„ í•˜ëŠ”ë™ì•ˆ ë„Œ ëª¨í—˜ì„ ê³„ì† í•  ìˆ˜ ìˆì§€.", "ì´ì œ <ESC>í‚¤ë‚˜ <M>í‚¤ë¡œ ì›”ë“œë§µì„ ë‹«ê³  ëª¨í—˜ì„ ê³„ì†í•˜ë„ë¡ í•´.", false, getScreenSizeX() * 0,5 - 20, getScreenSizeY() * 0,5 - 300)
    end)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3InteractionShow(actorProxyWrapper)
  local isTargetNpc = false
  if 1 == self._currentProgress then
    local actorProxyWrapper = interaction_getInteractable()
    if nil ~= actorProxyWrapper and self._talkerCharacterKeyData[1] == actorProxyWrapper:getCharacterKeyRaw() then
      isTargetNpc = true
    end
    if true == isTargetNpc then
      PaGlobalFunc_DialogMain_All_SetRenderModeList({
        Defines.RenderMode.eRenderMode_Dialog,
        Defines.RenderMode.eRenderMode_Tutorial
      })
    else
      PaGlobalFunc_DialogMain_All_SetRenderModeList({
        Defines.RenderMode.eRenderMode_Dialog,
        Defines.RenderMode.eRenderMode_Tutorial
      })
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3BeforeShowDialog()
  if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(true)
  else
    PaGlobalFunc_DialogMain_All_SetAllowTutorialPanelShow(false)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3ShowDialog(dialogData)
  if 1 == self._currentProgress then
    if self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = PaGlobalFunc_DialogMain_All_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_Explore)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  elseif 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    local funcButtonIndex = PaGlobalFunc_DialogMain_All_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_Explore)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3ClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentProgress and self._talkerCharacterKeyData[1] == dialog_getTalkNpcKey() then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    if CppEnums.ContentsType.Contents_Explore == funcButtonType then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3NodeLClick(uiNodeButton)
  if 3 == self._currentProgress and self._waypointKeyData[2] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3SetTownMode(waypointKey)
  if 3 == self._currentProgress and self._waypointKeyData[1] == waypointKey then
    self:addEffectUiNodeButtonByWaypointKey(self._waypointKeyData[2])
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3EventUpdateExplorationNode(waypointKey)
  if 4 == self._currentProgress and self._waypointKeyData[2] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3ClickPlantdoWork(plantKey, workingCount)
  if 5 == self._currentProgress then
    _PA_LOG("ê³½ë¯¼ìš°", "plantKey:getWaypointKey() : " .. tostring(plantKey:getWaypointKey()) .. " / workingCount : " .. tostring(workingCount))
    if self._waypointKeyData[2] == plantKey:getWaypointKey() then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:eventCallStep3WorldMapImmediatelyClose()
  if 6 == self._currentProgress then
    self:endPhase()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleBeforeWorldmapOpen()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapOpen()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleWorldMapOpenComplete()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapOpenComplete()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleUpdateInventorySlotData(slot, slotItemKey)
  if 1 == self._currentStep then
    self:eventCallStep1AddEffectEmploymentContract(slot, slotItemKey)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleInventorySlotRClick(rClickedItemKey)
  if 1 == self._currentStep then
    self:eventCallStep1InventorySlotRClick(rClickedItemKey)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleGrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  if 1 == self._currentStep then
    self:eventCallStep1GrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleWorldMapImmediatelyClose()
  if 1 == self._currentStep then
    self:eventCallStep1WorldMapImmediatelyClose()
  elseif 2 == self._currentStep then
    self:eventCallStep2WorldMapImmediatelyClose()
  elseif 3 == self._currentStep then
    self:eventCallStep3WorldMapImmediatelyClose()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleResetTownMode()
  if 1 == self._currentStep then
    self:eventCallStep1ResetTownMode()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleLClickWorldMapNode(uiNodeButton)
  if 3 == self._currentStep then
    self:eventCallStep3NodeLClick(uiNodeButton)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleRClickWorldMapNode(uiNodeButton)
  if 1 == self._currentStep then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleInteractionShow(actorProxyWrapper)
  if 3 == self._currentStep then
    self:eventCallStep3InteractionShow(actorProxyWrapper)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleBeforeShowDialog()
  if 2 == self._currentStep then
    self:eventCallStep2BeforeShowDialog()
  elseif 3 == self._currentStep then
    self:eventCallStep3BeforeShowDialog()
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleShowDialog(dialogData)
  if 2 == self._currentStep then
    self:eventCallStep2ShowDialog(dialogData)
  elseif 3 == self._currentStep then
    self:eventCallStep3ShowDialog(dialogData)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleClickedDialogFuncButton(funcButtonType)
  if 2 == self._currentStep then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  elseif 3 == self._currentStep then
    self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleEventUpdateExplorationNode(waypointKey)
  if 2 == self._currentStep then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  elseif 3 == self._currentStep then
    self:eventCallStep3EventUpdateExplorationNode(waypointKey)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleClickPlantdoWork(plantKey, workingCount)
  if 3 == self._currentStep then
    self:eventCallStep3ClickPlantdoWork(plantKey, workingCount)
  end
end
function PaGlobal_TutorialPhase_Hidel_Worker:handleSetTownMode(waypointKey)
  if 3 == self._currentStep then
    self:eventCallStep3SetTownMode(waypointKey)
  end
end
