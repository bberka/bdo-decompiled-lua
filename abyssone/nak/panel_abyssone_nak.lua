PaGlobal_AbyssOneNak = {
  _ui = {},
  _nakInfoList = nil,
  _initialize = false
}
runLua("UI_Data/Script/AbyssOne/Nak/Panel_AbyssOne_Nak_1.lua")
runLua("UI_Data/Script/AbyssOne/Nak/Panel_AbyssOne_Nak_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_AbyssOneNakInit")
function FromClient_AbyssOneNakInit()
  PaGlobal_AbyssOneNak:initialize()
end
