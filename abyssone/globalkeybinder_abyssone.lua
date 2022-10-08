local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UIMode = Defines.UIMode
local fastPinDelta = 0
function CommonWindowFunction(uiInputType, Function, param)
  if true == GlobalKeyBinder_CheckCustomKeyPressed(uiInputType) then
    Function(param)
    return true
  end
  return false
end
function PaGlobal_GlobalKeyBinder.Process_GameMode()
end
function PaGlobal_GlobalKeyBinder.Process_Normal(deltaTime)
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_CommonWindow(deltaTime)
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PaGlobal_GameExit_All_ShowToggle(false)
    return
  end
  if CommonWindowFunction(__eUiInputType_Chat, Process_UIMode_CommonWindow_Chatting) then
    return
  end
  if Panel_Interaction ~= nil and Panel_Interaction:IsShow() == true or Panel_Widget_PanelInteraction_Renew ~= nil and Panel_Widget_PanelInteraction_Renew:IsShow() == true then
    local keyCode
    if _ContentsGroup_UsePadSnapping and (isPadInputIn() or true == ToClient_IsRemoteControlMode()) then
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode_Xbox(deltaTime)
    else
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode()
    end
    if nil ~= keyCode then
      Interaction_ExecuteByKeyMapping(keyCode)
    end
  elseif UI_Character_InterActionGathering_All ~= nil and UI_Character_InterActionGathering_All:GetShow() == true then
    local keyCode
    if _ContentsGroup_UsePadSnapping == true and (isPadInputIn() == true or ToClient_IsRemoteControlMode() == true) then
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode_Xbox(deltaTime)
    else
      keyCode = FGlobal_Interaction_CheckAndGetPressedKeyCode()
    end
    if keyCode ~= nil then
      PaGlobal_InteractionGathering_All_ButtonPushed(keyCode, nil)
    end
  end
  if true == _ContentsGroup_NewCloseManager then
    close_escape_WindowPanelList()
  else
    Toclient_processCheckEscapeKey()
  end
end
function PaGlobal_GlobalKeyBinder.Process_ChattingInputMode()
  uiEdit = GetFocusEdit()
  if nil == uiEdit then
    return false
  end
  if ChatInput_CheckCurrentUiEdit(uiEdit) then
    if true == _ContentsGroup_RenewUI_Chatting then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        Input_ChattingInfo_OnPadB()
      elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) then
        PaGlobalFunc_ChattingInfo_CheckRemoveLinkedItem()
      end
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      if true == _ContentsGroup_isConsoleTest then
        if true == _ContentsGroup_RenewUI_Chatting then
          PaGlobalFunc_ChattingInfo_PressedEnter()
        else
          ChatInput_PressedEnter()
        end
      end
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_UP) then
      if ToClient_isComposition() then
        return
      end
      if true == _ContentsGroup_isConsoleTest then
      else
        ChatInput_PressedUp()
      end
    elseif isKeyPressed(VCK.KeyCode_MENU) then
      ChatInput_CheckReservedKey()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_TAB) then
      if isGameTypeKorea() then
        ChatInput_ChangeTypeByTab()
      end
      ChatInput_ChangeInputFocus()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      if ToClient_isComposition() then
        return
      end
      ChatInput_CancelAction()
      ChatInput_CancelMessage()
      ChatInput_Close()
      ClearFocusEdit()
      if PaGlobal_AddFriend_All_Close ~= nil then
        sddPaGlobal_AddFriend_All_Close()
      end
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      ChatInput_CheckInstantCommand()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) or isKeyPressed(VCK.KeyCode_BACK) then
      ChatInput_CheckRemoveLinkedItem()
    elseif GlobalKeyBinder_CheckCustomKeyPressed(__eUiInputType_ChatTabNext) then
      moveChatTab(true)
    elseif GlobalKeyBinder_CheckCustomKeyPressed(__eUiInputType_ChatTabPrev) then
      moveChatTab(false)
    end
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    ClearFocusEdit()
  end
  return false
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_NpcDialog(deltaTime)
  if false == _ContentsGroup_RenewUI_Dailog then
    if nil ~= HandleEventKeyBoard_DialogManager_All_KeyPushCheck and true == HandleEventKeyBoard_DialogManager_All_KeyPushCheck() then
      return
    end
    if keyCustom_IsDownOnce_Action(CppEnums.ActionInputType.ActionInputType_Interaction) then
      if nil ~= PaGlobalFunc_NPCShop_ALL_GetShow then
        if true == PaGlobalFunc_NPCShop_ALL_GetShow() then
          return
        end
      elseif nil ~= Panel_Window_NpcShop and true == Panel_Window_NpcShop:GetShow() then
        return
      end
      if nil ~= Panel_CreateGuild and Panel_CreateGuild:GetShow() then
        return
      end
      if nil ~= Panel_GuildHouse_Auction_All and Panel_GuildHouse_Auction_All:GetShow() then
        return
      end
      if Panel_DetectPlayer ~= nil and Panel_DetectPlayer:GetShow() then
        return
      end
      if nil ~= Panel_Atoraxion_Enter and true == Panel_Atoraxion_Enter:GetShow() then
        return
      end
      if nil ~= Panel_Atoraxion_Select and true == Panel_Atoraxion_Select:GetShow() then
        return
      end
      if nil ~= Panel_BatchSummonMonster and true == Panel_BatchSummonMonster:GetShow() then
        return
      end
      local btn_continue = UI.getChildControl(Panel_Npc_Dialog_All, "Button_Continue")
      local btn_next = UI.getChildControl(Panel_Npc_Dialog_All, "Button_Next")
      if true == PaGlobalFunc_DialogMain_All_GetShowNextBtn() then
        HandleEventLUp_DialogMain_All_NextClick()
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      elseif true == PaGlobalFunc_DialogMain_All_GetShowContinueBtn() then
        HandleEventLUp_DialogMain_All_ContinueClick()
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      elseif nil ~= Panel_Dialog_Quest_All and true == Panel_Dialog_Quest_All:GetShow() then
        HandleEventEnter_DialogQuest_All_SelectConfirmReward()
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      elseif true == PaGlobalFunc_DialogKeyManager_All_IsShowSpaceBarIcon() and nil ~= PaGlobal_DialogKeyManager_All._targetPanel and true == PaGlobal_DialogKeyManager_All._targetPanel:GetShow() then
        if true == HandleEventKeyBoard_DialogManager_All_KeyPushCheck() then
          audioPostEvent_SystemUi(0, 0)
          _AudioPostEvent_SystemUiForXBOX(50, 1)
        end
      elseif true == PaGlobalFunc_DialogMain_All_IsDialogNewMainQuest() and true == PaGlobalFunc_DialogMain_All_IsFuncBtnSpaceShow() then
        HandleEventLUp_DialogMain_All_FuncButton(PaGlobal_DialogMain_All._dialogIndex.MAINQUEST)
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      elseif true == PaGlobalFunc_DialogMain_All_IsDialogNewQuest() and true == PaGlobalFunc_DialogMain_All_IsFuncBtnSpaceShow() then
        HandleEventLUp_DialogMain_All_FuncButton(PaGlobal_DialogMain_All._dialogIndex.QUEST)
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      elseif true == PaGlobalFunc_DialogMain_All_IsDialogTalk() and true == PaGlobalFunc_DialogMain_All_IsFuncBtnSpaceShow() then
        HandleEventLUp_DialogMain_All_FuncButton(PaGlobal_DialogMain_All._dialogIndex.TALK)
        audioPostEvent_SystemUi(0, 0)
        _AudioPostEvent_SystemUiForXBOX(50, 1)
      end
      return
    end
    if false == PaGlobalFunc_DialogMain_IsSearchMode() then
      local ACT = CppEnums.ActionInputType
      for idx = 0, #PaGlobal_DialogMain_All._HOTKEY do
        if ACT.ActionInputType_CrouchOrSkill == PaGlobal_DialogMain_All._HOTKEY[idx].key and true == keyCustom_IsUp_Action(ACT.ActionInputType_CrouchOrSkill) then
          HandleEventKeyUp_DialogMain_All_HotKeyClick(idx)
          return
        elseif ACT.ActionInputType_MoveFront == PaGlobal_DialogMain_All._HOTKEY[idx].key and true == keyCustom_IsUp_Action(ACT.ActionInputType_MoveFront) then
          HandleEventKeyUp_DialogMain_All_HotKeyClick(idx)
          return
        elseif ACT.ActionInputType_GrabOrGuard == PaGlobal_DialogMain_All._HOTKEY[idx].key and true == keyCustom_IsUp_Action(ACT.ActionInputType_GrabOrGuard) then
          HandleEventKeyUp_DialogMain_All_HotKeyClick(idx)
          return
        elseif ACT.ActionInputType_MoveLeft == PaGlobal_DialogMain_All._HOTKEY[idx].key and true == keyCustom_IsUp_Action(ACT.ActionInputType_MoveLeft) then
          HandleEventKeyUp_DialogMain_All_HotKeyClick(idx)
          return
        end
        if nil ~= PaGlobal_DialogMain_All._HOTKEY[idx].key and false == PaGlobal_DialogMain_All._HOTKEY[idx].isActionKey and true == isKeyUpFor(PaGlobal_DialogMain_All._HOTKEY[idx].key) then
          HandleEventKeyUp_DialogMain_All_HotKeyClick(idx)
          return
        end
      end
    end
  end
  if false == _ContentsGroup_UsePadSnapping then
    if true == isKeyDown_Once(VCK.KeyCode_TAB) then
      HandleEventLUp_DialogMain_All_CheckVoiceAutoContinue(true)
    end
  elseif true == isPadDown(__eJoyPadInputType_X) then
    HandleEventLUp_DialogMain_All_CheckVoiceAutoContinue(true)
  end
  if true == GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_BACK) and false == _ContentsGroup_RenewUI and true == HandleEventKeyBoard_DialogMain_All_BackSpaceClick() then
    HandleEventLUp_DialogMain_All_BackClick()
  end
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) and false == _ContentsGroup_RenewUI_Dailog and nil ~= Panel_Dialog_Quest_All and true == Panel_Dialog_Quest_All:GetShow() then
    HandleEventEnter_DialogQuest_All_SelectConfirmReward()
    audioPostEvent_SystemUi(0, 0)
    _AudioPostEvent_SystemUiForXBOX(50, 1)
    return
  end
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if nil ~= Panel_ProductNote and true == Panel_ProductNote:GetShow() then
      Panel_ProductNote_ShowToggle()
      return
    end
    if true == _ContentsGroup_UsePadSnapping and true == Panel_Popup_MoveItem:GetShow() then
      PopupMoveItem_Close()
      return
    end
    if true == _ContentsGroup_UsePadSnapping and true == Panel_Widget_Knowledge:GetShow() then
      PaGlobalFunc_AlchemyKnowledgeClose()
      return
    end
    if nil ~= Panel_Masterpiece_Auction_Bid_All and true == Panel_Masterpiece_Auction_Bid_All:GetShow() then
      PaGlobal_Masterpiece_Auction_Bid_All_Close()
      return
    end
    if nil ~= Panel_Masterpiece_Auction_All and Panel_Masterpiece_Auction_All:GetShow() then
      PaGlobal_Masterpiece_Auction_All_Close()
      return
    end
    if nil ~= PaGlobalFunc_ServantInventory_GetShow and true == PaGlobalFunc_ServantInventory_GetShow() and true == Panel_Window_Warehouse:GetShow() then
      ServantInventory_Close()
      return
    end
    if true == _ContentsGroup_RenewUI_SpiritEnchant then
      if nil ~= Panel_Window_StackExtraction_All and true == Panel_Window_StackExtraction_All:GetShow() then
        HandlePadEventB_SpiritEnchant_All_OnPadB()
        return
      end
      if true == Panel_Window_Socket_All:GetShow() then
        PaGlobalFunc_Socket_All_Close()
        return
      end
      if true == Panel_Window_Improvement_All:GetShow() then
        PaGlobalFunc_Improvement_All_Close()
        return
      end
    else
      if nil ~= Panel_Window_StackExtraction_All and true == Panel_Window_StackExtraction_All:GetShow() and false == PaGlobalFunc_SpiritEnchant_All_GetIsAnimating() then
        if _ContentsGroup_UsePadSnapping == true then
          HandlePadEventB_SpiritEnchant_All_OnPadB()
        else
          PaGlobalFunc_SpiritEnchant_All_Close()
        end
        return
      end
      if Panel_Window_Improvement_All ~= nil and true == Panel_Window_Improvement_All:GetShow() then
        PaGlobalFunc_Improvement_All_Close()
        return
      end
    end
    if nil ~= Panel_Window_WorkerAuction_All and true == Panel_Window_WorkerAuction_All:GetShow() then
      HandleEventLUp_WorkerAuction_All_Close()
      return
    end
    if nil ~= Panel_Window_WorkerRandomSelect_All and (true == Panel_Window_WorkerRandomSelect_All:GetShow() or true == Panel_Window_WorkerRandomSelectOption_All:GetShow()) then
      HandleEventLUp_WorkerRandomSelect_All_Close()
      return
    end
    if true == _ContentsGroup_RenewUI_Worker then
      if nil ~= Panel_Dialog_RandomWorker and true == Panel_Dialog_RandomWorker:GetShow() then
        FGlobalFunc_Close_RandomWorker()
        return
      end
      if nil ~= Panel_Dialog_WorkerContract and true == Panel_Dialog_WorkerContract:GetShow() then
        FGlobalFunc_Cancel_WorkerContract()
        return
      end
      if nil ~= Panel_Dialog_WorkerTrade_Renew and true == Panel_Dialog_WorkerTrade_Renew:GetShow() then
        FGlobal_WorkerTrade_Close()
        return
      end
    end
    if Panel_Window_TotalSearch ~= nil and PaGlobalFunc_TotalSearch_GetShow() == true then
      PaGlobalFunc_TotalSearch_Close()
      return
    elseif nil ~= Panel_Window_Warehouse and true == Panel_Window_Warehouse:GetShow() then
      PaGlobal_Warehouse_All_Close()
      return
    end
    if nil ~= PaGlobalFunc_NPCShop_ALL_GetShow then
      if true == PaGlobalFunc_NPCShop_ALL_GetShow() then
        HandleEventLUp_NPCShop_ALL_Close()
        return
      end
    elseif true == _ContentsGroup_RenewUI_NpcShop and true == PaGlobalFunc_Dialog_NPCShop_GetShow() then
      PaGlobalFunc_Dialog_NPCShop_Close()
      return
    end
    if nil ~= PaGlobalFunc_KnowledgeManage_GetShow and true == PaGlobalFunc_KnowledgeManage_GetShow() then
      PaGlobalFunc_KnowledgeManage_Close()
      return
    end
    if true == _ContentsGroup_RenewUI_Detect and true == PaGlobalFunc_DetectPlayer_GetShow() then
      PaGlobalFunc_DetectPlayer_Exit()
      return
    end
    if nil ~= PaGlobalFunc_Dialog_SkillSpecialize_GetShow and true == PaGlobalFunc_Dialog_SkillSpecialize_GetShow() then
      PaGlobalFunc_Dialog_SkillSpecialize_Close(true)
      return
    end
    if nil ~= Panel_Window_BlackSpiritAdventure and Panel_Window_BlackSpiritAdventure:GetShow() then
      BlackSpiritAd_Hide()
      return
    end
    if nil ~= PaGlobalFunc_LordMenu_GetShow and true == PaGlobalFunc_LordMenu_GetShow() then
      HandleEventLUp_LordMenu_All_Close()
      return
    end
    if nil ~= Panel_WebControl and true == Panel_WebControl:GetShow() then
      Panel_WebHelper_ShowToggle()
      return
    end
    if true == _ContentsGroup_RenewUI_Dailog or true == _ContentsGroup_UsePadSnapping then
      if true == HandlePadEventB_DailogQuest_All_OnPadB() then
        PaGlobalFunc_DialogQuest_All_Refuse()
        return
      end
    elseif nil ~= Panel_Dialog_Quest_All and true == Panel_Dialog_Quest_All:GetShow() then
      PaGlobalFunc_DialogMain_All_Close()
      return
    end
    if _ContentsGroup_UsePadSnapping and nil ~= Panel_AskKnowledge and Panel_AskKnowledge:GetShow() then
      PaCloseFunc_AskKnowlege_Close()
      return
    end
    if nil ~= Panel_Dialog_Exchange_All and true == Panel_Dialog_Exchange_All:GetShow() then
      PaGlobalFunc_DialogExchange_All_Close()
      return
    end
    if nil ~= Panel_Dialog_List_All and true == Panel_Dialog_List_All:GetShow() then
      PaGlobalFunc_DialogList_All_Close()
      return
    end
    if nil ~= Panel_SkillReinforce_All and true == Panel_SkillReinforce_All:GetShow() then
      HandleEventLUp_PaGlobal_SkillReinforce_All_Exit()
      return
    end
    if nil ~= Panel_Window_ItemMoveSet and true == Panel_Window_ItemMoveSet:GetShow() then
      PaGlobal_ItemMoveSet:prepareClose(true)
      return
    end
    if nil ~= Panel_Window_MiniGame_YachtDice and true == Panel_Window_MiniGame_YachtDice:GetShow() then
      PaGlobalFunc_MiniGame_YachtDice_Close()
      return
    end
    if nil ~= Panel_Window_OldMoonSmelting and true == Panel_Window_OldMoonSmelting:GetShow() then
      PaGlobalFunc_OldMoonSmelting_Close()
      return
    end
    if check_ShowWindow() then
      close_WindowPanelList()
      if nil ~= Panel_Dialog_Quest_All and true == Panel_Dialog_Quest_All:GetShow() then
        PaGlobalFunc_DialogMain_All_Close()
      end
    elseif nil ~= Panel_Npc_Dialog_All and true == Panel_Npc_Dialog_All:GetShow() then
      PaGlobalFunc_DialogMain_All_Close()
    end
    if false == _ContentsGroup_RenewUI_StableInfo and PaGlobal_VehicleInfo_All_Close ~= nil then
      PaGlobal_VehicleInfo_All_Close()
    elseif nil ~= PaGlobalFunc_ServantInfo_Exit then
      PaGlobalFunc_ServantInfo_Exit()
    end
    if nil ~= Panel_Window_ServantInventory then
      ServantInventory_Close()
    end
    return
  end
end
function PaGlobal_GlobalKeyBinder.Process_UIMode_GameExit(deltaTime)
  if not getEscHandle() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    if false == _ContentsGroup_RenewUI_ExitGame then
      if Panel_Window_DeliveryForGameExit ~= nil and true == Panel_Window_DeliveryForGameExit:GetShow() then
        FGlobal_DeliveryForGameExit_Show(false)
        return
      elseif nil ~= Panel_Event_100Day and true == Panel_Event_100Day:GetShow() then
        FGlobal_Event_100Day_Close()
      elseif nil ~= Panel_ChannelSelect and true == Panel_ChannelSelect:GetShow() then
        FGlobal_ChannelSelect_Hide()
      elseif nil ~= Panel_ChannelSelect_All and true == Panel_ChannelSelect_All:GetShow() then
        PaGlobalFunc_ChannelSelect_All_Close()
      elseif Panel_Window_TrayConfirm_All ~= nil and true == Panel_Window_TrayConfirm_All:GetShow() then
        PaGlobalFunc_ExitTrayConfirm_All_Close()
      else
        PaGlobal_GameExit_All_ShowToggle(false)
      end
    else
      if Panel_Window_DeliveryForGameExit ~= nil and true == Panel_Window_DeliveryForGameExit:GetShow() then
        FGlobal_DeliveryForGameExit_Show(false)
        return
      end
      if nil ~= Panel_ChannelSelect_All then
        PaGlobalFunc_ChannelSelect_All_Close()
      end
      if nil ~= Panel_Window_GameExit_All then
        HandleEventLUp_GameExit_All_Close()
        return
      elseif true == _ContentsGroup_RenewUI and true == PaGlobalFunc_GameExit_GetShow() then
        PaGlobalFunc_GameExit_SetShow(false, false)
      end
      if true == PaGlobalFunc_GameExitCharMove_GetShow() then
        PaGlobalFunc_GameExitCharMove_SetShow(false, false)
      end
    end
  end
end
