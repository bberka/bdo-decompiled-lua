local functor = {}
function FromClient_ActionChartEvent(actorKeyRaw, eventNo, isSelfPlayer, param, stringKey)
  local aFunction = functor[eventNo]
  if nil ~= aFunction then
    aFunction(actorKeyRaw, isSelfPlayer, param, stringKey)
  end
end
function ActionChartEventBindFunction(eventNo, insertFunctor)
  if nil ~= functor[eventNo] then
    _PA_ASSERT(false, "ì˜ëª»ëœ ActionChartì´ë²¤íŠ¸ë¥¼ ì‚½ì…í•˜ì˜€ìŠµë‹ˆë‹¤. ActionChartEventBindFunction í•¨ìˆ˜ì˜ ì²«ë²ˆì§¸ ì¸ìë¥¼ í™•ì¸í•´ ì£¼ì„¸ìš”.")
  else
    functor[eventNo] = insertFunctor
  end
end
registerEvent("FromClient_ActionChartEvent", "FromClient_ActionChartEvent")
