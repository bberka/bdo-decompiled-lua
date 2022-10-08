PaGlobal_StaminaAuto = {
  _initialize = false,
  _ui = {
    stc_BG,
    stc_Design,
    chk_AutoRun,
    stc_Dongle,
    txt_AutoRunEnable
  },
  _fadeAlpha = 0,
  _isOpening = true
}
runLua("UI_Data/Script/Widget/Stamina/Panel_Widget_Stamina_Auto_All_1.lua")
runLua("UI_Data/Script/Widget/Stamina/Panel_Widget_Stamina_Auto_All_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_StaminaAutoInit")
function FromClient_StaminaAutoInit()
  PaGlobal_StaminaAuto:initialize()
end
