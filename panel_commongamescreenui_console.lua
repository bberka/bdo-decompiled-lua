local isBossRange = false
local _bossCharacterWrapper
local prevOption = {
  _UsePlayerEffectDistOptimization = false,
  _PlayerEffectDistOptimization = 0,
  _UseOtherPlayerUpdate = true
}
function backUpOptimizeOption()
  prevOption._UsePlayerEffectDistOptimization = ToClient_getGameOptionControllerWrapper():getUsePlayerOptimizationEffectFrame()
  prevOption._PlayerEffectDistOptimization = ToClient_getGameOptionControllerWrapper():getPlayerEffectFrameEffectOptimization()
  prevOption._UseOtherPlayerUpdate = ToClient_getGameOptionControllerWrapper():getUseOtherPlayerUpdate()
end
function applyOptimizeOption()
  setUsePlayerOptimizationEffectFrame(true)
  setPlayerEffectFrameEffectOptimization(1000)
  setUseOtherPlayerUpdate(false)
  ToClient_setFarPlayerLimitCount(10)
end
function resetOptimizeOption()
  setUsePlayerOptimizationEffectFrame(prevOption._UsePlayerEffectDistOptimization)
  setPlayerEffectFrameEffectOptimization(prevOption._PlayerEffectDistOptimization)
  setUseOtherPlayerUpdate(prevOption._UseOtherPlayerUpdate)
  ToClient_setFarPlayerLimitCount(80)
end
function FromClient_EventCameraCharacter_RangeIn(characterWrapper)
  if nil == characterWrapper then
    _PA_LOG("ê´‘ìš´", "[ë³´ìŠ¤ì¹´ë©”ë¼] ë³´ìŠ¤ characterWrapperê°€ nilì´ë©´ ì•ˆë˜ëŠ”ë°ìš©..")
    return
  end
  _bossCharacterWrapper = characterWrapper
  isBossRange = true
  backUpOptimizeOption()
  applyOptimizeOption()
end
function FromClient_EventCameraCharacter_RangeChange()
  isBossRange = true
end
function FromClient_EventCameraCharacter_RangeOut()
  isBossRange = false
  resetOptimizeOption()
end
function FromClient_EventCameraCharacter_Dead()
  isBossRange = false
  resetOptimizeOption()
end
local initialize = function()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_CommonGameScreenUI_Console")
function FromClient_luaLoadComplete_CommonGameScreenUI_Console()
  initialize()
  Panel_CommonGameScreenUI_Console:SetShow(true)
  registerEvent("FromClient_EventCameraCharacter_RangeIn", "FromClient_EventCameraCharacter_RangeIn")
  registerEvent("FromClient_EventCameraCharacter_RangeChange", "FromClient_EventCameraCharacter_RangeChange")
  registerEvent("FromClient_EventCameraCharacter_RangeOut", "FromClient_EventCameraCharacter_RangeOut")
  registerEvent("FromClient_EventCameraCharacter_Dead", "FromClient_EventCameraCharacter_Dead")
end
