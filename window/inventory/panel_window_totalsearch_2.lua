function PaGlobalFunc_TotalSearch_Open()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self._isWareHouseOpen = false
  self._isWorldMapOpen = false
  self:prepareOpen()
end
function PaGlobalFunc_TotalSearch_OpenByWareHouse()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self._isWareHouseOpen = true
  self._isWorldMapOpen = ToClient_WorldMapIsShow()
  if self._isWorldMapOpen == true then
    self:recalcPanelPosition()
    WorldMapPopupManager:push(Panel_Window_TotalSearch, true)
  else
    self:prepareOpen()
  end
end
function PaGlobalFunc_TotalSearch_Close()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  if self._isWorldMapOpen == true then
    WorldMapPopupManager:popWantPanel(Panel_Window_TotalSearch)
  else
    self:prepareClose()
  end
end
function PaGlobalFunc_TotalSearch_GetShow()
  local panel = Panel_Window_TotalSearch
  if panel == nil then
    return false
  end
  return panel:GetShow()
end
function PaGlobalFunc_TotalSearch_OnCreateSearchResult(content, key)
  local self = PaGlobal_TotalSearch
  if self == nil or content == nil or key == nil then
    return
  end
  self:createSearchResultContent(content, key)
end
function PaGlobalFunc_TotalSearch_SetFocusEdit()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self._lastMouseOnListIndex = nil
  self._ui._stc_keyGuide_Y:SetShow(false)
  if self._isConsole == true then
    PaGlobalFunc_TooltipInfo_Close()
  else
    Panel_Tooltip_Item_hideTooltip()
  end
  SetFocusEdit(self._ui._edt_search)
end
function HandleEventLUp_TotalSearch_DoSearchByConsole(str)
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self._ui._edt_search:SetEditText(str)
  self:doSearch()
end
function HandleEventLUp_TotalSearch_DoSearch()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self:doSearch()
end
function HandleEventLUp_TotalSearch_DoReset()
  local self = PaGlobal_TotalSearch
  if self == nil then
    return
  end
  self:clear()
end
function HandleEventKeyGuideY_TotalSearch_ShowItemTooltip()
  local self = PaGlobal_TotalSearch
  if self == nil or self._lastMouseOnListIndex == nil then
    return
  end
  local searchResultData = ToClient_getUserBaseITemSearchResultWrapper(self._lastMouseOnListIndex)
  if searchResultData == nil then
    return
  end
  local itemSSW = getItemEnchantStaticStatus(searchResultData:getItemKey())
  if itemSSW == nil then
    return
  end
  if self._isConsole == true then
    PaGlobalFunc_TooltipInfo_Open(Defines.TooltipDataType.ItemSSWrapper, itemSSW, Defines.TooltipTargetType.Item, 0, getScreenSizeX())
  elseif self._isPadMode == true then
    Panel_Tooltip_Item_Show(itemSSW, Panel_Window_TotalSearch, true, false)
  end
end
function HandleEventLOnOut_TotalSearch_SearchItem(isShow, s64_key)
  local self = PaGlobal_TotalSearch
  if self == nil or isShow == nil or s64_key == nil then
    return
  end
  local index = Int64toInt32(s64_key)
  local searchResultData = ToClient_getUserBaseITemSearchResultWrapper(index)
  if searchResultData == nil then
    return
  end
  local itemSSW = getItemEnchantStaticStatus(searchResultData:getItemKey())
  if itemSSW == nil then
    return
  end
  if isShow == false then
    self._ui._stc_keyGuide_Y:SetShow(false)
    self._lastMouseOnListIndex = nil
    if self._isConsole == true then
      PaGlobalFunc_TooltipInfo_Close()
    else
      Panel_Tooltip_Item_hideTooltip()
    end
    return
  end
  if self._isPadMode == true then
    self._lastMouseOnListIndex = Int64toInt32(s64_key)
    self._ui._stc_keyGuide_Y:SetShow(true)
    return
  end
  Panel_Tooltip_Item_Show(itemSSW, Panel_Window_TotalSearch, true, false)
end
function HandleEventLOnOut_TotalSearch_ShowWhereName(isShow, s64_key)
  local self = PaGlobal_TotalSearch
  if self == nil or isShow == nil then
    return
  end
  if isShow == false then
    TooltipSimple_Hide()
    return
  end
  local content = self._ui._lst_searchResult:GetContentByKey(s64_key)
  if content == nil then
    return
  end
  local stc_result = UI.getChildControl(content, "StaticText_Result")
  local stc_itemSlotBg = UI.getChildControl(stc_result, "Static_ItemSlotBG")
  local stc_itemLocate = UI.getChildControl(stc_itemSlotBg, "StaticText_Locate")
  TooltipSimple_Show(stc_itemLocate, "", stc_itemLocate:GetText())
end
