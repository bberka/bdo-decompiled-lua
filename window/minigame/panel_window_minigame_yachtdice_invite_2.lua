function PaGlobalFunc_MiniGameYacht_Invite_Open()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  if Window_YachtDice_Invite_OpenMode.InviteMode == self._currentOpenMode then
    self:prepareOpen()
  elseif Window_YachtDice_Invite_OpenMode.AcceptMode == self._currentOpenMode then
    PaGlobalFunc_MiniGameYacht_Notice_Open(nil, nil, nil, true)
  else
    _PA_ASSERT(false, "ì•¼ë¥´ InvitePanelì˜ OpenModeê°€ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    self:prepareOpen()
  end
end
function PaGlobalFunc_MiniGameYacht_Invite_Close()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self:prepareClose()
end
function PaGlobal_YachtDice_Invite_SetChangeMode_AcceptMode()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  local doShow = false
  if true == Panel_Window_MiniGame_YachtDice_PVP_Invite:GetShow() then
    PaGlobalFunc_MiniGameYacht_Invite_Close()
    doShow = true
  end
  self._currentOpenMode = Window_YachtDice_Invite_OpenMode.AcceptMode
  if true == doShow then
    PaGlobalFunc_MiniGameYacht_Invite_Open()
  end
end
function PaGlobal_YachtDice_Invite_SetChangeMode_InviteMode()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self._currentOpenMode = Window_YachtDice_Invite_OpenMode.InviteMode
end
function PaGlobalFunc_MiniGameYacht_Invite_CreateListContent(content, key)
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self:createListContent(content, key)
end
function PaGlobalFunc_MiniGameYacht_Invite_OnClickedRadioButton(keyRaw)
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self:setSelectedGameBoardKey(keyRaw)
end
function PaGlobalFunc_MiniGameYacht_Invite_OnClickedInviteButton()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  local targetNickName = self._ui._edt_searchText:GetEditText()
  local selectedGameBoardKey = self._selectedGameBoardKey
  if nil == selectedGameBoardKey then
    selectedGameBoardKey = YachtGameBoardKey(0)
  end
  ToClient_requestInviteMiniGameYachtDiceToPlayer(targetNickName, selectedGameBoardKey)
end
function PaGlobalFunc_MiniGameYacht_Invite_OnClickedEditBox()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self:onClickedEditBox()
end
function PaGlobalFunc_MiniGameYacht_Invite_MoveScroll(value)
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  if nil == self._ui._lst_handRankList then
    return
  end
  if 1 == value then
    self._ui._lst_handRankList:MouseUpScroll(self._ui._lst_handRankList)
  elseif -1 == value then
    self._ui._lst_handRankList:MouseDownScroll(self._ui._lst_handRankList)
  end
end
function PaGlobalFunc_MiniGameYacht_Invite_Update(deltaTime)
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  local self = PaGlobal_YachtDice_Invite
  if nil == self then
    return
  end
  self:update(deltaTime)
end
function FromClient_SuccessInviteYatchDiceGame()
  if nil == Panel_Window_MiniGame_YachtDice_PVP_Invite then
    return
  end
  PaGlobalFunc_MiniGameYacht_Invite_Close()
end
