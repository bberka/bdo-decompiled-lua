function PaGlobal_MiniGame_YachtDice_Result:initialize()
  self._isConsole = true == ToClient_isConsole() or true == _ContentsGroup_UsePadSnapping
  self._ui._stc_win = UI.getChildControl(self._ui._stc_MainBg, "Static_Title_Win")
  self._ui._stc_lose = UI.getChildControl(self._ui._stc_MainBg, "Static_Title_Lose")
  self._ui._stc_tie = UI.getChildControl(self._ui._stc_MainBg, "Static_Title_Tie")
  self._ui._stc_reward = UI.getChildControl(self._ui._stc_MainBg, "Static_Reward")
  self._ui._btn_exit = UI.getChildControl(self._ui._stc_MainBg, "Button_EXIT")
  self._ui._btn_retry = UI.getChildControl(self._ui._stc_MainBg, "Button_Retry")
  self._ui._console_bg = UI.getChildControl(self._ui._stc_MainBg, "Static_KeyGuide_Bg")
  if true == self._isConsole then
    self._ui._console_bg:SetShow(true)
    self._ui._btn_retry:SetShow(false)
    self._ui._btn_exit:SetShow(false)
    self:initConsoleKeyGuide()
  else
    self._ui._console_bg:SetShow(false)
    self._ui._btn_retry:SetShow(true)
    self._ui._btn_exit:SetShow(true)
  end
  self:validate()
  self:registerEvent()
  self._initialize = true
end
function PaGlobal_MiniGame_YachtDice_Result:initConsoleKeyGuide()
  if nil == PaGlobal_MiniGame_YachtDice_Result then
    return
  end
  if false == self._isConsole then
    return
  end
  local keyGuide_retry = UI.getChildControl(self._ui._console_bg, "StaticText_Retry_ConsoleUI")
  local keyGuide_exit = UI.getChildControl(self._ui._console_bg, "StaticText_Exit_ConsoleUI")
  local keyGuides = {keyGuide_retry, keyGuide_exit}
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuides, self._ui._console_bg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
end
function PaGlobal_MiniGame_YachtDice_Result:clear()
  self._ui._stc_win:SetShow(false)
  self._ui._stc_lose:SetShow(false)
  self._ui._stc_tie:SetShow(false)
  self._ui._stc_win:EraseAllEffect()
  self._ui._stc_lose:EraseAllEffect()
  self._ui._stc_tie:EraseAllEffect()
  self._hostPoint = 0
  self._acceptorPoint = 0
end
function PaGlobal_MiniGame_YachtDice_Result:prepareOpen(hostPoint, acceptorPoint, recordType, isPvPMode)
  self:open(hostPoint, acceptorPoint, recordType, isPvPMode)
end
function PaGlobal_MiniGame_YachtDice_Result:open(hostPoint, acceptorPoint, recordType, isPvPMode)
  if false == self._initialize then
    return
  end
  self:clear()
  self:resizePanel()
  local doIgnoreRetryButton = true == isPvPMode
  if true == self._isConsole then
    local keyGuide_retry = UI.getChildControl(self._ui._console_bg, "StaticText_Retry_ConsoleUI")
    keyGuide_retry:SetShow(not doIgnoreRetryButton)
    if true == doIgnoreRetryButton then
      Panel_Widget_MiniGame_YachtDice_Result:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_MiniGame_YachtDice_Result:emptyFunc()")
    else
      Panel_Widget_MiniGame_YachtDice_Result:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_MiniGame_YachtDice_Result:retry()")
    end
  else
    self._ui._btn_retry:SetMonoTone(doIgnoreRetryButton)
    self._ui._btn_retry:SetIgnore(doIgnoreRetryButton)
  end
  if __eMiniGameRecordType_Lose == recordType then
    self._ui._stc_lose:SetShow(true)
    self._ui._stc_lose:AddEffect("fUI_Mini_Game_07A", true, 0, 0)
    audioPostEvent_SystemUi(11, 121)
  elseif __eMiniGameRecordType_Win == recordType then
    self._ui._stc_win:SetShow(true)
    self._ui._stc_win:AddEffect("fUI_Mini_Game_08A", true, 0, 0)
    audioPostEvent_SystemUi(11, 120)
  elseif __eMiniGameRecordType_Draw == recordType then
    self._ui._stc_tie:SetShow(true)
    self._ui._stc_tie:AddEffect("fUI_Mini_Game_08A", true, 0, 0)
    audioPostEvent_SystemUi(11, 121)
  else
    _PA_ASSERT(false, "ê²Œì„ê²°ê³¼ê°€ ë¹„ì •ìƒì…ë‹ˆë‹¤. ìŠ¹ë¦¬/íŒ¨ë°°/ë¬´ìŠ¹ë¶€ ì¤‘ì— ì—†ìŠµë‹ˆë‹¤. ë°œìƒì‹œ ê¼­ ì œë³´ ë¶€íƒë“œë¦½ë‹ˆë‹¤.")
  end
  self._hostPoint = hostPoint
  self._acceptorPoint = acceptorPoint
  PaGlobal_MiniGame_YachtDice:endGame()
  Panel_Widget_MiniGame_YachtDice_Result:SetShow(true)
end
function PaGlobal_MiniGame_YachtDice_Result:emptyFunc()
end
function PaGlobal_MiniGame_YachtDice_Result:prepareClose()
  self:close()
end
function PaGlobal_MiniGame_YachtDice_Result:close()
  Panel_Widget_MiniGame_YachtDice_Result:SetShow(false)
end
function PaGlobal_MiniGame_YachtDice_Result:validate()
  self._ui._stc_MainBg:isValidate()
  self._ui._stc_win:isValidate()
  self._ui._stc_lose:isValidate()
  self._ui._stc_tie:isValidate()
  self._ui._stc_reward:isValidate()
  if true == self._isConsole then
    self._ui._console_bg:isValidate()
  else
    self._ui._btn_exit:isValidate()
    self._ui._btn_retry:isValidate()
  end
end
function PaGlobal_MiniGame_YachtDice_Result:registerEvent()
  if true == self._isConsole then
    Panel_Widget_MiniGame_YachtDice_Result:registerPadEvent(__eConsoleUIPadEvent_Up_B, "PaGlobal_MiniGame_YachtDice:prepareClose()")
  else
    self._ui._btn_retry:addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_YachtDice_Result:retry()")
    self._ui._btn_exit:addInputEvent("Mouse_LUp", "PaGlobal_MiniGame_YachtDice:prepareClose()")
  end
  registerEvent("FromClient_responseYachtDiceGameStop", "FromClient_responseYachtDiceGameStop")
  registerEvent("onScreenResize", "FromClient_MiniGameYachtDice_Result_Resize")
end
function PaGlobal_MiniGame_YachtDice_Result:retry()
  self:prepareClose()
  FromClient_DialogFunctionClick_Contents_YachtDice()
end
function PaGlobal_MiniGame_YachtDice_Result:resizePanel()
  local panel = Panel_Widget_MiniGame_YachtDice_Result
  if nil == panel then
    return
  end
  if false == self._initialize then
    return
  end
  local screenSizeX = getScreenSizeX() + 10
  local screenSizeY = getScreenSizeY()
  local BgSizeY = self._ui._stc_MainBg:GetSizeY()
  local newBgPosY = screenSizeY / 2 - BgSizeY / 2
  self._ui._stc_MainBg:SetSize(screenSizeX, BgSizeY)
  self._ui._stc_MainBg:SetPosY(newBgPosY)
  panel:SetPosX(-5)
  panel:SetPosY(0)
  panel:SetSize(screenSizeX, screenSizeY)
  self._ui._stc_MainBg:ComputePos()
  self._ui._stc_win:ComputePos()
  self._ui._stc_lose:ComputePos()
  self._ui._stc_tie:ComputePos()
  self._ui._stc_reward:ComputePos()
  if true == self._isConsole then
    self._ui._console_bg:ComputePos()
  else
    self._ui._btn_retry:ComputePos()
    self._ui._btn_exit:ComputePos()
  end
end
