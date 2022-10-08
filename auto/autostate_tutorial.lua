AutoState_Tutorial = {
  _state = AutoStateType.TUTORIAL,
  _curMsgIndex = 0
}
function AutoState_Tutorial:init()
end
function AutoState_Tutorial:start()
  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = AutoState_Tutorial_AccessBlackSpiritclick
  self._curMsgIndex = 0
  AutoState_Tutorial_AccessBlackSpiritclick()
end
function AutoState_Tutorial:update(deltaTime)
end
function AutoState_Tutorial:endProc()
  PaGlobal_AutoQuestMsg._accessBlackSpiritClick = nil
  self._curMsgIndex = 0
end
function AutoState_Tutorial_AccessBlackSpiritclick()
  local self = AutoState_Tutorial
  if 0 == self._curMsgIndex then
    FGlobal_AutoQuestBlackSpiritMessage("[TEST] íŠœí† ë¦¬ì–¼ ì‹œì‘. ë²„íŠ¼ ëˆ„ë¥´ë©´ ë‹¤ìŒ ë©”ì„¸ì§€ ë‚˜ì˜µë‹ˆë‹¤. ")
  elseif 1 == self._curMsgIndex then
    FGlobal_AutoQuestBlackSpiritMessage("[TEST] íŠœí† ë¦¬ì–¼ ì„¤ëª…, ...ë¶ˆë¼ë¶ˆë¼....")
  elseif 2 == self._curMsgIndex then
    FGlobal_AutoQuestBlackSpiritMessage("[TEST] íŠœí† ë¦¬ì–¼ ì„¤ëª… ë í•œë²ˆë” ë²„íŠ¼ ëˆ„ë¥´ë©´ ì§„í–‰ í•  êº¼ì—ìš”. ")
  else
    Auto_TransferState(AutoStateType.EXCEPTION_GUIDE)
    return
  end
  self._curMsgIndex = self._curMsgIndex + 1
end
