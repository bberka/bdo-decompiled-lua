Widget_Function_Type_Console = {
  GrowthPass = 0,
  YachtPvP = 1,
  Count = 2
}
PaGlobal_Widget_FunctionButton_Console = {
  _ui = {},
  _button = {
    [Widget_Function_Type_Console.GrowthPass] = nil,
    [Widget_Function_Type_Console.YachtPvP] = nil
  },
  _buttonShow = {
    [Widget_Function_Type_Console.GrowthPass] = false,
    [Widget_Function_Type_Console.YachtPvP] = false
  },
  _growthPassIconValue = {
    _accDeltaTime = 0,
    _showTime = 10,
    _doUpdate = false,
    _keptGrowthPassIntroBubbleTextControl = false,
    _growthPassEffectNo = nil
  },
  _yachtIconValue = {
    _accDeltaTime = 0,
    _showTime = 10,
    _doUpdate = false
  },
  _initialize = false
}
runLua("UI_Data/Script/Widget/RightTopIcons/Renewal/Console/Panel_Widget_FunctionButton_Console_1.lua")
runLua("UI_Data/Script/Widget/RightTopIcons/Renewal/Console/Panel_Widget_FunctionButton_Console_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_Widget_FunctionButton_Console_Init")
function FromClient_Widget_FunctionButton_Console_Init()
  PaGlobal_Widget_FunctionButton_Console:initialize()
end
