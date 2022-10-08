PaGlobal_VoiceChat_List_New = {
  _ui = {
    _stc_channelBG = nil,
    _txt_channelName = nil,
    _txt_myName = nil,
    _txt_myNameTalk = nil,
    _stc_myClassType = nil,
    _chk_myMic = nil,
    _chk_myListen = nil,
    _list2_memberList = nil,
    _btn_setting = nil,
    _btn_sticker = nil,
    _btn_close = nil,
    _mulTxt_noBody = nil,
    _slider_personalVolume_BG = nil,
    _slider_personalVolume = nil,
    _slider_personalVolume_BTN = nil,
    _slider_personalVolume_TXT = nil,
    _slider_personalVolume_EXIT = nil,
    _stc_subMenu_BG = nil,
    _btn_mute = nil,
    _btn_whisper = nil,
    _btn_party = nil,
    _stc_keyGuideBG = nil,
    _btn_padY = nil,
    _btn_padA = nil,
    _btn_padB = nil,
    _btn_padLB = nil,
    _btn_padRB = nil
  },
  _textureClassSymbol = {
    ["path"] = "Renewal/UI_Icon/Console_ClassSymbol.dds",
    [__eClassType_Warrior] = {
      x1 = 1,
      x2 = 172,
      y1 = 57,
      y2 = 228
    },
    [__eClassType_Hashashin] = {
      x1 = 172,
      x2 = 286,
      y1 = 228,
      y2 = 342
    },
    [__eClassType_ElfRanger] = {
      x1 = 58,
      x2 = 172,
      y1 = 114,
      y2 = 228
    },
    [__eClassType_Sorcerer] = {
      x1 = 115,
      x2 = 172,
      y1 = 171,
      y2 = 228
    },
    [__eClassType_Nova] = {
      x1 = 229,
      x2 = 286,
      y1 = 285,
      y2 = 342
    },
    [__eClassType_Lhan] = {
      x1 = 400,
      x2 = 229,
      y1 = 456,
      y2 = 285
    },
    [__eClassType_Giant] = {
      x1 = 172,
      x2 = 172,
      y1 = 228,
      y2 = 228
    },
    [__eClassType_Tamer] = {
      x1 = 229,
      x2 = 172,
      y1 = 285,
      y2 = 228
    },
    [__eClassType_Combattant] = {
      x1 = 286,
      x2 = 229,
      y1 = 342,
      y2 = 285
    },
    [__eClassType_BladeMaster] = {
      x1 = 286,
      x2 = 172,
      y1 = 342,
      y2 = 228
    },
    [__eClassType_BladeMasterWoman] = {
      x1 = 400,
      x2 = 172,
      y1 = 456,
      y2 = 228
    },
    [__eClassType_Mystic] = {
      x1 = 343,
      x2 = 229,
      y1 = 399,
      y2 = 285
    },
    [__eClassType_Valkyrie] = {
      x1 = 343,
      x2 = 172,
      y1 = 399,
      y2 = 228
    },
    [__eClassType_Kunoichi] = {
      x1 = 115,
      x2 = 229,
      y1 = 171,
      y2 = 285
    },
    [__eClassType_NinjaMan] = {
      x1 = 172,
      x2 = 229,
      y1 = 228,
      y2 = 285
    },
    [__eClassType_DarkElf] = {
      x1 = 229,
      x2 = 229,
      y1 = 285,
      y2 = 285
    },
    [__eClassType_WizardMan] = {
      x1 = 1,
      x2 = 229,
      y1 = 57,
      y2 = 285
    },
    [__eClassType_RangerMan] = {
      x1 = 1,
      x2 = 286,
      y1 = 57,
      y2 = 342
    },
    [__eClassType_WizardWoman] = {
      x1 = 58,
      x2 = 229,
      y1 = 114,
      y2 = 285
    },
    [__eClassType_ShyWaman] = {
      x1 = 58,
      x2 = 115,
      y1 = 114,
      y2 = 171
    },
    [__eClassType_Guardian] = {
      x1 = 115,
      x2 = 115,
      y1 = 171,
      y2 = 171
    },
    [__eClassType_Sage] = {
      x1 = 286,
      x2 = 286,
      y1 = 342,
      y2 = 342
    },
    [__eClassType_Corsair] = {
      x1 = 343,
      x2 = 286,
      y1 = 399,
      y2 = 342
    },
    [__eClassType_Warrior_Reserve2] = {
      x1 = 343,
      x2 = 286,
      y1 = 399,
      y2 = 342
    },
    [__eClassType_ElfRanger_Reserved1] = {
      x1 = 343,
      x2 = 286,
      y1 = 399,
      y2 = 342
    },
    [__eClassType_Drakania] = {
      x1 = 457,
      x2 = 172,
      y1 = 513,
      y2 = 228
    },
    [__eClassType_Giant_Reserved0] = {
      x1 = 457,
      x2 = 172,
      y1 = 513,
      y2 = 228
    },
    [__eClassType_Giant_Reserved2] = {
      x1 = 457,
      x2 = 172,
      y1 = 513,
      y2 = 228
    },
    [__eClassType_KunoichiOld] = {
      x1 = 457,
      x2 = 172,
      y1 = 513,
      y2 = 228
    }
  },
  _targetFunctionIndex = nil,
  _personalVolumeTargetUserNo = nil,
  _personalVolumeTargetIndex = nil,
  _isPadMode = false,
  _initialize = false
}
runLua("UI_Data/Script/Window/voiceChat/Panel_VoiceChat_List_New_1.lua")
runLua("UI_Data/Script/Window/voiceChat/Panel_VoiceChat_List_New_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_VoiceChat_List_New_Init")
function FromClient_VoiceChat_List_New_Init()
  PaGlobal_VoiceChat_List_New:initialize()
end
