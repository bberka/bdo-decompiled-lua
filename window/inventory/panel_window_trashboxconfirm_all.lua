PaGlobal_TrashBoxConfirm_All = {
  _ui = {
    _btn_close = nil,
    _btn_yes = nil,
    _btn_no = nil
  },
  _config = {
    _INVEN_MAX_SLOTNO = PaGlobal_Inventory_All.INVEN_MAX_SLOTNO
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true
  },
  _deleteItemInfoList = {},
  _initialize = false
}
runLua("UI_Data/Script/Window/Inventory/Panel_Window_TrashBoxConfirm_All_1.lua")
runLua("UI_Data/Script/Window/Inventory/Panel_Window_TrashBoxConfirm_All_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_TrashBoxConfirm_Init")
function FromClient_TrashBoxConfirm_Init()
  PaGlobal_TrashBoxConfirm_All:initialize()
end
