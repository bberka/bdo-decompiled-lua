function PaGlobalFunc_AutoChess_CardSetComplete()
  ToClient_AutoChess_CardSetComplete()
end
function PaGlobalFunc_AutoChess_SummonComplete()
  ToClient_AutoChess_SummonComplete()
end
function PaGlobalFunc_FromClient_AutoChessGameEnd()
  local self = PaGlobal_AutoChess_Main
  PaGlobal_AutoChess_Main:prepareClose()
end
function PaGlobalFunc_AutoChess_GameEnd()
  ToClient_AutoChess_GameEnd()
end
function PaGlobalFunc_AutoChess_Summon(index)
  local self = PaGlobal_AutoChess_Main
  if nil == self._battleCardList[index] then
    return
  end
  local isDead = self._battleCardList[index]._isDead
  if true == isDead then
    Proc_ShowMessage_Ack("ì´ë¯¸ ì£½ì€ ì¹´ë“œ ì…ë‹ˆë‹¤.")
    return
  end
  local cardKey = self._battleCardList[index]._cardKey
  ToClient_AutoChess_Summon(cardKey)
end
function PaGlobalFunc_AutoChess_CardSet(index)
  local self = PaGlobal_AutoChess_Main
  if nil == self._deckList[index] then
    return
  end
  local cardKey = self._deckList[index]._cardKey
  ToClient_AutoChess_CardSet(cardKey)
end
function HandleEventLUp_AutoChess_updateAppleList()
  if nil == Panel_Widnow_AutoChess_Main then
    return
  end
end
function FromClient_AutoChess_updateAppleList(param1)
  if nil == Panel_Widnow_AutoChess_Main then
    return
  end
end
function PaGloabl_AutoChess_ShowAni()
  if nil == Panel_Widnow_AutoChess_Main then
    return
  end
end
function PaGloabl_AutoChess_HideAni()
  if nil == Panel_Widnow_AutoChess_Main then
    return
  end
end
