function PaGlobalFunc_BlooaAltarRetry_RetryCheck(isRetry)
  if true == isRetry then
    if true == ToClient_HasInstanceSavageDefenceReGameItem() then
      ToClient_SetSubScriptReGameForInstanceField(true)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoItemNotExist"))
    end
  elseif false == isRetry then
    ToClient_SetSubScriptReGameForInstanceField(false)
  else
    _PA_LOG("ë¬¸ì¥í™˜", "PaGlobalFunc_BlooaAltarRetry_RetryCheckì— ëŒ€í•œ ì˜ëª»ëœ ì ‘ê·¼ì…ë‹ˆë‹¤.")
  end
end
