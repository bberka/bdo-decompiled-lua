local UseRecordFailReasons = {
  NoError = 0,
  InvalidRecord = 1,
  NoMaterial = 2,
  NoMaterialCount = 3
}
PaGlobal_RecentCook = {
  _isCook = false,
  _maxRecordCount = 10,
  _ui = {
    _title = UI.getChildControl(Panel_RecentCook, "StaticText_TitleName")
  }
}
function PaGlobal_RecentCook:initialize()
  local ui = self._ui
  local recentRecordGroup = {}
  self._maxMaterialCount = 5
  ui._buttonClose = UI.getChildControl(Panel_RecentCook, "Button_Close")
  recentRecordGroup[1] = UI.getChildControl(Panel_RecentCook, "Static_CookRecipeBG")
  local posY = recentRecordGroup[1]:GetPosY()
  for recordIndex = 2, self._maxRecordCount do
    posY = posY + recentRecordGroup[1]:GetSizeY() + 2
    recentRecordGroup[recordIndex] = UI.cloneControl(recentRecordGroup[1], Panel_RecentCook, "Static_CookRecipeBG_" .. recordIndex)
    recentRecordGroup[recordIndex]:SetPosY(posY)
  end
  ui._buttonClose:addInputEvent("Mouse_LUp", "PaGlobal_RecentCook:closePanel()")
  ui._recordList = {}
  for recordIndex = 1, self._maxRecordCount do
    local uiRecordRow = {
      _staticBackground = recentRecordGroup[recordIndex],
      _staticTextRecordNumber = UI.getChildControl(recentRecordGroup[recordIndex], "StaticText_RecentCookNum"),
      _staticMaterialIcon = {},
      _buttonSetup = UI.getChildControl(recentRecordGroup[recordIndex], "Button_Setup")
    }
    uiRecordRow._staticTextRecordNumber:SetText(recordIndex)
    uiRecordRow._buttonSetup:addInputEvent("Mouse_LUp", "PaGlobal_RecentCook:selectAlchemyRecord(" .. recordIndex .. ")")
    for i = 1, self._maxMaterialCount do
      local slotIconParent = UI.getChildControl(recentRecordGroup[recordIndex], "Static_IconSlot" .. i)
      local slotIcon = {}
      slotIcon = SlotItem.new(slotIcon, "MaterialIcon_" .. recordIndex .. "_" .. i, i, slotIconParent, {
        createIcon = true,
        createBorder = true,
        createCount = true,
        createCash = true
      })
      slotIcon:createChild()
      slotIcon.icon:SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY())
      slotIcon.icon:addInputEvent("Mouse_On", "PaGlobal_RecentCook:handleMouseOn_MaterialIcon(" .. recordIndex .. "," .. i .. ")")
      slotIcon.icon:addInputEvent("Mouse_Out", "PaGlobal_RecentCook:handleMouseOut_MaterialIcon()")
      slotIcon.count:SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY() / 2)
      slotIcon.count:SetVerticalBottom()
      slotIcon.border:SetSize(slotIconParent:GetSizeX(), slotIconParent:GetSizeY())
      slotIcon.border:SetPosXY(0, 0)
      uiRecordRow._staticMaterialIcon[i] = slotIcon
    end
    ui._recordList[recordIndex] = uiRecordRow
  end
  self:clearAlchemyRecord()
end
function PaGlobal_RecentCook:showPanel(knowledgeIndex, isCook, posX, posY)
  self:clearAlchemyRecord()
  ToClient_AlchemyRequestRecord(knowledgeIndex)
  self._isCook = isCook
  Panel_RecentCook:SetShow(true)
  Panel_RecentCook:SetPosXY(posX, posY)
  if isCook then
    self._ui._title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTCOOKTITLE"))
  else
    self._ui._title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTALCHEMYTITLE"))
  end
end
function PaGlobal_RecentCook:closePanel()
  Panel_RecentCook:SetShow(false)
  Panel_Tooltip_Item_hideTooltip()
end
function PaGlobal_RecentCook:clearAlchemyRecord()
  for recordIndex = 1, self._maxRecordCount do
    local materials = self._ui._recordList[recordIndex]._staticMaterialIcon
    for mtlIndex = 1, self._maxMaterialCount do
      materials[mtlIndex]:clearItem()
      materials[mtlIndex].icon:SetIgnore(true)
    end
    self._ui._recordList[recordIndex]._staticBackground:SetAlpha(0)
    self._ui._recordList[recordIndex]._staticTextRecordNumber:SetShow(false)
    self._ui._recordList[recordIndex]._buttonSetup:SetIgnore(true)
    self._ui._recordList[recordIndex]._buttonSetup:SetShow(true)
    self._ui._recordList[recordIndex]._buttonSetup:SetMonoTone(true)
    self._ui._recordList[recordIndex]._buttonSetup:SetText("<PAColor0xFF686869>" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORLDMAP_GUILDHOUSE_CHANGEWORKER_SELECTBTN") .. "<PAOldColor>")
  end
end
function PaGlobal_RecentCook:updateAlchemyRecord()
  if true == _ContentsGroup_UsePadSnapping or true == _ContentsGroup_RenewUI then
    if true == PaGlobalFunc_Alchemy_All_IsCook() then
      self._ui._title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTCOOKTITLE"))
    else
      self._ui._title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTALCHEMYTITLE"))
    end
    Panel_RecentCook:SetShow(true)
    Panel_RecentCook:SetPosXY(Panel_Window_Alchemy_All:GetPosX() - (Panel_RecentCook:GetSizeX() + 5), Panel_Window_Alchemy_All:GetPosY() + 50)
    Panel_RecentCook:ComputePos()
  end
  local recordCount = ToClient_AlchemyGetRecordCount()
  for recordIndex = 1, recordCount do
    local recordWrapper = ToClient_AlchemyGetRecord(recordIndex - 1)
    _PA_ASSERT(nil ~= recordWrapper, "ë°˜í™˜ëœ RecordCountì™€ ì‹¤ì œ RecordCountì˜ ê°œìˆ˜ê°€ ì¼ì¹˜í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.")
    local materialCount = recordWrapper:getMaterialCount()
    local uiRecord = self._ui._recordList[recordIndex]
    for i = 1, materialCount do
      local itemStaticWrapper = recordWrapper:getItemStaticStatusWrapper(i - 1)
      local itemCount = recordWrapper:getItemCount(i - 1)
      uiRecord._staticMaterialIcon[i]:setItemByStaticStatus(itemStaticWrapper, itemCount)
      uiRecord._staticMaterialIcon[i].icon:SetIgnore(false)
    end
    uiRecord._staticBackground:SetAlpha(1)
    uiRecord._staticTextRecordNumber:SetShow(true)
    uiRecord._buttonSetup:SetIgnore(false)
    uiRecord._buttonSetup:SetShow(true)
    uiRecord._buttonSetup:SetMonoTone(false)
    self._ui._recordList[recordIndex]._buttonSetup:SetText("<PAColor0xFFEDEDEE>" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_WORLDMAP_GUILDHOUSE_CHANGEWORKER_SELECTBTN") .. "<PAOldColor>")
  end
end
function PaGlobal_RecentCook:selectAlchemyRecord(recordIndex)
  if recordIndex < 1 or recordIndex > self._maxRecordCount then
    _PA_ASSERT("ì´ì¬ì¤€", "Record indexê°€ ì •ìƒ ë²”ìœ„ë¥¼ ë„˜ì–´ê°”ìŠµë‹ˆë‹¤(" .. recordIndex .. ")")
    return
  end
  local result = ToClient_AlchemyTryUseRecord(recordIndex - 1)
  if UseRecordFailReasons.NoError == result then
    PaGlobal_Alchemy_All_UpdateMaterialSlot()
  elseif UseRecordFailReasons.NoMaterial == result then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL"))
  elseif UseRecordFailReasons.NoMaterialCount == result then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL_COUNT"))
  elseif UseRecordFailReasons.InvalidRecord == result then
    _PA_ASSERT(false, "ìœ„ì—ì„œ record indexë¥¼ ì²´í¬í–ˆê¸° ë•Œë¬¸ì— ì´ ì¡°ê±´ì´ ë°œìƒí•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
  else
    _PA_ASSERT(false, "ìŠ¤í¬ë¦½íŠ¸ì— ë°˜ì˜ë˜ì§€ ì•Šì€ ìƒˆë¡œìš´ FailReasonì´ ì¶”ê°€ëœ ê²ƒ ê°™ìŠµë‹ˆë‹¤.")
  end
end
function PaGlobal_RecentCook:handleMouseOn_MaterialIcon(recordIndex, materialIndex)
  local recordWrapper = ToClient_AlchemyGetRecord(recordIndex - 1)
  if nil == recordWrapper then
    return
  end
  local itemStaticWrapper = recordWrapper:getItemStaticStatusWrapper(materialIndex - 1)
  if nil == itemStaticWrapper then
    return
  end
  local icon = self._ui._recordList[recordIndex]._staticMaterialIcon[materialIndex].icon
  Panel_Tooltip_Item_Show(itemStaticWrapper, icon, true, false, nil)
end
function PaGlobal_RecentCook:handleMouseOut_MaterialIcon()
  Panel_Tooltip_Item_hideTooltip()
end
function FromClient_UpdateAlchemyRecord_RecentCook(itemKey)
  PaGlobal_RecentCook:clearAlchemyRecord()
  PaGlobal_RecentCook:updateAlchemyRecord()
end
function FromClient_luaLoadComplete_PaGlobal_RecentCook()
  PaGlobal_RecentCook:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PaGlobal_RecentCook")
registerEvent("FromClient_UpdateAlchemyRecord", "FromClient_UpdateAlchemyRecord_RecentCook")
