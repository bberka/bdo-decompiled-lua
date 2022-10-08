function PaGlobal_QuickTimeEvent_Manager_UpdatePerFrame(delta)
  if nil == PaGlobal_QuickTimeEvent_Manager then
    return
  end
  PaGlobal_QuickTimeEvent_Manager:UpdatePerFrame(delta)
end
function FromClient_OpenSequenceQuickTimeEvent(uiType)
  if nil == PaGlobal_QuickTimeEvent_Manager then
    return
  end
  if uiType >= PaGlobal_QuickTimeEvent_Manager.UITYPE.TYPE_NONE then
    _PA_ASSERT(false, "ë“±ë¡ë˜ì§€ ì•Šì€ í€µíƒ€ì„ ì´ë²¤íŠ¸ UIì…ë‹ˆë‹¤. ë“±ë¡í•´ì£¼ì„¸ìš”")
    return
  end
  PaGlobal_QuickTimeEvent_Manager._currentUIType = uiType
  PaGlobal_QuickTimeEvent_Manager:prepareOpen()
end
function FromClient_StartSequenceQuickTimeEvent()
  if nil == PaGlobal_QuickTimeEvent_Manager then
    return
  end
  PaGlobal_QuickTimeEvent_Manager:StartQuickTimeEvent()
end
function FromClient_CloseSequenceQuickTimeEvent()
  if nil == PaGlobal_QuickTimeEvent_Manager then
    return
  end
  PaGlobal_QuickTimeEvent_Manager:prepareClose()
end
function FromClient_PushSequenceQuickTimeEventKeyEvent(keyEventType, keyCode, startTime, minTime, maxTime, posX, posY, count)
  if nil == PaGlobal_QuickTimeEvent_Manager then
    return
  end
  PaGlobal_QuickTimeEvent_Manager:PushKeyEvent(keyEventType, keyCode, startTime, minTime, maxTime, posX, posY, count)
end
