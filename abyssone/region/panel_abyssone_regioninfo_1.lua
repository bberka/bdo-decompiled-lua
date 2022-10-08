function PaGlobal_AbyssOneInfo:initialize()
  if self._initialize == true then
    return
  end
  self._ui._stc_titleBg = UI.getChildControl(Panel_Window_AbyssOneInfo, "Static_TitleBar")
  self._ui._stc_titleText = UI.getChildControl(self._ui._stc_titleBg, "StaticText_Title")
  self._ui._stc_descText = UI.getChildControl(self._ui._stc_titleBg, "StaticText_Desc")
  self._ui._stc_descText:SetTextMode(__eTextMode_AutoWrap)
  self:registEventHandler()
  self:validate()
  self._initialize = true
  self:prepareOpen()
end
function PaGlobal_AbyssOneInfo:registEventHandler()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  registerEvent("FromClient_EnterToInstanceField", "FromClient_SetAbyssOneRegionInfo")
end
function PaGlobal_AbyssOneInfo:validate()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  self._ui._stc_titleBg:isValidate()
  self._ui._stc_titleText:isValidate()
  self._ui._stc_descText:isValidate()
end
function PaGlobal_AbyssOneInfo:prepareOpen()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  local isSuccess = self:setData()
  if isSuccess == false then
    return
  end
  self:recalcPanelPosition()
  self:open()
end
function PaGlobal_AbyssOneInfo:open()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  Panel_Window_AbyssOneInfo:SetShow(true)
end
function PaGlobal_AbyssOneInfo:prepareClose()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  self:close()
end
function PaGlobal_AbyssOneInfo:close()
  if Panel_Window_AbyssOneInfo == nil then
    return
  end
  Panel_Window_AbyssOneInfo:SetShow(false)
end
function PaGlobal_AbyssOneInfo:recalcPanelPosition()
  local panel = Panel_Window_AbyssOneInfo
  if panel == nil then
    return
  end
  Panel_Window_AbyssOneInfo:ComputePos()
end
function PaGlobal_AbyssOneInfo:setData()
  if Panel_Window_AbyssOneInfo == nil then
    return false
  end
  local currentMapKey = ToClient_GetCurrentInstanceFieldMapKey()
  local instanceMapSSW = ToClient_GetInstanceMapStaticStatusWrapper(currentMapKey)
  if instanceMapSSW == nil then
    return false
  end
  local mapNameStrig = PAGetString(Defines.StringSheet_GAME, instanceMapSSW:getFieldNameStringKey())
  if mapNameStrig == nil then
    return false
  end
  local mapDescString = PAGetString(Defines.StringSheet_GAME, instanceMapSSW:getFieldDescStringKey())
  if mapDescString == nil then
    return false
  end
  self._ui._stc_titleText:SetText(mapNameStrig)
  self._ui._stc_descText:SetText(mapDescString)
  return true
end
