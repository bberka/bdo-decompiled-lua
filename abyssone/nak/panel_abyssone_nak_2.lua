function PaGlobalFunc_AbyssOneNak_Open(noticeType, noticeValue, message)
  local self = PaGlobal_AbyssOneNak
  if self == nil then
    return
  end
  self:prepareOpen(noticeType, noticeValue, message)
end
function PaGlobalFunc_AbyssOneNak_Update(deltaTime)
  local self = PaGlobal_AbyssOneNak
  if self == nil then
    return
  end
  local type = CppEnums.EChatNoticeType.AbyssOneNak
  self._nakInfoList[type]._currentTime = self._nakInfoList[type]._currentTime + deltaTime
  if self._nakInfoList[type]._maxTime <= self._nakInfoList[type]._currentTime then
    self:prepareClose(type)
  end
end
function FromClient_NoticeAlert_Ack(message, noticeType, noticeValue)
  local self = PaGlobal_AbyssOneNak
  if self == nil then
    return
  end
  PaGlobalFunc_AbyssOneNak_Open(noticeType, noticeValue, message)
end
