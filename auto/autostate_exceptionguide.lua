AutoState_ExceptionGuide = {
  _state = AutoStateType.DEAD,
  _targetQuestList = {
    {652, 2},
    {655, 5},
    {652, 8},
    {653, 6},
    {653, 7},
    {657, 2},
    {658, 2},
    {658, 3}
  },
  _targetQuestListNoHunt = {
    {652, 3}
  },
  _uiQuestInfo = nil
}
function AutoState_ExceptionGuide:init()
  self._uiQuestInfo = nil
end
function AutoState_ExceptionGuide:start()
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo == nil or false == self:checkException(uiQuestInfo:getQuestNo()._group, uiQuestInfo:getQuestNo()._quest) then
    _PA_LOG("ê¹€ê·œë³´", "AutoState_ExceptionGuideì— ë“±ë¡ë˜ì§€ ì•Šì€ í€˜ìŠ¤íŠ¸ëŠ” ì‹¤í–‰í•  ìˆ˜ ì—†ë‹¤   " .. tostring(uiQuestInfo:getQuestNo()._group) .. "    " .. tostring(uiQuestInfo:getQuestNo()._quest))
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return
  end
  self._uiQuestInfo = uiQuestInfo
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_EXCEPTIONGUIDE_" .. tostring(uiQuestInfo:getQuestNo()._group) .. "_" .. tostring(uiQuestInfo:getQuestNo()._quest) .. "_2"))
end
function AutoState_ExceptionGuide:update(deltaTime)
  if true == self._uiQuestInfo:isSatisfied() then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return
  end
  if true == Auto_FindNearQuestMonster() then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return
  end
  if 0 ~= Auto_IsPlayerInsideQuestArea(self._uiQuestInfo) then
    Auto_TransferState(AutoStateType.WAIT_FOR_PRESSBUTTON)
    return
  end
end
function AutoState_ExceptionGuide:endProc()
  self._uiQuestInfo = nil
end
function AutoState_ExceptionGuide:checkException(groupNo, questNo)
  for _, tempQuest in pairs(self._targetQuestList) do
    if tempQuest[1] == groupNo and tempQuest[2] == questNo then
      return true
    end
  end
  return false
end
function AutoState_ExceptionGuide:noHunt(groupNo, questNo)
  for _, tempQuest in pairs(self._targetQuestListNoHunt) do
    if tempQuest[1] == groupNo and tempQuest[2] == questNo then
      return true
    end
  end
  return false
end
