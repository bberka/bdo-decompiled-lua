function FromClient_updateDamageLogList()
  PaGlobal_DamageLog:prepareOpen()
end
function PaGlobalFunc_DamageLog_ListUpdate(contents, key)
  local index = Int64toInt32(key)
  local logMgrWrapper = ToClient_getFrameEventDamageInfoWrapper(index)
  if nil == logMgrWrapper then
    UI.ASSERT_NAME(false, "ë°ë¯¸ì§€ ë¡œê·¸ ë§¤ë‹ˆì € Wrapperê°€ nilì…ë‹ˆë‹¤.", "ë°•ê·œë‚˜")
    return
  end
  local attackType = logMgrWrapper:getAttackType()
  local btn_frame = UI.getChildControl(contents, "RadioButton_Frame")
  local stc_title = UI.getChildControl(btn_frame, "StaticText_Frame_No")
  local stc_desc0 = UI.getChildControl(btn_frame, "StaticText_Frame_Sub_0")
  local stc_desc1 = UI.getChildControl(btn_frame, "StaticText_Frame_Sub_1")
  local stc_desc2 = UI.getChildControl(btn_frame, "StaticText_Frame_Sub_2")
  local self = PaGlobal_DamageLog
  local txt_buffName = self:getBuffName(logMgrWrapper)
  local txt_additionalDamageType = self:getAdditionalDamageType(logMgrWrapper)
  local txt_attackResult = self:getAttackResult(logMgrWrapper)
  local txt_damage = tostring(self:getDamage(logMgrWrapper))
  local hitCount = logMgrWrapper:getHitCount()
  local txt_attackRv = ""
  for ii = __eAttackResultSuccess, __eAttackResultCount - 1 do
    local currentCount = logMgrWrapper:getAttackResult(ii)
    if currentCount > 0 then
      if "" ~= txt_attackRv then
        txt_attackRv = txt_attackRv .. ", "
      end
      local calculatedPct = currentCount * 100 / hitCount
      local txt_percent = string.format("%.2f%%", calculatedPct)
      if ii == __eAttackResultSuccess then
        txt_attackRv = txt_attackRv .. "ì„±ê³µ(" .. txt_percent .. ")"
      elseif ii == __eAttackResultCritical then
        txt_attackRv = txt_attackRv .. "í¬ë¦¬í‹°ì»¬(" .. txt_percent .. ")"
      elseif ii == __eAttackResultGuard then
        txt_attackRv = txt_attackRv .. "ê°€ë“œ(" .. txt_percent .. ")"
      elseif ii == __eAttackResultProtection then
        txt_attackRv = txt_attackRv .. "ë³´í˜¸(" .. txt_percent .. ")"
      elseif ii == __eAttackResultKilling then
        txt_attackRv = txt_attackRv .. "í‚¬(" .. txt_percent .. ")"
      elseif ii == __eAttackResultImmune then
        txt_attackRv = txt_attackRv .. "ì´ë®´(" .. txt_percent .. ")"
      elseif ii == __eAttackResultMiss then
        txt_attackRv = txt_attackRv .. "ë¯¸ìŠ¤(" .. txt_percent .. ")"
      end
    end
  end
  local txt_avgDamage = tostring(logMgrWrapper:getAvgDamage())
  stc_title:SetText(tostring(index + 1) .. ". " .. txt_buffName)
  stc_desc0:SetText(string.format("%s, %s, ë°ë¯¸ì§€=%s", txt_additionalDamageType, txt_attackResult, txt_damage))
  stc_desc1:SetText(string.format("%s, í‰ê· ë°ë¯¸ì§€=%s(%díšŒ)", txt_attackRv, txt_avgDamage, hitCount))
  stc_desc2:SetText(self:getAttackeeInfo(logMgrWrapper))
  btn_frame:addInputEvent("Mouse_LUp", "PaGlobal_DamageLog:showLogs(" .. tostring(index) .. ")")
end
