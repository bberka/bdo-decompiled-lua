local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
function appear_blackSpirit(questNo, blackSpiritUIType)
  ToClient_SaveUiInfo(false)
  close_WindowPanelList()
  local preUIMode = GetUIMode()
  SetUIMode(UIMode.eUIMode_NpcDialog_Dummy)
  local callSummon = RequestAppearBlackSpirit(questNo, blackSpiritUIType)
  if callSummon then
    PaGlobalFunc_DialogMain_All_ShowToggle(false)
    PaGlobal_DialogMain_All._renderMode:set()
    ToClient_AudioPostEvent_UIAudioStateEvent("UISTATE_OPEN_BLACKSPIRIT")
  else
    SetUIMode(preUIMode)
    ToClient_PopBlackSpiritFlush()
    PaGlobalFunc_DialogMain_All_ShowToggle(false)
  end
end
registerEvent("appear_blackSpirit", "appear_blackSpirit")
