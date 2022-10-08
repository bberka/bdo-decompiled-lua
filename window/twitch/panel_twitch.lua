Panel_Twitch:SetShow(false)
PaGlobal_Twitch = {
  _ui = {
    _btnClose = UI.getChildControl(Panel_Twitch, "Button_Win_Close"),
    _checkPopUp = UI.getChildControl(Panel_Twitch, "CheckButton_PopUp")
  },
  isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
}
function PaGlobal_Twitch:Init()
  self._ui._btnClose:addInputEvent("Mouse_LUp", "PaGlobal_Twitch:CloseWindow()")
  self._ui._checkPopUp:SetShow(false)
end
function PaGlobal_Twitch:ShowWindow()
  Panel_Twitch:SetShow(false)
  Panel_Twitch:SetPosX(getScreenSizeX() / 2 - Panel_Twitch:GetSizeX() / 2)
  Panel_Twitch:SetPosY(getScreenSizeY() / 2 - Panel_Twitch:GetSizeY() / 2)
  local twitchUrlReturn = PaGlobal_Twitch:TwitchUrlReturn()
  if nil ~= twitchUrlReturn then
    ToClient_OpenChargeWebPage(twitchUrlReturn, false)
  end
end
function PaGlobal_Twitch:CloseWindow()
  Panel_Twitch:SetShow(false, false)
end
function PaGlobal_Twitch:TwitchUrlReturn()
  local isNationType = "kr"
  if isGameTypeKorea() then
    isNationType = "kr"
  elseif isGameTypeJapan() then
    isNationType = "jp"
  elseif isGameTypeRussia() then
    isNationType = "ru"
  elseif isGameTypeEnglish() then
    if CppEnums.ServiceResourceType.eServiceResourceType_EN == ToClient_getResourceType() then
      isNationType = "en"
    elseif CppEnums.ServiceResourceType.eServiceResourceType_FR == ToClient_getResourceType() then
      isNationType = "fr"
    elseif CppEnums.ServiceResourceType.eServiceResourceType_DE == ToClient_getResourceType() then
      isNationType = "de"
    else
      isNationType = "en"
    end
  elseif isGameTypeTaiwan() then
    isNationType = "tw"
  elseif isGameTypeSA() then
    if CppEnums.ServiceResourceType.eServiceResourceType_ES == ToClient_getResourceType() then
      isNationType = "es"
    elseif CppEnums.ServiceResourceType.eServiceResourceType_PT == ToClient_getResourceType() then
      isNationType = "pt"
    else
      isNationType = "pt"
    end
  elseif isGameTypeTR() then
    isNationType = "tr"
  elseif isGameTypeTH() then
    isNationType = "th"
  elseif isGameTypeID() then
    isNationType = "id"
  else
    _PA_LOG("ì •íƒœê³¤", "ìƒˆë¡œìš´ êµ­ê°€ íƒ€ì…ì´ ì¶”ê°€ë˜ì—ˆìœ¼ë‹ˆ ì´ ë¡œê·¸ë¥¼ ë°œê²¬í•˜ë©´ í•´ë‹¹ ë‹´ë‹¹ìì—ê²Œ ì•Œë ¤ì£¼ì„¸ìš” ê¼­!!!")
    isNationType = "kr"
  end
  local url
  if isUseTotalAccount() == true and isGameTypeID() == false then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_TWITCH_NEW_DOMAIN_LINK")
  else
    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TWITCH_DOMAIN_LINK", "nation", isNationType)
  end
  return url
end
PaGlobal_Twitch:Init()
