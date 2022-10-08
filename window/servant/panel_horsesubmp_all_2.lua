function PaGlobal_HorseSubMp_All_Open()
  if nil == Panel_HorseSubMp_All then
    return
  end
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return
  end
  local selfProxy = selfPlayerWrapper:get()
  if nil == selfProxy then
    return
  end
  local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
  if nil == actorKeyRaw or 0 == actorKeyRaw then
    return
  end
  PaGlobal_HorseSubMp_All:prepareOpen()
end
function PaGlobal_HorseSubMp_All_OpenByLandVehicle()
  if nil == Panel_HorseSubMp_All then
    return
  end
  PaGlobal_HorseSubMp_All:prepareOpen()
end
function PaGlobal_HorseSubMp_All_Close()
  if nil == Panel_HorseSubMp_All then
    return
  end
  PaGlobal_HorseSubMp_All:prepareClose()
end
function PaGlobal_HorseSubMp_All_SetShowGaugeText(isShow)
  if nil == Panel_HorseSubMp_All then
    return
  end
  PaGlobal_HorseSubMp_All._ui._txt_gauge:SetShow(isShow)
end
function FromClient_HorseSubMp_All_UpdateWaterRunGauge(curGauge, maxGauge)
  if nil == Panel_HorseSubMp_All then
    return
  end
  PaGlobal_HorseSubMp_All:updateStat(curGauge, maxGauge)
end
function FromClient_HorseSubMp_All_ResizePanel()
  if nil == Panel_HorseSubMp_All then
    return
  end
  Panel_HorseSubMp_All:ComputePosAllChild()
end
