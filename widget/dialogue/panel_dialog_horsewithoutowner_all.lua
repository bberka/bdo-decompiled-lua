PaGlobal_HorseWithoutOwner = {
  _ui = {_btn_summon = nil, _stc_console = nil},
  _isConsole = false,
  _initialize = false
}
runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_HorseWithoutOwner_All_1.lua")
runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_HorseWithoutOwner_All_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_HorseWithoutOwnerInit")
function FromClient_HorseWithoutOwnerInit()
  PaGlobal_HorseWithoutOwner:initialize()
end
