function HandleEventLUp_PaGlobal_Event_TicketShop_Draw(drawOrderNo)
  local drawStaticStatusWrapper = getDrawItemStaticStatusByOrderIndex(drawOrderNo)
  if drawStaticStatusWrapper == nil then
    return
  end
  local itemStaticStatusWrapper = getItemEnchantStaticStatus(drawStaticStatusWrapper:getItemkey())
  if itemStaticStatusWrapper == nil then
    return
  end
  local function drawEffectOpen()
    local drawStaticStatusWrapper = getDrawItemStaticStatusByOrderIndex(drawOrderNo)
    if drawStaticStatusWrapper == nil then
      return
    end
    if ToClient_CheckCanDrawItem(drawStaticStatusWrapper:getIndex()) == false then
      return
    end
    HandleEventLUp_PaGlobal_Event_TicketShop_Unboxing(drawOrderNo)
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_EVENT_TICKETSHOP_POPUP_TITLE"),
    content = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_EVENT_TICKETSHOP_POPUP_DESC", "ticket", drawStaticStatusWrapper:getCoinCount(), "item", FGlobal_ChangeItemNameColorByGrade(drawStaticStatusWrapper:getItemkey()), "coin", drawStaticStatusWrapper:getLoseCoinCount()),
    functionYes = drawEffectOpen,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function HandleEventLUp_PaGlobal_Event_TicketShop_Unboxing(drawOrderNo)
  local drawStaticStatusWrapper = getDrawItemStaticStatusByOrderIndex(drawOrderNo)
  if drawStaticStatusWrapper == nil then
    return
  end
  if Panel_Event_TicketShop_Unboxing == nil then
    return
  end
  PaGlobal_Event_TicketShop_SetFocusIndex(drawOrderNo)
  PaGlobal_Event_TicketShop_Unboxing_Open()
end
function HandleEventOnOut_PaGlobal_Event_TicketShop_EnableItemTooltip(drawOrderNo, isShow)
  if false == isShow then
    if false == _ContentsGroup_RenewUI_Tooltip then
      Panel_Tooltip_Item_hideTooltip()
    else
      PaGlobalFunc_TooltipInfo_Close()
    end
    return
  end
  local drawStaticStatusWrapper = getDrawItemStaticStatusByOrderIndex(drawOrderNo)
  if drawStaticStatusWrapper == nil then
    return
  end
  local itemSSW = getItemEnchantStaticStatus(drawStaticStatusWrapper:getItemkey())
  if itemSSW == nil then
    return
  end
  if nil == Panel_Event_TicketShop then
    return
  end
  if false == _ContentsGroup_RenewUI_Tooltip then
    Panel_Tooltip_Item_Show(itemSSW, Panel_Event_TicketShop, true)
  else
    PaGlobalFunc_TooltipInfo_Open(Defines.TooltipDataType.ItemWrapper, itemSSW, Defines.TooltipTargetType.Item, 0, getScreenSizeX())
  end
end
function HandleEventOnOut_PaGlobal_Event_TicketShop_EnableCoinTooltip(isCoin, isShow)
  if false == isShow then
    if false == _ContentsGroup_RenewUI_Tooltip then
      Panel_Tooltip_Item_hideTooltip()
    else
      PaGlobalFunc_TooltipInfo_Close()
    end
    return
  end
  local drawStaticStatusWrapper = getDrawItemStaticStatusByOrderIndex(0)
  if drawStaticStatusWrapper == nil then
    return
  end
  local itemKey = 0
  if isCoin == true then
    itemKey = drawStaticStatusWrapper:getCoinItemKey()
  else
    itemKey = drawStaticStatusWrapper:getLoseItemKey()
  end
  if itemKey == 0 then
    return
  end
  local itemSSW = getItemEnchantStaticStatus(itemKey)
  if itemSSW == nil then
    return
  end
  if nil == Panel_Event_TicketShop then
    return
  end
  if false == _ContentsGroup_RenewUI_Tooltip then
    Panel_Tooltip_Item_Show(itemSSW, Panel_Event_TicketShop, true)
  else
    PaGlobalFunc_TooltipInfo_Open(Defines.TooltipDataType.ItemWrapper, itemSSW, Defines.TooltipTargetType.Item, 0, getScreenSizeX())
  end
end
function HandleEventLUp_PaGlobal_Event_TicketShop_ShowItemTooltip()
  if PaGlobal_Event_TicketShop == nil then
    return
  end
  if Panel_Widget_Tooltip_Renew:GetShow() == true then
    PaGlobalFunc_TooltipInfo_Close()
    return
  end
  if Panel_Tooltip_Item:GetShow() == true then
    Panel_Tooltip_Item_hideTooltip()
    return
  end
  HandleEventOnOut_PaGlobal_Event_TicketShop_EnableItemTooltip(PaGlobal_Event_TicketShop._focusDrawOrderNo, true)
end
function PaGlobal_Event_TicketShop_Open()
  PaGlobal_Event_TicketShop:prepareOpen()
end
function PaGlobal_Event_TicketShop_Close()
  PaGlobal_Event_TicketShop:prepareClose()
end
function PaGlobal_Event_TicketShop_Unboxing_Open()
  PaGlobal_Event_TicketShop:prepareOpenUnboxing()
end
function PaGlobal_Event_TicketShop_Unboxing_Close()
  PaGlobal_Event_TicketShop:prepareCloseUnboxing()
end
function PaGlobal_Event_TicketShop_Unboxing_Result_Open(drawIndex, isWin)
  if drawIndex < 0 then
    PaGlobal_Event_TicketShop_Unboxing_Result_Close()
    return
  end
  PaGlobal_Event_TicketShop:prepareOpenUnboxingResult(drawIndex, isWin)
end
function PaGlobal_Event_TicketShop_Unboxing_Result_Close()
  PaGlobal_Event_TicketShop:prepareCloseUnboxingResult()
end
