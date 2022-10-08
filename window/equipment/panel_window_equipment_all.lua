PaGlobal_Equipment_All = {
  _ui = {
    txt_titleBG = nil,
    check_popup = nil,
    btn_question = nil,
    btn_close = nil,
    stc_circle = nil,
    stc_abilityArea = nil,
    txt_attackText = nil,
    txt_attackValue = nil,
    txt_defenceText = nil,
    txt_defenceValue = nil,
    txt_awakenText = nil,
    txt_awakenValue = nil,
    txt_shyStatText = nil,
    txt_shyStatValue = nil,
    stc_bottomButtonArea = nil,
    btn_servantInven = nil,
    check_camouflage = nil,
    check_underwear = nil,
    btn_petList = nil,
    check_helmOpen = nil,
    check_helmInvisual = nil,
    check_cloak = nil,
    check_subWeapon = nil,
    btn_myStat = nil,
    stc_helmInvisualIcon = nil,
    stc_helmOpenIcon = nil,
    btn_setEffect = nil,
    btn_equipCrystal = nil,
    btn_artifactOption = nil,
    check_alchemyStone = nil,
    txt_alchemyStoneQuickKey = nil,
    tooltipTemplate = nil,
    txt_blankSlotTooltip = nil,
    stc_seasonBannerPass = nil,
    stc_seasonBannerReward = nil,
    stc_seasonBannerUpgrade = nil,
    stc_blackSpiritBackImage = nil,
    stc_imageWalk = nil,
    stc_imageGo = nil
  },
  _slotConfig = {
    createIcon = false,
    createBorder = true,
    createCount = true,
    createCash = true,
    createExpiration = true,
    createExpirationBG = true,
    createClassEquipBG = true,
    createEnduranceIcon = true,
    createItemLock = true,
    createBlack = true,
    createEnchant = true,
    createBadBG = true
  },
  _slotNoId = {
    [0] = "Static_Slot_RightHand",
    [1] = "Static_Slot_LeftHand",
    [2] = "Static_Slot_Gather",
    [3] = "Static_Slot_Chest",
    [4] = "Static_Slot_Glove",
    [5] = "Static_Slot_Boots",
    [6] = "Static_Slot_Helm",
    [7] = "Static_Slot_Necklace",
    [8] = "Static_Slot_Ring1",
    [9] = "Static_Slot_Ring2",
    [10] = "Static_Slot_Earing1",
    [11] = "Static_Slot_Earing2",
    [12] = "Static_Slot_Belt",
    [13] = "Static_Slot_Lantern",
    [14] = "Static_Slot_Avatar_Chest",
    [15] = "Static_Slot_Avatar_Gloves",
    [16] = "Static_Slot_Avatar_Boots",
    [17] = "Static_Slot_Avatar_Helm",
    [18] = "Static_Slot_Avatar_RightHand",
    [19] = "Static_Slot_Avatar_LeftHand",
    [20] = "Static_Slot_Avatar_UnderWear",
    [22] = "Static_Slot_FaceDecoration1",
    [23] = "Static_Slot_FaceDecoration2",
    [21] = "Static_Slot_FaceDecoration3",
    [27] = "Static_Slot_AlchemyStone",
    [29] = "Static_Slot_AwakenWeapon",
    [30] = "Static_Slot_Avatar_AwakenWeapon",
    [31] = "Static_Slot_QuestBook",
    [32] = "Static_Slot_Bracelet1",
    [33] = "Static_Slot_Bracelet2"
  },
  _avataEquipSlotId = {
    [14] = "Check_Slot_Avatar_Chest",
    [15] = "Check_Slot_Avatar_Gloves",
    [16] = "Check_Slot_Avatar_Boots",
    [17] = "Check_Slot_Avatar_Helm",
    [18] = "Check_Slot_Avatar_RightHand",
    [19] = "Check_Slot_Avatar_LeftHand",
    [20] = "Check_Slot_Avatar_UnderWear",
    [22] = "Check_Slot_FaceDecoration1",
    [23] = "Check_Slot_FaceDecoration2",
    [21] = "Check_Slot_FaceDecoration3",
    [30] = "Check_Slot_Avatar_AwakenWeapon"
  },
  _checkFlag = {
    [14] = 1,
    [15] = 2,
    [16] = 4,
    [17] = 8,
    [18] = 32,
    [19] = 64,
    [20] = 16,
    [22] = 256,
    [23] = 512,
    [21] = 128,
    [3] = 65536,
    [4] = 131072,
    [5] = 262144,
    [6] = 524288,
    [0] = 2097152,
    [1] = 4194304,
    [30] = 1024
  },
  _slotNoIdToString = {
    [__eEquipSlotNoRightHand] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"),
    [__eEquipSlotNoLeftHand] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"),
    [__eEquipSlotNoSubTool] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_GATHERTOOLS"),
    [__eEquipSlotNoChest] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_UPPERBODY"),
    [__eEquipSlotNoGlove] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"),
    [__eEquipSlotNoBoots] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"),
    [__eEquipSlotNoHelm] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"),
    [__eEquipSlotNoNecklace] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_NECKLACE"),
    [__eEquipSlotNoRing1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"),
    [__eEquipSlotNoRing2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"),
    [__eEquipSlotNoEaring1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"),
    [__eEquipSlotNoEaring2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"),
    [__eEquipSlotNoBelt] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_WAISTBAND"),
    [__eEquipSlotNoLantern] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_LANTERN"),
    [__eEquipSlotNoAvatarChest] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BODY"),
    [__eEquipSlotNoAvatarGlove] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HANDS"),
    [__eEquipSlotNoAvatarBoots] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BOOTS"),
    [__eEquipSlotNoAvatarHelm] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HELM"),
    [__eEquipSlotNoAvatarWeapon] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MAIN"),
    [__eEquipSlotNoAvatarSubWeapon] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_SUB"),
    [__eEquipSlotNoAvatarUnderwear] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_UNDERWEAR"),
    [__eEquipSlotNoFaceDecoration1] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HEAD"),
    [__eEquipSlotNoFaceDecoration2] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_EYES"),
    [__eEquipSlotNoFaceDecoration3] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MOUSE"),
    [__eEquipSlotNoAlchemyStone] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_alchemyStone"),
    [__eEquipSlotNoAwakenWeapon] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_awakenWeapon"),
    [__eEquipSlotNoAvatarAwakenWeapon] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_avatarAwakenWeapon"),
    [__eEquipSlotNoQuestBook] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_QUESTBOOK"),
    [__eEquipSlotNoArtifact1] = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_EQUIP_RELIC"),
    [__eEquipSlotNoArtifact2] = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_EQUIP_RELIC")
  },
  _bannerType = {
    SEASONPASS = 1,
    TOTALREWARD = 2,
    SEASONUPGRADE = 3
  },
  _EquipNoMin = CppEnums.EquipSlotNo.rightHand,
  _EquipNoMax = CppEnums.EquipSlotNo.equipSlotNoCount,
  _UnUsedEquipNo_01 = 100,
  _UnUsedEquipNo_02 = 101,
  _slotRingIndex = 0,
  _slotEaringIndex = 0,
  _slotArtifactIndex = 0,
  _isKR2ContentsEnable = true,
  _isSwimmingSuitContentEnable = true,
  _isAlchemyStoneCheck = false,
  _isUsedAlchemyStone = false,
  _reuseAlchemyStoneCheckTime = 0,
  _awakenWeaponContentsOpen = false,
  _extendedSlotInfoArray = {},
  _offenceValue = 0,
  _awakenOffecnValue = 0,
  _defenceValue = 0,
  _equipMentPosX = 0,
  _equipMentPosY = 0,
  slots = {},
  slotBGs = {},
  avataSlots = {},
  _categoryInfo = {
    _cashShopClothes = 8,
    _cashShopSubAcc = 4,
    _cashShopSubUnder = 3
  },
  _weaponCategoryByClass = {
    [__eClassType_Warrior] = 1,
    [__eClassType_Valkyrie] = 1,
    [__eClassType_ElfRanger] = 2,
    [__eClassType_Sorcerer] = 3,
    [__eClassType_Giant] = 4,
    [__eClassType_Tamer] = 5,
    [__eClassType_Kunoichi] = 5,
    [__eClassType_NinjaMan] = 5,
    [__eClassType_BladeMasterWoman] = 6,
    [__eClassType_BladeMaster] = 6,
    [__eClassType_WizardWoman] = 7,
    [__eClassType_WizardMan] = 7,
    [__eClassType_DarkElf] = 8,
    [__eClassType_Combattant] = 9,
    [__eClassType_Mystic] = 9,
    [__eClassType_Lhan] = 10,
    [__eClassType_RangerMan] = 11,
    [__eClassType_ShyWaman] = 12,
    [__eClassType_Guardian] = 13,
    [__eClassType_Hashashin] = 14,
    [__eClassType_Nova] = 15,
    [__eClassType_Sage] = 16,
    [__eClassType_Corsair] = 17,
    [__eClassType_Drakania] = 18
  },
  _subWeaponCategoryByClass = {
    [__eClassType_Warrior] = 1,
    [__eClassType_Valkyrie] = 1,
    [__eClassType_Sorcerer] = 3,
    [__eClassType_Giant] = 4,
    [__eClassType_ElfRanger] = 2,
    [__eClassType_Tamer] = 5,
    [__eClassType_BladeMaster] = 6,
    [__eClassType_BladeMasterWoman] = 6,
    [__eClassType_NinjaMan] = 8,
    [__eClassType_Kunoichi] = 7,
    [__eClassType_WizardWoman] = 2,
    [__eClassType_WizardMan] = 2,
    [__eClassType_DarkElf] = 4,
    [__eClassType_Combattant] = 9,
    [__eClassType_Mystic] = 9,
    [__eClassType_Lhan] = 10,
    [__eClassType_RangerMan] = 11,
    [__eClassType_ShyWaman] = 12,
    [__eClassType_Guardian] = 1,
    [__eClassType_Hashashin] = 13,
    [__eClassType_Nova] = 14,
    [__eClassType_Sage] = 3,
    [__eClassType_Corsair] = 15,
    [__eClassType_Drakania] = 16
  },
  _awakenWeaponCategoryByClass = {
    [__eClassType_Warrior] = 1,
    [__eClassType_Sorcerer] = 2,
    [__eClassType_Giant] = 3,
    [__eClassType_ElfRanger] = 4,
    [__eClassType_Tamer] = 5,
    [__eClassType_Valkyrie] = 6,
    [__eClassType_BladeMaster] = 7,
    [__eClassType_BladeMasterWoman] = 8,
    [__eClassType_NinjaMan] = 9,
    [__eClassType_Kunoichi] = 10,
    [__eClassType_WizardWoman] = 11,
    [__eClassType_WizardMan] = 12,
    [__eClassType_DarkElf] = 13,
    [__eClassType_Combattant] = 14,
    [__eClassType_Mystic] = 15,
    [__eClassType_Lhan] = 16,
    [__eClassType_RangerMan] = 17,
    [__eClassType_ShyWaman] = 18,
    [__eClassType_Guardian] = 19,
    [__eClassType_Hashashin] = 20,
    [__eClassType_Nova] = 21,
    [__eClassType_Sage] = 22,
    [__eClassType_Corsair] = 23,
    [__eClassType_Drakania] = 24
  },
  _marketCategoryTable = nil,
  _marketCategoryCount = 0,
  equipSlotMainIndex = nil,
  equipSlotSubIndex = nil,
  _seasonUpgradeEffect = false,
  _isConsole = false,
  _initialize = false
}
runLua("UI_Data/Script/Window/Equipment/Panel_Window_Equipment_All_1.lua")
runLua("UI_Data/Script/Window/Equipment/Panel_Window_Equipment_All_2.lua")
runLua("UI_Data/Script/Window/Equipment/Panel_Window_Equipment_All_3.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_Equipment_All_Init")
function FromClient_Equipment_All_Init()
  PaGlobal_Equipment_All:initialize()
end
