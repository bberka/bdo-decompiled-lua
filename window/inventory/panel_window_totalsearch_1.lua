function PaGlobal_TotalSearch:initialize()
  if self._initialize == true then
    return
  end
  self._isPadMode = _ContentsGroup_UsePadSnapping
  self._isConsole = self._isPadMode and ToClient_isConsole()
  self:initialize_titleArea()
  self:initialize_editBoxArea()
  self:initialize_searchResultArea()
  self:initialize_keyGuideArea()
  self:registEventHandler()
  self:validate()
  self:clear()
  self._initialize = true
end
function PaGlobal_TotalSearch:initialize_titleArea()
  if Panel_Window_TotalSearch == nil then
    return
  end
  local titleArea = UI.getChildControl(Panel_Window_TotalSearch, "Static_TitleArea")
  local btn_close = UI.getChildControl(titleArea, "Button_Close")
  if self._isPadMode == true then
    btn_close:SetShow(false)
  else
    btn_close:SetShow(true)
    btn_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_TotalSearch_Close()")
  end
end
function PaGlobal_TotalSearch:initialize_editBoxArea()
  if Panel_Window_TotalSearch == nil then
    return
  end
  self._ui._edt_search = UI.getChildControl(Panel_Window_TotalSearch, "Edit_SearchText")
  self._ui._stc_keyGuideX = UI.getChildControl(self._ui._edt_search, "StaticText_XButton")
  self._ui._btn_search = UI.getChildControl(self._ui._edt_search, "Button_Search")
  self._ui._btn_reset = UI.getChildControl(self._ui._edt_search, "Button_Reset")
  self._ui._edt_search:SetMaxInput(30)
  if self._isConsole == true then
    self._ui._edt_search:setXboxVirtualKeyBoardEndEvent("HandleEventLUp_TotalSearch_DoSearchByConsole")
  else
    self._ui._edt_search:RegistReturnKeyEvent("HandleEventLUp_TotalSearch_DoSearch()")
  end
  if self._isPadMode == true then
    Panel_Window_TotalSearch:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_TotalSearch_SetFocusEdit()")
  else
    self._ui._btn_search:addInputEvent("Mouse_LUp", "HandleEventLUp_TotalSearch_DoSearch()")
    self._ui._btn_reset:addInputEvent("Mouse_LUp", "HandleEventLUp_TotalSearch_DoReset()")
  end
end
function PaGlobal_TotalSearch:initialize_searchResultArea()
  if Panel_Window_TotalSearch == nil then
    return
  end
  self._ui._lst_searchResult = UI.getChildControl(Panel_Window_TotalSearch, "List2_Search")
  self._ui._stc_emptyResult = UI.getChildControl(self._ui._lst_searchResult, "StaticText_SearchNoResult")
  self._ui._stc_defaultGuideText = UI.getChildControl(self._ui._lst_searchResult, "MultilineText_Defalt")
  local content = UI.getChildControl(self._ui._lst_searchResult, "List2_2_Content")
  local stc_result = UI.getChildControl(content, "StaticText_Result")
  local itemSlotBg = UI.getChildControl(stc_result, "Static_ItemSlotBG")
  local searchItemSlot = {}
  SlotItem.new(searchItemSlot, "SearchResult_ItemSlot_", 0, itemSlotBg, self._slotConfig)
  searchItemSlot:createChild()
  searchItemSlot:clearItem()
  searchItemSlot.icon:SetPosX(0)
  searchItemSlot.icon:SetPosY(0)
  searchItemSlot.icon:SetShow(false)
  searchItemSlot.border:SetSize(44, 44)
  local searchSilverSlot = {}
  SlotItem.new(searchSilverSlot, "SearchResult_SilverSlot_", 0, itemSlotBg, self._silverSlotConfig)
  searchSilverSlot:createChild()
  searchSilverSlot:clearItem()
  searchSilverSlot.icon:SetPosX(0)
  searchSilverSlot.icon:SetPosY(0)
  searchSilverSlot.icon:SetShow(false)
  searchSilverSlot.border:SetSize(44, 44)
  self._ui._lst_searchResult:registEvent(__ePAUIList2EventType_LuaChangeContent, "PaGlobalFunc_TotalSearch_OnCreateSearchResult")
  self._ui._lst_searchResult:createChildContent(__ePAUIList2ElementManagerType_List)
end
function PaGlobal_TotalSearch:initialize_keyGuideArea()
  if Panel_Window_TotalSearch == nil then
    return
  end
  self._ui._stc_keyGuideArea = UI.getChildControl(Panel_Window_TotalSearch, "Static_KeyGuide_Bg")
  self._ui._stc_keyGuide_Y = UI.getChildControl(self._ui._stc_keyGuideArea, "StaticText_Y_ConsoleUI")
  if self._isPadMode == true then
    self._ui._stc_keyGuideArea:SetShow(true)
  else
    self._ui._stc_keyGuideArea:SetShow(false)
    return
  end
  local keyGuideB = UI.getChildControl(self._ui._stc_keyGuideArea, "StaticText_B_ConsoleUI")
  local keyGuideList = Array.new()
  keyGuideList:push_back(self._ui._stc_keyGuide_Y)
  keyGuideList:push_back(keyGuideB)
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._stc_keyGuideArea, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT, nil, nil)
  self._ui._stc_keyGuide_Y:SetShow(false)
  Panel_Window_TotalSearch:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "HandleEventKeyGuideY_TotalSearch_ShowItemTooltip()")
end
function PaGlobal_TotalSearch:registEventHandler()
  if Panel_Window_TotalSearch == nil then
    return
  end
end
function PaGlobal_TotalSearch:prepareOpen()
  if Panel_Window_TotalSearch == nil then
    return
  end
  if self._isPadMode == false then
    SetFocusEdit(self._ui._edt_search)
  end
  self:recalcPanelPosition()
  self:open()
end
function PaGlobal_TotalSearch:open()
  if Panel_Window_TotalSearch == nil then
    return
  end
  Panel_Window_TotalSearch:SetShow(true)
  if self._isPadMode == true then
    Panel_Window_TotalSearch:ignorePadSnapMoveToOtherPanel()
  end
end
function PaGlobal_TotalSearch:prepareClose()
  if Panel_Window_TotalSearch == nil then
    return
  end
  if self._isConsole == true then
    PaGlobalFunc_TooltipInfo_Close()
  else
    Panel_Tooltip_Item_hideTooltip()
  end
  HandleEventLOnOut_TotalSearch_ShowWhereName(false, nil)
  self._lastMouseOnListIndex = nil
  self._ui._stc_keyGuide_Y:SetShow(false)
  self._isWareHouseOpen = false
  self._isWorldMapOpen = false
  self:clear()
  self:close()
end
function PaGlobal_TotalSearch:close()
  if Panel_Window_TotalSearch == nil then
    return
  end
  Panel_Window_TotalSearch:SetShow(false)
end
function PaGlobal_TotalSearch:validate()
  if Panel_Window_TotalSearch == nil then
    return
  end
  self._ui._edt_search:isValidate()
  self._ui._stc_keyGuideX:isValidate()
  self._ui._btn_search:isValidate()
  self._ui._btn_reset:isValidate()
  self._ui._lst_searchResult:isValidate()
  self._ui._stc_emptyResult:isValidate()
  self._ui._stc_defaultGuideText:isValidate()
  self._ui._stc_keyGuideArea:isValidate()
  self._ui._stc_keyGuide_Y:isValidate()
end
function PaGlobal_TotalSearch:recalcPanelPosition()
  local panel = Panel_Window_TotalSearch
  if panel == nil then
    return
  end
  local screenCenterX = getScreenSizeX() / 2
  local screenCenterY = getScreenSizeY() / 2
  local panelSizeX = panel:GetSizeX()
  local panelSizeY = panel:GetSizeY()
  local calcPosX = 0
  local calcPosY = 0
  if self._isWareHouseOpen == true and PaGlobalFunc_WareHouse_All_GetSortControlPosition ~= nil then
    local targetPosX, targetPosY = PaGlobalFunc_WareHouse_All_GetSortControlPosition()
    calcPosX = targetPosX - panelSizeX - 20
    calcPosY = targetPosY
  else
    calcPosX = screenCenterX - panelSizeX / 2
    calcPosY = screenCenterY - panelSizeY / 2
  end
  if calcPosX < 0 then
    calcPosX = 0
  end
  if calcPosY < 0 then
    calcPosY = 0
  end
  panel:SetPosX(calcPosX)
  panel:SetPosY(calcPosY)
end
function PaGlobal_TotalSearch:convert_itemGradeColor(grade)
  if 0 == grade then
    return Defines.Color.C_FFFFFFFF
  elseif 1 == grade then
    return Defines.Color.C_FF5DFF70
  elseif 2 == grade then
    return Defines.Color.C_FF4B97FF
  elseif 3 == grade then
    return Defines.Color.C_FFFFC832
  elseif 4 == grade then
    return Defines.Color.C_FFFF6C00
  else
    return Defines.Color.C_FFFFFFFF
  end
end
function PaGlobal_TotalSearch:createSearchResultContent(content, key)
  if Panel_Window_TotalSearch == nil or content == nil or key == nil then
    return
  end
  local index = Int64toInt32(key)
  local searchResultData = ToClient_getUserBaseITemSearchResultWrapper(index)
  if searchResultData == nil then
    return
  end
  local stc_result = UI.getChildControl(content, "StaticText_Result")
  local stc_itemSlotBg = UI.getChildControl(stc_result, "Static_ItemSlotBG")
  local stc_itemName = UI.getChildControl(stc_itemSlotBg, "StaticText_ItemName")
  local stc_itemLocate = UI.getChildControl(stc_itemSlotBg, "StaticText_Locate")
  local searchItemSSW = getItemEnchantStaticStatus(searchResultData:getItemKey())
  if searchItemSSW == nil then
    return
  end
  local itemSlotIcon = UI.getChildControl(stc_itemSlotBg, "Static_SearchResult_ItemSlot_")
  local silverSlotIcon = UI.getChildControl(stc_itemSlotBg, "Static_SearchResult_SilverSlot_")
  local itemSlot = {}
  local isSilver = searchItemSSW:isMoney()
  if isSilver == true then
    SlotItem.reInclude(itemSlot, "SearchResult_SilverSlot_", 0, stc_itemSlotBg, self._silverSlotConfig)
    itemSlot:clearItem()
    itemSlot:setItemByStaticStatus(searchItemSSW)
    silverSlotIcon:SetShow(true)
    itemSlotIcon:addInputEvent("Mouse_On", "")
    itemSlotIcon:addInputEvent("Mouse_Out", "")
    itemSlotIcon:SetShow(false)
  else
    SlotItem.reInclude(itemSlot, "SearchResult_ItemSlot_", 0, stc_itemSlotBg, self._slotConfig)
    itemSlot:clearItem()
    itemSlot:setItemByStaticStatus(searchItemSSW, searchResultData:getItemCount(), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, true)
    itemSlotIcon:SetShow(true)
    silverSlotIcon:addInputEvent("Mouse_On", "")
    silverSlotIcon:addInputEvent("Mouse_Out", "")
    silverSlotIcon:SetShow(false)
  end
  itemSlot.icon:addInputEvent("Mouse_On", "HandleEventLOnOut_TotalSearch_SearchItem(true," .. tostring(key) .. ")")
  itemSlot.icon:addInputEvent("Mouse_Out", "HandleEventLOnOut_TotalSearch_SearchItem(false," .. tostring(key) .. ")")
  local itemGrade = searchItemSSW:getGradeType()
  local itemGradeColor = self:convert_itemGradeColor(itemGrade)
  stc_itemName:SetTextMode(__eTextMode_Limit_AutoWrap)
  stc_itemName:setLineCountByLimitAutoWrap(1)
  if isSilver == true then
    stc_itemName:SetText(searchResultData:getItemName() .. " (" .. makeDotMoney(searchResultData:getItemCount()) .. ")")
  else
    local enchantLevel = searchItemSSW:get()._key:getEnchantLevel()
    local itemName = searchResultData:getItemName()
    if searchItemSSW:getItemType() == 1 and enchantLevel > 15 then
      itemName = HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemName
    elseif enchantLevel > 0 and CppEnums.ItemClassifyType.eItemClassify_Accessory == searchItemSSW:getItemClassify() and searchItemSSW:isSpecialEnchantItem() == false then
      itemName = HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemName
    end
    stc_itemName:SetText(itemName)
  end
  stc_itemName:SetFontColor(itemGradeColor)
  local resultText
  local searchWhereType = searchResultData:getSearchWhereType()
  if searchWhereType == __eUserBaseItemSearchResultWhereType_MyInventory then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_MY", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_MyCashInventory then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_MY_PEARL", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_MyEquipment then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_EQUIP_MY", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_FamilyInventory then
    resultText = PAGetString(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_FAMILLY")
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_OtherInventory then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_OtherCashInventory then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_PEARL", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_OtherEquipment then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_EQUIP", "character", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_WareHouse then
    resultText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_WAREHOUSE", "region", searchResultData:getWhereName())
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_MarketWallet then
    resultText = PAGetString(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_MARKET")
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_MyInventoryBag then
    local splitWhere = string.split(searchResultData:getWhereName(), ";")
    resultText = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_MY_BAG", "itemname", splitWhere[2], "character", splitWhere[1])
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_MyCashInventoryBag then
    local splitWhere = string.split(searchResultData:getWhereName(), ";")
    resultText = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_CHARACTER_INVEN_MY_PEARL_BAG", "itemname", splitWhere[2], "character", splitWhere[1])
  elseif searchWhereType == __eUserBaseItemSearchResultWhereType_BlackSpiritBag then
    resultText = PAGetString(Defines.StringSheet_GAME, "LUA_TOTALSEARCH_RESULT_BLACKBAG")
  else
    UI.ASSERT_NAME(false, "searchWhereTypeì´ ë¹„ì •ìƒì…ë‹ˆë‹¤. ìƒˆë¡œìš´ íƒ€ì…ì´ ì¶”ê°€ë˜ì—ˆë‹¤ë©´ ì—¬ê¸°ë„ ì‘ì—…í•´ì£¼ì„¸ìš”.", "ì´ì£¼")
    return
  end
  if resultText ~= nil then
    stc_itemLocate:SetTextMode(__eTextMode_Limit_AutoWrap)
    stc_itemLocate:setLineCountByLimitAutoWrap(1)
    stc_itemLocate:SetText(resultText)
    if stc_itemLocate:IsLimitText() == true then
      stc_itemLocate:SetIgnore(false)
      stc_itemLocate:addInputEvent("Mouse_On", "HandleEventLOnOut_TotalSearch_ShowWhereName(true," .. tostring(key) .. ")")
      stc_itemLocate:addInputEvent("Mouse_Out", "HandleEventLOnOut_TotalSearch_ShowWhereName(false," .. tostring(key) .. ")")
    else
      stc_itemLocate:SetIgnore(true)
      stc_itemLocate:addInputEvent("Mouse_On", "")
      stc_itemLocate:addInputEvent("Mouse_Out", "")
    end
  end
end
function PaGlobal_TotalSearch:doSearch()
  if Panel_Window_TotalSearch == nil then
    return
  end
  local inputText = self._ui._edt_search:GetEditText()
  if inputText == nil or inputText == "" then
    return
  end
  local listManager = self._ui._lst_searchResult:getElementManager()
  if listManager == nil then
    return
  end
  ToClient_DoUserBaseItemSearch(inputText)
  listManager:clearKey()
  local searchResultCount = ToClient_getUserBaseItemSearchResultCount()
  if searchResultCount == 0 then
    if self._isPadMode == true then
      self._ui._btn_reset:SetShow(false)
      self._ui._stc_keyGuideX:SetShow(true)
    else
      self._ui._btn_reset:SetShow(true)
      self._ui._stc_keyGuideX:SetShow(false)
    end
    self._ui._btn_search:SetShow(false)
    self._ui._stc_emptyResult:SetShow(true)
    self._ui._stc_defaultGuideText:SetShow(false)
    return
  else
    if self._isPadMode == true then
      self._ui._btn_reset:SetShow(false)
      self._ui._stc_keyGuideX:SetShow(true)
    else
      self._ui._btn_reset:SetShow(true)
      self._ui._stc_keyGuideX:SetShow(false)
    end
    self._ui._btn_search:SetShow(false)
    self._ui._stc_emptyResult:SetShow(false)
    self._ui._stc_defaultGuideText:SetShow(false)
    if self._isWareHouseOpen == true and Warehouse_updateSlotData ~= nil then
      Warehouse_updateSlotData()
    end
  end
  for index = 0, searchResultCount - 1 do
    listManager:pushKey(toInt64(0, index))
  end
end
function PaGlobal_TotalSearch:clear()
  if Panel_Window_TotalSearch == nil then
    return
  end
  self._ui._edt_search:SetEditText("")
  self._ui._btn_reset:SetShow(false)
  if self._isPadMode == true then
    self._ui._stc_keyGuideX:SetShow(true)
    self._ui._btn_search:SetShow(false)
  else
    self._ui._stc_keyGuideX:SetShow(false)
    self._ui._btn_search:SetShow(true)
  end
  local listManager = self._ui._lst_searchResult:getElementManager()
  if listManager ~= nil then
    listManager:clearKey()
  end
  self._ui._stc_emptyResult:SetShow(false)
  self._ui._stc_defaultGuideText:SetShow(true)
  ToClient_clearUserBaseItemSearchResult()
end
