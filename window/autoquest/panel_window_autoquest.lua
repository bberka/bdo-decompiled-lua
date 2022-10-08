Panel_Window_AutoQuest:SetShow(false)
PaGlobal_AutoQuest = {
  _ui = {
    _btn_BlackSpirit = UI.getChildControl(Panel_Window_AutoQuest, "Button_BlackSpiritQuest"),
    _btn_BattleQuest = UI.getChildControl(Panel_Window_AutoQuest, "Button_BattleQuest"),
    _checkBtn_Potion = UI.getChildControl(Panel_Window_AutoQuest, "CheckButton_PotionUse")
  }
}
function PaGlobal_AutoQuest:Initialize()
  self._ui._btn_BlackSpirit:addInputEvent("Mouse_LUp", "PaGlobal_AutoQuest:StartBlackSpiritQuest()")
  self._ui._btn_BattleQuest:addInputEvent("Mouse_LUp", "PaGlobal_AutoQuest:EndBlackSpiritQuest()")
end
local index = 0
function PaGlobal_AutoQuest:StartBlackSpiritQuest()
  local message = ""
  if index == 0 then
    message = "ì„±ì±„ ê±´ì„¤ ê°€ëŠ¥ ì§€ì—­ì„ ë²—ì–´ë‚¬ì–´! ëŒì•„ê°€ ë©ì¶©ì•„"
  elseif index == 1 then
    message = "í•˜ë£¨ í•œë²ˆ íŠ¹ë³„í•œ ì‹œê°„! ì§‘ì¤‘ì „íˆ¬ ã…‹"
  elseif index == 2 then
    message = "íšŒì „ ê°€ë¥´ê¸° ëŒì§„ì°Œë¥´ê¸° ê¹Šê²Œì°Œë¥´ê¸° ê°•íƒ€ ì¡ì•„ë©”ì¹˜ê¸°"
  elseif index == 3 then
    message = "ê²Œì‹œíŒ ì¼ì • ë‹¬ë ¥ ì…ì‚¬ë©´ì ‘ ì¼ì • ë¶€ì¬ì¤’ã…‡ ì•Œë¦¼"
    index = 0
  end
  FGlobal_AutoQuestBlackSpiritMessage(message)
  index = index + 1
end
function PaGlobal_AutoQuest:EndBlackSpiritQuest()
  FGlobal_EndBlackSpiritMessage()
end
PaGlobal_AutoQuest:Initialize()
