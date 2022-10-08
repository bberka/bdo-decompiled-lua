function PaGlobal_InteractionGathering_All_Open()
  if UI_Character_InterActionGathering_All == nil then
    return false
  end
  return PaGlobal_InteractionGathering_All:prepareOpen()
end
function PaGlobal_InteractionGathering_All_Close()
  if UI_Character_InterActionGathering_All == nil then
    return
  end
  PaGlobal_InteractionGathering_All:prepareClose()
end
function PaGlobal_InteractionGathering_All_ButtonPushed(keycode, key)
  local self = PaGlobal_InteractionGathering_All
  if self == nil then
    _PA_ASSERT(false, "íŒ¨ë„ì´ ì¡´ì¬í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤!! : PaGlobal_InteractionGathering_All")
    return
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return
  end
  DragManager:clearInfo()
  if keycode ~= CppEnums.ActionInputType.ActionInputType_Interaction then
    setUiInputProcessed(keycode)
  end
  if FGlobal_GetIsCutScenePlay() == true and FGlobal_GetIsCutScenePlayerControlMode() == false then
    return
  end
  preUIMode = GetUIMode()
  if PaGlobal_SkillGroup ~= nil and Panel_Window_SkillGroup:GetShow() == true and PaGlobal_SkillGroup._isWindow == false then
    return
  end
  local actorWrapper = interaction_getInteractable()
  if actorWrapper == nil then
    return
  end
  local characterStaticStatusWrapper = actorWrapper:getCharacterStaticStatusWrapper()
  if characterStaticStatusWrapper == nil then
    return
  end
  if characterStaticStatusWrapper:isAttrSet(__eHoeMiniGameCharacter) == true then
    local playerWp = selfPlayer:getWp()
    local needWp = ToClient_CheckMiniGameFindWp(characterStaticStatusWrapper:getCharacterKey())
    if playerWp < needWp then
      local charName = characterStaticStatusWrapper:getName()
      local failMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAMEFIND_WPHELP", "name", charName)
      Proc_ShowMessage_Ack(failMsg)
      return
    end
    if getWeightLevel() >= __eWeightLevel3 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoItemIsTooHeavy"))
      return
    end
  end
  if keycode == CppEnums.ActionInputType.ActionInputType_Interaction then
    if self._activatedIconCount <= 0 then
      return
    end
    local targetIconToolType = self._activatedIconList[0]
    if targetIconToolType == nil then
      return
    end
    if key ~= nil and key ~= targetIconToolType then
      return
    end
    local targetIconUIInfo = self._collectTypeUIInfo[targetIconToolType]
    if targetIconUIInfo == nil then
      return
    end
    if targetIconUIInfo._isAble == false then
      return
    end
    ToClient_SetCollectToolTypeUnionBelt(targetIconToolType)
    interaction_processInteraction(CppEnums.InteractionType.InteractionType_Collect)
  elseif keycode == __eUiInputType_Interaction0 then
    PaGlobal_InteractionGathering_All_RotateButton(true)
    return
  elseif keycode == __eUiInputType_Interaction1 then
    PaGlobal_InteractionGathering_All_RotateButton(false)
    return
  else
    return
  end
end
function PaGlobal_InteractionGathering_All_RotateButton(doClockWise)
  if UI_Character_InterActionGathering_All == nil then
    return
  end
  PaGlobal_InteractionGathering_All:rotateButton(doClockWise)
end
