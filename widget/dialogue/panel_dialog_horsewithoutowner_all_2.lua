function HandleEventLUp_HorseWithoutOwner_Summon(characterKey)
  if Panel_Dialog_HorseWithoutOwner_All == nil then
    return
  end
  if _ContentsGroup_MasterlessHorse == false then
    return
  end
  if Panel_Dialog_HorseWithoutOwner_All:GetShow() == false then
    return
  end
  ToClient_SummonMasterLessHorse(characterKey)
end
function PaGlobalFunc_Panel_Dialog_HorseWithoutOwner_All_Open()
  PaGlobal_HorseWithoutOwner:prepareOpen()
end
function PaGlobalFunc_Panel_Dialog_HorseWithoutOwner_All_Close()
  PaGlobal_HorseWithoutOwner:prepareClose()
end
