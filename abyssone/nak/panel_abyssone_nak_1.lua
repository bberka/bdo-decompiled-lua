function PaGlobal_AbyssOneNak:initialize()
  if self._initialize == true then
    return
  end
  self:initNakInfoList()
  self:registEventHandler()
  self:validate()
  self._initialize = true
end
function PaGlobal_AbyssOneNak:initNakInfoList()
  if Panel_AbyssOne_Nak == nil then
    return
  end
  self._nakInfoList = Array.new()
  local AbyssOneNakInfo = {}
  AbyssOneNakInfo._updateEvent = "PaGlobalFunc_AbyssOneNak_Update"
  AbyssOneNakInfo._panel = Panel_AbyssOne_Nak
  AbyssOneNakInfo._value = nil
  AbyssOneNakInfo._message = nil
  AbyssOneNakInfo._bg = UI.getChildControl(Panel_AbyssOne_Nak, "Static_NakMessage_1")
  AbyssOneNakInfo._currentTime = 0
  AbyssOneNakInfo._maxTime = 9
  self._nakInfoList[CppEnums.EChatNoticeType.AbyssOneNak] = AbyssOneNakInfo
end
function PaGlobal_AbyssOneNak:registEventHandler()
  if Panel_AbyssOne_Nak == nil then
    return
  end
  registerEvent("EventNotifyAlertMessage", "FromClient_NoticeAlert_Ack")
end
function PaGlobal_AbyssOneNak:validate()
  if Panel_AbyssOne_Nak == nil then
    return
  end
end
function PaGlobal_AbyssOneNak:prepareOpen(noticeType, noticeValue, message)
  if Panel_AbyssOne_Nak == nil then
    return
  end
  if self._nakInfoList[noticeType] == nil then
    return
  end
  self._nakInfoList[noticeType]._value = noticeValue
  self._nakInfoList[noticeType]._message = message
  self._nakInfoList[noticeType]._panel:SetShow(true)
  self._nakInfoList[noticeType]._panel:RegisterUpdateFunc(self._nakInfoList[noticeType]._updateEvent)
  self:startSetting(noticeType)
end
function PaGlobal_AbyssOneNak:prepareClose(noticeType)
  if Panel_AbyssOne_Nak == nil then
    return
  end
  self._nakInfoList[noticeType]._value = nil
  self._nakInfoList[noticeType]._message = nil
  self._nakInfoList[noticeType]._panel:SetShow(false)
  self._nakInfoList[noticeType]._panel:ClearUpdateLuaFunc()
  self._nakInfoList[noticeType]._currentTime = 0
end
function PaGlobal_AbyssOneNak:startSetting(noticeType)
  if Panel_AbyssOne_Nak == nil then
    return
  end
  if noticeType == CppEnums.EChatNoticeType.AbyssOneNak then
    self:setNak_AbyssOne()
  end
end
function PaGlobal_AbyssOneNak:setNak_AbyssOne()
  if Panel_AbyssOne_Nak == nil then
    return
  end
  local noticeType = CppEnums.EChatNoticeType.AbyssOneNak
  local stc_bg = self._nakInfoList[noticeType]._bg
  local txt_message = UI.getChildControl(stc_bg, "StaticText_MSG")
  txt_message:SetText(self._nakInfoList[noticeType]._message)
  local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
  local UI_color = Defines.Color
  audioPostEvent_SystemUi(4, 4)
  _AudioPostEvent_SystemUiForXBOX(4, 4)
  stc_bg:SetShow(true)
  stc_bg:ResetVertexAni()
  stc_bg:SetScaleChild(1, 1)
  local aniInfo = stc_bg:addColorAnimation(0, 0,35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo3 = stc_bg:addColorAnimation(7, 8, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  self._nakInfoList[noticeType]._currentTime = 0
  self._nakInfoList[noticeType]._value = nil
  self._nakInfoList[noticeType]._message = nil
  self._nakInfoList[noticeType]._panel:ComputePosAllChild()
end
