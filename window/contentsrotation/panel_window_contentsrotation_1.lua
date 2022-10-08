function PaGlobal_ContentsRotation:initialize()
  self:createControls()
  self:validate()
  self:registerEvent()
  self._initialize = true
end
function PaGlobal_ContentsRotation:clear()
  self._function = nil
end
function PaGlobal_ContentsRotation:prepareOpen()
  self:open()
end
function PaGlobal_ContentsRotation:open()
  if false == self._initialize then
    return
  end
  if false == _ContentsGroup_ContentsRotation then
    return
  end
  self:clear()
  if false == self:update() then
    return
  end
  Panel_Window_ContentsRotation:SetShow(true)
end
function PaGlobal_ContentsRotation:prepareClose()
  self:close()
end
function PaGlobal_ContentsRotation:close()
  Panel_Window_ContentsRotation:SetShow(false)
end
function PaGlobal_ContentsRotation:validate()
  self._ui._stc_titleBG:isValidate()
  self._ui._stc_mainBG:isValidate()
  self._ui._stc_contentsInfo:isValidate()
  self._ui._btn_start:isValidate()
  self._ui._stc_rewardBG:isValidate()
end
function PaGlobal_ContentsRotation:registerEvent()
  self._ui._btn_start:addInputEvent("Mouse_LUp", "PaGlobal_ContentsRotation:openContents()")
  registerEvent("FromClient_updateInstanceFieldRotation", "FromClient_updateInstanceFieldRotation")
end
function PaGlobal_ContentsRotation:createControls()
  self._ui._stc_contentsInfo = UI.getChildControl(self._ui._stc_mainBG, "Static_ContentInfo")
  self._ui._btn_start = UI.getChildControl(self._ui._stc_mainBG, "Button_Start")
  self._ui._stc_rewardBG = UI.getChildControl(self._ui._stc_mainBG, "Static_Reward_BG")
end
function PaGlobal_ContentsRotation:openContents()
  if nil ~= self._function then
    self._function()
    self:prepareClose()
  else
    Proc_ShowMessage_Ack("@@ì»¨í…ì¸ ê°€ ì„ íƒë˜ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
  end
end
function PaGlobal_ContentsRotation:update()
  local rotKey = ToClient_getInstanceFieldRotationKey()
  local rotWrapper = ToClient_getInstanceFieldRotationWrapper(rotKey)
  if nil == rotWrapper then
    return
  end
  local instanceFieldKey = rotWrapper:getInstanceFieldKey()
  local instanceFieldMapKey = rotWrapper:getInstanceFieldMapKey()
  local itemEnchantKey = rotWrapper:getItemEnchantKey()
  local itemCount_s64 = rotWrapper:getItemCount()
  local uiTexturePath = rotWrapper:getUITexturePath()
  local isOpenSavage = rotWrapper:isSavageFieldOpen()
  local isOpenPVEArena = rotWrapper:isPVEArenaOpen()
  self._function = nil
  if true == isOpenSavage then
    self._function = HandleEventLUp_MenuRemake_Wave
  elseif true == isOpenPVEArena then
    self._function = HandleEventLUp_MenuRemake_ImmortalHell
  else
    local contentsType = instanceFieldKey:getType()
    if __eInstanceContentsType_SavageDefence == contentsType then
      self._function = HandleEventLUp_MenuRemake_InfinityDefence
    elseif __eInstanceContentsType_HorseRacing == contentsType then
      self._function = FromClient_HorseRacingEnter_Open
    end
  end
  _PA_ASSERT(nil ~= self._function, "ì»¨í…ì¸ ë¡œí…Œì´ì…˜ í•¨ìˆ˜ê°€ nil ì…ë‹ˆë‹¤.")
end
