function PaGlobal_StaminaAuto:initialize()
  if self._initialize == true then
    return
  end
  self._ui.stc_BG = UI.getChildControl(Panel_Stamina_Auto, "Static_Gradation_BG")
  self._ui.stc_Design = UI.getChildControl(Panel_Stamina_Auto, "Static_Gradation_Design")
  self._ui.chk_AutoRun = UI.getChildControl(Panel_Stamina_Auto, "CheckButton_AutoRun")
  self._ui.txt_AutoRunEnable = UI.getChildControl(self._ui.chk_AutoRun, "StaticText_AutoRunEnable")
  self._ui.stc_Dongle = UI.getChildControl(Panel_Stamina_Auto, "Static_Sequence_Dongle")
  self:isValidate()
  self:registerEvent()
  self._initialize = true
end
function PaGlobal_StaminaAuto:prepareOpen()
  if Panel_Stamina_Auto == nil then
    return
  end
  local savedAutoRunCheck = false
  if nil ~= ToClient_getGameUIManagerWrapper() then
    savedAutoRunCheck = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(__eStaminaAutoRun)
  end
  self._ui.chk_AutoRun:SetCheck(savedAutoRunCheck)
  self._isOpening = true
  self:computePos()
  self:open()
end
function PaGlobal_StaminaAuto:open()
  if Panel_Stamina_Auto == nil then
    return
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return
  end
  if selfPlayerWrapper:get():isVehicleDriver() == true then
    return
  end
  Panel_Stamina_Auto:SetShow(true)
  Panel_Stamina_Auto:SetAlphaChild(0)
  self:AutoRunStartOrStop()
end
function PaGlobal_StaminaAuto:prepareClose()
  if Panel_Stamina_Auto == nil then
    return
  end
  self._isOpening = false
  self:close()
end
function PaGlobal_StaminaAuto:close()
  if Panel_Stamina_Auto == nil then
    return
  end
end
function PaGlobal_StaminaAuto:isValidate()
  if Panel_Stamina_Auto == nil then
    return
  end
  self._ui.stc_BG:isValidate()
  self._ui.stc_Design:isValidate()
  self._ui.chk_AutoRun:isValidate()
  self._ui.stc_Dongle:isValidate()
  self._ui.txt_AutoRunEnable:isValidate()
end
function PaGlobal_StaminaAuto:registerEvent()
  if Panel_Stamina_Auto == nil then
    return
  end
  self._ui.chk_AutoRun:SetCheck(true)
  self._ui.chk_AutoRun:addInputEvent("Mouse_LUp", "HandleEventLUp_AutoRunStartOrStop()")
  Panel_Stamina_Auto:RegisterUpdateFunc("Stamina_Auto_Update")
end
function PaGlobal_StaminaAuto:updateAlpha(fadeAlpha)
  Panel_Stamina_Auto:SetAlphaChild(fadeAlpha)
  self._ui.txt_AutoRunEnable:SetFontAlpha(fadeAlpha)
end
function Stamina_Auto_Update(deltaTime)
  if PaGlobal_StaminaAuto._isOpening == true then
    PaGlobal_StaminaAuto._fadeAlpha = PaGlobal_StaminaAuto._fadeAlpha + deltaTime
    if PaGlobal_StaminaAuto._fadeAlpha > 1 then
      PaGlobal_StaminaAuto._fadeAlpha = 1
    end
  else
    PaGlobal_StaminaAuto._fadeAlpha = PaGlobal_StaminaAuto._fadeAlpha - deltaTime
    if PaGlobal_StaminaAuto._fadeAlpha < 0 then
      PaGlobal_StaminaAuto._fadeAlpha = 0
      Panel_Stamina_Auto:SetShow(false)
    end
  end
  PaGlobal_StaminaAuto:updateAlpha(PaGlobal_StaminaAuto._fadeAlpha)
end
function PaGlobal_StaminaAuto:AutoRunStartOrStop()
  if Panel_Stamina_Auto == nil then
    return
  end
  local isChkAutoRun = PaGlobal_StaminaAuto._ui.chk_AutoRun:IsCheck()
  if isChkAutoRun == true then
    PaGlobal_StaminaAuto._ui.txt_AutoRunEnable:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUTO_RUN_DESC2"))
    PaGlobal_StaminaAuto._ui.stc_Dongle:SetShow(true)
  else
    PaGlobal_StaminaAuto._ui.txt_AutoRunEnable:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUTO_RUN_DESC1"))
    PaGlobal_StaminaAuto._ui.stc_Dongle:SetShow(false)
  end
  ToClient_SetCanMoveFast(isChkAutoRun)
  if nil ~= ToClient_getGameUIManagerWrapper() then
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListBool(__eStaminaAutoRun, isChkAutoRun, CppEnums.VariableStorageType.eVariableStorageType_Character)
  end
end
function PaGlobal_StaminaAuto:computePos()
  if Panel_Stamina_Auto == nil or Panel_Stamina == nil then
    return
  end
  local posX = Panel_Stamina:GetPosX() + Panel_Stamina:GetSizeX() * 0,5 - Panel_Stamina_Auto:GetSizeX() * 0,5
  local posY = Panel_Stamina:GetPosY() - Panel_Stamina_Auto:GetSizeY() - 20
  Panel_Stamina_Auto:SetPosXY(posX, posY)
end
function FromClient_SetStaminaAuto(isOpen)
  if isOpen == true then
    PaGlobal_StaminaAuto:prepareOpen()
  else
    PaGlobal_StaminaAuto:prepareClose()
  end
end
registerEvent("FromClient_SetStaminaAuto", "FromClient_SetStaminaAuto")
