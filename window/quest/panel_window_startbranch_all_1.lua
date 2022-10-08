function PaGlobal_StartBranch_All:initialize()
  if true == PaGlobal_StartBranch_All._initialize then
    return
  end
  local BottomBtnGroup = UI.getChildControl(Panel_Window_StartBranch, "Static_QuestBranchBottomGroup")
  PaGlobal_StartBranch_All._ui._btn_SelectBranch = UI.getChildControl(BottomBtnGroup, "Button_SelectBranch")
  PaGlobal_StartBranch_All._ui._btn_Cancel = UI.getChildControl(BottomBtnGroup, "Button_Cancel")
  PaGlobal_StartBranch_All._ui._stc_blockBg = UI.getChildControl(Panel_Window_StartBranch, "StaticText_BlackBG")
  PaGlobal_StartBranch_All._isConsole = _ContentsGroup_UsePadSnapping
  PaGlobal_StartBranch_All._ui_console._btn_SelectBranch = UI.getChildControl(BottomBtnGroup, "StaticText_SelectBranch_ConsoleUI")
  PaGlobal_StartBranch_All._ui_console._btn_Cancel = UI.getChildControl(BottomBtnGroup, "StaticText_Cancel_ConsoleUI")
  PaGlobal_StartBranch_All._ui_console._stc_LB = UI.getChildControl(BottomBtnGroup, "Static_LB")
  PaGlobal_StartBranch_All._ui_console._stc_RB = UI.getChildControl(BottomBtnGroup, "Static_RB")
  local radioBtnGroup = UI.getChildControl(Panel_Window_StartBranch, "Static_QuestBranchMiddleGroup")
  for i = 0, PaGlobal_StartBranch_All._MAX_RADIO_COUNT - 1 do
    PaGlobal_StartBranch_All._ui._btn_Radio[i] = UI.getChildControl(radioBtnGroup, "Radiobutton_Branch_" .. tostring(i))
  end
  if false == self._isConsole then
    PaGlobal_StartBranch_All._ui._btn_SelectBranch:SetShow(true)
    PaGlobal_StartBranch_All._ui._btn_Cancel:SetShow(true)
    PaGlobal_StartBranch_All._ui_console._btn_SelectBranch:SetShow(false)
    PaGlobal_StartBranch_All._ui_console._btn_Cancel:SetShow(false)
    PaGlobal_StartBranch_All._ui_console._stc_LB:SetShow(false)
    PaGlobal_StartBranch_All._ui_console._stc_RB:SetShow(false)
  else
    PaGlobal_StartBranch_All._ui._btn_SelectBranch:SetShow(false)
    PaGlobal_StartBranch_All._ui._btn_Cancel:SetShow(false)
    PaGlobal_StartBranch_All._ui_console._btn_SelectBranch:SetShow(true)
    PaGlobal_StartBranch_All._ui_console._btn_Cancel:SetShow(true)
    PaGlobal_StartBranch_All._ui_console._stc_LB:SetShow(true)
    PaGlobal_StartBranch_All._ui_console._stc_RB:SetShow(true)
  end
  PaGlobal_StartBranch_All._originalSelectButton_PC_spanX = PaGlobal_StartBranch_All._ui._btn_SelectBranch:GetSpanSize().x
  PaGlobal_StartBranch_All._originalSelectButton_Console_spanX = PaGlobal_StartBranch_All._ui_console._btn_SelectBranch:GetSpanSize().x
  PaGlobal_StartBranch_All:registEventHandler()
  PaGlobal_StartBranch_All:validate()
  PaGlobal_StartBranch_All._initialize = true
end
function PaGlobal_StartBranch_All:registEventHandler()
  if nil == Panel_Window_StartBranch then
    return
  end
  registerEvent("onScreenResize", "FromClient_StartBranch_All_OnScreenResize")
  if false == self._isConsole then
    PaGlobal_StartBranch_All._ui._btn_SelectBranch:addInputEvent("Mouse_LUp", "HandleEventLUp_StartBranch_All_Select()")
    PaGlobal_StartBranch_All._ui._btn_Cancel:addInputEvent("Mouse_LUp", "HandleEventLUp_StartBranch_All_Cancel()")
    for i = 0, PaGlobal_StartBranch_All._MAX_RADIO_COUNT - 1 do
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:addInputEvent("Mouse_LUp", "HandleEventLUp_StartBranch_All_SelectRadioButton(" .. i .. ")")
    end
  else
    Panel_Window_StartBranch:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobalFunc_StartBranch_PadControl(false)")
    Panel_Window_StartBranch:registerPadEvent(__eConsoleUIPadEvent_RB, "PaGlobalFunc_StartBranch_PadControl(true)")
    Panel_Window_StartBranch:registerPadEvent(__eConsoleUIPadEvent_Up_A, "HandleEventLUp_StartBranch_All_Select()")
  end
end
function PaGlobal_StartBranch_All:prepareOpen(isOpenedInGame)
  if nil == Panel_Window_StartBranch then
    return
  end
  self:recalcBottomButtonUI(isOpenedInGame)
  for i = 0, PaGlobal_StartBranch_All._MAX_RADIO_COUNT - 1 do
    PaGlobal_StartBranch_All._ui._btn_Radio[i]:EraseAllEffect()
    if 1 == i then
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:AddEffect("fUI_CharacterBirth_1", true, 0, 0)
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:SetCheck(true)
    else
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:SetCheck(false)
    end
  end
  self._selectTab = 0
  FromClient_StartBranch_All_OnScreenResize()
  PaGlobal_StartBranch_All:open()
end
function PaGlobal_StartBranch_All:recalcBottomButtonUI(isOpenedInGame)
  if Panel_Window_StartBranch == nil then
    return
  end
  if isOpenedInGame ~= nil and isOpenedInGame == true and _ContentsGroup_NewSequenceTutorial == true then
    if self._isConsole == true then
      self._ui_console._btn_Cancel:SetShow(false)
      self._ui_console._btn_SelectBranch:SetSpanSize(-(self._ui_console._btn_SelectBranch:GetSizeX() + self._ui_console._btn_SelectBranch:GetTextSizeX()) / 2, self._ui_console._btn_SelectBranch:GetSpanSize().y)
    else
      self._ui._btn_Cancel:SetShow(false)
      self._ui._btn_Cancel:addInputEvent("Mouse_LUp", "")
      self._ui._btn_SelectBranch:SetSpanSize(0, self._ui._btn_SelectBranch:GetSpanSize().y)
    end
  elseif self._isConsole == true then
    self._ui_console._btn_Cancel:SetShow(true)
    self._ui_console._btn_SelectBranch:SetSpanSize(self._originalSelectButton_Console_spanX, self._ui_console._btn_SelectBranch:GetSpanSize().y)
  else
    self._ui._btn_Cancel:SetShow(true)
    self._ui._btn_Cancel:addInputEvent("Mouse_LUp", "HandleEventLUp_StartBranch_All_Cancel()")
    self._ui._btn_SelectBranch:SetSpanSize(self._originalSelectButton_PC_spanX, self._ui._btn_SelectBranch:GetSpanSize().y)
  end
end
function PaGlobal_StartBranch_All:open()
  if nil == Panel_Window_StartBranch then
    return
  end
  Panel_Window_StartBranch:SetShow(true)
end
function PaGlobal_StartBranch_All:prepareClose()
  if nil == Panel_Window_StartBranch then
    return
  end
  PaGlobal_StartBranch_All:close()
end
function PaGlobal_StartBranch_All:close()
  if nil == Panel_Window_StartBranch then
    return
  end
  Panel_Window_StartBranch:SetShow(false)
end
function PaGlobal_StartBranch_All:validate()
  if nil == Panel_Window_StartBranch then
    return
  end
  PaGlobal_StartBranch_All._ui._btn_SelectBranch:isValidate()
  PaGlobal_StartBranch_All._ui._btn_Cancel:isValidate()
  for i = 0, PaGlobal_StartBranch_All._MAX_RADIO_COUNT - 1 do
    PaGlobal_StartBranch_All._ui._btn_Radio[i]:isValidate()
  end
  PaGlobal_StartBranch_All._ui_console._btn_SelectBranch:isValidate()
  PaGlobal_StartBranch_All._ui_console._btn_Cancel:isValidate()
  PaGlobal_StartBranch_All._ui_console._stc_LB:isValidate()
  PaGlobal_StartBranch_All._ui_console._stc_RB:isValidate()
end
function PaGlobal_StartBranch_All:SelectBranch()
  if nil == Panel_Window_StartBranch then
    return
  end
  local isNewRoute = false
  if PaGlobal_StartBranch_All._ui._btn_Radio[0]:IsChecked() then
    isNewRoute = true
  end
  if false == self._isConsole then
    Panel_CharacterCreateOK_Confirm(isNewRoute)
  else
    PaGlobalFunc_Customization_InputName_SelectStartBranch(isNewRoute)
  end
end
function PaGlobal_StartBranch_All:SelectRadioButton(idx)
  for i = 0, PaGlobal_StartBranch_All._MAX_RADIO_COUNT - 1 do
    if nil ~= PaGlobal_StartBranch_All._ui._btn_Radio[i] then
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:EraseAllEffect()
      PaGlobal_StartBranch_All._ui._btn_Radio[i]:SetCheck(false)
    end
  end
  local static = PaGlobal_StartBranch_All._ui._btn_Radio[idx]
  if nil == static then
    return
  end
  static:SetCheck(true)
  local effectName = "fUI_CharacterBirth_" .. tostring(idx)
  if 0 == idx then
    audioPostEvent_SystemUi(29, 2)
    _AudioPostEvent_SystemUiForXBOX(29, 2)
  else
    audioPostEvent_SystemUi(29, 1)
    _AudioPostEvent_SystemUiForXBOX(29, 1)
  end
  static:AddEffect(effectName, true, 0, 0)
end
