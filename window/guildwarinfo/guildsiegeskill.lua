Panel_GuildSiegeSkill:SetShow(false)
PaGlobal_GuildSiegeSkill = {
  _ui_main = {},
  _skillInfo = {}
}
function PaGlobal_GuildSiegeSkill:Initialize()
  local progressBg = UI.getChildControl(Panel_GuildSiegeSkill, "Static_ProgressBg")
  local ui_main = {
    _btn_Close = UI.getChildControl(Panel_GuildSiegeSkill, "Button_Close"),
    _resource_Text = UI.getChildControl(Panel_GuildSiegeSkill, "StaticText_CurrentResource"),
    _resource_Percent = UI.getChildControl(progressBg, "Progress2_1")
  }
  ui_main._btn_Close:addInputEvent("Mouse_LUp", "FGlobal_GuildSiegeSkill_Close()")
  self._ui_main = ui_main
  local skillBg = UI.getChildControl(Panel_GuildSiegeSkill, "Static_SKillBoxBg")
  local skillInfo = {
    _static_SkillIcon = UI.getChildControl(skillBg, "Static_GuildIWarSkillconBg"),
    _skillName = UI.getChildControl(skillBg, "StaticText_SKillName"),
    _skillDesc = UI.getChildControl(skillBg, "StaticText_SkilInfo"),
    _btn_useSkill = UI.getChildControl(skillBg, "Button_Skill")
  }
  self._skillInfo = skillInfo
end
function PaGlobal_GuildSiegeSkill:Update()
  local currentResource = ToClient_GetMyGuildAllianceSiegeResource()
  local maxResource = ToClient_GetSiegeMaxResources()
  local resourceRate = currentResource * 100 / maxResource
  self._ui_main._resource_Text:SetText("í˜„ì¬ ìì›" .. "(" .. tostring(currentResource) .. "/" .. tostring(maxResource) .. ")")
  self._ui_main._resource_Percent:SetProgressRate(resourceRate)
  local skillNo = ToClient_getGuildSiegeSkillNo(0)
  local skillTypeSS = getSkillTypeStaticStatus(skillNo)
  if nil == skillTypeSS then
    return
  end
  local skillStatic = getSkillStaticStatus(skillNo, 1)
  if nil == skillStatic then
    return
  end
  local skillTypeSSW = skillStatic:getSkillTypeStaticStatusWrapper()
  if nil == skillTypeSSW then
    return
  end
  self._skillInfo._skillName:SetText(skillTypeSS:getName())
  self._skillInfo._skillDesc:SetAutoResize(true)
  self._skillInfo._skillDesc:SetText(skillTypeSSW:getDescription())
  self._skillInfo._static_SkillIcon:ChangeTextureInfoNameAsync("icon/" .. skillTypeSS:getIconPath())
  self._skillInfo._static_SkillIcon:SetIgnore(true)
  self._skillInfo._btn_useSkill:addInputEvent("Mouse_LUp", "HandleClicked_UseSiegeSkill(" .. tostring(skillNo) .. ")")
end
function FGlobal_GuildSiegeSkill_Close()
  Panel_GuildSiegeSkill:SetShow(false)
end
function FGlobal_GuildSiegeSkill_Open()
  PaGlobal_GuildSiegeSkill:Update()
  Panel_GuildSiegeSkill:SetShow(true)
end
function HandleClicked_UseSiegeSkill(skillNo)
  ToClient_useGuildSiegeSkill(skillNo)
end
function testSiegeSkill()
  FGlobal_GuildSiegeSkill_Open()
end
registerEvent("FromClient_UsedSiegeSkill", "FromClient_UsedSiegeSkill")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PaGlobal_GuildSiegeSkill")
function FromClient_luaLoadComplete_PaGlobal_GuildSiegeSkill()
  PaGlobal_GuildSiegeSkill:Initialize()
end
function FromClient_UsedSiegeSkill(charcterName, SkillName)
  local msg = {
    main = charcterName .. "(ì´/ê°€) " .. SkillName .. " ê¸°ìˆ ì„ ì‚¬ìš© í–ˆìŠµë‹ˆë‹¤. ",
    sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_SUB_NOGUILD", "channelName", channelName, "percent", goldenBellPercentString),
    addMsg = ""
  }
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 10, 54)
end
