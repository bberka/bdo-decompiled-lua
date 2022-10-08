function PaGlobalFunc_AbyssOneResurrection_Open()
  local self = PaGlobal_AbyssOneResurrection
  if self == nil then
    return
  end
  self:prepareOpen()
end
function PaGlobalFunc_AbyssOneResurrection_Close()
  local self = PaGlobal_AbyssOneResurrection
  if self == nil then
    return
  end
  self:prepareClose()
end
function Panel_AbyssOne_Resurrection_ShowAni()
  Panel_AbyssOne_Resurrection:SetAlpha(0)
  local aniInfo = UIAni.AlphaAnimation(1, Panel_AbyssOne_Resurrection, 0, 0,5)
end
function Panel_AbyssOne_Resurrection_HideAni()
  Panel_AbyssOne_Resurrection:SetAlpha(1)
  local aniInfo = UIAni.AlphaAnimation(0, Panel_AbyssOne_Resurrection, 0, 0,5)
  aniInfo:SetHideAtEnd(true)
end
function HandleEventLUp_AbyssOneResurrection_Revive(reviveType)
  local self = PaGlobal_AbyssOneResurrection
  if self == nil or reviveType == nil then
    return
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return
  end
  deadMessage_Revival(reviveType, 255, CppEnums.ItemWhereType.eCount, getSelfPlayer():getRegionKey())
  self:setButtuonIgnoreAndMonotone(true)
end
function FromClient_AbyssOne_Dead()
  local self = PaGlobal_AbyssOneResurrection
  if self == nil then
    return
  end
  PaGlobalFunc_AbyssOneResurrection_Open()
end
function FromClient_AbyssOne_Revive()
  local self = PaGlobal_AbyssOneResurrection
  if self == nil then
    return
  end
  PaGlobalFunc_AbyssOneResurrection_Close()
end
