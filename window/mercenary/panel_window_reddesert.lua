local isDev = isGameServiceTypeDev()
Panel_Window_RedDesert:SetShow(false)
PaGlobal_RedDesert = {
  _ui = {
    _static_Balenos = UI.getChildControl(Panel_Window_RedDesert, "Static_CapheonBg"),
    _static_Serendia = UI.getChildControl(Panel_Window_RedDesert, "Static_MediaBg"),
    _static_Calpheon = UI.getChildControl(Panel_Window_RedDesert, "Static_ValenciaBg"),
    _btn_selectBalenos = nil,
    _btn_selectSerendia = nil,
    _btn_selectCalpheon = nil
  }
}
function PaGlobal_RedDesert:initialize()
  local isSelect = ToClient_IsSelectableTerritory()
  if true == isSelect and true == isDev then
    PaGlobal_RedDesert:open()
  else
    PaGlobal_RedDesert:close()
  end
  self._ui._btn_selectBalenos = UI.getChildControl(self._ui._static_Balenos, "Button_Attack")
  self._ui._btn_selectSerendia = UI.getChildControl(self._ui._static_Serendia, "Button_Attack")
  self._ui._btn_selectCalpheon = UI.getChildControl(self._ui._static_Calpheon, "Button_Attack")
  self._ui._btn_selectBalenos:addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 0 .. " )")
  self._ui._btn_selectSerendia:addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 1 .. " )")
  self._ui._btn_selectCalpheon:addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 2 .. " )")
end
function PaGlobal_RedDesert:open()
  Panel_Window_RedDesert:SetShow(true)
end
function PaGlobal_RedDesert:close()
  Panel_Window_RedDesert:SetShow(false)
end
function PaGlobal_RedDesert:selectTerritory(index)
  ToClient_requestSelectRealm(index)
  _PA_LOG("ì„ìŠ¹ìš±", "ì˜ì§€ì„ íƒ :" .. tostring(index))
end
function FromClient_UpdateDDTerritoryKey(index)
  _PA_LOG("ì„ìŠ¹ìš±", "ì˜ì§€ì„ íƒí›„ :::" .. tostring(index))
  PaGlobal_RedDesert:close()
end
registerEvent("FromClient_UpdateDDTerritoryKey", "FromClient_UpdateDDTerritoryKey")
PaGlobal_RedDesert:initialize()
