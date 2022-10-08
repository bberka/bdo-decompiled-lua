local UIGroup = Defines.UIGroup
local RenderMode = Defines.RenderMode
isLuaLoadingComplete = false
local UIFontType = ToClient_getGameOptionControllerWrapper():getUIFontSizeType()
preloadUI_cahngeUIFontSize(UIFontType)
function preLoadGameUI_PC()
  loadUI("UI_Data/Widget/NakMessage/NakMessage.XML", "Panel_NakMessage", UIGroup.PAGameUIGroup_ModalDialog, SETRENDERMODE_BITSET_ALLRENDER())
  basicLoadUI("UI_Data/Window/GameExit/Panel_Window_GameExit_All.xml", "Panel_Window_GameExit_All", UIGroup.PAGameUIGroup_WorldMap_Contents)
  loadUI("UI_Data/Window/GameExit/Panel_Window_ExitConfirm_Reboot.xml", "Panel_ExitConfirm", UIGroup.PAGameUIGroup_GameMenu, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Window/GameExit/Panel_ExitConfirm.xml", "Panel_ExitConfirm_Old", UIGroup.PAGameUIGroup_GameMenu, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Window/GameExit/Panel_Window_TrayConfirm_All.xml", "Panel_Window_TrayConfirm_All", UIGroup.PAGameUIGroup_GameMenu, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Window/Exchange/Panel_Window_ExchangeNumber_All.XML", "Panel_Window_NumberPad_All", UIGroup.PAGameUIGroup_SimpleTooltip, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Important_Notice.XML", "Panel_Important_Notice", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/UI_Window_Chat.XML", "Panel_Chat", UIGroup.PAGameUIGroup_Widget, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Widget/Chatting/UI_Window_ChatOption.XML", "Panel_ChatOption", UIGroup.PAGameUIGroup_Windows, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Widget/Chatting/UI_Window_Chatting_Input.XML", "Panel_Chatting_Input", UIGroup.PAGameUIGroup_ModalDialog, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Filter.XML", "Panel_Chatting_Filter", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Macro.XML", "Panel_Chatting_Macro", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chat_SocialMenu.XML", "Panel_Chat_SocialMenu", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chat_Emoticon.XML", "Panel_Chat_Emoticon", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chat_SubMenu.XML", "Panel_Chat_SubMenu", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Block_GoldSeller.XML", "Panel_Chatting_Block_GoldSeller", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Color.XML", "Panel_Chatting_Color", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/Chatting/Panel_Window_Join_ChannelChat.XML", "Panel_Window_ChannelChat", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/Chatting/Panel_Window_ChannelChat_Wait.XML", "Panel_Widget_ChannelChat_Loading", UIGroup.PAGameUIGroup_ModalDialog, SETRENDERMODE_BITSET_ALLRENDER())
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_SimpleTooltip)
  basicLoadUI("UI_Data/Widget/GameTips/UI_Widget_GameTips.XML", "Panel_GameTips", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/GameTips/UI_Widget_GameTipsMask.XML", "Panel_GameTipMask", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/GameTips/UI_Window_GameTips.XML", "Panel_Window_GameTips", UIGroup.PAGameUIGroup_WorldMap_Contents)
  loadUI("UI_Data/Window/ChangeName/Panel_Window_ChangeNickname_All.XML", "Panel_Change_Nickname_All", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/ChangeName/Panel_NameSwapExchange.XML", "Panel_ExchangeNickname", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_ChatOption_All then
    loadUI("UI_Data/Widget/Chatting/Panel_Window_ChatOption_All.XML", "Panel_Window_ChatOption_All", UIGroup.PAGameUIGroup_Windows, SETRENDERMODE_BITSET_ALLRENDER())
    loadUI("UI_Data/Widget/Chatting/Panel_Window_Chatting_Color_All.XML", "Panel_Window_Chatting_Color_All", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
  end
  loadUI("UI_Data/Widget/UIcontrol/Panel_OnlyPerframeUsed.XML", "Panel_OnlyPerframeUsed", UIGroup.PAGameUIGroup_Widget, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Widget/Region/Region_AbyssOne.XML", "Panel_AbyssOne_Enter", UIGroup.PAGameUIGroup_Windows, SETRENDERMODE_BITSET_ALLRENDER())
  loadUI("UI_Data/Widget/AbyssOne/Panel_AbyssOne_DungeonInfo.XML", "Panel_Window_AbyssOneInfo", UIGroup.PAGameUIGroup_Windows, SETRENDERMODE_BITSET_ALLRENDER())
  basicLoadUI("UI_Data/Widget/AbyssOne/Panel_AbyssOne_Nak.XML", "Panel_AbyssOne_Nak", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/Window/AbyssOne/Panel_DeadMessage_A1.XML", "Panel_AbyssOne_Resurrection", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/Window/MessageBox/Panel_Window_MessageBox_All.XML", "Panel_Window_MessageBox_All", UIGroup.PAGameUIGroup_ModalDialog, SETRENDERMODE_BITSET_ALLRENDER())
  basicLoadUI("UI_Data/Widget/Interaction/UI_Character_InterAction.XML", "Panel_Interaction", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Interaction/UI_Character_InterAction_Gathering.XML", "UI_Character_InterActionGathering_All", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Interaction/Panel_Interaction_House.XML", "Panel_Interaction_House", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_SelfPlayer_New.XML", "Panel_Copy_SelfPlayer", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_OtherPlayer_New.XML", "Panel_Copy_OtherPlayer", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Vehicle_New.XML", "Panel_Copy_Vehicle", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Npc_New.XML", "Panel_Copy_Npc", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Monster_New.XML", "Panel_Copy_Monster", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_HouseHold_New.XML", "Panel_Copy_HouseHold", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Installation_New.XML", "Panel_Copy_Installation", UIGroup.PAGameUIGroup_MainUI)
  loadUI("UI_Data/Widget/Dialogue/UI_Win_Npc_Dialog_All.xml", "Panel_Npc_Dialog_All", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit,
    RenderMode.eRenderMode_Production
  }))
  loadUI("UI_Data/Widget/Dialogue/Panel_Dialog_ButtonList_All.XML", "Panel_Dialog_List_All", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit,
    RenderMode.eRenderMode_Production
  }))
  loadUI("UI_Data/Widget/Dialogue/Panel_Dialog_Quest_Reward_All.xml", "Panel_Dialog_Quest_All", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit,
    RenderMode.eRenderMode_Production
  }))
  loadUI("UI_Data/Widget/Dialogue/Panel_Dialog_Exchange_All.XML", "Panel_Dialog_Exchange_All", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit,
    RenderMode.eRenderMode_Production
  }))
  loadUI("UI_Data/Widget/Dialogue/Dialog_Itemtake_ALL.xml", "Panel_Dialogue_Itemtake_All", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/Panel_Dialog_NPCShop_All.xml", "Panel_Dialog_NPCShop_All", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item.XML", "Panel_Tooltip_Item", UIGroup.PAGameUIGroup_SimpleTooltip, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_SkillWindow
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItem.XML", "Panel_Tooltip_Item_chattingLinkedItem", UIGroup.PAGameUIGroup_SimpleTooltip, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_SkillWindow
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItemClick.XML", "Panel_Tooltip_Item_chattingLinkedItemClick", UIGroup.PAGameUIGroup_SimpleTooltip, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_SkillWindow
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_equipped.XML", "Panel_Tooltip_Item_equipped", UIGroup.PAGameUIGroup_SimpleTooltip, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_SkillWindow
  }))
  loadUI("UI_Data/Window/Cutscene/Panel_CutsceneMovie.XML", "Panel_Cutscene", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_CutScene,
    RenderMode.eRenderMode_GroupCamera
  }))
  loadUI("UI_Data/Window/Cutscene/Panel_Window_CutSceneSkip.XML", "Panel_Window_CutSceneSkip", UIGroup.PAGameUIGroup_IntroMovie, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_GroupCamera,
    RenderMode.eRenderMode_Production,
    RenderMode.eRenderMode_CutScene
  }))
  loadUI("UI_Data/Window/Cutscene/Panel_Widget_CutScene_CC.XML", "Panel_Window_CutSceneScript", UIGroup.PAGameUIGroup_FadeScreen, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_GroupCamera,
    RenderMode.eRenderMode_Production,
    RenderMode.eRenderMode_CutScene
  }))
  loadUI("UI_Data/Widget/MainStatus/Panel_Widget_HpMpBar_Remaster_forCutscene.XML", "Panel_Sequence_HpMpBar", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_CutScene,
    RenderMode.eRenderMode_GroupCamera
  }))
  loadUI("UI_Data/Widget/Stamina/Stamina_forCutscene.XML", "Panel_Sequence_Stamina", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_CutScene,
    RenderMode.eRenderMode_GroupCamera
  }))
  loadUI("UI_Data/Widget/MainStatus/Panel_Widget_Adrenallin_Remaster_forCutscene.XML", "Panel_Sequence_Adrenallin", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_CutScene,
    RenderMode.eRenderMode_GroupCamera
  }))
end
function loadGameUI_PC()
  if true == ToClient_IsDevelopment() then
    runLua("UI_Data/Script/QASupport/AbyssOneHelp.lua")
  end
  runLua("UI_Data/Script/Common/Common_UIMode.lua")
  runLua("UI_Data/Script/Widget/NakMessage/NakMessage.lua")
  runLua("UI_Data/Script/Window/GameExit/Panel_Window_GameExit_All.lua")
  runLua("UI_Data/Script/Window/GameExit/Panel_Window_ExitConfirm_All.lua")
  runLua("UI_Data/Script/Window/GameExit/Panel_Window_ExitTrayConfirm_All.lua")
  runLua("UI_Data/Script/DragManager.lua")
  runLua("UI_Data/Script/Fullsizemode.lua")
  runLua("UI_Data/Script/global_fromActionChart_LuaEvent.lua")
  runLua("UI_Data/Script/Window/Keypad/Panel_Window_NumberPad_All.lua")
  runLua("UI_Data/Script/Widget/GameTips/Panel_GameTips.lua")
  runLua("UI_Data/Script/Widget/GameTips/Panel_GameTips_Frame.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  runLua("UI_Data/Script/Widget/Chatting/Notice/Panel_Important_Notice.lua")
  runLua("UI_Data/Script/Widget/Chatting/ChatMain/Panel_Widget_ChatMain.lua")
  runLua("UI_Data/Script/Widget/Chatting/ChatSubMenu/Panel_Widget_ChatSubMenu.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Input.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_ChatOption.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Filter.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Macro.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_SocialAction.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chat_Emoticon.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_ChatNew_ReportGoldSeller.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Color.lua")
  if true == _ContentsGroup_ChatOption_All then
    runLua("UI_Data/Script/Widget/Chatting/Panel_Window_ChatOption_All.lua")
    runLua("UI_Data/Script/Widget/Chatting/Panel_Window_Chatting_Color_All.lua")
  end
  if true == _ContentsGroup_ChannelChat then
    runLua("UI_Data/Script/Widget/Chatting/Panel_Window_ChannelChat.lua")
    runLua("UI_Data/Script/Widget/Chatting/Panel_Widget_ChannelChat_Loading.lua")
  end
  runLua("UI_Data/Script/Window/ChangeNickName/Panel_Change_Nickname_All.lua")
  runLua("UI_Data/Script/Window/ChangeNickName/Panel_ExchangeNickname.lua")
  runLua("UI_Data/Script/AbyssOne/Panel_OnlyPerframeUsed_AbyssOne.lua")
  runLua("UI_Data/Script/AbyssOne/Region/Panel_AbyssOne_Enter.lua")
  runLua("UI_Data/Script/AbyssOne/Region/Panel_AbyssOne_RegionInfo.lua")
  runLua("UI_Data/Script/AbyssOne/Nak/Panel_AbyssOne_Nak.lua")
  runLua("UI_Data/Script/AbyssOne/Resurrection/Panel_AbyssOne_Resurrection.lua")
  runLua("UI_Data/Script/Window/MessageBox/MessageBox_Common.lua")
  runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_All.lua")
  runLua("UI_Data/Script/Widget/Interaction/Panel_Interaction.lua")
  runLua("UI_Data/Script/Widget/Interaction/UI_Character_InterActionGathering_All.lua")
  runLua("UI_Data/Script/Widget/CharacterNameTag/Panel_CharacterNameTag.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_All.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_List_All.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Quest_All.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_ExchangeList_All.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialogue_Itemtake_All.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_NPCShop_All.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Item.lua")
  runLua("UI_Data/Script/CutScene.lua")
  runLua("UI_Data/Script/Window/Cutscene/Panel_Window_CutSceneSkip.lua")
  runLua("UI_Data/Script/Window/Cutscene/Panel_Window_CutSceneScript.lua")
  runLua("UI_Data/Script/Widget/MainStatus/Panel_Widget_Sequence_HpMpBar.lua")
  runLua("UI_Data/Script/Widget/MainStatus/Panel_Widget_Sequence_Stamina.lua")
  runLua("UI_Data/Script/Widget/MainStatus/Panel_Widget_Sequence_Adrenallin.lua")
  if true == _ContentsGroup_NewCloseManager then
    runLua("UI_Data/Script/GlobalKeyBinder/globalCloseManager_ExceptionList.lua")
    runLua("UI_Data/Script/GlobalKeyBinder/globalCloseManager_Renew_AbyssOne.lua")
  else
    runLua("UI_Data/Script/GlobalKeyBinder/globalCloseManager.lua")
  end
  runLua("UI_Data/Script/AbyssOne/globalKeyBinderUiInputType_AbyssOne.lua")
  runLua("UI_Data/Script/AbyssOne/globalKeyBinderManager_AbyssOne.lua")
  runLua("UI_Data/Script/AbyssOne/globalKeyBinder_AbyssOne.lua")
  runLua("UI_Data/Script/Widget/Dialogue/DialogKeybinderManager_All.lua")
  isLuaLoadingComplete = true
end
function loadLobbyUI_PC()
end
function loadLoadingUI_PC()
end
function loadPadSnapTargetEffect()
  loadUI("UI_Data/Widget/UIcontrol/Panel_PadSnapTargetEffect.XML", "Panel_PadSnapTargetEffect", UIGroup.PAGameUIGroup_ModalDialog, SETRENDERMODE_BITSET_ALLRENDER())
  runLua("UI_Data/Script/Panel_PadSnapTargetEffect.lua")
end
PaGlobal_SetLoadUIFunc(loadLoadingUI_PC, LOADUI_TYPE.loadingUI)
PaGlobal_SetLoadUIFunc(preLoadGameUI_PC, LOADUI_TYPE.preLoadGameUI)
PaGlobal_SetLoadUIFunc(loadGameUI_PC, LOADUI_TYPE.GameUI)
PaGlobal_SetLoadUIFunc(loadLobbyUI_PC, LOADUI_TYPE.lobbyUI)
