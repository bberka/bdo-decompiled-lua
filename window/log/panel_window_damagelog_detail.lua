PaGlobal_DamageLog_Detail = {
  _ui = {
    _stc_titleBg = UI.getChildControl(Panel_Window_DamageLog_Detail, "Static_TitleBg"),
    _stc_mainBg = UI.getChildControl(Panel_Window_DamageLog_Detail, "Static_MainBg"),
    _btn_cancel = UI.getChildControl(Panel_Window_DamageLog_Detail, "Button_Cancel"),
    _combo_logLevel = UI.getChildControl(Panel_Window_DamageLog_Detail, "Combobox_1"),
    _edit_keyword = UI.getChildControl(Panel_Window_DamageLog_Detail, "Edit_Search")
  },
  _damageLogLevelString = {
    [__eDamageLogLevel_0] = "ì „ì²´ ë¡œê·¸",
    [__eDamageLogLevel_1] = "ë°ë¯¸ì§€ ê³„ì‚° ë¡œê·¸",
    [__eDamageLogLevel_2] = "ìµœì¢… ë¡œê·¸"
  },
  _actorTypeString = {
    [0] = "Player",
    [1] = "Monster",
    [2] = "Npc",
    [3] = "Vehicle",
    [4] = "Gate",
    [5] = "Alterego",
    [6] = "Collect",
    [7] = "Household",
    [8] = "Installation",
    [9] = "DeadBody",
    [10] = "InstanceObject",
    [11] = "Trigger",
    [12] = "Loot",
    [13] = "InstanceBot",
    [14] = "SubPlayer",
    [15] = "Siege",
    [16] = "Undefined"
  },
  _attackResultString = {
    [0] = "Success",
    [1] = "Critical",
    [2] = "Guard",
    [3] = "Protection",
    [4] = "Killing",
    [5] = "Immune",
    [6] = "Miss",
    [7] = "[ë²„ê·¸] ë¬¸ì œ ìˆìŠµë‹ˆë‹¤."
  },
  _attackAdditionalDamageTypeString = {
    [0] = "Back",
    [1] = "Counter",
    [2] = "Down",
    [3] = "Speed",
    [4] = "Air",
    [5] = "Empty",
    [6] = "ì¼ë°˜"
  },
  _logMgrWrapper = nil,
  _initialize = false
}
runLua("UI_Data/Script/Window/Log/Panel_Window_DamageLog_Detail_1.lua")
runLua("UI_Data/Script/Window/Log/Panel_Window_DamageLog_Detail_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_PaGlobal_DamageLog_Detail_Init")
function FromClient_PaGlobal_DamageLog_Detail_Init()
  PaGlobal_DamageLog_Detail:initialize()
end
