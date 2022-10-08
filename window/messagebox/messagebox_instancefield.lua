registerEvent("FromClient_enterToInstanceFieldNotifyMessage", "FromClient_enterToInstanceFieldNotifyMessage")
function FromClient_enterToInstanceFieldNotifyMessage(contentsType, mapKey)
  local function funcYes()
    ToClient_requestJoinInstanceCheckEnterOption(contentsType, mapKey)
  end
  local txt_desc = ToClient_getEnterDescToInstanceField(mapKey)
  local messageBoxData = {
    content = txt_desc,
    functionYes = funcYes,
    functionNo = MessageBox_Empty_function,
    exitButton = true,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
