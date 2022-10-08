function PaGlobal_Inventory_All:initialize()
  if nil == Panel_Window_Inventory_All or true == PaGlobal_Inventory_All._initialize then
    return
  end
  PaGlobal_Inventory_All:controlInit()
  PaGlobal_Inventory_All:createSlot()
  PaGlobal_Inventory_All:setData()
  PaGlobal_Inventory_All:registerEventHandler()
  PaGlobal_Inventory_All:validate()
  PaGlobal_Inventory_All._initialize = true
end
function PaGlobal_Inventory_All:controlInit()
  self._ui.stc_titleBG = UI.getChildControl(Panel_Window_Inventory_All, "StaticText_Title")
  self._ui.check_popup = UI.getChildControl(self._ui.stc_titleBG, "CheckButton_PopUp")
  self._ui.btn_question = UI.getChildControl(self._ui.stc_titleBG, "Button_Question")
  self._ui.btn_close = UI.getChildControl(self._ui.stc_titleBG, "Button_Win_Close")
  self._ui.stc_radioButtonBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_RadioButtonBg")
  self._ui.rdo_normalInven = UI.getChildControl(self._ui.stc_radioButtonBG, "RadioButton_NormalInventory")
  self._ui.rdo_pearlInven = UI.getChildControl(self._ui.stc_radioButtonBG, "RadioButton_CashInventory")
  if true == _ContentsGroup_changeFamilyInvenOpenAction then
    self._ui.rdo_familyInven = UI.getChildControl(self._ui.stc_radioButtonBG, "RadioButton_FamilyInventory")
  else
    self._ui.rdo_familyInven = UI.getChildControl(self._ui.stc_radioButtonBG, "Button_FamilyInventory")
  end
  self._ui.stc_pearlInvenEffect = UI.getChildControl(self._ui.rdo_pearlInven, "Static_New_Effect")
  self._ui.stc_selectbar = UI.getChildControl(self._ui.stc_radioButtonBG, "Static_SelectBar")
  self._ui.btn_olympicFilter = UI.getChildControl(self._ui.stc_radioButtonBG, "Button_CheckItem")
  self._ui.stc_topItemSortBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_TopItemSortBG")
  self._ui.btn_checkSort = UI.getChildControl(self._ui.stc_topItemSortBG, "CheckButton_ItemSort")
  self._ui.button_sortOption = UI.getChildControl(self._ui.stc_topItemSortBG, "Button_Sort_Set")
  self._ui.txt_capacity = UI.getChildControl(self._ui.stc_topItemSortBG, "Static_Text_Capacity")
  local searchBG = UI.getChildControl(self._ui.stc_topItemSortBG, "Static_Search_BG")
  self._ui.edit_search = UI.getChildControl(searchBG, "Edit_SearchText_PCUI_Import")
  self._ui.btn_search = UI.getChildControl(searchBG, "Button_BtnSearch_PCUI")
  self._ui.txt_searchDefaultText = UI.getChildControl(searchBG, "StaticText_DefaultSearchText")
  self._ui.btn_searchReset = UI.getChildControl(searchBG, "Button_SearchReset")
  self._ui.stc_mainSlotBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_MainSlotBG")
  self._ui.scroll_inven = UI.getChildControl(self._ui.stc_mainSlotBG, "Scroll_CashInven")
  self._ui.stc_scrollArea = UI.getChildControl(Panel_Window_Inventory_All, "Scroll_Area")
  self._ui.template_slotBG = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_Slot_Temp")
  self._ui.template_slot = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_SlotBG_Temp")
  self._ui.template_lockSlot = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_LockSlot_Temp")
  self._ui.template_plusSlot = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_PlusSlot")
  self._ui.template_onlyPlus = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_OnlyPlus")
  self._ui.template_btnPuzzle = UI.getChildControl(Panel_Window_Inventory_All, "Button_Puzzle")
  self._ui.template_olympic = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_OlympicFilter")
  self._ui.template_delete = UI.getChildControl(self._ui.stc_mainSlotBG, "Static_Check")
  self._ui.template_delete:SetShow(false)
  self._ui.stc_bottomBG = UI.getChildControl(Panel_Window_Inventory_All, "Inventory_BottomBG")
  self._ui.stc_weightBG = UI.getChildControl(self._ui.stc_bottomBG, "Static_Texture_Weight_Background")
  self._ui.btn_buyWeight = UI.getChildControl(self._ui.stc_weightBG, "Button_BuyWeight")
  self._ui.progress_weight = UI.getChildControl(self._ui.stc_weightBG, "Progress2_Weight")
  self._ui.progress_equipment = UI.getChildControl(self._ui.stc_weightBG, "Progress2_Equipment")
  self._ui.stc_weightIcon = UI.getChildControl(self._ui.stc_weightBG, "Static_WeightIcon")
  self._ui.txt_weightValue = UI.getChildControl(self._ui.stc_weightBG, "StaticText_Weight")
  self._ui.stc_weightTooltipBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_WeightHelp_BG")
  self._ui.txt_weightDesc = UI.getChildControl(Panel_Window_Inventory_All, "StaticText_Weight_Help")
  self._ui.txt_equipDesc = UI.getChildControl(Panel_Window_Inventory_All, "StaticText_Equip_Help")
  self._ui.txt_moneyDesc = UI.getChildControl(Panel_Window_Inventory_All, "StaticText_MoneyHelp")
  self._ui.stc_moneyBG = UI.getChildControl(self._ui.stc_bottomBG, "Static_MoneyTypeBG")
  self._ui.stc_moneyIcon = UI.getChildControl(self._ui.stc_moneyBG, "Button_Money")
  self._ui.txt_moneyValue = UI.getChildControl(self._ui.stc_moneyBG, "Static_Text_Money")
  self._ui.stc_pearlIcon = UI.getChildControl(self._ui.stc_moneyBG, "Static_PearlIcon")
  self._ui.txt_pearlValue = UI.getChildControl(self._ui.stc_moneyBG, "StaticText_PearlValue")
  self._ui.stc_mileageIcon = UI.getChildControl(self._ui.stc_moneyBG, "Static_MileageIcon")
  self._ui.txt_mileageValue = UI.getChildControl(self._ui.stc_moneyBG, "StaticText_MileageValue")
  self._ui.stc_oceanIcon = UI.getChildControl(self._ui.stc_moneyBG, "Static_OceanIcon")
  self._ui.txt_oceanValue = UI.getChildControl(self._ui.stc_moneyBG, "StaticText_OceanValue")
  self._ui.stc_buttonBG = UI.getChildControl(self._ui.stc_bottomBG, "Static_ButtonTypeBG")
  self._ui.btn_alchemyFigureHead = UI.getChildControl(self._ui.stc_buttonBG, "Button_AlchemyFigureHead")
  self._ui.btn_alchemyStone = UI.getChildControl(self._ui.stc_buttonBG, "Button_AlchemyStone")
  self._ui.btn_manufacture = UI.getChildControl(self._ui.stc_buttonBG, "Button_Manufacture")
  self._ui.btn_dyePalette = UI.getChildControl(self._ui.stc_buttonBG, "Button_Palette")
  self._ui.btn_openEquip = UI.getChildControl(self._ui.stc_buttonBG, "Button_OpenEquip")
  self._ui.btn_lightStoneBag = UI.getChildControl(self._ui.stc_buttonBG, "Button_Artifact_Storage")
  self._ui.btn_doItemMove = UI.getChildControl(self._ui.stc_buttonBG, "Button_AutoMove")
  self._ui.btn_setItemMove = UI.getChildControl(self._ui.stc_buttonBG, "Button_Set_AutoMove")
  self._ui.btn_sellEtcAll = UI.getChildControl(self._ui.stc_buttonBG, "Button_SellEtcAll")
  self._ui.btn_toolBox = UI.getChildControl(self._ui.stc_buttonBG, "Button_ToolBox")
  self._ui.btn_moveFamilyInven = UI.getChildControl(self._ui.stc_bottomBG, "Button_moveFamilyInven")
  self._ui.btn_openEquip:SetShow(false)
  self._ui.chk_trash = UI.getChildControl(self._ui.stc_bottomBG, "CheckButton_Trash")
  self._ui.txt_enchantNumber = UI.getChildControl(Panel_Window_Inventory_All, "Static_Text_Slot_Enchant_value")
  self._ui.stc_puzzleNotice = UI.getChildControl(Panel_Window_Inventory_All, "Static_Notice")
  self._ui.txt_puzzleNoticeText = UI.getChildControl(self._ui.stc_puzzleNotice, "StaticText_Notice")
  self._ui.stc_manufactureButtonBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_ManufactureButtonBG")
  self._ui.btn_manufactureOpen = UI.getChildControl(self._ui.stc_manufactureButtonBG, "Button_Manufacture")
  self._ui.btn_productNote = UI.getChildControl(self._ui.stc_manufactureButtonBG, "Button_Note")
  self._ui.stc_exchangeButtonBG = UI.getChildControl(Panel_Window_Inventory_All, "Static_ExchangeButtonBG")
  self._ui.btn_waypoint = UI.getChildControl(self._ui.stc_exchangeButtonBG, "Button_WayPoint")
  self._ui.btn_widget = UI.getChildControl(self._ui.stc_exchangeButtonBG, "Button_Widget")
  self._ui.btn_delete = UI.getChildControl(self._ui.stc_bottomBG, "Button_Delete")
  self._ui.btn_restore = UI.getChildControl(self._ui.stc_bottomBG, "Button_Restore")
  self._ui.txt_trashDesc = UI.getChildControl(self._ui.stc_bottomBG, "MultilineText_Trash_Desc")
  self._ui.stc_familyInventoryDescBg = UI.getChildControl(Panel_Window_Inventory_All, "Static_FamilyInvenDescBg")
  self._ui.txt_familyInventoryDesc = UI.getChildControl(self._ui.stc_familyInventoryDescBg, "StaticText_Desc")
  self._ui.btn_familyInventoryBuySlot = UI.getChildControl(self._ui.stc_familyInventoryDescBg, "Button_FamilyInventoryBuySlot")
  self._ui.btn_familyInventoryQuest = UI.getChildControl(self._ui.stc_familyInventoryDescBg, "Button_FamilyInventoryQuest")
end
function PaGlobal_Inventory_All:createSlot()
  for ii = 0, self.config.slotCount - 1 do
    local slot = {}
    slot.empty = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_Base_" .. ii)
    slot.lock = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_Lock_" .. ii)
    slot.plus = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_Plus_" .. ii)
    slot.onlyPlus = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_OnlyPlus_" .. ii)
    slot.olympic = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_OlympicFilter_" .. ii)
    CopyBaseProperty(self._ui.template_slot, slot.empty)
    CopyBaseProperty(self._ui.template_lockSlot, slot.lock)
    CopyBaseProperty(self._ui.template_plusSlot, slot.plus)
    CopyBaseProperty(self._ui.template_onlyPlus, slot.onlyPlus)
    CopyBaseProperty(self._ui.template_olympic, slot.olympic)
    UIScroll.InputEventByControl(slot.empty, "HandleEventScroll_Inventory_All_UpdateScroll")
    local row = math.floor(ii / self.config.slotCols)
    local col = ii % self.config.slotCols
    slot.empty:SetPosX(self.config.slotStartX + self.config.slotGapX * col)
    slot.empty:SetPosY(self.config.slotStartY + self.config.slotGapY * row)
    slot.lock:SetPosX(self.config.slotStartX + self.config.slotGapX * col)
    slot.lock:SetPosY(self.config.slotStartY + self.config.slotGapY * row)
    slot.plus:SetPosX(self.config.slotStartX + self.config.slotGapX * col - 4)
    slot.plus:SetPosY(self.config.slotStartY + self.config.slotGapY * row - 4)
    slot.onlyPlus:SetPosX(self.config.slotStartX + self.config.slotGapX * col)
    slot.onlyPlus:SetPosY(self.config.slotStartY + self.config.slotGapY * row)
    slot.olympic:SetPosX(self.config.slotStartX + self.config.slotGapX * col)
    slot.olympic:SetPosY(self.config.slotStartY + self.config.slotGapY * row)
    slot.empty:SetShow(false)
    slot.lock:SetShow(false)
    slot.plus:SetShow(false)
    slot.onlyPlus:SetShow(false)
    slot.olympic:SetShow(false)
    self._slotsBackground[ii] = slot
  end
  local useStartSlot = inventorySlotNoUserStart()
  for ii = 0, self.config.slotCount - 1 do
    local slotNo = ii + useStartSlot
    local slot = {}
    SlotItem.new(slot, "ItemIcon_" .. ii, ii, Panel_Window_Inventory_All, self.slotConfig)
    slot:createChild()
    slot.icon:addInputEvent("Mouse_RUp", "HandleEventRUp_Inventory_All_RUpEvent(" .. ii .. ")")
    slot.icon:addInputEvent("Mouse_LDown", "HandleEventLDown_Inventory_All_SlotLClick(" .. ii .. ")")
    slot.icon:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_LUpEvent(" .. ii .. ")")
    slot.icon:addInputEvent("Mouse_PressMove", "HandleEventPressMove_Inventory_All_PressMoveEvent(" .. ii .. ")")
    slot.icon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_IconTooltip(true, " .. ii .. ")")
    slot.icon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_IconTooltip(false, " .. ii .. ")")
    UIScroll.InputEventByControl(slot.icon, "HandleEventScroll_Inventory_All_UpdateScroll")
    slot.icon:SetAutoDisableTime(0,2)
    local row = math.floor(ii / self.config.slotCols)
    local col = ii % self.config.slotCols
    slot.icon:SetPosX(self.config.slotStartX + self.config.slotGapX * col)
    slot.icon:SetPosY(self.config.slotStartY + self.config.slotGapY * row)
    slot.icon:SetEnableDragAndDrop(true)
    slot.isEmpty = true
    Panel_Tooltip_Item_SetPosition(ii, slot, "inventory")
    slot.background = UI.createControl(__ePAUIControl_Static, Panel_Window_Inventory_All, "Inventory_Slot_BG_" .. ii)
    CopyBaseProperty(self._ui.template_slotBG, slot.background)
    slot.background:SetSize(slot.icon:GetSizeX(), slot.icon:GetSizeY())
    slot.background:SetPosX(slot.icon:GetPosX())
    slot.background:SetPosY(slot.icon:GetPosY())
    slot.background:SetShow(false)
    slot.icon:SetSize(44, 44)
    slot.border:SetSize(44, 44)
    slot.border:SetPosX(0,5)
    slot.border:SetPosY(0,5)
    slot.cooltime:SetSize(44, 44)
    slot.cooltime:SetPosX(0)
    slot.cooltime:SetPosY(0)
    slot.delete = UI.createControl(__ePAUIControl_Static, slot.icon, "Inventory_Slot_DeleteFilter_" .. ii)
    CopyBaseProperty(self._ui.template_delete, slot.delete)
    slot.delete:SetPosX(0)
    slot.delete:SetPosY(0)
    self.slots[ii] = slot
    local effectSlot = {}
    local puzzle = UI.createControl(__ePAUIControl_Button, slot.icon, "Puzzle_Control_" .. ii)
    CopyBaseProperty(self._ui.template_btnPuzzle, puzzle)
    puzzle:SetShow(false)
    puzzle:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_MakePuzzle(" .. ii .. ")")
    puzzle:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_PuzzleTooltip(true," .. ii .. ")")
    puzzle:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_PuzzleTooltip(false)")
    Panel_Window_Inventory_All:SetChildIndex(self._ui.stc_puzzleNotice, 9999)
    Panel_Window_Inventory_All:SetChildIndex(self.slots[ii].icon, 9998)
    effectSlot.isFirstItem = false
    effectSlot.puzzleControl = puzzle
    self.slotEtcData[ii] = effectSlot
  end
  for ii = 0, self.config.slotCount - 1 do
    local slot = self._slotsBackground[ii]
    Panel_Window_Inventory_All:SetChildIndex(slot.plus, 15099)
    Panel_Window_Inventory_All:SetChildIndex(slot.onlyPlus, 15100)
    Panel_Window_Inventory_All:SetChildIndex(slot.olympic, 15101)
  end
  for ii = 0, self.INVEN_MAX_SLOTNO do
    self.newItemData[ii] = nil
    self.newPearlItemData[ii] = nil
  end
  if FGlobal_IsCommercialService() then
    if isGameTypeGT() then
      self._ui.stc_pearlIcon:SetShow(false)
      self._ui.txt_pearlValue:SetShow(false)
      self._ui.stc_mileageIcon:SetShow(false)
      self._ui.txt_mileageValue:SetShow(false)
    else
      self._ui.stc_pearlIcon:SetShow(true)
      self._ui.txt_pearlValue:SetShow(true)
      self._ui.stc_mileageIcon:SetShow(true)
      self._ui.txt_mileageValue:SetShow(true)
    end
  elseif isGameTypeEnglish() then
    self._ui.stc_pearlIcon:SetShow(true)
    self._ui.txt_pearlValue:SetShow(true)
    self._ui.stc_mileageIcon:SetShow(true)
    self._ui.txt_mileageValue:SetShow(true)
  else
    self._ui.stc_pearlIcon:SetShow(false)
    self._ui.txt_pearlValue:SetShow(false)
    self._ui.stc_mileageIcon:SetShow(false)
    self._ui.txt_mileageValue:SetShow(false)
  end
  if isGameTypeGT() then
    self._ui.stc_pearlIcon:SetShow(false)
    self._ui.txt_pearlValue:SetShow(false)
    self._ui.stc_mileageIcon:SetShow(false)
    self._ui.txt_mileageValue:SetShow(false)
    if false == _ContentsGroup_OceanCurrent then
      self._ui.stc_oceanIcon:SetShow(false)
      self._ui.txt_oceanValue:SetShow(false)
    else
      self._ui.stc_oceanIcon:SetSpanSize(5, self._ui.stc_oceanIcon:GetSpanSize().y)
      self._ui.txt_oceanValue:SetSpanSize(40, 10)
      self._ui.txt_oceanValue:ComputePos()
    end
  end
  self._ui.btn_buyWeight:SetShow(_ContentsGroup_EasyBuy)
  self._ui.btn_doItemMove:SetShow(false)
  self._ui.btn_setItemMove:SetShow(false)
  self._ui.btn_delete:SetShow(false)
  self._ui.btn_restore:SetShow(false)
  self._ui.txt_trashDesc:SetShow(false)
end
function PaGlobal_Inventory_All:setData()
  self.config.slotRows = self.config.slotCount / self.config.slotCols
  self._isItemLockContentsOpen = ToClient_IsContentsGroupOpen("219")
  self._defaultPosX = Panel_Window_Inventory_All:GetPosX()
  self._defaultPosY = Panel_Window_Inventory_All:GetPosY()
  self._defaultSizeY = Panel_Window_Inventory_All:GetSizeY()
  self._defaultMoneySpanY = self._ui.stc_moneyBG:GetSpanSize().y
  self._defaultWeightSpanY = self._ui.stc_weightBG:GetSpanSize().y
  self._defaultWeightTooltipSizeY = self._ui.stc_weightTooltipBG:GetSizeY()
  PaGlobal_Inventory_All._openedUIMode = PaGlobal_Inventory_All._bottomBG_UIMode.Normal
  PaGlobal_Inventory_All:reloadBottomBgFromMode(PaGlobal_Inventory_All._openedUIMode, true)
  self._ui.txt_enchantNumber:SetShow(false)
  self._ui.check_popup:SetShow(_ContentsGroup_PopUp)
  self._ui.btn_alchemyStone:SetShow(_ContentsGroup_AlchemyStone)
  self._ui.btn_alchemyFigureHead:SetShow(_ContentsGroup_AlchemyFigureHead)
  self._ui.btn_lightStoneBag:SetShow(_ContentsGroup_LightStoneBag)
  self._ui.btn_lightStoneBag:SetPosX(self._ui.btn_alchemyFigureHead:GetPosX())
  self._ui.button_sortOption:SetShow(true)
  self._ui.rdo_normalInven:SetCheck(true)
  Panel_Window_Inventory_All:SetChildIndex(self._ui.stc_manufactureButtonBG, 10000)
  Panel_Window_Inventory_All:SetChildIndex(self._ui.stc_exchangeButtonBG, 10000)
  PaGlobal_Inventory_All:changeMileageIcon()
  Panel_Inventory_CoolTime_Effect_Item_Slot:RegisterShowEventFunc(true, "PaGlobalFunc_ItemCoolTimeEffect_ShowAni()")
  self._normalInvenButtonSpanX = self._ui.rdo_normalInven:GetSpanSize().x
  self._pearlInvenButtonSpanX = self._ui.rdo_pearlInven:GetSpanSize().x
  if false == _ContentsGroup_FamilyInventory then
    self._ui.rdo_normalInven:SetSpanSize(self._normalInvenButtonSpanX + self._radioButtonSpanXGap, self._ui.rdo_normalInven:GetSpanSize().y)
    self._ui.rdo_pearlInven:SetSpanSize(self._pearlInvenButtonSpanX + self._radioButtonSpanXGap, self._ui.rdo_pearlInven:GetSpanSize().y)
    self._ui.rdo_familyInven:SetShow(false)
  else
    if CppEnums.ServiceResourceType.eServiceResourceType_TR == ToClient_getResourceType() then
      self._ui.rdo_normalInven:SetSpanSize(self._normalInvenButtonSpanX - 10, self._ui.rdo_normalInven:GetSpanSize().y)
      self._ui.rdo_familyInven:SetSpanSize(self._ui.rdo_normalInven:GetSpanSize().x * -1, self._ui.rdo_familyInven:GetSpanSize().y)
    end
    self._ui.rdo_familyInven:SetTextMode(__eTextMode_AutoWrap)
    self._ui.rdo_familyInven:SetText(self._ui.rdo_familyInven:GetText())
    self._ui.txt_familyInventoryDesc:SetTextMode(__eTextMode_AutoWrap)
    self._ui.txt_familyInventoryDesc:SetText(self._ui.txt_familyInventoryDesc:GetText())
  end
  self._ui.btn_olympicFilter:SetShow(_ContentsGroup_Olympic)
  self:deleteMode_clearData()
end
function PaGlobal_Inventory_All:registerEventHandler()
  if nil == Panel_Window_Inventory_All then
    return
  end
  self._ui.check_popup:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_CheckPopUpUI()")
  self._ui.check_popup:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_PopupUITooltip(true)")
  self._ui.check_popup:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_PopupUITooltip(false)")
  self._ui.btn_question:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowInventory\" )")
  PaGlobal_Util_RegistHelpTooltipEvent(self._ui.btn_question, "\"PanelWindowInventory\"")
  if true == isGameTypeKR2() then
    self._ui.btn_question:SetShow(false)
    self._ui.check_popup:SetSpanSize(self._ui.btn_question:GetSpanSize().x, self._ui.btn_question:GetSpanSize().y)
  end
  self._ui.btn_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_Inventory_All_Close()")
  self._ui.rdo_normalInven:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_SelectTab()")
  self._ui.rdo_pearlInven:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_SelectTab()")
  if true == _ContentsGroup_changeFamilyInvenOpenAction then
    self._ui.rdo_familyInven:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_SelectTab()")
  else
    self._ui.rdo_familyInven:addInputEvent("Mouse_LUp", "PaGlobal_FamilyInvnetory_Open()")
  end
  self._ui.btn_olympicFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_Inventory_All_ToggleOlympicFilterInventory()")
  self._ui.btn_olympicFilter:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_OlympicFilterTooltip(true)")
  self._ui.btn_olympicFilter:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_OlympicFilterTooltip(false)")
  self._ui.button_sortOption:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_ShowSortOption()")
  self._ui.txt_capacity:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_EasyBuyOpen( true )")
  self._ui.txt_capacity:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_CapacityTooltip( true )")
  self._ui.txt_capacity:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_CapacityTooltip( false )")
  if true == _ContentsGroup_changeFamilyInvenOpenAction then
    self._ui.btn_moveFamilyInven:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.FamilyInventory .. ")")
  end
  UIScroll.InputEvent(self._ui.scroll_inven, "HandleEventScroll_Inventory_All_UpdateScroll")
  UIScroll.InputEventByControl(self._ui.stc_scrollArea, "HandleEventScroll_Inventory_All_UpdateScroll")
  self._ui.stc_weightIcon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_WeightTooltip( true )")
  self._ui.stc_weightIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_WeightTooltip( false )")
  self._ui.stc_weightBG:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_WeightTooltip( true )")
  self._ui.stc_weightBG:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_WeightTooltip( false )")
  self._ui.btn_buyWeight:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_EasyBuyOpen( false )")
  self._ui.btn_buyWeight:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BuyWeightTooltip(true)")
  self._ui.btn_buyWeight:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BuyWeightTooltip(false)")
  self._ui.stc_moneyIcon:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_PopMoney()")
  self._ui.stc_moneyIcon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(true, 0)")
  self._ui.stc_moneyIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(false, 0)")
  self._ui.stc_pearlIcon:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_OpenPearlShop()")
  self._ui.stc_pearlIcon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(true, 1)")
  self._ui.stc_pearlIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(false, 1)")
  self._ui.stc_mileageIcon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(true, 2)")
  self._ui.stc_mileageIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(false, 2)")
  self._ui.stc_oceanIcon:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(true, 3)")
  self._ui.stc_oceanIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_MoneyIconTooltip(false, 3)")
  self._ui.btn_alchemyFigureHead:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.AlchemyFigureHead .. ")")
  self._ui.btn_alchemyFigureHead:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(true, " .. InventoryBottomOpenUIButtonIndex.AlchemyFigureHead .. " )")
  self._ui.btn_alchemyFigureHead:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(false, " .. InventoryBottomOpenUIButtonIndex.AlchemyFigureHead .. " )")
  self._ui.btn_alchemyStone:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.AlchemyStone .. " )")
  self._ui.btn_alchemyStone:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip( true, " .. InventoryBottomOpenUIButtonIndex.AlchemyStone .. " )")
  self._ui.btn_alchemyStone:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip( false, " .. InventoryBottomOpenUIButtonIndex.AlchemyStone .. " )")
  if true == _ContentsGroup_AlchemyStone then
    self._ui.btn_alchemyStone:setButtonShortcuts("PANEL_SIMPLESHORTCUT_ALCHEMY_RECHARGE")
  end
  self._ui.btn_manufacture:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.Manufacture .. ")")
  self._ui.btn_manufacture:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(true, " .. InventoryBottomOpenUIButtonIndex.Manufacture .. ")")
  self._ui.btn_manufacture:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(false, " .. InventoryBottomOpenUIButtonIndex.Manufacture .. ")")
  self._ui.btn_dyePalette:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.Palette .. ")")
  self._ui.btn_dyePalette:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(true, " .. InventoryBottomOpenUIButtonIndex.Palette .. ")")
  self._ui.btn_dyePalette:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(false, " .. InventoryBottomOpenUIButtonIndex.Palette .. ")")
  if _ContentsGroup_LightStoneBag == true then
    self._ui.btn_lightStoneBag:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.LightStoneBag .. ")")
    self._ui.btn_lightStoneBag:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(true, " .. InventoryBottomOpenUIButtonIndex.LightStoneBag .. ")")
    self._ui.btn_lightStoneBag:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(false, " .. InventoryBottomOpenUIButtonIndex.LightStoneBag .. ")")
  end
  if _ContentsGroup_CollectToolBox == true then
    self._ui.btn_toolBox:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BottomButtonClick(" .. InventoryBottomOpenUIButtonIndex.CollectUnionBag .. ")")
    self._ui.btn_toolBox:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(true, " .. InventoryBottomOpenUIButtonIndex.CollectUnionBag .. ")")
    self._ui.btn_toolBox:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_BottomButtonTooltip(false, " .. InventoryBottomOpenUIButtonIndex.CollectUnionBag .. ")")
  end
  self._ui.btn_openEquip:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_OpenEquipment()")
  self._ui.chk_trash:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_ItemDelete()")
  self._ui.chk_trash:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_TrashTooltip( true )")
  self._ui.chk_trash:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_TrashTooltip( false )")
  self._ui.btn_sellEtcAll:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_SellAllEtcItem()")
  self._ui.btn_doItemMove:addInputEvent("Mouse_LUp", "PaGlobal_Inventory_All:requestMoveItemsInventoryToWarehouse()")
  self._ui.btn_setItemMove:addInputEvent("Mouse_LUp", "PaGlobal_ItemMoveSet:prepareOpen()")
  self._ui.edit_search:addInputEvent("Mouse_LDown", "PaGlobal_Inventory_All:setFocusSearchText()")
  self._ui.edit_search:addInputEvent("Mouse_LUp", "PaGlobal_Inventory_All:setFocusSearchText()")
  self._ui.edit_search:RegistReturnKeyEvent("PaGlobal_Inventory_All:searchItem()")
  self._ui.btn_search:addInputEvent("Mouse_LUp", "PaGlobal_Inventory_All:searchItem()")
  self._ui.btn_searchReset:addInputEvent("Mouse_LUp", "PaGlobal_Inventory_All:clearSearch()")
  self._ui.btn_searchReset:addInputEvent("Mouse_On", "HandleEventOnOut_Inventory_All_SearchResetTooltip(true)")
  self._ui.btn_searchReset:addInputEvent("Mouse_Out", "HandleEventOnOut_Inventory_All_SearchResetTooltip(false)")
  self._ui.btn_delete:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_RequestDeleteItemList()")
  self._ui.btn_restore:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_OpenRestorePanel()")
  self._ui.btn_familyInventoryBuySlot:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_BuyFamilyInvenSlot()")
  self._ui.btn_familyInventoryQuest:addInputEvent("Mouse_LUp", "HandleEventLUp_Inventory_All_FamilyInvenQuest()")
  Panel_Window_Inventory_All:RegisterShowEventFunc(true, "PaGlobalFunc_Inventory_All_ShowAni()")
  Panel_Window_Inventory_All:RegisterShowEventFunc(false, "PaGlobalFunc_Inventory_All_HideAni()")
  Panel_Window_Inventory_All:RegisterUpdateFunc("PaGlobalFunc_Inventory_All_UpdatePerFrame")
  registerEvent("FromClient_cursorOnOffSignal", "FromClient_Inventory_All_CursorOnOffSignal")
  registerEvent("FromClient_RenderModeChangeState", "FromClient_Inventory_All_RenderModeChange_FlushRestoreFunc")
  registerEvent("onScreenResize", "PaGlobalFunc_Inventory_All_OnScreenResize")
  registerEvent("FromClient_WeightChanged", "Invnetory_updateData")
  registerEvent("FromClient_InventoryUpdate", "FromClient_Inventory_All_UpdateSlotDataByAddItem")
  registerEvent("EventInventorySetShow", "PaGlobalFunc_Inventory_All_SetShow")
  registerEvent("EventInventorySetShowWithFilter", "FromClient_Inventory_All_SetShowWithFilter")
  registerEvent("EventAddItemToInventory", "FromClient_Inventory_All_AddItem")
  registerEvent("EventUnEquipItemToInventory", "FromClient_Inventory_All_UnequipItem")
  registerEvent("FromClient_UseItemAskFromOtherPlayer", "FromClient_Inventory_All_UseItemAskFromOtherPlayer")
  registerEvent("FromClient_FindExchangeItemNPC", "FromClient_Inventory_All_FindExchangeItemNPC")
  registerEvent("FromClient_InventoryUpdatebyAddItem", "FromClient_Inventory_All_UpdateSlotDataByAddItem")
  registerEvent("FromClient_UpdateInventoryBag", "FromClient_Inventory_All_UpdateSlotDataByAddItem")
  registerEvent("FromClient_OpenFamilyInventory", "FromClient_Inventory_All_OpenFamilyInventory")
  registerEvent("FromClient_DeleteItemSucceed", "FromClient_Inventory_All_DeleteItemSucceed")
  registerEvent("FromClient_InventoryUpdate", "FromClient_Inventory_All_UpdateMonotoneUnionBeltButton")
end
function PaGlobal_Inventory_All:validate()
  if nil == Panel_Window_Inventory_All then
    return
  end
  self._ui.stc_titleBG:isValidate()
  self._ui.check_popup:isValidate()
  self._ui.btn_question:isValidate()
  self._ui.btn_close:isValidate()
  self._ui.btn_sellEtcAll:isValidate()
  self._ui.btn_doItemMove:isValidate()
  self._ui.btn_setItemMove:isValidate()
  self._ui.chk_trash:isValidate()
  self._ui.btn_delete:isValidate()
  self._ui.btn_restore:isValidate()
  self._ui.txt_trashDesc:isValidate()
end
function PaGlobal_Inventory_All:requestMoveItemsInventoryToWarehouse()
  local actorKeyRaw = PaGlobal_WareHouse_All._targetActorKeyRaw
  local moveItemCount = ToClient_requestMoveItemsInventoryToWarehouse(actorKeyRaw)
  if 0 == moveItemCount then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMOVESET_EMPTY"))
  else
    PaGlobal_ItemMoveSet._fromItemCount = moveItemCount
  end
end
function PaGlobal_Inventory_All:setIgnoreMoveItemButton(isIgnore)
  self._ui.btn_doItemMove:SetIgnore(isIgnore)
  self._ui.btn_setItemMove:SetIgnore(isIgnore)
  self._ui.btn_doItemMove:SetMonoTone(isIgnore)
  self._ui.btn_setItemMove:SetMonoTone(isIgnore)
end
function PaGlobal_Inventory_All:reloadBottomBgFromMode(mode, isSetData)
  if Panel_Window_Inventory_All == nil then
    return
  end
  if mode == nil then
    UI.ASSERT_NAME(false, "[PaGlobal_Inventory_All:reloadBottomBgFromMode] modeê°€ nilì…ë‹ˆë‹¤!!", "ì´ì£¼")
    return
  end
  local currentPosX = Panel_Window_Inventory_All:GetPosX()
  local currentPosY = Panel_Window_Inventory_All:GetPosY()
  local buttonBg_SizeY = 0
  local totalBottom_SizeY = 0
  if self._bottomBG_UIMode.Normal == mode then
    if self._ui.btn_doItemMove:GetShow() == true or self._ui.btn_setItemMove:GetShow() == true then
      self:reloadBottomBgFromMode(self._bottomBG_UIMode.OpenedWareHouse)
      return
    end
    buttonBg_SizeY = self._ui.btn_alchemyFigureHead:GetSizeY() + self._ui.btn_alchemyFigureHead:GetSpanSize().y + 10
    if _ContentsGroup_LightStoneBag == true or _ContentsGroup_CollectToolBox == true then
      buttonBg_SizeY = buttonBg_SizeY + self._ui.btn_lightStoneBag:GetSizeY()
    end
    totalBottom_SizeY = buttonBg_SizeY + self._ui.stc_buttonBG:GetSpanSize().y
  elseif self._bottomBG_UIMode.ClickedTrashButton == mode then
    buttonBg_SizeY = 0
    totalBottom_SizeY = self._ui.txt_trashDesc:GetSizeY() + self._ui.txt_trashDesc:GetSpanSize().y
  elseif self._bottomBG_UIMode.OpenedEnchant == mode then
    buttonBg_SizeY = self._ui.btn_openEquip:GetSizeY() + self._ui.btn_openEquip:GetSpanSize().y + 10
    totalBottom_SizeY = buttonBg_SizeY + self._ui.stc_buttonBG:GetSpanSize().y
  elseif self._bottomBG_UIMode.OpenedWareHouse == mode then
    buttonBg_SizeY = 0
    if self._ui.btn_doItemMove:GetShow() == true then
      buttonBg_SizeY = self._ui.btn_doItemMove:GetSizeY() + self._ui.btn_doItemMove:GetSpanSize().y + 5
    elseif self._ui.btn_setItemMove:GetShow() == true then
      buttonBg_SizeY = self._ui.btn_setItemMove:GetSizeY() + self._ui.btn_setItemMove:GetSpanSize().y + 5
    end
    totalBottom_SizeY = buttonBg_SizeY + self._ui.stc_buttonBG:GetSpanSize().y
  elseif self._bottomBG_UIMode.OpenedSell == mode then
    buttonBg_SizeY = self._ui.btn_sellEtcAll:GetSizeY() + self._ui.btn_sellEtcAll:GetSpanSize().y + 5
    totalBottom_SizeY = buttonBg_SizeY + self._ui.stc_buttonBG:GetSpanSize().y
  elseif self._bottomBG_UIMode.OpenedCopy == mode then
    buttonBg_SizeY = self._ui.btn_openEquip:GetSizeY() + self._ui.btn_openEquip:GetSpanSize().y + 5
    totalBottom_SizeY = buttonBg_SizeY + self._ui.stc_buttonBG:GetSpanSize().y
  else
    UI.ASSERT_NAME(false, "ì¸ë²¤í† ë¦¬ì˜ í•˜ë‹¨ ì˜ì—­ í¬ê¸° ê³„ì‚°ì— ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤. ë“±ë¡ë˜ì§€ ì•Šì€ mode ì…ë‹ˆë‹¤.", "ì´ì£¼")
    return
  end
  self._ui.stc_buttonBG:SetSize(self._ui.stc_buttonBG:GetSizeX(), buttonBg_SizeY)
  self._ui.stc_bottomBG:SetSize(self._ui.stc_bottomBG:GetSizeX(), totalBottom_SizeY)
  local mainSlotBg_SizeY = self._ui.stc_mainSlotBG:GetSizeY() + self._ui.stc_mainSlotBG:GetSpanSize().y
  local panel_SizeY = mainSlotBg_SizeY + totalBottom_SizeY + 15
  Panel_Window_Inventory_All:SetSize(Panel_Window_Inventory_All:GetSizeX(), panel_SizeY)
  if isSetData ~= nil and isSetData == true then
    PaGlobalFunc_Inventory_All_OnScreenResize()
    PaGlobalFunc_Equipment_All_OnScreenResize()
  end
  Panel_Window_Inventory_All:SetPosX(currentPosX)
  Panel_Window_Inventory_All:SetPosY(currentPosY)
end
function PaGlobal_Inventory_All:setShowButtonUnionBelt(isShow)
  if _ContentsGroup_CollectToolBox == false then
    return
  end
  self._ui.btn_toolBox:SetShow(isShow)
  self._ui.btn_lightStoneBag:SetSize(self._ui.btn_toolBox:GetSizeX(), self._ui.btn_toolBox:GetSizeY())
  if isShow == true then
    self._ui.btn_toolBox:SetEnable(true)
    self:setMonotoneButtonUnionBelt()
  else
    self._ui.btn_toolBox:SetMonoTone(true)
  end
end
function PaGlobal_Inventory_All:setMonotoneButtonUnionBelt()
  if _ContentsGroup_CollectToolBox == false or Panel_Window_Inventory_All:GetShow() == false then
    return
  end
  if Panel_Dialog_Repair_Function_All:GetShow() == true then
    return
  end
  if ToClient_CheckHaveUnionBeltInInventory() == true or ToClient_CheckEquipUnionBelt() == true then
    self._ui.btn_toolBox:SetMonoTone(false)
  else
    self._ui.btn_toolBox:SetMonoTone(true)
  end
end
