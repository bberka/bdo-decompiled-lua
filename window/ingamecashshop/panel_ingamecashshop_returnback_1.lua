function PaGlobal_IngameCashSHop_ReturnBack:initialize()
  if true == PaGlobal_IngameCashSHop_ReturnBack._initialize then
    return
  end
  self._isConsole = _ContentsGroup_UsePadSnapping
  local titleBG = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Static_TitleArea")
  self._ui._btn_close = UI.getChildControl(titleBG, "Button_Close")
  self._ui._stc_productArea = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Static_ProductArea")
  self._ui._stc_itemSlotBG = UI.getChildControl(self._ui._stc_productArea, "Static_ItemSlotBG")
  local iconBG = UI.getChildControl(self._ui._stc_itemSlotBG, "Static_GoodsSlotBG")
  self._ui._stc_productIcon = UI.getChildControl(iconBG, "Static_GoodsSlot")
  self._ui._stc_productName = UI.getChildControl(self._ui._stc_itemSlotBG, "StaticText_GoodsName")
  self._ui._stc_productPrice = UI.getChildControl(self._ui._stc_itemSlotBG, "StaticText_GoodsPriceValue")
  self._ui._stc_productCount = UI.getChildControl(self._ui._stc_itemSlotBG, "StaticText_BuyCount")
  self._ui._stc_couponSlotBG = UI.getChildControl(self._ui._stc_productArea, "Static_CouponSlotBG")
  self._ui._slotTemplete = UI.getChildControl(self._ui._stc_itemSlotBG, "Static_SubSlot_Temp")
  self._ui._slotTemplete:SetShow(false)
  local iconBG = UI.getChildControl(self._ui._stc_couponSlotBG, "Static_GoodsSlotBG")
  self._ui._stc_couponIcon = UI.getChildControl(iconBG, "Static_GoodsSlot")
  self._ui._stc_couponName = UI.getChildControl(self._ui._stc_couponSlotBG, "StaticText_CouponName")
  self._ui._stc_couponCount = UI.getChildControl(self._ui._stc_couponSlotBG, "StaticText_BuyCount")
  self._ui._list2 = UI.getChildControl(self._ui._stc_productArea, "List2_Product")
  self._ui._btn_confirm = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Button_Confirm")
  self._ui._btn_cancle = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Button_Cancle")
  self._ui._stc_keyGuidBG = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Static_KeyGuide_Console")
  self._ui._stc_check = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "StaticText_EditBackGroundText")
  self._ui._edit_check = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Edit_SearchText_PCUI")
  self._ui._txt_xButton = UI.getChildControl(self._ui._edit_check, "StaticText_XButton")
  self._ui._stc_editIcon = UI.getChildControl(self._ui._edit_check, "Static_Icon")
  self._ui._stc_DescBG = UI.getChildControl(Panel_IngameCashSHop_ReturnBack, "Static_DescEdge_Import")
  self._ui._txt_desc = UI.getChildControl(self._ui._stc_DescBG, "StaticText_Desc")
  self._ui._list2:setNotImpactScrollEvent(true)
  self._ui._txt_desc:SetTextMode(__eTextMode_AutoWrap)
  self._ui._txt_desc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INGAMECASHSHOP_RETURN_BOTTOM_DESC"))
  local gabY = self._ui._txt_desc:GetTextSizeY() - self._ui._stc_DescBG:GetSizeY()
  if gabY > 0 then
    self._ui._stc_DescBG:SetSize(self._ui._stc_DescBG:GetSizeX(), self._ui._stc_DescBG:GetSizeY() + gabY)
    Panel_IngameCashSHop_ReturnBack:SetSize(Panel_IngameCashSHop_ReturnBack:GetSizeX(), Panel_IngameCashSHop_ReturnBack:GetSizeY() + gabY)
    self._ui._stc_keyGuidBG:ComputePos()
    self._ui._btn_confirm:ComputePos()
    self._ui._btn_cancle:ComputePos()
  end
  self:descSetting()
  self._panelSizeY = Panel_IngameCashSHop_ReturnBack:GetSizeY()
  self._productSizeY = self._ui._stc_productArea:GetSizeY()
  self._editPosY = self._ui._edit_check:GetPosY()
  self._descPosY = self._ui._stc_DescBG:GetPosY()
  self._ui._txt_xButton:SetShow(self._isConsole)
  self._ui._btn_confirm:SetShow(not self._isConsole)
  self._ui._btn_cancle:SetShow(not self._isConsole)
  self._ui._stc_editIcon:SetShow(not self._isConsole)
  if self._isConsole == true then
    self:initKeyGuide()
    Panel_IngameCashSHop_ReturnBack:ignorePadSnapMoveToOtherPanel()
  end
  self:registEventHandler()
  self:validate()
  self._initialize = true
end
function PaGlobal_IngameCashSHop_ReturnBack:initKeyGuide()
  if Panel_IngameCashSHop_ReturnBack == nil then
    return
  end
  if self._isConsole == false then
    return
  end
  self._ui._stc_keyGuidBG:SetShow(true)
  local stc_keyGuide_A = UI.getChildControl(self._ui._stc_keyGuidBG, "StaticText_Confirm_ConsoleUI")
  local stc_keyGuide_B = UI.getChildControl(self._ui._stc_keyGuidBG, "StaticText_XboxClose_ConsoleUI")
  local stc_keyGuide_Y = UI.getChildControl(self._ui._stc_keyGuidBG, "StaticText_Coupon_ConsoleUI")
  local stc_keyGuide_X = UI.getChildControl(self._ui._stc_keyGuidBG, "StaticText_Detail_ConsoleUI")
  local keyGuideList = Array.new()
  keyGuideList:push_back(stc_keyGuide_X)
  keyGuideList:push_back(stc_keyGuide_Y)
  keyGuideList:push_back(stc_keyGuide_A)
  keyGuideList:push_back(stc_keyGuide_B)
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._stc_keyGuidBG, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT, nil, nil)
end
function PaGlobal_IngameCashSHop_ReturnBack:descSetting()
  self._ui._txt_desc:SetTextMode(__eTextMode_AutoWrap)
  self._ui._txt_desc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INGAMECASHSHOP_RETURN_BOTTOM_DESC"))
  local gabY = self._ui._txt_desc:GetTextSizeY() - self._ui._txt_desc:GetSizeY()
  if gabY > 0 then
    self._ui._stc_DescBG:SetSize(self._ui._stc_DescBG:GetSizeX(), self._ui._stc_DescBG:GetSizeY() + gabY)
    Panel_IngameCashSHop_ReturnBack:SetSize(Panel_IngameCashSHop_ReturnBack:GetSizeX(), Panel_IngameCashSHop_ReturnBack:GetSizeY() + gabY)
  end
  self._ui._stc_keyGuidBG:ComputePos()
  self._ui._btn_confirm:ComputePos()
  self._ui._btn_cancle:ComputePos()
end
function PaGlobal_IngameCashSHop_ReturnBack:registEventHandler()
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
  self._ui._btn_cancle:addInputEvent("Mouse_LUp", "PaGlobal_IngameCashSHop_ReturnBack_Close()")
  self._ui._btn_close:addInputEvent("Mouse_LUp", "PaGlobal_IngameCashSHop_ReturnBack_Close()")
  self._ui._edit_check:addInputEvent("Mouse_LUp", "HandleEventLUp_IngameCashSHop_SetFocusEdit()")
  self._ui._btn_confirm:addInputEvent("Mouse_LUp", "HandleEventLUp_IngameCashSHop_RequestRefund()")
  self._ui._list2:registEvent(__ePAUIList2EventType_LuaChangeContent, "FromClient_IngameCashSHop_UpdateContent")
  self._ui._list2:createChildContent(__ePAUIList2ElementManagerType_List)
  self._ui._stc_couponIcon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_SimpletooltipTitle(true)")
  self._ui._stc_couponIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_SimpletooltipTitle(false)")
  if self._isConsole == true then
    Panel_IngameCashSHop_ReturnBack:registerPadEvent(__eConsoleUIPadEvent_Up_A, "HandleEventLUp_IngameCashSHop_RequestRefund()")
    Panel_IngameCashSHop_ReturnBack:registerPadEvent(__eConsoleUIPadEvent_Up_X, "HandleEventLUp_IngameCashSHop_SetFocusEdit()")
    Panel_IngameCashSHop_ReturnBack:registerPadEvent(__eConsoleUIPadEvent_Up_B, "PaGlobal_IngameCashSHop_ReturnBack_Close()")
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:updateControl(control, key)
  local index = Int64toInt32(key)
  local productNo = ToClient_GetPurchaseItemCashProdcutNoByIndex(index)
  local cashProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(productNo)
  if nil == cashProduct then
    return
  end
  itemSlotBG = UI.getChildControl(control, "Static_ItemSlotBG")
  itemSlotBG:SetShow(true)
  local iconBG = UI.getChildControl(itemSlotBG, "Static_GoodsSlotBG")
  local productIcon = UI.getChildControl(iconBG, "Static_GoodsSlot")
  local productName = UI.getChildControl(itemSlotBG, "StaticText_GoodsName")
  local productPrice = UI.getChildControl(itemSlotBG, "StaticText_GoodsPriceValue")
  local productCount = UI.getChildControl(itemSlotBG, "StaticText_BuyCount")
  productIcon:ChangeTextureInfoNameAsync("icon/" .. cashProduct:getIconPath())
  productIcon:setRenderTexture(productIcon:getBaseTexture())
  productIcon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_ShowToolTip(true," .. productNo .. ")")
  productIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_ShowToolTip(false," .. productNo .. ")")
  productName:SetText(cashProduct:getDisplayName())
  local originalPearl = Int64toInt32(ToClient_GetPurchaseOriginalPearByIndex(index))
  local usePearl = Int64toInt32(ToClient_GetPurchaseRealUsePearByIndex(index))
  productPrice:SetText(originalPearl)
  local count = ToClient_GetPurchaseBuyCountByIndex(index)
  productCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MANUFACTURE_COUNT") .. " " .. count)
  productCount:SetSize(productCount:GetTextSizeX(), productCount:GetSizeY())
  productCount:ComputePos()
  self:subSlotSettingForEvent(cashProduct, control, index)
end
function PaGlobal_IngameCashSHop_ReturnBack:setProductItemSettingForEventCart(eventCartNo)
  self._ui._list2:getElementManager():clearKey()
  self._ui._stc_itemSlotBG:SetShow(false)
  self._ui._list2:SetShow(true)
  local gabY = self._ui._list2:GetSizeY() - self._ui._stc_itemSlotBG:GetSizeY()
  Panel_IngameCashSHop_ReturnBack:SetSize(Panel_IngameCashSHop_ReturnBack:GetSizeX(), self._panelSizeY + gabY)
  Panel_IngameCashSHop_ReturnBack:ComputePos()
  self._ui._stc_productArea:SetSize(self._ui._stc_productArea:GetSizeX(), self._productSizeY + gabY)
  self._ui._edit_check:SetPosY(self._editPosY + gabY)
  self._ui._stc_check:SetPosY(self._editPosY + gabY)
  self._ui._stc_DescBG:SetPosY(self._descPosY + gabY)
  self._ui._stc_keyGuidBG:ComputePos()
  self._ui._btn_confirm:ComputePos()
  self._ui._btn_cancle:ComputePos()
  for index = 0, PaGlobal_CashShopBuyHistory._realHistoryCount - 1 do
    local targetNo = ToClient_GetPurchaseEventCartNoByIndex(index)
    if eventCartNo == targetNo then
      self._ui._list2:getElementManager():pushKey(toInt64(0, index))
    end
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:setProductItemSetting(index)
  self._ui._stc_itemSlotBG:SetShow(false)
  self._ui._list2:SetShow(false)
  Panel_IngameCashSHop_ReturnBack:SetSize(Panel_IngameCashSHop_ReturnBack:GetSizeX(), self._panelSizeY)
  Panel_IngameCashSHop_ReturnBack:ComputePos()
  self._ui._stc_productArea:SetSize(self._ui._stc_productArea:GetSizeX(), self._productSizeY)
  self._ui._edit_check:SetPosY(self._editPosY)
  self._ui._stc_check:SetPosY(self._editPosY)
  self._ui._stc_DescBG:SetPosY(self._descPosY)
  self._ui._stc_keyGuidBG:ComputePos()
  self._ui._btn_confirm:ComputePos()
  self._ui._btn_cancle:ComputePos()
  local productNo = ToClient_GetPurchaseItemCashProdcutNoByIndex(index)
  local cashProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(productNo)
  if nil == cashProduct then
    return
  end
  self._ui._stc_itemSlotBG:SetShow(true)
  self._ui._stc_productIcon:ChangeTextureInfoNameAsync("icon/" .. cashProduct:getIconPath())
  self._ui._stc_productIcon:setRenderTexture(self._ui._stc_productIcon:getBaseTexture())
  self._ui._stc_productIcon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_ShowToolTip(true," .. productNo .. ")")
  self._ui._stc_productIcon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_ShowToolTip(false," .. productNo .. ")")
  self._ui._stc_productName:SetText(cashProduct:getDisplayName())
  local originalPearl = Int64toInt32(ToClient_GetPurchaseOriginalPearByIndex(index))
  local usePearl = Int64toInt32(ToClient_GetPurchaseRealUsePearByIndex(index))
  if originalPearl == usePearl then
    self._ui._stc_productPrice:SetText(usePearl)
  else
    self._ui._stc_productPrice:SetText(originalPearl .. " -> " .. usePearl)
  end
  local count = ToClient_GetPurchaseBuyCountByIndex(index)
  self._ui._stc_productCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MANUFACTURE_COUNT") .. " " .. count)
  self._ui._stc_productCount:SetSize(self._ui._stc_productCount:GetTextSizeX(), self._ui._stc_productCount:GetSizeY())
  self._ui._stc_productCount:ComputePos()
  self:subSlotSetting(index, cashProduct)
end
function PaGlobal_IngameCashSHop_ReturnBack:setCouponSetting(index)
  self._ui._stc_couponSlotBG:SetShow(false)
  local couponName = ToClient_GetPurchaseCouponNameByIndex(index)
  if couponName == nil or couponName == "" then
    return
  end
  local iconPath = ToClient_GetPurchaseCouponIconPathByIndex(index)
  if iconPath == nil or iconPath == "" then
    return
  end
  self._ui._stc_couponSlotBG:SetShow(true)
  self._ui._stc_couponSlotBG:SetSpanSize(self._ui._stc_couponSlotBG:GetSpanSize().x, self._ui._stc_itemSlotBG:GetSpanSize().y + self._ui._stc_itemSlotBG:GetSizeY() + 5)
  local gabY = 0
  if self._ui._list2:GetShow() == true then
    gabY = self._ui._list2:GetSizeY() - self._ui._stc_itemSlotBG:GetSizeY()
  end
  Panel_IngameCashSHop_ReturnBack:SetSize(Panel_IngameCashSHop_ReturnBack:GetSizeX(), self._panelSizeY + gabY + self._ui._stc_couponSlotBG:GetSizeY() + 5)
  self._ui._stc_productArea:SetSize(self._ui._stc_productArea:GetSizeX(), self._productSizeY + gabY + self._ui._stc_couponSlotBG:GetSizeY() + 5)
  self._ui._edit_check:SetPosY(self._editPosY + self._ui._stc_couponSlotBG:GetSizeY() + gabY)
  self._ui._stc_check:SetPosY(self._editPosY + self._ui._stc_couponSlotBG:GetSizeY() + gabY)
  self._ui._stc_DescBG:SetPosY(self._descPosY + self._ui._stc_couponSlotBG:GetSizeY() + gabY)
  self._ui._stc_keyGuidBG:ComputePos()
  self._ui._btn_confirm:ComputePos()
  self._ui._btn_cancle:ComputePos()
  self._ui._stc_couponIcon:ChangeTextureInfoNameAsync("icon/" .. iconPath)
  self._ui._stc_couponIcon:setRenderTexture(self._ui._stc_couponIcon:getBaseTexture())
  self._ui._stc_couponName:SetText(couponName)
  self._ui._stc_couponCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MANUFACTURE_COUNT") .. " 1")
  self._ui._stc_couponName:SetSize(self._ui._stc_couponName:GetTextSizeX(), self._ui._stc_couponName:GetSizeY())
  self._ui._stc_couponName:ComputePos()
  self._ui._stc_couponName:SetText(self._ui._stc_couponName:GetText())
  local notiControl = UI.getChildControl(self._ui._stc_couponSlotBG, "StaticText_Noti")
  notiControl:SetShow(false)
end
function PaGlobal_IngameCashSHop_ReturnBack:subSlotSetting(index, cashProduct)
  for ii = 1, #self._subSlot + 10 do
    if nil ~= self._subSlot[ii] then
      self._subSlot[ii]:SetShow(false)
    end
  end
  local itemCount = cashProduct:getItemListCount()
  local posX = self._ui._slotTemplete:GetSpanSize().x
  for ii = 1, itemCount do
    local itemWrapper = cashProduct:getItemByIndex(ii - 1)
    if nil ~= itemWrapper then
      if self._subSlot[ii] == nil then
        self._subSlot[ii] = UI.cloneControl(self._ui._slotTemplete, self._ui._stc_itemSlotBG, "SubItemSlot_" .. ii)
      end
      self._subSlot[ii]:SetShow(true)
      self._subSlot[ii]:SetSpanSize(posX, self._subSlot[ii]:GetSpanSize().y)
      posX = posX + self._subSlot[ii]:GetSizeX() + 5
      local icon = UI.getChildControl(self._subSlot[ii], "Static_GoodsSlot")
      icon:ComputePos()
      icon:ChangeTextureInfoNameAsync("Icon/" .. itemWrapper:getIconPath())
      icon:setRenderTexture(icon:getBaseTexture())
      icon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTip(true," .. ii .. ")")
      icon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTip(false," .. ii .. ")")
    end
  end
  local productNoCount = ToClint_GetChooseProductListCount(index)
  if 0 == productNoCount then
    return
  end
  for ii = 1, productNoCount do
    local chooseProductNo = ToClint_GetChooseProductNoByIndex(index, ii - 1)
    local chooseProduct = getIngameCashMall():getCashProductStaticStatusByProductNoRaw(chooseProductNo)
    if nil ~= chooseProduct then
      local chooseitemCount = chooseProduct:getItemListCount()
      for jj = itemCount + 1, itemCount + 1 + chooseitemCount do
        local index = jj - (itemCount + 1)
        local itemWrapper = chooseProduct:getItemByIndex(index)
        if nil ~= itemWrapper then
          if self._subSlot[jj] == nil then
            self._subSlot[jj] = UI.cloneControl(self._ui._slotTemplete, self._ui._stc_itemSlotBG, "SubItemSlot_" .. jj)
          end
          self._subSlot[jj]:SetShow(true)
          self._subSlot[jj]:SetSpanSize(posX, self._subSlot[jj]:GetSpanSize().y)
          posX = posX + self._subSlot[jj]:GetSizeX() + 5
          local icon = UI.getChildControl(self._subSlot[jj], "Static_GoodsSlot")
          icon:ComputePos()
          icon:ChangeTextureInfoNameAsync("Icon/" .. itemWrapper:getIconPath())
          icon:setRenderTexture(icon:getBaseTexture())
          icon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTip2(true," .. chooseProductNo .. "," .. index .. "," .. jj .. ")")
          icon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTip2(false," .. chooseProductNo .. "," .. index .. "," .. jj .. ")")
        end
      end
      itemCount = itemCount + 1 + chooseitemCount
    end
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:subSlotSettingForEvent(cashProduct, control, index)
  if nil ~= self._subSlotForEvent[index] then
    for ii = 1, #self._subSlotForEvent[index] do
      if nil ~= self._subSlotForEvent[index].slot[ii] then
        self._subSlotForEvent[index].slot[ii]:SetShow(false)
      end
    end
  end
  local itemSlotBG = UI.getChildControl(control, "Static_ItemSlotBG")
  local template = UI.getChildControl(itemSlotBG, "Static_SubSlot_Temp")
  template:SetShow(false)
  local itemCount = cashProduct:getItemListCount()
  local posX = template:GetSpanSize().x
  for ii = 1, itemCount do
    local itemWrapper = cashProduct:getItemByIndex(ii - 1)
    if nil ~= itemWrapper then
      if self._subSlotForEvent[index] == nil then
        self._subSlotForEvent[index] = {
          slot = {}
        }
      end
      if self._subSlotForEvent[index].slot[ii] == nil then
        self._subSlotForEvent[index].slot[ii] = UI.cloneControl(template, itemSlotBG, "Static_SubSlot_Temp_" .. index .. "_" .. ii)
      end
      self._subSlotForEvent[index].slot[ii]:SetShow(true)
      self._subSlotForEvent[index].slot[ii]:SetSpanSize(posX, self._subSlotForEvent[index].slot[ii]:GetSpanSize().y)
      posX = posX + self._subSlotForEvent[index].slot[ii]:GetSizeX() + 5
      local icon = UI.getChildControl(self._subSlotForEvent[index].slot[ii], "Static_GoodsSlot")
      icon:ComputePos()
      icon:ChangeTextureInfoNameAsync("Icon/" .. itemWrapper:getIconPath())
      icon:setRenderTexture(icon:getBaseTexture())
      icon:addInputEvent("Mouse_On", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTipForEventCart(true," .. cashProduct:getNoRaw() .. "," .. index .. "," .. ii .. ")")
      icon:addInputEvent("Mouse_Out", "HandleEventOnOut_IngameCashSHop_ReturnBack_ItemShowToolTipForEventCart(false," .. cashProduct:getNoRaw() .. "," .. index .. "," .. ii .. ")")
    end
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:prepareOpen(index, controlIndex, eventCartNo)
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
  if _ContentsGroup_RefundCashProduct == false then
    return
  end
  if -1 ~= self._selectIndex and nil ~= PaGlobal_CashShopBuyHistory_ChangeClickTexture then
    PaGlobal_CashShopBuyHistory_ChangeClickTexture(self._selectControlIndex, false)
  end
  self._selectIndex = index
  self._selectControlIndex = controlIndex
  if nil ~= PaGlobal_CashShopBuyHistory_ChangeClickTexture then
    PaGlobal_CashShopBuyHistory_ChangeClickTexture(self._selectControlIndex, true)
  end
  self._ui._edit_check:SetEditText("")
  if eventCartNo == 0 then
    self:setProductItemSetting(index)
  else
    self:setProductItemSettingForEventCart(eventCartNo)
  end
  self:setCouponSetting(index)
  self:recalcPanelPosition()
  self:open()
  if self._isConsole == true then
    ToClient_padSnapSetTargetPanel(Panel_IngameCashSHop_ReturnBack)
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:recalcPanelPosition()
  local panel = Panel_IngameCashSHop_ReturnBack
  if panel == nil then
    return
  end
  local screenCenterX = getScreenSizeX() / 2
  local screenCenterY = getScreenSizeY() / 2
  local panelSizeX = panel:GetSizeX()
  local panelSizeY = panel:GetSizeY()
  local calcPosX = 0
  local calcPosY = screenCenterY - panelSizeY / 2
  if self._isConsole == true and PaGlobalFunc_PearlShop_GetMainBgPosSizeX ~= nil then
    local targetPosX, targetSizeX = PaGlobalFunc_PearlShop_GetMainBgPosSizeX()
    calcPosX = targetPosX + targetSizeX + 30
  else
    calcPosX = screenCenterX - panelSizeX / 2
  end
  if calcPosX < 0 then
    calcPosX = 0
  elseif getScreenSizeX() <= calcPosX + panelSizeX then
    local diffX = calcPosX + panelSizeX - getScreenSizeX()
    calcPosX = calcPosX - diffX - 10
  end
  if calcPosY < 0 then
    calcPosY = 0
  end
  panel:SetPosX(calcPosX)
  panel:SetPosY(calcPosY)
end
function PaGlobal_IngameCashSHop_ReturnBack:open()
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
  Panel_IngameCashSHop_ReturnBack:SetShow(true)
end
function PaGlobal_IngameCashSHop_ReturnBack:prepareClose()
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
  if nil ~= PaGlobal_CashShopBuyHistory_ChangeClickTexture then
    PaGlobal_CashShopBuyHistory_ChangeClickTexture(self._selectControlIndex, false)
  end
  self._selectIndex = -1
  self._selectControlIndex = -1
  self._ui._edit_check:SetEditText("")
  ClearFocusEdit()
  if self._isConsole == true and Panel_PearlShop ~= nil then
    ToClient_padSnapSetTargetPanel(Panel_PearlShop)
  end
  self:close()
end
function PaGlobal_IngameCashSHop_ReturnBack:close()
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
  Panel_IngameCashSHop_ReturnBack:SetShow(false)
end
function PaGlobal_IngameCashSHop_ReturnBack:validate()
  if nil == Panel_IngameCashSHop_ReturnBack then
    return
  end
end
function PaGlobal_IngameCashSHop_ReturnBack:getEventCartInfo()
  local productName = ""
  local control = self._ui._list2:GetContentByKey(toInt64(0, PaGlobal_IngameCashSHop_ReturnBack._selectIndex))
  if nil ~= control then
    local itemSlotBG = UI.getChildControl(control, "Static_ItemSlotBG")
    local nameControl = UI.getChildControl(itemSlotBG, "StaticText_GoodsName")
    productName = nameControl:GetText()
  end
  if "" ~= productName then
    local size = self._ui._list2:getElementManager():getSize()
    local count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_EVENTCART_RETURN_COUNT", "count", tostring(size))
    productName = productName .. " " .. count
  end
  return productName
end
