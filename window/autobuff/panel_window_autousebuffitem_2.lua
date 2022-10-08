function PaGlobalFunc_AutoUseBuffItem_Open()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self:prepareOpen(false)
end
function PaGlobalFunc_AutoUseBuffItem_OpenByFairy()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self:prepareOpen(true)
end
function PaGlobalFunc_AutoUseBuffItem_Close()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self:prepareClose()
end
function PaGlobalFunc_AutoUseBuffItem_GetShow()
  local panel = Panel_Window_AutoBuff
  if panel == nil then
    return false
  end
  return panel:GetShow()
end
function PaGlobalFunc_AutoUseBuffItem_Update(deltaTime)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self:update_frame(deltaTime)
end
function HandleEventLUp_AutoUseBuffItem_ClickPresetButton(presetIndex)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if self._currentPresetIndex == presetIndex then
    return
  end
  local isActivateAutoUseBuffItemFunc = ToClient_getCurrentAutoUseModeToggleState()
  if isActivateAutoUseBuffItemFunc == true then
    ToClient_setAutoUseModeToggleState(false)
    local isActivate = ToClient_getCurrentAutoUseModeToggleState()
    self:refresh_topArea()
    if isActivate == true then
      UI.ASSERT_NAME(false, "í”„ë¦¬ì…‹ì„ ë³€ê²½í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤. ìë™ ì‚¬ìš© ê¸°ëŠ¥ ë¹„í™œì„±í™” ì²˜ë¦¬ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤.", "ì´ì£¼")
      return
    end
  end
  ToClient_setAutoUseItemPresetIndex(presetIndex)
end
function HandleEventLBUp_AutoUseBuffItem_ChangePreset(isMoveLeft)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil or isMoveLeft == nil then
    return
  end
  if isMoveLeft == true then
    if 0 < self._currentPresetIndex then
      HandleEventLUp_AutoUseBuffItem_ClickPresetButton(self._currentPresetIndex - 1)
    end
  elseif self._currentPresetIndex < self._presetMaxSize then
    HandleEventLUp_AutoUseBuffItem_ClickPresetButton(self._currentPresetIndex + 1)
  end
end
function HandleEventLUp_AutoUseBuffItem_ToggleAutoUseMode()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  local isActivateAutoUseBuffItemFunc = ToClient_getCurrentAutoUseModeToggleState()
  ToClient_setAutoUseModeToggleState(not isActivateAutoUseBuffItemFunc)
  if PaGlobalFunc_AutoUseBuffItem_GetShow() == true then
    self:refresh_topArea()
  end
end
function HandleEventLUp_AutoUseBuffItem_ToggltUseItem(categoryKeyRaw, buffCategory, elementIndex)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if ToClient_getCurrentAutoUseModeToggleState() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantAutoUseItemToggle"))
    return
  end
  local categoryKey = AutoUseBuffItemCategoryKey(categoryKeyRaw)
  local element = ToClient_getAutoUseBuffItemElement(categoryKey, buffCategory, elementIndex)
  if element:isDefined() == false then
    return
  end
  local newCheckState = not element:isChecked()
  local currentCheckCount = ToClient_getAutoUseBuffItemTotalCheckedCount()
  local checkableMaxCount = ToClient_getAutoUseBuffItemCheckableMaxCount()
  if newCheckState == true and currentCheckCount == checkableMaxCount then
    FromClient_AutoUseBuffItem_CantToggle()
    return
  end
  if newCheckState == false then
    ToClient_ToggleAutoUseBuffItem(categoryKey, buffCategory, elementIndex, false)
    return
  end
  local elementItemKey = element:getItemKey()
  local useBuffItemResult = ToClient_getUseBuffItemResultFromPreset(elementItemKey)
  if useBuffItemResult == __eUseBuffItemResult_Possible then
    ToClient_ToggleAutoUseBuffItem(categoryKey, buffCategory, elementIndex, true)
  else
    local title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_AUTOBUFF_TITLE")
    local desc = ""
    if useBuffItemResult == __eUseBuffItemResult_ExistHighLevelBuff then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOBUFF_MSG_DESC_3")
    elseif useBuffItemResult == __eUseBuffItemResult_ExistLowLevelBuff then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOBUFF_MSG_DESC_1")
    else
      UI.ASSERT_NAME(false, "useBuffItemResultê°€ ë¹„ì •ìƒì…ë‹ˆë‹¤! ë°œìƒì‹œ ê¼­ ì œë³´ ë¶€íƒë“œë¦½ë‹ˆë‹¤!", "ì´ì£¼")
      return
    end
    local function toggleUseItemFunc_yes()
      ToClient_ToggleAutoUseBuffItem(categoryKey, buffCategory, elementIndex, true)
    end
    local messageBoxData = {
      title = title,
      content = desc,
      functionYes = toggleUseItemFunc_yes,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
function HandleEventLUp_AutoUseBuffItem_ClearCurrentPreset()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if ToClient_getAutoUseBuffItemTotalCheckedCount() == 0 then
    return
  end
  if ToClient_getCurrentAutoUseModeToggleState() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantAutoUseItemToggle"))
    return
  end
  local clearPresetFunc_yes = function()
    ToClient_clearCurrentAutoUseItemPreset()
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMMON_CONFIRM"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_AUTOBUFF_RESET_CONFIRM"),
    functionYes = clearPresetFunc_yes,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function HandleEventLUp_AutoUseBuffItem_TogglePresetSafeRegionCheck()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if _ContentsGroup_AutoUseBuffSafeRegionCheck == false then
    return
  end
  local isCheckedCurrentPresetSafeRegionCheck = ToClient_getCurrentAutoUsePresetSafeRegionCheck()
  ToClient_setCurrentAutoUsePresetSafeRegionCheck(not isCheckedCurrentPresetSafeRegionCheck)
end
function HandleEventLOnOut_AutoUseBuffItem_ShowItemTooltip(isShow, categoryKeyRaw, buffCategory, elementIndex)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if isShow == false then
    Panel_Tooltip_Item_hideTooltip()
    return
  end
  local categoryKey = AutoUseBuffItemCategoryKey(categoryKeyRaw)
  local element = ToClient_getAutoUseBuffItemElement(categoryKey, buffCategory, elementIndex)
  if element == nil then
    return
  end
  local itemKey = element:getItemKey()
  local itemSSW = getItemEnchantStaticStatus(itemKey)
  if itemSSW == nil then
    return
  end
  Panel_Tooltip_Item_Show(itemSSW, Panel_Window_AutoBuff, true, false)
end
function HandleEventLOnOut_AutoUseBuffItem_ShowSimpleTooltip(isShow, tooltipType, param)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if isShow == false then
    TooltipSimple_Hide()
    return
  end
  local control, name, desc
  if tooltipType == 0 then
    control = self._ui._btn_onOffToggle
    name = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_AUTOBUFF_AVTIVATE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_AUTOBUFF_AVTIVATE_DESC")
  elseif tooltipType == 1 then
    control = self._presetButtonList[param]
    name = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_AUTOBUFF_PRESET_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_AUTOBUFF_PRESET_DESC")
  else
    UI.ASSERT_NAME(false, "ì •ì˜ë˜ì§€ ì•Šì€ ì‹¬í”Œ íˆ´íŒ íƒ€ì…ì…ë‹ˆë‹¤!!!", "ì´ì£¼")
    return
  end
  if control == nil or name == nil or desc == nil then
    return
  end
  TooltipSimple_Show(control, name, desc)
end
function HandleEventLUp_AutoUseBuffItem_ConfirmButton()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  PaGlobalFunc_AutoUseBuffItem_Close()
end
function HandleEventLUp_AutoUseBuffItem_CloseButton()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  PaGlobalFunc_AutoUseBuffItem_Close()
end
function FromClient_AutoUseBuffItem_UpdateMap()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if PaGlobalFunc_AutoUseBuffItem_GetShow() == false then
    return
  end
  self:update_once()
end
function FromClient_AutoUseBuffItem_UpdateItemToggleState(categoryKey, buffCategory, elementIndex, isChecked, itemUseOrderNo, isShowUseOrderNo)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if PaGlobalFunc_AutoUseBuffItem_GetShow() == false then
    return
  end
  self:update_itemIconState(categoryKey, buffCategory, elementIndex, isChecked, itemUseOrderNo, isShowUseOrderNo)
  self:refresh_checkItemCountArea()
end
function FromClient_AutoUseBuffItem_CantToggle()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WINDOW_AUTOBUFF_TITLE"),
    content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOBUFF_NOMOREITEM_DESC", "count", ToClient_getAutoUseBuffItemCheckableMaxCount()),
    functionApply = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FromClient_AutoUseBuffItem_UpdateModeToggleState(isOn)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self:refresh_topArea(isOn)
  self._ui._btn_onOffToggle:EraseAllEffect()
  if isOn == true then
    self._ui._btn_onOffToggle:AddEffect("fui_ingame_widget_autouse_02a", true, 0, 0)
  end
end
function FromClient_AutoUseBuffItem_ChangedAutoUseBuffPresetIndex(newPresetIndex)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self._currentPresetIndex = newPresetIndex
  for key, value in pairs(self._presetButtonList) do
    if key == self._currentPresetIndex then
      value:SetCheck(true)
    else
      value:SetCheck(false)
    end
  end
end
function FromClient_AutoUseBuffItem_ChangedLearnedFairyPotionSkill(isLearnedFairyPotionSkill)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  if isLearnedFairyPotionSkill == false and PaGlobalFunc_AutoUseBuffItem_GetShow() == true then
    PaGlobalFunc_AutoUseBuffItem_Close()
  end
end
function FromClient_AutoUseBuffItem_ChangedAutoUseItemPresetSafeRegionCheck(isChecked)
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  self._ui._btn_checkSafeRegion:SetCheck(isChecked)
end
function FromClient_AutoUseBuffItem_HandleDeadSelfPlayer()
  local self = PaGlobal_AutoUseBuffItem
  if self == nil then
    return
  end
  local isActivateAutoUseBuffItemFunc = ToClient_getCurrentAutoUseModeToggleState()
  if isActivateAutoUseBuffItemFunc == false then
    return
  end
  ToClient_setAutoUseModeToggleState(false)
  if PaGlobalFunc_AutoUseBuffItem_GetShow() == true then
    self:refresh_topArea()
  end
end
