function PaGlobal_HorseWithoutOwner:initialize()
  if PaGlobal_HorseWithoutOwner._initialize == true then
    return
  end
  PaGlobal_HorseWithoutOwner._ui._btn_summon = UI.getChildControl(Panel_Dialog_HorseWithoutOwner_All, "Button_RentMe")
  PaGlobal_HorseWithoutOwner._ui._stc_console = UI.getChildControl(PaGlobal_HorseWithoutOwner._ui._btn_summon, "StaticText_X_ConsoleUI")
  PaGlobal_HorseWithoutOwner._isConsole = _ContentsGroup_UsePadSnapping
  PaGlobal_HorseWithoutOwner:registEventHandler()
  PaGlobal_HorseWithoutOwner:validate()
  PaGlobal_HorseWithoutOwner._initialize = true
end
function PaGlobal_HorseWithoutOwner:registEventHandler()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  PaGlobal_HorseWithoutOwner._ui._btn_summon:addInputEvent("Mouse_LUp", "HandleEventLUp_HorseWithoutOwner_Summon(31560)")
end
function PaGlobal_HorseWithoutOwner:prepareOpen()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  local talker = dialog_getTalker()
  if nil == talker then
    return
  end
  local actorKeyRaw = talker:getActorKey()
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  if ToClient_IsCanSummonMasterlessHorseNPC(actorKeyRaw) == false then
    PaGlobal_HorseWithoutOwner:prepareClose()
    return
  end
  PaGlobal_HorseWithoutOwner:resize()
  PaGlobal_HorseWithoutOwner._ui._stc_console:SetShow(PaGlobal_HorseWithoutOwner._isConsole)
  PaGlobal_HorseWithoutOwner:open()
end
function PaGlobal_HorseWithoutOwner:resize()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  Panel_Dialog_HorseWithoutOwner_All:SetPosY(Panel_Npc_Dialog_All:GetPosY() - Panel_Dialog_HorseWithoutOwner_All:GetSizeY() - PaGlobalFunc_DialogMain_All_GetContentSizeY() - 30)
end
function PaGlobal_HorseWithoutOwner:open()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  if _ContentsGroup_MasterlessHorse == false then
    return
  end
  Panel_Dialog_HorseWithoutOwner_All:SetShow(true)
end
function PaGlobal_HorseWithoutOwner:prepareClose()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  PaGlobal_HorseWithoutOwner:close()
end
function PaGlobal_HorseWithoutOwner:close()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  Panel_Dialog_HorseWithoutOwner_All:SetShow(false)
end
function PaGlobal_HorseWithoutOwner:validate()
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  PaGlobal_HorseWithoutOwner._ui._btn_summon:isValidate()
end
