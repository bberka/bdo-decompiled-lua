function HandleEventLUp_CommandGuide_ShowGuide()
  if nil == Panel_CommandGuide then
    return
  end
  local isShowToggle = PaGlobal_CommandGuide._ui._btn_showToggle:IsCheck()
  PaGlobal_CommandGuide._ui._stc_commandBg:SetShow(not isShowToggle)
end
function PaGlobal_CommandGuide_Show(isShow, showType)
  if nil == Panel_CommandGuide then
    return
  end
  if nil == isShow then
    UI_ASSERT_NAME(nil ~= isShow, "CommandGuide ì¼œê³ /ë„ê³  í•´ì¤„ë¼ëŠ”ë° íŒŒëŒê°’ì´ ì—†ë‹¤!!!!! ì´ëŸ¬ë©´ ì•ˆë¼!", "ì •íƒœê³¤")
  end
  if nil == showType then
    UI_ASSERT_NAME(nil ~= showType, "CommandGuide ì¼œê³ /ë„ê³  í•´ì¤„ë¼ëŠ”ë° íŒŒëŒê°’ì´ ì—†ë‹¤!!!!! ì´ëŸ¬ë©´ ì•ˆë¼!", "ì •íƒœê³¤")
  end
  PaGlobal_CommandGuide._isShowType = showType
  if true == isShow then
    PaGlobal_CommandGuide:prepareOpen()
    PaGlobal_CommandGuide:setData()
  else
    PaGlobal_CommandGuide:close()
  end
end
