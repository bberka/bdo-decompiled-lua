PaGlobal_ContentsRotation = {
  _ui = {
    _stc_titleBG = UI.getChildControl(Panel_Window_ContentsRotation, "StaticText_Title_BG"),
    _stc_mainBG = UI.getChildControl(Panel_Window_ContentsRotation, "Static_Main_BG")
  },
  _function = nil,
  _initialize = false
}
runLua("UI_Data/Script/Window/ContentsRotation/Panel_Window_ContentsRotation_1.lua")
runLua("UI_Data/Script/Window/ContentsRotation/Panel_Window_ContentsRotation_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_PaGlobal_ContentsRotation_Init")
function FromClient_PaGlobal_ContentsRotation_Init()
  PaGlobal_ContentsRotation:initialize()
end
