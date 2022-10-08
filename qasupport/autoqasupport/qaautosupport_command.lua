function StartAutoQA1()
  ToClient_qaresetTimerJobList()
  ToClient_qaRegisterTimerForQA(100, "TargetWindow_ShowToggle(10)")
  ToClient_qaRegisterTimerForQA(1000, "close_WindowPanelList()")
end
function StartAutoQA2()
  ToClient_qaresetTimerJobList()
  ToClient_qaRegisterTimerForQA(2000, "ToClient_qaTeleport(217738, -1702, -1)")
  ToClient_qaRegisterTimerForQA(20000, "TargetWindow_ShowToggle(10)")
end
function StartAutoQA3()
  ToClient_qaresetTimerJobList()
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_AutoQASupport:writeLogFile('startTest')")
  ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(19923, 0, 10)")
  for itemKey = 792, 795 do
    ToClient_qaRegisterTimerForQA(20, "ToClient_qaCreateItem(" .. itemKey .. ", 0, 10)")
  end
  ToClient_qaRegisterTimerForQA(500, "saveItemSlotForQA(0, 19923)")
  ToClient_qaRegisterTimerForQA(500, "PaGlobal_AutoQASupport:writeLogFile( 'ë–¡êµ­ì˜ìŠ¬ë¡¯ : ' .. getItemSlotForQA())")
  ToClient_qaRegisterTimerForQA(500, "PaGlobal_AutoQASupport:writeLogFile('endTest')")
  ToClient_qaRegisterTimerForQA(500, "Proc_ShowMessage_Ack('í…ŒìŠ¤íŠ¸ê°€ ëë‚¬ìŠµë‹ˆë‹¤.')")
end
function StartAutoQA4()
  ToClient_qaRegisterTimerForQA(100, "TargetWindow_ShowToggle(11)")
  ToClient_qaRegisterTimerForQA(2500, "HandleEventLUp_DialogMain_All_FuncButton(2)")
  ToClient_qaRegisterTimerForQA(2500, "PaGlobal_SpiritEnchant_All:setCheckFunc('SkipAni', true)")
  ToClient_qaRegisterTimerForQA(5000, "_PA_LOG('ì´ë‹¤í˜œ', PaGlobal_SpiritEnchant_All:getCronCount() )")
  ToClient_qaRegisterTimerForQA(5000, "_PA_LOG('ì´ë‹¤í˜œ', PaGlobal_SpiritEnchant_All:getPerfectCount() )")
end
function saveItemSlotForQA(whereType, itemKey)
  PaGlobal_AutoQASupport._itemSlot = PaGlobal_AutoQASupport:getInvenSlotByItemKey(whereType, itemKey)
  if PaGlobal_AutoQASupport._itemSlot == -1 then
  end
end
function getItemSlotForQA()
  return PaGlobal_AutoQASupport._itemSlot
end
function Inventory_SlotRClick_ForQA(time, slotNo)
  if true == _ContentsGroup_NewUI_Inventory_All then
    ToClient_qaRegisterTimerForQA(time, "HandleEventRUp_Inventory_All_SlotRClick(" .. slotNo .. ")")
  else
    ToClient_qaRegisterTimerForQA(time, "Inventory_SlotRClick(" .. slotNo .. ")")
  end
end
QA_BlackSpirit = {
  _enhance = {
    _weaponKey = 10010,
    _weaponMat1Key = 16001,
    _weaponMat2Key = 16004,
    _weaponLevel = -1,
    _weaponMaxEndurance = -1,
    _weaponMat1Count = -1,
    _weaponMat2Count = -1,
    _weaponLevelNext = -1,
    _weaponMaxEnduranceNext = -1,
    _weaponMat1CountNext = -1,
    _weaponMat2CountNext = -1,
    _armorKey = 11017,
    _armorMat1Key = 16002,
    _armorMat2Key = 16005,
    _armorLevel = -1,
    _armorMaxEndurance = -1,
    _armorMat1Count = -1,
    _armorMat2Count = -1,
    _armorLevelNext = -1,
    _armorMaxEnduranceNext = -1,
    _armorMat1CountNext = -1,
    _armorMat2CountNext = -1,
    _accKey = 12031,
    _accMat1Key = 12031,
    _accLevel = -1,
    _accMaxEndurance = -1,
    _accLevelNext = -1,
    _accMaxEnduranceNext = -1,
    _cronKey = 16080,
    _isCronApplied = false,
    _cronCount = -1,
    _cronCountNext = -1,
    _failCount = -1,
    _valksCount = -1,
    _bonusCount = -1,
    _failCountNext = -1,
    _valksCountNext = -1,
    _bonusCountNext = -1,
    _isSuccess = false,
    _isFail = false,
    _isForceEnhance = false
  },
  _caphras = {
    caphrasItemKey = 10010,
    caphrasStoneKey = 721003,
    capMaxEndurance = -1,
    capMaxEnduranceNext = -1,
    caphrasStoneCount = -1,
    caphrasStoneCountNext = -1,
    caphrasStoneNeedCount = -1,
    caphrasLevel = -1,
    caphrasLevelNext = -1
  }
}
function QA_BlackSpirit:caphras()
  ToClient_qaresetTimerJobList()
  loadBlackSpirit()
  ToClient_qaRegisterTimerForQA(2500, "HandleEventLUp_DialogMain_All_FuncButton(2)")
  ToClient_qaRegisterTimerForQA(500, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(2)")
  ToClient_qaRegisterTimerForQA(500, "PaGlobal_SpiritEnchant_All:setCheckFunc('SkipAni', true)")
  ToClient_qaRegisterTimerForQA(500, "PaGlobal_Inventory_UnCheckAutoSort()")
  ToClient_qaRegisterTimerForQA(1000, "ToClient_qaCreateItem(10010,20,1)")
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, 10010)
  local targetSlotNo = getItemSlotForQA()
  Inventory_SlotRClick_ForQA(1000, targetSlotNo)
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, 721003)
  local capstoneSlotNo = getItemSlotForQA()
  Inventory_SlotRClick_ForQA(1000, capstoneSlotNo)
  ToClient_qaRegisterTimerForQA(1000, "HandleEventLUp_NumberPad_All_AllButton_Click(0)")
  ToClient_qaRegisterTimerForQA(1000, "HandleEventLUp_NumberPad_All_ConfirmButton_Click()")
  ToClient_qaRegisterTimerForQA(1000, "HandleEventLUp_SpiritEnchant_All_CaphrasEnchantApplyButton()")
end
function QA_BlackSpirit:checkCaphrasMaterial()
  if self._enhance._weaponMat1CountNext < 1 or 1 > self._enhance._weaponMat2CountNext then
    if self._enhance._weaponMat1CountNext < 1 then
      ToClient_qaCreateItem(self._enhance._weaponMat1Key, 0, 1)
    end
    if 1 > self._enhance._weaponMat2CountNext then
      ToClient_qaCreateItem(self._enhance._weaponMat2Key, 0, 1)
    end
    ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceWeaponStart()")
  else
    if PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      local enchantWeaponKey = self._enhance._weaponKey
      saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
      local targetSlotNo = getItemSlotForQA()
      Inventory_SlotRClick_ForQA(1000, targetSlotNo)
    end
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceWeaponStart()")
  end
end
function QA_BlackSpirit:enhance()
  PaGlobal_AutoQASupport._enchantResult._resultType = -1
  ToClient_qaresetTimerJobList()
  loadBlackSpirit()
  ToClient_qaRegisterTimerForQA(500, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. ",0,1)")
  ToClient_qaRegisterTimerForQA(500, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. ",0,1)")
  ToClient_qaRegisterTimerForQA(2500, "HandleEventLUp_DialogMain_All_FuncButton(2)")
  ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:checkWeaponMaterial()")
end
function QA_BlackSpirit:checkWeaponMaterial()
  if self._enhance._weaponMat1CountNext < 1 or 1 > self._enhance._weaponMat2CountNext then
    if self._enhance._weaponMat1CountNext < 1 then
      ToClient_qaCreateItem(self._enhance._weaponMat1Key, 0, 1)
    end
    if 1 > self._enhance._weaponMat2CountNext then
      ToClient_qaCreateItem(self._enhance._weaponMat2Key, 0, 1)
    end
    ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceWeaponStart()")
  else
    if PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      local enchantWeaponKey = self._enhance._weaponKey
      saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
      local targetSlotNo = getItemSlotForQA()
      Inventory_SlotRClick_ForQA(1000, targetSlotNo)
    end
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceWeaponStart()")
  end
end
function QA_BlackSpirit:checkArmorMaterial()
  if self._enhance._armorMat1CountNext < 1 or 1 > self._enhance._armorMat2CountNext then
    if self._enhance._armorMat1CountNext < 1 then
      ToClient_qaCreateItem(self._enhance._armorMat1Key, 0, 1)
    end
    if 1 > self._enhance._armorMat2CountNext then
      ToClient_qaCreateItem(self._enhance._armorMat2Key, 0, 1)
    end
    ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceArmorStart()")
  else
    if PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      local enchantArmorKey = self._enhance._armorKey
      saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
      local targetSlotNo = getItemSlotForQA()
      Inventory_SlotRClick_ForQA(1000, targetSlotNo)
    end
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceArmorStart()")
  end
end
function QA_BlackSpirit:checkForceWeaponBS()
  local needPerfectCount = PaGlobal_SpiritEnchant_All:getPerfectCount()
  if needPerfectCount > self._enhance._weaponMat1Count then
    ToClient_qaCreateItem(self._enhance._weaponMat1Key, 0, needPerfectCount - self._enhance._weaponMat1Count)
  end
  HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()
end
function QA_BlackSpirit:checkForceArmorBS()
  local needPerfectCount = PaGlobal_SpiritEnchant_All:getPerfectCount()
  if needPerfectCount > self._enhance._armorMat1Count then
    ToClient_qaCreateItem(self._enhance._armorMat1Key, 0, needPerfectCount - self._enhance._armorMat1Count)
  end
  HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()
end
function QA_BlackSpirit:checkCronStone()
  local needCronCount = PaGlobal_SpiritEnchant_All:getCronCount()
  if needCronCount > self._enhance._cronCount then
    ToClient_qaCreateItem(self._enhance._cronKey, 0, needCronCount - self._enhance._cronCount)
  end
  HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()
end
function QA_BlackSpirit:enhanceWeaponStart()
  ToClient_qaRegisterTimerForQA(0, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(1)")
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_Inventory_UnCheckAutoSort()")
  if PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    if self._enhance._isCronApplied == false then
      if self._enhance._isForceEnhance == false then
        PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
        Proc_ShowMessage_Ack("ë¬´ê¸° ì¼ë°˜ ê°•í™” ì‹œì‘")
      end
    elseif self._enhance._weaponLevel < 17 then
      PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
      Proc_ShowMessage_Ack("ë¬´ê¸° í¬ë¡ ì„ ê°•í™” ì‹œì‘")
    end
  end
  local enchantWeaponKey = self._enhance._weaponKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
  local targetSlotNo = getItemSlotForQA()
  PaGlobal_SpiritEnchant_All:setCheckFunc("SkipAni", true)
  if targetSlotNo == nil then
    ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”í•  ë¬´ê¸°ë¥¼ ì°¾ëŠ”ë° ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  else
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
    self._enhance._weaponLevel = itemWrapper:get():getKey():getEnchantLevel()
    self._enhance._weaponMaxEndurance = itemWrapper:get():getMaxEndurance()
    self._enhance._weaponMat1Count = QA_ItemStackCount(self._enhance._weaponMat1Key)
    self._enhance._weaponMat2Count = QA_ItemStackCount(self._enhance._weaponMat2Key)
    self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
    self._enhance._failCount = getEnchantInformation():ToClient_getFailCount()
    self._enhance._valksCount = getEnchantInformation():ToClient_getValksCount()
    self._enhance._bonusCount = getEnchantInformation():ToClient_getBonusStackCount()
    if self._enhance._weaponLevel == 20 then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ë™ ì¥ë¹„ëŠ” ê°•í™”í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤. ì¬ì„¤ì •ì´ í•„ìš”í•©ë‹ˆë‹¤.")
    elseif self._enhance._weaponLevel > 20 or 0 > self._enhance._weaponLevel or self._enhance._weaponLevel == nil then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] í•´ë‹¹ ì¥ë¹„ì˜ ì¥ë¹„ ë ˆë²¨ì´ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    elseif self._enhance._isCronApplied == true then
      if self._enhance._weaponLevel < 17 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. ",17,1)")
        self._enhance._weaponLevel = 17
        self._enhance._weaponMaxEndurance = 100
        ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceWeaponStart()")
      else
        self._enhance._failCount = 100
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(17899,0,1)")
        ToClient_qaRegisterTimerForQA(1000, "ToClient_qaUseInventoryItem(17899,0)")
        ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkCronStone()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "PaGlobal_SpiritEnchant_All:setCheckFunc('Cron', true)")
        ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceWeapon()")
      end
    else
      if self._enhance._failCount >= 50 then
        self._enhance._failCount = 0
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
      end
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:enhanceWeapon()")
    end
  end
end
function QA_BlackSpirit:enhanceWeapon()
  self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
  ToClient_qaRegisterTimerForQA(100, "HandleEventLUp_SpiritEnchant_All_EnchantApplyButton()")
  ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
  if self._enhance._isForceEnhance == false then
    ToClient_qaRegisterTimerForQA(2500, "QA_BlackSpirit:checkWeaponEnchantResult()")
  else
    ToClient_qaRegisterTimerForQA(2500, "QA_BlackSpirit:forceWeaponEnhanceResult()")
  end
end
function QA_BlackSpirit:checkWeaponEnchantResult()
  local enchantWeaponKey = self._enhance._weaponKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
  local targetSlotNo = getItemSlotForQA()
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
  self._enhance._weaponLevelNext = itemWrapper:get():getKey():getEnchantLevel()
  self._enhance._weaponMaxEnduranceNext = itemWrapper:get():getMaxEndurance()
  self._enhance._weaponMat1CountNext = QA_ItemStackCount(self._enhance._weaponMat1Key)
  self._enhance._weaponMat2CountNext = QA_ItemStackCount(self._enhance._weaponMat2Key)
  self._enhance._cronCountNext = QA_ItemStackCount(self._enhance._cronKey)
  self._enhance._failCountNext = getEnchantInformation():ToClient_getFailCount()
  self._enhance._valksCountNext = getEnchantInformation():ToClient_getValksCount()
  self._enhance._bonusCountNext = getEnchantInformation():ToClient_getBonusStackCount()
  if false == self._enhance._isCronApplied then
    if self._enhance._weaponLevel < 7 then
      if PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
        if self._enhance._weaponLevel + 1 ~= self._enhance._weaponLevelNext then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
        elseif self._enhance._failCountNext ~= self._enhance._failCount then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._weaponMaxEnduranceNext ~= self._enhance._weaponMaxEndurance then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
          ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€í•˜ì§€ ì•Šì•˜ë‹¤!")
        else
          Proc_ShowMessage_Ack("ë¬´ê¸° ê°•í™” ì„±ê³µ")
          self._enhance._isSuccess = true
        end
      else
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•ˆì „ê°•í™” êµ¬ê°„ì„ì—ë„ ë¶ˆêµ¬í•˜ê³  ê°•í™”ê²°ê³¼ê°€ ì •ìƒì ì´ì§€ ì•ŠìŠµë‹ˆë‹¤. ( resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType .. " ) ì„±ê³µì—¬ë¶€ì˜ í™•ì¸ì´ í•„ìš”í•©ë‹ˆë‹¤.")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
      if self._enhance._weaponLevel + 1 ~= self._enhance._weaponLevelNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext ~= 0 then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= 0 then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._weaponMaxEnduranceNext ~= self._enhance._weaponMaxEndurance then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      else
        Proc_ShowMessage_Ack("ë¬´ê¸° ê°•í™” ì„±ê³µ")
        self._enhance._isSuccess = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
      if self._enhance._weaponLevel <= 16 then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] 16ê°•(ì¥)ì´í•˜ ë¬´ê¸°ì¸ë° 17ê°•(ê´‘)ì´ìƒ ì¥ë¹„ì˜ ì‹¤íŒ¨ ê²°ê³¼ê°€ ë‚˜ì™”ë‹¤.")
      elseif self._enhance._weaponLevel >= 20 or self._enhance._weaponLevel == nil then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ë¬´ê¸° ë ˆë²¨ì´ ë¹„ì •ìƒì´ë‹¤.")
      else
        if self._enhance._weaponMaxEnduranceNext < 10 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        _PA_LOG("AutoQA", "ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 3 then
      if self._enhance._weaponLevel > 16 or self._enhance._weaponLevel - 1 == self._enhance._weaponLevelNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê´‘ ì´ìƒ ì¥ë¹„ì—ì„œ ë‚˜ì™€ì„  ì•ˆ ë  ê²°ê³¼ì…ë‹ˆë‹¤. ê°•í™”ë‹¨ê³„ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•˜ëŠ”ì§€ í™•ì¸í•´ì•¼ í•©ë‹ˆë‹¤.")
      elseif self._enhance._weaponLevel <= 16 and self._enhance._weaponLevel ~= self._enhance._weaponLevelNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì¸ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext < self._enhance._failCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ê°•í™” ìŠ¤íƒì´ ë‚´ë ¤ê°”ë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._weaponMaxEnduranceNext >= self._enhance._weaponMaxEndurance then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        if self._enhance._weaponMaxEnduranceNext == 0 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ë¬´ê¸° ê°•í™” ì‹¤íŒ¨")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      if self._enhance._weaponLevel ~= self._enhance._weaponLevelNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._failCountNext ~= self._enhance._failCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._weaponMaxEndurance ~= self._enhance._weaponMaxEnduranceNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._weaponMat1Count ~= self._enhance._weaponMat1CountNext or self._enhance._weaponMat2Count ~= self._enhance._weaponMat2CountNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë¬´ê¸° ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
        ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevel .. ",1)")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 then
      _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê²°ê³¼(ê°•í™” ì‹¤íŒ¨ í›„ íŒŒê´´)ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
    else
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
    if self._enhance._weaponLevel + 1 ~= self._enhance._weaponLevelNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= 0 then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= 0 then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMaxEnduranceNext ~= self._enhance._weaponMaxEndurance then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤.")
    else
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì„±ê³µ")
      self._enhance._isSuccess = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    if self._enhance._weaponLevel > 16 and self._enhance._weaponLevel ~= self._enhance._weaponLevelNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨ í›„ ì¥ë¹„ë ˆë²¨ì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._weaponLevel <= 16 and self._enhance._weaponLevel ~= self._enhance._weaponLevelNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì—ì„œ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ë¼ ì‹¤íŒ¨ ì‹œ ìŠ¤íƒì´ ìœ ì§€ë˜ì–´ì•¼ í•˜ëŠ”ë° ë³€ê²½ë˜ì—ˆë‹¤!")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMaxEnduranceNext >= self._enhance._weaponMaxEndurance then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤")
    else
      if self._enhance._weaponMaxEnduranceNext < 10 or self._enhance._weaponLevel < 17 or self._enhance._weaponLevel == 20 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevelNext .. ",1)")
      end
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì‹¤íŒ¨")
      self._enhance._isFail = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
    if self._enhance._weaponLevel ~= self._enhance._weaponLevelNext then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë¬´ê¸° ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._weaponMaxEndurance ~= self._enhance._weaponMaxEnduranceNext then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._weaponMat1Count ~= self._enhance._weaponMat1CountNext or self._enhance._weaponMat2Count ~= self._enhance._weaponMat2CountNext then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
      ErrorHandler("[ë¬´ê¸° ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
    else
      Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
      ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
      ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
      ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevel .. ",1)")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 or PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
    _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
    ErrorHandler("[ë¬´ê¸° ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê°•í™” ê²°ê³¼ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    ErrorHandler("[ë¬´ê¸° ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
  else
    ErrorHandler("[ë¬´ê¸° ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
  end
  if true == self._enhance._isSuccess and true == self._enhance._isFail then
    self._enhance._weaponLevel = -1
    self._enhance._weaponLevelNext = -1
    self._enhance._isSuccess = false
    self._enhance._isFail = false
    if self._enhance._isCronApplied == false then
      PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = true
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkWeaponMaterial()")
    else
      PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = false
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:forceEnhanceWeaponStart()")
    end
  else
    self._enhance._weaponLevel = self._enhance._weaponLevelNext
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:checkWeaponMaterial()")
  end
end
function QA_BlackSpirit:forceEnhanceWeaponStart()
  self._enhance._isForceEnhance = true
  ToClient_qaRegisterTimerForQA(0, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(1)")
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_Inventory_UnCheckAutoSort()")
  local enchantWeaponKey = self._enhance._weaponKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
  local targetSlotNo = getItemSlotForQA()
  PaGlobal_SpiritEnchant_All:setCheckFunc("SkipAni", true)
  if targetSlotNo == nil then
    PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
    ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™”í•  ë¬´ê¸°ë¥¼ ì°¾ëŠ”ë° ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  else
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
    self._enhance._weaponLevel = itemWrapper:get():getKey():getEnchantLevel()
    self._enhance._weaponMaxEndurance = itemWrapper:get():getMaxEndurance()
    self._enhance._weaponMat1Count = QA_ItemStackCount(self._enhance._weaponMat1Key)
    self._enhance._weaponMat2Count = QA_ItemStackCount(self._enhance._weaponMat2Key)
    self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
    self._enhance._failCount = getEnchantInformation():ToClient_getFailCount()
    self._enhance._valksCount = getEnchantInformation():ToClient_getValksCount()
    self._enhance._bonusCount = getEnchantInformation():ToClient_getBonusStackCount()
    if self._enhance._weaponLevel > 14 or self._enhance._weaponLevel < 7 or self._enhance._weaponMaxEndurance ~= 100 then
      ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
      ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. math.random(7, 14) .. ",1)")
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:forceEnhanceWeaponStart()")
    elseif self._enhance._weaponLevel > 20 or 0 > self._enhance._weaponLevel or self._enhance._weaponLevel == nil then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] í•´ë‹¹ ì¥ë¹„ì˜ ì¥ë¹„ ë ˆë²¨ì´ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    else
      PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
      Proc_ShowMessage_Ack("ë¬´ê¸° ê°•ì œ ê°•í™” ì‹œì‘")
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:checkForceWeaponBS()")
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(100, "PaGlobal_SpiritEnchant_All:setCheckFunc('Force', true)")
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:enhanceWeapon()")
    end
  end
end
function QA_BlackSpirit:forceWeaponEnhanceResult()
  local enchantWeaponKey = self._enhance._weaponKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantWeaponKey)
  local targetSlotNo = getItemSlotForQA()
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
  self._enhance._weaponLevelNext = itemWrapper:get():getKey():getEnchantLevel()
  self._enhance._weaponMaxEnduranceNext = itemWrapper:get():getMaxEndurance()
  self._enhance._weaponMat1CountNext = QA_ItemStackCount(self._enhance._weaponMat1Key)
  self._enhance._weaponMat2CountNext = QA_ItemStackCount(self._enhance._weaponMat2Key)
  self._enhance._cronCountNext = QA_ItemStackCount(self._enhance._cronKey)
  self._enhance._failCountNext = getEnchantInformation():ToClient_getFailCount()
  self._enhance._valksCountNext = getEnchantInformation():ToClient_getValksCount()
  self._enhance._bonusCountNext = getEnchantInformation():ToClient_getBonusStackCount()
  if PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
    if self._enhance._weaponLevel + 1 ~= self._enhance._weaponLevelNext then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” í›„ ê°•í™” ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMaxEndurance <= self._enhance._weaponMaxEnduranceNext then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._weaponMat1Count == self._weaponMat1CountNext and self._enhance._weaponMat2Count == self._weaponMat2CountNext then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
      ErrorHandler("[ë¬´ê¸° ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    else
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      self._enhance._isForceEnhance = false
      Proc_ShowMessage_Ack("ê°•ì œ ê°•í™” ì„±ê³µ")
      PaGlobal_AutoQASupport:writeLogFile("[ë¬´ê¸° ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      ToClient_qaResetEnchantFailCount()
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkArmorMaterial()")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
    ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
    ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._weaponKey .. "," .. self._enhance._weaponLevelNext .. ",1)")
  else
    ErrorHandler("[ë¬´ê¸° ê°•í™”] ê°•ì œ ê°•í™” ê²°ê³¼ê°’ì´ ì„±ê³µì´ ì•„ë‹ˆë‹¤. ë¹„ì •ìƒ ìƒí™©" .. "resultType: " .. PaGlobal_AutoQASupport._enchantResult._resultType)
    ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
  end
end
function QA_BlackSpirit:enhanceArmorStart()
  ToClient_qaRegisterTimerForQA(0, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(1)")
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_Inventory_UnCheckAutoSort()")
  if PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    if self._enhance._isCronApplied == false then
      if self._enhance._isForceEnhance == false then
        PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™” ì‹œì‘")
      end
    elseif self._enhance._armorLevel < 17 then
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
      Proc_ShowMessage_Ack("ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™” ì‹œì‘")
    end
  end
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  PaGlobal_SpiritEnchant_All:setCheckFunc("SkipAni", true)
  if targetSlotNo == nil then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”í•  ë°©ì–´êµ¬ë¥¼ ì°¾ëŠ”ë° ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  else
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
    self._enhance._armorLevel = itemWrapper:get():getKey():getEnchantLevel()
    self._enhance._armorMaxEndurance = itemWrapper:get():getMaxEndurance()
    self._enhance._armorMat1Count = QA_ItemStackCount(self._enhance._armorMat1Key)
    self._enhance._armorMat2Count = QA_ItemStackCount(self._enhance._armorMat2Key)
    self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
    self._enhance._failCount = getEnchantInformation():ToClient_getFailCount()
    self._enhance._valksCount = getEnchantInformation():ToClient_getValksCount()
    self._enhance._bonusCount = getEnchantInformation():ToClient_getBonusStackCount()
    if self._enhance._armorLevel == 20 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ë™ ì¥ë¹„ëŠ” ê°•í™”í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤. ì¬ì„¤ì •ì´ í•„ìš”í•©ë‹ˆë‹¤.")
    elseif self._enhance._armorLevel > 20 or 0 > self._enhance._armorLevel or self._enhance._armorLevel == nil then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í•´ë‹¹ ì¥ë¹„ì˜ ì¥ë¹„ ë ˆë²¨ì´ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    elseif self._enhance._isCronApplied == true then
      if self._enhance._armorLevel < 17 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. ",17,1)")
        self._enhance._armorLevel = 17
        self._enhance._armorMaxEndurance = 100
        ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceArmorStart()")
      else
        self._enhance._failCount = 100
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(17899,0,1)")
        ToClient_qaRegisterTimerForQA(1000, "ToClient_qaUseInventoryItem(17899,0)")
        ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkCronStone()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "PaGlobal_SpiritEnchant_All:setCheckFunc('Cron', true)")
        ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceArmor()")
      end
    else
      if self._enhance._failCount >= 50 then
        self._enhance._failCount = 0
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
      end
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:enhanceArmor()")
    end
  end
end
function QA_BlackSpirit:enhanceArmor()
  self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
  ToClient_qaRegisterTimerForQA(100, "HandleEventLUp_SpiritEnchant_All_EnchantApplyButton()")
  ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
  if self._enhance._isForceEnhance == false then
    ToClient_qaRegisterTimerForQA(2500, "QA_BlackSpirit:checkArmorEnchantResult()")
  else
    ToClient_qaRegisterTimerForQA(2500, "QA_BlackSpirit:forceArmorEnhanceResult()")
  end
end
function QA_BlackSpirit:checkArmorEnchantResult()
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
  self._enhance._armorLevelNext = itemWrapper:get():getKey():getEnchantLevel()
  self._enhance._armorMaxEnduranceNext = itemWrapper:get():getMaxEndurance()
  self._enhance._armorMat1CountNext = QA_ItemStackCount(self._enhance._armorMat1Key)
  self._enhance._armorMat2CountNext = QA_ItemStackCount(self._enhance._armorMat2Key)
  self._enhance._cronCountNext = QA_ItemStackCount(self._enhance._cronKey)
  self._enhance._failCountNext = getEnchantInformation():ToClient_getFailCount()
  self._enhance._valksCountNext = getEnchantInformation():ToClient_getValksCount()
  self._enhance._bonusCountNext = getEnchantInformation():ToClient_getBonusStackCount()
  if false == self._enhance._isCronApplied then
    if self._enhance._armorLevel < 5 then
      if PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
        if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
        elseif self._enhance._failCountNext ~= self._enhance._failCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€í•˜ì§€ ì•Šì•˜ë‹¤!")
        else
          Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì„±ê³µ")
          self._enhance._isSuccess = true
        end
      else
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” êµ¬ê°„ì„ì—ë„ ë¶ˆêµ¬í•˜ê³  ê°•í™”ê²°ê³¼ê°€ ì •ìƒì ì´ì§€ ì•ŠìŠµë‹ˆë‹¤. ( resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType .. " ) ì„±ê³µì—¬ë¶€ì˜ í™•ì¸ì´ í•„ìš”í•©ë‹ˆë‹¤.")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
      if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext ~= 0 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= 0 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      else
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì„±ê³µ")
        self._enhance._isSuccess = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
      if self._enhance._armorLevel <= 16 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] 16ê°•(ì¥)ì´í•˜ ë°©ì–´êµ¬ì¸ë° 17ê°•(ê´‘)ì´ìƒ ì¥ë¹„ì˜ ì‹¤íŒ¨ ê²°ê³¼ê°€ ë‚˜ì™”ë‹¤.")
      elseif self._enhance._armorLevel >= 20 or self._enhance._armorLevel == nil then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ë°©ì–´êµ¬ ë ˆë²¨ì´ ë¹„ì •ìƒì´ë‹¤.")
      else
        if self._enhance._armorMaxEnduranceNext < 10 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        _PA_LOG("AutoQA", "ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 3 then
      if self._enhance._armorLevel > 16 or self._enhance._armorLevel - 1 == self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê´‘ ì´ìƒ ì¥ë¹„ì—ì„œ ë‚˜ì™€ì„  ì•ˆ ë  ê²°ê³¼ì…ë‹ˆë‹¤. ê°•í™”ë‹¨ê³„ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•˜ëŠ”ì§€ í™•ì¸í•´ì•¼ í•©ë‹ˆë‹¤.")
      elseif self._enhance._armorLevel <= 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì¸ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext < self._enhance._failCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ê°•í™” ìŠ¤íƒì´ ë‚´ë ¤ê°”ë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMaxEnduranceNext >= self._enhance._armorMaxEndurance then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        if self._enhance._armorMaxEnduranceNext == 0 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì‹¤íŒ¨")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      if self._enhance._armorLevel ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._failCountNext ~= self._enhance._failCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._armorMaxEndurance ~= self._enhance._armorMaxEnduranceNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._armorMat1Count ~= self._enhance._armorMat1CountNext or self._enhance._armorMat2Count ~= self._enhance._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
        ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevel .. ",1)")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 then
      _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê²°ê³¼(ê°•í™” ì‹¤íŒ¨ í›„ íŒŒê´´)ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
    else
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
    if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= 0 then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= 0 then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤.")
    else
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì„±ê³µ")
      self._enhance._isSuccess = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    if self._enhance._armorLevel > 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨ í›„ ì¥ë¹„ë ˆë²¨ì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._armorLevel <= 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì—ì„œ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ë¼ ì‹¤íŒ¨ ì‹œ ìŠ¤íƒì´ ìœ ì§€ë˜ì–´ì•¼ í•˜ëŠ”ë° ë³€ê²½ë˜ì—ˆë‹¤!")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMaxEnduranceNext >= self._enhance._armorMaxEndurance then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤")
    else
      if self._enhance._armorMaxEnduranceNext < 10 or self._enhance._armorLevel < 17 or self._enhance._armorLevel == 20 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
      end
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì‹¤íŒ¨")
      self._enhance._isFail = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
    if self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._armorMaxEndurance ~= self._enhance._armorMaxEnduranceNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._armorMat1Count ~= self._enhance._armorMat1CountNext or self._enhance._armorMat2Count ~= self._enhance._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
    else
      Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
      ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
      ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
      ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevel .. ",1)")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 or PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
    _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê°•í™” ê²°ê³¼ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
  else
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
  end
  if true == self._enhance._isSuccess and true == self._enhance._isFail then
    self._enhance._armorLevel = -1
    self._enhance._armorLevelNext = -1
    self._enhance._isSuccess = false
    self._enhance._isFail = false
    if self._enhance._isCronApplied == false then
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = true
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkArmorMaterial()")
    else
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = false
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:forceEnhanceArmorStart()")
    end
  else
    self._enhance._armorLevel = self._enhance._armorLevelNext
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:checkArmorMaterial()")
  end
end
function QA_BlackSpirit:forceEnhanceArmorStart()
  self._enhance._isForceEnhance = true
  ToClient_qaRegisterTimerForQA(0, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(1)")
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_Inventory_UnCheckAutoSort()")
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  PaGlobal_SpiritEnchant_All:setCheckFunc("SkipAni", true)
  if targetSlotNo == nil then
    PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
    ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™”í•  ë°©ì–´êµ¬ë¥¼ ì°¾ëŠ”ë° ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  else
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
    self._enhance._armorLevel = itemWrapper:get():getKey():getEnchantLevel()
    self._enhance._armorMaxEndurance = itemWrapper:get():getMaxEndurance()
    self._enhance._armorMat1Count = QA_ItemStackCount(self._enhance._armorMat1Key)
    self._enhance._armorMat2Count = QA_ItemStackCount(self._enhance._armorMat2Key)
    self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
    self._enhance._failCount = getEnchantInformation():ToClient_getFailCount()
    self._enhance._valksCount = getEnchantInformation():ToClient_getValksCount()
    self._enhance._bonusCount = getEnchantInformation():ToClient_getBonusStackCount()
    if self._enhance._armorLevel > 14 or self._enhance._armorLevel < 7 or self._enhance._armorMaxEndurance ~= 100 then
      ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
      ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. math.random(7, 14) .. ",1)")
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:forceEnhanceArmorStart()")
    elseif self._enhance._armorLevel > 20 or 0 > self._enhance._armorLevel or self._enhance._armorLevel == nil then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] í•´ë‹¹ ì¥ë¹„ì˜ ì¥ë¹„ ë ˆë²¨ì´ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    else
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
      Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•ì œ ê°•í™” ì‹œì‘")
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:checkForceArmorBS()")
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(100, "PaGlobal_SpiritEnchant_All:setCheckFunc('Force', true)")
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:enhanceArmor()")
    end
  end
end
function QA_BlackSpirit:forceArmorEnhanceResult()
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
  self._enhance._armorLevelNext = itemWrapper:get():getKey():getEnchantLevel()
  self._enhance._armorMaxEnduranceNext = itemWrapper:get():getMaxEndurance()
  self._enhance._armorMat1CountNext = QA_ItemStackCount(self._enhance._armorMat1Key)
  self._enhance._armorMat2CountNext = QA_ItemStackCount(self._enhance._armorMat2Key)
  self._enhance._cronCountNext = QA_ItemStackCount(self._enhance._cronKey)
  self._enhance._failCountNext = getEnchantInformation():ToClient_getFailCount()
  self._enhance._valksCountNext = getEnchantInformation():ToClient_getValksCount()
  self._enhance._bonusCountNext = getEnchantInformation():ToClient_getBonusStackCount()
  if PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
    if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” í›„ ê°•í™” ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMaxEndurance <= self._enhance._armorMaxEnduranceNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] ê°•ì œ ê°•í™” ì´í›„ í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    else
      self._enhance._isForceEnhance = false
      Proc_ShowMessage_Ack("ê°•ì œ ê°•í™” ì„±ê³µ")
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ê°•ì œ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      ToClient_qaResetEnchantFailCount()
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
    ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
    ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
  else
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•ì œ ê°•í™” ê²°ê³¼ê°’ì´ ì„±ê³µì´ ì•„ë‹ˆë‹¤. ë¹„ì •ìƒ ìƒí™©" .. "resultType: " .. PaGlobal_AutoQASupport._enchantResult._resultType)
    ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
  end
end
function QA_BlackSpirit:enhanceArmorStart()
  ToClient_qaRegisterTimerForQA(0, "HandleEventLUp_SpiritEnchant_All_MainTabSelect(1)")
  ToClient_qaRegisterTimerForQA(100, "PaGlobal_Inventory_UnCheckAutoSort()")
  if PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    if self._enhance._isCronApplied == false then
      if self._enhance._isForceEnhance == false then
        PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™” ì‹œì‘")
      end
    elseif self._enhance._armorLevel < 2 then
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì‹œì‘", true)
      Proc_ShowMessage_Ack("ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™” ì‹œì‘")
    end
  end
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  PaGlobal_SpiritEnchant_All:setCheckFunc("SkipAni", true)
  if targetSlotNo == nil then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”í•  ë°©ì–´êµ¬ë¥¼ ì°¾ëŠ”ë° ì‹¤íŒ¨í•˜ì˜€ìŠµë‹ˆë‹¤.")
  else
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
    self._enhance._armorLevel = itemWrapper:get():getKey():getEnchantLevel()
    self._enhance._armorMaxEndurance = itemWrapper:get():getMaxEndurance()
    self._enhance._armorMat1Count = QA_ItemStackCount(self._enhance._armorMat1Key)
    self._enhance._armorMat2Count = QA_ItemStackCount(self._enhance._armorMat2Key)
    self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
    self._enhance._failCount = getEnchantInformation():ToClient_getFailCount()
    self._enhance._valksCount = getEnchantInformation():ToClient_getValksCount()
    self._enhance._bonusCount = getEnchantInformation():ToClient_getBonusStackCount()
    if self._enhance._armorLevel == 20 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ë™ ì¥ë¹„ëŠ” ê°•í™”í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤. ì¬ì„¤ì •ì´ í•„ìš”í•©ë‹ˆë‹¤.")
    elseif self._enhance._armorLevel > 20 or 0 > self._enhance._armorLevel or self._enhance._armorLevel == nil then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í•´ë‹¹ ì¥ë¹„ì˜ ì¥ë¹„ ë ˆë²¨ì´ ë¹„ì •ìƒì…ë‹ˆë‹¤.")
    elseif self._enhance._isCronApplied == true then
      if self._enhance._armorLevel < 17 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. ",17,1)")
        self._enhance._armorLevel = 17
        self._enhance._armorMaxEndurance = 100
        ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:enhanceArmorStart()")
      else
        self._enhance._failCount = 100
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(17899,0,1)")
        ToClient_qaRegisterTimerForQA(1000, "ToClient_qaUseInventoryItem(17899,0)")
        ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkCronStone()")
        Inventory_SlotRClick_ForQA(100, targetSlotNo)
        ToClient_qaRegisterTimerForQA(100, "PaGlobal_SpiritEnchant_All:setCheckFunc('Cron', true)")
        ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:enhanceArmor()")
      end
    else
      if self._enhance._failCount >= 50 then
        self._enhance._failCount = 0
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaResetEnchantFailCount()")
      end
      Inventory_SlotRClick_ForQA(100, targetSlotNo)
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:enhanceArmor()")
    end
  end
end
function QA_BlackSpirit:enhanceArmor()
  self._enhance._cronCount = QA_ItemStackCount(self._enhance._cronKey)
  ToClient_qaRegisterTimerForQA(100, "HandleEventLUp_SpiritEnchant_All_EnchantApplyButton()")
  ToClient_qaRegisterTimerForQA(100, "messageBox_YesButtonUp()")
  if self._enhance._isForceEnhance == false then
    ToClient_qaRegisterTimerForQA(1000, "QA_BlackSpirit:checkArmorEnchantResult()")
  else
    ToClient_qaRegisterTimerForQA(2000, "QA_BlackSpirit:forceArmorEnhanceResult()")
  end
end
function QA_BlackSpirit:checkArmorEnchantResult()
  local enchantArmorKey = self._enhance._armorKey
  saveItemSlotForQA(CppEnums.ItemWhereType.eInventory, enchantArmorKey)
  local targetSlotNo = getItemSlotForQA()
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, targetSlotNo + 2)
  self._enhance._armorLevelNext = itemWrapper:get():getKey():getEnchantLevel()
  self._enhance._armorMaxEnduranceNext = itemWrapper:get():getMaxEndurance()
  self._enhance._armorMat1CountNext = QA_ItemStackCount(self._enhance._armorMat1Key)
  self._enhance._armorMat2CountNext = QA_ItemStackCount(self._enhance._armorMat2Key)
  self._enhance._cronCountNext = QA_ItemStackCount(self._enhance._cronKey)
  self._enhance._failCountNext = getEnchantInformation():ToClient_getFailCount()
  self._enhance._valksCountNext = getEnchantInformation():ToClient_getValksCount()
  self._enhance._bonusCountNext = getEnchantInformation():ToClient_getBonusStackCount()
  if false == self._enhance._isCronApplied then
    if self._enhance._armorLevel < 5 then
      if PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
        if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
        elseif self._enhance._failCountNext ~= self._enhance._failCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
        elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
          ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€í•˜ì§€ ì•Šì•˜ë‹¤!")
        else
          Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì„±ê³µ")
          self._enhance._isSuccess = true
        end
      else
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•ˆì „ê°•í™” êµ¬ê°„ì„ì—ë„ ë¶ˆêµ¬í•˜ê³  ê°•í™”ê²°ê³¼ê°€ ì •ìƒì ì´ì§€ ì•ŠìŠµë‹ˆë‹¤. ( resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType .. " ) ì„±ê³µì—¬ë¶€ì˜ í™•ì¸ì´ í•„ìš”í•©ë‹ˆë‹¤.")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
      if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext ~= 0 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= 0 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      else
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì„±ê³µ")
        self._enhance._isSuccess = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
      if self._enhance._armorLevel <= 16 then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] 16ê°•(ì¥)ì´í•˜ ë°©ì–´êµ¬ì¸ë° 17ê°•(ê´‘)ì´ìƒ ì¥ë¹„ì˜ ì‹¤íŒ¨ ê²°ê³¼ê°€ ë‚˜ì™”ë‹¤.")
      elseif self._enhance._armorLevel >= 20 or self._enhance._armorLevel == nil then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ë°©ì–´êµ¬ ë ˆë²¨ì´ ë¹„ì •ìƒì´ë‹¤.")
      else
        if self._enhance._armorMaxEnduranceNext < 10 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        _PA_LOG("AutoQA", "ê°•í™” ì‹¤íŒ¨ í›„ ë ˆë²¨ í•˜ë½")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 3 then
      if self._enhance._armorLevel > 16 or self._enhance._armorLevel - 1 == self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê´‘ ì´ìƒ ì¥ë¹„ì—ì„œ ë‚˜ì™€ì„  ì•ˆ ë  ê²°ê³¼ì…ë‹ˆë‹¤. ê°•í™”ë‹¨ê³„ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•˜ëŠ”ì§€ í™•ì¸í•´ì•¼ í•©ë‹ˆë‹¤.")
      elseif self._enhance._armorLevel <= 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì¸ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
      elseif self._enhance._failCountNext < self._enhance._failCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ê°•í™” ìŠ¤íƒì´ ë‚´ë ¤ê°”ë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMaxEnduranceNext >= self._enhance._armorMaxEndurance then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
      elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        if self._enhance._armorMaxEnduranceNext == 0 then
          ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
          ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
        end
        Proc_ShowMessage_Ack("ë°©ì–´êµ¬ ê°•í™” ì‹¤íŒ¨")
        self._enhance._isFail = true
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
      if self._enhance._armorLevel ~= self._enhance._armorLevelNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._failCountNext ~= self._enhance._failCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
      elseif self._enhance._armorMaxEndurance ~= self._enhance._armorMaxEnduranceNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._armorMat1Count ~= self._enhance._armorMat1CountNext or self._enhance._armorMat2Count ~= self._enhance._armorMat2CountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
      elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
        ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
      else
        Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
        ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevel .. ",1)")
      end
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 then
      _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê²°ê³¼(ê°•í™” ì‹¤íŒ¨ í›„ íŒŒê´´)ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
    elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
    else
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == -1 then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ê°•í™” ê²°ê³¼ ì €ì¥ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. resultType í™•ì¸ í•„ìš”")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 0 then
    if self._enhance._armorLevel + 1 ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ê²°ê³¼ê°€ ì„±ê³µì´ì§€ë§Œ ê°•í™” ë ˆë²¨ì´ ì •ìƒì ìœ¼ë¡œ ì˜¬ë¼ê°€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= 0 then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì¡°ì–¸ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= 0 then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ë°œí¬ìŠ¤ì˜ ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMaxEnduranceNext ~= self._enhance._armorMaxEndurance then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™” ì´í›„ ê°•í™”ê°€ ì„±ê³µí•˜ì˜€ì§€ë§Œ í•´ë‹¹ ì¥ë¹„ì˜ ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤.")
    else
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì„±ê³µ")
      self._enhance._isSuccess = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    if self._enhance._armorLevel > 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨ í›„ ì¥ë¹„ë ˆë²¨ì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._armorLevel <= 16 and self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜, ì‹¤íŒ¨í•´ë„ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì§€ì§€ ì•Šì•„ì•¼ í•  ê°•í™”ì—ì„œ ê°•í™”ìˆ˜ì¹˜ê°€ ë–¨ì–´ì¡ŒìŠµë‹ˆë‹¤.")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ë¼ ì‹¤íŒ¨ ì‹œ ìŠ¤íƒì´ ìœ ì§€ë˜ì–´ì•¼ í•˜ëŠ”ë° ë³€ê²½ë˜ì—ˆë‹¤!")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°•í™” ì´í›„ ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë¹„ì •ìƒì ìœ¼ë¡œ ë³€ê²½ë˜ì—ˆìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMaxEnduranceNext >= self._enhance._armorMaxEndurance then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ì— ì‹¤íŒ¨í•˜ì˜€ëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ê¹ì´ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤.")
    elseif self._enhance._armorMat1Count == self._armorMat1CountNext and self._enhance._armorMat2Count == self._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] ê°•í™”ê°€ ì§„í–‰ë˜ì—ˆìœ¼ë‚˜ ê°•í™”ì¬ë£Œì˜ ì–‘ì´ ë³€ê²½ë˜ì§€ ì•Šì•˜ë‹¤")
    elseif self._enhance._cronCount <= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ì¤„ì–´ë“¤ì§€ ì•Šì•˜ë‹¤")
    else
      if self._enhance._armorMaxEnduranceNext < 10 or self._enhance._armorLevel < 17 or self._enhance._armorLevel == 20 then
        ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
        ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevelNext .. ",1)")
      end
      Proc_ShowMessage_Ack("í¬ë¡ ì„ ê°•í™” ì‹¤íŒ¨")
      self._enhance._isFail = true
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 5 then
    if self._enhance._armorLevel ~= self._enhance._armorLevelNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìˆ˜ì¹˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._failCountNext ~= self._enhance._failCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ìŠ¤íƒì´ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._valksCountNext ~= self._enhance._valksCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì™¸ì¹¨ ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._bonusCountNext ~= self._enhance._bonusCount then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”[ ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ì˜êµ¬ ì¥ë¹„ ê°•í™” í™•ë¥  ìˆ˜ì¹˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤.")
    elseif self._enhance._armorMaxEndurance ~= self._enhance._armorMaxEnduranceNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ìµœëŒ€ ë‚´êµ¬ë„ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._armorMat1Count ~= self._enhance._armorMat1CountNext or self._enhance._armorMat2Count ~= self._enhance._armorMat2CountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ìµœëŒ€ ë‚´êµ¬ë„ ë¶€ì¡±ìœ¼ë¡œ ê°•í™” ì§„í–‰ì´ ë§‰í˜€ìˆëŠ”ë° ê°•í™”ì¬ë£Œ ê°œìˆ˜ê°€ ë‹¬ë¼ì ¸ ìˆë‹¤")
    elseif self._enhance._cronCount ~= self._enhance._cronCountNext then
      ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ ê°œìˆ˜ê°€ ë³€ê²½ë˜ì—ˆë‹¤")
    else
      Proc_ShowMessage_Ack("ë‚´êµ¬ë„ ë¶€ì¡±")
      ToClient_qaRegisterTimerForQA(100, "HandleEventRUp_SpiritEnchant_All_ReleseTargetItem()")
      ToClient_qaRegisterTimerForQA(100, "deleteItem(" .. getSelfPlayer():getActorKey() .. "," .. CppEnums.ItemWhereType.eInventory .. "," .. targetSlotNo .. "+2,1)")
      ToClient_qaRegisterTimerForQA(100, "ToClient_qaCreateItem(" .. self._enhance._armorKey .. "," .. self._enhance._armorLevel .. ",1)")
    end
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 1 or PaGlobal_AutoQASupport._enchantResult._resultType == 2 then
    _PA_LOG("AutoQA", "resultType : " .. PaGlobal_AutoQASupport._enchantResult._resultType)
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì•…ì„¸ì„œë¦¬ ê°•í™”ê°€ ì•„ë‹Œë° ì•…ì„¸ì„œë¦¬ ê°•í™” ê²°ê³¼ê°€ ë‚˜ì™”ìŠµë‹ˆë‹¤.")
  elseif PaGlobal_AutoQASupport._enchantResult._resultType == 4 then
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] í¬ë¡ ì„ì„ ì‚¬ìš©í•˜ì§€ ì•Šì•˜ìœ¼ë‚˜ í¬ë¡ ì„ ê²°ê³¼ê°’ì´ ë‚˜ì™”ìŠµë‹ˆë‹¤. í™•ì¸í•´ë´ì•¼ í•©ë‹ˆë‹¤.")
  else
    ErrorHandler("[ë°©ì–´êµ¬ ê°•í™”] ì˜ëª»ëœ resultType! ìƒˆë¡œ ì¶”ê°€ëœ ê²ƒì¸ê°€..")
  end
  if true == self._enhance._isSuccess and true == self._enhance._isFail then
    self._enhance._armorLevel = -1
    self._enhance._armorLevelNext = -1
    self._enhance._isSuccess = false
    self._enhance._isFail = false
    if self._enhance._isCronApplied == false then
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ ì¼ë°˜ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = true
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:checkArmorMaterial()")
    else
      PaGlobal_AutoQASupport:writeLogFile("[ë°©ì–´êµ¬ í¬ë¡ ì„ ê°•í™”] í…ŒìŠ¤íŠ¸ ì¢…ë£Œ", true)
      self._enhance._isCronApplied = false
      PaGlobal_AutoQASupport._enchantResult._resultType = -1
      ToClient_qaRegisterTimerForQA(100, "QA_BlackSpirit:forceEnhanceArmorStart()")
    end
  else
    self._enhance._armorLevel = self._enhance._armorLevelNext
    ToClient_qaRegisterTimerForQA(500, "QA_BlackSpirit:checkArmorMaterial()")
  end
end
