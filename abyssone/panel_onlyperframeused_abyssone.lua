local luaLoadAfterTime = 0
local luaLoadAfterFrameCount = 0
local whaleTimeCheck = 0
local skillWindowCloseTimeCheck = 0
local skillWindowScrollResetTime = 30
function PaGlobalFunc_SkillWindowCloseTimeReset()
  skillWindowCloseTimeCheck = 0
end
function PaGlobalFunc_SkillWindowScrollReset()
  return skillWindowScrollResetTime < skillWindowCloseTimeCheck
end
function FGlobal_getLuaLoadTime()
  return luaLoadAfterTime
end
function FGlobal_getFrameCount()
  return luaLoadAfterFrameCount
end
function Panel_OnlyPerframeUsedFunction(deltaTime)
  luaLoadAfterTime = luaLoadAfterTime + deltaTime
  luaLoadAfterFrameCount = luaLoadAfterFrameCount + 1
  if false == _ContentsGroup_RenewUI and nil ~= GameTips_MessageUpdate then
    GameTips_MessageUpdate(deltaTime)
  end
  if nil ~= ChattingViewManager_UpdatePerFrame then
    ChattingViewManager_UpdatePerFrame(deltaTime)
  end
  skillWindowCloseTimeCheck = skillWindowCloseTimeCheck + deltaTime
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_OnlyPerframeUsed")
function FromClient_luaLoadComplete_OnlyPerframeUsed()
  if true == _ContentsGroup_UsePadSnapping then
    Panel_OnlyPerframeUsed:SetOffsetIgnorePanel(true)
  end
  Panel_OnlyPerframeUsed:SetShow(true)
  Panel_OnlyPerframeUsed:RegisterUpdateFunc("Panel_OnlyPerframeUsedFunction")
end
local ReducedPerframeFunc = {
  AppliedBuffList_Update,
  QuestWidget_ProgressingGuildQuest_UpdateRemainTime,
  PaGlobalFunc_InventoryInfo_SearchCooltime,
  TimeBar_UpdatePerFrame
}
local accumulatedTime = 0
function PaGlobal_ReducedPerframe(deltaTime)
  if false == _ContentsGroup_ReducedLua then
    return
  end
  accumulatedTime = accumulatedTime + deltaTime
  if accumulatedTime > 1 then
    for _, func in pairs(ReducedPerframeFunc) do
      if nil ~= func then
        func(accumulatedTime)
      end
    end
    accumulatedTime = 0
  end
end
