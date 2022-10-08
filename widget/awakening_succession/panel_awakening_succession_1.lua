function PaGlobal_AwakeningSuccession:initialize()
  if true == self._initialize then
    return
  end
  self._isConsole = true == ToClient_isConsole() or true == _ContentsGroup_UsePadSnapping
  self:initialize_left()
  self:initialize_right()
  self:initialize_pc()
  self:initialize_console()
  self:registEventHandler()
  self:validate()
  self._initialize = true
end
function PaGlobal_AwakeningSuccession:initialize_left()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  self._ui._btn_left_awakening:addInputEvent("Mouse_LUp", "PaGlobalFunc_AwakeningSuccession_OnClieckRadioButton()")
  self._leftInfo._stc_characterTexture = UI.getChildControl(self._ui._btn_left_awakening, "Static_Character")
  local stc_skillType = UI.getChildControl(self._ui._btn_left_awakening, "Static_SkillType")
  self._leftInfo._stc_WeaponTypeValue = UI.getChildControl(stc_skillType, "StaticText_WeaponTypeValue")
  self._leftInfo._stc_CombatTypeValue = UI.getChildControl(stc_skillType, "StaticText_CombatTypeValue")
  self._leftInfo._stc_Desc = UI.getChildControl(self._ui._btn_left_awakening, "StaticText_Desc_Character")
end
function PaGlobal_AwakeningSuccession:initialize_right()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  self._ui._btn_right_succession:addInputEvent("Mouse_LUp", "PaGlobalFunc_AwakeningSuccession_OnClieckRadioButton()")
  self._rightInfo._stc_characterTexture = UI.getChildControl(self._ui._btn_right_succession, "Static_Character")
  local stc_skillType = UI.getChildControl(self._ui._btn_right_succession, "Static_SkillType")
  self._rightInfo._stc_WeaponTypeValue = UI.getChildControl(stc_skillType, "StaticText_WeaponTypeValue")
  self._rightInfo._stc_CombatTypeValue = UI.getChildControl(stc_skillType, "StaticText_CombatTypeValue")
  self._rightInfo._stc_Desc = UI.getChildControl(self._ui._btn_right_succession, "StaticText_Desc_Character")
end
function PaGlobal_AwakeningSuccession:initialize_pc()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  if true == self._isConsole then
    return
  end
  self._ui._btn_confirm:addInputEvent("Mouse_LUp", "PaGlobalFunc_AwakeningSuccession_OnClieckConfirmButton()")
end
function PaGlobal_AwakeningSuccession:initialize_console()
  local panel = Panel_Widget_Awakening_Succession_Select_All
  if nil == panel then
    return
  end
  if false == self._isConsole then
    return
  end
  panel:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_AwakeningSuccession_OnClieckConfirmButton()")
  panel:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobal_AwakeningSuccession:selectButton(true)")
  panel:registerPadEvent(__eConsoleUIPadEvent_RB, "PaGlobal_AwakeningSuccession:selectButton(false)")
  self._ui._btn_confirm:SetShow(false)
  self._ui._stc_console_keyguides:SetShow(true)
end
function PaGlobal_AwakeningSuccession:selectButton(isLeft)
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return false
  end
  if false == self._isConsole then
    return
  end
  if nil == isLeft then
    return
  end
  local targetControl
  if true == isLeft then
    self._ui._btn_left_awakening:SetCheck(true)
    self._ui._btn_right_succession:SetCheck(false)
    targetControl = self._ui._btn_left_awakening
  else
    self._ui._btn_left_awakening:SetCheck(false)
    self._ui._btn_right_succession:SetCheck(true)
    targetControl = self._ui._btn_right_succession
  end
  ToClient_padSnapChangeToTarget(targetControl)
end
function PaGlobal_AwakeningSuccession:updateSelectedInfo()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return false
  end
  local isCheckAwaken = self._ui._btn_left_awakening:IsCheck()
  local isCheckSuccession = self._ui._btn_right_succession:IsCheck()
  if false == isCheckAwaken and false == isCheckSuccession then
    self._ui._btn_confirm:SetIgnore(true)
    self._ui._btn_confirm:SetMonoTone(true)
  else
    self._ui._btn_confirm:SetIgnore(false)
    self._ui._btn_confirm:SetMonoTone(false)
  end
end
function PaGlobal_AwakeningSuccession:updateInfo()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return false
  end
  local classType = getSelfPlayer():getClassType()
  if nil == classType then
    UI.ASSERT_NAME(false, "[PaGlobal_AwakeningSuccession:updateInfo()] classType is nil", "ì´ì£¼")
    return false
  end
  self._leftInfo._stc_characterTexture:ChangeTextureInfoName(self._texturePath .. self._awakenTextureFileName[classType])
  self._rightInfo._stc_characterTexture:ChangeTextureInfoName(self._texturePath .. self._successionTextureFileName[classType])
  self._leftInfo._stc_WeaponTypeValue:SetText(PAGetString(Defines.StringSheet_GAME, self._awakenInfo[classType]._weaponType))
  self._leftInfo._stc_CombatTypeValue:SetText(PAGetString(Defines.StringSheet_GAME, self._awakenInfo[classType]._combatType))
  self._leftInfo._stc_Desc:SetTextMode(__eTextMode_AutoWrap)
  self._leftInfo._stc_Desc:SetText(PAGetString(Defines.StringSheet_GAME, self._awakenInfo[classType]._desc))
  self._rightInfo._stc_WeaponTypeValue:SetText(PAGetString(Defines.StringSheet_GAME, self._successionInfo[classType]._weaponType))
  self._rightInfo._stc_CombatTypeValue:SetText(PAGetString(Defines.StringSheet_GAME, self._successionInfo[classType]._combatType))
  self._rightInfo._stc_Desc:SetTextMode(__eTextMode_AutoWrap)
  self._rightInfo._stc_Desc:SetText(PAGetString(Defines.StringSheet_GAME, self._successionInfo[classType]._desc))
  self._ui._btn_left_awakening:SetCheck(false)
  self._ui._btn_right_succession:SetCheck(false)
  self:updateSelectedInfo()
  return true
end
function PaGlobal_AwakeningSuccession:registEventHandler()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  registerEvent("FromClient_CleqrQuestWithQuestNo", "FromClient_AwakeningSuccession_OnClearQuest")
  registerEvent("EventSkillWindowClearSkillAll", "FromClient_AwakeningSuccession_ClearSkills")
end
function PaGlobal_AwakeningSuccession:prepareOpen()
  local panel = Panel_Widget_Awakening_Succession_Select_All
  if nil == panel then
    return
  end
  if false == self:updateInfo() then
    return
  end
  self:clearProcessInfo()
  panel:SetSize(getScreenSizeX() + 2, getScreenSizeY() + 2)
  panel:SetPosX(0)
  panel:SetPosY(0)
  panel:ComputePos()
  self:open()
end
function PaGlobal_AwakeningSuccession:open()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  Panel_Widget_Awakening_Succession_Select_All:SetShow(true)
end
function PaGlobal_AwakeningSuccession:prepareClose()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  local function closePanel()
    self:clearProcessInfo()
    self:close()
  end
  local messageBoxData = {
    content = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_AWAKENING_SUCCESSION_DESC"),
    functionYes = closePanel,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function PaGlobal_AwakeningSuccession:close()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  Panel_Widget_Awakening_Succession_Select_All:SetShow(false)
end
function PaGlobal_AwakeningSuccession:validate()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  self._ui._btn_left_awakening:isValidate()
  self._ui._btn_right_succession:isValidate()
  self._ui._btn_confirm:isValidate()
  self._ui._stc_console_keyguides:isValidate()
  self._leftInfo._stc_characterTexture:isValidate()
  self._leftInfo._stc_WeaponTypeValue:isValidate()
  self._leftInfo._stc_CombatTypeValue:isValidate()
  self._leftInfo._stc_Desc:isValidate()
  self._rightInfo._stc_characterTexture:isValidate()
  self._rightInfo._stc_WeaponTypeValue:isValidate()
  self._rightInfo._stc_CombatTypeValue:isValidate()
  self._rightInfo._stc_Desc:isValidate()
end
function PaGlobal_AwakeningSuccession:requestLeanRootSkill()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return
  end
  local classType = selfPlayerWrapper:getClassType()
  if nil == classType then
    return
  end
  UI.ASSERT_NAME(false ~= self._processInfo._isWatingClearSkillResult, "[ErrorNo01] ë¡œì§ì—ëŸ¬ì…ë‹ˆë‹¤. ë°œìƒì‹œ ì œë³´ ë¶€íƒë“œë¦½ë‹ˆë‹¤.", "ì´ì£¼")
  UI.ASSERT_NAME(nil ~= self._processInfo._requestSkillType, "[ErrorNo02] ë¡œì§ì—ëŸ¬ì…ë‹ˆë‹¤. ë°œìƒì‹œ ì œë³´ ë¶€íƒë“œë¦½ë‹ˆë‹¤.", "ì´ì£¼")
  local learnSkillNo
  if __eSkillTypeParam_Awaken == self._processInfo._requestSkillType then
    local awakenRoot = ToClient_getAwakenRootSkillGroupNo(classType)
    local skillKey = ToClient_getSkillKeyBySkillGroupNo(awakenRoot, 1)
    if true == skillKey:isDefined() then
      learnSkillNo = skillKey:getSkillNo()
    end
  elseif __eSkillTypeParam_Inherit == self._processInfo._requestSkillType then
    local successionRoot = ToClient_getSuccessionRootSkillGroupNo(classType)
    local skillKey = ToClient_getSkillKeyBySkillGroupNo(successionRoot, 1)
    if true == skillKey:isDefined() then
      learnSkillNo = skillKey:getSkillNo()
    end
  else
    UI.ASSERT_NAME(false, "[ErrorNo03] ë°°ìš°ë ¤ëŠ” ìŠ¤í‚¬íƒ€ì…ì´ ì „ìŠ¹/ê°ì„± ìŠ¤í‚¬ì´ ì•„ë‹™ë‹ˆë‹¤.", "ì´ì£¼")
  end
  if nil ~= learnSkillNo then
    local skillSSW = getSkillStaticStatus(learnSkillNo, 1)
    if nil == skillSSW then
      return
    end
    local cantLearnableSkill = skillSSW:isLearnSkillByItem()
    if false == cantLearnableSkill then
      local isSuccess = ToClient_SkillWindow_doLearn(learnSkillNo)
      if true == isSuccess then
        self:notiSkillGroupUI()
        self:prepareClose()
      else
        UI.ASSERT_NAME(false, "[ErrorNo04] Root ìŠ¤í‚¬ì„ ë°°ìš¸ ìˆ˜ ì—†ìŠµë‹ˆë‹¤.", "ì´ì£¼")
      end
    else
      self:notiSkillGroupUI()
      self:prepareClose()
    end
  else
    UI.ASSERT_NAME(false, "[ErrorNo05] Root ìŠ¤í‚¬ì •ë³´ë¥¼ ì°¾ì„ ìˆ˜ ì—†ìŠµë‹ˆë‹¤.", "ì´ì£¼")
  end
  self:clearProcessInfo()
end
function PaGlobal_AwakeningSuccession:clearProcessInfo()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  self._processInfo._isWatingClearSkillResult = false
  self._processInfo._requestSkillType = nil
end
function PaGlobal_AwakeningSuccession:notiSkillGroupUI()
  if nil == Panel_Widget_Awakening_Succession_Select_All then
    return
  end
  if nil ~= PaGlobal_SkillGroup then
    local treeIndex = -1
    if __eSkillTypeParam_Awaken == self._processInfo._requestSkillType then
      treeIndex = 0
    elseif __eSkillTypeParam_Inherit == self._processInfo._requestSkillType then
      treeIndex = 1
    end
    PaGlobal_SkillGroup:clearTree()
    PaGlobal_SkillGroup:selectTree(treeIndex)
    PaGlobal_SkillGroup._isChangingTree = __eSkillTypeParam_Normal
  end
end
