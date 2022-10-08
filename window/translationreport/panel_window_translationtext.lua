Panel_Window_TranslationText:SetShow(false)
PaGlobal_TranslationText = {
  btn_Close = UI.getChildControl(Panel_Window_TranslationText, "Button_Win_Close"),
  desc1 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Desc1"),
  desc2 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Desc2"),
  desc3 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Desc3"),
  num1 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Number1"),
  num2 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Number2"),
  num3 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_Number3"),
  nonBG1 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_NonBG1"),
  nonBG2 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_NonBG2"),
  nonBG3 = UI.getChildControl(Panel_Window_TranslationText, "StaticText_NonBG3"),
  tooltipbg = UI.getChildControl(Panel_Window_TranslationText, "Static_ItemTooltip")
}
PaGlobal_TranslationText.itemdesc = UI.getChildControl(PaGlobal_TranslationText.tooltipbg, "StaticText_ItemDesc")
function PaGlobal_TranslationText:Initialize()
  self.btn_Close:addInputEvent("Mouse_LUp", "PaGlobal_TranslationText:MouseActionClick()")
  self.desc1:SetTextMode(__eTextMode_AutoWrap)
  self.desc1:SetText("BaseFont_8 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.desc2:SetTextMode(__eTextMode_AutoWrap)
  self.desc2:SetText("BaseFont_10 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.desc3:SetTextMode(__eTextMode_AutoWrap)
  self.desc3:SetText("BaseFont_12 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.nonBG1:SetTextMode(__eTextMode_AutoWrap)
  self.nonBG1:SetText("BaseFont_8 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.nonBG2:SetTextMode(__eTextMode_AutoWrap)
  self.nonBG2:SetText("BaseFont_10 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.nonBG3:SetTextMode(__eTextMode_AutoWrap)
  self.nonBG3:SetText("BaseFont_12 : à¸à¸µà¹ˆ à¹€à¸¥à¸µà¹‰à¸¢à¸‡ à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸Šà¸±à¹‰à¸™ à¸Šà¸µà¹‰")
  self.num1:SetTextMode(__eTextMode_AutoWrap)
  self.num1:SetText("BaseFont_8 : 10,234,567,890")
  self.num2:SetTextMode(__eTextMode_AutoWrap)
  self.num2:SetText("BaseFont_10 : 10,234,567,890")
  self.num3:SetTextMode(__eTextMode_AutoWrap)
  self.num3:SetText("BaseFont_12 : 10,234,567,890")
  self.itemdesc:SetTextMode(__eTextMode_AutoWrap)
  self.itemdesc:SetText("<PAColor0xff748cab>- ê·€ì†ë¨(ê°€ë¬¸)<PAOldColor>\n- ê°œì¸ ê±°ë˜ ë¶ˆê°€\n\n- ì›Œë¦¬ì–´, ë ˆì¸ì €, ì†Œì„œëŸ¬, ìì´ì–¸íŠ¸, ê¸ˆìˆ˜ë‘, ë¬´ì‚¬, ë§¤í™”, ë°œí‚¤ë¦¬, ì¿ ë…¸ì´ì¹˜, ë‹Œì, ë‹¤í¬ë‚˜ì´íŠ¸, ìœ„ìë“œ, ìœ„ì¹˜ ì „ìš©\n\n<PAColor0xffc4a68a>- ì„¤ëª… : ëª¨í—˜ê°€ì˜ ì™¸í˜•ì„ ê¾¸ë©°ì£¼ëŠ” ë¬´ê¸°, ë³´ì¡° ë¬´ê¸°, ì˜ìƒì´ ë‹´ê²¨ ìˆëŠ” ìƒìë¥¼ íšë“í•  ìˆ˜ ìˆë‹¤. ë§ˆìš°ìŠ¤ ìš°í´ë¦­ìœ¼ë¡œ ì‚¬ìš© ì‹œ ì§ì—…ì— ë§ëŠ” ì˜ìƒì„ íšë“í•  ìˆ˜ ìˆë‹¤.<PAOldColor>\n\n- íŒë§¤ê°€ : íŒë§¤ ë¶ˆê°€")
end
function PaGlobal_TranslationText:Update()
  self.desc2:SetPosY(self.desc1:GetPosY() + self.desc1:GetTextSizeY() + 10)
  self.desc3:SetPosY(self.desc2:GetPosY() + self.desc2:GetTextSizeY() + 10)
  self.nonBG2:SetPosY(self.nonBG1:GetPosY() + self.nonBG1:GetTextSizeY() + 10)
  self.nonBG3:SetPosY(self.nonBG2:GetPosY() + self.nonBG2:GetTextSizeY() + 10)
  self.num2:SetPosY(self.num1:GetPosY() + self.num1:GetTextSizeY() + 10)
  self.num3:SetPosY(self.num2:GetPosY() + self.num2:GetTextSizeY() + 10)
end
function PaGlobal_TranslationText:Open()
  Panel_Window_TranslationText:SetShow(true)
  Panel_Window_TranslationText:ComputePos()
  PaGlobal_TranslationText:Update()
end
function PaGlobal_TranslationText:MouseActionClick()
  Panel_Window_TranslationText:SetShow(false)
end
PaGlobal_TranslationText:Initialize()
