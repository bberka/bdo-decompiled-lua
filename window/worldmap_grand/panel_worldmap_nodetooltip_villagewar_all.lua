PaGlobal_WorldMapNodeTooltip_VillageWar = {
  _ui = {
    _stc_mainBG = nil,
    _txt_gradeTop = nil,
    _txt_nodeName = nil,
    _stc_guildMarkBG = nil,
    _stc_guildMark = nil,
    _txt_guildName = nil,
    _txt_guildMaster = nil,
    _txt_victoryDay = nil,
    _txt_nodeState = nil,
    _txt_tentCount = nil,
    _txt_tentCountBeingSiege = nil,
    _stc_line = nil,
    _txt_grade = nil,
    _txt_memberLimit = nil,
    _txt_adLimit = nil,
    _txt_mercenaryLimit = nil,
    _txt_guildWarDay = nil,
    _stc_allianceInfoBG = nil,
    _stc_allianceInfo = nil,
    _stc_allianceLeader = nil,
    _stc_guildTemplate = nil,
    _stc_guildList = {},
    _stc_siegeLimitBg = nil,
    _stc_siegeLimitBlackBg = nil,
    _txt_adLimitNew = nil,
    _txt_myAD = nil,
    _txt_myADToHuman = nil,
    _txt_dvLimitNew = nil,
    _txt_myDV = nil,
    _txt_dvRateLimitNew = nil,
    _txt_myDVRate = nil,
    _txt_pvLimitNew = nil,
    _txt_myPV = nil,
    _txt_siegeLimitDesc = nil,
    _txt_pvpLimitNew = nil,
    _txt_myPVPStat = nil,
    _txt_hitLimitNew = nil,
    _txt_myHitStat = nil,
    _txt_hitRateLimitNew = nil,
    _txt_hitRateStat = nil,
    _txt_resistLimitNew = nil,
    _txt_myResistStat = nil
  },
  _defaultAllianceInfoPosX = 0,
  _defaultMercenaryLimitY = 0,
  _defaultBGSizeY = 0,
  _defaultBlackBGSizeY = 0,
  _defaultDescSpanSizeY = 0,
  _defaultDescTextSizeY = 52,
  _defaultMyPvSizeY = 0,
  _defaultMyPvPSizeY = 0,
  _defaultLineSpanSizeY = 0,
  _defaultTextSizeY = 26,
  _defaultGradeTextSpanSizeY = 0,
  _defaultMemberCountTextSpanSizeY = 0,
  _defaultDayTextSpanSizeY = 0,
  _defaultMainBGSizeY = 0,
  _defaultPanelSizeY = 0,
  _defaultLimitPanelPosY = 0,
  _adLimitNewBasePos = nil,
  _myADBasePos = nil,
  _myADToHumanBasePos = nil,
  _dvLimitNewBasePos = nil,
  _myDVBasePos = nil,
  _dvRateLimitNewBasePos = nil,
  _myDVRateBasePos = nil,
  _pvLimitNewBasePos = nil,
  _myPVBasePos = nil,
  _siegeLimitDescBasePos = nil,
  _pvpLimitNewBasePos = nil,
  _myPVPStatBasePos = nil,
  _hitLimitNewBasePos = nil,
  _myHitStatBasePos = nil,
  _hitRateLimitNewBasePos = nil,
  _hitRateStatBasePos = nil,
  _resistLimitNewBasePos = nil,
  _myResistStatBasePos = nil,
  _defaultPvpTitlePosY = 0,
  _defaultmyPvpValuePosY = 0,
  _initialize = false,
  _MAX_MEMBER_COUNT = 9,
  _UI_VT = CppEnums.VillageSiegeType,
  _dayStringList = {
    [CppEnums.VillageSiegeType.eVillageSiegeType_Sunday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_SUNDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Monday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_MONDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Tuesday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_TUESDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Wednesday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_WEDNESDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Thursday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_THUSDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Friday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_FRIDAY"),
    [CppEnums.VillageSiegeType.eVillageSiegeType_Saturday] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_SATURDAY")
  },
  _gradeString = {
    [0] = PAGetString(Defines.StringSheet_GAME, "LUA_SIEGENODE_LOW_LEVEL"),
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_SIEGENODE_MIDDLE_LEVEL"),
    [2] = PAGetString(Defines.StringSheet_GAME, "LUA_SIEGENODE_HIGH_LEVEL")
  }
}
runLua("UI_Data/Script/Window/WorldMap_Grand/Panel_Worldmap_NodeTooltip_VillageWar_All_1.lua")
runLua("UI_Data/Script/Window/WorldMap_Grand/Panel_Worldmap_NodeTooltip_VillageWar_All_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_PaGlobal_WorldMapNodeTooltip_VillageWar_Init")
function FromClient_PaGlobal_WorldMapNodeTooltip_VillageWar_Init()
  PaGlobal_WorldMapNodeTooltip_VillageWar:initialize()
end
