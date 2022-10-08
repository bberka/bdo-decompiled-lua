if nil == UI then
  UI = {}
end
local defaultRenderMode = PAUIRenderModeBitSet({
  Defines.RenderMode.eRenderMode_Default
})
function UI.createPanel(strID, groupID)
  tempUIBaseForLua = nil
  createPanel(strID, groupID, defaultRenderMode)
  return tempUIBaseForLua
end
function UI.createPanelAndSetPanelRenderMode(strID, groupID, renderModeBitSet)
  tempUIBaseForLua = nil
  createPanel(strID, groupID, renderModeBitSet)
  return tempUIBaseForLua
end
function UI.createControl(uiType, parent, strID)
  tempUIBaseForLua = nil
  createControl(uiType, parent, strID)
  return tempUIBaseForLua
end
function UI.createAndCopyBasePropertyControl(fromParent, fromStrID, parent, strID)
  local fromControl = UI.getChildControl(fromParent, fromStrID)
  if nil == fromControl then
    UI.ASSERT(nil ~= fromControl and "number" ~= type(fromControl), fromStrID)
    return nil
  end
  fromControl:SetShow(false)
  tempUIBaseForLua = nil
  createControl(fromControl:GetType(), parent, strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(nil ~= tempUIBaseForLua and "number" ~= type(tempUIBaseForLua), strID)
    return nil
  end
  CopyBaseProperty(fromControl, tempUIBaseForLua)
  tempUIBaseForLua:SetShow(true)
  return tempUIBaseForLua
end
function UI.cloneControl(controlToClone, parent, strID)
  if nil == controlToClone then
    UI.ASSERT(false, "cloneí•˜ë ¤ëŠ” rootUIê°€ nilì…ë‹ˆë‹¤")
    return nil
  end
  tempUIBaseForLua = nil
  cloneControl(controlToClone, parent, strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(false, "Controlì„ ë³µì œê°€ ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  end
  return tempUIBaseForLua
end
function UI.createCustomControl(typeStr, parent, strID)
  tempUIBaseForLua = nil
  createCustomControl(typeStr, parent, strID)
  return tempUIBaseForLua
end
function UI.deleteControl(conrol)
  deleteControl(conrol)
end
function UI.getChildControl(parent, strID)
  tempUIBaseForLua = nil
  if nil == parent then
    UI.ASSERT(nil ~= parent, "getChildControlì´ ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤. parentê°€ nilì…ë‹ˆë‹¤. strID : " .. tostring(strID))
    return nil
  end
  parent:getChildControl(strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(nil ~= tempUIBaseForLua and "number" ~= type(tempUIBaseForLua), strID)
    return nil
  end
  return tempUIBaseForLua
end
function UI.getChildControlNoneAssert(parent, strID)
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  if nil == tempUIBaseForLua then
    return nil
  end
  return tempUIBaseForLua
end
function UI.getChildControlByIndex(parent, index)
  tempUIBaseForLua = nil
  parent:getChildControlByIndex(index)
  return tempUIBaseForLua
end
function UI.deletePanel(strID)
  deletePanel(strID, groupID)
end
function UI.createOtherPanel(strID, groupID)
  tempUIBaseForLua = nil
  createOtherPanel(strID, groupID)
  return tempUIBaseForLua
end
function UI.deleteOtherPanel(strID)
  deleteOtherPanel(strID)
end
function UI.deleteOtherControl(panel, control)
  deleteOtherControl(panel, control)
end
function UI.isFlushedUI()
  return isFlushedUI()
end
function UI.isChildControl(parent, strID)
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  return tempUIBaseForLua
end
function UI.ASSERT(test, message)
  message = message or tostring(test)
  if "string" ~= type(message) then
    message = tostring(message)
  end
  test = nil ~= test and false ~= test and 0 ~= test
  _PA_ASSERT(test, message)
end
function UI.ASSERT_NAME(test, message, developer)
  message = message or tostring(test)
  if "string" ~= type(message) then
    message = tostring(message)
  end
  if nil == developer or "" == developer then
    UI.ASSERT(false, "UI_ASSERT_NAMEì— ê°œë°œì(3ë²ˆì¸ì)ë¥¼ ì¶”ê°€í•´ì£¼ì„¸ìš”")
  end
  if "string" ~= type(developer) then
    developer = tostring(developer)
  end
  test = nil ~= test and false ~= test and 0 ~= test
  _PA_ASSERT_NAME(test, message, developer)
end
function UI.Set_ProcessorInputMode(UIModeType)
end
function UI.ClearFocusEdit()
  ClearFocusEdit()
  CheckChattingInput()
end
function UI.isGameOptionMouseMode()
  return true == getOptionMouseMode()
end
function UI.Get_ProcessorInputMode()
  return getInputMode()
end
function setTextureUV_Func(control, pixX, pixY, pixEndX, pixEndY)
  local sizeX = control:getTextureWidth()
  local sizeY = control:getTextureHeight()
  if sizeX == 0 and sizeY == 0 then
    return 0, 0, 0, 0
  end
  return pixX / sizeX, pixY / sizeY, pixEndX / sizeX, pixEndY / sizeY
end
function setTextureUV_FuncByTextureType(control, pixX, pixY, pixEndX, pixEndY, textureType)
  local sizeX = control:getTextureHeightByType(textureType)
  local sizeY = control:getTextureHeightByType(textureType)
  if sizeX == 0 and sizeY == 0 then
    return 0, 0, 0, 0
  end
  return pixX / sizeX, pixY / sizeY, pixEndX / sizeX, pixEndY / sizeY
end
function UI.getFocusEdit()
  return GetFocusEdit()
end
function UI.isInPositionForLua(control, posX, posY)
  return isInPostion(control, posX, posY)
end
function UI.checkShowWindow()
  return check_ShowWindow()
end
function UI.checkIsInMouse(panel)
  local IsMouseOver = panel:GetPosX() < getMousePosX() and getMousePosX() < panel:GetPosX() + panel:GetSizeX() and panel:GetPosY() < getMousePosY() and getMousePosY() < panel:GetPosY() + panel:GetSizeY() and CppEnums.EProcessorInputMode.eProcessorInputMode_UiMode == UI.Get_ProcessorInputMode()
  return IsMouseOver and false == isCharacterCameraRotateMode()
end
function UI.checkIsInMouseAndEventPanel(panel)
  local isOverEvent = UI.checkIsInMouse(panel)
  local eventControl = getEventControl()
  if nil ~= eventControl then
    local parentPanel = eventControl:GetParentPanel()
    return parentPanel:GetKey() == panel:GetKey() and isOverEvent
  end
  return isOverEvent
end
function UI.checkResolution4KForXBox()
  if true == isGameServiceTypeConsole() then
    local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
    if nil == gameOptionSetting then
      return false
    end
    local screenWidth = gameOptionSetting:getScreenResolutionWidth()
    local screenHeight = gameOptionSetting:getScreenResolutionHeight()
    if nil == screenWidth or nil == screenHeight then
      return false
    end
    if screenWidth >= 3840 or screenHeight >= 2160 then
      _PA_LOG("ê´‘ìš´", "==== 4K ì¼ë•ŒëŠ” Ui Scaleê°’ì€ ë¬´ì¡°ê±´ 200% ë¡œ ê³ ì • í•œë‹¤.")
      return true
    end
  end
  return false
end
local _tooltipControlRefTable = {}
function UI.setLimitTextAndAddTooltip(control, title, desc)
  if nil == control then
    return
  end
  if nil == control.IsLimitText or nil == control.SetTextMode then
    UI.ASSERT(nil ~= control.IsLimitText, "control does not contain key <IsLimitText>")
    return
  end
  control:SetTextMode(__eTextMode_LimitText)
  control:SetText(control:GetText())
  if control:IsLimitText() then
    local key = #_tooltipControlRefTable + 1
    control:SetIgnore(false)
    _tooltipControlRefTable[key] = {}
    _tooltipControlRefTable[key].control = control
    _tooltipControlRefTable[key].title = title
    _tooltipControlRefTable[key].desc = desc
    control:addInputEvent("Mouse_On", "PaGlobalFunc_GlobalUtil_limitTextTooltip(" .. key .. ")")
    control:addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
  end
end
function UI.setLimitAutoWrapTextAndAddTooltip(control, limitLine, title, desc)
  if nil == control then
    return
  end
  if nil == control.IsLimitText or nil == control.SetTextMode then
    UI.ASSERT(nil ~= control.IsLimitText, "control does not contain key <IsLimitText>")
    return
  end
  control:SetTextMode(__eTextMode_Limit_AutoWrap)
  control:setLineCountByLimitAutoWrap(limitLine)
  control:SetText(control:GetText())
  if control:IsLimitText() then
    local key = #_tooltipControlRefTable + 1
    control:SetIgnore(false)
    _tooltipControlRefTable[key] = {}
    _tooltipControlRefTable[key].control = control
    _tooltipControlRefTable[key].title = title
    _tooltipControlRefTable[key].desc = desc
    control:addInputEvent("Mouse_On", "PaGlobalFunc_GlobalUtil_limitTextTooltip(" .. key .. ")")
    control:addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
  end
end
function PaGlobalFunc_GlobalUtil_limitTextTooltip(key)
  if key > #_tooltipControlRefTable then
    return
  end
  local data = _tooltipControlRefTable[key]
  if nil == data.control then
    return
  end
  if not data.control:IsLimitText() then
    TooltipSimple_Hide()
    return
  end
  registTooltipControl(data.control, PaGlobal_GetPanelTooltipSimpleText())
  if nil == data.title then
    TooltipSimple_Show(data.control, data.control:GetText(), data.desc)
  else
    TooltipSimple_Show(data.control, data.title, data.desc)
  end
end
function UI.changeTextureUV(control, url, uv)
  control:ChangeTextureInfoName(url)
  local x1, y1, x2, y2 = setTextureUV_Func(control, uv[1], uv[2], uv[3], uv[4])
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function PaGlobalFunc_ConsoleKeyGuide_SetAlign(listKeyGuid, parentControl, alignType, keySize, keySpace)
  local defualtKeySize = 44
  local defualtKeySpace = 20
  if #listKeyGuid < 1 or nil == parentControl then
    return
  end
  local parantSizeX = parentControl:GetSizeX()
  local parantSizeY = parentControl:GetSizeY()
  if nil == keySize then
    keySize = defualtKeySize
  end
  if nil == keySpace then
    keySpace = defualtKeySpace
  end
  local space = keySize + keySpace
  if nil == alignType or alignType < 0 or alignType >= CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_COUNT then
    keySpaalignTypece = CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_LEFT == alignType then
    local length = keySpace
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosX(length)
        length = length + space + value:GetTextSizeX()
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_AUTO_WRAP_LEFT == alignType then
    local length = keySpace
    local yPos = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        if parentControl:GetSizeX() < length + value:GetTextSizeX() + value:GetTextSpan().x then
          yPos = yPos + 42
          length = keySpace
        end
        value:SetPosX(length)
        value:SetPosY(yPos)
        length = length + keySpace + value:GetTextSizeX() + value:GetTextSpan().x
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT == alignType then
    local reversedTable = {}
    local keyCount = #listKeyGuid
    for key, value in ipairs(listKeyGuid) do
      reversedTable[keyCount + 1 - key] = value
    end
    local length = parantSizeX
    for key, value in ipairs(reversedTable) do
      if true == value:GetShow() then
        local spaceFromRight = value:GetTextSizeX() + space
        length = length - spaceFromRight
        value:SetPosX(length)
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHTAUTOWRAP == alignType then
    local reversedTable = {}
    local keyCount = #listKeyGuid
    for key, value in ipairs(listKeyGuid) do
      reversedTable[keyCount + 1 - key] = value
    end
    local posX = parentControl:GetSizeX()
    local posY = 0
    for index, value in pairs(reversedTable) do
      if value:GetShow() == true then
        local childCount = value:getChildControlCount()
        local length = keySpace
        value:SetSpanSize(0, 0)
        if childCount == 0 then
          length = length + value:GetSizeX() + value:GetTextSizeX()
          posX = posX - length
          if posX < 0 then
            posX = parentControl:GetSizeX() - length
            posY = posY + value:GetSizeY()
          end
          value:SetPosXY(posX, posY)
        elseif value:getBaseTexture() == nil then
          length = length + value:GetTextSizeX()
          for childIdx = 0, childCount - 1 do
            local child = UI.getChildControlByIndex(value, childIdx)
            length = length + child:GetSizeX()
          end
          posX = posX - length
          if posX < 0 then
            posX = parentControl:GetSizeX() - length
            posY = posY + value:GetSizeY()
          end
          value:SetPosXY(posX, posY)
        else
          length = length + value:GetSizeX() + value:GetTextSizeX()
          local calculateLength = length
          for childIdx = 0, childCount - 1 do
            local child = UI.getChildControlByIndex(value, childIdx)
            calculateLength = calculateLength + child:GetSizeX()
          end
          if posX - calculateLength <= 0 then
            posX = parentControl:GetSizeX()
            posY = posY + value:GetSizeY()
          end
          value:SetPosXY(posX - length, posY)
          posX = posX - calculateLength
        end
      end
    end
    local combineKeyBgSizeY = 50
    parentControl:SetSize(parentControl:GetSizeX(), combineKeyBgSizeY + posY)
    parentControl:SetSpanSize(parentControl:GetSpanSize().x, (combineKeyBgSizeY + posY) * -1)
    parentControl:ComputePos()
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_CENTER == alignType then
    local totalSizeX = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeX = totalSizeX + space + value:GetTextSizeX()
      end
    end
    totalSizeX = totalSizeX - keySpace
    local startPosX = (parantSizeX - totalSizeX) / 2
    local length = startPosX
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosX(length)
        length = length + space + value:GetTextSizeX()
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_TOP == alignType then
    local length = keySpace
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_MIDDLE == alignType then
    local totalSizeY = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeY = totalSizeY + space
      end
    end
    local startPosY = (parantSizeY - totalSizeY) / 2
    local length = startPosY
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
  if CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_BOTTOM == alignType then
    local totalSizeY = 0
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        totalSizeY = totalSizeY + space
      end
    end
    local startPosY = parantSizeY - totalSizeY
    local length = startPosY
    for key, value in ipairs(listKeyGuid) do
      if true == value:GetShow() then
        value:SetPosY(length)
        length = length + space
      end
    end
  end
end
UI_PaGlobal_DynamicStacle = {
  oriMousePosX = 0,
  oriMousePosY = 0,
  oriPanelPosX = 0,
  oriPanelPosY = 0,
  oriPanelSizeX = 0,
  oriPanelSizeY = 0,
  oriPanelScaleX = 0,
  oriPanelScaleY = 0,
  MAX_SCALE = 2
}
function UI.PanelDynamicSacle_ResizeStart(panel)
  UI_PaGlobal_DynamicStacle.oriMousePosX = getMousePosX()
  UI_PaGlobal_DynamicStacle.oriMousePosY = getMousePosY()
end
function UI.PanelDynamicSacle_ResizePressing(panel)
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = currentX - UI_PaGlobal_DynamicStacle.oriMousePosX
  local deltaY = currentY - UI_PaGlobal_DynamicStacle.oriMousePosY
  local scaleX = panel:GetScale().x
  local scaleY = panel:GetScale().y
  local modifyScaleX = scaleX + deltaX * 0,0014
  local modifyScaleY = scaleY + deltaY * 0,0014
  if modifyScaleX < 0,5 then
    modifyScaleX = 0,5
  end
  if modifyScaleX > 1 then
    modifyScaleX = 1
  end
  panel:SetScaleChild(modifyScaleX, modifyScaleX)
  ToClient_applyDynamicScalePanel(panel)
  UI_PaGlobal_DynamicStacle.oriMousePosX = currentX
  UI_PaGlobal_DynamicStacle.oriMousePosY = currentY
end
function UI.PanelDynamicSacle_ResizePressing_Reverse(panel)
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = UI_PaGlobal_DynamicStacle.oriMousePosX - currentX
  local deltaY = currentY - UI_PaGlobal_DynamicStacle.oriMousePosY
  local scaleX = panel:GetScale().x
  local scaleY = panel:GetScale().y
  local modifyScaleX = scaleX + deltaX * 0,0014
  local modifyScaleY = scaleY + deltaY * 0,0014
  if modifyScaleX < 0,5 then
    modifyScaleX = 0,5
  end
  if modifyScaleX > 1 then
    modifyScaleX = 1
  end
  panel:SetScaleChild(modifyScaleX, modifyScaleX)
  ToClient_applyDynamicScalePanel(panel)
  UI_PaGlobal_DynamicStacle.oriMousePosX = currentX
  UI_PaGlobal_DynamicStacle.oriMousePosY = currentY
end
function UI.RePositionContorl(table, startPosX)
  if false == isGameTypeKR2() then
    return
  end
  for _, v in pairs(table) do
    if nil ~= v and true == v:GetShow() then
      v:SetSpanSize(startPosX, v:GetSpanSize().y)
      startPosX = startPosX + v:GetSizeX() + 10
    end
  end
end
function UI.PanelDynamicSacle_ResizeEnd(panel)
end
function FromClient_UpdateDynamicScalePanelList()
  ToClient_DynamicScalePanelList()
end
function Profile_BeginUIFunction(str)
  if ToClient_IsDevelopment() == true then
    return ToClient_BeginUIFunction(str)
  end
  return nil
end
function Profile_EndUIFunction(tracer)
  if ToClient_IsDevelopment() == true then
    ToClient_EndUIFunction(tracer)
  end
end
registerEvent("FromClient_luaLoadCompleteLateUdpate", "FromClient_UpdateDynamicScalePanelList")
