function PaGlobal_HorseSubMp_All:initialize()
  if true == PaGlobal_HorseSubMp_All._initialize then
    return
  end
  self._ui._stc_gaugeProgress = UI.getChildControl(Panel_HorseSubMp_All, "HorseGaugeBar")
  self._ui._txt_gauge = UI.getChildControl(Panel_HorseSubMp_All, "StaticText_Gauge")
  self._ui._txt_gauge:SetShow(false)
  self:registEventHandler()
  self:validate()
  self._initialize = true
end
function PaGlobal_HorseSubMp_All:validate()
  if nil == Panel_HorseSubMp_All then
    return
  end
  self._ui._stc_gaugeProgress:isValidate()
  self._ui._txt_gauge:isValidate()
end
function PaGlobal_HorseSubMp_All:registEventHandler()
  if nil == Panel_HorseSubMp_All then
    return
  end
  registerEvent("onScreenResize", "FromClient_HorseSubMp_All_ResizePanel")
  registerEvent("FromClient_UpdateWaterRunGauge", "FromClient_HorseSubMp_All_UpdateWaterRunGauge")
end
function PaGlobal_HorseSubMp_All:prepareOpen()
  if nil == Panel_HorseSubMp_All then
    return
  end
  if nil ~= Panel_WorldMap and true == Panel_WorldMap:GetShow() then
    return
  end
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return
  end
  local selfPlayer = selfPlayerWrapper:get()
  if nil == selfPlayer then
    return
  end
  local rideVehicleActorKey = selfPlayer:getRideVehicleActorKeyRaw()
  if nil == rideVehicleActorKey or 0 == rideVehicleActorKey then
    return
  end
  local temporaryInfoWrapper = getTemporaryInformationWrapper()
  if nil == temporaryInfoWrapper then
    return
  end
  local servantInfoWrapper = temporaryInfoWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
  if nil == servantInfoWrapper then
    return
  end
  local myVehicleActorKeyRaw = servantInfoWrapper:getActorKeyRaw()
  if nil == myVehicleActorKeyRaw or 0 == myVehicleActorKeyRaw then
    return
  end
  if rideVehicleActorKey ~= myVehicleActorKeyRaw then
    return
  end
  local vehicleProxyWrapper = getVehicleActor(myVehicleActorKeyRaw)
  if nil == vehicleProxyWrapper then
    return
  end
  local vehicleProxy = vehicleProxyWrapper:get()
  if nil == vehicleProxy then
    return
  end
  if false == vehicleProxy:isUseWaterRunGauge() then
    return
  end
  local maxGauge = servantInfoWrapper:getMaxServantStatParam(__eServantStatParamType_WaterRunGauge)
  local curGauge = servantInfoWrapper:getServantStatParam(__eServantStatParamType_WaterRunGauge)
  PaGlobal_HorseSubMp_All:updateStat(curGauge, maxGauge)
  if nil ~= HorseMP_UpdateCarrotPosBySubMpBar then
    HorseMP_UpdateCarrotPosBySubMpBar(true)
  end
  PaGlobal_HorseSubMp_All:open()
end
function PaGlobal_HorseSubMp_All:open()
  if nil == Panel_HorseSubMp_All then
    return
  end
  Panel_HorseSubMp_All:SetShow(true)
end
function PaGlobal_HorseSubMp_All:prepareClose()
  if nil == Panel_HorseSubMp_All then
    return
  end
  if nil ~= HorseMP_UpdateCarrotPosBySubMpBar then
    HorseMP_UpdateCarrotPosBySubMpBar(false)
  end
  PaGlobal_HorseSubMp_All:close()
end
function PaGlobal_HorseSubMp_All:close()
  if nil == Panel_HorseSubMp_All or false == Panel_HorseSubMp_All:GetShow() then
    return
  end
  Panel_HorseSubMp_All:SetShow(false)
end
function PaGlobal_HorseSubMp_All:updateStat(curGauge, maxGauge)
  if nil == Panel_HorseSubMp_All then
    return
  end
  if 0 == maxGauge then
    return
  end
  local Rate = 0
  if nil ~= curGauge and nil ~= maxGauge and maxGauge > 0 then
    Rate = 100 * curGauge / maxGauge
  end
  self._ui._stc_gaugeProgress:SetProgressRate(Rate)
  self._ui._txt_gauge:SetText(tostring(curGauge) .. " / " .. tostring(maxGauge))
end
