PaGlobal_ServerSelect_All = {
  _CHANNEL_TYPE = {
    SINGLE_WORLD_SYSTEM = 1,
    WAR_INFO = 2,
    OLVIA_CHANNEL = 3,
    PC_ROOM_CHANNEL = 4,
    ARSHA_CHANNEL = 5,
    MAINTERNANCE = 6,
    READY_MAINTERNANCE = 7,
    NO_ACCESS = 8,
    SEASONCHANNEL = 9,
    SEASON_ARSHA_CHANNEL = 10,
    OLYMPIC = 11,
    SEASON_NEWBIE_CHANNEL = 12,
    HADUM = 13,
    GUILD_MAINCHANNEL = 14,
    MAX_COUNT = 14
  },
  _BUTTON_STATE = {
    NORMAL = 1,
    SELECTED = 2,
    MAINSERVER_SELECT = 3
  },
  _ui = {
    _stc_movieBg = nil,
    _stc_leftBg = nil,
    _stc_rightBg = nil,
    _stc_channelDesc = {},
    _tree_serverList = nil,
    _txt_serverName = nil,
    _txt_worldName = nil,
    _txt_worldOption = nil,
    _pc = {
      _btn_mainServer = nil,
      _btn_mainServerSelect = nil,
      _btn_recentServer = nil,
      _btn_randomServer = nil
    },
    _console = {
      _txt_selectKey = nil,
      _txt_crossplayKey = nil,
      _txt_recentKey = nil,
      _txt_backKey = nil
    },
    _stc_bannerArea = nil,
    _stc_bannerAreaObt = nil,
    _stc_bannerBgList = {},
    _web_bannerList = {},
    _txt_versionString = nil
  },
  _treeData = {},
  _treeMainBranchKey = {},
  _restrictedServerData = {},
  _selectedWorldIndex = 1,
  _selectedChannelIndex = nil,
  _currentButtonState = 1,
  _currentDescriptionY = 0,
  _currentHoveredKey32 = nil,
  _defaultYGap = 15,
  _isConnecting = false,
  _isBlackSpiritEnable = false,
  _listContents = {},
  _listContentsLaunchTimeTable = {},
  _listContentsLaunchElapsed = 0,
  _listContentsLaunchedCount = 1,
  _listContentsCount = 0,
  _listContentsBaseX = 0,
  _listContentsAlphaTarget = {},
  _listContentsAlphaFlag = {},
  _listContentsFlag = {},
  _listContentsTarget = {},
  _treeSize = 0,
  _currentMovieIndex = 0,
  _ui_loadingMovie = nil,
  _moviePlayed = false,
  _movieOrder = {1, 2},
  _movieURL = {
    "coui://UI_Movie/06_sliced.webm",
    "coui://UI_Movie/07_sliced.webm"
  },
  _moviePath = {
    "UI_Movie/Bink/O_01.bk2",
    "UI_Movie/Bink/O_02.bk2"
  },
  _movieLength = {10000, 10000},
  _ani = {_startAnimationFinished = false, _listContentsShowAniFlag = false},
  _stc_BackgroundImage = Array.new(),
  _currentBackIndex = 0,
  _startAnimationFlag = false,
  _animationDelay = 0,5,
  _animationDelayCount = 0,
  _channelDescriptionData = {},
  _serverListGap = 0,
  _updateTimeAcc = 1,
  _isScope = false,
  _totalBG = 0,
  _lateUpdateFlag = false,
  _startUV = 0,1,
  _endUV = 0,14,
  _startUV2 = 0,9,
  _endUV2 = 0,94,
  _bgItem = {
    "base",
    "calpeon",
    "media",
    "valencia",
    "sea",
    "kamasilvia",
    "kamasilvia2",
    "dragan",
    "odyllita",
    "snowMountain",
    "xmas",
    "halloween",
    "thanksGivingDay",
    "aurora",
    "KoreaOnly",
    "JapanOnly",
    "RussiaOnly",
    "NaOnly",
    "TaiwanOnly",
    "KR2Only",
    "SAOnly",
    "TROnly",
    "THOnly",
    "IDOnly"
  },
  _bgManager = nil,
  _isConsole = false,
  _bannerIsReady = {},
  _inviteWorldIdx = 0,
  _inviteServerIdx = 0,
  _agree = nil,
  _isCrossplayMode = false,
  _initialize = false
}
runLua("UI_Data/Script/UI_Lobby/Panel_Lobby_ServerSelect_All_1.lua")
runLua("UI_Data/Script/UI_Lobby/Panel_Lobby_ServerSelect_All_2.lua")
registerEvent("FromClient_luaLoadCompleteLateUdpate", "FromClient_ServerSelect_All_Init")
function FromClient_ServerSelect_All_Init()
  PaGlobal_ServerSelect_All:initialize()
end
