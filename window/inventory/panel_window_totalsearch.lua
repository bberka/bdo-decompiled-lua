PaGlobal_TotalSearch = {
  _ui = {
    _edt_search = nil,
    _stc_keyGuideX = nil,
    _btn_search = nil,
    _btn_reset = nil,
    _lst_searchResult = nil,
    _stc_emptyResult = nil,
    _stc_defaultGuideText = nil,
    _stc_keyGuideArea = nil,
    _stc_keyGuide_Y = nil
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createClassEquipBG = true,
    createCash = true,
    createEnchant = true
  },
  _silverSlotConfig = {createIcon = true, createBorder = true},
  _lastMouseOnListIndex = nil,
  _isWareHouseOpen = false,
  _isWorldMapOpen = false,
  _isPadMode = false,
  _isConsole = false,
  _initialize = false
}
runLua("UI_Data/Script/Window/Inventory/Panel_Window_TotalSearch_1.lua")
runLua("UI_Data/Script/Window/Inventory/Panel_Window_TotalSearch_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_TotalSearchInit")
function FromClient_TotalSearchInit()
  PaGlobal_TotalSearch:initialize()
end
