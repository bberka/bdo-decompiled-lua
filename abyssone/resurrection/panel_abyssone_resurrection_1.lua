function PaGlobal_AbyssOneResurrection:initialize()
  if self._initialize == true then
    return
  end
  self._isConsole = _ContentsGroup_UsePadSnapping
  local buttonBg = UI.getChildControl(Panel_AbyssOne_Resurrection, "Static_BTN_BG")
  self._ui._btn_retry = UI.getChildControl(buttonBg, "Button_Retry")
  self._ui._btn_returnMagnus = UI.getChildControl(buttonBg, "Button_Recall")
  self._ui._btn_exit = UI.getChildControl(buttonBg, "Button_Exit")
  self:registEventHandler()
  self:validate()
  self._initialize = true
end
function PaGlobal_AbyssOneResurrection:registEventHandler()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  self._ui._btn_retry:addInputEvent("Mouse_LUp", "HandleEventLUp_AbyssOneResurrection_Revive(" .. tostring(__eRespawnType_AbyssOne) .. ")")
  self._ui._btn_returnMagnus:addInputEvent("Mouse_LUp", "HandleEventLUp_AbyssOneResurrection_Revive(" .. tostring(__eRespawnType_AbyssOneBase) .. ")")
  self._ui._btn_exit:addInputEvent("Mouse_LUp", "HandleEventLUp_AbyssOneResurrection_Revive(" .. tostring(__eRespawnType_AbyssOneExit) .. ")")
  registerEvent("FromClient_AbyssOne_SelfPlayerDead", "FromClient_AbyssOne_Dead")
  registerEvent("EventSelfPlayerRevive", "FromClient_AbyssOne_Revive")
  Panel_AbyssOne_Resurrection:RegisterShowEventFunc(true, "Panel_AbyssOne_Resurrection_ShowAni()")
  Panel_AbyssOne_Resurrection:RegisterShowEventFunc(false, "Panel_AbyssOne_Resurrection_HideAni()")
end
function PaGlobal_AbyssOneResurrection:validate()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  self._ui._btn_retry:isValidate()
  self._ui._btn_returnMagnus:isValidate()
  self._ui._btn_exit:isValidate()
end
function PaGlobal_AbyssOneResurrection:prepareOpen()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  self:setButtuonIgnoreAndMonotone(false)
  self:open()
end
function PaGlobal_AbyssOneResurrection:open()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  Panel_AbyssOne_Resurrection:SetShow(true, true)
end
function PaGlobal_AbyssOneResurrection:prepareClose()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  self:close()
end
function PaGlobal_AbyssOneResurrection:close()
  if Panel_AbyssOne_Resurrection == nil then
    return
  end
  Panel_AbyssOne_Resurrection:SetShow(false, true)
end
function PaGlobal_AbyssOneResurrection:setButtuonIgnoreAndMonotone(flag)
  if Panel_AbyssOne_Resurrection == nil or flag == nil then
    return
  end
  self._ui._btn_retry:SetIgnore(flag)
  self._ui._btn_retry:SetMonoTone(flag)
  self._ui._btn_returnMagnus:SetIgnore(flag)
  self._ui._btn_returnMagnus:SetMonoTone(flag)
  self._ui._btn_exit:SetIgnore(flag)
  self._ui._btn_exit:SetMonoTone(flag)
end
