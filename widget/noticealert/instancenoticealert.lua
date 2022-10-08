PaGlobal_ActionMessage_New = {
  _ui = {
    stc_originMsg = nil,
    txt_originMsg = nil,
    stc_ChangePhase = nil,
    txt_ChangePhase = nil
  },
  _eVALUE = {
    SUCCESS = 1,
    FAIL = 2,
    CHANGEPHASE = 3
  },
  _isConsole = false,
  _initialize = false,
  _maxNoticeCount = 3,
  _noticePanelList = {},
  _smallNoticeAlertList = {},
  _posIndex = 0,
  _copyPanelSizeX = 400,
  _copyPanelSizeY = 30,
  _currentTime = 0,
  _maxTime = 9
}
registerEvent("FromClient_luaLoadComplete", "FromClient_ActionMessage_New_Init")
registerEvent("FromClient_SuccesSummonMasterlessHorse", "FromClient_SuccesSummonMasterlessHorse")
function FromClient_ActionMessage_New_Init()
  PaGlobal_ActionMessage_New:initialize()
end
function FromClient_SuccesSummonMasterlessHorse()
  local msg = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HORSEWITHOUTOWNER_MSG_READY")
  PaGlobal_GlobalNak_Open(CppEnums.EChatNoticeType.MasterlessHorse, 0, msg)
end
function PaGlobal_ActionMessage_New:initialize()
  self._ui.stc_originMsg = UI.getChildControl(Panel_ActionMessage_New, "Static_Type1_Success")
  self._ui.txt_originBgSuccess = UI.getChildControl(self._ui.stc_originMsg, "Static_BG1_Success")
  self._ui.txt_originMsg = UI.getChildControl(self._ui.stc_originMsg, "MsgText")
  self._ui.stc_originMsg:SetShow(false)
  self._ui.txt_originBgSuccess:SetShow(false)
  self._ui.txt_originMsg:SetShow(false)
  self._ui.stc_ChangePhase = UI.getChildControl(Panel_ActionMessage_New, "Static_Type3_ChangePhase")
  self._ui.stc_ChangePhase:SetShow(false)
  self._ui.txt_ChangePhase = UI.getChildControl(self._ui.stc_ChangePhase, "MsgText")
  PaGlobal_ActionMessage_New:validate()
  PaGlobal_ActionMessage_New:registerEvent()
  PaGlobal_ActionMessage_New:createInstanceMsg()
  PaGlobal_ActionMessage_New_Resize()
end
function PaGlobal_ActionMessage_New:createInstanceMsg()
  local getScrX = getScreenSizeX()
  for index = 1, self._maxNoticeCount do
    local copiedBg = UI.cloneControl(self._ui.stc_originMsg, Panel_ActionMessage_New, "Static_CopiedInstanceMsg" .. index)
    copiedBg:SetShow(false)
    local bg = UI.getChildControl(copiedBg, "Static_BG1_Success")
    local stcTxt = UI.getChildControl(copiedBg, "MsgText")
    bg:SetShow(true)
    stcTxt:SetShow(true)
    local noticeAlert = {}
    noticeAlert._mainBg = copiedBg
    noticeAlert._bg = bg
    noticeAlert._txtMsg = stcTxt
    self._smallNoticeAlertList[index] = noticeAlert
  end
end
function PaGlobal_ActionMessage_New:validate()
  self._ui.stc_originMsg:isValidate()
  self._ui.txt_originMsg:isValidate()
  self._ui.stc_ChangePhase:isValidate()
  self._ui.txt_ChangePhase:isValidate()
end
function PaGlobal_ActionMessage_New:registerEvent()
  registerEvent("onScreenResize", "PaGlobal_ActionMessage_New_Resize")
end
function PaGlobal_ActionMessage_New:open()
  Panel_ActionMessage_New:SetShow(true)
end
function PaGlobal_ActionMessage_New:close()
  Panel_ActionMessage_New:SetShow(false)
end
function PaGlobal_ActionMessage_New:showByValue(value, message)
  if nil == value or 0 == value or nil == message or "" == message then
    return
  end
  local control
  if self._eVALUE.CHANGEPHASE == value then
    self._ui.txt_ChangePhase:SetText(message)
    control = self._ui.stc_ChangePhase
  else
    self._posIndex = self._posIndex % self._maxNoticeCount + 1
    self._smallNoticeAlertList[self._posIndex]._txtMsg:SetText(message)
    local bg = self._smallNoticeAlertList[self._posIndex]._bg
    bg:ChangeTextureInfoName("Combine/Etc/Combine_Etc_Boss_Gimmik.dds")
    if self._eVALUE.SUCCESS == value then
      local x1, y1, x2, y2 = setTextureUV_Func(bg, 1, 1, 802, 70)
      bg:getBaseTexture():setUV(x1, y1, x2, y2)
      bg:setRenderTexture(bg:getBaseTexture())
    elseif self._eVALUE.FAIL == value then
      local x1, y1, x2, y2 = setTextureUV_Func(bg, 1, 71, 802, 140)
      bg:getBaseTexture():setUV(x1, y1, x2, y2)
      bg:setRenderTexture(bg:getBaseTexture())
    else
      return
    end
    control = self._smallNoticeAlertList[self._posIndex]._mainBg
  end
  if nil == control then
    return
  end
  PaGlobal_ActionMessage_New_OpenWithAlphaAniIncludeChild(control)
  if self._eVALUE.CHANGEPHASE ~= value then
    PaGlobal_ActionMessage_New:updatePositionCreatedPanel()
  end
end
function PaGlobal_ActionMessage_New:updatePositionCreatedPanel()
  for index = 1, self._maxNoticeCount do
    local realIndex = (index - self._posIndex + 5) % self._maxNoticeCount + 1
    local control = self._smallNoticeAlertList[index]._mainBg
    if nil ~= control and true == control:GetShow() then
      control:SetPosY(self._ui.stc_originMsg:GetPosY() + self._ui.stc_originMsg:GetSizeY() * realIndex + 5)
    end
  end
end
function PaGlobal_ActionMessage_New_Open(value, msg)
  PaGlobal_ActionMessage_New:showByValue(value, msg)
  if PaGlobal_ActionMessage_New._currentTime <= 0 then
    Panel_ActionMessage_New:RegisterUpdateFunc("PaGlobalFunc_InstanceNoticeAlert_UpdatePerFrame")
  else
    PaGlobal_ActionMessage_New._currentTime = 0
  end
  PaGlobal_ActionMessage_New:open()
end
function PaGlobal_ActionMessage_New_Resize()
  if nil == Panel_ActionMessage_New or false == Panel_ActionMessage_New:GetShow() then
    return
  end
  Panel_ActionMessage_New:SetSize(getOriginScreenSizeX(), getOriginScreenSizeY())
  Panel_ActionMessage_New:ComputePos()
  PaGlobal_ActionMessage_New:updatePositionCreatedPanel()
end
function PaGlobal_ActionMessage_New_OpenWithAlphaAniIncludeChild(control)
  if nil == control then
    return
  end
  local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
  local UI_color = Defines.Color
  audioPostEvent_SystemUi(4, 4)
  _AudioPostEvent_SystemUiForXBOX(4, 4)
  control:SetShow(true)
  control:ResetVertexAni()
  control:SetScaleChild(1, 1)
  local aniInfo = control:addColorAnimation(0, 0,35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo1 = control:addScaleAnimation(0, 0,35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartScale(0,85)
  aniInfo1:SetEndScale(1)
  aniInfo1.IsChangeChild = true
  local aniInfo2 = control:addScaleAnimation(0,25, 7, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.IsChangeChild = true
  local aniInfo3 = control:addColorAnimation(7, 8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo4 = control:addScaleAnimation(8, 8,25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo4:SetStartScale(1)
  aniInfo4:SetEndScale(0)
  aniInfo4.IsChangeChild = true
end
function PaGlobalFunc_InstanceNoticeAlert_UpdatePerFrame(deltaTime)
  if false == Panel_ActionMessage_New:GetShow() then
    return
  end
  PaGlobal_ActionMessage_New._currentTime = PaGlobal_ActionMessage_New._currentTime + deltaTime
  if PaGlobal_ActionMessage_New._maxTime <= PaGlobal_ActionMessage_New._currentTime then
    Panel_ActionMessage_New:ClearUpdateLuaFunc()
    PaGlobal_ActionMessage_New._currentTime = 0
    PaGlobal_ActionMessage_New:close()
  end
end
PaGlobal_GlobalNak = {
  _nakInfoList = {}
}
registerEvent("FromClient_luaLoadComplete", "FromClient_GlobalNak_Init")
function FromClient_GlobalNak_Init()
  PaGlobal_GlobalNak:initialize()
end
function PaGlobal_GlobalNak:initialize()
  if true == _ContentsGroup_SnowAntLabyrinth then
    local stc_bg = UI.getChildControl(Panel_NakMessage_Erether_All, "Static_Desc_BG")
    local AntLabyrinthInfo = {}
    AntLabyrinthInfo._updateEvent = "PaGlobalFunc_GlobalNak_Erether_UpdatePerFrame"
    AntLabyrinthInfo._panel = Panel_NakMessage_Erether_All
    AntLabyrinthInfo._value = nil
    AntLabyrinthInfo._message = nil
    AntLabyrinthInfo._currentTime = 0
    AntLabyrinthInfo._sutTitle = UI.getChildControl(stc_bg, "StaticText_Desc_2")
    AntLabyrinthInfo._text = UI.getChildControl(stc_bg, "MultilineText_Desc_3")
    AntLabyrinthInfo._maxTime = PaGlobal_ActionMessage_New._maxTime
    self._nakInfoList[CppEnums.EChatNoticeType.SnowAntLabyrinth] = AntLabyrinthInfo
  end
  if _ContentsGroup_MasterlessHorse == true then
    local masterlessHorseNakInfo = {}
    masterlessHorseNakInfo._updateEvent = "PaGlobalFunc_GlobalNak_MasterlessHorse_UpdatePerFrame"
    masterlessHorseNakInfo._panel = Panel_Widget_NakMessageChoice_All
    masterlessHorseNakInfo._value = nil
    masterlessHorseNakInfo._message = nil
    masterlessHorseNakInfo._currentTime = 0
    masterlessHorseNakInfo._bg = UI.getChildControl(Panel_Widget_NakMessageChoice_All, "Static_NakMessage_4")
    masterlessHorseNakInfo._maxTime = 3
    self._nakInfoList[CppEnums.EChatNoticeType.MasterlessHorse] = masterlessHorseNakInfo
  else
    local masterlessNakControl = UI.getChildControl(Panel_Widget_NakMessageChoice_All, "Static_NakMessage_4")
    if masterlessNakControl ~= nil then
      masterlessNakControl:SetShow(false)
    end
  end
  local ActionNakInfo = {}
  ActionNakInfo._updateEvent = "PaGlobalFunc_GlobalNak_Action_UpdatePerFrame"
  ActionNakInfo._panel = Panel_Widget_NakMessageChoice_All
  ActionNakInfo._value = nil
  ActionNakInfo._message = nil
  ActionNakInfo._currentTime = 0
  local nakBGList
  ActionNakInfo.bgList = Array.new()
  ActionNakInfo.bgList[0] = UI.getChildControl(Panel_Widget_NakMessageChoice_All, "Static_NakMessage_1")
  ActionNakInfo.bgList[1] = UI.getChildControl(Panel_Widget_NakMessageChoice_All, "Static_NakMessage_2")
  ActionNakInfo.bgList[2] = UI.getChildControl(Panel_Widget_NakMessageChoice_All, "Static_NakMessage_3")
  ActionNakInfo._maxCount = 3
  ActionNakInfo._nextIndex = 0
  ActionNakInfo._maxTime = PaGlobal_ActionMessage_New._maxTime
  self._nakInfoList[CppEnums.EChatNoticeType.ActionNakAll] = ActionNakInfo
  registerEvent("onScreenResize", "PaGlobal_GlobalNak_Resize")
end
function PaGlobal_GlobalNak:startSetting(notiType)
  if notiType == CppEnums.EChatNoticeType.SnowAntLabyrinth then
    PaGlobalFunc_GlobalNak_Erether_StartSetting()
  elseif notiType == CppEnums.EChatNoticeType.ActionNakAll then
    PaGlobalFunc_GlobalNak_Action_StartSetting()
  elseif notiType == CppEnums.EChatNoticeType.MasterlessHorse then
    PaGlobalFunc_GlobalNak_MasterLessHorse_StartSetting()
  end
end
function PaGlobal_GlobalNak:prepareOpen(notiType, value, msg)
  if nil == self._nakInfoList[notiType] then
    return false
  end
  self._nakInfoList[notiType]._value = value
  self._nakInfoList[notiType]._message = msg
  self._nakInfoList[notiType]._panel:SetShow(true)
  self._nakInfoList[notiType]._panel:RegisterUpdateFunc(self._nakInfoList[notiType]._updateEvent)
  self:startSetting(notiType)
  return true
end
function PaGlobal_GlobalNak_Resize()
  if true == _ContentsGroup_SnowAntLabyrinth then
    Panel_NakMessage_Erether_All:SetSize(getOriginScreenSizeX(), getOriginScreenSizeY())
    Panel_NakMessage_Erether_All:ComputePosAllChild()
  end
end
function PaGlobal_GlobalNak_Open(type, value, msg)
  return PaGlobal_GlobalNak:prepareOpen(type, value, msg)
end
function PaGlobal_GlobalNak_OpenWithAlphaAniIncludeChild(control)
  if nil == control then
    return
  end
  local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
  local UI_color = Defines.Color
  audioPostEvent_SystemUi(4, 4)
  _AudioPostEvent_SystemUiForXBOX(4, 4)
  control:SetShow(true)
  control:ResetVertexAni()
  control:SetScaleChild(1, 1)
  local aniInfo = control:addColorAnimation(0, 0,35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo3 = control:addColorAnimation(7, 8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
end
function PaGlobalFunc_GlobalNak_UpdatePerFrame(type, deltaTime)
  if nil == PaGlobal_GlobalNak._nakInfoList[type] then
    return
  end
  local masterlessNakControl = PaGlobal_GlobalNak._nakInfoList[CppEnums.EChatNoticeType.MasterlessHorse]
  if masterlessNakControl ~= nil and masterlessNakControl._bg ~= nil then
    local isMasterlessHorseNak = type == CppEnums.EChatNoticeType.MasterlessHorse
    masterlessNakControl._bg:SetShow(isMasterlessHorseNak)
  end
  PaGlobal_GlobalNak._nakInfoList[type]._currentTime = PaGlobal_GlobalNak._nakInfoList[type]._currentTime + deltaTime
  if PaGlobal_GlobalNak._nakInfoList[type]._maxTime <= PaGlobal_GlobalNak._nakInfoList[type]._currentTime then
    PaGlobal_GlobalNak._nakInfoList[type]._panel:SetShow(false)
    PaGlobal_GlobalNak._nakInfoList[type]._panel:ClearUpdateLuaFunc()
    PaGlobal_GlobalNak._nakInfoList[type]._currentTime = 0
    PaGlobal_GlobalNak._nakInfoList[notiType]._value = nil
    PaGlobal_GlobalNak._nakInfoList[notiType]._message = nil
  end
end
function PaGlobalFunc_GlobalNak_Erether_UpdatePerFrame(deltaTime)
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.SnowAntLabyrinth
  PaGlobalFunc_GlobalNak_UpdatePerFrame(notiType, deltaTime)
end
function PaGlobalFunc_GlobalNak_Erether_StartSetting()
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.SnowAntLabyrinth
  self._nakInfoList[notiType]._sutTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ERETHEA_NAK_SUBTITLE_" .. self._nakInfoList[notiType]._value))
  self._nakInfoList[notiType]._text:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ERETHEA_NAK_DESC_" .. self._nakInfoList[notiType]._value))
  PaGlobal_GlobalNak_OpenWithAlphaAniIncludeChild(self._nakInfoList[notiType]._panel)
end
function PaGlobalFunc_GlobalNak_Action_UpdatePerFrame(deltaTime)
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.ActionNakAll
  PaGlobalFunc_GlobalNak_UpdatePerFrame(notiType, deltaTime)
end
function PaGlobalFunc_GlobalNak_MasterlessHorse_UpdatePerFrame(deltaTime)
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.MasterlessHorse
  PaGlobalFunc_GlobalNak_UpdatePerFrame(notiType, deltaTime)
end
function PaGlobalFunc_GlobalNak_Action_StartSetting()
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.ActionNakAll
  local stc_bg = self._nakInfoList[notiType].bgList[self._nakInfoList[notiType]._nextIndex]
  local txt_message = UI.getChildControl(stc_bg, "StaticText_MSG")
  stc_bg:SetSpanSize(0, 0)
  local sizeY = stc_bg:GetSizeY()
  local gap = 10
  for ii = 1, self._nakInfoList[notiType]._maxCount - 1 do
    local nextIndex = (self._nakInfoList[notiType]._nextIndex + ii) % self._nakInfoList[notiType]._maxCount
    local otherBG = self._nakInfoList[notiType].bgList[nextIndex]
    if true == otherBG:GetShow() then
      otherBG:SetSpanSize(0, otherBG:GetSpanSize().y + sizeY + gap)
    end
  end
  stc_bg:ChangeTextureInfoName("combine/frame/combine_frame_message.dds")
  local uvY1 = sizeY * self._nakInfoList[notiType]._value + 1
  local uvY2 = uvY1 + sizeY
  local x1, y1, x2, y2 = setTextureUV_Func(stc_bg, 1, uvY1, stc_bg:GetSizeX() + 1, uvY2)
  stc_bg:getBaseTexture():setUV(x1, y1, x2, y2)
  stc_bg:setRenderTexture(stc_bg:getBaseTexture())
  txt_message:SetText(self._nakInfoList[notiType]._message)
  PaGlobal_GlobalNak_OpenWithAlphaAniIncludeChild(stc_bg)
  self._nakInfoList[notiType]._currentTime = 0
  self._nakInfoList[notiType]._nextIndex = (self._nakInfoList[notiType]._nextIndex + 1) % self._nakInfoList[notiType]._maxCount
  self._nakInfoList[notiType]._value = nil
  self._nakInfoList[notiType]._message = nil
  Panel_Widget_NakMessageChoice_All:ComputePosAllChild()
end
function PaGlobalFunc_GlobalNak_MasterLessHorse_StartSetting()
  local self = PaGlobal_GlobalNak
  local notiType = CppEnums.EChatNoticeType.MasterlessHorse
  local stc_bg = self._nakInfoList[notiType]._bg
  local txt_message = UI.getChildControl(stc_bg, "StaticText_MSG")
  stc_bg:SetSpanSize(0, 0)
  local sizeY = stc_bg:GetSizeY()
  local gap = 10
  txt_message:SetText(self._nakInfoList[notiType]._message)
  PaGlobal_GlobalNak_OpenWithAlphaAniIncludeChild(stc_bg)
  self._nakInfoList[notiType]._currentTime = 0
  self._nakInfoList[notiType]._value = nil
  self._nakInfoList[notiType]._message = nil
  Panel_Widget_NakMessageChoice_All:ComputePosAllChild()
end
