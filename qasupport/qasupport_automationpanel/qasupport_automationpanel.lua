QASupport_AutomationPanel:SetShow(false)
local itemIndex = -1
local TABLE_TAB0 = {}
local TABLE_TAB1 = {}
local TABLE_TAB2 = {}
local TABLE_TAB3 = {}
local TABLE_TAB4 = {}
local boxValue = false
local QASupport_AutomationPanel_SafeCheck = function()
  if nil == getSelfPlayer() then
    return false
  end
  if nil == QASupport_AutomationPanel then
    return false
  end
  return true
end
function QASupport_AutomationPanel_Close()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  _PA_SVC_LOG("*************QASupport_AutomationPanel_Close()*************")
  QASupport_AutomationPanel_Reset()
  QASupport_AutomationPanel:SetShow(false)
end
function clickTab(index)
  if 0 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(true)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(false)
    end
  elseif 1 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(true)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(false)
    end
  elseif 2 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(true)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(false)
    end
  elseif 3 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(true)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(false)
    end
  elseif 4 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(true)
    end
  elseif 5 == index then
    for _, control in pairs(TABLE_TAB0) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB1) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB2) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB3) do
      control:SetShow(false)
    end
    for _, control in pairs(TABLE_TAB4) do
      control:SetShow(false)
    end
  end
end
function QASupport_AutomationPanel_Reset()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab0"):SetCheck(true)
  UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab1"):SetCheck(false)
  UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab2"):SetCheck(false)
  UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab3"):SetCheck(false)
  UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab4"):SetCheck(false)
  clickTab(0)
end
function FromClient_QASupport_AutomationPanel_Toggle()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  local showCheck = not QASupport_AutomationPanel:GetShow()
  _PA_SVC_LOG("*************ToggleQASupport(" .. tostring(showCheck) .. ")*************")
  if true == showCheck then
    QASupport_AutomationPanel_Reset()
  end
  QASupport_AutomationPanel:SetShow(showCheck)
end
registerEvent("FromClient_QASupport_AutomationPanel_Toggle", "FromClient_QASupport_AutomationPanel_Toggle()")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_QASupport_AutomationPanel")
local control_validate = function(col, row, name, clickEvent, tabNumber)
  if row > 3 then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() rowê°’ì€ 3ì„ ë„˜ì–´ì„œë©´ ì•ˆë©ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if tabNumber > 5 then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() tabNumberê°’ì€ 5ì„ ë„˜ì–´ì„œë©´ ì•ˆë©ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == col then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() col nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == row then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() row nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == name then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() nameì´ nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == clickEvent then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() clickEventê°€ nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == tabNumber then
    _PA_ASSERT_NAME(false, "CREATE_BUTTON() tabNumberê°€ nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
end
local function CREATE_BUTTON(col, row, name, clickEvent, tabNumber, descTooltip)
  control_validate(col, row, name, clickEvent, tabNumber)
  itemIndex = itemIndex + 1
  local btn = UI.createAndCopyBasePropertyControl(QASupport_AutomationPanel, "ButtonTemp", QASupport_AutomationPanel, "ButtonTemp_" .. itemIndex)
  if nil == btn then
    _PA_ASSERT_NAME(nil ~= clickEvent, "CREATE_BUTTON() clickEventê°€ nilì…ë‹ˆë‹¤.", "QAíŒ€ ë¬¸ì„¸ì˜ / ì¡°ì„±ë¯¼")
  end
  if nil == descTooltip then
    descTooltip = "No Desc"
  end
  btn:SetShow(true)
  btn:SetText(name)
  btn:SetPosX(10 + row * (btn:GetSizeX() + 4))
  btn:SetPosY(110 + col * (btn:GetSizeY() + 10))
  if 5 ~= tabNumber then
    btn:addInputEvent("Mouse_LUp", "QASupport_Automation_CallClickEvent(" .. itemIndex .. "," .. tabNumber .. ",\"" .. clickEvent .. "\")")
    btn:addInputEvent("Mouse_On", "QASupport_Automation_Tooltip(" .. itemIndex .. "," .. tabNumber .. ",\"" .. descTooltip .. "\")")
    btn:addInputEvent("Mouse_Out", "QASupport_Automation_Tooltip_Hide()")
  else
    btn:addInputEvent("Mouse_LUp", "SetTrSleepTick()")
  end
  if 0 == tabNumber then
    TABLE_TAB0[itemIndex] = btn
  elseif 1 == tabNumber then
    TABLE_TAB1[itemIndex] = btn
  elseif 2 == tabNumber then
    TABLE_TAB2[itemIndex] = btn
  elseif 3 == tabNumber then
    TABLE_TAB3[itemIndex] = btn
  elseif 4 == tabNumber then
    TABLE_TAB4[itemIndex] = btn
  end
end
function QASupport_Automation_CallClickEvent(index, tabNumber, clickEvent)
  local name
  if 0 == tabNumber then
    uiControl = TABLE_TAB0[index]
    name = TABLE_TAB0[index]:GetText()
  elseif 1 == tabNumber then
    uiControl = TABLE_TAB1[index]
    name = TABLE_TAB1[index]:GetText()
  elseif 2 == tabNumber then
    uiControl = TABLE_TAB2[index]
    name = TABLE_TAB2[index]:GetText()
  elseif 3 == tabNumber then
    uiControl = TABLE_TAB3[index]
    name = TABLE_TAB3[index]:GetText()
  elseif 4 == tabNumber then
    uiControl = TABLE_TAB4[index]
    name = TABLE_TAB4[index]:GetText()
  end
  if nil == name then
    return
  end
  _PA_SVC_LOG("*************QASupport_Automation_CallClickEvent : " .. name .. "*************")
  chatting_sendMessage("", "/doLua " .. clickEvent, CppEnums.ChatType.Public)
end
function QASupport_Automation_Tooltip_Hide()
  TooltipSimple_Hide()
end
function QASupport_Automation_Tooltip(index, tabNumber, descTooltip)
  local uiControl, name, desc
  if 0 == tabNumber then
    uiControl = TABLE_TAB0[index]
    name = TABLE_TAB0[index]:GetText()
  elseif 1 == tabNumber then
    uiControl = TABLE_TAB1[index]
    name = TABLE_TAB1[index]:GetText()
  elseif 2 == tabNumber then
    uiControl = TABLE_TAB2[index]
    name = TABLE_TAB2[index]:GetText()
  elseif 3 == tabNumber then
    uiControl = TABLE_TAB3[index]
    name = TABLE_TAB3[index]:GetText()
  elseif 4 == tabNumber then
    uiControl = TABLE_TAB4[index]
    name = TABLE_TAB4[index]:GetText()
  end
  desc = descTooltip
  local reversePosX = true
  if nil == Panel_Tooltip_SimpleText then
    return
  end
  if nil == uiControl then
    return
  end
  TooltipSimple_Show(uiControl, name, desc, nil, reversePosX)
end
function FromClient_luaLoadComplete_QASupport_AutomationPanel()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  local btn_tab0 = UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab0")
  local btn_tab1 = UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab1")
  local btn_tab2 = UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab2")
  local btn_tab3 = UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab3")
  local btn_tab4 = UI.getChildControl(QASupport_AutomationPanel, "RadioButton_Tab4")
  local stc_title = UI.getChildControl(QASupport_AutomationPanel, "StaticText_Title")
  local btn_close = UI.getChildControl(stc_title, "Button_Win_Close")
  btn_close:addInputEvent("Mouse_LUp", "QASupport_AutomationPanel_Close()")
  btn_tab0:addInputEvent("Mouse_LUp", "clickTab(0)")
  btn_tab1:addInputEvent("Mouse_LUp", "clickTab(1)")
  btn_tab2:addInputEvent("Mouse_LUp", "clickTab(2)")
  btn_tab3:addInputEvent("Mouse_LUp", "clickTab(3)")
  btn_tab4:addInputEvent("Mouse_LUp", "clickTab(4)")
  QASupport_AutomationPanel_CreateControl_Tab1()
  QASupport_AutomationPanel_CreateControl_Tab2()
  QASupport_AutomationPanel_CreateControl_Tab3()
  QASupport_AutomationPanel_CreateControl_Tab4()
  QASupport_AutomationPanel_CreateControl_Tab5()
  QASupport_AutomationPanel_Reset()
  btn_tab0:SetText("ê°„í¸ ëª…ë ¹ì–´")
  btn_tab1:SetText("ì´ë™")
  btn_tab2:SetText("ìºë¦­í„° ì„¸íŒ…")
  btn_tab3:SetText("ì‹œì¦Œ/ìƒí™œ ì„¸íŒ…")
  btn_tab4:SetText("TR ì§€ì—°")
end
function QASupport_AutomationPanel_CreateControl_Tab1()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  CREATE_BUTTON(0, 0, "ì£¼ë³€ëª¬ìŠ¤í„° ì²˜ì¹˜", "KillNearAllMonster()", 0, "ë‚´ ì£¼ë³€ì˜ ëª¨ë“  ëª¬ìŠ¤í„°ë“¤ì„ ì²˜ì¹˜í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(1, 0, "ì£¼ë³€ ì‹œì²´ ë£¨íŒ…", "LootNearAll()", 0, "ì£¼ë³€ ëª¨ë“  ì „ë¦¬í’ˆë“¤ì„ ë£»í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(2, 0, "ëª¬ìŠ¤í„°ì²˜ì¹˜ìˆ˜ ì˜ë¢°", "killmonsterquest()", 0, "ì „ ì§€ì—­ì„ ëŒ€ìƒìœ¼ë¡œ í•œ ëª¬ìŠ¤í„° ì²˜ì¹˜ìˆ˜ í™•ì¸ ì˜ë¢°ë¥¼ ìˆ˜ì£¼í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(3, 0, "ë‚´ HP ì „ì²´íšŒë³µ", "SetMyHp(100)", 0, "ìì‹  ìºë¦­í„°ì˜ ì²´ë ¥ì„ ìµœëŒ€ì¹˜ë¡œ íšŒë³µí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(4, 0, "ì¢Œí‘œ í™•ì¸/ë³µì‚¬", "PrintHereCopy()", 0, "í˜„ì¬ í”Œë ˆì´ì–´ ìºë¦­í„° ì¢Œí‘œë¥¼ ì‹œìŠ¤í…œ ë©”ì„¸ì§€ë¡œ ì¶œë ¥ì‹œí‚µë‹ˆë‹¤. ë˜í•œ í•´ë‹¹ ì¢Œí‘œëŠ” ë³µì‚¬ë©ë‹ˆë‹¤.")
  CREATE_BUTTON(5, 0, "getHp í™•ì¸/ë³µì‚¬", "GetHpHereCopy()", 0, "íƒ€ê²Ÿì˜ í˜„ì¬ hpì™€ %ë¥¼ ì±„íŒ…ì°½ì— ì¶œë ¥ì‹œí‚µë‹ˆë‹¤. ë˜í•œ í•´ë‹¹ ê°’ì€ ë³µì‚¬ë©ë‹ˆë‹¤.")
  CREATE_BUTTON(6, 0, "ìºë¦­í„° í‚¤ í™•ì¸", "ShowCharacterKey()", 0, "í˜„ì¬ ì¸í„°ë™ì…˜ ìƒíƒœ ìºë¦­í„°ì˜ ìºë¦­í„° í‚¤ê°’ì„ í™•ì¸í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(7, 0, "í« í–‰ë™ë ¥ íšŒë³µ", "AddHungryFull()", 0, "êº¼ë‚´ì ¸ ìˆëŠ” ë°˜ë ¤ë™ë¬¼ë“¤ì˜ í–‰ë™ë ¥ì„ ëª¨ë‘ íšŒë³µí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(8, 0, "í‘ë¶„ ì±„ìš°ê¸°", "UpAdrenalin()", 0, "í‘ì •ë ¹ì˜ ë¶„ë…¸ ìˆ˜ì¹˜ë¥¼ 500% ì˜¬ë ¤ì¤ë‹ˆë‹¤.")
  CREATE_BUTTON(12, 0, "ìš´ì˜ì ì¥ë¹„", "SetGMItem()", 0, "ìš´ì˜ì ë°˜ì§€, íˆ¬êµ¬. ê°‘ì˜·, ì¥ê°‘, ì‹ ë°œ ìƒì„±")
  CREATE_BUTTON(0, 1, "ì¿¨íƒ€ì„ ì´ˆê¸°í™”", "ClearPlayerSkillCoolTime()", 0, "ê¸°ìˆ /ê¸´íƒˆ/í”„ë¦¬ì…‹ ì¿¨íƒ€ì„ ì´ˆê¸°í™”")
  CREATE_BUTTON(1, 1, "ë²„í”„/ë””ë²„í”„ ì œê±°", "ClearBuff()", 0, "ë²„í”„ ë° ë””ë²„í”„ ì œê±°(ì¬ì ‘ì† í•„ìš”)")
  CREATE_BUTTON(2, 1, "ê³µí—Œë„ Exp", "ContributionExp()", 0, "ê³µí—Œë„ ê²½í—˜ì¹˜ë¥¼ íšë“í•©ë‹ˆë‹¤. ì ë‹¹í•œ ì •ë„ê¹Œì§€ë§Œ ì‚¬ìš© ë¶€íƒë“œë¦½ë‹ˆë‹¤.")
  CREATE_BUTTON(3, 1, "ì§€ì‹ íšë“", "CreateKnowledge()", 0, "ì¸ë¬¼ ë° ì§€í˜• ì§€ì‹ì„ íšë“í•©ë‹ˆë‹¤. ê¸°ìš´ ì˜¬ë¦¬ëŠ” ìš©ë„")
  CREATE_BUTTON(4, 1, "ìµœëŒ€ ê¸°ìš´ +300", "Wp300()", 0, "ìµœëŒ€ ê¸°ìš´ 300 ì¦ê°€, ì¬ì ‘ì† ì‹œ ì´ˆê¸°í™”")
  CREATE_BUTTON(5, 1, "ê¸°ìš´ ì „ì²´íšŒë³µ", "RecoverWp()", 0, "ê¸°ìš´ì„ ìµœëŒ€ì¹˜ë¡œ íšŒë³µí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(12, 1, "ê°•í™” í…ŒìŠ¤íŠ¸", "enhancingtest()", 0, "ê°•í™” í…ŒìŠ¤íŠ¸")
  CREATE_BUTTON(0, 2, "Reload UI", "ReloadUI()", 0, "UIë¥¼ ë¦¬ë¡œë“œí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(1, 2, "ì„±í–¥ì¹˜ ì¦ê°€", "SetMyTendency(100000)", 0, "ìºë¦­í„° ì„±í–¥ì¹˜ +100000")
  CREATE_BUTTON(2, 2, "ì„±í–¥ì¹˜ ê°ì†Œ", "SetMyTendency(-100000)", 0, "ìºë¦­í„° ì„±í–¥ì¹˜ -100000")
  CREATE_BUTTON(3, 2, "ë‚´êµ¬ë„ ê°ì†Œ", "decreaseendurance()", 0, "ì¥ì°©í•œ ëª¨ë“  ì•„ì´í…œì˜ ë‚´êµ¬ë„ë¥¼ 49 ê°ì†Œì‹œí‚µë‹ˆë‹¤. í•´ë‹¹ ë²„íŠ¼ ì‚¬ìš© ì‹œ í„ì˜ìƒ ë‚´êµ¬ë„ê°€ ë–¨ì–´ì§ˆ ìˆ˜ ìˆìŠµë‹ˆë‹¤.")
  CREATE_BUTTON(4, 2, "ë£°ë › ìë™ê¹Œê¸° ON", "ItemBoxGo(1)", 0, "ë£°ë ›ì„ ìë™ìœ¼ë¡œ ê¹ë‹ˆë‹¤.")
  CREATE_BUTTON(5, 2, "ë£°ë › ìë™ê¹Œê¸° OFF", "ItemBoxGo(0)", 0, "ë£°ë › ìë™ê¹Œê¸°ë¥¼ ì¢…ë£Œí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(6, 2, "ê±°ë˜ì†Œ ì‹œì„¸ ê°±ì‹ ", "AutoUpdateMarket(6)", 0, "ê±°ë˜ì†Œ ì‹œì„¸ë¥¼ ê°±ì‹ í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(7, 2, "ë³´ìŠ¤ë“¤ ì§€ì‹íšë“", "CreateAllBossKnowledge()", 0, "ëª¨ë“  ë³´ìŠ¤ë“¤ì˜ ì§€ì‹ì„ íšë“ì‹œí‚µë‹ˆë‹¤.")
  CREATE_BUTTON(8, 2, "ë³´ìŠ¤ ìì—°ì‚¬", "DespawnAllBoss()", 0, "ëª¨ë“  ë³´ìŠ¤ë¥¼ ìì—°ì‚¬ì‹œí‚µë‹ˆë‹¤.")
  CREATE_BUTTON(9, 2, "ë³´ìŠ¤ ì²´ë ¥ ì´ˆê¸°í™”", "ResetAllBossHP()", 0, "ëª¨ë“  ë³´ìŠ¤ì˜ ì²´ë ¥ì„ ì´ˆê¸°í™”í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(10, 2, "ë²¨ ì†Œí™˜", "SummonVell()", 0, "ì‚¬ìš©ì— ì ˆëŒ€ ì£¼ì˜í•˜ì„¸ìš”. ë²¨ì˜ ì˜ì—­ì—ì„œë§Œ ì‚¬ìš©í•´ì£¼ì„¸ìš”.")
  CREATE_BUTTON(0, 3, "í˜„ì¬ì„œë²„ì‹œê°„", "CheckServerTime()", 0, "í˜„ì¬ ì„œë²„ì‹œê°„ í™•ì¸")
  CREATE_BUTTON(1, 3, "í˜„ì¬ê³µì„±ì§€ì—­", "CheckSiegeTerritory()", 0, "í˜„ì¬ ì„œë²„ì˜ ê³µì„±ì§€ì—­ í™•ì¸")
  CREATE_BUTTON(2, 3, "ê±°ì ê³µì„±ì„±ì±„ ìƒì„±", "siegeready1()", 0, "ê±°ì /ì ë ¹ì „ ìš© ì„±ì±„ë¥¼ ìƒì„±í•©ë‹ˆë‹¤")
  CREATE_BUTTON(3, 3, "ê±°ì ê³µì„±ë¶€ì† ìƒì„±", "siegeready2()", 0, "ê±°ì /ì ë ¹ì „ ìš© ë¶€ì† ì•„ì´í…œì„ ìƒì„±í•©ë‹ˆë‹¤")
  CREATE_BUTTON(4, 3, "ì¹¼í˜ì˜¨ ì„± ì´ë™", "TeleportCalpheonCastle()", 0, "ì¹¼í˜ì˜¨ ì„± ì´ë™")
  CREATE_BUTTON(5, 3, "ë°œë Œì‹œì•„ ì„± ì´ë™", "TeleportValenciaCastle()", 0, "ë°œë Œì‹œì•„ ì„± ì´ë™")
end
function QASupport_AutomationPanel_CreateControl_Tab2()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  CREATE_BUTTON(0, 0, "ëª©ì ì§€ë¡œ ì´ë™", "TeleportToDestination()", 1, "ëª©ì ì§€(ë¹›ê¸°ë‘¥)ë¡œ í…”ë ˆí¬íŠ¸í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(1, 0, "ë²¨ë¦¬ì•„", "TeleportBelia1()", 1, "ë²¨ë¦¬ì•„ ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(2, 0, "í•˜ì´ë¸1", "TeleportHeidel1()", 1, "í•˜ì´ë¸ ì‚¼ê±°ë¦¬ë¡œ ì´ë™")
  CREATE_BUTTON(3, 0, "í•˜ì´ë¸2", "TeleportHeidel2()", 1, "í•˜ì´ë¸ ê²°íˆ¬ì¥ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(4, 0, "ì¹¼í˜ì˜¨", "TeleportCalpheon1()", 1, "ì¹¼í˜ì˜¨ ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(5, 0, "ì•Œí‹°ë…¸ë°”", "TeleportAltinova1()", 1, "ì•Œí‹°ë…¸ë°” ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(6, 0, "ë°œë Œì‹œì•„", "TeleportValencia1()", 1, "ë°œë Œì‹œì•„ ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(7, 0, "ì•„ë ˆí•˜ì ë§ˆì„", "TeleportArehaza()", 1, "ì•„ë ˆí•˜ì ë§ˆì„ë¡œ ì´ë™")
  CREATE_BUTTON(8, 0, "ê·¸ë¼ë‚˜", "TeleportGrana1()", 1, "ê·¸ë¼ë‚˜ ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(9, 0, "ë“œë²¤í¬ë£¬", "TeleportDuvencrune1()", 1, "ë“œë²¤í¬ë£¬ ì°½ê³ ì§€ê¸° ì•ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(10, 0, "ë í•­êµ¬ ë§ˆì„", "TeleportRatt()", 1, "ë í•­êµ¬ ë§ˆì„ë¡œ ì´ë™")
  CREATE_BUTTON(11, 0, "ì˜¤ë“œë½ì‹œì•„", "ToClient_qaTeleport(-172407,19586,-611464)", 1, "ì˜¤ë“œë½ì‹œì•„ ì´ë™")
  CREATE_BUTTON(12, 0, "ì—ì¼ ë§ˆì„", "ToClient_qaTeleport(168755,16659,-389175)", 1, "ì—ì¼ ë§ˆì„ ì´ë™")
  CREATE_BUTTON(0, 1, "ëˆ„ë² ë¥´", "NouverTest()", 1, "ëˆ„ë² ë¥´ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23032")
  CREATE_BUTTON(1, 1, "ì¿ íˆ¼", "KutumTest()", 1, "ì¿ íˆ¼ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23073")
  CREATE_BUTTON(2, 1, "ì˜¤í•€", "OpinTest()", 1, "ì˜¤í•€ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23809")
  CREATE_BUTTON(3, 1, "ë¬´ë¼ì¹´", "MurakaTest()", 1, "ë¬´ë¼ì¹´ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(4, 1, "ê·„íŠ¸", "QuintTest()", 1, "ê·„íŠ¸ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(5, 1, "ë²¨", "VellTest()", 1, "ë²¨ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ë²¨ ì¦‰ì‹œ ìƒì„±ì€ [ê°„í¸ ëª…ë ¹ì–´] íƒ­ - [ë²¨ ìë™ ì†Œí™˜] ë²„íŠ¼ ì´ìš©")
  CREATE_BUTTON(6, 1, "ë¹¨ê°„ì½”", "RednoseTest()", 1, "ë¹¨ê°„ ì½” ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23061")
  CREATE_BUTTON(7, 1, "ìš°ë‘”", "DimTreeSpiritTest()", 1, "ìš°ë‘”í•œ ë‚˜ë¬´ ì •ë ¹ ìƒì„± ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23006")
  CREATE_BUTTON(8, 1, "ë² ê·¸", "BhegTest()", 1, "ë² ê·¸ ìƒì„± ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23703")
  CREATE_BUTTON(9, 1, "ì§„í™", "MudTest()", 1, "ì§„í™ê´´ë¬¼ ìƒì„± ì§€ì—­ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(10, 1, "ë°”ì•„ë§ˆí‚¤ì•„", "TeleportAtoraxxion1()", 1, "ë°”ì•„ë§ˆí‚¤ì•„,ì—´ì‡  ì¼ë°˜:757164, ì—˜ë¹„ì•„:757204")
  CREATE_BUTTON(11, 1, "ì‹œì¹´ë¼í‚¤ì•„", "TeleportAtoraxxion2()", 1, "ì‹œì¹´ë¼í‚¤ì•„,ì—´ì‡  ì¼ë°˜:757272, ì—˜ë¹„ì•„:757280")
  CREATE_BUTTON(12, 1, "ì˜¤í‚¬ë£¨ì•„", "TeleportOkillua()", 1, "ì¹¸ ìƒì„± ì§€ì—­ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(0, 2, "ì´ˆìŠ¹", "TeleportCrescent()", 1, "ì´ˆìŠ¹ë‹¬ ìˆ˜í˜¸ì ì‹ ì „ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(1, 2, "ë°”ì‹¤", "TeleportBasilisk()", 1, "ë°”ì‹¤ë¦¬ìŠ¤í¬ ì†Œêµ´ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(2, 2, "ì•„í¬ë§Œ", "TeleportAakman()", 1, "ì•„í¬ë§Œ ì‚¬ì›ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(3, 2, "íˆìŠ¤íŠ¸ë¦¬ì•„", "TeleportHystria()", 1, "íˆìŠ¤íŠ¸ë¦¬ì•„ íí—ˆë¡œ ì´ë™")
  CREATE_BUTTON(4, 2, "í•„ë¼ì¿ ", "TeleportPilaKu()", 1, "í•„ë¼ ì¿  ê°ì˜¥ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(5, 2, "ë¯¸ë£¨ëª©", "TeleportMirumok()", 1, "ë¯¸ë£¨ëª© ìœ ì ì§€ë¡œ ì´ë™")
  CREATE_BUTTON(6, 2, "ì‹œí¬ë¼ì´ì•„ ìƒì¸µ", "TeleportUnderwater()", 1, "í•´ì € ë˜ì „ ì‹œí¬ë¼ì´ì•„ ìƒì¸µìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(7, 2, "ì‹œí¬ë¼ì´ì•„ í•˜ì¸µ", "TeleportSycraia()", 1, "í•´ì € ë˜ì „ ì‹¬í•´ ì‹œí¬ë¼ì´ì•„ í•˜ì¸µìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(8, 2, "ë³„ë¬´ë¤", "TeleportStarGrave()", 1, "ë³„ë¬´ë¤ìœ¼ë¡œ ì´ë™")
  CREATE_BUTTON(9, 2, "íˆ°í¬íƒ€", "ToClient_qaTeleport(-358326,2657,-557387)", 1, "íˆ°í¬íƒ€ë¡œ ì´ë™")
  CREATE_BUTTON(10, 2, "ë§ˆê³ ë¦¬ì•„ ë¶ë¶€", "TeleportNorthMagoria()", 1, "ë§ˆê³ ë¦¬ì•„ ë¶ë¶€ì§€ì—­ (ìœ ë¥´ í•´ì—­ ë‚¨ìª½) ìœ¼ë¡œ ì´ë™, ë§ˆê³ ë¦¬ì•„C")
  CREATE_BUTTON(11, 2, "ë§ˆê³ ë¦¬ì•„ ì¤‘ì•™", "TeleportMiddleMagoria()", 1, "ë§ˆê³ ë¦¬ì•„ ì¤‘ì•™ ì§€ì—­ìœ¼ë¡œ ì´ë™, ë§ˆê³ ë¦¬ì•„B")
  CREATE_BUTTON(12, 2, "ë§ˆê³ ë¦¬ì•„ ë‚¨ë¶€", "TeleportSouthMagoria()", 1, "ë§ˆê³ ë¦¬ì•„ ë‚¨ë¶€ì§€ì—­ (ë¡œìŠ¤ í•´ì—­ ë¶ìª½) ìœ¼ë¡œ ì´ë™, ë§ˆê³ ë¦¬ì•„A")
  CREATE_BUTTON(0, 3, "íŠ¸ì‰¬ë¼ íí—ˆ", "ToClient_qaTeleport(98802,2830,-269782)", 1, "íŠ¸ì‰¬ë¼ íí—ˆë¡œ ì´ë™")
  CREATE_BUTTON(1, 3, "ëŒ€í˜• í•´ì™•ë¥˜ êµ°ë½ì§€", "TeleportSeaMonster()", 1, "ëŒ€í˜• í•´ì™•ë¥˜ êµ°ë½ì§€ë¡œ ì´ë™")
  CREATE_BUTTON(2, 3, "í•ë¹› ìˆ˜ë„ì›", "TeleportBloodyMonastery()", 1, "í•ë¹› ìˆ˜ë„ì› ë‚´ë¶€ë¡œ ì´ë™")
  CREATE_BUTTON(3, 3, "í—¥ì„¸ ì„±ì—­", "TeleportHexe()", 1, "í—¥ì„¸ë¡œ ì´ë™")
  CREATE_BUTTON(7, 3, "í¬ìì¹´ ìŠ¤í° ì§€ì—­", "KzarkaTest()", 1, "í¬ìì¹´ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23001")
  CREATE_BUTTON(8, 3, "í¬ìì¹´ ìƒì„±", "CreateKzarka()", 1, "ë‚´ ìœ„ì¹˜ì— í¬ìì¹´ë¥¼ ìƒì„±í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(9, 3, "ì¹´ë€ë‹¤ ìŠ¤í° ì§€ì—­", "KarandaTest()", 1, "ì¹´ë€ë‹¤ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23060")
  CREATE_BUTTON(10, 3, "ì¹´ë€ë‹¤ ìƒì„±", "CreateKaranda()", 1, "ë‚´ ìœ„ì¹˜ì— ì¹´ë€ë‹¤ë¥¼ ìƒì„±í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(11, 3, "ê°€ëª¨ìŠ¤ ìŠ¤í° ì§€ì—­", "GarmothTest()", 1, "ê°€ëª¨ìŠ¤ ìŠ¤í° ì§€ì—­ìœ¼ë¡œ ì´ë™, ìƒì„± : 23120")
  CREATE_BUTTON(12, 3, "ê°€ëª¨ìŠ¤ ìƒì„±", "CreateGarmoth()", 1, "ë‚´ ìœ„ì¹˜ì— ê°€ëª¨ìŠ¤ë¥¼ ìƒì„±í•©ë‹ˆë‹¤.")
end
function QASupport_AutomationPanel_CreateControl_Tab3()
  if false == QASupport_AutomationPanel_SafeCheck() then
    return
  end
  CREATE_BUTTON(0, 0, "ì‚¬ëƒ¥ í…ŒìŠ¤íŠ¸ ì„¸íŒ…", "pvetest()", 2, "ì‚¬ëƒ¥ í…ŒìŠ¤íŠ¸ë¥¼ ìœ„í•œ ì›ë²„íŠ¼ ì„¸íŒ…ì…ë‹ˆë‹¤.")
  CREATE_BUTTON(1, 0, "PVP í…ŒìŠ¤íŠ¸ ì„¸íŒ…", "pvptest()", 2, "301/303/370 PVP í”¼í•´ëŸ‰ í…ŒìŠ¤íŠ¸ ì„¸íŒ…ì…ë‹ˆë‹¤.")
  CREATE_BUTTON(2, 0, "ë°¸ëŸ°ìŠ¤ í…ŒìŠ¤íŠ¸ ì„¸íŒ…", "balancetest()", 2, "ë°¸ëŸ°ìŠ¤ í…ŒìŠ¤íŠ¸ ì§„í–‰ì‹œ ì‚¬ìš©í•  ëŒ€ë¶€ë¶„ì˜ ì¥ë¹„ì„¸íŒ…ì…ë‹ˆë‹¤.")
  CREATE_BUTTON(3, 0, "WarReady ì„¸íŒ…", "WarReady20()", 2, "í•´ì™¸/ì½˜ì†”ìš© í…ŒìŠ¤íŠ¸ë¥¼ ìœ„í•œ ì›ë²„íŠ¼(ìš°ë‘ë¨¸ë¦¬ì¥ë¹„) ì„¸íŒ…ì…ë‹ˆë‹¤.")
  CREATE_BUTTON(4, 0, "ë°©ì–´ ì•…ì„¸ì„œë¦¬", "CreateDefAcc()", 2, "ë°©ì–´ì„¸íŒ…ìš© ì•…ì„¸ì„œë¦¬ ìƒì„±")
  CREATE_BUTTON(5, 0, "ë°¸ëŸ°ìŠ¤ ì•…ì„¸ì„œë¦¬", "CreateBalAcc()", 2, "ë°¸ëŸ°ìŠ¤ì„¸íŒ…ìš© ì•…ì„¸ì„œë¦¬ ìƒì„±")
  CREATE_BUTTON(6, 0, "ê³µ/ì  ì•…ì„¸ì„œë¦¬", "CreateAttAcc1()", 2, "ê³µê²©ì„¸íŒ…ìš© ì•…ì„¸ì„œë¦¬ ìƒì„±")
  CREATE_BUTTON(7, 0, "ì í”„ í’€ ì„¸íŒ…", "jumpitem()", 2, "ì í”„ ì„¸íŒ… ìƒì„±")
  CREATE_BUTTON(8, 0, "ìœ ë¬¼ ìƒì„±", "createRelics()", 2, "ì „íˆ¬ ìœ ë¬¼ ìƒì„±")
  CREATE_BUTTON(9, 0, "ê´‘ëª…ì„ ìƒì„±", "createStone()", 2, "ì „íˆ¬ ê´‘ëª…ì„ ìƒì„±")
  CREATE_BUTTON(10, 0, "ì—°ê¸ˆì„", "CreateAlchemyStone()", 2, "ì£¼ìš” ì—°ê¸ˆì„ ìƒì„±. ( ë²¨ì‹¬, ì˜ˆë¦¬íŒŒê´´, ì˜ˆë¦¬ìˆ˜í˜¸, ì˜ˆë¦¬ìƒëª…, ì˜ë¡±íŒŒê´´, ì˜ë¡±ìˆ˜í˜¸, ì˜ë¡±ìƒëª… ")
  CREATE_BUTTON(11, 0, "ìˆ˜ì •", "createCrystal2()", 2, "ì£¼ìš” ìˆ˜ì • ìƒì„±")
  CREATE_BUTTON(12, 0, "ê°œëŸ‰ì„", "createUpgradeItem()", 2, "ê°œëŸ‰ì„ ìƒì„±")
  CREATE_BUTTON(0, 1, "ê°€ë¬¸ ê°€ë°©", "FamilyBag()", 2, "ê°€ë¬¸ê°€ë°© ì„¸íŒ…")
  CREATE_BUTTON(1, 1, "ê°€ë°©/ë¬´ê²Œ í™•ì¥", "EncreaseWeightBag()", 2, "ê°€ë°©/ë¬´ê²Œë¥¼ ì¶”ê°€í•©ë‹ˆë‹¤. ë¬´ê²ŒëŠ” 3000LTë¥¼ ì´ˆê³¼í•˜ì—¬ ëŠ˜ë¦´ ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
  CREATE_BUTTON(2, 1, "5ì„¸ëŒ€ í« ì„¸íŒ…", "Set5thPet()", 2, "5ì„¸ëŒ€ í« ì„¸íŒ…, 4ì„¸ëŒ€ í« í•„ìš”í•¨")
  CREATE_BUTTON(3, 1, "4ì„¸ëŒ€ í«x5", "Set4thPets()", 2, "4ì„¸ëŒ€ ë°˜ë ¤ë™ë¬¼ 5ë§ˆë¦¬ë¥¼ ìƒì„±í•˜ì—¬ ì†Œí™˜í•©ë‹ˆë‹¤. (í«ìŠ¤í‚¬: ë‚šì‹œ,ì±„ì§‘,í–‰ìš´ 5ë‹¨ê³„)")
  CREATE_BUTTON(4, 1, "4ì„¸ëŒ€ ìš”ì •", "Set4thFairy()", 2, "4ì„¸ëŒ€ ìš”ì •ì„ ìƒì„±í•˜ì—¬ ì†Œí™˜í•©ë‹ˆë‹¤. (í«ìŠ¤í‚¬: ì‹ ë¹„í•œ ì‘ì› V, ê¹ƒí„¸ê°™ì€ ë°œê±¸ìŒ V, ë§ˆë¥´ì§€ ì•ŠëŠ” ìš°ë¬¼ V, ìš”ì •ì˜ ëˆˆë¬¼ IV)")
  CREATE_BUTTON(5, 1, "ì¼ê¾¼(ìˆ™ì†Œí•„ìš”)", "workerready(30)", 2, "ì£¼ì˜! ìˆ™ì†Œê°€ ë‚¨ì•„ ìˆì–´ì•¼ ì¼ê¾¼ì´ ìƒì„±ë©ë‹ˆë‹¤. ê° ì£¼ìš” ë„ì‹œ ë³„ 3ë§ˆë¦¬ì”© ìƒì„±ë˜ë©°, ìƒì„± í›„ ê°€ì§€ê³  ìˆëŠ” ëª¨ë“  ì¼ê¾¼ì´ 30ë ˆë²¨ë¡œ ì˜¬ë¼ê°‘ë‹ˆë‹¤.")
  CREATE_BUTTON(6, 1, "ë©”ì´ë“œ", "maidtest()", 2, "ë©”ì´ë“œ ê³„ì•½ì„œ ìƒì„± í›„ ìë™ì‚¬ìš©, ì°½ê³  ë©”ì´ë“œ 5ê°œ, ê±°ë˜ì†Œ ë©”ì´ë“œ 5ê°œ (ì£¼ì˜! ìºë¦­í„°ë¥¼ ê°€ë§Œíˆ ë†”ë‘¬ì•¼ ìë™ ì‚¬ìš©ë©ë‹ˆë‹¤.)")
  CREATE_BUTTON(7, 1, "í˜¸í¡,í˜,ê±´ê°•", "SetPhysical30()", 2, "í˜¸í¡, í˜, ê±´ê°• ê²½í—˜ì¹˜ë¥¼ ì˜¬ë¦½ë‹ˆë‹¤. 1ë ˆë²¨ ê¸°ì¤€ 30 ê¹Œì§€ ì˜¬ë¼ê°‘ë‹ˆë‹¤.")
  CREATE_BUTTON(11, 1, "ê¸°ìˆ íŠ¹í™” NPC", "CreateSkillinstructor()", 2, "ê¸°ìˆ  íŠ¹í™”ë¥¼ ë³€ê²½í•´ì£¼ëŠ” NPCë¥¼ ìƒì„±í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(12, 1, "ìˆ˜ë¦¬ NPC", "CreateEqiupRepairNPC()", 2, "ìˆ˜ë¦¬ì™€ ì¶”ì¶œ ë“±ì´ ê°€ëŠ¥í•œ ëŒ€ì¥ì¥ì´ë¥¼ NPCë¥¼ ìƒì„±í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(0, 2, "ì‹ ì²´ ê°•í™”ë²•", "SetFullBuff()", 2, "[ë³„ì±„] ì‹ ì²´ ê°•í™”ë²• (ë³„ì±„ ë²„í”„), ë³„ë¯¸ í¬ë¡  ì •ì‹ 1, ìš©ê¸°ì˜ í–¥ìˆ˜ 2, ê±°ì¸ì˜ ì˜ì•½ 2, ê´‘ë¶„ì˜ ì˜ì•½ 2 íšë“")
  CREATE_BUTTON(1, 2, "ê¸ˆê´´ ë²„í”„", "SetGoldbarBuff()", 2, "ê¸ˆê´´ êµí™˜ ë²„í”„ íšë“")
  CREATE_BUTTON(2, 2, "ì¹œë°€ë„ ë²„í”„", "criBuff()", 2, "[ì¹œë°€ë„]ì¹˜ëª…íƒ€ í”¼í•´ ì¦ê°€")
  CREATE_BUTTON(3, 2, "ìŒì‹ ì˜ì•½", "createBuffItem()", 2, "ë„í•‘ìš© ìŒì‹ ì˜ì•½ ìƒì„±")
  CREATE_BUTTON(4, 2, "íšŒë³µì œ", "createPotion()", 2, "ì§ì—…ë³„ íšŒë³µì— í•„ìš”í•œ íšŒë³µì œ ìƒì„±")
  CREATE_BUTTON(8, 2, "ê¸°ìˆ  í”„ë¦¬ì…‹ í™•ì¥", "ToClient_qaCreateItem(756279,0,2)", 2, "ê¸°ìˆ  í”„ë¦¬ì…‹ í™•ì¥ ì•„ì´í…œ 2ê°œ ìƒì„±")
  CREATE_BUTTON(9, 2, "ê¸°ìˆ í¬ì¸íŠ¸ 3000", "ToClient_qaCreateItem(60,0,300)", 2, "ê¸°ìˆ í¬ì¸íŠ¸ 3000")
  CREATE_BUTTON(10, 2, "ë¹„ê°ì„± ê¸°ìˆ  ìŠµë“", "LearnAllSkill(0)", 2, "ë¹„ê°ì„± ê¸°ìˆ  ìŠµë“")
  CREATE_BUTTON(11, 2, "ì „ìŠ¹ ê¸°ìˆ  ìŠµë“", "LearnAllSkill(1)", 2, "ì „ìŠ¹ ê¸°ìˆ  ìŠµë“")
  CREATE_BUTTON(12, 2, "ê°ì„± ê¸°ìˆ  ìŠµë“", "LearnAllSkill(2)", 2, "ê°ì„± ê¸°ìˆ  ìŠµë“")
  CREATE_BUTTON(0, 3, "ê°€ë°© ë¹„ìš°ê¸°", "ToClient_qaClearInventory()", 2, "ì ê¸´ ì•„ì´í…œì„ ì œì™¸í•˜ê³  ê°€ë°© ì¹¸ì„ ëª¨ë‘ ë¹„ì›ë‹ˆë‹¤. cleaninventoryì™€ ë™ì¼í•œ ê¸°ëŠ¥")
  CREATE_BUTTON(1, 3, "ëª¨ë“  ì¥ë¹„ í•´ì œ", "UnEquipAll()", 2, "í„ ì˜ìƒ í¬í•¨ ëª¨ë“  ì¥ë¹„ë¥¼ í•´ì œí•©ë‹ˆë‹¤.")
  CREATE_BUTTON(7, 3, "ì•„ì´í…œ íšë“ ë„í•‘", "ItemdropBuff()", 2, "ì•„íš ë„í•‘")
  CREATE_BUTTON(8, 3, "ì•„ê·¸ë¦¬ìŠ¤ ëª¨í—˜ì¼ì§€", "VaryFeverUpgrade()", 2, "ì•„ê·¸ë¦¬ìŠ¤ ì—´ê¸° ê´€ë ¨ ëª¨í—˜ì¼ì§€ í´ë¦¬ì–´(ì§ì ‘ ì™„ë£Œí•´ì•¼í•¨)")
  CREATE_BUTTON(9, 3, "ì—´ê¸° ì œê±°", "VaryFeverPoint(-30000)", 2, "ì•„ê·¸ë¦¬ìŠ¤ì˜ ì—´ê¸° -30000")
  CREATE_BUTTON(10, 3, "ì—˜ë¹„ì•„ ë²„í”„(ë¶ˆ)", "HadumBuff1()", 2, "ì—˜ë¹„ì•„ ê°ì„± ë²„í”„ ì¤‘ ë°œíƒ€ë¼ì˜ ì¶•ë³µ")
  CREATE_BUTTON(11, 3, "ì—˜ë¹„ì•„ ë²„í”„(ë¬¼)", "HadumBuff2()", 2, "ì—˜ë¹„ì•„ ê°ì„± ë²„í”„ ì¤‘ ì˜¤ê¸°ì—ë¥´ì˜ ì¶•ë³µ")
  CREATE_BUTTON(12, 3, "ì—˜ë¹„ì•„ ë²„í”„(ì „ê¸°)", "HadumBuff3()", 2, "ì—˜ë¹„ì•„ ê°ì„± ë²„í”„ ì¤‘ ë‚˜í¬ì˜ ì¶•ë³µ")
end
function QASupport_AutomationPanel_CreateControl_Tab4()
  CREATE_BUTTON(0, 0, "ì‹œì¦ŒíŒ¨ìŠ¤ í´ë¦¬ì–´", "QuestClearSeasonPass()", 3, "ì‹œì¦ŒíŒ¨ìŠ¤ í´ë¦¬ì–´")
  CREATE_BUTTON(1, 0, "íˆ¬ë°œë¼ ì¥ë¹„ ì„¸íŒ…", "seasonitem()", 3, "ì‹œì¦Œì œ ì „ìš© íˆ¬ë°œë¼ ì¥ë¹„ ì„¸íŒ…ì…ë‹ˆë‹¤.")
  CREATE_BUTTON(2, 0, "ìƒí™œ ìœ ë¬¼ ìƒì„±", "createLifeRelics()", 3, "ìƒí™œ ìœ ë¬¼ ìƒì„±")
  CREATE_BUTTON(3, 0, "ìƒí™œ ê´‘ëª…ì„ ìƒì„±", "createLifeStone()", 3, "ìƒí™œ ê´‘ëª…ì„ ìƒì„±")
  CREATE_BUTTON(0, 1, "ì‚¬ë§‰/ì„¤ì‚° ì§€ì›", "DesertSupport()", 3, "ë‚˜ì¹¨ë°˜, ì‚¬ë§‰ ìœ„ì¥ë³µ, ì •ì œìˆ˜, íŒ”ê°ì°¨, ì‚¬ë§‰ ì—¬ìš° í«")
  CREATE_BUTTON(1, 1, "ëŒ€ì–‘ ì§€ì›", "OceanSupport()", 3, "ë‚˜ì¹¨ë°˜, ë¹ ë°¤ë¹ ë°¤ ì ìˆ˜ë³µ, ì—¬í–‰ìì˜ ì§€ë„, ê·¸ë¯ë‹¬ êµ¬ì¡° ì‹ í˜¸íƒ„")
  CREATE_BUTTON(0, 2, "ë§ˆêµ¬ ì„¸íŠ¸", "CreateHorseEquip()", 3, "ë§ˆë©´, ë§ˆê°‘, ì•ˆì¥, ë“±ì, í¸ì, ë§ˆí¸, í”¼ë¦¬ ìƒì„±")
  CREATE_BUTTON(1, 2, "8ì„¸ëŒ€ ë°±ë§ˆ", "CreateHorse()", 3, "8ì„¸ëŒ€ ë°±ë§ˆ ìƒì„±, êº¼ë‚´ì ¸ ìˆëŠ” ë§ì´ ì—†ì„ ë•Œ ì‚¬ìš©í•´ì•¼ í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(2, 2, "ì•„ë‘ì•„ë‚˜íŠ¸", "CreateAduahnott()", 3, "ì•„ë‘ì•„ë‚˜íŠ¸ ìƒì„±, êº¼ë‚´ì ¸ ìˆëŠ” ë§ì´ ì—†ì„ ë•Œ ì‚¬ìš©í•´ì•¼ í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(3, 2, "ì•„ë‘ ì „ìš© ìŠ¤í‚¬", "LearnAduahnottSkill()", 3, "ì•„ë‘ì•„ë‚˜íŠ¸ì— íƒ‘ìŠ¹í•´ ìˆì„ ë•Œì—ë§Œ ì‚¬ìš©í•˜ì„¸ìš”. ì•„ë‘ì•„ë‚˜íŠ¸ ì „ìš© ìŠ¤í‚¬ ìŠµë“.")
  CREATE_BUTTON(4, 2, "ë””ë„¤", "CreateDine()", 3, "ë””ë„¤ ìƒì„±, êº¼ë‚´ì ¸ ìˆëŠ” ë§ì´ ì—†ì„ ë•Œ ì‚¬ìš©í•´ì•¼ í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(5, 2, "ë””ë„¤ ì „ìš© ìŠ¤í‚¬", "LearnDineSkill()", 3, "ë””ë„¤ì— íƒ‘ìŠ¹í•´ ìˆì„ ë•Œì—ë§Œ ì‚¬ìš©í•˜ì„¸ìš”. ë””ë„¤ ì „ìš© ìŠ¤í‚¬ ìŠµë“.")
  CREATE_BUTTON(6, 2, "ë‘ ", "CreateDoom()", 3, "ë“¬ ìƒì„±, êº¼ë‚´ì ¸ ìˆëŠ” ë§ì´ ì—†ì„ ë•Œ ì‚¬ìš©í•´ì•¼ í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(7, 2, "ë‘  ì „ìš© ìŠ¤í‚¬", "LearnDoomSkill()", 3, "ë‘ ì— íƒ‘ìŠ¹í•´ ìˆì„ ë•Œì—ë§Œ ì‚¬ìš©í•˜ì„¸ìš”. ë‘  ì „ìš© ìŠ¤í‚¬ ìŠµë“.")
  CREATE_BUTTON(8, 2, "íƒ‘ìŠ¹ë¬¼ 15ë ˆë²¨", "ToClient_qaLevelUpRidingServant(15)", 3, "íƒ‘ìŠ¹ë¬¼ì˜ ë ˆë²¨ì„ 15ë¡œ ì„¤ì •í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(9, 2, "íƒ‘ìŠ¹ë¬¼ 30ë ˆë²¨", "ToClient_qaLevelUpRidingServant(30)", 3, "íƒ‘ìŠ¹ë¬¼ì˜ ë ˆë²¨ì„ 30ìœ¼ë¡œ ì„¤ì •í•©ë‹ˆë‹¤.")
  CREATE_BUTTON(10, 2, "ì£¼í–‰ ìŠ¤í‚¬ ìŠµë“", "LearnDrivingSkill()", 3, "ë§ ìš´ì „ì— í•„ìš”í•œ ìŠ¤í‚¬ë“¤ë§Œ ìŠµë“í•©ë‹ˆë‹¤. ë“œë¦¬í”„íŠ¸, ì „ë ¥ì§ˆì£¼, ì‹œì‘ê°€ì†, ë†’ì€ë„ì•½, ê¸‰ì •ì§€, ìˆœê°„ê°€ì†, ëŒì§„, ì¸¡ë©´ì´ë™, ë¹ ë¥¸ë’·ê±¸ìŒ, ì—°ì†ë„ì•½, ë¹ ë¥¸íƒ‘ìŠ¹, ì—°:ìˆœê°„ê°€ì†, ì†:ì¸¡ë©´ì´ë™")
  CREATE_BUTTON(11, 2, "ìŠ¤í‚¬ í›ˆë ¨ ì™„ë£Œ", "ServantSkillAllMaster()", 3, "íƒ‘ìŠ¹ë¬¼ì— íƒ‘ìŠ¹í•œ ì±„ë¡œ ì‚¬ìš©í•´ì•¼ í•©ë‹ˆë‹¤. íƒ‘ìŠ¹ë¬¼ ëª¨ë“  ìŠ¤í‚¬ í›ˆë ¨ë„ 100%ë¡œ ì„¤ì •.")
  CREATE_BUTTON(0, 3, "ë§ˆë…¸ìŠ¤ ì•…ì„¸", "CreateManosAcc()", 3, "ìƒí™œ ê³µìš© ë§ˆë…¸ìŠ¤ ì•…ì„¸ì„œë¦¬ ìƒì„±")
  CREATE_BUTTON(1, 3, "ì±„ì§‘", "gatheringtest()", 3, "ì±„ì§‘ë„êµ¬ ë° ì±„ì§‘ë³µ ìƒì„±")
  CREATE_BUTTON(2, 3, "ë‚šì‹œ", "fishingtest()", 3, "ë‚šì‹œ í…ŒìŠ¤íŠ¸ì— í•„ìš”í•œ ë„êµ¬ë“¤ì„ ìƒì„±")
  CREATE_BUTTON(3, 3, "ì‘ì‚´ ë‚šì‹œ", "harpoonfishing()", 3, "ì‘ì‚´ ë‚šì‹œ ì§€ì—­ìœ¼ë¡œ ì´ë™, ì´í›„ ë‹¤ì‹œ ë²„íŠ¼ ëˆŒëŸ¬ í…ŒìŠ¤íŠ¸ ì„¸íŒ…")
  CREATE_BUTTON(4, 3, "ìˆ˜ë µ", "huntingtest()", 3, "ìˆ˜ë µì´ ë° ìˆ˜ë µ ë„êµ¬ ìƒì„±")
  CREATE_BUTTON(5, 3, "ìš”ë¦¬", "cooktest()", 3, "ìš”ë¦¬ í…ŒìŠ¤íŠ¸ì— í•„ìš”í•œ ì¬ë£Œì™€ ë„êµ¬ ìƒì„±")
  CREATE_BUTTON(6, 3, "ì—°ê¸ˆ", "alchemytest()", 3, "ì—°ê¸ˆìˆ  ë„êµ¬ ë° ì¬ë£Œ ìƒì„±")
  CREATE_BUTTON(7, 3, "ê°€ê³µ", "processingtest()", 3, "ê°€ê³µë³µ, ê°€ê³µì„, ê°€ê³µ ì¬ë£Œ ìƒì„±")
  CREATE_BUTTON(8, 3, "ë¬´ì—­", "tradetest()", 3)
  CREATE_BUTTON(9, 3, "ë°€ë¬´ì—­", "illegalTradeTest()", 3)
  CREATE_BUTTON(10, 3, "ì¬ë°°", "harvesttest()", 3, "ì¬ë°° í…ŒìŠ¤íŠ¸ìš© ì•„ì´í…œ ìƒì„± ë° í…ƒë°­ ì„¤ì¹˜ ìœ„ì¹˜ë¡œ ì´ë™")
  CREATE_BUTTON(11, 3, "í•­í•´", "createSailboat()", 3, "ë²”ì„  ë° ë²”ì„  ë„êµ¬ ìƒì„±, ë¬¼ì†ì—ì„œ ì‚¬ìš©í•´ì•¼í•¨")
end
function QASupport_AutomationPanel_CreateControl_Tab5()
  CREATE_BUTTON(0, 0, "Tr Sleep ì ìš©", "SetTrSleepTick()", 4, "")
  itemIndex = itemIndex + 1
  local trId = UI.createAndCopyBasePropertyControl(QASupport_AutomationPanel, "Edit_1", QASupport_AutomationPanel, "Edit_TrID")
  local tick = UI.createAndCopyBasePropertyControl(QASupport_AutomationPanel, "Edit_1", QASupport_AutomationPanel, "Edit_Tick")
  local actionName = UI.createAndCopyBasePropertyControl(QASupport_AutomationPanel, "Edit_1", QASupport_AutomationPanel, "Edit_ActionName")
  trId:SetShow(true)
  tick:SetShow(true)
  actionName:SetShow(true)
  trId:SetPosX(10 + 1 * (trId:GetSizeX() + 4))
  trId:SetPosY(110 + 0 * (trId:GetSizeY() + 10))
  TABLE_TAB4[itemIndex] = trId
  itemIndex = itemIndex + 1
  tick:SetPosX(10 + 2 * (tick:GetSizeX() + 4))
  tick:SetPosY(110 + 0 * (tick:GetSizeY() + 10))
  TABLE_TAB4[itemIndex] = tick
  itemIndex = itemIndex + 1
  actionName:SetPosX(10 + 3 * (actionName:GetSizeX() + 4))
  actionName:SetPosY(110 + 0 * (actionName:GetSizeY() + 10))
  TABLE_TAB4[itemIndex] = actionName
end
function TeleportBelia1()
  ToClient_qaTeleport(7469, -7815, 83716)
end
function TeleportBelia2()
  ToClient_qaTeleport(24271, -6276, 73371)
end
function TeleportHeidel1()
  ToClient_qaTeleport(37144, -2970, -45723)
end
function TeleportHeidel2()
  ToClient_qaTeleport(48114, 504, -23702)
end
function TeleportCalpheon1()
  ToClient_qaTeleport(-255487, -2714, -38003)
end
function TeleportCalpheon2()
  ToClient_qaTeleport(-265580, -1054, -63041)
end
function TeleportAltinova1()
  ToClient_qaTeleport(364090, -4955, -74319)
end
function TeleportValencia1()
  ToClient_qaTeleport(1032889, 11015, 191611)
end
function TeleportGrana1()
  ToClient_qaTeleport(-513551, 8993, -455350)
end
function TeleportDuvencrune1()
  ToClient_qaTeleport(-48357, 21828, -404589)
end
function TeleportArehaza()
  ToClient_qaTeleport(1270167, -3799, 176849)
end
function KutumTest()
  ToClient_qaTeleport(531159, 5820, 162207)
end
function NouverTest()
  ToClient_qaTeleport(729435, 12348, 4370)
end
function KarandaTest()
  Proc_ShowMessage_Ack("ì¹´ë€ë‹¤ : 23060")
  ToClient_qaTeleport(-142688, 18907, 47731)
end
function KzarkaTest()
  Proc_ShowMessage_Ack("í¬ìì¹´ : 23001")
  ToClient_qaTeleport(52490, 652, -191068)
end
function OpinTest()
  ToClient_qaTeleport(-455712, 12045, -354960)
end
function MurakaTest()
  ToClient_qaTeleport(-400610, 9117, -106154)
end
function QuintTest()
  ToClient_qaTeleport(-333958, -61, 15014)
end
function GarmothTest()
  ToClient_qaTeleport(-23638, 9224, -324144)
end
function VellTest()
  ToClient_qaTeleport(-102400, -8150, 947200)
end
function SycridTest()
  ToClient_qaTeleport(159520, -27351, 431993)
end
function RednoseTest()
  ToClient_qaTeleport(-62791, -3745, 55418)
end
function BhegTest()
  Proc_ShowMessage_Ack("ë² ê·¸ : 23703")
  ToClient_qaTeleport(33357, -4306, 5408)
end
function MudTest()
  ToClient_qaTeleport(33072, 382, -111951)
end
function DimTreeSpiritTest()
  Proc_ShowMessage_Ack("ìš°ë‘” : 23006")
  ToClient_qaTeleport(-49166, -4256, 27242)
end
function CreateAllBossKnowledge()
  ToClient_qaCreateItem(34082, 0, 1)
  ToClient_qaCreateItem(34920, 0, 1)
  ToClient_qaCreateItem(34389, 0, 1)
  ToClient_qaCreateItem(34370, 0, 1)
  ToClient_qaCreateItem(35056, 0, 1)
  ToClient_qaCreateItem(35057, 0, 1)
  ToClient_qaCreateItem(35059, 0, 1)
  ToClient_qaCreateItem(35154, 0, 1)
  ToClient_qaCreateItem(34013, 0, 1)
  ToClient_qaCreateItem(34022, 0, 1)
  ToClient_qaCreateItem(34110, 0, 1)
end
function TeleportCrescent()
  ToClient_qaCreateItem(6656, 0, 20)
  ToClient_qaCreateItem(9306, 0, 5)
  ToClient_qaTeleport(727117, 24334, -179501)
end
function TeleportBasilisk()
  ToClient_qaTeleport(379581, -456, 58433)
end
function TeleportAakman()
  ToClient_qaCreateItem(6656, 0, 20)
  ToClient_qaCreateItem(9306, 0, 5)
  ToClient_qaTeleport(671915, -3196, 146474)
end
function TeleportHystria()
  ToClient_qaCreateItem(6656, 0, 20)
  ToClient_qaCreateItem(9306, 0, 5)
  ToClient_qaTeleport(1001914, -5151, 4470)
end
function TeleportPilaKu()
  ToClient_qaCreateItem(6656, 0, 20)
  ToClient_qaCreateItem(9306, 0, 5)
  ToClient_qaTeleport(1146486, 17403, -82183)
end
function TeleportMirumok()
  ToClient_qaTeleport(-462621, 12951, -340087)
end
function TeleportUnderwater()
  ToClient_qaTeleport(149967, -37602, 408723)
end
function TeleportSycraia()
  ToClient_qaTeleport(113194, -35505, 423754)
end
function TeleportStarGrave()
  ToClient_qaTeleport(-538788, -1206, -96536)
end
function TeleportRatt()
  ToClient_qaTeleport(-1263753, -7695, 1513345)
end
function TeleportNorthMagoria()
  ToClient_qaTeleport(-1245782, -8208, 751261)
end
function TeleportMiddleMagoria()
  ToClient_qaTeleport(-1159354, -8208, 523806)
end
function TeleportSouthMagoria()
  ToClient_qaTeleport(-857164, -8208, 450816)
end
function TeleportAtoraxxion1()
  ToClient_qaTeleport(687613, 34514, -417016)
end
function TeleportAtoraxxion2()
  ToClient_qaTeleport(831478, 22409, -444387)
end
function TeleportValenciaCastle()
  ToClient_qaTeleport(1147705, 15888, 292641)
end
function TeleportOkillua()
  ToClient_qaTeleport(-99656, -7879, 613763)
  chatting_sendMessage("", "/setBossSpawnStatus 4 5 0", CppEnums.ChatType.Private)
end
function TeleportCalpheonCastle()
  ToClient_qaTeleport(-347334, 1550, -53300)
end
function CheckServerTime()
  pa_sendMessage("/checkservertime")
end
function CheckSiegeTerritory()
  pa_sendMessage("/checksiegeTerritory")
end
function OpenWareHouseMaidForQA(param0)
  PaGlobalFunc_MaidList_All_SelectMaid(param0)
end
function SetForServantQA()
  ToClient_qaLevelUp(60)
  ToClient_qaCreateItem(1, 0, 1)
  ToClient_qaCreateItem(149003, 0, 1)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1000, false, 0, 149003, 0)
  luaTimer_AddEvent(Proc_ShowMessage_Ack, 2000, false, 0, "\"ë§ˆêµ¬ê°„ í…ŒìŠ¤íŠ¸ ì „ì— ë©”ì´ë“œë¡œ ì°½ê³ ì— 1ì€í™”ë¥¼ ë„£ì–´ì£¼ì„¸ìš”\"")
  luaTimer_AddEvent(OpenWareHouseMaidForQA, 2000, false, 0, 1)
end
function Wp300()
  ToClient_qaCreateItem(753019, 0, 100)
end
function killmonsterquest()
  ToClient_qaCompleteQuest(11263, 2)
  pa_sendMessage("/questaccept 11262 33")
end
function SetPhysical30()
  ToClient_qaCreateItem(65489, 0, 1)
  ToClient_qaCreateItem(65490, 0, 1)
  ToClient_qaCreateItem(65491, 0, 1)
end
function CreateKnowledge()
  pa_sendMessage("/create item 30001~31200 1")
  pa_sendMessage("/create item 33001~33500 1")
end
function ContributionExp()
  ToClient_qaCreateItem(440, 0, 10)
end
function SetGMItem()
  ToClient_qaCreateItem(65000, 0, 2)
  ToClient_qaCreateItem(65001, 0, 1)
  ToClient_qaCreateItem(65002, 0, 1)
  ToClient_qaCreateItem(65003, 0, 1)
  ToClient_qaCreateItem(65004, 0, 1)
end
function EncreaseWeightBag()
  ToClient_qaCreateItem(65488, 0, 2)
  local maxWeight_str = tostring(getSelfPlayer():get():getPossessableWeight_s64())
  local maxWeightLT = tonumber(maxWeight_str) / 10000
  if maxWeightLT > 3000 then
    Proc_ShowMessage_Ack("ë” ì´ìƒ ë¬´ê²Œë¥¼ ëŠ˜ë¦´ ìˆ˜ ì—†ìŠµë‹ˆë‹¤. ë” í•„ìš”í•˜ë‹¤ë©´ ìƒì„±í•´ì„œ ì‚¬ìš©í•˜ì„¸ìš”.")
  else
    ToClient_qaCreateItem(65487, 0, 1)
  end
end
function Set4thFairy()
  local FairyUnseal = ToClient_getFairyUnsealedList()
  local FairySeal = ToClient_getFairySealedList()
  if FairyUnseal == 0 then
    if FairySeal == 0 then
      chatting_sendMessage("", "/pet create 55240", CppEnums.ChatType.Public)
    else
      Proc_ShowMessage_Ack("ìš”ì •ì´ ì´ë¯¸ ë“±ë¡ë˜ì–´ ìˆìŠµë‹ˆë‹¤.")
      return
    end
  else
    Proc_ShowMessage_Ack("ìš”ì •ì´ ì´ë¯¸ ì†Œí™˜ëœ ìƒíƒœì…ë‹ˆë‹¤.")
    return
  end
  luaTimer_AddEvent(InputMLClick_FairyInfo_SummonFairy_All, 1000, false, 0)
  luaTimer_AddEvent(chatting_sendMessage, 2000, false, 0, "", "/newpet lvup -1 40", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet learnskill -1 49130,49129,49110,49111,49119", CppEnums.ChatType.Public)
end
function Set5thPet()
  ToClient_qaCompleteQuest(893, 2)
  ToClient_qaCreateItem(59376, 0, 5)
  ToClient_qaTeleport(-358896, 3658, -438234)
end
function Set4thPets()
  local unSealPetCount = ToClient_getPetUnsealedList()
  if unSealPetCount > 30 then
    Proc_ShowMessage_Ack("í«ì´ ë„ˆë¬´ ë§ì•„ ìƒì„±ì´ ì œí•œë©ë‹ˆë‹¤.")
    return
  else
    chatting_sendMessage("", "/pet create 55128", CppEnums.ChatType.Public)
    chatting_sendMessage("", "/pet create 55162", CppEnums.ChatType.Public)
    chatting_sendMessage("", "/pet create 55135", CppEnums.ChatType.Public)
    chatting_sendMessage("", "/pet create 55085", CppEnums.ChatType.Public)
    chatting_sendMessage("", "/pet create 55095", CppEnums.ChatType.Public)
    luaTimer_AddEvent(PaGlobal_PetList_AllUnSeal_ForQA, 0, false, 0)
    luaTimer_AddEvent(PaGlobal_PetList_ReverseAllUnSeal_ForQA, 2000, false, 0)
    luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet lvup 0 10", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet lvup 1 10", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet lvup 2 10", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet lvup 3 10", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 3000, false, 0, "", "/newpet lvup 4 10", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 4000, false, 0, "", "/newpet learnskill 0 49001,49002,49003", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 4000, false, 0, "", "/newpet learnskill 1 49001,49002,49003", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 4000, false, 0, "", "/newpet learnskill 2 49001,49002,49003", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 4000, false, 0, "", "/newpet learnskill 3 49001,49002,49003", CppEnums.ChatType.Public)
    luaTimer_AddEvent(chatting_sendMessage, 4000, false, 0, "", "/newpet learnskill 4 49001,49002,49003", CppEnums.ChatType.Public)
  end
end
function AddHungryFull()
  chatting_sendMessage("", "/newpet addhungry 0 400 0", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/newpet addhungry 1 400 0", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/newpet addhungry 2 400 0", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/newpet addhungry 3 400 0", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/newpet addhungry 4 400 0", CppEnums.ChatType.Public)
end
function CreateHorseEquip()
  ToClient_qaCreateItem(52504, 10, 1)
  ToClient_qaCreateItem(52604, 10, 1)
  ToClient_qaCreateItem(52704, 10, 1)
  ToClient_qaCreateItem(52804, 10, 1)
  ToClient_qaCreateItem(52904, 10, 1)
  ToClient_qaCreateItem(705156, 0, 1)
  ToClient_qaCreateItem(797, 0, 10)
  ToClient_qaCreateItem(47967, 0, 1)
  if true == CheckIsExistUnsealVehicle() then
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2000, false, 0, 52504, 10)
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2100, false, 0, 52604, 10)
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2200, false, 0, 52704, 10)
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2300, false, 0, 52804, 10)
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2400, false, 0, 52904, 10)
  end
end
function CheckIsExistUnsealVehicle()
  local temporaryWrapper = getTemporaryInformationWrapper()
  servantInfo = temporaryWrapper:getUnsealVehicle(0)
  return nil ~= servantInfo
end
function CreateHorse()
  if true == CheckIsExistUnsealVehicle() then
    Proc_ShowMessage_Ack("ì´ë¯¸ ë§ì„ ì†Œí™˜í•œ ìƒíƒœì…ë‹ˆë‹¤.")
  else
    ToClient_qaCreateServant(9883, 1)
  end
end
function CreateAduahnott()
  if true == CheckIsExistUnsealVehicle() then
    Proc_ShowMessage_Ack("ì´ë¯¸ ë§ì„ ì†Œí™˜í•œ ìƒíƒœì…ë‹ˆë‹¤.")
  else
    ToClient_qaCreateServant(9889, 1)
  end
end
function CreateDine()
  if true == CheckIsExistUnsealVehicle() then
    Proc_ShowMessage_Ack("ì´ë¯¸ ë§ì„ ì†Œí™˜í•œ ìƒíƒœì…ë‹ˆë‹¤.")
  else
    ToClient_qaCreateServant(9888, 1)
  end
end
function CreateDoom()
  if true == CheckIsExistUnsealVehicle() then
    Proc_ShowMessage_Ack("ì´ë¯¸ ë§ì„ ì†Œí™˜í•œ ìƒíƒœì…ë‹ˆë‹¤.")
  else
    ToClient_qaCreateServant(9887, 1)
  end
end
function LearnDrivingSkill()
  ToClient_qaLearnHorseSkill(3)
  ToClient_qaLearnHorseSkill(4)
  ToClient_qaLearnHorseSkill(5)
  ToClient_qaLearnHorseSkill(6)
  ToClient_qaLearnHorseSkill(7)
  ToClient_qaLearnHorseSkill(8)
  ToClient_qaLearnHorseSkill(9)
  ToClient_qaLearnHorseSkill(10)
  ToClient_qaLearnHorseSkill(11)
  ToClient_qaLearnHorseSkill(12)
  ToClient_qaLearnHorseSkill(15)
  ToClient_qaLearnHorseSkill(18)
  ToClient_qaLearnHorseSkill(19)
end
function LearnAduahnottSkill()
  ToClient_qaLearnHorseSkill(45)
  ToClient_qaLearnHorseSkill(52)
end
function LearnDineSkill()
  ToClient_qaLearnHorseSkill(45)
  ToClient_qaLearnHorseSkill(53)
end
function LearnDoomSkill()
  ToClient_qaLearnHorseSkill(45)
  ToClient_qaLearnHorseSkill(54)
end
function ServantSkillAllMaster()
  ToClient_qaSetServantSkillExp(0, 1000000)
end
function harpoonfishing()
  if true == IsSelfPlayerSwimmingAction() then
    ToClient_qaCreateServant(9065, 1)
    ToClient_qaCreateItem(16154, 0, 1)
    ToClient_qaCreateItem(16155, 0, 1)
    ToClient_qaCreateItem(65424, 0, 100)
    pa_sendMessage("/lifelvup 81 1")
  else
    chatting_sendMessage("", "/teleport 79264 -8208 256421", CppEnums.ChatType.Public)
    chatting_sendMessage("", "í…”ë ˆí¬íŠ¸ ì´í›„ í•œ ë²ˆ ë” ëˆŒëŸ¬ì£¼ì„¸ìš”.", CppEnums.ChatType.System)
  end
end
function createSailboat()
  if true == IsSelfPlayerSwimmingAction() then
    ToClient_qaCreateServant(31056, 1)
    ToClient_qaCreateItem(54027, 0, 50)
    ToClient_qaCreateItem(49766, 10, 1)
    ToClient_qaCreateItem(49767, 10, 1)
    ToClient_qaCreateItem(49768, 10, 1)
    ToClient_qaCreateItem(49769, 10, 1)
    ToClient_qaCreateItem(49721, 0, 1)
    chatting_sendMessage("", "/lifelvup 51 9", CppEnums.ChatType.Public)
    ToClient_qaCreateItem(44944, 0, 1)
    ToClient_qaCreateItem(6394, 0, 50)
    ToClient_qaCreateItem(6395, 0, 50)
  else
    ToClient_qaCreateItem(49031, 0, 1)
    ToClient_qaCreateItem(54027, 0, 50)
    ToClient_qaCreateItem(49766, 10, 1)
    ToClient_qaCreateItem(49767, 10, 1)
    ToClient_qaCreateItem(49768, 10, 1)
    ToClient_qaCreateItem(49769, 10, 1)
    ToClient_qaCreateItem(49721, 0, 1)
    chatting_sendMessage("", "/lifelvup 51 9", CppEnums.ChatType.Public)
    ToClient_qaCreateItem(44944, 0, 1)
    ToClient_qaCreateItem(6394, 0, 50)
    ToClient_qaCreateItem(6395, 0, 50)
  end
end
function DesertSupport()
  ToClient_qaCreateItem(16012, 0, 1)
  ToClient_qaCreateItem(44942, 0, 1)
  ToClient_qaCreateItem(6656, 0, 50)
  ToClient_qaCreateItem(9306, 0, 10)
  ToClient_qaCreateItem(9366, 0, 10)
  ToClient_qaCreateItem(17976, 0, 1)
end
function OceanSupport()
  ToClient_qaCreateItem(16012, 0, 1)
  ToClient_qaCreateItem(44944, 0, 1)
  ToClient_qaCreateItem(16017, 0, 10)
  ToClient_qaCreateItem(263, 0, 5)
end
function DespawnAllBoss()
  chatting_sendMessage("", "ëª¨ë“  ë³´ìŠ¤ ìì—°ì‚¬ì‹œí‚¤ê² ìŠµë‹ˆë‹¤.", CppEnums.ChatType.World)
  chatting_sendMessage("", "/changeallmonsterai timeoutboss 0", CppEnums.ChatType.Public)
end
function ResetAllBossHP()
  chatting_sendMessage("", "ëª¨ë“  ë³´ìŠ¤ ì²´ë ¥ ì´ˆê¸°í™”í•©ë‹ˆë‹¤.", CppEnums.ChatType.World)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23073", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23032", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23001", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23060", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23099", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23102", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23097", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23809", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23810", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23811", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23812", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23813", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23814", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23815", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23816", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23817", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23120", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23136", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23137", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23138", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23139", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23140", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23080", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetBossHpUpdateTime 23085", CppEnums.ChatType.Public)
end
function SummonVell()
  luaTimer_AddEvent(chatting_sendMessage, 0, false, 0, "", "ë²¨ ì†Œí™˜í•˜ê² ìŠµë‹ˆë‹¤.", CppEnums.ChatType.World)
  luaTimer_AddEvent(chatting_sendMessage, 200, false, 0, "", "/resetBossHpUpdate 23080", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 400, false, 0, "", "/resetBossHpUpdate 23085", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 600, false, 0, "", "/killnearallmonster", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 750, false, 0, "", "/create monster 23080 1", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 800, false, 0, "", "/create monster 23085 1", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 8800, false, 0, "", "/changeallmonsterai ready 0", CppEnums.ChatType.Public)
  luaTimer_AddEvent(chatting_sendMessage, 14900, false, 0, "", "/changeallmonsterai comeonbell 0", CppEnums.ChatType.Public)
end
function HadumBuff1()
  ToClient_qaCreateItem(757398, 0, 1)
end
function HadumBuff2()
  ToClient_qaCreateItem(757399, 0, 1)
end
function HadumBuff3()
  ToClient_qaCreateItem(757400, 0, 1)
end
function CreateAlchemyStone()
  ToClient_qaCreateItem(45220, 0, 1)
  ToClient_qaCreateItem(45252, 0, 1)
  ToClient_qaCreateItem(45284, 0, 1)
  ToClient_qaCreateItem(45224, 0, 1)
  ToClient_qaCreateItem(45256, 0, 1)
  ToClient_qaCreateItem(45288, 0, 1)
  ToClient_qaCreateItem(45332, 0, 1)
  ToClient_qaCreateItem(45381, 0, 1)
  ToClient_qaCreateItem(750524, 0, 1)
  ToClient_qaCreateItem(8421, 0, 10)
  ToClient_qaCreateItem(4053, 0, 300)
  ToClient_qaCreateItem(5466, 0, 300)
  ToClient_qaCreateItem(4656, 0, 300)
  ToClient_qaCreateItem(4924, 0, 300)
end
function CreateManosAcc(enchantLevel)
  if nil == enchantLevel then
    for enchantLevel = 0, 5 do
      ToClient_qaCreateItem(705509, enchantLevel, 1)
      ToClient_qaCreateItem(705510, enchantLevel, 2)
      ToClient_qaCreateItem(705511, enchantLevel, 2)
      ToClient_qaCreateItem(705512, enchantLevel, 1)
    end
  elseif enchantLevel < 6 and enchantLevel >= 0 then
    ToClient_qaCreateItem(705509, enchantLevel, 1)
    ToClient_qaCreateItem(705510, enchantLevel, 2)
    ToClient_qaCreateItem(705511, enchantLevel, 2)
    ToClient_qaCreateItem(705512, enchantLevel, 1)
  else
    return
  end
end
function CreateAttAcc(enchantLevel)
  if nil == enchantLevel then
    CreateAttAcc(20)
    CreateAttAcc(19)
    CreateAttAcc(18)
    return
  elseif enchantLevel < 15 then
    enchantLevel = 15
  end
  ToClient_qaCreateItem(12031, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11828, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11853, enchantLevel - 15, 2)
  ToClient_qaCreateItem(12230, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11607, enchantLevel - 15, 1)
end
function CreateDefAcc(enchantLevel)
  if nil == enchantLevel then
    CreateDefAcc(20)
    CreateDefAcc(19)
    CreateDefAcc(18)
    return
  elseif enchantLevel < 15 then
    enchantLevel = 15
  end
  ToClient_qaCreateItem(12032, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11926, enchantLevel - 15, 2)
  ToClient_qaCreateItem(12229, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11611, enchantLevel - 15, 1)
end
function CreateBalAcc(enchantLevel)
  if nil == enchantLevel then
    CreateBalAcc(20)
    CreateBalAcc(19)
    CreateBalAcc(18)
    return
  elseif enchantLevel < 15 then
    enchantLevel = 15
  end
  ToClient_qaCreateItem(11834, enchantLevel - 15, 2)
  ToClient_qaCreateItem(12251, enchantLevel - 15, 1)
  ToClient_qaCreateItem(12229, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11625, enchantLevel - 15, 1)
end
function CreateTunAcc(enchantLevel)
  if nil == enchantLevel then
    CreateTunAcc(20)
    CreateTunAcc(19)
    CreateTunAcc(18)
    return
  elseif enchantLevel < 15 then
    enchantLevel = 15
  end
  ToClient_qaCreateItem(12061, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11828, enchantLevel - 15, 2)
  ToClient_qaCreateItem(12237, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11629, enchantLevel - 15, 1)
end
function CreateAttAcc1(enchantLevel)
  if nil == enchantLevel then
    CreateAttAcc1(20)
    CreateAttAcc1(19)
    CreateAttAcc1(18)
    return
  elseif enchantLevel < 15 then
    enchantLevel = 15
  end
  ToClient_qaCreateItem(12060, enchantLevel - 15, 2)
  ToClient_qaCreateItem(12061, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11853, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11828, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11834, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11855, enchantLevel - 15, 2)
  ToClient_qaCreateItem(11653, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11629, enchantLevel - 15, 1)
  ToClient_qaCreateItem(11663, enchantLevel - 15, 1)
  ToClient_qaCreateItem(12276, enchantLevel - 15, 1)
  ToClient_qaCreateItem(12236, enchantLevel - 15, 1)
  ToClient_qaCreateItem(12237, enchantLevel - 15, 1)
  ToClient_qaCreateItem(12257, enchantLevel - 15, 2)
end
function jumpitem()
  ToClient_qaCreateItem(10821, 20, 1)
  ToClient_qaCreateItem(10822, 20, 1)
  ToClient_qaCreateItem(10823, 20, 1)
  ToClient_qaCreateItem(11008, 20, 1)
  ToClient_qaCreateItem(622, 0, 50)
  ToClient_qaCreateItem(15213, 0, 2)
  ToClient_qaCreateItem(934, 0, 1)
  ToClient_qaCreateItem(44940, 0, 1)
  ToClient_qaCreateItem(9241, 0, 10)
end
function PriDuoWeapon()
  createBossWeapon(17)
  createBossWeapon(16)
end
function PriDuoArmor()
  createBossArmor(17)
  createBossArmor(16)
end
function PriDuoAcc()
  CreateAttAcc(17)
  CreateAttAcc(16)
end
function PriDuoDefAcc()
  CreateDefAcc(17)
  CreateDefAcc(16)
end
function PriDuoBalAcc()
  CreateBalAcc(17)
  CreateBalAcc(16)
end
function PriDuoTunAcc()
  CreateTunAcc(17)
  CreateTunAcc(16)
end
function TriTetPenWeapon()
  createBossWeapon(20)
  createBossWeapon(19)
  createBossWeapon(18)
end
function TriTetPenArmor()
  createBossArmor(20)
  createBossArmor(19)
  createBossArmor(18)
end
function TriTetPenAcc()
  CreateAttAcc(20)
  CreateAttAcc(19)
  CreateAttAcc(18)
end
function CreateSkillinstructor()
  pa_sendMessage("/create monster 41009 1 1 1")
end
function CreateEqiupRepairNPC()
  pa_sendMessage("/create monster 40008 1 1 1")
  pa_sendMessage("/create item 1 1000000")
end
function KillNearAllMonster()
  chatting_sendMessage("", "/killnearallmonster", CppEnums.ChatType.Public)
end
function LootNearAll()
  chatting_sendMessage("", "/lootnearall", CppEnums.ChatType.Public)
end
function TeleportToDestination()
  chatting_sendMessage("", "/teleport", CppEnums.ChatType.Public)
end
function ShowCharacterKey()
  local interactableActor = interaction_getInteractable()
  local characterKeyRaw
  if interactableActor ~= nil then
    characterKeyRaw = interactableActor:getCharacterKeyRaw()
    Proc_ShowMessage_Ack("ìºë¦­í„° í‚¤ : " .. tostring(characterKeyRaw))
  else
    Proc_ShowMessage_Ack("ì¸í„°ë™ì…˜ í›„ ë‹¤ì‹œ ì‹œë„í•´ì£¼ì„¸ìš”.")
    return
  end
end
function SetMyHp(value)
  local selfPlayer = getSelfPlayer()
  local mycharactername = selfPlayer:getName()
  chatting_sendMessage("", "/sethp " .. tostring(mycharactername) .. " " .. tostring(value), CppEnums.ChatType.Public)
end
function ClearPlayerSkillCoolTime()
  chatting_sendMessage("", "/clearplayerskillcooltime", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/resetPresetCooltime", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/dolua ToClient_ResetEmergencyEvade()", CppEnums.ChatType.Public)
end
function ClearBuff()
  chatting_sendMessage("", "/clearSelfPlayerAllBuff", CppEnums.ChatType.Public)
end
function WarReady20()
  chatting_sendMessage("", "/dolua warready(20)", CppEnums.ChatType.Public)
end
function RecoverWp()
  local selfPlayer = getSelfPlayer()
  local myWp = selfPlayer:getWp()
  local myMaxWp = selfPlayer:getMaxWp()
  local emptyWp = myMaxWp - myWp
  if myMaxWp == myWp then
    Proc_ShowMessage_Ack("í˜„ì¬ ê¸°ìš´ì´ ìµœëŒ€ì¹˜ì…ë‹ˆë‹¤.")
  elseif myWp < myMaxWp then
    chatting_sendMessage("", "/mentalup " .. tostring(emptyWp), CppEnums.ChatType.Public)
  else
    return
  end
end
function UpAdrenalin()
  chatting_sendMessage("", "/upadrenalin 50000", CppEnums.ChatType.Public)
end
function PrintHereCopy()
  chatting_sendMessage("", "/print ì—¬ê¸°ë³µì‚¬", CppEnums.ChatType.Public)
end
function ReloadUI()
  chatting_sendMessage("", "/reloadui", CppEnums.ChatType.Public)
end
function GetHpHereCopy()
  chatting_sendMessage("", "/getHp", CppEnums.ChatType.Public)
end
function ItemBoxGo(isOn)
  if nil == isOn then
    return
  end
  if false == ToClient_IsDevelopment() then
    return
  end
  if 0 == isOn then
    boxValue = false
    HandleEventLUp_RandomBoxSelect_All_OnPressEscape()
  elseif 1 == isOn then
    boxValue = true
  end
end
function ItemBoxGoXXX()
  if false == ToClient_IsDevelopment() then
    return false
  end
  if nil == boxValue then
    return false
  end
  return boxValue
end
function SetFullBuff()
  ToClient_qaCreateItem(43706, 0, 1)
  ToClient_qaCreateItem(43934, 0, 1)
  ToClient_qaCreateItem(9693, 0, 1)
  ToClient_qaCreateItem(734, 0, 2)
  ToClient_qaCreateItem(795, 0, 2)
  ToClient_qaCreateItem(793, 0, 2)
  ToClient_qaCreateItem(752046, 0, 1)
end
function SetGoldbarBuff()
  ToClient_qaCreateItem(752017, 0, 1)
  ToClient_qaCreateItem(752018, 0, 1)
end
function ItemdropBuff()
  ToClient_qaCreateItem(17081, 0, 1)
  ToClient_qaCreateItem(17572, 0, 10)
  ToClient_qaCreateItem(46866, 0, 10)
  ToClient_qaCreateItem(750493, 0, 2)
  ToClient_qaCreateItem(752229, 0, 5)
  ToClient_qaCreateItem(750642, 0, 1)
end
function criBuff()
  ToClient_qaCreateItem(942, 0, 1)
end
function CreateKzarka()
  chatting_sendMessage("", "/create monster 23001 1", CppEnums.ChatType.Public)
end
function CreateKaranda()
  chatting_sendMessage("", "/create monster 23060 1", CppEnums.ChatType.Public)
end
function CreateGarmoth()
  chatting_sendMessage("", "/create monster 23120 1", CppEnums.ChatType.Public)
end
function VaryFeverPoint(point)
  chatting_sendMessage("", "/VaryFeverPoint " .. point, CppEnums.ChatType.Public)
end
function SetMyTendency(value)
  local selfPlayer = getSelfPlayer()
  local mycharactername = selfPlayer:getName()
  chatting_sendMessage("", "/tendency " .. tostring(mycharactername) .. " " .. tostring(value), CppEnums.ChatType.Public)
end
function TeleportSeaMonster()
  chatting_sendMessage("", "/create item 49770~49774 1 10", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/create item 54025 1000", CppEnums.ChatType.Public)
  ToClient_qaTeleport(-486400, -8208, 1420800)
end
function TeleportBloodyMonastery()
  ToClient_qaTeleport(-33666, 3579, -171435)
end
function TeleportHexe()
  ToClient_qaTeleport(-230743, 5946, -251172)
end
function SetTrSleepTick()
  local trID = UI.getChildControl(QASupport_AutomationPanel, "Edit_TrID"):GetEditText()
  local TickCount = UI.getChildControl(QASupport_AutomationPanel, "Edit_Tick"):GetEditText()
  local actionName = UI.getChildControl(QASupport_AutomationPanel, "Edit_ActionName"):GetEditText()
  ToClient_setTrSleepTick(trID, TickCount, tostring(actionName))
end
function siegeready1()
  EncreaseWeightBag()
  ToClient_qaCreateItem(56708, 0, 1)
  ToClient_qaCreateItem(56709, 0, 1)
  ToClient_qaCreateItem(56710, 0, 1)
  ToClient_qaCreateItem(56711, 0, 1)
  ToClient_qaCreateItem(56773, 0, 1)
  ToClient_qaCreateItem(56774, 0, 1)
  ToClient_qaCreateItem(56775, 0, 1)
  ToClient_qaCreateItem(56776, 0, 1)
  ToClient_qaCreateItem(56777, 0, 1)
end
function siegeready2()
  EncreaseWeightBag()
  ToClient_qaCreateItem(59791, 0, 20)
  ToClient_qaCreateItem(56122, 0, 10)
  ToClient_qaCreateItem(56171, 0, 1)
  ToClient_qaCreateItem(56173, 0, 1)
  ToClient_qaCreateItem(56003, 0, 10)
  ToClient_qaCreateItem(56051, 0, 10)
  ToClient_qaCreateItem(56052, 0, 10)
  ToClient_qaCreateItem(4077, 0, 200)
  ToClient_qaCreateItem(4257, 0, 200)
  ToClient_qaCreateItem(56067, 0, 10)
  ToClient_qaCreateItem(56068, 0, 10)
  ToClient_qaCreateItem(4052, 0, 200)
  ToClient_qaCreateItem(4057, 0, 200)
end
function siegeready3()
  chatting_sendMessage("", "/dolua siegeready(3)", CppEnums.ChatType.Public)
end
function siegeready4()
  chatting_sendMessage("", "/dolua siegeready(4)", CppEnums.ChatType.Public)
end
function siegeready0()
  chatting_sendMessage("", "/dolua siegeready(0)", CppEnums.ChatType.Public)
end
function decreaseendurance()
  chatting_sendMessage("", "/decreaseendurance 49", CppEnums.ChatType.Public)
end
