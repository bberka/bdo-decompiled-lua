function PaGlobal_CutSceneScript:initialize()
  self._renderMode = RenderModeWrapper.new(100, {
    Defines.RenderMode.eRenderMode_GroupCamera
  }, false)
  self._renderMode:setClosefunctor(self._renderMode, PaGlobalFunc_CutSceneScript_Awake)
  self._ui._txt_desc = UI.getChildControl(self._ui._stc_textArea, "MultilineText_1")
  self._ui._pg_keyPressTime = UI.getChildControl(self._ui._stc_keyPress, "CircularProgress_Press")
  self._ui._pg_keyPressTime:SetSmoothMode(true)
  self._ui._stc_Rkey_pc = UI.getChildControl(self._ui._stc_keyPress, "Static_InteractionKey_R")
  self._ui._stc_Rkey_console = UI.getChildControl(self._ui._stc_keyPress, "Static_InteractionKey")
  self._ui._stc_ESCkey_pc = UI.getChildControl(self._ui._stc_keyPress, "Static_InteractionKey_ESC")
  self._ui._stc_ESCkey_console = UI.getChildControl(self._ui._stc_keyPress, "Static_ConsoleMenuKey")
  if true == _ContentsGroup_UsePadSnapping then
    self._ui._stc_Rkey_pc:SetShow(false)
    self._ui._stc_Rkey_console:SetShow(true)
    self._ui._stc_ESCkey_pc:SetShow(false)
    self._ui._stc_ESCkey_console:SetShow(false)
  else
    self._ui._stc_Rkey_pc:SetShow(true)
    self._ui._stc_Rkey_console:SetShow(false)
    self._ui._stc_ESCkey_pc:SetShow(false)
    self._ui._stc_ESCkey_console:SetShow(false)
  end
  self:validate()
  self:registerEvent()
  self:resizePanel()
  Panel_Window_CutSceneScript:SetFadeOverRender()
  Panel_Window_CutSceneSkip:ignorePadSnapMoveToOtherPanel()
  self._initialize = true
end
function PaGlobal_CutSceneScript:clear()
  self._tickCount = getTickCount32()
  self._scriptCurrentIdx = 0
  self._scriptMaxCount = 0
  self._ui._txt_desc:SetText("")
  self._ui._stc_skipAnno:SetShow(false)
  self._ui._stc_cancleAnno:SetShow(false)
  self._ui._stc_keyPress:SetShow(false)
  self._currentSkipState = self._skipState.Press_Any_Key
  self._ui._pg_keyPressTime:SetCurrentControlPos(0)
  self._keyPressTime = 0
end
function PaGlobal_CutSceneScript:prepareOpen()
  if nil == Panel_Window_CutSceneScript then
    return
  end
  if false == self._initialize then
    return
  end
  local strInteractionKey = keyCustom_GetString_ActionKey(CppEnums.ActionInputType.ActionInputType_Interaction)
  self._ui._stc_skipAnno:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CUTSCENE_SKIP_DESC"))
  self._ui._stc_Rkey_pc:SetText(strInteractionKey)
  local strEscKey = keyCustom_GetString_ActionKey(CppEnums.ActionInputType.ActionInputType_Esc)
  self._ui._stc_cancleAnno:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUTSCENE_BACKTOCHARACTERSELECT"))
  self._ui._stc_ESCkey_pc:SetText(strEscKey)
  self:clear()
  if Panel_Movie_KeyViewer ~= nil and _ContentsGroup_UsePadSnapping == false then
    Panel_KeyViewer_Hide()
  end
  if false == ToClient_IsEnterSequence() then
    self._currentSkipState = self._skipState.End
    self._renderMode:set()
    if Defines.UIMode.eUIMode_Default == self._prevUIMode or Defines.UIMode.eUIMode_GroupCamera == self._prevUIMode then
      self._prevUIMode = GetUIMode()
    end
    SetUIMode(Defines.UIMode.eUIMode_GroupCamera)
  else
  end
  self:open()
end
function PaGlobal_CutSceneScript:open()
  if nil == Panel_Window_CutSceneScript then
    return
  end
  Panel_Window_CutSceneScript:SetShow(true)
end
function PaGlobal_CutSceneScript:prepareClose()
  if nil == Panel_Window_CutSceneScript then
    return
  end
  if false == ToClient_IsEnterSequence() then
    self._renderMode:reset()
    local uiMode = Defines.UIMode.eUIMode_Default
    if Defines.UIMode.eUIMode_Default ~= self._prevUIMode and Defines.UIMode.eUIMode_GroupCamera ~= self._prevUIMode then
      uiMode = self._prevUIMode
      self._prevUIMode = Defines.UIMode.eUIMode_Default
    end
    SetUIMode(uiMode)
  else
  end
  self:close()
end
function PaGlobal_CutSceneScript:close()
  if false == Panel_Window_CutSceneScript:GetShow() then
    return
  end
  Panel_Window_CutSceneScript:SetShow(false)
end
function PaGlobal_CutSceneScript:validate()
  self._ui._stc_textArea:isValidate()
  self._ui._txt_desc:isValidate()
  self._ui._stc_skipAnno:isValidate()
  self._ui._stc_cancleAnno:isValidate()
  self._ui._stc_keyPress:isValidate()
  self._ui._pg_keyPressTime:isValidate()
end
function PaGlobal_CutSceneScript:registerEvent()
  registerEvent("FromClient_startCutSceneGroupCamera", "FromClient_startCutSceneGroupCamera")
end
function PaGlobal_CutSceneScript:resizePanel()
  Panel_Window_CutSceneScript:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Window_CutSceneScript:ComputePosAllChild()
end
function PaGlobal_CutSceneScript:isKeyDown_OnceESC()
  if true == _ContentsGroup_UsePadSnapping then
    if true == isPadDown(__eJoyPadInputType_Start) then
      return true
    end
  else
    if true == isKeyDown_Once(CppEnums.VirtualKeyCode.KeyCode_ESCAPE) then
      return true
    end
    if true == isPadDown(__eJoyPadInputType_Start) then
      return true
    end
  end
  return false
end
function PaGlobal_CutSceneScript:isKeyDown_Once()
  if true == _ContentsGroup_UsePadSnapping then
    for key, value in pairs(self._joyPadKey) do
      if true == isPadDown(value) then
        return true
      end
    end
  else
    for key, value in pairs(CppEnums.VirtualKeyCode) do
      if true == isKeyDown_Once(value) then
        return true
      end
    end
    for key, value in pairs(self._joyPadKey) do
      if true == isPadDown(value) then
        return true
      end
    end
  end
  return false
end
function PaGlobal_CutSceneScript:keyPressReset()
  self._currentSkipState = self._skipState.Press_Any_Key
  self._ui._pg_keyPressTime:SetCurrentControlPos(0)
  self._keyPressTime = 0
end
function PaGlobal_CutSceneScript:cancleSequence()
  if nil == Panel_Window_CutSceneScript then
    return
  end
  if false == self._initialize then
    return
  end
  self:clear()
  local backToCharacterSelect = function()
    PaGlobalFunc_CutSceneSkip_SetBackToCharacterSelect(true)
    ToClient_SetForceStop(true)
    ToClient_CutsceneStop()
  end
  local function cancelBackToCharacterSelect()
    ToClient_HideMouseCursor()
    self:keyPressReset()
  end
  local contentStr = PAGetString(Defines.StringSheet_GAME, "LUA_SEQUENCE_CUTSCENE_FORCE_STOP_DESC")
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = contentStr,
    functionYes = backToCharacterSelect,
    functionCancel = cancelBackToCharacterSelect,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW,
    exitButton = true,
    btnYesText = PAGetString(Defines.StringSheet_GAME, "LUA_SEQUENCE_CUTSCENE_FORCE_STOP_BTN_YES"),
    btnCancelText = PAGetString(Defines.StringSheet_GAME, "LUA_SEQUENCE_CUTSCENE_FORCE_STOP_BTN_CANCEL")
  }
  MessageBox.showMessageBox(messageboxData, nil, nil, _ContentsGroup_UsePadSnapping)
  if _ContentsGroup_UsePadSnapping == false then
    ToClient_ShowMouseCursor()
  end
end
