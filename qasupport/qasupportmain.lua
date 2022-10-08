function testCreate()
  ToClient_qaCreateItem(10010, 15, 1)
end
function goa1(param1, param2, param3)
  ToClient_InstanceContentsJoin(param1, param2, param3)
end
function movea1(param1, param2, param3)
  ToClient_MoveInstanceField(param1, param2, param3)
end
function workerready(level)
  ToClient_qaCreateItem(64204, 0, 1)
  ToClient_qaCreateItem(64205, 0, 1)
  ToClient_qaCreateItem(64206, 0, 1)
  ToClient_qaCreateItem(64214, 0, 1)
  ToClient_qaCreateItem(64215, 0, 1)
  ToClient_qaCreateItem(64216, 0, 1)
  ToClient_qaCreateItem(64234, 0, 1)
  ToClient_qaCreateItem(64235, 0, 1)
  ToClient_qaCreateItem(64236, 0, 1)
  ToClient_qaCreateItem(64264, 0, 1)
  ToClient_qaCreateItem(64265, 0, 1)
  ToClient_qaCreateItem(64266, 0, 1)
  ToClient_qaCreateItem(64320, 0, 1)
  ToClient_qaCreateItem(64321, 0, 1)
  ToClient_qaCreateItem(64322, 0, 1)
  ToClient_qaCreateItem(64304, 0, 1)
  ToClient_qaCreateItem(64305, 0, 1)
  ToClient_qaCreateItem(64306, 0, 1)
  ToClient_qaLevelUpAllWorker(level)
  ToClient_qaCreateItem(9213, 0, 1000)
  ToClient_qaCreateItem(9283, 0, 500)
end
function unlimit1()
  chatting_sendMessage("", "/setallgrowstep 1", CppEnums.ChatType.Public, CppEnums.ChatSystemType.Undefine)
  Proc_ShowMessage_Ack("<PAColor0xFFF26A6A>ê·¸ë˜ë„ ì‹œì•¼ê°/ì¹´ë©”ë¼ ì¡°ì ˆ ì•ˆë˜ë©´ ê²Œì„ì„¤ì •(ì„±ëŠ¥->ì¹´ë©”ë¼ì—ì„œ ì¡°ì ˆ)<PAOldColor>")
  ToClient_qaCompleteQuest(21001, 1)
  Proc_ShowMessage_Ack("ë¬´ì—­ ì˜¤í”ˆ 21001, 1 ì— í•´ë‹¹í•˜ëŠ” í€˜ìŠ¤íŠ¸ê°€ ì™„ë£Œë˜ì—ˆìŠµë‹ˆë‹¤.")
  ToClient_qaCompleteQuest(653, 6)
  Proc_ShowMessage_Ack("ì ì¬ë ¥ ëŒíŒŒë¥¼ ì‚¬ìš©í•  ìˆ˜ ìˆê²Œë˜ì—ˆìŠµë‹ˆë‹¤.")
end
function runAutoFrameCheck()
  FGlobal_AutoFrameCheck_setMinFrame(25)
  FGlobal_setAutoFrameCheckRepeat(true)
  FGlobal_AutoFrameCheck_addPositionList(100, 100, 100)
  FGlobal_AutoFrameCheck_Start()
end
function behero()
  ToClient_qaCreateItem(9693, 0, 10)
  ToClient_qaCreateItem(793, 0, 20)
  ToClient_qaCreateItem(45220, 0, 1)
  ToClient_qaCreateItem(45252, 0, 1)
  ToClient_qaCreateItem(45284, 0, 1)
  ToClient_qaCreateItem(65475, 0, 10)
  ToClient_qaCreateItem(65476, 0, 10)
  ToClient_qaCreateItem(65477, 0, 10)
  ToClient_qaCreateItem(65478, 0, 10)
  ToClient_qaCreateItem(65479, 0, 10)
  ToClient_qaCreateItem(65480, 0, 10)
  ToClient_qaCreateItem(65481, 0, 10)
  ToClient_qaCreateItem(65482, 0, 10)
  ToClient_qaCreateItem(43706, 0, 1)
  ToClient_qaCreateItem(65492, 0, 1)
  ToClient_qaCreateItem(65493, 0, 1)
  ToClient_qaCreateItem(65494, 0, 1)
end
function createSkillPoint(sp)
  local skillPointInfo = ToClient_getSkillPointInfo(0)
  if -1 == skillPointInfo then
    return
  end
  self._acquireSkillPoint = skillPointInfo._acquirePoint
  if self._acquireSkillPoint > 5000 then
    Proc_ShowMessage_Ack("ìŠ¤í‚¬ í¬ì¸íŠ¸ ë³´ìœ ëŸ‰ì´ ë„ˆë¬´ ë§ì•„ ìƒì„±ì´ ì œí•œë©ë‹ˆë‹¤.")
    return
  else
    ToClient_qaCreateItem(60, 0, sp / 10)
  end
end
function warready(enchantLevel)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaLevelUp(60)
  createBossWeapon(enchantLevel)
  awakening(enchantLevel)
  createBossArmor(enchantLevel)
  createAccessory(enchantLevel)
  luaTimer_AddEvent(equipAllItems, 2000, false, 0, enchantLevel)
  luaTimer_AddEvent(equipAccessory, 1000, false, 0, enchantLevel)
end
function awakening()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCompleteQuest(285, 4)
    ToClient_qaCreateItem(142, 0, 1)
    ToClient_qaCreateItem(143, 0, 2)
    ToClient_qaCreateItem(144, 0, 3)
    ToClient_qaCreateItem(191, 0, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCompleteQuest(293, 4)
    ToClient_qaCreateItem(151, 0, 1)
    ToClient_qaCreateItem(152, 0, 1)
    ToClient_qaCreateItem(153, 0, 1)
    ToClient_qaCreateItem(193, 0, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCompleteQuest(287, 4)
    ToClient_qaCreateItem(145, 0, 1)
    ToClient_qaCreateItem(146, 0, 1)
    ToClient_qaCreateItem(147, 0, 1)
    ToClient_qaCreateItem(196, 0, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCompleteQuest(290, 4)
    ToClient_qaCreateItem(148, 0, 1)
    ToClient_qaCreateItem(149, 0, 1)
    ToClient_qaCreateItem(150, 0, 1)
    ToClient_qaCreateItem(724004, 0, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCompleteQuest(296, 4)
    ToClient_qaCreateItem(154, 0, 1)
    ToClient_qaCreateItem(155, 0, 1)
    ToClient_qaCreateItem(156, 0, 1)
    ToClient_qaCreateItem(197, 0, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCompleteQuest(319, 4)
    ToClient_qaCreateItem(160, 0, 1)
    ToClient_qaCreateItem(161, 0, 1)
    ToClient_qaCreateItem(162, 0, 1)
    ToClient_qaCreateItem(724001, 0, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaCompleteQuest(298, 4)
    ToClient_qaCreateItem(157, 0, 1)
    ToClient_qaCreateItem(158, 0, 1)
    ToClient_qaCreateItem(159, 0, 1)
    ToClient_qaCreateItem(194, 0, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCompleteQuest(321, 4)
    ToClient_qaCreateItem(163, 0, 1)
    ToClient_qaCreateItem(164, 0, 1)
    ToClient_qaCreateItem(165, 0, 1)
    ToClient_qaCreateItem(198, 0, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCompleteQuest(327, 4)
    ToClient_qaCreateItem(169, 0, 1)
    ToClient_qaCreateItem(170, 0, 1)
    ToClient_qaCreateItem(171, 0, 1)
    ToClient_qaCreateItem(724002, 0, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCompleteQuest(325, 4)
    ToClient_qaCreateItem(166, 0, 1)
    ToClient_qaCreateItem(167, 0, 1)
    ToClient_qaCreateItem(168, 0, 1)
    ToClient_qaCreateItem(724003, 0, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCompleteQuest(334, 5)
    ToClient_qaCreateItem(172, 0, 1)
    ToClient_qaCreateItem(173, 0, 1)
    ToClient_qaCreateItem(174, 0, 1)
    ToClient_qaCreateItem(724005, 0, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCompleteQuest(336, 5)
    ToClient_qaCreateItem(175, 0, 1)
    ToClient_qaCreateItem(176, 0, 1)
    ToClient_qaCreateItem(177, 0, 1)
    ToClient_qaCreateItem(724006, 0, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCompleteQuest(338, 5)
    ToClient_qaCreateItem(178, 0, 1)
    ToClient_qaCreateItem(179, 0, 1)
    ToClient_qaCreateItem(180, 0, 1)
    ToClient_qaCreateItem(199, 0, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCompleteQuest(342, 7)
    ToClient_qaCreateItem(181, 0, 1)
    ToClient_qaCreateItem(182, 0, 1)
    ToClient_qaCreateItem(183, 0, 1)
    ToClient_qaCreateItem(724008, 0, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCompleteQuest(343, 5)
    ToClient_qaCreateItem(184, 0, 1)
    ToClient_qaCreateItem(185, 0, 1)
    ToClient_qaCreateItem(186, 0, 1)
    ToClient_qaCreateItem(724009, 0, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCompleteQuest(345, 5)
    ToClient_qaCreateItem(187, 0, 1)
    ToClient_qaCreateItem(188, 0, 1)
    ToClient_qaCreateItem(189, 0, 1)
    ToClient_qaCreateItem(724007, 0, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(190, 0, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCompleteQuest(348, 12)
    ToClient_qaCompleteQuest(348, 17)
    ToClient_qaCompleteQuest(348, 21)
    ToClient_qaCompleteQuest(348, 24)
    ToClient_qaCreateItem(192, 0, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCompleteQuest(363, 8)
    ToClient_qaCreateItem(724010, 0, 1)
    ToClient_qaCreateItem(724011, 0, 1)
    ToClient_qaCreateItem(724012, 0, 1)
    ToClient_qaCreateItem(724013, 0, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(724014, 0, 1)
    ToClient_qaCompleteQuest(366, 9)
    ToClient_qaCreateItem(724015, 0, 1)
    ToClient_qaCreateItem(724016, 0, 1)
    ToClient_qaCreateItem(724017, 0, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCompleteQuest(367, 10)
    ToClient_qaCreateItem(724018, 0, 1)
    ToClient_qaCreateItem(724019, 0, 1)
    ToClient_qaCreateItem(724020, 0, 1)
    ToClient_qaCreateItem(724021, 0, 1)
  elseif isClassType == __eClassType_Sage then
    ToClient_qaCompleteQuest(368, 28)
    ToClient_qaCreateItem(724022, 0, 1)
    ToClient_qaCreateItem(724023, 0, 1)
    ToClient_qaCreateItem(724024, 0, 1)
    ToClient_qaCreateItem(724025, 0, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCompleteQuest(369, 26)
    ToClient_qaCreateItem(724041, 0, 1)
    ToClient_qaCreateItem(724042, 0, 1)
    ToClient_qaCreateItem(724043, 0, 1)
    ToClient_qaCreateItem(724044, 0, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCompleteQuest(371, 5)
    ToClient_qaCreateItem(724045, 0, 1)
    ToClient_qaCreateItem(724046, 0, 1)
    ToClient_qaCreateItem(724047, 0, 1)
    ToClient_qaCreateItem(724048, 0, 1)
    ToClient_qaCreateItem(724049, 0, 1)
    ToClient_qaCreateItem(724050, 0, 1)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
end
function createBuffItem()
  ToClient_qaCreateItem(9692, 0, 10)
  ToClient_qaCreateItem(9693, 0, 10)
  ToClient_qaCreateItem(792, 0, 10)
  ToClient_qaCreateItem(793, 0, 30)
  ToClient_qaCreateItem(794, 0, 10)
  ToClient_qaCreateItem(795, 0, 30)
  ToClient_qaCreateItem(799, 0, 30)
  ToClient_qaCreateItem(1051, 0, 30)
  ToClient_qaCreateItem(752046, 0, 5)
  ToClient_qaCreateItem(781, 0, 10)
  ToClient_qaCreateItem(872, 0, 10)
  ToClient_qaCreateItem(734, 0, 10)
  ToClient_qaCreateItem(1161, 0, 10)
  ToClient_qaCreateItem(1200, 0, 10)
  ToClient_qaCreateItem(874, 0, 5)
  ToClient_qaCreateItem(875, 0, 5)
  ToClient_qaCreateItem(877, 0, 5)
  ToClient_qaCreateItem(1167, 0, 5)
  ToClient_qaCreateItem(733, 0, 10)
  ToClient_qaCreateItem(18408, 0, 20)
  ToClient_qaCreateItem(17100, 0, 1)
  ToClient_qaCreateItem(601204, 0, 1)
  ToClient_qaCreateItem(17567, 0, 100)
  ToClient_qaCreateItem(1, 0, 5000000)
end
function createPotion()
  ToClient_qaCreateItem(40712, 0, 1)
  ToClient_qaCreateItem(40713, 0, 1)
  ToClient_qaCreateItem(576, 0, 10)
  ToClient_qaCreateItem(19923, 0, 10)
end
function VaryFeverUpgrade()
  ToClient_qaCompleteQuest(31013, 1)
  ToClient_qaCompleteQuest(31013, 2)
  ToClient_qaCompleteQuest(31013, 3)
  ToClient_qaCompleteQuest(31013, 4)
  pa_sendMessage("/questcondition 834 1")
  pa_sendMessage("/questcondition 834 2")
  pa_sendMessage("/questcondition 834 2")
  pa_sendMessage("/questcondition 834 2")
  pa_sendMessage("/questcondition 834 3")
  pa_sendMessage("/questcondition 834 4")
  pa_sendMessage("/questcondition 834 5")
  pa_sendMessage("/questcondition 835 1")
  pa_sendMessage("/questcondition 835 2")
  pa_sendMessage("/questcondition 835 3")
  pa_sendMessage("/questcondition 835 4")
  pa_sendMessage("/questcondition 835 5")
end
function FamilyBag()
  ToClient_qaCompleteQuest(5739, 1)
  ToClient_qaCompleteQuest(5739, 2)
  ToClient_qaCompleteQuest(5739, 3)
  ToClient_qaCompleteQuest(5739, 4)
  ToClient_qaCompleteQuest(5739, 5)
  ToClient_qaCreateItem(65807, 0, 5)
  ToClient_qaCreateItem(320155, 0, 5)
end
function createBossArmor(enchantLevel)
  ToClient_qaCreateItem(11101, enchantLevel, 1)
  ToClient_qaCreateItem(11015, enchantLevel, 1)
  ToClient_qaCreateItem(11103, enchantLevel, 1)
  ToClient_qaCreateItem(11017, enchantLevel, 1)
end
function createAccessory(enchantLeve1)
  if enchantLeve1 < 15 then
    enchantLeve1 = 15
  end
  ToClient_qaCreateItem(12230, enchantLeve1 - 15, 1)
  ToClient_qaCreateItem(12237, enchantLeve1 - 15, 1)
  ToClient_qaCreateItem(12251, enchantLeve1 - 15, 1)
  ToClient_qaCreateItem(12031, enchantLeve1 - 15, 2)
  ToClient_qaCreateItem(12061, enchantLeve1 - 15, 2)
  ToClient_qaCreateItem(11828, enchantLeve1 - 15, 2)
  ToClient_qaCreateItem(11834, enchantLeve1 - 15, 2)
  ToClient_qaCreateItem(11607, enchantLeve1 - 15, 1)
  ToClient_qaCreateItem(45220, 0, 1)
  ToClient_qaCreateItem(45252, 0, 1)
  ToClient_qaCreateItem(45332, 0, 1)
end
function createCrystal1()
  ToClient_qaCreateItem(15801, 0, 2)
  ToClient_qaCreateItem(15852, 0, 2)
  ToClient_qaCreateItem(15807, 0, 2)
  ToClient_qaCreateItem(15211, 0, 2)
  ToClient_qaCreateItem(15616, 0, 2)
  ToClient_qaCreateItem(15674, 0, 2)
  ToClient_qaCreateItem(15667, 0, 4)
  ToClient_qaCreateItem(15666, 0, 4)
  ToClient_qaCreateItem(15654, 0, 2)
end
function createCrystal2()
  ToClient_qaCreateItem(15639, 0, 2)
  ToClient_qaCreateItem(15674, 0, 2)
  ToClient_qaCreateItem(15690, 0, 2)
  ToClient_qaCreateItem(15691, 0, 2)
  ToClient_qaCreateItem(15708, 0, 2)
  ToClient_qaCreateItem(15709, 0, 2)
  ToClient_qaCreateItem(15710, 0, 2)
  ToClient_qaCreateItem(15711, 0, 2)
  ToClient_qaCreateItem(15151, 0, 2)
  ToClient_qaCreateItem(15152, 0, 2)
  ToClient_qaCreateItem(15153, 0, 2)
  ToClient_qaCreateItem(15154, 0, 2)
  ToClient_qaCreateItem(15672, 0, 2)
  ToClient_qaCreateItem(15654, 0, 2)
  ToClient_qaCreateItem(15677, 0, 2)
  ToClient_qaCreateItem(15801, 0, 2)
  ToClient_qaCreateItem(15634, 0, 2)
  ToClient_qaCreateItem(15622, 0, 2)
  ToClient_qaCreateItem(15804, 0, 2)
  ToClient_qaCreateItem(15635, 0, 2)
  ToClient_qaCreateItem(15136, 0, 2)
  ToClient_qaCreateItem(15670, 0, 2)
  ToClient_qaCreateItem(15807, 0, 2)
  ToClient_qaCreateItem(15669, 0, 2)
  ToClient_qaCreateItem(15810, 0, 2)
  ToClient_qaCreateItem(15637, 0, 2)
  ToClient_qaCreateItem(15640, 0, 2)
  ToClient_qaCreateItem(15715, 0, 2)
  ToClient_qaCreateItem(15716, 0, 2)
  ToClient_qaCreateItem(15717, 0, 2)
  ToClient_qaCreateItem(15667, 0, 4)
  ToClient_qaCreateItem(15666, 0, 4)
end
function pvetest()
  ToClient_qaLevelUp(63)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65487, 0, 1)
  mainWeapon(19)
  PvEsubWeapon(20)
  awakenWeapon(19)
  ToClient_qaCreateItem(719897, 2, 1)
  ToClient_qaCreateItem(719898, 2, 1)
  ToClient_qaCreateItem(719903, 20, 1)
  ToClient_qaCreateItem(719904, 20, 1)
  ToClient_qaCreateItem(12031, 4, 2)
  ToClient_qaCreateItem(11834, 4, 1)
  ToClient_qaCreateItem(11853, 4, 1)
  ToClient_qaCreateItem(12236, 4, 1)
  ToClient_qaCreateItem(11629, 4, 1)
  ToClient_qaCreateItem(45332, 0, 1)
  ToClient_qaCreateItem(44980, 0, 1)
  ToClient_qaCreateItem(45881, 0, 1)
  ToClient_qaCreateItem(45561, 0, 1)
  awakening()
  ToClient_qaCreateItem(15667, 0, 4)
  ToClient_qaCreateItem(15689, 0, 2)
  ToClient_qaCreateItem(15716, 0, 2)
  ToClient_qaCreateItem(15807, 0, 2)
  ToClient_qaCreateItem(15674, 0, 2)
  ToClient_qaCreateItem(15672, 0, 2)
  ToClient_qaCreateItem(735207, 0, 2)
  ToClient_qaCreateItem(758003, 0, 3)
  ToClient_qaCreateItem(766101, 0, 1)
end
function pvptest()
  ToClient_qaLevelUp(63)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65487, 0, 1)
  mainWeapon(20)
  subWeapon(20)
  awakenWeapon(20)
  ToClient_qaCreateItem(719901, 20, 1)
  ToClient_qaCreateItem(719903, 20, 1)
  ToClient_qaCreateItem(719897, 2, 1)
  ToClient_qaCreateItem(719898, 2, 1)
  ToClient_qaCreateItem(719904, 20, 1)
  chatting_sendMessage("", "/create item 11046 1 20 19", CppEnums.ChatType.Private)
  chatting_sendMessage("", "/create item 11102 1 20 19", CppEnums.ChatType.Private)
  chatting_sendMessage("", "/create item 11016 1 20 19", CppEnums.ChatType.Private)
  ToClient_qaCreateItem(12077, 5, 2)
  ToClient_qaCreateItem(12084, 5, 2)
  ToClient_qaCreateItem(11667, 5, 1)
  ToClient_qaCreateItem(11869, 4, 2)
  ToClient_qaCreateItem(11872, 4, 2)
  ToClient_qaCreateItem(11871, 4, 2)
  ToClient_qaCreateItem(12264, 4, 1)
  ToClient_qaCreateItem(12271, 4, 1)
  ToClient_qaCreateItem(12268, 4, 1)
  ToClient_qaCreateItem(12275, 4, 1)
  ToClient_qaCreateItem(45332, 0, 1)
  ToClient_qaCreateItem(768185, 0, 1)
  ToClient_qaCreateItem(45561, 0, 1)
  ToClient_qaCreateItem(9771, 0, 3)
  ToClient_qaCreateItem(44980, 0, 1)
  ToClient_qaCreateItem(45881, 0, 1)
  ToClient_qaCreateItem(721003, 0, 100000)
  awakening()
  createCrystal()
end
function createCrystal()
  ToClient_qaCreateItem(15807, 0, 2)
  ToClient_qaCreateItem(15810, 0, 2)
  ToClient_qaCreateItem(15654, 0, 2)
  ToClient_qaCreateItem(15674, 0, 2)
  ToClient_qaCreateItem(15675, 0, 2)
  ToClient_qaCreateItem(15676, 0, 2)
  ToClient_qaCreateItem(15667, 0, 4)
  ToClient_qaCreateItem(15136, 0, 2)
  ToClient_qaCreateItem(15672, 0, 2)
  ToClient_qaCreateItem(15640, 0, 2)
end
function createRelics()
  ToClient_qaCreateItem(735201, 0, 2)
  ToClient_qaCreateItem(735202, 0, 2)
  ToClient_qaCreateItem(735203, 0, 2)
  ToClient_qaCreateItem(735204, 0, 2)
  ToClient_qaCreateItem(735205, 0, 2)
  ToClient_qaCreateItem(735206, 0, 2)
  ToClient_qaCreateItem(735207, 0, 2)
  ToClient_qaCreateItem(735251, 0, 2)
  ToClient_qaCreateItem(735252, 0, 2)
  ToClient_qaCreateItem(735253, 0, 2)
  ToClient_qaCreateItem(735254, 0, 2)
  ToClient_qaCreateItem(735255, 0, 2)
  ToClient_qaCreateItem(735256, 0, 2)
  ToClient_qaCreateItem(735257, 0, 2)
  ToClient_qaCreateItem(735258, 0, 2)
  ToClient_qaCreateItem(735259, 0, 2)
  ToClient_qaCreateItem(735301, 0, 2)
  ToClient_qaCreateItem(735302, 0, 2)
  ToClient_qaCreateItem(735303, 0, 2)
end
function createStone()
  ToClient_qaCreateItem(758001, 0, 4)
  ToClient_qaCreateItem(758003, 0, 4)
  ToClient_qaCreateItem(758002, 0, 1)
  ToClient_qaCreateItem(758004, 0, 1)
  ToClient_qaCreateItem(758005, 0, 1)
  ToClient_qaCreateItem(758006, 0, 1)
  ToClient_qaCreateItem(758007, 0, 1)
  ToClient_qaCreateItem(758008, 0, 1)
  ToClient_qaCreateItem(758009, 0, 1)
  ToClient_qaCreateItem(758010, 0, 1)
  ToClient_qaCreateItem(758011, 0, 1)
  ToClient_qaCreateItem(758012, 0, 1)
  ToClient_qaCreateItem(758013, 0, 1)
  ToClient_qaCreateItem(758014, 0, 1)
  ToClient_qaCreateItem(758015, 0, 1)
  ToClient_qaCreateItem(758016, 0, 1)
  ToClient_qaCreateItem(758017, 0, 1)
  ToClient_qaCreateItem(758018, 0, 1)
  ToClient_qaCreateItem(758019, 0, 1)
  ToClient_qaCreateItem(758020, 0, 1)
  ToClient_qaCreateItem(760001, 0, 1)
  ToClient_qaCreateItem(760002, 0, 1)
  ToClient_qaCreateItem(760003, 0, 1)
  ToClient_qaCreateItem(760004, 0, 1)
  ToClient_qaCreateItem(760005, 0, 1)
  ToClient_qaCreateItem(760006, 0, 1)
  ToClient_qaCreateItem(760007, 0, 1)
  ToClient_qaCreateItem(760008, 0, 1)
  ToClient_qaCreateItem(760009, 0, 1)
  ToClient_qaCreateItem(760010, 0, 1)
  ToClient_qaCreateItem(762001, 0, 1)
  ToClient_qaCreateItem(762002, 0, 1)
  ToClient_qaCreateItem(762003, 0, 1)
  ToClient_qaCreateItem(762004, 0, 1)
  ToClient_qaCreateItem(762005, 0, 1)
  ToClient_qaCreateItem(762006, 0, 1)
  ToClient_qaCreateItem(762007, 0, 1)
end
function createLifeRelics()
  ToClient_qaCreateItem(735351, 0, 2)
  ToClient_qaCreateItem(735352, 0, 2)
  ToClient_qaCreateItem(735353, 0, 2)
  ToClient_qaCreateItem(735354, 0, 2)
  ToClient_qaCreateItem(735355, 0, 2)
  ToClient_qaCreateItem(735356, 0, 2)
  ToClient_qaCreateItem(735357, 0, 2)
  ToClient_qaCreateItem(735358, 0, 2)
  ToClient_qaCreateItem(735359, 0, 2)
  ToClient_qaCreateItem(735360, 0, 2)
  ToClient_qaCreateItem(735361, 0, 2)
  ToClient_qaCreateItem(735362, 0, 2)
  ToClient_qaCreateItem(735363, 0, 2)
  ToClient_qaCreateItem(735364, 0, 2)
  ToClient_qaCreateItem(735365, 0, 2)
  ToClient_qaCreateItem(735366, 0, 2)
  ToClient_qaCreateItem(735367, 0, 2)
  ToClient_qaCreateItem(735368, 0, 2)
  ToClient_qaCreateItem(735369, 0, 2)
  ToClient_qaCreateItem(735370, 0, 2)
  ToClient_qaCreateItem(735371, 0, 2)
  ToClient_qaCreateItem(735372, 0, 2)
  ToClient_qaCreateItem(735373, 0, 2)
  ToClient_qaCreateItem(735374, 0, 2)
end
function createLifeStone()
  ToClient_qaCreateItem(764001, 0, 2)
  ToClient_qaCreateItem(764002, 0, 2)
  ToClient_qaCreateItem(764003, 0, 2)
  ToClient_qaCreateItem(764004, 0, 2)
  ToClient_qaCreateItem(764005, 0, 2)
  ToClient_qaCreateItem(764006, 0, 2)
  ToClient_qaCreateItem(764007, 0, 2)
  ToClient_qaCreateItem(764008, 0, 2)
  ToClient_qaCreateItem(764009, 0, 2)
  ToClient_qaCreateItem(764010, 0, 2)
  ToClient_qaCreateItem(764011, 0, 2)
  ToClient_qaCreateItem(764012, 0, 2)
  ToClient_qaCreateItem(764013, 0, 2)
  ToClient_qaCreateItem(764014, 0, 2)
  ToClient_qaCreateItem(764015, 0, 2)
  ToClient_qaCreateItem(764016, 0, 2)
  ToClient_qaCreateItem(764017, 0, 2)
  ToClient_qaCreateItem(764018, 0, 2)
  ToClient_qaCreateItem(764019, 0, 2)
  ToClient_qaCreateItem(764020, 0, 2)
  ToClient_qaCreateItem(764021, 0, 2)
end
function balancetest()
  ToClient_qaLevelUp(63)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65487, 0, 1)
  mainWeapon(19)
  mainWeapon(20)
  subWeapon(19)
  subWeapon(20)
  awakenWeapon(19)
  awakenWeapon(20)
  ToClient_qaCreateItem(719903, 20, 1)
  ToClient_qaCreateItem(719904, 20, 1)
  ToClient_qaCreateItem(719897, 0, 1)
  ToClient_qaCreateItem(719897, 5, 1)
  ToClient_qaCreateItem(719898, 0, 1)
  ToClient_qaCreateItem(719898, 5, 1)
  chatting_sendMessage("", "/create item 11046 1 20 20", CppEnums.ChatType.Private)
  chatting_sendMessage("", "/create item 11102 1 20 10", CppEnums.ChatType.Private)
  chatting_sendMessage("", "/create item 11016 1 20 10", CppEnums.ChatType.Private)
  ToClient_qaCreateItem(12060, 5, 2)
  ToClient_qaCreateItem(11828, 5, 2)
  ToClient_qaCreateItem(12237, 5, 1)
  ToClient_qaCreateItem(12061, 5, 2)
  ToClient_qaCreateItem(11629, 5, 1)
  ToClient_qaCreateItem(12236, 5, 1)
  ToClient_qaCreateItem(12257, 5, 1)
  ToClient_qaCreateItem(11855, 5, 2)
  ToClient_qaCreateItem(11853, 5, 2)
  ToClient_qaCreateItem(11834, 5, 2)
  ToClient_qaCreateItem(11653, 5, 1)
  ToClient_qaCreateItem(12276, 5, 1)
  ToClient_qaCreateItem(8417, 0, 10)
  ToClient_qaCreateItem(8141, 0, 10)
  ToClient_qaCreateItem(8148, 0, 10)
  ToClient_qaCreateItem(8149, 0, 10)
  ToClient_qaCreateItem(8181, 0, 10)
  ToClient_qaCreateItem(8182, 0, 10)
  ToClient_qaCreateItem(45332, 0, 1)
  ToClient_qaCreateItem(768185, 0, 1)
  ToClient_qaCreateItem(9771, 0, 3)
  ToClient_qaCreateItem(44980, 0, 1)
  ToClient_qaCreateItem(45881, 0, 1)
  ToClient_qaCreateItem(721003, 0, 100000)
  awakening()
end
function createUpgradeItem()
  ToClient_qaCreateItem(8417, 0, 10)
  ToClient_qaCreateItem(8141, 0, 10)
  ToClient_qaCreateItem(8148, 0, 10)
  ToClient_qaCreateItem(8149, 0, 10)
  ToClient_qaCreateItem(8181, 0, 10)
  ToClient_qaCreateItem(8182, 0, 10)
end
function seasonitem()
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65487, 0, 1)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(694113, 20, 1)
    ToClient_qaCreateItem(694126, 20, 1)
    ToClient_qaCreateItem(694138, 20, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(694114, 20, 1)
    ToClient_qaCreateItem(694127, 20, 1)
    ToClient_qaCreateItem(694141, 20, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(694115, 20, 1)
    ToClient_qaCreateItem(694128, 20, 1)
    ToClient_qaCreateItem(694139, 20, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(694116, 20, 1)
    ToClient_qaCreateItem(694129, 20, 1)
    ToClient_qaCreateItem(694140, 20, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(694117, 20, 1)
    ToClient_qaCreateItem(694130, 20, 1)
    ToClient_qaCreateItem(694142, 20, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(694118, 20, 1)
    ToClient_qaCreateItem(694131, 20, 1)
    ToClient_qaCreateItem(694144, 20, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaCreateItem(694113, 20, 1)
    ToClient_qaCreateItem(694126, 20, 1)
    ToClient_qaCreateItem(694143, 20, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(694118, 20, 1)
    ToClient_qaCreateItem(694131, 20, 1)
    ToClient_qaCreateItem(694145, 20, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(694117, 20, 1)
    ToClient_qaCreateItem(694132, 20, 1)
    ToClient_qaCreateItem(694133, 20, 1)
    ToClient_qaCreateItem(694147, 20, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(694117, 20, 1)
    ToClient_qaCreateItem(694132, 20, 1)
    ToClient_qaCreateItem(694133, 20, 1)
    ToClient_qaCreateItem(694146, 20, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(694119, 20, 1)
    ToClient_qaCreateItem(694127, 20, 1)
    ToClient_qaCreateItem(694148, 20, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(694119, 20, 1)
    ToClient_qaCreateItem(694127, 20, 1)
    ToClient_qaCreateItem(694149, 20, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(694120, 20, 1)
    ToClient_qaCreateItem(694129, 20, 1)
    ToClient_qaCreateItem(694150, 20, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(694121, 20, 1)
    ToClient_qaCreateItem(694134, 20, 1)
    ToClient_qaCreateItem(694151, 20, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(694121, 20, 1)
    ToClient_qaCreateItem(694134, 20, 1)
    ToClient_qaCreateItem(694152, 20, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(694122, 20, 1)
    ToClient_qaCreateItem(694135, 20, 1)
    ToClient_qaCreateItem(694153, 20, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(694123, 20, 1)
    ToClient_qaCreateItem(694136, 20, 1)
    ToClient_qaCreateItem(694154, 20, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(694124, 20, 1)
    ToClient_qaCreateItem(694137, 20, 1)
    ToClient_qaCreateItem(694155, 20, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(694125, 20, 1)
    ToClient_qaCreateItem(694126, 20, 1)
    ToClient_qaCreateItem(694156, 20, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692097, 20, 1)
    ToClient_qaCreateItem(692560, 20, 1)
    ToClient_qaCreateItem(696159, 20, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(730595, 20, 1)
    ToClient_qaCreateItem(730765, 20, 1)
    ToClient_qaCreateItem(730910, 20, 1)
  elseif isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(732344, 20, 1)
    ToClient_qaCreateItem(694128, 20, 1)
    ToClient_qaCreateItem(732659, 20, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCreateItem(733094, 20, 1)
    ToClient_qaCreateItem(733264, 20, 1)
    ToClient_qaCreateItem(733409, 20, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCreateItem(735494, 20, 1)
    ToClient_qaCreateItem(735664, 20, 1)
    ToClient_qaCreateItem(735809, 20, 1)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
  ToClient_qaCreateItem(694105, 20, 1)
  ToClient_qaCreateItem(694106, 20, 1)
  ToClient_qaCreateItem(694107, 20, 1)
  ToClient_qaCreateItem(694108, 20, 1)
  ToClient_qaCreateItem(694109, 5, 1)
  ToClient_qaCreateItem(694110, 5, 2)
  ToClient_qaCreateItem(694111, 5, 2)
  ToClient_qaCreateItem(694112, 5, 1)
  ToClient_qaCreateItem(44980, 0, 1)
  ToClient_qaCreateItem(45881, 0, 1)
  ToClient_qaCreateItem(750524, 0, 1)
  awakening()
end
function QuestClearSeasonPass()
  ToClient_qaLevelUp(63)
  ToClient_qaCompleteQuest(50000, 1)
  ToClient_qaCompleteQuest(50001, 1)
  ToClient_qaCompleteQuest(50002, 1)
  ToClient_qaCompleteQuest(50003, 1)
  ToClient_qaCompleteQuest(50004, 1)
  ToClient_qaCompleteQuest(50005, 1)
  ToClient_qaCompleteQuest(50006, 1)
  ToClient_qaCompleteQuest(50007, 1)
  ToClient_qaCompleteQuest(50008, 1)
  ToClient_qaCompleteQuest(50009, 1)
  ToClient_qaCompleteQuest(50010, 1)
  ToClient_qaCompleteQuest(50011, 1)
  ToClient_qaCompleteQuest(50012, 1)
  ToClient_qaCompleteQuest(50013, 1)
  ToClient_qaCompleteQuest(50014, 1)
  ToClient_qaCompleteQuest(50015, 1)
  ToClient_qaCompleteQuest(50016, 1)
  ToClient_qaCompleteQuest(50017, 1)
  ToClient_qaCompleteQuest(50018, 1)
  ToClient_qaCompleteQuest(50019, 1)
  ToClient_qaCompleteQuest(50020, 1)
  ToClient_qaCompleteQuest(50021, 1)
  ToClient_qaCompleteQuest(50022, 1)
  ToClient_qaCompleteQuest(50023, 1)
  ToClient_qaCompleteQuest(50024, 1)
  ToClient_qaCompleteQuest(50025, 1)
  ToClient_qaCompleteQuest(50026, 1)
  ToClient_qaCompleteQuest(50027, 1)
  ToClient_qaCompleteQuest(50028, 1)
  ToClient_qaCompleteQuest(50029, 1)
  ToClient_qaCompleteQuest(50030, 1)
  ToClient_qaCompleteQuest(50031, 1)
  ToClient_qaCompleteQuest(50032, 1)
  ToClient_qaCompleteQuest(50033, 1)
  ToClient_qaCompleteQuest(50034, 1)
  ToClient_qaCompleteQuest(50035, 1)
  ToClient_qaCompleteQuest(50036, 1)
  ToClient_qaCompleteQuest(50037, 1)
  ToClient_qaCompleteQuest(50038, 1)
  ToClient_qaCompleteQuest(50039, 1)
  ToClient_qaCompleteQuest(50040, 1)
  ToClient_qaCompleteQuest(50041, 1)
  ToClient_qaCompleteQuest(50042, 1)
  ToClient_qaCompleteQuest(50043, 1)
  ToClient_qaCompleteQuest(50044, 1)
  ToClient_qaCompleteQuest(50045, 1)
  ToClient_qaCompleteQuest(50046, 1)
  ToClient_qaCompleteQuest(50047, 1)
  ToClient_qaCompleteQuest(50048, 1)
  ToClient_qaCompleteQuest(50049, 1)
  ToClient_qaCompleteQuest(50000, 2)
  ToClient_qaCompleteQuest(50001, 2)
  ToClient_qaCompleteQuest(50002, 2)
  ToClient_qaCompleteQuest(50003, 2)
  ToClient_qaCompleteQuest(50004, 2)
  ToClient_qaCompleteQuest(50005, 2)
  ToClient_qaCompleteQuest(50006, 2)
  ToClient_qaCompleteQuest(50007, 2)
  ToClient_qaCompleteQuest(50008, 2)
  ToClient_qaCompleteQuest(50009, 2)
  ToClient_qaCompleteQuest(50010, 2)
  ToClient_qaCompleteQuest(50011, 2)
  ToClient_qaCompleteQuest(50012, 2)
  ToClient_qaCompleteQuest(50013, 2)
  ToClient_qaCompleteQuest(50014, 2)
  ToClient_qaCompleteQuest(50015, 2)
  ToClient_qaCompleteQuest(50016, 2)
  ToClient_qaCompleteQuest(50017, 2)
  ToClient_qaCompleteQuest(50018, 2)
  ToClient_qaCompleteQuest(50019, 2)
  ToClient_qaCompleteQuest(50020, 2)
  ToClient_qaCompleteQuest(50021, 2)
  ToClient_qaCompleteQuest(50022, 2)
  ToClient_qaCompleteQuest(50023, 2)
  ToClient_qaCompleteQuest(50024, 2)
  ToClient_qaCompleteQuest(50025, 2)
  ToClient_qaCompleteQuest(50026, 2)
  ToClient_qaCompleteQuest(50027, 2)
  ToClient_qaCompleteQuest(50028, 2)
  ToClient_qaCompleteQuest(50029, 2)
  ToClient_qaCompleteQuest(50030, 2)
  ToClient_qaCompleteQuest(50031, 2)
  ToClient_qaCompleteQuest(50032, 2)
  ToClient_qaCompleteQuest(50033, 2)
  ToClient_qaCompleteQuest(50034, 2)
  ToClient_qaCompleteQuest(50035, 2)
  ToClient_qaCompleteQuest(50036, 2)
  ToClient_qaCompleteQuest(50037, 2)
  ToClient_qaCompleteQuest(50038, 2)
  ToClient_qaCompleteQuest(50039, 2)
  ToClient_qaCompleteQuest(50040, 2)
  ToClient_qaCompleteQuest(50041, 2)
  ToClient_qaCompleteQuest(50042, 2)
  ToClient_qaCompleteQuest(50043, 2)
  ToClient_qaCompleteQuest(50044, 2)
  ToClient_qaCompleteQuest(50045, 2)
  ToClient_qaCompleteQuest(50046, 2)
  ToClient_qaCompleteQuest(50047, 2)
  ToClient_qaCompleteQuest(50048, 2)
  ToClient_qaCompleteQuest(50049, 2)
end
function cjready()
  ToClient_qaCreateItem(65487, 0, 2)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65126, 0, 1)
  ToClient_qaCreateItem(50118, 0, 1)
  ToClient_qaCreateItem(21016, 0, 1)
  ToClient_qaCreateItem(1, 0, 1000000)
  ToClient_qaCreateItem(18422, 0, 1)
  ToClient_qaCreateItem(17974, 0, 1)
  ToClient_qaCreateItem(17904, 0, 1)
  ToClient_qaCreateItem(17953, 0, 1)
  ToClient_qaCreateItem(17975, 0, 1)
  ToClient_qaCreateItem(529, 0, 200)
  ToClient_qaCreateItem(17567, 0, 100)
  ToClient_qaCreateItem(65489, 0, 1)
  ToClient_qaCreateItem(65490, 0, 1)
  ToClient_qaCreateItem(65491, 0, 1)
  ToClient_qaCreateItem(60, 0, 250)
  LearnSkill()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(285, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(142, 0, 1)
    ToClient_qaCreateItem(143, 0, 1)
    ToClient_qaCreateItem(144, 0, 1)
    ToClient_qaCreateItem(191, 0, 1)
    ToClient_qaCreateItem(21629, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(293, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(151, 0, 1)
    ToClient_qaCreateItem(152, 0, 1)
    ToClient_qaCreateItem(153, 0, 1)
    ToClient_qaCreateItem(21699, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(287, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(145, 0, 1)
    ToClient_qaCreateItem(146, 0, 1)
    ToClient_qaCreateItem(147, 0, 1)
    ToClient_qaCreateItem(21637, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(290, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(148, 0, 1)
    ToClient_qaCreateItem(149, 0, 1)
    ToClient_qaCreateItem(150, 0, 1)
    ToClient_qaCreateItem(21671, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(296, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(154, 0, 1)
    ToClient_qaCreateItem(155, 0, 1)
    ToClient_qaCreateItem(156, 0, 1)
    ToClient_qaCreateItem(21264, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(319, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(160, 0, 1)
    ToClient_qaCreateItem(161, 0, 1)
    ToClient_qaCreateItem(162, 0, 1)
    ToClient_qaCreateItem(21257, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(298, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(157, 0, 1)
    ToClient_qaCreateItem(158, 0, 1)
    ToClient_qaCreateItem(159, 0, 1)
    ToClient_qaCreateItem(21275, 0, 1)
    ToClient_qaCreateItem(598, 0, 200)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(321, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(163, 0, 1)
    ToClient_qaCreateItem(164, 0, 1)
    ToClient_qaCreateItem(165, 0, 1)
    ToClient_qaCreateItem(21196, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(327, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(169, 0, 1)
    ToClient_qaCreateItem(170, 0, 1)
    ToClient_qaCreateItem(171, 0, 1)
    ToClient_qaCreateItem(21366, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(325, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(166, 0, 1)
    ToClient_qaCreateItem(167, 0, 1)
    ToClient_qaCreateItem(168, 0, 1)
    ToClient_qaCreateItem(21371, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(334, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(172, 0, 1)
    ToClient_qaCreateItem(173, 0, 1)
    ToClient_qaCreateItem(174, 0, 1)
    ToClient_qaCreateItem(21309, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(336, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(175, 0, 1)
    ToClient_qaCreateItem(176, 0, 1)
    ToClient_qaCreateItem(177, 0, 1)
    ToClient_qaCreateItem(21925, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(338, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(178, 0, 1)
    ToClient_qaCreateItem(179, 0, 1)
    ToClient_qaCreateItem(180, 0, 1)
    ToClient_qaCreateItem(54405, 0, 1)
    ToClient_qaCreateItem(532, 0, 200)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(342, 7)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(181, 0, 1)
    ToClient_qaCreateItem(182, 0, 1)
    ToClient_qaCreateItem(183, 0, 1)
    ToClient_qaCreateItem(57043, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(343, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(184, 0, 1)
    ToClient_qaCreateItem(185, 0, 1)
    ToClient_qaCreateItem(186, 0, 1)
    ToClient_qaCreateItem(26054, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(345, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(187, 0, 1)
    ToClient_qaCreateItem(188, 0, 1)
    ToClient_qaCreateItem(189, 0, 1)
    ToClient_qaCreateItem(551061, 0, 1)
    ToClient_qaCreateItem(594, 0, 200)
  end
end
function ReLocation()
  ToClient_qaTeleport(-411596, -1318, -433611)
end
function QAHuntPlaceTeleport(huntType)
  if nil == huntType then
    return
  end
  if 0 == huntType then
    ToClient_qaTeleport(1038052, -2803, -16098)
  elseif 1 == huntType then
    ToClient_qaTeleport(676679, 7353, 134956)
  elseif 2 == huntType then
    ToClient_qaTeleport(114377, -35512, 424727)
  end
end
function QAAutoCollect(inPutcollectCnt, qaEndurance)
  currnetCollectCnt = 0
  maxCollectCnt = inPutcollectCnt
  itemCngCnt = 0
  quickSlotCnt = 0
  qaEnduranceCnt = qaEndurance
  QAInteraction()
end
function mainWeapon(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior or isClassType == __eClassType_Valkyrie then
    ToClient_qaCreateItem(715001, enchantLevel, 1)
    ToClient_qaCreateItem(736015, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(715003, enchantLevel, 1)
    ToClient_qaCreateItem(736016, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(715005, enchantLevel, 1)
    ToClient_qaCreateItem(736017, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(715007, enchantLevel, 1)
    ToClient_qaCreateItem(736018, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Tamer or isClassType == __eClassType_Kunoichi or isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(715009, enchantLevel, 1)
    ToClient_qaCreateItem(736019, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_BladeMaster or isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(715011, enchantLevel, 1)
    ToClient_qaCreateItem(736020, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_WizardWoman or isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(715013, enchantLevel, 1)
    ToClient_qaCreateItem(736021, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(715016, enchantLevel, 1)
    ToClient_qaCreateItem(736022, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Combattant or isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(715017, enchantLevel, 1)
    ToClient_qaCreateItem(736023, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(715019, enchantLevel, 1)
    ToClient_qaCreateItem(736024, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(715021, enchantLevel, 1)
    ToClient_qaCreateItem(736025, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(718616, enchantLevel, 1)
    ToClient_qaCreateItem(736026, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(690563, enchantLevel, 1)
    ToClient_qaCreateItem(736027, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692045, enchantLevel, 1)
    ToClient_qaCreateItem(736028, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(730564, enchantLevel, 1)
    ToClient_qaCreateItem(736029, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(732313, enchantLevel, 1)
    ToClient_qaCreateItem(736030, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCreateItem(733063, enchantLevel, 1)
    ToClient_qaCreateItem(736031, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCreateItem(735463, enchantLevel, 1)
    ToClient_qaCreateItem(736032, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
end
function subWeapon(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior or isClassType == __eClassType_Valkyrie or isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(701081, 20, 1)
    ToClient_qaCreateItem(735101, enchantLevel, 1)
  elseif isClassType == __eClassType_ElfRanger or isClassType == __eClassType_WizardWoman or isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(701083, 20, 1)
    ToClient_qaCreateItem(735102, enchantLevel, 1)
  elseif isClassType == __eClassType_Sorcerer or isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(701085, 20, 1)
    ToClient_qaCreateItem(735103, enchantLevel, 1)
  elseif isClassType == __eClassType_Giant or isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(701087, 20, 1)
    ToClient_qaCreateItem(735104, enchantLevel, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(701089, 20, 1)
    ToClient_qaCreateItem(735105, enchantLevel, 1)
  elseif isClassType == __eClassType_BladeMaster or isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(701091, 20, 1)
    ToClient_qaCreateItem(735106, enchantLevel, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(701093, 20, 1)
    ToClient_qaCreateItem(735107, enchantLevel, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(701095, 20, 1)
    ToClient_qaCreateItem(735108, enchantLevel, 1)
  elseif isClassType == __eClassType_Combattant or isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(701097, 20, 1)
    ToClient_qaCreateItem(735109, enchantLevel, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(701099, 20, 1)
    ToClient_qaCreateItem(735110, enchantLevel, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(701101, 20, 1)
    ToClient_qaCreateItem(735111, enchantLevel, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(719055, 20, 1)
    ToClient_qaCreateItem(735112, enchantLevel, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692531, 20, 1)
    ToClient_qaCreateItem(735113, enchantLevel, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(730733, 20, 1)
    ToClient_qaCreateItem(735114, enchantLevel, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCreateItem(733232, 20, 1)
    ToClient_qaCreateItem(735115, enchantLevel, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCreateItem(735632, 20, 1)
    ToClient_qaCreateItem(735116, enchantLevel, 1)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
end
function PvEsubWeapon(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior or isClassType == __eClassType_Valkyrie or isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(701082, 20, 1)
    ToClient_qaCreateItem(735101, enchantLevel, 1)
  elseif isClassType == __eClassType_ElfRanger or isClassType == __eClassType_WizardWoman or isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(701084, 20, 1)
    ToClient_qaCreateItem(735102, enchantLevel, 1)
  elseif isClassType == __eClassType_Sorcerer or isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(701086, 20, 1)
    ToClient_qaCreateItem(735103, enchantLevel, 1)
  elseif isClassType == __eClassType_Giant or isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(701088, 20, 1)
    ToClient_qaCreateItem(735104, enchantLevel, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(701090, 20, 1)
    ToClient_qaCreateItem(735105, enchantLevel, 1)
  elseif isClassType == __eClassType_BladeMaster or isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(701092, 20, 1)
    ToClient_qaCreateItem(735106, enchantLevel, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(701094, 20, 1)
    ToClient_qaCreateItem(735107, enchantLevel, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(701096, 20, 1)
    ToClient_qaCreateItem(735108, enchantLevel, 1)
  elseif isClassType == __eClassType_Combattant or isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(701098, 20, 1)
    ToClient_qaCreateItem(735109, enchantLevel, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(701100, 20, 1)
    ToClient_qaCreateItem(735110, enchantLevel, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(701102, 20, 1)
    ToClient_qaCreateItem(735111, enchantLevel, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(719056, 20, 1)
    ToClient_qaCreateItem(735112, enchantLevel, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692532, 20, 1)
    ToClient_qaCreateItem(735113, enchantLevel, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(730734, 20, 1)
    ToClient_qaCreateItem(735114, enchantLevel, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCreateItem(733233, 20, 1)
    ToClient_qaCreateItem(735115, enchantLevel, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCreateItem(735633, 20, 1)
    ToClient_qaCreateItem(735116, enchantLevel, 1)
  end
end
function awakenWeapon(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(731301, enchantLevel, 1)
    ToClient_qaCreateItem(736215, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(731304, enchantLevel, 1)
    ToClient_qaCreateItem(736218, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(731302, enchantLevel, 1)
    ToClient_qaCreateItem(736216, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(731303, enchantLevel, 1)
    ToClient_qaCreateItem(736217, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(731305, enchantLevel, 1)
    ToClient_qaCreateItem(736219, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(731307, enchantLevel, 1)
    ToClient_qaCreateItem(736221, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaCreateItem(731306, enchantLevel, 1)
    ToClient_qaCreateItem(736220, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(731308, enchantLevel, 1)
    ToClient_qaCreateItem(736222, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(731310, enchantLevel, 1)
    ToClient_qaCreateItem(736224, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(731309, enchantLevel, 1)
    ToClient_qaCreateItem(736223, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(731311, enchantLevel, 1)
    ToClient_qaCreateItem(736225, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(731312, enchantLevel, 1)
    ToClient_qaCreateItem(736226, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(731313, enchantLevel, 1)
    ToClient_qaCreateItem(736227, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(731314, enchantLevel, 1)
    ToClient_qaCreateItem(736228, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(731315, enchantLevel, 1)
    ToClient_qaCreateItem(736229, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(731317, enchantLevel, 1)
    ToClient_qaCreateItem(736231, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(731316, enchantLevel, 1)
    ToClient_qaCreateItem(736230, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(702618, enchantLevel, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(731318, enchantLevel, 1)
    ToClient_qaCreateItem(736232, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(731319, enchantLevel, 1)
    ToClient_qaCreateItem(736233, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(731320, enchantLevel, 1)
    ToClient_qaCreateItem(736234, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(731321, enchantLevel, 1)
    ToClient_qaCreateItem(736235, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Corsair then
    ToClient_qaCreateItem(731322, enchantLevel, 1)
    ToClient_qaCreateItem(736236, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Drakania then
    ToClient_qaCreateItem(731323, enchantLevel, 1)
    ToClient_qaCreateItem(736237, enchantLevel - 17, 1)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
end
function QAInteraction()
  if currnetCollectCnt > maxCollectCnt then
    return
  end
  if itemCngCnt == qaEnduranceCnt * quickSlotCnt then
    QAchangeitem()
    return
  end
  Interaction_ExecuteByKeyMapping(CppEnums.ActionInputType.ActionInputType_Interaction)
  luaTimer_AddEvent(QAlootitem, 3000, false, 0)
  currnetCollectCnt = currnetCollectCnt + 1
  itemCngCnt = itemCngCnt + 1
end
function QAlootitem()
  if true == _ContentsGroup_NewUI_Looting then
    if nil ~= HandleEventLUp_Looting_All_LootAll then
      HandleEventLUp_Looting_All_LootAll(true)
    end
  elseif nil ~= Panel_Looting_buttonLootAll_Mouse_Click then
    Panel_Looting_buttonLootAll_Mouse_Click(true)
  end
  luaTimer_AddEvent(QAInteraction, 500, false, 0)
end
function QAchangeitem()
  quickSlot_UseSlot(quickSlotCnt)
  quickSlotCnt = quickSlotCnt + 1
  chatting_sendMessage("", "/mentalup 500", CppEnums.ChatType.Private)
  luaTimer_AddEvent(QAInteraction, 500, false, 0)
end
function setCameraCave()
  setYaw(4,027)
  setPitch(-0,132)
end
function setCameraVelia()
  setYaw(5,133)
  setPitch(-0,155)
end
function setCameraSwamp()
  setYaw(1,715)
  setPitch(-0,155)
end
function setCameraDesert()
  setYaw(3,88)
  setPitch(-0,205)
end
function teleporttocave()
  ToClient_qaTeleport(998041,3125, -4423,40332, 9660,620117)
  setFov(70)
  pa_sendMessage("/channelspawn 1")
  pa_sendMessage("/notify 1 ê·¸ë˜í”½ í…ŒìŠ¤íŠ¸ ê´€ê³„ë¡œ ì ì‹œë™ì•ˆ ëª¬ìŠ¤í„° ìŠ¤í°ì„ ê¸ˆì§€í•©ë‹ˆë‹¤.")
  setScreenResolution(1920, 1080)
  setWatermarkService(6)
  setScreenMode(1)
  setFov(70)
  setIsOnScreenSaver(False)
  setGraphicMedium1()
  setTextureHigh()
end
function teleporttoswamp()
  ToClient_qaTeleport(26554,455078, -2191,066406, -130726,859375)
end
function teleporttodesert()
  ToClient_qaTeleport(1137384,25, 9872,613281, 163545,921875)
  pa_sendMessage("/channelspawn 0")
  pa_sendMessage("/notify 1 ëª¬ìŠ¤í„° ìŠ¤í° ë©ë‹ˆë‹¤")
  setGraphicVeryLow()
  setTextureHigh()
  setDofOff()
end
function teleporttovelia()
  ToClient_qaTeleport(4003,957031, -8217,459961, 85052,304688)
  setGraphicVeryLow()
  setTextureLow()
end
function setTextureLow()
  setTextureQuality(2)
end
function setTextureMedium()
  setTextureQuality(1)
end
function setTextureHigh()
  setTextureQuality(0)
end
function setGraphicVeryLow()
  setGraphicOption(6)
end
function setGraphicLow1()
  setGraphicOption(5)
end
function setGraphicMedium1()
  setGraphicOption(3)
end
function setGraphicHigh0()
  setGraphicOption(0)
end
function setDofOff()
  setDof(false)
end
function setDayTime()
  pa_sendMessage("/setgametime 13 00")
end
function setNightTime()
  pa_sendMessage("/setgametime 22 00")
end
function rainyWeather()
  pa_sendMessage("/weather create 0.5 0.5 10000 1")
end
function lowTemperature()
  pa_sendMessage("/weather change temperature -100 1")
end
function weatherClear()
  pa_sendMessage("/weather clear 1")
  pa_sendMessage("/weather change temperature 20 1")
end
function useQuickSlot1()
  quickSlot_UseSlot(0)
end
function useQuickSlot2()
  quickSlot_UseSlot(1)
end
function captureCave(value)
  local iwt = 0
  if nil == value then
    iwt = 0
  else
    iwt = value * 1000
  end
  local wt = iwt
  setScreenResolution(1920, 1080)
  setWatermarkService(6)
  setScreenMode(1)
  setFov(70)
  setIsOnScreenSaver(False)
  setGraphicMedium1()
  setTextureHigh()
  photoMode_On()
  setDofOff()
  luaTimer_AddEvent(setCameraCave, wt, false, 0)
  luaTimer_AddEvent(setDayTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
  luaTimer_AddEvent(setGraphicHigh0, wt + 1000, false, 0)
  luaTimer_AddEvent(setTextureLow, wt + 1000, false, 0)
  wt = iwt + wt + 1000
  luaTimer_AddEvent(setCameraCave, wt, false, 0)
  luaTimer_AddEvent(setNightTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
  luaTimer_AddEvent(teleporttoswamp, wt + 1000, false, 0)
end
function captureSwamp(value)
  local iwt = 0
  if nil == value then
    iwt = 0
  else
    iwt = value * 1000
  end
  local wt = iwt
  setScreenResolution(1920, 1080)
  setWatermarkService(6)
  setScreenMode(1)
  setFov(70)
  setIsOnScreenSaver(False)
  setGraphicHigh0()
  setTextureLow()
  photoMode_On()
  setDofOff()
  luaTimer_AddEvent(setCameraSwamp, wt, false, 0)
  luaTimer_AddEvent(setNightTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
  luaTimer_AddEvent(setGraphicLow1, wt + 1000, false, 0)
  luaTimer_AddEvent(setTextureHigh, wt + 1000, false, 0)
  wt = iwt + wt + 1000
  luaTimer_AddEvent(setCameraSwamp, wt, false, 0)
  luaTimer_AddEvent(setDayTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
  luaTimer_AddEvent(teleporttodesert, wt + 1000, false, 0)
end
function captureDesert(value)
  local iwt = 0
  if nil == value then
    iwt = 0
  else
    iwt = value * 1000
  end
  local wt = iwt
  setScreenResolution(1920, 1080)
  setWatermarkService(6)
  setScreenMode(1)
  setFov(70)
  setIsOnScreenSaver(False)
  setGraphicVeryLow()
  setTextureHigh()
  photoMode_On()
  setDofOff()
  luaTimer_AddEvent(setCameraDesert, wt, false, 0)
  luaTimer_AddEvent(setNightTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
  luaTimer_AddEvent(setGraphicMedium1, wt + 1000, false, 0)
  luaTimer_AddEvent(setTextureLow, wt + 1000, false, 0)
  wt = iwt + wt + 1000
  luaTimer_AddEvent(setCameraDesert, wt, false, 0)
  luaTimer_AddEvent(setDayTime, wt, false, 0)
  luaTimer_AddEvent(captureScreenShot, wt + 2000, false, 0)
  luaTimer_AddEvent(teleporttovelia, wt + 2500, false, 0)
end
function captureVelia(value)
  local iwt = 0
  if nil == value then
    iwt = 0
  else
    iwt = value * 1000
  end
  local wt = iwt
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_WizardWoman then
    setScreenResolution(1920, 1080)
    setWatermarkService(6)
    setScreenMode(1)
    setFov(70)
    setIsOnScreenSaver(False)
    setGraphicVeryLow()
    setTextureLow()
    photoMode_On()
    setDofOff()
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setNightTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(useQuickSlot1, wt + 1000, false, 0)
    luaTimer_AddEvent(useQuickSlot2, wt + 3000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 6500, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 18000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 18500, false, 0)
    luaTimer_AddEvent(useQuickSlot2, wt + 19000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 22500, false, 0)
    luaTimer_AddEvent(setGraphicLow1, wt + 23000, false, 0)
    luaTimer_AddEvent(setTextureHigh, wt + 23000, false, 0)
    wt = iwt + wt + 23000
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setNightTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 1000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 1500, false, 0)
    luaTimer_AddEvent(setGraphicMedium1, wt + 2000, false, 0)
    wt = iwt + wt + 2000
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setNightTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 1000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 1500, false, 0)
    luaTimer_AddEvent(setGraphicHigh0, wt + 2000, false, 0)
    luaTimer_AddEvent(setDofOff, wt + 2000, false, 0)
    wt = iwt + wt + 2000
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setNightTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(useQuickSlot2, wt + 1000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 4500, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 16000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 16500, false, 0)
    luaTimer_AddEvent(useQuickSlot2, wt + 17000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 20500, false, 0)
    luaTimer_AddEvent(rainyWeather, wt + 21000, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 201000, false, 0)
    luaTimer_AddEvent(setCameraVelia, wt + 201000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 201500, false, 0)
    luaTimer_AddEvent(setGraphicVeryLow, wt + 202000, false, 0)
    luaTimer_AddEvent(setTextureLow, wt + 202000, false, 0)
    luaTimer_AddEvent(setDofOff, wt + 202000, false, 0)
    wt = iwt + wt + 202000
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setDayTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(lowTemperature, wt + 1000, false, 0)
    luaTimer_AddEvent(setCameraVelia, wt + 181000, false, 0)
    luaTimer_AddEvent(setDayTime, wt + 181000, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 181500, false, 0)
    luaTimer_AddEvent(setGraphicHigh0, wt + 182000, false, 0)
    luaTimer_AddEvent(setTextureHigh, wt + 182000, false, 0)
    luaTimer_AddEvent(setDofOff, wt + 182000, false, 0)
    wt = iwt + wt + 182000
    luaTimer_AddEvent(setCameraVelia, wt, false, 0)
    luaTimer_AddEvent(setDayTime, wt, false, 0)
    luaTimer_AddEvent(captureScreenShot, wt + 500, false, 0)
    luaTimer_AddEvent(photoMode_On, wt + 1000, false, 0)
    luaTimer_AddEvent(weatherClear, wt + 1000, false, 0)
  else
    Proc_ShowMessage_Ack("ìœ„ì¹˜ ìºë¦­í„°ë¡œ ì ‘ì†í•´ì•¼ í•©ë‹ˆë‹¤.")
  end
end
function setremastered()
  FGlobal_Option_ResetAllOption()
  setGraphicOption(9)
  setTextureQuality(0)
  setAutoOptimization(false)
  setUseOptimizationEffectFrame(false)
  setUpscaleEnable(false)
  setUsePlayerOptimizationEffectFrame(false)
  setUseCharacterDistUpdate(false)
  setPresentLock(false)
  setTessellation(true)
  setRepresentative(true)
  setScreenResolution(1920, 1200)
  setScreenMode(2)
  setFov(50)
  setIsOnScreenSaver(False)
end
function createBossWeapon(enchantLevelA)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(10010, enchantLevelA, 1)
    ToClient_qaCreateItem(715001, enchantLevelA, 1)
    ToClient_qaCreateItem(10138, enchantLevelA, 1)
    ToClient_qaCreateItem(10140, enchantLevelA, 1)
    ToClient_qaCreateItem(701081, enchantLevelA, 1)
    ToClient_qaCreateItem(701082, enchantLevelA, 1)
    ToClient_qaCreateItem(14702, enchantLevelA, 1)
    ToClient_qaCreateItem(550033, 0, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(10210, enchantLevelA, 1)
    ToClient_qaCreateItem(715003, enchantLevelA, 1)
    ToClient_qaCreateItem(10338, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(701083, enchantLevelA, 1)
    ToClient_qaCreateItem(701084, enchantLevelA, 1)
    ToClient_qaCreateItem(14732, enchantLevelA, 1)
    ToClient_qaCreateItem(550036, 0, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(10410, enchantLevelA, 1)
    ToClient_qaCreateItem(715005, enchantLevelA, 1)
    ToClient_qaCreateItem(10538, enchantLevelA, 1)
    ToClient_qaCreateItem(10540, enchantLevelA, 1)
    ToClient_qaCreateItem(701085, enchantLevelA, 1)
    ToClient_qaCreateItem(701086, enchantLevelA, 1)
    ToClient_qaCreateItem(14712, enchantLevelA, 1)
    ToClient_qaCreateItem(550034, 0, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(10610, enchantLevelA, 1)
    ToClient_qaCreateItem(715007, enchantLevelA, 1)
    ToClient_qaCreateItem(10738, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(701087, enchantLevelA, 1)
    ToClient_qaCreateItem(701088, enchantLevelA, 1)
    ToClient_qaCreateItem(14722, enchantLevelA, 1)
    ToClient_qaCreateItem(550035, 0, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(715009, enchantLevelA, 1)
    ToClient_qaCreateItem(13038, enchantLevelA, 1)
    ToClient_qaCreateItem(13040, enchantLevelA, 1)
    ToClient_qaCreateItem(701089, enchantLevelA, 1)
    ToClient_qaCreateItem(701090, enchantLevelA, 1)
    ToClient_qaCreateItem(14742, enchantLevelA, 1)
    ToClient_qaCreateItem(550037, 0, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(13310, enchantLevelA, 1)
    ToClient_qaCreateItem(715011, enchantLevelA, 1)
    ToClient_qaCreateItem(13138, enchantLevelA, 1)
    ToClient_qaCreateItem(13140, enchantLevelA, 1)
    ToClient_qaCreateItem(701091, enchantLevelA, 1)
    ToClient_qaCreateItem(701092, enchantLevelA, 1)
    ToClient_qaCreateItem(14762, enchantLevelA, 1)
    ToClient_qaCreateItem(550039, 0, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaCreateItem(10010, enchantLevelA, 1)
    ToClient_qaCreateItem(715001, enchantLevelA, 1)
    ToClient_qaCreateItem(10138, enchantLevelA, 1)
    ToClient_qaCreateItem(10140, enchantLevelA, 1)
    ToClient_qaCreateItem(701081, enchantLevelA, 1)
    ToClient_qaCreateItem(701082, enchantLevelA, 1)
    ToClient_qaCreateItem(14752, enchantLevelA, 1)
    ToClient_qaCreateItem(550038, 0, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(13310, enchantLevelA, 1)
    ToClient_qaCreateItem(715011, enchantLevelA, 1)
    ToClient_qaCreateItem(13138, enchantLevelA, 1)
    ToClient_qaCreateItem(13140, enchantLevelA, 1)
    ToClient_qaCreateItem(701091, enchantLevelA, 1)
    ToClient_qaCreateItem(701092, enchantLevelA, 1)
    ToClient_qaCreateItem(14772, enchantLevelA, 1)
    ToClient_qaCreateItem(550040, 0, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(715009, enchantLevelA, 1)
    ToClient_qaCreateItem(14538, enchantLevelA, 1)
    ToClient_qaCreateItem(14540, enchantLevelA, 1)
    ToClient_qaCreateItem(701093, enchantLevelA, 1)
    ToClient_qaCreateItem(701094, enchantLevelA, 1)
    ToClient_qaCreateItem(14792, enchantLevelA, 1)
    ToClient_qaCreateItem(550042, 0, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(715009, enchantLevelA, 1)
    ToClient_qaCreateItem(14638, enchantLevelA, 1)
    ToClient_qaCreateItem(14640, enchantLevelA, 1)
    ToClient_qaCreateItem(701095, enchantLevelA, 1)
    ToClient_qaCreateItem(701096, enchantLevelA, 1)
    ToClient_qaCreateItem(14782, enchantLevelA, 1)
    ToClient_qaCreateItem(550041, 0, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(715013, enchantLevelA, 1)
    ToClient_qaCreateItem(10338, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(701083, enchantLevelA, 1)
    ToClient_qaCreateItem(701084, enchantLevelA, 1)
    ToClient_qaCreateItem(14802, enchantLevelA, 1)
    ToClient_qaCreateItem(550043, 0, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(715013, enchantLevelA, 1)
    ToClient_qaCreateItem(10338, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(701083, enchantLevelA, 1)
    ToClient_qaCreateItem(701084, enchantLevelA, 1)
    ToClient_qaCreateItem(14812, enchantLevelA, 1)
    ToClient_qaCreateItem(550044, 0, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(11360, enchantLevelA, 1)
    ToClient_qaCreateItem(715016, enchantLevelA, 1)
    ToClient_qaCreateItem(10738, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(701087, enchantLevelA, 1)
    ToClient_qaCreateItem(701088, enchantLevelA, 1)
    ToClient_qaCreateItem(14817, enchantLevelA, 1)
    ToClient_qaCreateItem(550045, 0, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(11210, enchantLevelA, 1)
    ToClient_qaCreateItem(715017, enchantLevelA, 1)
    ToClient_qaCreateItem(11338, enchantLevelA, 1)
    ToClient_qaCreateItem(11340, enchantLevelA, 1)
    ToClient_qaCreateItem(701097, enchantLevelA, 1)
    ToClient_qaCreateItem(701098, enchantLevelA, 1)
    ToClient_qaCreateItem(14822, enchantLevelA, 1)
    ToClient_qaCreateItem(550046, 0, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(11210, enchantLevelA, 1)
    ToClient_qaCreateItem(715017, enchantLevelA, 1)
    ToClient_qaCreateItem(11338, enchantLevelA, 1)
    ToClient_qaCreateItem(11340, enchantLevelA, 1)
    ToClient_qaCreateItem(701097, enchantLevelA, 1)
    ToClient_qaCreateItem(701098, enchantLevelA, 1)
    ToClient_qaCreateItem(14830, enchantLevelA, 1)
    ToClient_qaCreateItem(550047, 0, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(13410, enchantLevelA, 1)
    ToClient_qaCreateItem(715019, enchantLevelA, 1)
    ToClient_qaCreateItem(13538, enchantLevelA, 1)
    ToClient_qaCreateItem(13540, enchantLevelA, 1)
    ToClient_qaCreateItem(701099, enchantLevelA, 1)
    ToClient_qaCreateItem(701100, enchantLevelA, 1)
    ToClient_qaCreateItem(550502, enchantLevelA, 1)
    ToClient_qaCreateItem(550048, 0, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(13710, enchantLevelA, 1)
    ToClient_qaCreateItem(715021, enchantLevelA, 1)
    ToClient_qaCreateItem(13838, enchantLevelA, 1)
    ToClient_qaCreateItem(13840, enchantLevelA, 1)
    ToClient_qaCreateItem(701101, enchantLevelA, 1)
    ToClient_qaCreateItem(701102, enchantLevelA, 1)
    ToClient_qaCreateItem(13903, enchantLevelA, 1)
    ToClient_qaCreateItem(550049, 0, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(718510, enchantLevelA, 1)
    ToClient_qaCreateItem(718616, enchantLevelA, 1)
    ToClient_qaCreateItem(719038, enchantLevelA, 1)
    ToClient_qaCreateItem(719040, enchantLevelA, 1)
    ToClient_qaCreateItem(719055, enchantLevelA, 1)
    ToClient_qaCreateItem(719056, enchantLevelA, 1)
    ToClient_qaCreateItem(690004, enchantLevelA, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(690513, enchantLevelA, 1)
    ToClient_qaCreateItem(690563, enchantLevelA, 1)
    ToClient_qaCreateItem(10138, enchantLevelA, 1)
    ToClient_qaCreateItem(10140, enchantLevelA, 1)
    ToClient_qaCreateItem(701081, enchantLevelA, 1)
    ToClient_qaCreateItem(701082, enchantLevelA, 1)
    ToClient_qaCreateItem(691503, 20, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692045, enchantLevelA, 1)
    ToClient_qaCreateItem(692011, enchantLevelA, 1)
    ToClient_qaCreateItem(692514, enchantLevelA, 1)
    ToClient_qaCreateItem(692516, enchantLevelA, 1)
    ToClient_qaCreateItem(692802, enchantLevelA, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(730564, enchantLevelA, 1)
    ToClient_qaCreateItem(694326, enchantLevelA, 1)
    ToClient_qaCreateItem(730714, enchantLevelA, 1)
    ToClient_qaCreateItem(694327, enchantLevelA, 1)
    ToClient_qaCreateItem(730733, enchantLevelA, 1)
    ToClient_qaCreateItem(730734, enchantLevelA, 1)
    ToClient_qaCreateItem(694329, 20, 1)
  elseif isClassType == __eClassType_Sage then
  elseif isClassType == __eClassType_Corsair then
  end
end
function equipAllItems(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaUseInventoryItem(10010, enchantLevel)
    ToClient_qaUseInventoryItem(10138, enchantLevel)
    ToClient_qaUseInventoryItem(14702, enchantLevel)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaUseInventoryItem(10210, enchantLevel)
    ToClient_qaUseInventoryItem(10338, enchantLevel)
    ToClient_qaUseInventoryItem(14732, enchantLevel)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaUseInventoryItem(10410, enchantLevel)
    ToClient_qaUseInventoryItem(10538, enchantLevel)
    ToClient_qaUseInventoryItem(14712, enchantLevel)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaUseInventoryItem(10610, enchantLevel)
    ToClient_qaUseInventoryItem(10738, enchantLevel)
    ToClient_qaUseInventoryItem(14722, enchantLevel)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(13038, enchantLevel)
    ToClient_qaUseInventoryItem(14742, enchantLevel)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaUseInventoryItem(13310, enchantLevel)
    ToClient_qaUseInventoryItem(13138, enchantLevel)
    ToClient_qaUseInventoryItem(14762, enchantLevel)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaUseInventoryItem(10010, enchantLevel)
    ToClient_qaUseInventoryItem(10138, enchantLevel)
    ToClient_qaUseInventoryItem(14752, enchantLevel)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaUseInventoryItem(13310, enchantLevel)
    ToClient_qaUseInventoryItem(13138, enchantLevel)
    ToClient_qaUseInventoryItem(14772, enchantLevel)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(14538, enchantLevel)
    ToClient_qaUseInventoryItem(14792, enchantLevel)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(14638, enchantLevel)
    ToClient_qaUseInventoryItem(14782, enchantLevel)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10338, enchantLevel)
    ToClient_qaUseInventoryItem(14802, enchantLevel)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10338, enchantLevel)
    ToClient_qaUseInventoryItem(14812, enchantLevel)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaUseInventoryItem(11360, enchantLevel)
    ToClient_qaUseInventoryItem(10738, enchantLevel)
    ToClient_qaUseInventoryItem(14817, enchantLevel)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaUseInventoryItem(11210, enchantLevel)
    ToClient_qaUseInventoryItem(11338, enchantLevel)
    ToClient_qaUseInventoryItem(14822, enchantLevel)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaUseInventoryItem(11210, enchantLevel)
    ToClient_qaUseInventoryItem(11338, enchantLevel)
    ToClient_qaUseInventoryItem(14830, enchantLevel)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaUseInventoryItem(13410, enchantLevel)
    ToClient_qaUseInventoryItem(13538, enchantLevel)
    ToClient_qaUseInventoryItem(550502, enchantLevel)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaUseInventoryItem(13710, enchantLevel)
    ToClient_qaUseInventoryItem(13838, enchantLevel)
    ToClient_qaUseInventoryItem(13903, enchantLevel)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaUseInventoryItem(718510, enchantLevel)
    ToClient_qaUseInventoryItem(719038, enchantLevel)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaUseInventoryItem(690513, enchantLevel)
    ToClient_qaUseInventoryItem(10138, enchantLevel)
    ToClient_qaUseInventoryItem(691503, enchantLevel)
  end
  ToClient_qaUseInventoryItem(11101, enchantLevel)
  ToClient_qaUseInventoryItem(11015, enchantLevel)
  ToClient_qaUseInventoryItem(11103, enchantLevel)
  ToClient_qaUseInventoryItem(11017, enchantLevel)
end
function equipAccessory(enchantLevel)
  if enchantLevel < 15 then
    enchantLevel = 15
  end
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1000, false, 0, 11828, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1200, false, 0, 12031, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1400, false, 0, 12230, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1600, false, 0, 11607, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1800, false, 0, 11828, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2000, false, 0, 12031, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 0, false, 0, 45332, 0)
end
function siegeready(siegetype)
  chatting_sendMessage("", "/guildmember 1", CppEnums.ChatType.Public)
  if siegetype == nil then
    Proc_ShowMessage_Ack("()ì•ˆì— ê³µì„±ì „ íƒ€ì…ì„ ì…ë ¥í•´ì£¼ì„¸ìš” ì ë ¹:0 ê±°ì :1, 2, 3, 4 ")
    return
  elseif siegetype == 4 then
    EncreaseWeightBag()
    ToClient_qaCreateItem(56711, 0, 1)
    ToClient_qaCreateItem(59791, 0, 15)
  elseif siegetype == 3 then
    EncreaseWeightBag()
    ToClient_qaCreateItem(56710, 0, 1)
    ToClient_qaCreateItem(59791, 0, 15)
  elseif siegetype == 2 then
    EncreaseWeightBag()
    ToClient_qaCreateItem(56709, 0, 1)
    ToClient_qaCreateItem(59791, 0, 15)
  elseif siegetype == 1 then
    EncreaseWeightBag()
    ToClient_qaCreateItem(56708, 0, 1)
    ToClient_qaCreateItem(59791, 0, 15)
  elseif siegetype == 0 then
    EncreaseWeightBag()
    ToClient_qaCreateItem(56773, 0, 1)
    ToClient_qaCreateItem(56774, 0, 1)
    ToClient_qaCreateItem(56775, 0, 1)
    ToClient_qaCreateItem(56776, 0, 1)
    ToClient_qaCreateItem(56777, 0, 1)
    ToClient_qaCreateItem(59791, 0, 15)
    ToClient_qaCreateItem(56122, 0, 10)
    ToClient_qaCreateItem(56171, 0, 1)
    ToClient_qaCreateItem(56173, 0, 1)
  end
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
function PushJewelToItem(targetItemKey, jewelItemKey, enchantLevel)
  getSocketInformation():clearData()
  local itemWhereType = CppEnums.ItemWhereType.eInventory
  local itemSlotNo = CppEnums.TInventorySlotNoUndefined
  local jewelSlotNo = CppEnums.TInventorySlotNoUndefined
  local inventory = getSelfPlayer():get():getInventoryByType(itemWhereType)
  local findItemWrapper = function(itemWhereType, targetItemKey, targetEnchantLevel)
    local inventory = getSelfPlayer():get():getInventoryByType(itemWhereType)
    if nil == inventory then
      return false
    end
    local invenMaxSize = inventory:sizeXXX()
    for ii = 0, invenMaxSize - 1 do
      local itemWrapper = getInventoryItemByType(itemWhereType, ii)
      if nil ~= itemWrapper then
        local itemKey = itemWrapper:get():getKey():getItemKey()
        local enchantLevel = itemWrapper:get():getKey():getEnchantLevel()
        if itemKey == targetItemKey then
          if nil == targetEnchantLevel then
            return itemWrapper
          elseif nil ~= targetEnchantLevel and enchantLevel == targetEnchantLevel then
            return itemWrapper
          end
        end
      end
    end
    return nil
  end
  local itemWrapper1 = findItemWrapper(itemWhereType, targetItemKey)
  _PA_LOG("ê¹€ë³‘í˜¸", "itemWrapper1 : " .. tostring(itemWrapper1))
  if nil ~= itemWrapper1 then
    itemSlotNo = inventory:getSlot(itemWrapper1:get():getKey())
    _PA_LOG("ê¹€ë³‘í˜¸", "itemSlotNo : " .. tostring(itemSlotNo))
  end
  local itemWrapper2 = findItemWrapper(itemWhereType, jewelItemKey)
  if nil ~= itemWrapper2 then
    jewelSlotNo = inventory:getSlot(itemWrapper2:get():getKey())
    _PA_LOG("ê¹€ë³‘í˜¸", "jewelSlotNo : " .. tostring(jewelSlotNo))
  end
  if itemSlotNo == CppEnums.TInventorySlotNoUndefined or jewelSlotNo == CppEnums.TInventorySlotNoUndefined then
    Proc_ShowMessage_Ack("ì•„ì´í…œì„ ì°¾ì„ ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
    return
  end
  local rv = ToClient_PushJewelToItemForDev(itemWhereType, itemSlotNo, itemWhereType, jewelSlotNo)
  _PA_LOG("ê¹€ë³‘í˜¸", "Error : " .. tostring(rv))
end
function maidtest()
  ToClient_qaCreateItem(149002, 0, 5)
  ToClient_qaCreateItem(149003, 0, 5)
  for i = 1, 5 do
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 5000 + i * 500, false, 0, 149002, 0)
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 5000 + i * 500, false, 0, 149003, 0)
  end
end
function dyingtest()
  ToClient_qaCreateItem(17116, 0, 1)
  ToClient_qaCreateItem(46054, 0, 1)
  ToClient_qaCreateItem(46203, 0, 1)
  ToClient_qaCreateItem(46358, 0, 1)
  ToClient_qaCreateItem(46461, 0, 1)
  ToClient_qaCreateItem(46520, 0, 1)
  ToClient_qaCreateItem(46710, 0, 1)
  ToClient_qaCreateItem(46854, 0, 1)
  ToClient_qaCreateItem(17318, 0, 10)
  ToClient_qaCreateItem(17319, 0, 1)
end
function enhancingtest()
  createBossWeapon(0)
  createBossWeapon(15)
  createBossWeapon(19)
  createBossArmor(0)
  createBossArmor(15)
  createBossArmor(19)
  ToClient_qaCreateItem(10069, 0, 1)
  ToClient_qaCreateItem(10069, 15, 1)
  ToClient_qaCreateItem(10069, 19, 1)
  ToClient_qaCreateItem(10961, 0, 1)
  ToClient_qaCreateItem(10961, 15, 1)
  ToClient_qaCreateItem(10961, 19, 1)
  ToClient_qaCreateItem(12031, 3, 1)
  ToClient_qaCreateItem(12031, 0, 2)
  ToClient_qaCreateItem(11607, 3, 1)
  ToClient_qaCreateItem(11607, 0, 2)
  ToClient_qaCreateItem(12230, 3, 1)
  ToClient_qaCreateItem(12230, 0, 2)
  ToClient_qaCreateItem(16001, 0, 100)
  ToClient_qaCreateItem(16002, 0, 100)
  ToClient_qaCreateItem(16004, 0, 100)
  ToClient_qaCreateItem(16005, 0, 100)
  ToClient_qaCreateItem(5000, 0, 100)
  ToClient_qaCreateItem(4987, 0, 100)
  ToClient_qaCreateItem(752021, 0, 100)
  ToClient_qaCreateItem(16080, 0, 20000)
  ToClient_qaCreateItem(721003, 0, 100000)
  ToClient_qaCreateItem(4906, 0, 1)
  ToClient_qaCreateItem(4907, 0, 1)
  ToClient_qaCreateItem(4912, 0, 1)
  ToClient_qaCreateItem(4913, 0, 1)
  ToClient_qaCreateItem(4929, 0, 2)
  ToClient_qaCreateItem(320060, 0, 2)
  ToClient_qaCreateItem(17000, 0, 100)
  ToClient_qaCreateItem(15801, 0, 2)
  ToClient_qaCreateItem(15813, 0, 2)
  ToClient_qaCreateItem(44195, 0, 100)
  ToClient_qaCreateItem(17598, 0, 100)
  ToClient_qaCreateItem(289200, 0, 100)
  ToClient_qaCreateItem(17900, 0, 100)
  ToClient_qaCreateItem(289907, 0, 100)
  ToClient_qaCreateItem(8141, 0, 10)
  ToClient_qaCreateItem(8148, 0, 10)
  ToClient_qaCreateItem(8149, 0, 10)
  ToClient_qaCreateItem(8181, 0, 10)
  ToClient_qaCreateItem(8182, 0, 10)
  ToClient_qaCreateItem(16000, 0, 5)
end
function fishingtest()
  pa_sendMessage("/lifelvup 81 1")
  ToClient_qaCreateItem(65488, 0, 1)
  ToClient_qaCreateItem(16153, 0, 1)
  ToClient_qaCreateItem(16162, 10, 1)
  ToClient_qaCreateItem(16164, 10, 1)
  ToClient_qaCreateItem(16165, 10, 1)
  ToClient_qaCreateItem(16441, 1, 1)
  ToClient_qaCreateItem(16167, 10, 1)
  ToClient_qaCreateItem(16168, 10, 1)
  ToClient_qaCreateItem(14020, 0, 1)
  ToClient_qaCreateItem(14020, 1, 1)
  ToClient_qaCreateItem(14020, 2, 1)
  ToClient_qaCreateItem(14020, 3, 1)
  ToClient_qaCreateItem(14020, 4, 1)
  ToClient_qaCreateItem(14020, 5, 1)
  ToClient_qaCreateItem(17555, 0, 10)
  ToClient_qaCreateItem(705052, 15, 1)
  ToClient_qaCreateItem(705052, 16, 1)
  ToClient_qaCreateItem(705052, 17, 1)
  ToClient_qaCreateItem(705052, 18, 1)
  ToClient_qaCreateItem(705052, 19, 1)
  ToClient_qaCreateItem(705052, 20, 1)
  ToClient_qaCreateItem(65424, 0, 100)
  ToClient_qaCreateItem(12831, 0, 1)
  ToClient_qaCreateItem(44940, 0, 1)
  ToClient_qaCreateItem(9643, 0, 1)
end
function harvesttest()
  chatting_sendMessage("", "/lifelvup 51 8", CppEnums.ChatType.Public)
  ToClient_qaCreateItem(58001, 0, 1)
  ToClient_qaCreateItem(58002, 0, 1)
  ToClient_qaCreateItem(58012, 0, 1)
  local seedRanNum1 = math.random(1, 23)
  ToClient_qaCreateItem(6700 + seedRanNum1, 0, 10)
  ToClient_qaCreateItem(6800 + seedRanNum1, 0, 10)
  ToClient_qaCreateItem(6750 + seedRanNum1, 0, 2)
  ToClient_qaCreateItem(65425, 0, 3)
  local seedRanNum2 = math.random(1, 3)
  ToClient_qaCreateItem(7022 + seedRanNum2, 0, 10)
  ToClient_qaCreateItem(6656, 0, 10)
  for i = 1, 3 do
    ToClient_qaCreateItem(16900 + i, 0, 5)
  end
  ToClient_qaCreateItem(16910, 0, 1)
  ToClient_qaCreateItem(16911, 0, 1)
  ToClient_qaCreateItem(4605, 0, 100)
  local fenceRanNum = math.random(1, 2)
  if fenceRanNum == 1 then
    ToClient_qaTeleport(9233, -6049, 70372)
  elseif fenceRanNum == 2 then
    ToClient_qaTeleport(16904, -790, -105316)
  end
end
function questtest()
  ToClient_qaCompleteQuest(677, 1)
  ToClient_qaCreateItem(44192, 0, 10)
  ToClient_qaCreateItem(11813, 0, 1)
  ToClient_qaAcceptQuest(3510, 94)
  ToClient_qaCompleteQuest(663, 9)
end
function gatheringtest()
  ToClient_qaCreateItem(14022, 5, 1)
  ToClient_qaCreateItem(705517, 16, 1)
  ToClient_qaCreateItem(705517, 17, 1)
  ToClient_qaCreateItem(705517, 18, 1)
  ToClient_qaCreateItem(705517, 19, 1)
  ToClient_qaCreateItem(705517, 20, 1)
  ToClient_qaCreateItem(16479, 19, 1)
  ToClient_qaCreateItem(16481, 19, 1)
  ToClient_qaCreateItem(16482, 19, 1)
  ToClient_qaCreateItem(16486, 19, 1)
  ToClient_qaCreateItem(16487, 19, 1)
  ToClient_qaCreateItem(16847, 19, 1)
  ToClient_qaCreateItem(16829, 0, 1)
  ToClient_qaCreateItem(16830, 0, 1)
  ToClient_qaCreateItem(16831, 0, 1)
  ToClient_qaCreateItem(16832, 0, 1)
  ToClient_qaCreateItem(16833, 0, 1)
  ToClient_qaCreateItem(16834, 0, 1)
  ToClient_qaCreateItem(830022, 0, 1)
  pa_sendMessage("/lifelvup 51 0")
end
function alchemytest(number)
  if nil == number then
    number = 1
  end
  ToClient_qaCreateItem(3744, 0, 2)
  ToClient_qaCreateItem(14025, 5, 1)
  ToClient_qaCreateItem(705047, 16, 1)
  ToClient_qaCreateItem(705047, 17, 1)
  ToClient_qaCreateItem(705047, 18, 1)
  ToClient_qaCreateItem(705047, 19, 1)
  ToClient_qaCreateItem(705047, 20, 1)
  ToClient_qaCreateItem(45802, 0, 1)
  local alchemyRanNum = math.random(1, 4)
  if alchemyRanNum == 1 then
    ToClient_qaCreateItem(5005, 0, 1 * number)
    ToClient_qaCreateItem(4802, 0, 1 * number)
    ToClient_qaCreateItem(5301, 0, 1 * number)
    ToClient_qaCreateItem(6201, 0, 2 * number)
    Proc_ShowMessage_Ack("'ì£„ì¸ì˜ í˜ˆì•¡'ì„ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif alchemyRanNum == 2 then
    ToClient_qaCreateItem(6355, 0, 1 * number)
    ToClient_qaCreateItem(4805, 0, 2 * number)
    ToClient_qaCreateItem(5403, 0, 6 * number)
    ToClient_qaCreateItem(5002, 0, 5 * number)
    Proc_ShowMessage_Ack("'ì„¸ì›”ì˜ ë¹„ì•½'ì„ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif alchemyRanNum == 3 then
    ToClient_qaCreateItem(6603, 0, 1 * number)
    ToClient_qaCreateItem(5302, 0, 6 * number)
    ToClient_qaCreateItem(5411, 0, 4 * number)
    ToClient_qaCreateItem(5007, 0, 3 * number)
    ToClient_qaCreateItem(5957, 0, 3 * number)
    Proc_ShowMessage_Ack("'ì‚¬ì‹ ì˜ ë¹„ì•½'ì„ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif alchemyRanNum == 4 then
    ToClient_qaCreateItem(5439, 0, 1 * number)
    ToClient_qaCreateItem(5401, 0, 1 * number)
    ToClient_qaCreateItem(9001, 0, 1 * number)
    ToClient_qaCreateItem(6656, 0, 1 * number)
    Proc_ShowMessage_Ack("'ë§‘ì€ ì•¡ì²´ ì‹œì•½'ì„ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  end
end
function huntingtest()
  ToClient_qaCreateItem(16157, 0, 1)
  ToClient_qaCreateItem(16161, 10, 1)
  ToClient_qaCreateItem(56133, 10, 1)
  ToClient_qaCreateItem(705022, 15, 1)
  ToClient_qaCreateItem(705022, 16, 1)
  ToClient_qaCreateItem(705022, 17, 1)
  ToClient_qaCreateItem(705022, 18, 1)
  ToClient_qaCreateItem(705022, 19, 1)
  ToClient_qaCreateItem(705022, 20, 1)
  ToClient_qaCreateItem(16487, 19, 1)
  ToClient_qaCreateItem(16831, 0, 1)
  ToClient_qaCreateItem(65410, 0, 1)
  ToClient_qaCreateItem(44944, 0, 1)
  chatting_sendMessage("", "/lifelvup 80 2", CppEnums.ChatType.Public)
end
function processingtest()
  chatting_sendMessage("", "/lifelvup 100 7", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/create item 36554~36567 1", CppEnums.ChatType.Public)
  ToClient_qaCreateItem(705518, 20, 1)
  ToClient_qaCreateItem(14026, 5, 1)
  ToClient_qaCreateItem(44943, 0, 1)
  ToClient_qaCreateItem(720501, 20, 1)
  ToClient_qaCreateItem(720502, 20, 1)
  ToClient_qaCreateItem(720503, 20, 1)
  ToClient_qaCreateItem(720504, 20, 1)
  ToClient_qaCreateItem(720505, 20, 1)
  ToClient_qaCreateItem(720506, 20, 1)
  local pRanNum = math.random(1, 4)
  if pRanNum == 1 then
    ToClient_qaCreateItem(9061, 0, 1000)
    ToClient_qaCreateItem(9001, 0, 1000)
    Proc_ShowMessage_Ack("ë²„í„° ê°€ê³µ : í¬ë¦¼, ì†Œê¸ˆìœ¼ë¡œ í”ë“¤ì–´ ì„ê¸°")
    luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1000, false, 0, 11828, enchantLevel - 15)
  elseif pRanNum == 2 then
    ToClient_qaCreateItem(16001, 0, 1000)
    Proc_ShowMessage_Ack("ë¸”ë™ìŠ¤í†¤ ê°€ë£¨ ê°€ê³µ : ë¸”ë™ìŠ¤í†¤(ë¬´ê¸°) ë¹»ê¸°.")
  elseif pRanNum == 3 then
    ToClient_qaCreateItem(4605, 0, 1000)
    Proc_ShowMessage_Ack("ì“¸ë§Œí•œ ê°ëª© ê°€ê³µ : í†µë‚˜ë¬´ ì¥ì‘íŒ¨ê¸°.")
  elseif pRanNum == 4 then
    ToClient_qaCreateItem(5802, 0, 1000)
    Proc_ShowMessage_Ack("ì•„ë§ˆì‹¤ ê°€ê³µ : ì•„ë§ˆ ê°€ì—´í•˜ê¸°.")
  end
end
function cooktest(number)
  if nil == number then
    number = 1
  end
  ToClient_qaCreateItem(3743, 0, 3)
  ToClient_qaCreateItem(14019, 5, 1)
  ToClient_qaCreateItem(705037, 16, 1)
  ToClient_qaCreateItem(705037, 17, 1)
  ToClient_qaCreateItem(705037, 18, 1)
  ToClient_qaCreateItem(705037, 19, 1)
  ToClient_qaCreateItem(705037, 20, 1)
  local cookRanNum = math.random(1, 10)
  if cookRanNum == 1 then
    ToClient_qaCreateItem(7005, 0, 5 * number)
    ToClient_qaCreateItem(9059, 0, 6 * number)
    ToClient_qaCreateItem(9002, 0, 1 * number)
    ToClient_qaCreateItem(9005, 0, 2 * number)
    Proc_ShowMessage_Ack("'ë§¥ì£¼'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 2 then
    ToClient_qaCreateItem(9270, 0, 2 * number)
    ToClient_qaCreateItem(7105, 0, 2 * number)
    ToClient_qaCreateItem(9065, 0, 3 * number)
    ToClient_qaCreateItem(7702, 0, 3 * number)
    Proc_ShowMessage_Ack("'ë°€í¬í‹°'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 3 then
    ToClient_qaCreateItem(7026, 0, 3 * number)
    ToClient_qaCreateItem(9064, 0, 2 * number)
    ToClient_qaCreateItem(9016, 0, 4 * number)
    ToClient_qaCreateItem(7205, 0, 3 * number)
    ToClient_qaCreateItem(8201, 0, 1 * number)
    Proc_ShowMessage_Ack("'ì½”ì½”ë„› ìƒì„  íŠ€ê¹€'ì„ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 4 then
    ToClient_qaCreateItem(7906, 0, 5 * number)
    ToClient_qaCreateItem(7105, 0, 2 * number)
    ToClient_qaCreateItem(9017, 0, 2 * number)
    ToClient_qaCreateItem(9059, 0, 3 * number)
    Proc_ShowMessage_Ack("'ë¯¸íŠ¸ ìŠ¤íŠœ'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 5 then
    ToClient_qaCreateItem(9203, 0, 1 * number)
    ToClient_qaCreateItem(9404, 0, 1 * number)
    ToClient_qaCreateItem(9417, 0, 1 * number)
    ToClient_qaCreateItem(9241, 0, 2 * number)
    ToClient_qaCreateItem(9213, 0, 2 * number)
    Proc_ShowMessage_Ack("'ë°œë ˆë…¸ìŠ¤ ì •ì‹'ì„ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 6 then
    ToClient_qaCreateItem(7923, 0, 4 * number)
    ToClient_qaCreateItem(9202, 0, 2 * number)
    ToClient_qaCreateItem(9214, 0, 4 * number)
    ToClient_qaCreateItem(7020, 0, 3 * number)
    Proc_ShowMessage_Ack("'ì •ê¸€ì˜ ì™• í–„ë²„ê·¸'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 7 then
    ToClient_qaCreateItem(9422, 0, 1 * number)
    ToClient_qaCreateItem(9261, 0, 1 * number)
    ToClient_qaCreateItem(9427, 0, 2 * number)
    ToClient_qaCreateItem(9425, 0, 1 * number)
    ToClient_qaCreateItem(9262, 0, 2 * number)
    Proc_ShowMessage_Ack("'ë©”ë””ì•„ ì •ì‹'ì„ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 8 then
    ToClient_qaCreateItem(7906, 0, 6 * number)
    ToClient_qaCreateItem(8201, 0, 1 * number)
    ToClient_qaCreateItem(9059, 0, 3 * number)
    ToClient_qaCreateItem(7105, 0, 4 * number)
    Proc_ShowMessage_Ack("'ì¢‹ì€ ì‚¬ë£Œ'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 9 then
    ToClient_qaCreateItem(7908, 0, 6 * number)
    ToClient_qaCreateItem(7205, 0, 6 * number)
    ToClient_qaCreateItem(7348, 0, 1 * number)
    ToClient_qaCreateItem(9015, 0, 2 * number)
    Proc_ShowMessage_Ack("'ì‚¬ë§‰ ë§Œë‘'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  elseif cookRanNum == 10 then
    ToClient_qaCreateItem(7105, 0, 1 * number)
    ToClient_qaCreateItem(7313, 0, 1 * number)
    ToClient_qaCreateItem(9005, 0, 1 * number)
    Proc_ShowMessage_Ack("'ìˆ ì˜ ì •ìˆ˜'ë¥¼ " .. tostring(number) .. "ê°œ ë§Œë“¤ì–´ ì£¼ì„¸ìš”.")
  end
end
function tradetest()
  ToClient_qaCompleteQuest(21001, 1)
  ToClient_qaCompleteQuest(5801, 4)
  chatting_sendMessage("", "/lifelvup 52 7", CppEnums.ChatType.Public)
  ToClient_qaCreateItem(55158, 0, 1)
  chatting_sendMessage("", "/teleport 40010 1", CppEnums.ChatType.Public)
end
function illegalTradeTest()
  chatting_sendMessage("", "ë°€ë¬´ì—­ í…ŒìŠ¤íŠ¸ë¡œ ê²Œì„ì‹œê°„ ë°¤ìœ¼ë¡œ ë³€ê²½í•˜ê² ìŠµë‹ˆë‹¤.", CppEnums.ChatType.World)
  chatting_sendMessage("", "/setgametime 22 0", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/lifelvup 52 7", CppEnums.ChatType.Public)
  chatting_sendMessage("", "/teleport 45204 1", CppEnums.ChatType.Public)
end
function imperialTradeTest()
  ToClient_qaCreateItem(55201, 0, 1)
  ToClient_qaCreateItem(9801, 0, 3)
  chatting_sendMessage("", "/teleport 41120 1", CppEnums.ChatType.Public)
end
function PaGlobalFunc_QaCreateAndEquip(enchantLeve1)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  UnEquipAllQATEST()
  luaTimer_AddEvent(equipAutoAllItem, 5000, false, 0, enchantLeve1)
end
function PaGlobalFunc_QaEquipBossWeapon(enchantLeve1)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaUseInventoryItem(10010, enchantLeve1)
    ToClient_qaUseInventoryItem(10138, enchantLeve1)
    ToClient_qaUseInventoryItem(14702, enchantLeve1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaUseInventoryItem(10210, enchantLeve1)
    ToClient_qaUseInventoryItem(10338, enchantLeve1)
    ToClient_qaUseInventoryItem(14732, enchantLeve1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaUseInventoryItem(10410, enchantLeve1)
    ToClient_qaUseInventoryItem(10538, enchantLeve1)
    ToClient_qaUseInventoryItem(14712, enchantLeve1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaUseInventoryItem(10610, enchantLeve1)
    ToClient_qaUseInventoryItem(10738, enchantLeve1)
    ToClient_qaUseInventoryItem(14722, enchantLeve1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaUseInventoryItem(13210, enchantLeve1)
    ToClient_qaUseInventoryItem(13038, enchantLeve1)
    ToClient_qaUseInventoryItem(14742, enchantLeve1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaUseInventoryItem(13310, enchantLeve1)
    ToClient_qaUseInventoryItem(13138, enchantLeve1)
    ToClient_qaUseInventoryItem(14762, enchantLeve1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaUseInventoryItem(10010, enchantLeve1)
    ToClient_qaUseInventoryItem(10138, enchantLeve1)
    ToClient_qaUseInventoryItem(14752, enchantLeve1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaUseInventoryItem(13310, enchantLeve1)
    ToClient_qaUseInventoryItem(13138, enchantLeve1)
    ToClient_qaUseInventoryItem(14772, enchantLeve1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaUseInventoryItem(13210, enchantLeve1)
    ToClient_qaUseInventoryItem(14538, enchantLeve1)
    ToClient_qaUseInventoryItem(14792, enchantLeve1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaUseInventoryItem(13210, enchantLeve1)
    ToClient_qaUseInventoryItem(14638, enchantLeve1)
    ToClient_qaUseInventoryItem(14782, enchantLeve1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaUseInventoryItem(14410, enchantLeve1)
    ToClient_qaUseInventoryItem(10338, enchantLeve1)
    ToClient_qaUseInventoryItem(14802, enchantLeve1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaUseInventoryItem(14410, enchantLeve1)
    ToClient_qaUseInventoryItem(10338, enchantLeve1)
    ToClient_qaUseInventoryItem(14812, enchantLeve1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaUseInventoryItem(11360, enchantLeve1)
    ToClient_qaUseInventoryItem(10738, enchantLeve1)
    ToClient_qaUseInventoryItem(14817, enchantLeve1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaUseInventoryItem(11210, enchantLeve1)
    ToClient_qaUseInventoryItem(11338, enchantLeve1)
    ToClient_qaUseInventoryItem(14822, enchantLeve1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaUseInventoryItem(11210, enchantLeve1)
    ToClient_qaUseInventoryItem(11338, enchantLeve1)
    ToClient_qaUseInventoryItem(14830, enchantLeve1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaUseInventoryItem(13410, enchantLeve1)
    ToClient_qaUseInventoryItem(13538, enchantLeve1)
    ToClient_qaUseInventoryItem(550502, enchantLeve1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaUseInventoryItem(13710, enchantLeve1)
    ToClient_qaUseInventoryItem(13838, enchantLeve1)
    ToClient_qaUseInventoryItem(13903, enchantLeve1)
  end
end
function PaGlobalFunc_QaEquipBossArmor(enchantLeve1)
  ToClient_qaUseInventoryItem(11015, enchantLeve1)
  ToClient_qaUseInventoryItem(11017, enchantLeve1)
  ToClient_qaUseInventoryItem(11101, enchantLeve1)
  ToClient_qaUseInventoryItem(11103, enchantLeve1)
end
function PaGlobalFunc_QaEquipAccessory1(enchantLeve1)
  local castAccessoryEnchant = enchantLeve1 - 15
  ToClient_qaUseInventoryItem(12230, castAccessoryEnchant)
  ToClient_qaUseInventoryItem(11607, castAccessoryEnchant)
end
function PaGlobalFunc_QaEquipAccessory2(enchantLeve1)
  local castAccessoryEnchant = enchantLeve1 - 15
  ToClient_qaUseInventoryItem(12031, castAccessoryEnchant)
  ToClient_qaUseInventoryItem(11828, castAccessoryEnchant)
end
function setYaw(value)
  selfPlayerSetCameraYaw(value)
end
function setPitch(value)
  selfPlayerSetCameraPich(value)
end
function setRoll(value)
  selfPlayerSetCameraRoll(value)
end
function captureScreenShot()
  ToClient_CaptureByFrameCheck()
end
function photoMode_On()
  ToClient_InputPhotoModeFromLua()
end
function pa_sendMessage(message)
  local memoryChatType = 1
  local target = ""
  chatting_sendMessage(target, message, memoryChatType)
  chatting_saveMessageHistory(target, message)
end
function pa_useQuickSlot(num)
  QuickSlot_DropHandler(num)
end
function joinBR(mode)
  ToClient_JoinBattleRoyaleMode(mode)
end
function joinbroc()
  ToClient_RequestBattleRoyaleJoinToAnotherChannel()
end
function exitbroc()
  ToClient_RequestBattleRoyaleExitToBeforeServer()
end
function brchange(no, findex, state)
  ToClient_BattleRoyaleStateChange(no, findex, state)
end
QASupportDamageWriter2 = {}
local filePath = "D:\\Trunk\\UI_Data\\Script\\QASupport\\LogQASupportDamageWriter\\"
local file
local fileNum = 0
local fileText = "test.txt"
local Mindamage = 0
local Maxdamage = 0
SumCountDamage = 0
local QAtargetPV = 0
local QAtargetDV = 0
local QAtargetMaxHp = 0
function QASupportDamageWriter2:write(text)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    fileText = "Warrior.txt"
  elseif isClassType == __eClassType_ElfRanger then
    fileText = "ElfRanger.txt"
  elseif isClassType == __eClassType_Sorcerer then
    fileText = "Sorcerer.txt"
  elseif isClassType == __eClassType_Giant then
    fileText = "Giant.txt"
  elseif isClassType == __eClassType_Tamer then
    fileText = "Tamer.txt"
  elseif isClassType == __eClassType_BladeMaster then
    fileText = "Musa.txt"
  elseif isClassType == __eClassType_Valkyrie then
    fileText = "Valkiry.txt"
  elseif isClassType == __eClassType_BladeMasterWoman then
    fileText = "Maehwa.txt"
  elseif isClassType == __eClassType_Kunoichi then
    fileText = "Kunoich.txt"
  elseif isClassType == __eClassType_NinjaMan then
    fileText = "Ninja.txt"
  elseif isClassType == __eClassType_WizardWoman then
    fileText = "Witch.txt"
  elseif isClassType == __eClassType_WizardMan then
    fileText = "Wizard.txt"
  elseif isClassType == __eClassType_DarkElf then
    fileText = "DarkKnight.txt"
  elseif isClassType == __eClassType_Combattant then
    fileText = "Combattant.txt"
  elseif isClassType == __eClassType_Mystic then
    fileText = "Mistic.txt"
  elseif isClassType == __eClassType_Lhan then
    fileText = "Lhan.txt"
  elseif isClassType == __eClassType_RangerMan then
    fileText = "Archer.txt"
  elseif isClassType == __eClassType_ShyWaman then
    fileText = "Shai.txt"
  elseif isClassType == __eClassType_Guardian then
    fileText = "Guardian.txt"
  elseif isClassType == __eClassType_Hashashin then
    fileText = "Hashashin.txt"
  elseif isClassType == __eClassType_Nova then
    fileText = "Nova.txt"
  elseif isClassType == __eClassType_Sage then
    fileText = "Sage.txt"
  elseif isClassType == __eClassType_Corsair then
    fileText = "Corsair.txt"
  elseif isClassType == __eClassType_Drakania then
    fileText = "Drakania.txt"
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
  file = io.open(filePath .. fileText, "a")
  file:write(text)
  file:close()
end
local QASkillname = 0
local QABuffname = 0
local QAMaxMindamage1 = 0
local QAMaxMindamage2 = 0
local QASumCountDamage = 0
function FromClient_QADebugSkillName(Skillname, Buffname)
  QASupportDamageWriter2:write(tostring(Skillname) .. "\t")
  QASupportDamageWriter2:write(tostring(Buffname) .. [[


]])
end
function FromClient_QADebugMinMaxDamage(MaxMinindex, MaxMindamage)
  if MaxMinindex < 1 then
    MaxMindamage = MaxMindamage * 100
    MaxMindamage = math.floor(MaxMindamage + 0,5)
    MaxMindamage = MaxMindamage * 0,01
    QASupportDamageWriter2:write(tostring(MaxMindamage) .. "\t")
  else
    MaxMindamage = MaxMindamage * 100
    MaxMindamage = math.floor(MaxMindamage + 0,5)
    MaxMindamage = MaxMindamage * 0,01
    QASupportDamageWriter2:write(tostring(MaxMindamage) .. "\t")
  end
end
function FromClient_QADebugCountDamage(Countindex, CountDamage)
  SumCountDamage = SumCountDamage + CountDamage
  if Countindex == 9 then
    SumCountDamage = SumCountDamage * 0,1
    SumCountDamage = SumCountDamage * 100
    SumCountDamage = math.floor(SumCountDamage + 0,5)
    SumCountDamage = SumCountDamage * 0,01
    QASupportDamageWriter2:write(tostring(SumCountDamage) .. "\t")
    SumCountDamage = 0
  end
end
function QASupportDamagetest(ST)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    StartQASkillUseWarrior(ST)
  elseif isClassType == __eClassType_ElfRanger then
    StartQASkillUseRanger(ST)
  elseif isClassType == __eClassType_Sorcerer then
    StartQASkillUseSorcerer(ST)
  elseif isClassType == __eClassType_Giant then
    StartQASkillUseGiant(ST)
  elseif isClassType == __eClassType_Tamer then
    StartQASkillUseTamer(ST)
  elseif isClassType == __eClassType_BladeMaster then
    StartQASkillUseMusa(ST)
  elseif isClassType == __eClassType_Valkyrie then
    StartQASkillUseValkiry(ST)
  elseif isClassType == __eClassType_BladeMasterWoman then
    StartQASkillUseMaewhwa(ST)
  elseif isClassType == __eClassType_Kunoichi then
    StartQASkillUseKunoich(ST)
  elseif isClassType == __eClassType_NinjaMan then
    StartQASkillUseNinja(ST)
  elseif isClassType == __eClassType_WizardWoman then
    StartQASkillUseWitch(ST)
  elseif isClassType == __eClassType_WizardMan then
    StartQASkillUseWizard(ST)
  elseif isClassType == __eClassType_DarkElf then
    StartQASkillUseDarkKnight(ST)
  elseif isClassType == __eClassType_Combattant then
    StartQASkillUseCombattant(ST)
  elseif isClassType == __eClassType_Mystic then
    StartQASkillUseMistic(ST)
  elseif isClassType == __eClassType_Lhan then
    StartQASkillUseLahn(ST)
  elseif isClassType == __eClassType_RangerMan then
    StartQASkillUseArcher(ST)
  elseif isClassType == __eClassType_ShyWaman then
    StartQASkillUseShai(ST)
  elseif isClassType == __eClassType_Guardian then
    StartQASkillUseGuardian(ST)
  elseif isClassType == __eClassType_Hashashin then
    StartQASkillUseHashashin(ST)
  elseif isClassType == __eClassType_Nova then
    StartQASkillUseNova(ST)
  elseif isClassType == __eClassType_Sage then
    StartQASkillUseSage(ST)
  elseif isClassType == __eClassType_Corsair then
    StartQASkillUseCorsair(ST)
  elseif isClassType == __eClassType_Drakania then
    StartQASkillUseDrakania(ST)
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
end
function WriteQADamage()
  QASupportDamageWriter2:write("ìƒëŒ€ê³µê²©ë ¥ : " .. tostring(QAtargetPV) .. " ìƒëŒ€ë°©ì–´ë ¥ : " .. tostring(QAtargetDV) .. " ìƒëŒ€ìµœëŒ€ì²´ë ¥ : " .. tostring(QAtargetMaxHp) .. "\n")
end
function createAutoWeapon(enchantLevelA)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(10010, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10140, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14702, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(10210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10338, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10340, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14732, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10317, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(10410, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10538, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10540, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14712, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10517, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(10610, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10738, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10740, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14722, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10517, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(13210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13038, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13040, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14742, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13017, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(13310, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13140, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14762, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13117, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaCreateItem(10010, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10140, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14752, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaCreateItem(13310, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13140, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14772, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13117, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaCreateItem(13210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14538, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14540, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14792, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14517, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(13210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14638, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14640, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14782, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14517, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(14410, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10338, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10340, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14802, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(14410, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10338, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10340, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14812, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(11360, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10738, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10740, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14817, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(11210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(11338, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(11340, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14822, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(11210, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(11338, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(11340, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(14830, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(13410, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13538, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13540, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(550502, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(13710, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13838, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13840, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13903, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(13817, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Guardian then
    ToClient_qaCreateItem(690513, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10140, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(691503, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Hashashin then
    ToClient_qaCreateItem(692011, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(692514, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(692802, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Nova then
    ToClient_qaCreateItem(694326, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10138, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(694329, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Sage then
    ToClient_qaCreateItem(732260, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(10538, enchantLevelA + 15, 1)
    ToClient_qaCreateItem(732652, enchantLevelA + 15, 1)
  elseif isClassType == __eClassType_Corsair then
  end
end
function equipAutoWeaponMain(enchantLeve1)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  local WeaponItem1 = 1
  local WeaponItem2 = 1
  local WeaponItem3 = 1
  local WeaponItem4 = 1
  if isClassType == __eClassType_Warrior then
    WeaponItem1 = 10010
    WeaponItem2 = 10138
    WeaponItem3 = 14702
    WeaponItem4 = 10140
  elseif isClassType == __eClassType_ElfRanger then
    WeaponItem1 = 10210
    WeaponItem2 = 10338
    WeaponItem3 = 14732
    WeaponItem4 = 10317
  elseif isClassType == __eClassType_Sorcerer then
    WeaponItem1 = 10410
    WeaponItem2 = 10538
    WeaponItem3 = 14712
    WeaponItem4 = 10517
  elseif isClassType == __eClassType_Giant then
    WeaponItem1 = 10610
    WeaponItem2 = 10738
    WeaponItem3 = 14722
    WeaponItem4 = 10740
  elseif isClassType == __eClassType_Tamer then
    WeaponItem1 = 13210
    WeaponItem2 = 13038
    WeaponItem3 = 14742
    WeaponItem4 = 13017
  elseif isClassType == __eClassType_BladeMaster then
    WeaponItem1 = 13310
    WeaponItem2 = 13138
    WeaponItem3 = 14762
    WeaponItem4 = 13117
  elseif isClassType == __eClassType_Valkyrie then
    WeaponItem1 = 10010
    WeaponItem2 = 10138
    WeaponItem3 = 14752
    WeaponItem4 = 10140
  elseif isClassType == __eClassType_BladeMasterWoman then
    WeaponItem1 = 13310
    WeaponItem2 = 13138
    WeaponItem3 = 14772
    WeaponItem4 = 13117
  elseif isClassType == __eClassType_Kunoichi then
    WeaponItem1 = 13210
    WeaponItem2 = 14538
    WeaponItem3 = 14792
    WeaponItem4 = 14517
  elseif isClassType == __eClassType_NinjaMan then
    WeaponItem1 = 13210
    WeaponItem2 = 14638
    WeaponItem3 = 14782
    WeaponItem4 = 14517
  elseif isClassType == __eClassType_WizardWoman then
    WeaponItem1 = 14410
    WeaponItem2 = 10338
    WeaponItem3 = 14802
    WeaponItem4 = 10317
  elseif isClassType == __eClassType_WizardMan then
    WeaponItem1 = 14410
    WeaponItem2 = 10338
    WeaponItem3 = 14812
    WeaponItem4 = 10317
  elseif isClassType == __eClassType_DarkElf then
    WeaponItem1 = 11360
    WeaponItem2 = 10738
    WeaponItem3 = 14817
    WeaponItem4 = 10740
  elseif isClassType == __eClassType_Combattant then
    WeaponItem1 = 11210
    WeaponItem2 = 11338
    WeaponItem3 = 14822
    WeaponItem4 = 11340
  elseif isClassType == __eClassType_Mystic then
    WeaponItem1 = 11210
    WeaponItem2 = 11338
    WeaponItem3 = 14830
    WeaponItem4 = 11340
  elseif isClassType == __eClassType_Lhan then
    WeaponItem1 = 13410
    WeaponItem2 = 13538
    WeaponItem3 = 550502
    WeaponItem4 = 13540
  elseif isClassType == __eClassType_RangerMan then
    WeaponItem1 = 13710
    WeaponItem2 = 13838
    WeaponItem3 = 13903
    WeaponItem4 = 13817
  elseif isClassType == __eClassType_Guardian then
    WeaponItem1 = 690513
    WeaponItem2 = 10138
    WeaponItem3 = 691503
  elseif isClassType == __eClassType_Hashashin then
    WeaponItem1 = 692011
    WeaponItem2 = 692514
    WeaponItem3 = 692802
  elseif isClassType == __eClassType_Nova then
    WeaponItem1 = 694326
    WeaponItem2 = 10138
    WeaponItem3 = 694329
  elseif isClassType == __eClassType_Sage then
    WeaponItem1 = 732260
    WeaponItem2 = 10538
    WeaponItem3 = 732652
  elseif isClassType == __eClassType_Corsair then
  end
  equipAutoweaponSub(enchantLeve1, WeaponItem1, WeaponItem2, WeaponItem3, WeaponItem4)
end
function equipAutoAllItem(enchantLeve1)
  luaTimer_AddEvent(equipAutoWeaponMain, 1000, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoWeaponMain, 2000, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoWeaponMain, 3000, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoArmor, 700, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoArmor, 1700, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoArmor, 2700, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoArmor, 3700, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 1500, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 2500, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 3500, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 4500, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 5500, false, 0, enchantLeve1)
  luaTimer_AddEvent(equipAutoAcc, 6500, false, 0, enchantLeve1)
end
function equipAutoweaponSub(enchantLeve1, WeaponItem1, WeaponItem2, WeaponItem3, WeaponItem4)
  if enchantLeve1 == 1 or enchantLeve1 == 2 then
    ToClient_qaUseInventoryItem(WeaponItem1, 18)
  elseif enchantLeve1 == 3 or enchantLeve1 == 4 or enchantLeve1 == 11 or enchantLeve1 == 12 or enchantLeve1 == 21 or enchantLeve1 == 22 then
    ToClient_qaUseInventoryItem(WeaponItem1, 19)
  elseif enchantLeve1 == 5 or enchantLeve1 == 13 or enchantLeve1 == 23 then
    ToClient_qaUseInventoryItem(WeaponItem1, 20)
  else
    return
  end
  if enchantLeve1 == 1 or enchantLeve1 == 2 then
    ToClient_qaUseInventoryItem(WeaponItem2, 18)
  elseif enchantLeve1 == 3 or enchantLeve1 == 4 then
    ToClient_qaUseInventoryItem(WeaponItem2, 19)
  elseif enchantLeve1 == 5 then
    ToClient_qaUseInventoryItem(WeaponItem2, 20)
  else
    return
  end
  if enchantLeve1 == 1 or enchantLeve1 == 2 then
    ToClient_qaUseInventoryItem(WeaponItem3, 18)
  elseif enchantLeve1 == 3 or enchantLeve1 == 4 or enchantLeve1 == 11 or enchantLeve1 == 12 or enchantLeve1 == 21 or enchantLeve1 == 22 then
    ToClient_qaUseInventoryItem(WeaponItem3, 19)
  elseif enchantLeve1 == 5 or enchantLeve1 == 13 or enchantLeve1 == 23 then
    ToClient_qaUseInventoryItem(WeaponItem3, 20)
  else
    return
  end
  if enchantLeve1 == 11 or enchantLeve1 == 12 or enchantLeve1 == 21 or enchantLeve1 == 22 then
    ToClient_qaUseInventoryItem(WeaponItem4, 19)
  elseif enchantLeve1 == 13 or enchantLeve1 == 23 then
    ToClient_qaUseInventoryItem(WeaponItem4, 20)
  else
    return
  end
end
function createAutoArmor(enchantLevelA, enchantLeve1)
  ToClient_qaCreateItem(11101, enchantLevelA + 15, 1)
  ToClient_qaCreateItem(11015, enchantLevelA + 15, 1)
  ToClient_qaCreateItem(11103, enchantLevelA + 15, 1)
  ToClient_qaCreateItem(11017, enchantLevelA + 15, 1)
  ToClient_qaCreateItem(10985, enchantLevelA + 15, 1)
  ToClient_qaCreateItem(10987, enchantLevelA + 15, 1)
end
function equipAutoArmor(enchantLeve1)
  if enchantLeve1 == 1 or enchantLeve1 == 2 then
    ToClient_qaUseInventoryItem(11101, 18)
    ToClient_qaUseInventoryItem(11015, 18)
    ToClient_qaUseInventoryItem(11103, 18)
    ToClient_qaUseInventoryItem(11017, 18)
  elseif enchantLeve1 == 3 then
    ToClient_qaUseInventoryItem(11101, 19)
    ToClient_qaUseInventoryItem(11015, 19)
    ToClient_qaUseInventoryItem(11103, 19)
    ToClient_qaUseInventoryItem(11017, 19)
  elseif enchantLeve1 == 4 or enchantLeve1 == 5 then
    ToClient_qaUseInventoryItem(11101, 20)
    ToClient_qaUseInventoryItem(11015, 20)
    ToClient_qaUseInventoryItem(11103, 20)
    ToClient_qaUseInventoryItem(11017, 20)
  elseif enchantLeve1 == 11 or enchantLeve1 == 21 then
    ToClient_qaUseInventoryItem(11101, 19)
    ToClient_qaUseInventoryItem(11015, 19)
    ToClient_qaUseInventoryItem(11103, 19)
    ToClient_qaUseInventoryItem(11017, 19)
  elseif enchantLeve1 == 12 or enchantLeve1 == 13 or enchantLeve1 == 22 or enchantLeve1 == 23 then
    ToClient_qaUseInventoryItem(11101, 20)
    ToClient_qaUseInventoryItem(11015, 20)
    ToClient_qaUseInventoryItem(11103, 20)
    ToClient_qaUseInventoryItem(11017, 20)
  else
    return
  end
end
function createAutoAcc(enchantLevelA)
  ToClient_qaCreateItem(12230, enchantLevelA, 1)
  ToClient_qaCreateItem(12229, enchantLevelA, 1)
  ToClient_qaCreateItem(12251, enchantLevelA, 1)
  ToClient_qaCreateItem(12237, enchantLevelA, 1)
  ToClient_qaCreateItem(12031, enchantLevelA, 2)
  ToClient_qaCreateItem(12007, enchantLevelA, 2)
  ToClient_qaCreateItem(12061, enchantLevelA, 2)
  ToClient_qaCreateItem(12032, enchantLevelA, 2)
  ToClient_qaCreateItem(11828, enchantLevelA, 2)
  ToClient_qaCreateItem(11926, enchantLevelA, 2)
  ToClient_qaCreateItem(11808, enchantLevelA, 2)
  ToClient_qaCreateItem(11814, enchantLevelA, 2)
  ToClient_qaCreateItem(11607, enchantLevelA, 1)
  ToClient_qaCreateItem(11625, enchantLevelA, 1)
  ToClient_qaCreateItem(11611, enchantLevelA, 1)
end
function equipAutoAcc(enchantLeve1)
  if enchantLeve1 == 1 then
    ToClient_qaUseInventoryItem(11808, 3)
    ToClient_qaUseInventoryItem(12007, 3)
    ToClient_qaUseInventoryItem(11607, 1)
    ToClient_qaUseInventoryItem(12230, 1)
  elseif enchantLeve1 == 2 then
    ToClient_qaUseInventoryItem(11808, 3)
    ToClient_qaUseInventoryItem(12031, 3)
    ToClient_qaUseInventoryItem(11607, 3)
    ToClient_qaUseInventoryItem(12230, 3)
  elseif enchantLeve1 == 3 then
    ToClient_qaUseInventoryItem(11828, 3)
    ToClient_qaUseInventoryItem(12031, 3)
    ToClient_qaUseInventoryItem(11607, 3)
    ToClient_qaUseInventoryItem(12230, 3)
  elseif enchantLeve1 == 4 then
    ToClient_qaUseInventoryItem(11828, 4)
    ToClient_qaUseInventoryItem(12031, 4)
    ToClient_qaUseInventoryItem(11607, 4)
    ToClient_qaUseInventoryItem(12230, 4)
  elseif enchantLeve1 == 5 then
    ToClient_qaUseInventoryItem(11828, 5)
    ToClient_qaUseInventoryItem(12061, 4)
    ToClient_qaUseInventoryItem(11607, 5)
    ToClient_qaUseInventoryItem(12251, 4)
  elseif enchantLeve1 == 11 then
    ToClient_qaUseInventoryItem(11814, 4)
    ToClient_qaUseInventoryItem(12031, 3)
    ToClient_qaUseInventoryItem(11625, 4)
    ToClient_qaUseInventoryItem(12251, 3)
  elseif enchantLeve1 == 12 then
    ToClient_qaUseInventoryItem(11828, 4)
    ToClient_qaUseInventoryItem(12031, 4)
    ToClient_qaUseInventoryItem(11607, 4)
    ToClient_qaUseInventoryItem(12251, 4)
  elseif enchantLeve1 == 13 then
    ToClient_qaUseInventoryItem(11814, 5)
    ToClient_qaUseInventoryItem(12061, 4)
    ToClient_qaUseInventoryItem(11607, 5)
    ToClient_qaUseInventoryItem(12251, 4)
  elseif enchantLeve1 == 21 then
    ToClient_qaUseInventoryItem(11926, 3)
    ToClient_qaUseInventoryItem(12032, 3)
    ToClient_qaUseInventoryItem(11611, 4)
    ToClient_qaUseInventoryItem(12229, 4)
  elseif enchantLeve1 == 22 then
    ToClient_qaUseInventoryItem(11926, 4)
    ToClient_qaUseInventoryItem(12032, 4)
    ToClient_qaUseInventoryItem(11611, 5)
    ToClient_qaUseInventoryItem(12229, 4)
  elseif enchantLeve1 == 23 then
    ToClient_qaUseInventoryItem(11926, 5)
    ToClient_qaUseInventoryItem(12032, 4)
    ToClient_qaUseInventoryItem(11611, 5)
    ToClient_qaUseInventoryItem(12229, 5)
  else
    return
  end
end
function createAllitem()
  for createcount = 1, 5 do
    luaTimer_AddEvent(createAutoArmor, 1000 * createcount, false, 0, createcount)
    luaTimer_AddEvent(createAutoAcc, 1000 * createcount, false, 0, createcount)
    luaTimer_AddEvent(createAutoWeapon, 1000 * createcount, false, 0, createcount)
  end
end
function createAutofullset()
  ToClient_qaClearInventory()
  LearnSkill()
  createAutostate()
  createAllitem()
end
function createAutostate()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(285, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(142, 0, 1)
    ToClient_qaCreateItem(143, 0, 2)
    ToClient_qaCreateItem(144, 0, 3)
    ToClient_qaCreateItem(191, 0, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(293, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(151, 0, 1)
    ToClient_qaCreateItem(152, 0, 1)
    ToClient_qaCreateItem(153, 0, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(287, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(145, 0, 1)
    ToClient_qaCreateItem(146, 0, 1)
    ToClient_qaCreateItem(147, 0, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(290, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(148, 0, 1)
    ToClient_qaCreateItem(149, 0, 1)
    ToClient_qaCreateItem(150, 0, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(296, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(154, 0, 1)
    ToClient_qaCreateItem(155, 0, 1)
    ToClient_qaCreateItem(156, 0, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(319, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(160, 0, 1)
    ToClient_qaCreateItem(161, 0, 1)
    ToClient_qaCreateItem(162, 0, 1)
  elseif isClassType == __eClassType_Valkyrie then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(298, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(157, 0, 1)
    ToClient_qaCreateItem(158, 0, 1)
    ToClient_qaCreateItem(159, 0, 1)
  elseif isClassType == __eClassType_BladeMasterWoman then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(321, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(163, 0, 1)
    ToClient_qaCreateItem(164, 0, 1)
    ToClient_qaCreateItem(165, 0, 1)
  elseif isClassType == __eClassType_Kunoichi then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(327, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(169, 0, 1)
    ToClient_qaCreateItem(170, 0, 1)
    ToClient_qaCreateItem(171, 0, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(325, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(166, 0, 1)
    ToClient_qaCreateItem(167, 0, 1)
    ToClient_qaCreateItem(168, 0, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(334, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(172, 0, 1)
    ToClient_qaCreateItem(173, 0, 1)
    ToClient_qaCreateItem(174, 0, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(336, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(175, 0, 1)
    ToClient_qaCreateItem(176, 0, 1)
    ToClient_qaCreateItem(177, 0, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(338, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(178, 0, 1)
    ToClient_qaCreateItem(179, 0, 1)
    ToClient_qaCreateItem(180, 0, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(342, 7)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(181, 0, 1)
    ToClient_qaCreateItem(182, 0, 1)
    ToClient_qaCreateItem(183, 0, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(343, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(184, 0, 1)
    ToClient_qaCreateItem(185, 0, 1)
    ToClient_qaCreateItem(186, 0, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(345, 5)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(187, 0, 1)
    ToClient_qaCreateItem(188, 0, 1)
    ToClient_qaCreateItem(189, 0, 1)
  elseif isClassType == __eClassType_Hashashin then
  elseif isClassType == __eClassType_Nova then
  elseif isClassType == __eClassType_Sage then
  elseif isClassType == __eClassType_Corsair then
  end
  ToClient_qaCreateItem(65487, 0, 3)
  ToClient_qaCreateItem(65489, 0, 1)
  ToClient_qaCreateItem(65490, 0, 1)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65491, 0, 1)
  ToClient_qaCreateItem(9693, 0, 100)
  ToClient_qaCreateItem(9635, 0, 100)
  ToClient_qaCreateItem(9464, 0, 100)
  ToClient_qaCreateItem(9609, 0, 100)
  ToClient_qaCreateItem(9603, 0, 100)
  ToClient_qaCreateItem(9634, 0, 100)
  ToClient_qaCreateItem(791, 0, 100)
  ToClient_qaCreateItem(792, 0, 100)
  ToClient_qaCreateItem(793, 0, 100)
  ToClient_qaCreateItem(794, 0, 100)
  ToClient_qaCreateItem(795, 0, 100)
end
function UnEquipAll()
  for ii = CppEnums.EquipSlotNo.equipSlotNoCount - 1, 0, -1 do
    UnEquipItemForQA(ii)
  end
end
function UnEquipAllQATEST()
  UnEquipAll()
  UnEquipAll()
  luaTimer_AddEvent(UnEquipAll, 1500, false, 0)
  luaTimer_AddEvent(UnEquipAll, 2000, false, 0)
end
local MyEquiplist = 1
local TargetEquiplist = 1
function QaAutoDamageTest(ST)
  if ST == 1 then
    if MyEquiplist > 3 then
      return
    end
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    chatting_sendMessage("", "ë‚´ì¥ë¹„ :" .. tostring(MyEquiplist) .. " / ìƒëŒ€ì¥ë¹„ : " .. tostring(TargetEquiplist) .. "", CppEnums.ChatType.Private)
    QASupportDamageWriter2:write("ë‚´ì¥ë¹„ : " .. tostring(MyEquiplist) .. "\n")
    QASupportDamageWriter2:write("ìƒëŒ€ì¥ë¹„ : " .. tostring(TargetEquiplist) .. "\n")
    luaTimer_AddEvent(ToClient_qaDebugDamage, 1000, false, 0, 0, MyEquiplist, TargetEquiplist)
    luaTimer_AddEvent(QASupportDamagetest, 11000, false, 0, ST)
    luaTimer_AddEvent(QaAutoDamageTest2, 14000, false, 0, ST)
    if TargetEquiplist > 10 then
      MyEquiplist = MyEquiplist + 1
      TargetEquiplist = 0
    end
    TargetEquiplist = TargetEquiplist + 1
  else
    return
  end
end
function QaAutoDamageTest2(ST)
  if ST == 1 then
    if MyEquiplist > 3 then
      return
    end
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    QASupportDamageWriter2:write("------------------------------------------------------------------------------------" .. "\n")
    chatting_sendMessage("", "ë‚´ì¥ë¹„ :" .. tostring(MyEquiplist) .. " / ìƒëŒ€ì¥ë¹„ : " .. tostring(TargetEquiplist) .. "", CppEnums.ChatType.Private)
    QASupportDamageWriter2:write("ë‚´ì¥ë¹„ : " .. tostring(MyEquiplist) .. "\n")
    QASupportDamageWriter2:write("ìƒëŒ€ì¥ë¹„ : " .. tostring(TargetEquiplist) .. "\n")
    luaTimer_AddEvent(ToClient_qaDebugDamage, 1000, false, 0, 0, MyEquiplist, TargetEquiplist)
    luaTimer_AddEvent(QASupportDamagetest, 11000, false, 0, ST)
    luaTimer_AddEvent(QaAutoDamageTest, 14000, false, 0, ST)
    if TargetEquiplist > 10 then
      MyEquiplist = MyEquiplist + 1
      TargetEquiplist = 0
    end
    TargetEquiplist = TargetEquiplist + 1
  else
    return
  end
end
function QAXboxSet(Armtype)
  QAXboxbaseItem1()
  QAXboxbaseItem2()
  if Armtype == 1 then
    QAXboxset1()
  elseif Armtype == 2 then
    QAXboxset2()
  elseif Armtype == 3 then
    QAXboxset3()
  else
    return
  end
end
function QAXboxbaseItem1()
  ToClient_qaLevelUp(50)
  ToClient_qaCreateItem(60, 0, 200)
  ToClient_qaCreateItem(65487, 0, 3)
  ToClient_qaCreateItem(65489, 0, 1)
  ToClient_qaCreateItem(65490, 0, 1)
  ToClient_qaCreateItem(65488, 0, 2)
  ToClient_qaCreateItem(65491, 0, 1)
  ToClient_qaCreateItem(1, 0, 1000000)
  luaTimer_AddEvent(LearnSkill, 1000, false, 0)
end
function QAXboxbaseItem2()
  ToClient_qaCreateItem(44906, 0, 1)
  ToClient_qaCreateItem(44937, 0, 1)
  ToClient_qaCreateItem(10993, 0, 1)
  ToClient_qaCreateItem(10994, 0, 1)
  ToClient_qaCreateItem(10995, 0, 1)
  ToClient_qaCreateItem(10996, 0, 1)
  ToClient_qaCreateItem(11645, 0, 1)
  ToClient_qaCreateItem(11843, 0, 2)
  ToClient_qaCreateItem(12049, 0, 2)
  ToClient_qaCreateItem(12242, 0, 1)
end
function QAXboxset1()
  ToClient_qaCreateItem(17569, 0, 1000)
  ToClient_qaCreateItem(17571, 0, 1000)
  ToClient_qaCreateItem(593, 0, 1000)
  ToClient_qaCreateItem(17974, 0, 1)
  ToClient_qaCreateItem(54018, 0, 300)
  ToClient_qaCreateItem(41557, 0, 500)
  ToClient_qaCreateItem(17566, 0, 500)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(21021, 0, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(21050, 0, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(21062, 0, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(21081, 0, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(21205, 0, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(21185, 0, 1)
  end
  luaTimer_AddEvent(TeleportHexe, 20000, false, 0)
end
function QAXboxset2()
  ToClient_qaCreateItem(58001, 0, 10)
  ToClient_qaCreateItem(6701, 0, 5)
  ToClient_qaCreateItem(6702, 0, 5)
  ToClient_qaCreateItem(6703, 0, 5)
  ToClient_qaCreateItem(6704, 0, 5)
  ToClient_qaCreateItem(6705, 0, 5)
  ToClient_qaCreateItem(6706, 0, 5)
  ToClient_qaCreateItem(6707, 0, 5)
  ToClient_qaCreateItem(6801, 0, 5)
  ToClient_qaCreateItem(6802, 0, 5)
  ToClient_qaCreateItem(6803, 0, 5)
  ToClient_qaCreateItem(6804, 0, 5)
  ToClient_qaCreateItem(6805, 0, 5)
  ToClient_qaCreateItem(6806, 0, 5)
  ToClient_qaCreateItem(6807, 0, 5)
  ToClient_qaCreateItem(6808, 0, 5)
  ToClient_qaCreateItem(6809, 0, 5)
  ToClient_qaCreateItem(16910, 0, 5)
  ToClient_qaCreateItem(16911, 0, 5)
  luaTimer_AddEvent(TeleportBelia2, 20000, false, 0)
  ToClient_qaCreateItem(590, 0, 20)
end
function QAXboxset3()
  ToClient_qaCreateItem(368, 0, 2)
  ToClient_qaCreateItem(16141, 0, 3)
  ToClient_qaCreateItem(16153, 0, 3)
  ToClient_qaCreateItem(16167, 0, 1)
  ToClient_qaCreateItem(16168, 0, 1)
  ToClient_qaCreateItem(16169, 0, 1)
  ToClient_qaCreateItem(16170, 0, 1)
  ToClient_qaCreateItem(12831, 0, 3)
  ToClient_qaCreateItem(65424, 0, 100)
  luaTimer_AddEvent(TeleportBelia1, 20000, false, 0)
  ToClient_qaCreateItem(44940, 0, 1)
end
function TeleportBelia1()
  ToClient_qaTeleport(7469, -7815, 83716)
end
function TeleportBelia2()
  ToClient_qaTeleport(24271, -6276, 73371)
end
function TeleportHexe()
  ToClient_qaTeleport(-263232, 5841, -230563)
end
function NationSiegeWorldMapLimitCount(count)
  ToClient_DeadPlayerQueueLimitCount(count)
end
function QACallMonsterRideVehicle()
  servant_callGuildMonsterRideVehicle()
end
function AutoKillLoot(monsterkey, quantity, number)
  if number > 50 then
    Proc_ShowMessage_Ack("ë°˜ë³µíšŸìˆ˜ê°€ ë„ˆë¬´ ë†’ê²Œ ì„¤ì •ë˜ì—ˆìŠµë‹ˆë‹¤.")
    return
  end
  for i = 0, number - 1 do
    luaTimer_AddEvent(ToClient_qaCreateMonster, 2500 * i, false, 0, monsterkey, quantity)
    luaTimer_AddEvent(pa_sendMessage, 2500 * i + 500, false, 0, "/killnearallmonster")
    luaTimer_AddEvent(pa_sendMessage, 2500 * i + 2000, false, 0, "/lootnearall")
  end
  luaTimer_AddEvent(Proc_ShowMessage_Ack, 2500 * number + 10000, false, 0, tostring(monsterkey) .. " ëª¬ìŠ¤í„°ê°€ " .. tostring(quantity) .. "ë§ˆë¦¬ ì”© " .. tostring(number) .. "íšŒì— ê±¸ì³ ë£¨íŒ…ë˜ì—ˆìŠµë‹ˆë‹¤.")
end
function chatUpdateTickCount()
  chatting_sendMessage("", "/MarketCommand UpdateTickCount", CppEnums.ChatType.Private)
end
function AutoUpdateMarket(count)
  if count == nil then
    Proc_ShowMessage_Ack("ì‹¤í–‰íšŸìˆ˜ ì…ë ¥ë˜ì§€ ì•ŠìŒ")
    return
  else
    for ii = 0, count - 1 do
      luaTimer_AddEvent(chatUpdateTickCount, 30000 * ii, false, 0)
      luaTimer_AddEvent(chatting_sendMessage, 30000 * ii + 200, false, 0, "", tostring(ii + 1) .. "ë²ˆ ì…ë ¥ë¨", CppEnums.ChatType.Private)
      if ii == count - 1 then
        luaTimer_AddEvent(Proc_ShowMessage_Ack, 30000 * ii + 1000, false, 0, "ê±°ë˜ì†Œ ì‹œì„¸ê°€ ë³€ë™ë˜ì—ˆìŠµë‹ˆë‹¤.")
      end
    end
  end
end
function camXY()
  setFov(40)
  local float2 = characterCameraAdditionalTranslation()
  local float = characterCameraDistanceFromCharacter()
  _PA_LOG("Camera_Location", tostring(float2.x) .. ", " .. tostring(float2.y))
  _PA_LOG("Camera_Location", tostring(float))
  chatting_sendMessage("", "x = " .. tostring(float2.x) .. " , y = " .. tostring(float2.y), CppEnums.ChatType.System)
  chatting_sendMessage("", "wheel = " .. tostring(float), CppEnums.ChatType.System)
end
function rec(awaken)
  setFov(40)
  setTextureQuality(0)
  setGraphicOption(9)
  setTessellation(true)
  setRepresentative(true)
  setAutoOptimization(false)
  setPresentLock(false)
  setRenderHitEffect(false)
  setUseOptimizationEffectFrame(false)
  setUsePlayerOptimizationEffectFrame(false)
  setScreenMode(2)
  setScreenResolution(3840, 2160)
  setLensBlood(false)
  setCameraLUTFilter(1)
  setGammaValue(0,5)
  setContrastValue(0,5)
  setEnableSoundMusic(false)
  setEnableSoundFx(true)
  setEnableSoundEnv(false)
  setEnableSoundWhisper(false)
  setEnableSoundTray(false)
  setIsOnScreenSaver(false)
  if true == _ContentsGroup_NewUI_GameOption_All then
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.NormalTrade, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.RoyalTrade, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.OtherPlayerGetItem, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.LifeLevelUp, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.EnchantSuccess, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.EnchantFail, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.ItemMarket, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.OtherMarket, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.ChangeRegion, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.FitnessLevelUp, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.TerritoryWar, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.GuildWar, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.GuildQuestMessage, true)
    ToClient_SetMessageFilter(PaGlobal_GameOption_All.ALERT.NearMonster, true)
  else
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.NormalTrade, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.RoyalTrade, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.OtherPlayerGetItem, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.LifeLevelUp, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.EnchantSuccess, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.EnchantFail, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.ItemMarket, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.OtherMarket, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.ChangeRegion, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.FitnessLevelUp, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.TerritoryWar, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.GuildWar, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.GuildQuestMessage, true)
    ToClient_SetMessageFilter(PaGlobal_Option.ALERT.NearMonster, true)
  end
  local selfPlayer = getSelfPlayer()
  local x, y, wheel, distance
  if nil == selfPlayer then
    return
  end
  if awaken == 0 or awaken == nil then
    local isClassType = selfPlayer:getClassType()
    if isClassType == __eClassType_Warrior then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,3)
      setMotionBlurPower(0,1)
      setCameraTranslatePower(0,3)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_ElfRanger then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,75)
      setCameraShakePower(0,7)
      setMotionBlurPower(0,1)
      setCameraTranslatePower(0,2)
      setCameraFovPower(0,3)
    elseif isClassType == __eClassType_Sorcerer then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,65)
      setCameraShakePower(0,3)
      setMotionBlurPower(0,65)
      setCameraTranslatePower(0,5)
      setCameraFovPower(0,2)
    elseif isClassType == __eClassType_Giant then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,75)
      setCameraShakePower(0,5)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_Tamer then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,73)
      setCameraShakePower(0,41)
      setMotionBlurPower(0,25)
      setCameraTranslatePower(0,2)
      setCameraFovPower(0,25)
    elseif isClassType == __eClassType_BladeMaster then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,65)
      setCameraShakePower(0,35)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,7)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_Valkyrie then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,3)
      setMotionBlurPower(0,1)
      setCameraTranslatePower(0,3)
      setCameraFovPower(0,45)
    elseif isClassType == __eClassType_BladeMasterWoman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,8)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,3)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_Kunoichi then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,45)
      setMotionBlurPower(0,25)
      setCameraTranslatePower(0,5)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_NinjaMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,72)
      setCameraShakePower(0,34)
      setMotionBlurPower(0,25)
      setCameraTranslatePower(0,2)
      setCameraFovPower(0,25)
    elseif isClassType == __eClassType_WizardWoman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_WizardMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_DarkElf then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_Combattant then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Mystic then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,6)
      setMotionBlurPower(0,1)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_Lhan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,65)
      setCameraShakePower(0,3)
      setMotionBlurPower(0,55)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,35)
    elseif isClassType == __eClassType_RangerMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_ShyWaman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Guardian then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,6)
    elseif isClassType == __eClassType_Hashashin then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,6)
    elseif isClassType == __eClassType_Nova then
    elseif isClassType == __eClassType_Sage then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,75)
      setCameraShakePower(0,57)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,3)
    elseif isClassType == __eClassType_Corsair then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,55)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,5)
    end
  elseif awaken == 1 then
    local isClassType = selfPlayer:getClassType()
    if isClassType == __eClassType_Warrior then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_ElfRanger then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Sorcerer then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Giant then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Tamer then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,73)
      setCameraShakePower(0,41)
      setMotionBlurPower(0,25)
      setCameraTranslatePower(0,2)
      setCameraFovPower(0,25)
    elseif isClassType == __eClassType_BladeMaster then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Valkyrie then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_BladeMasterWoman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,8)
      setCameraShakePower(0,35)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,55)
    elseif isClassType == __eClassType_Kunoichi then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,45)
      setMotionBlurPower(0,25)
      setCameraTranslatePower(0,5)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_NinjaMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,75)
      setCameraShakePower(0,3)
      setMotionBlurPower(0,2)
      setCameraTranslatePower(0,2)
      setCameraFovPower(0,2)
    elseif isClassType == __eClassType_WizardWoman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_WizardMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_DarkElf then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Combattant then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,85)
      setCameraShakePower(0,65)
      setMotionBlurPower(0,35)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_Mystic then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,8)
      setCameraShakePower(0,65)
      setMotionBlurPower(0,15)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,4)
    elseif isClassType == __eClassType_Lhan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_RangerMan then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_ShyWaman then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
    elseif isClassType == __eClassType_Guardian then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,6)
    elseif isClassType == __eClassType_Hashashin then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,6)
    elseif isClassType == __eClassType_Nova then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,4)
      setMotionBlurPower(0,5)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,6)
    elseif isClassType == __eClassType_Sage then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,75)
      setCameraShakePower(0,57)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,4)
      setCameraFovPower(0,3)
    elseif isClassType == __eClassType_Corsair then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,55)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_Drakania then
      x = 58,413
      y = -8,04
      wheel = 640
      distance = 800
      setCameraMasterPower(0,7)
      setCameraShakePower(0,55)
      setMotionBlurPower(0,4)
      setCameraTranslatePower(0,6)
      setCameraFovPower(0,5)
    elseif isClassType == __eClassType_Giant_Reserved0 then
    elseif isClassType == __eClassType_Giant_Reserved2 then
    elseif isClassType == __eClassType_KunoichiOld then
    end
  else
    Proc_ShowMessage_Ack("ë¹„ê°ì„± : 0, ê°ì„± : 1")
    return
  end
  characterCameraSetPosAndWheel(float2(x, y), wheel, distance)
end
function UnEquipItemForQA(slotNo)
  local itemWrapper = ToClient_getEquipmentItem(slotNo)
  if nil ~= itemWrapper then
    equipmentDoUnequip(slotNo)
  end
end
function UnEquipAllGstar()
  for ii = 13, 0, -1 do
    UnEquipItemForQA(ii)
  end
  UnEquipItemForQA(29)
end
function createPotionGstar()
  ToClient_qaCreateItem(524, 0, 300)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(594, 0, 100)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(526, 0, 100)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(526, 0, 100)
  end
  ToClient_qaCreateItem(17567, 0, 500)
  ToClient_qaCreateItem(721012, 0, 100)
  ToClient_qaCreateItem(18409, 0, 500)
end
function setps(delay)
  local delaySec
  if delay == nil then
    delaySec = 0
  else
    delaySec = delay * 1000
  end
  ToClient_qaLevelUp(61)
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "UnEquipAllGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "UnEquipAllGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "ToClient_qaClearInventory()")
  ToClient_qaRegisterTimerForQA(5000 + delaySec, "createPSGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "equipAllItemsPSGstar(17)")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "equipAccessoryPSGstar(18)")
  ToClient_qaRegisterTimerForQA(10000 + delaySec, "telps()")
end
function telps()
  ToClient_qaLevelUp(60)
  ToClient_qaTeleport(473829,3125, -427,214874, 133719,609375)
end
function createPSGstar()
  ToClient_qaCreateItem(44980, 0, 1)
  ToClient_qaCreateItem(41593, 0, 500)
  createPotionGstar()
  chatting_sendMessage("", "/mentalup 400", CppEnums.ChatType.Public)
  ToClient_qaCreateItem(11013, 17, 1)
  ToClient_qaCreateItem(11014, 17, 1)
  ToClient_qaCreateItem(11015, 17, 1)
  ToClient_qaCreateItem(11016, 17, 1)
  ToClient_qaCreateItem(12032, 3, 2)
  ToClient_qaCreateItem(11814, 3, 2)
  ToClient_qaCreateItem(11625, 3, 1)
  ToClient_qaCreateItem(12229, 3, 1)
  createBossWeaponPSGstar(17)
end
function createBossWeaponPSGstar(enchantLevelA)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(10010, enchantLevelA, 1)
    ToClient_qaCreateItem(10140, enchantLevelA, 1)
    ToClient_qaCreateItem(14701, enchantLevelA, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(10210, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14731, enchantLevelA, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(10410, enchantLevelA, 1)
    ToClient_qaCreateItem(10540, enchantLevelA, 1)
    ToClient_qaCreateItem(14711, enchantLevelA, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(10610, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(14721, enchantLevelA, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(13310, enchantLevelA, 1)
    ToClient_qaCreateItem(13140, enchantLevelA, 1)
    ToClient_qaCreateItem(14761, enchantLevelA, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(14640, enchantLevelA, 1)
    ToClient_qaCreateItem(14781, enchantLevelA, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14801, enchantLevelA, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14811, enchantLevelA, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(11360, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(14816, enchantLevelA, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(13410, enchantLevelA, 1)
    ToClient_qaCreateItem(13540, enchantLevelA, 1)
    ToClient_qaCreateItem(550501, enchantLevelA, 1)
  end
end
function equipAllItemsPSGstar(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaUseInventoryItem(10010, enchantLevel)
    ToClient_qaUseInventoryItem(10140, enchantLevel)
    ToClient_qaUseInventoryItem(14701, enchantLevel)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaUseInventoryItem(10210, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14731, enchantLevel)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaUseInventoryItem(10410, enchantLevel)
    ToClient_qaUseInventoryItem(10540, enchantLevel)
    ToClient_qaUseInventoryItem(14711, enchantLevel)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaUseInventoryItem(10610, enchantLevel)
    ToClient_qaUseInventoryItem(10740, enchantLevel)
    ToClient_qaUseInventoryItem(14721, enchantLevel)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaUseInventoryItem(13310, enchantLevel)
    ToClient_qaUseInventoryItem(13140, enchantLevel)
    ToClient_qaUseInventoryItem(14761, enchantLevel)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(14640, enchantLevel)
    ToClient_qaUseInventoryItem(14781, enchantLevel)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14801, enchantLevel)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14811, enchantLevel)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaUseInventoryItem(11360, enchantLevel)
    ToClient_qaUseInventoryItem(10740, enchantLevel)
    ToClient_qaUseInventoryItem(14816, enchantLevel)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaUseInventoryItem(13410, enchantLevel)
    ToClient_qaUseInventoryItem(13540, enchantLevel)
    ToClient_qaUseInventoryItem(550501, enchantLevel)
  end
  ToClient_qaUseInventoryItem(11013, enchantLevel)
  ToClient_qaUseInventoryItem(11014, enchantLevel)
  ToClient_qaUseInventoryItem(11015, enchantLevel)
  ToClient_qaUseInventoryItem(11016, enchantLevel)
end
function equipAccessoryPSGstar(enchantLevel)
  if enchantLevel < 15 then
    enchantLevel = 15
  end
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1000, false, 0, 11814, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1200, false, 0, 12032, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1400, false, 0, 12229, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1600, false, 0, 11625, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1800, false, 0, 11814, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2000, false, 0, 12032, enchantLevel - 15)
end
function setxb(delay)
  local delaySec
  if delay == nil then
    delaySec = 0
  else
    delaySec = delay * 1000
  end
  ToClient_qaLevelUp(61)
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "UnEquipAllGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "UnEquipAllGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "ToClient_qaClearInventory()")
  ToClient_qaRegisterTimerForQA(5000 + delaySec, "createXboxGstar()")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "equipAllItemsXboxGstar(19)")
  ToClient_qaRegisterTimerForQA(1000 + delaySec, "equipAccessoryXboxGstar(19)")
  ToClient_qaRegisterTimerForQA(10000 + delaySec, "telxb()")
end
function telxb()
  ToClient_qaLevelUp(60)
  ToClient_qaTeleport(-385898,46875, 9576,633789, -357725,1875)
end
function createXboxGstar()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(580001, 0, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(26033, 0, 1)
  else
    ToClient_qaCreateItem(44980, 0, 1)
  end
  ToClient_qaCreateItem(41614, 0, 500)
  createPotionGstar()
  chatting_sendMessage("", "/mentalup 400", CppEnums.ChatType.Public)
  ToClient_qaCreateItem(11013, 19, 1)
  ToClient_qaCreateItem(11014, 19, 1)
  ToClient_qaCreateItem(11015, 19, 1)
  ToClient_qaCreateItem(11016, 19, 1)
  ToClient_qaCreateItem(12042, 4, 2)
  ToClient_qaCreateItem(11834, 4, 2)
  ToClient_qaCreateItem(11607, 4, 1)
  ToClient_qaCreateItem(12230, 4, 1)
  createBossWeaponXboxGstar(19)
end
function createBossWeaponXboxGstar(enchantLevelA)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaCreateItem(10010, enchantLevelA, 1)
    ToClient_qaCreateItem(10140, enchantLevelA, 1)
    ToClient_qaCreateItem(14702, enchantLevelA, 1)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaCreateItem(10210, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14732, enchantLevelA, 1)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaCreateItem(10410, enchantLevelA, 1)
    ToClient_qaCreateItem(10540, enchantLevelA, 1)
    ToClient_qaCreateItem(14712, enchantLevelA, 1)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaCreateItem(10610, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(14722, enchantLevelA, 1)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(13040, enchantLevelA, 1)
    ToClient_qaCreateItem(14742, enchantLevelA, 1)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaCreateItem(13310, enchantLevelA, 1)
    ToClient_qaCreateItem(13140, enchantLevelA, 1)
    ToClient_qaCreateItem(14762, enchantLevelA, 1)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaCreateItem(13210, enchantLevelA, 1)
    ToClient_qaCreateItem(14640, enchantLevelA, 1)
    ToClient_qaCreateItem(14782, enchantLevelA, 1)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14802, enchantLevelA, 1)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaCreateItem(14410, enchantLevelA, 1)
    ToClient_qaCreateItem(10340, enchantLevelA, 1)
    ToClient_qaCreateItem(14812, enchantLevelA, 1)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaCreateItem(11360, enchantLevelA, 1)
    ToClient_qaCreateItem(10740, enchantLevelA, 1)
    ToClient_qaCreateItem(14817, enchantLevelA, 1)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaCreateItem(11210, enchantLevelA, 1)
    ToClient_qaCreateItem(11340, enchantLevelA, 1)
    ToClient_qaCreateItem(14822, enchantLevelA, 1)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaCreateItem(11210, enchantLevelA, 1)
    ToClient_qaCreateItem(11340, enchantLevelA, 1)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaCreateItem(13410, enchantLevelA, 1)
    ToClient_qaCreateItem(13540, enchantLevelA, 1)
    ToClient_qaCreateItem(550502, enchantLevelA, 1)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaCreateItem(13710, enchantLevelA, 1)
    ToClient_qaCreateItem(13840, enchantLevelA, 1)
    ToClient_qaCreateItem(13903, enchantLevelA, 1)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaCreateItem(718510, enchantLevelA, 1)
    ToClient_qaCreateItem(719040, enchantLevelA, 1)
    ToClient_qaCreateItem(690004, enchantLevelA, 1)
  end
end
function equipAllItemsXboxGstar(enchantLevel)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  if isClassType == __eClassType_Warrior then
    ToClient_qaUseInventoryItem(10010, enchantLevel)
    ToClient_qaUseInventoryItem(10140, enchantLevel)
    ToClient_qaUseInventoryItem(14702, enchantLevel)
  elseif isClassType == __eClassType_ElfRanger then
    ToClient_qaUseInventoryItem(10210, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14732, enchantLevel)
  elseif isClassType == __eClassType_Sorcerer then
    ToClient_qaUseInventoryItem(10410, enchantLevel)
    ToClient_qaUseInventoryItem(10540, enchantLevel)
    ToClient_qaUseInventoryItem(14712, enchantLevel)
  elseif isClassType == __eClassType_Giant then
    ToClient_qaUseInventoryItem(10610, enchantLevel)
    ToClient_qaUseInventoryItem(10740, enchantLevel)
    ToClient_qaUseInventoryItem(14722, enchantLevel)
  elseif isClassType == __eClassType_Tamer then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(13040, enchantLevel)
    ToClient_qaUseInventoryItem(14742, enchantLevel)
  elseif isClassType == __eClassType_BladeMaster then
    ToClient_qaUseInventoryItem(13310, enchantLevel)
    ToClient_qaUseInventoryItem(13140, enchantLevel)
    ToClient_qaUseInventoryItem(14762, enchantLevel)
  elseif isClassType == __eClassType_NinjaMan then
    ToClient_qaUseInventoryItem(13210, enchantLevel)
    ToClient_qaUseInventoryItem(14640, enchantLevel)
    ToClient_qaUseInventoryItem(14782, enchantLevel)
  elseif isClassType == __eClassType_WizardWoman then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14802, enchantLevel)
  elseif isClassType == __eClassType_WizardMan then
    ToClient_qaUseInventoryItem(14410, enchantLevel)
    ToClient_qaUseInventoryItem(10340, enchantLevel)
    ToClient_qaUseInventoryItem(14812, enchantLevel)
  elseif isClassType == __eClassType_DarkElf then
    ToClient_qaUseInventoryItem(11360, enchantLevel)
    ToClient_qaUseInventoryItem(10740, enchantLevel)
    ToClient_qaUseInventoryItem(14817, enchantLevel)
  elseif isClassType == __eClassType_Combattant then
    ToClient_qaUseInventoryItem(11210, enchantLevel)
    ToClient_qaUseInventoryItem(11340, enchantLevel)
    ToClient_qaUseInventoryItem(14822, enchantLevel)
  elseif isClassType == __eClassType_Mystic then
    ToClient_qaUseInventoryItem(11210, enchantLevel)
    ToClient_qaUseInventoryItem(11340, enchantLevel)
    ToClient_qaUseInventoryItem(14830, enchantLevel)
  elseif isClassType == __eClassType_Lhan then
    ToClient_qaUseInventoryItem(13410, enchantLevel)
    ToClient_qaUseInventoryItem(13540, enchantLevel)
    ToClient_qaUseInventoryItem(550502, enchantLevel)
  elseif isClassType == __eClassType_RangerMan then
    ToClient_qaUseInventoryItem(13710, enchantLevel)
    ToClient_qaUseInventoryItem(13840, enchantLevel)
    ToClient_qaUseInventoryItem(13903, enchantLevel)
  elseif isClassType == __eClassType_ShyWaman then
    ToClient_qaUseInventoryItem(718510, enchantLevel)
    ToClient_qaUseInventoryItem(719040, enchantLevel)
    ToClient_qaUseInventoryItem(690004, enchantLevel)
  end
  ToClient_qaUseInventoryItem(11013, enchantLevel)
  ToClient_qaUseInventoryItem(11014, enchantLevel)
  ToClient_qaUseInventoryItem(11015, enchantLevel)
  ToClient_qaUseInventoryItem(11016, enchantLevel)
end
function equipAccessoryXboxGstar(enchantLevel)
  if enchantLevel < 15 then
    enchantLevel = 15
  end
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1000, false, 0, 11834, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1200, false, 0, 12042, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1400, false, 0, 12230, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1600, false, 0, 11607, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 1800, false, 0, 11834, enchantLevel - 15)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 2000, false, 0, 12042, enchantLevel - 15)
end
function intimacy(value)
  local interactableActor = interaction_getInteractable()
  local characterKey
  if interactableActor ~= nil then
    characterKeyRaw = interactableActor:getCharacterKeyRaw()
    ToClient_qaUpIntimacy(characterKeyRaw, value)
  else
    return
  end
end
registerEvent("FromClient_QADebugSkillName", "FromClient_QADebugSkillName")
registerEvent("FromClient_QACreateItemAndEquip", "PaGlobalFunc_QaCreateAndEquip")
registerEvent("FromClient_QADebugCountDamage", "FromClient_QADebugCountDamage")
registerEvent("FromClient_QADebugMinMaxDamage", "FromClient_QADebugMinMaxDamage")
function petControl_AllSeal_ForQA()
  local sealPetCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  local enableUnSealCount = 5 - unSealPetCount
  if 0 == sealPetCount then
    return
  end
  for petIndex = 0, enableUnSealCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(petIndex)
    local petNo_s64 = petData._petNo
    petListNew_UnSeal(tostring(petNo_s64), true)
  end
end
function petControl_ReverseAllSeal_ForQA()
  local sealPetCount = ToClient_getPetSealedList()
  local unSealPetCount = ToClient_getPetUnsealedList()
  local enableUnSealCount = 5 - unSealPetCount
  if 0 == sealPetCount then
    return
  end
  for petIndex = 0, enableUnSealCount - 1 do
    local petLastIndex = sealPetCount - 1 - petIndex
    local petData = ToClient_getPetSealedDataByIndex(petLastIndex)
    local petNo_s64 = petData._petNo
    petListNew_UnSeal(tostring(petNo_s64), true)
  end
end
PaGlobalQASupport = {
  _WarriorSkillList_0 = {
    2831,
    1142,
    1143,
    2839,
    1078,
    1079,
    2837,
    217,
    218,
    219,
    2851,
    1083,
    1084,
    1085,
    350,
    351,
    705,
    376,
    1139,
    1140,
    1141,
    2838,
    352,
    353,
    579,
    1127,
    1128,
    1129,
    313,
    590,
    2845,
    589,
    2846,
    385,
    1133,
    1134,
    1135,
    577,
    1441,
    1442,
    1443,
    1444,
    2850,
    1080,
    1081,
    1082,
    715,
    2841,
    712,
    1145,
    2842,
    1136,
    1137,
    709,
    1138,
    1148,
    2832,
    1330,
    1000,
    305,
    306,
    2844,
    198,
    1130,
    1131,
    1132,
    2835,
    994,
    995,
    173,
    174,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    4856,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _WarriorSkillList_1 = {
    4063,
    4127,
    4128,
    4124,
    4125,
    4126,
    4069,
    4064,
    4082,
    4083,
    4084,
    4065,
    4092,
    4093,
    4067,
    4089,
    4090,
    4091,
    4068,
    4080,
    4086,
    4087,
    4088,
    4066,
    4078,
    4079,
    4070,
    4077,
    4081,
    4071,
    4072,
    4073,
    4074,
    4075
  },
  _WarriorSkillList_2 = {
    2833,
    2847,
    2843,
    2834,
    2848,
    2836,
    2849,
    2852,
    2840,
    1733,
    1734,
    1735,
    1736,
    1737,
    4837,
    4838,
    4839,
    1766,
    1767,
    1768,
    1727,
    1728,
    1729,
    1759,
    1760,
    1761,
    1762,
    1738,
    1751,
    1752,
    1753,
    1754,
    1758,
    1748,
    6463,
    1730,
    1755
  },
  _ElfRangerSkillList_0 = {
    2853,
    1389,
    1390,
    323,
    324,
    2868,
    1113,
    1114,
    1115,
    318,
    1112,
    1253,
    374,
    2860,
    1116,
    1257,
    382,
    319,
    320,
    321,
    1428,
    1401,
    1091,
    1092,
    1093,
    1416,
    375,
    1102,
    1099,
    1100,
    1101,
    1125,
    1126,
    1448,
    1095,
    1096,
    1097,
    1098,
    2857,
    1103,
    1104,
    1105,
    1364,
    1365,
    1366,
    1367,
    1449,
    308,
    309,
    2867,
    1110,
    1254,
    1255,
    2861,
    1119,
    1250,
    1251,
    2864,
    1090,
    1088,
    2854,
    381,
    1369,
    1370,
    1371,
    1372,
    1373,
    1374,
    1375,
    1376,
    1377,
    1001,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _ElfRangerSkillList_1 = {
    4119,
    4191,
    4192,
    4193,
    4118,
    4116,
    4169,
    4186,
    4117,
    4121,
    4194,
    4195,
    4196,
    4115,
    4120,
    4187,
    4188,
    4122,
    4197,
    4198,
    4199,
    4123,
    4189,
    4190,
    4134,
    4114,
    4235,
    4236,
    4109,
    4110,
    4111,
    4112,
    4113,
    4108
  },
  _ElfRangerSkillList_2 = {
    2862,
    2863,
    2855,
    2856,
    2858,
    2865,
    2859,
    2866,
    6759,
    1884,
    1885,
    1893,
    1876,
    1877,
    1878,
    1857,
    1858,
    1859,
    1860,
    1861,
    1886,
    1887,
    1888,
    1879,
    1880,
    1881,
    1882,
    1896,
    1890,
    1891,
    1892,
    1897,
    6451,
    6757,
    6758,
    1889,
    1873
  },
  _SorcererSkillList_0 = {
    1413,
    2878,
    1196,
    1197,
    1198,
    581,
    2874,
    1430,
    1431,
    1432,
    2888,
    585,
    586,
    587,
    588,
    1360,
    1361,
    1362,
    162,
    2880,
    163,
    171,
    378,
    1417,
    1418,
    348,
    1202,
    1203,
    583,
    1204,
    1205,
    94,
    165,
    166,
    95,
    167,
    168,
    2883,
    1191,
    1192,
    1193,
    1194,
    2872,
    1188,
    1189,
    1190,
    1500,
    1199,
    1200,
    1185,
    1186,
    1187,
    2870,
    1195,
    93,
    1209,
    1415,
    347,
    2881,
    1201,
    1060,
    582,
    170,
    5706,
    1183,
    1184,
    5705,
    1357,
    1358,
    1210,
    160,
    161,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    4855,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _SorcererSkillList_1 = {
    4580,
    4581,
    4582,
    4592,
    4595,
    4602,
    4573,
    4574,
    4575,
    4576,
    4594,
    4583,
    4584,
    4585,
    4565,
    4566,
    4567,
    4568,
    4577,
    4578,
    4579,
    4569,
    4570,
    4571,
    4572,
    4564,
    4596,
    4597,
    4586,
    4587,
    4588,
    4589,
    4590,
    4591
  },
  _SorcererSkillList_2 = {
    2869,
    2885,
    2887,
    2886,
    2876,
    2877,
    2882,
    2871,
    2875,
    2873,
    1790,
    1784,
    1786,
    1787,
    1788,
    1802,
    1803,
    1804,
    1793,
    1794,
    1795,
    1796,
    1780,
    1781,
    1782,
    1807,
    1808,
    1809,
    1810,
    1798,
    1799,
    1412,
    1797,
    6452,
    1805,
    1806,
    1791,
    1800,
    1801
  },
  _GiantSkillList_0 = {
    243,
    2899,
    1153,
    1154,
    1155,
    2891,
    1157,
    1158,
    2892,
    291,
    292,
    2901,
    301,
    302,
    2903,
    315,
    316,
    317,
    295,
    368,
    1163,
    1164,
    1165,
    1166,
    296,
    329,
    1167,
    1168,
    1169,
    1170,
    1171,
    389,
    121,
    1172,
    1173,
    1174,
    287,
    288,
    289,
    2900,
    1175,
    1176,
    1177,
    1178,
    1179,
    1149,
    1150,
    1425,
    1426,
    1427,
    2907,
    1419,
    1420,
    1421,
    2905,
    1422,
    1423,
    1424,
    2906,
    298,
    299,
    300,
    2902,
    1160,
    1161,
    1151,
    1152,
    1159,
    1291,
    1292,
    2893,
    1162,
    1293,
    1294,
    213,
    214,
    215,
    1058,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _GiantSkillList_1 = {
    5426,
    5427,
    5428,
    5429,
    5422,
    5423,
    5424,
    5425,
    5418,
    5419,
    5420,
    5421,
    5440,
    5430,
    5431,
    5432,
    5433,
    5434,
    5435,
    5411,
    5443,
    5444,
    5442,
    5436,
    5437,
    5438,
    5439,
    5441,
    5413,
    5414,
    5415,
    5416,
    5417,
    5412
  },
  _GiantSkillList_2 = {
    2904,
    2895,
    2896,
    2897,
    2898,
    2889,
    2894,
    2890,
    1824,
    1825,
    1826,
    1841,
    1842,
    1843,
    1852,
    1854,
    1831,
    1832,
    1833,
    1849,
    1827,
    1828,
    1829,
    1848,
    1837,
    1838,
    1839,
    1840,
    1851,
    1834,
    1835,
    1836,
    1853,
    1846,
    6465,
    1850
  },
  _TamerSkillList_0 = {
    2914,
    1224,
    1225,
    1226,
    2921,
    85,
    86,
    87,
    2922,
    41,
    42,
    361,
    2923,
    12,
    13,
    14,
    15,
    16,
    17,
    1227,
    1228,
    1229,
    204,
    1338,
    1339,
    1340,
    1341,
    1342,
    1343,
    1344,
    1345,
    1346,
    1347,
    34,
    35,
    36,
    229,
    230,
    231,
    1232,
    1233,
    1234,
    2926,
    130,
    131,
    132,
    205,
    1235,
    1236,
    1230,
    1231,
    1309,
    1310,
    1311,
    1246,
    1247,
    1248,
    1249,
    1295,
    236,
    237,
    238,
    239,
    1076,
    2933,
    209,
    210,
    211,
    212,
    1241,
    1242,
    1243,
    1244,
    1245,
    134,
    135,
    2920,
    1217,
    1218,
    1219,
    2917,
    240,
    241,
    2934,
    1222,
    1223,
    2919,
    1220,
    1221,
    84,
    228,
    2918,
    38,
    362,
    363,
    4863,
    4864,
    4865,
    4866,
    4867,
    4868,
    4869,
    4870,
    4871,
    4872,
    4873,
    4874,
    4875,
    4876,
    4877,
    4878,
    4879,
    4880,
    4881,
    4882,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _TamerSkillList_1 = {
    4483,
    4484,
    4485,
    4486,
    4505,
    4495,
    4496,
    4497,
    4477,
    4506,
    4504,
    4498,
    4499,
    4500,
    4507,
    4501,
    4502,
    4503,
    4512,
    4513,
    4514,
    4515,
    4491,
    4492,
    4493,
    4494,
    4487,
    4488,
    4489,
    4490,
    4476,
    4778,
    4779,
    4478,
    4479,
    4480,
    4481,
    4482
  },
  _TamerSkillList_2 = {
    2915,
    2916,
    2924,
    2930,
    2927,
    2925,
    2932,
    2929,
    2931,
    2928,
    1927,
    1914,
    1915,
    1916,
    1937,
    6454,
    1923,
    1924,
    1925,
    1926,
    2555,
    1918,
    1919,
    1920,
    1921,
    1939,
    1910,
    1911,
    1912,
    1934,
    1922,
    1928,
    1929,
    1930,
    1931,
    1932,
    1940,
    1935,
    1936,
    1933
  },
  _BladeMasterSkillList_0 = {
    1262,
    1460,
    1461,
    3153,
    1286,
    1287,
    1288,
    425,
    420,
    421,
    1320,
    1321,
    3165,
    1322,
    1450,
    1451,
    3166,
    399,
    400,
    1459,
    1264,
    1265,
    418,
    201,
    202,
    3154,
    1276,
    1277,
    402,
    403,
    415,
    416,
    423,
    1297,
    1298,
    1299,
    1300,
    3164,
    1324,
    3168,
    1446,
    1447,
    1465,
    397,
    398,
    1278,
    1280,
    1462,
    3161,
    1325,
    1326,
    1454,
    1281,
    1283,
    1284,
    3230,
    1314,
    1323,
    405,
    406,
    3173,
    1269,
    159,
    1270,
    1456,
    392,
    3156,
    1272,
    393,
    3157,
    1273,
    394,
    3158,
    1274,
    395,
    3159,
    1289,
    1327,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    4844,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _BladeMasterSkillList_1 = {
    4741,
    4742,
    4743,
    4744,
    4763,
    4764,
    4765,
    4759,
    4756,
    4753,
    4754,
    4755,
    4745,
    4746,
    4747,
    4748,
    4749,
    4750,
    4751,
    4752,
    4760,
    4761,
    4762,
    4758,
    4766,
    4768,
    4767,
    4757,
    4735,
    4736,
    4737,
    4738,
    4739,
    4740
  },
  _BladeMasterSkillList_2 = {
    3162,
    3174,
    3171,
    3160,
    3172,
    3163,
    3169,
    3170,
    3167,
    3155,
    2028,
    2022,
    2001,
    2002,
    2003,
    2021,
    2012,
    2013,
    2014,
    2005,
    2006,
    2007,
    2025,
    2015,
    2016,
    2017,
    2024,
    2008,
    2009,
    2010,
    2011,
    2027,
    2018,
    2019,
    2020,
    2023,
    1987,
    2026,
    6468
  },
  _ValkyrieSkillList_0 = {
    3196,
    1477,
    1478,
    3197,
    748,
    749,
    3198,
    1488,
    1489,
    3199,
    1480,
    1481,
    1482,
    1483,
    3200,
    758,
    759,
    760,
    761,
    733,
    734,
    735,
    770,
    1491,
    1492,
    1493,
    771,
    3209,
    740,
    741,
    742,
    743,
    745,
    746,
    3215,
    766,
    767,
    768,
    775,
    772,
    773,
    774,
    751,
    752,
    753,
    3220,
    731,
    763,
    764,
    3201,
    724,
    725,
    726,
    3210,
    728,
    3211,
    729,
    3212,
    777,
    778,
    779,
    780,
    3213,
    1495,
    1496,
    1498,
    1499,
    3203,
    719,
    730,
    1485,
    1486,
    784,
    720,
    721,
    722,
    785,
    754,
    755,
    756,
    3206,
    737,
    738,
    782,
    783,
    769,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _ValkyrieSkillList_1 = {
    4146,
    4212,
    4213,
    4223,
    4147,
    4218,
    4219,
    4220,
    4151,
    4224,
    4225,
    4226,
    4150,
    4216,
    4217,
    4148,
    4214,
    4215,
    4144,
    4142,
    4142,
    4153,
    4145,
    4149,
    4221,
    4222,
    4143,
    4211,
    4136,
    4137,
    4138,
    4139,
    4140,
    4141
  },
  _ValkyrieSkillList_2 = {
    3217,
    3202,
    3214,
    3218,
    3207,
    3219,
    3208,
    3204,
    3205,
    1964,
    1965,
    1966,
    1981,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1972,
    1973,
    1974,
    6459,
    1968,
    1969,
    1970,
    1971,
    1975,
    1976,
    1977,
    1982,
    1978,
    1979,
    1985,
    1983,
    1967
  },
  _BladeMasterWomanSkillList_0 = {
    1505,
    1513,
    1514,
    3175,
    1550,
    1551,
    1552,
    1553,
    1595,
    1596,
    3195,
    1562,
    1563,
    1619,
    1564,
    1565,
    1566,
    3188,
    1579,
    1580,
    1581,
    1516,
    1517,
    1518,
    1521,
    1536,
    1537,
    1538,
    1583,
    1584,
    1585,
    1586,
    1556,
    1557,
    1558,
    1559,
    3186,
    1568,
    3190,
    1573,
    1574,
    1576,
    1520,
    1577,
    1578,
    3192,
    1540,
    3183,
    1569,
    1570,
    1571,
    1541,
    1543,
    1544,
    1546,
    1560,
    1567,
    1589,
    1590,
    3229,
    1524,
    1525,
    3177,
    1526,
    1592,
    1531,
    3178,
    1528,
    1532,
    3179,
    1529,
    1533,
    3180,
    1530,
    1534,
    3181,
    1554,
    1618,
    1597,
    1598,
    1599,
    1600,
    1601,
    1602,
    1603,
    1604,
    1605,
    1606,
    4845,
    1607,
    1608,
    1609,
    1610,
    1611,
    1612,
    1613,
    1614,
    1615,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _BladeMasterWomanSkillList_1 = {
    4182,
    4681,
    4682,
    4180,
    4678,
    4679,
    4680,
    4181,
    4185,
    4179,
    4675,
    4676,
    4677,
    4184,
    4685,
    4686,
    4687,
    4177,
    4183,
    4683,
    4684,
    4244,
    4178,
    4673,
    4674,
    4243,
    4688,
    4689,
    4171,
    4172,
    4173,
    4174,
    4175,
    4176
  },
  _BladeMasterWomanSkillList_2 = {
    3184,
    3187,
    3193,
    3176,
    3182,
    3194,
    3185,
    3191,
    3231,
    3189,
    2048,
    2066,
    2067,
    2041,
    2042,
    2043,
    2058,
    2059,
    2060,
    2064,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2044,
    2045,
    2046,
    2047,
    2070,
    6461,
    2061,
    2062,
    2063,
    2068,
    2049,
    2071,
    2069
  },
  _KunoichiSkillList_0 = {
    1650,
    1651,
    1652,
    1653,
    3101,
    1663,
    1664,
    1665,
    1666,
    3123,
    992,
    998,
    3117,
    973,
    974,
    697,
    698,
    699,
    3118,
    943,
    944,
    3106,
    967,
    968,
    969,
    970,
    950,
    951,
    1624,
    1625,
    952,
    977,
    978,
    979,
    3114,
    975,
    976,
    959,
    960,
    961,
    963,
    964,
    965,
    988,
    989,
    990,
    986,
    987,
    702,
    703,
    704,
    1627,
    1628,
    3120,
    1655,
    1656,
    1657,
    1658,
    3121,
    954,
    955,
    956,
    957,
    999,
    942,
    945,
    3105,
    1668,
    1669,
    1670,
    919,
    920,
    916,
    917,
    1660,
    1661,
    3122,
    947,
    948,
    3107,
    981,
    982,
    983,
    984,
    922,
    934,
    935,
    3103,
    693,
    694,
    695,
    938,
    939,
    3104,
    690,
    691,
    692,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635,
    1636,
    1637,
    1638,
    1639,
    1640,
    1641,
    1642,
    1643,
    1644,
    1645,
    1646,
    1647,
    1648,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _KunoichiSkillList_1 = {
    4660,
    4661,
    4641,
    4642,
    4643,
    4638,
    4639,
    4640,
    4647,
    4648,
    4649,
    4650,
    4651,
    4652,
    4653,
    4654,
    4655,
    4656,
    4657,
    4658,
    4659,
    4662,
    4644,
    4645,
    4646,
    4630,
    4663,
    4664,
    4633,
    4634,
    4635,
    4636,
    4637,
    4632
  },
  _KunoichiSkillList_2 = {
    3113,
    3112,
    3108,
    3110,
    3111,
    3116,
    3115,
    3119,
    3109,
    3127,
    2128,
    2121,
    2122,
    2123,
    2124,
    2140,
    2141,
    2142,
    2143,
    2155,
    2156,
    2157,
    2160,
    2161,
    2162,
    2145,
    2146,
    2147,
    2148,
    2159,
    6453,
    2125,
    2126,
    2127,
    2149,
    2144,
    2153,
    2152,
    2158,
    2151
  },
  _NinjaManSkillList_0 = {
    1708,
    1709,
    1710,
    1711,
    3102,
    1663,
    1664,
    1665,
    1666,
    992,
    998,
    3117,
    973,
    974,
    3113,
    697,
    698,
    699,
    3118,
    943,
    944,
    3106,
    967,
    968,
    969,
    970,
    3112,
    950,
    951,
    1624,
    1625,
    952,
    977,
    978,
    979,
    959,
    960,
    961,
    963,
    964,
    965,
    3111,
    988,
    989,
    990,
    3116,
    1686,
    1687,
    3129,
    702,
    703,
    704,
    3119,
    1655,
    1656,
    1657,
    1658,
    1699,
    1700,
    1681,
    942,
    945,
    3105,
    1668,
    1669,
    1670,
    1682,
    1683,
    1684,
    919,
    920,
    916,
    917,
    1660,
    1661,
    3122,
    947,
    948,
    3107,
    981,
    982,
    983,
    984,
    1701,
    934,
    935,
    3103,
    693,
    694,
    695,
    938,
    939,
    3104,
    1678,
    1679,
    1680,
    1675,
    1676,
    1677,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635,
    1636,
    1637,
    1638,
    1639,
    1640,
    1641,
    1642,
    1643,
    1644,
    1645,
    1646,
    1647,
    1648,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _NinjaManSkillList_1 = {
    4699,
    4700,
    4701,
    4721,
    6796,
    4720,
    4702,
    4703,
    4704,
    4716,
    4717,
    4718,
    4719,
    4705,
    4706,
    4707,
    4691,
    4724,
    4725,
    4722,
    4712,
    4713,
    4714,
    4715,
    4708,
    4709,
    4710,
    4711,
    4723,
    4694,
    4695,
    4696,
    4697,
    4698,
    4693
  },
  _NinjaManSkillList_2 = {
    3123,
    3108,
    3114,
    3110,
    3121,
    3126,
    3128,
    3125,
    3124,
    2095,
    2105,
    2106,
    2107,
    2098,
    2099,
    6467,
    2088,
    2089,
    2090,
    2091,
    2103,
    2117,
    2118,
    2119,
    2110,
    2111,
    2112,
    2113,
    2092,
    2093,
    2094,
    2116,
    2096,
    2102,
    2108,
    2101,
    2115,
    2114
  },
  _WizardWomanSkillList_0 = {
    3232,
    851,
    852,
    853,
    854,
    855,
    887,
    888,
    889,
    819,
    820,
    821,
    847,
    848,
    849,
    791,
    792,
    828,
    829,
    830,
    3135,
    831,
    832,
    833,
    823,
    824,
    825,
    826,
    856,
    857,
    858,
    859,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846,
    787,
    788,
    789,
    913,
    914,
    909,
    910,
    911,
    2208,
    873,
    874,
    875,
    876,
    894,
    895,
    896,
    897,
    3144,
    869,
    870,
    871,
    866,
    867,
    891,
    892,
    1120,
    1121,
    1122,
    900,
    901,
    902,
    903,
    794,
    795,
    796,
    861,
    862,
    863,
    864,
    905,
    906,
    907,
    908,
    1621,
    1622,
    898,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _WizardWomanSkillList_1 = {
    4978,
    4956,
    5313,
    5314,
    4941,
    4990,
    4991,
    4951,
    5307,
    5308,
    4946,
    5301,
    5302,
    4934,
    4936,
    4938,
    4935,
    4937,
    4939
  },
  _WizardWomanSkillList_2 = {
    3140,
    3141,
    3132,
    3143,
    3131,
    3136,
    3133,
    3134,
    3137,
    3138,
    3139,
    3130,
    3146,
    2205,
    6773,
    2180,
    2181,
    2182,
    2183,
    2184,
    2185,
    2187,
    2188,
    2189,
    2190,
    2191,
    2192,
    6774,
    6775,
    2193,
    2194,
    2195,
    2196,
    2206,
    6462,
    2197,
    2198,
    2199,
    2203,
    2164,
    2166
  },
  _WizardManSkillList_0 = {
    3232,
    851,
    852,
    853,
    854,
    855,
    887,
    888,
    889,
    819,
    820,
    821,
    847,
    848,
    849,
    791,
    792,
    828,
    829,
    830,
    3135,
    831,
    832,
    833,
    823,
    824,
    825,
    826,
    856,
    857,
    858,
    859,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846,
    787,
    788,
    789,
    913,
    914,
    909,
    910,
    911,
    2208,
    873,
    874,
    875,
    876,
    894,
    895,
    896,
    897,
    3144,
    869,
    870,
    871,
    866,
    867,
    891,
    892,
    1120,
    1121,
    1122,
    900,
    901,
    902,
    903,
    794,
    795,
    796,
    861,
    862,
    863,
    864,
    905,
    906,
    907,
    908,
    1621,
    1622,
    898,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _WizardManSkillList_1 = {
    4972,
    4956,
    5313,
    5314,
    4941,
    4990,
    4991,
    4951,
    5307,
    5308,
    4946,
    5301,
    5302,
    4934,
    4982,
    4984,
    4981,
    4983,
    4985
  },
  _WizardManSkillList_2 = {
    3140,
    3141,
    3132,
    3143,
    3131,
    3136,
    3133,
    3134,
    3137,
    3138,
    3139,
    3130,
    3146,
    2210,
    2226,
    2227,
    2228,
    6770,
    6464,
    2236,
    2237,
    2238,
    2247,
    2240,
    2241,
    2242,
    6771,
    2243,
    2244,
    2245,
    2232,
    2233,
    2234,
    2235,
    2229,
    2230,
    2231,
    2248,
    6772,
    2251,
    2212
  },
  _DarkElfSkillList_0 = {
    3072,
    2303,
    2304,
    3074,
    2340,
    2363,
    2341,
    3075,
    2267,
    2338,
    2362,
    2339,
    3076,
    2278,
    2279,
    2364,
    2280,
    3078,
    2255,
    2256,
    6768,
    2294,
    2295,
    2330,
    2331,
    2332,
    2264,
    2265,
    2361,
    2266,
    3084,
    2344,
    2345,
    2347,
    2346,
    2348,
    2333,
    2334,
    2335,
    2270,
    2271,
    2272,
    2273,
    2367,
    2368,
    2369,
    2370,
    2371,
    2372,
    2373,
    2374,
    3091,
    2342,
    2260,
    2261,
    2350,
    2351,
    2297,
    2379,
    2300,
    2301,
    3073,
    2365,
    2357,
    2366,
    3077,
    2358,
    2337,
    3087,
    2305,
    6769,
    2377,
    2378,
    2306,
    2307,
    2308,
    2309,
    2310,
    2311,
    2312,
    2313,
    2314,
    2315,
    2316,
    2317,
    2318,
    2319,
    2320,
    2321,
    2322,
    2323,
    2324,
    2325,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _DarkElfSkillList_1 = {
    4812,
    4809,
    4810,
    4788,
    4789,
    4790,
    4791,
    4792,
    4793,
    4794,
    4799,
    4800,
    4801,
    4795,
    4796,
    4797,
    4798,
    4802,
    4803,
    4804,
    4805,
    4806,
    4807,
    4808,
    4781,
    4820,
    4821,
    4811,
    4783,
    4784,
    4785,
    4786,
    4787,
    4782
  },
  _DarkElfSkillList_2 = {
    3079,
    3081,
    3082,
    3083,
    3086,
    3088,
    3089,
    3090,
    3080,
    3092,
    2416,
    2392,
    2393,
    2394,
    2403,
    2404,
    2405,
    2395,
    2396,
    2397,
    2398,
    2412,
    2406,
    2407,
    2408,
    2413,
    6798,
    2409,
    2410,
    2411,
    2402,
    2414,
    2399,
    2400,
    2401,
    2418,
    2419,
    2417,
    2420,
    2421,
    6460
  },
  _CombattantSkillList_0 = {
    3030,
    2436,
    2437,
    3031,
    2484,
    2485,
    3037,
    2538,
    2539,
    2540,
    2439,
    2440,
    2441,
    2442,
    3032,
    2450,
    2451,
    2476,
    2477,
    3035,
    2479,
    2480,
    3036,
    3034,
    2487,
    2488,
    2489,
    2490,
    2544,
    2545,
    2553,
    2554,
    2551,
    2548,
    3052,
    2550,
    2520,
    2521,
    2523,
    2524,
    3045,
    2526,
    2527,
    3046,
    3094,
    2509,
    2510,
    2511,
    3043,
    2517,
    2518,
    2542,
    2513,
    2514,
    2515,
    2502,
    2503,
    2504,
    2557,
    2529,
    2530,
    2531,
    3047,
    2533,
    2534,
    2535,
    2536,
    2497,
    2498,
    2499,
    2500,
    2492,
    2493,
    2494,
    2495,
    2444,
    2445,
    2447,
    2448,
    2482,
    2506,
    2507,
    3042,
    2541,
    2546,
    2453,
    2454,
    2455,
    2456,
    2457,
    2458,
    2459,
    2460,
    2461,
    2462,
    2463,
    2464,
    2465,
    2466,
    2467,
    2468,
    2469,
    2470,
    2471,
    2472,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _CombattantSkillList_1 = {
    5329,
    5330,
    5331,
    5332,
    5333,
    5334,
    5335,
    5336,
    5337,
    5338,
    5339,
    5340,
    5341,
    5342,
    5343,
    5344,
    5345,
    5346,
    5347,
    5348,
    5349,
    5350,
    5351,
    5352,
    5353,
    5354,
    5355,
    5356,
    5357,
    5358,
    5359,
    5360,
    5361,
    5362
  },
  _CombattantSkillList_2 = {
    3049,
    3033,
    3038,
    3051,
    3044,
    3041,
    3048,
    3040,
    3039,
    3050,
    2552,
    2560,
    2561,
    2563,
    2564,
    2565,
    2566,
    2567,
    2568,
    2569,
    2570,
    2571,
    2572,
    2573,
    2574,
    2575,
    2576,
    2577,
    2578,
    2579,
    2580,
    2581,
    2582,
    2643,
    2644,
    2645,
    2646,
    2647,
    2648,
    2649,
    2650,
    6458
  },
  _MysticSkillList_0 = {
    3053,
    2624,
    2625,
    3054,
    2657,
    2658,
    2679,
    2627,
    2628,
    2629,
    2630,
    3055,
    2638,
    2639,
    3056,
    3258,
    2660,
    2661,
    3059,
    2663,
    2664,
    3060,
    2685,
    2686,
    2675,
    2676,
    2677,
    2683,
    2684,
    2688,
    3063,
    2690,
    2702,
    2703,
    2704,
    2705,
    2667,
    2668,
    2669,
    2670,
    2671,
    2729,
    2730,
    2731,
    2707,
    2708,
    2709,
    3068,
    2711,
    2712,
    2713,
    2715,
    2716,
    2717,
    2692,
    2693,
    3064,
    2695,
    2696,
    3065,
    2698,
    2699,
    2653,
    2654,
    2655,
    2719,
    2720,
    2721,
    2722,
    2724,
    2725,
    2726,
    2727,
    2632,
    2633,
    2635,
    2636,
    2700,
    3261,
    2732,
    2673,
    2592,
    2593,
    2594,
    2595,
    2596,
    2597,
    2598,
    2599,
    2600,
    2601,
    2602,
    2603,
    2604,
    2605,
    2606,
    2607,
    2608,
    2609,
    2610,
    2611,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _MysticSkillList_1 = {
    5374,
    5376,
    5377,
    5378,
    5379,
    5380,
    5381,
    5382,
    5383,
    5384,
    5385,
    5386,
    5387,
    5388,
    5389,
    5390,
    5391,
    5392,
    5393,
    5394,
    5395,
    5396,
    5397,
    5398,
    5399,
    5400,
    5401,
    5402,
    5403,
    5404,
    5405,
    5406,
    5407,
    5408
  },
  _MysticSkillList_2 = {
    3058,
    3062,
    3067,
    3061,
    3071,
    3066,
    3057,
    3069,
    3070,
    2777,
    2778,
    2779,
    2780,
    2781,
    2782,
    2783,
    2791,
    2784,
    2785,
    2786,
    2788,
    2789,
    2790,
    2792,
    2793,
    2794,
    2795,
    2797,
    2798,
    2799,
    2800,
    2801,
    2802,
    2803,
    2804,
    2805,
    2806,
    6455,
    6765,
    6794
  },
  _LhanSkillList_0 = {
    3323,
    3222,
    3223,
    3224,
    3300,
    3013,
    3014,
    3015,
    3016,
    3007,
    3008,
    3009,
    3010,
    2965,
    3017,
    3018,
    3019,
    3317,
    3020,
    3021,
    3318,
    3005,
    3006,
    3011,
    3012,
    3315,
    2959,
    2990,
    2991,
    3310,
    2996,
    2997,
    3309,
    2995,
    3308,
    2956,
    2987,
    2988,
    2989,
    3306,
    3148,
    3149,
    3150,
    2978,
    2979,
    2980,
    2981,
    2992,
    2993,
    2994,
    3304,
    2982,
    2983,
    2984,
    2985,
    2986,
    3022,
    3023,
    3024,
    3319,
    3025,
    3026,
    3320,
    3226,
    3227,
    3028,
    3029,
    2998,
    2999,
    2961,
    3000,
    3001,
    3002,
    3312,
    3003,
    3004,
    3152,
    3322,
    2975,
    2976,
    2949,
    2977,
    3302,
    3234,
    3235,
    3236,
    3237,
    3238,
    3239,
    3240,
    3241,
    3242,
    3243,
    3244,
    3245,
    3246,
    3247,
    3248,
    3249,
    3250,
    3251,
    3252,
    3253,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _LhanSkillList_1 = {
    4893,
    4894,
    4895,
    4917,
    4916,
    4914,
    4902,
    4903,
    4904,
    4905,
    4899,
    4900,
    4901,
    4896,
    4897,
    4898,
    4906,
    4907,
    4908,
    4909,
    4885,
    4918,
    4919,
    4915,
    4910,
    4911,
    4912,
    4913,
    4888,
    4889,
    4890,
    4891,
    4892,
    4887
  },
  _LhanSkillList_2 = {
    3316,
    3314,
    3313,
    3311,
    3307,
    3321,
    3303,
    3305,
    3301,
    3292,
    3291,
    3268,
    3269,
    3296,
    3282,
    3283,
    3294,
    3271,
    3272,
    3273,
    3274,
    3275,
    3284,
    3285,
    3286,
    3276,
    3277,
    3278,
    3279,
    3280,
    3287,
    3288,
    3289,
    3290,
    3298,
    3281,
    3295,
    3270,
    3297,
    6456
  },
  _RangerManSkillList_0 = {
    3338,
    3415,
    3416,
    3447,
    3340,
    3341,
    3428,
    3342,
    3443,
    3444,
    3445,
    3446,
    3457,
    3449,
    3450,
    3451,
    3452,
    3453,
    3424,
    3425,
    3426,
    3433,
    3434,
    3435,
    3436,
    3430,
    3437,
    3368,
    3369,
    3370,
    3371,
    3372,
    3418,
    3419,
    3420,
    3421,
    3422,
    3358,
    3359,
    3360,
    3361,
    3362,
    3363,
    3365,
    3366,
    3344,
    3345,
    3346,
    3378,
    3379,
    3380,
    3374,
    3375,
    3376,
    3406,
    3407,
    3408,
    3409,
    3411,
    3412,
    3413,
    3350,
    3351,
    3352,
    3353,
    3354,
    3355,
    3356,
    3438,
    3439,
    3440,
    3381,
    3382,
    3383,
    3384,
    3385,
    3386,
    3387,
    3388,
    3389,
    3390,
    3391,
    3392,
    3393,
    3394,
    3395,
    3396,
    3397,
    3398,
    3399,
    3400,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    4856,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _RangerManSkillList_1 = {},
  _RangerManSkillList_2 = {
    3923,
    3914,
    3935,
    3936,
    3937,
    3945,
    3946,
    6763,
    6762,
    3917,
    3918,
    3919,
    6466,
    3925,
    3926,
    3927,
    3948,
    3930,
    3931,
    3932,
    3939,
    3940,
    3941,
    3933,
    3938,
    3943,
    3922,
    3947,
    3429
  },
  _ShyWamanSkillList_0 = {
    3892,
    3893,
    3859,
    3888,
    3889,
    3860,
    3856,
    3857,
    3858,
    3852,
    3853,
    3854,
    4628,
    3863,
    3864,
    3865,
    3866,
    4204,
    3868,
    3869,
    3871,
    3872,
    3873,
    3874,
    3876,
    3877,
    3878,
    3880,
    3881,
    3882,
    3883,
    3884,
    3886,
    3890,
    3861,
    4154,
    4155,
    4156,
    4157,
    4158,
    4159,
    4160,
    4161,
    4162,
    4163,
    4607,
    4608,
    6767,
    6766,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _ShyWamanSkillList_1 = {},
  _ShyWamanSkillList_2 = {
    4097,
    4098,
    4609,
    4610,
    4099,
    4611,
    4612,
    4230,
    4231,
    4232,
    4102,
    4621,
    4623,
    4625,
    4617,
    4622,
    4101,
    4229,
    4100,
    6471
  },
  _GuardianSkillList_0 = {
    5012,
    5013,
    5015,
    5016,
    5017,
    5018,
    5019,
    5020,
    5021,
    5022,
    5023,
    5024,
    5025,
    5026,
    5027,
    5028,
    5029,
    5030,
    5031,
    5032,
    5033,
    5034,
    5035,
    5036,
    5038,
    5039,
    5042,
    5043,
    5046,
    5047,
    5048,
    5049,
    5055,
    5056,
    5057,
    5058,
    5060,
    5061,
    5063,
    5065,
    5066,
    5069,
    5070,
    5071,
    5074,
    5075,
    5076,
    5079,
    5080,
    5083,
    5084,
    5085,
    5088,
    5089,
    5090,
    5095,
    5096,
    5098,
    5099,
    5101,
    5103,
    5106,
    5107,
    5109,
    5111,
    5112,
    5115,
    5116,
    5121,
    5122,
    5125,
    5127,
    5128,
    5129,
    5140,
    5141,
    5142,
    5143,
    5144,
    5010,
    5014,
    5040,
    5044,
    5059,
    5062,
    5077,
    5102,
    5108,
    5145,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _GuardianSkillList_1 = {
    5187,
    5221,
    5213,
    5216,
    5217,
    5218,
    5219,
    5220,
    5201,
    5202,
    5203,
    5204,
    5194,
    5195,
    5196,
    5197,
    5205,
    5206,
    5207,
    5208,
    5191,
    5192,
    5193,
    5198,
    5199,
    5200,
    5188,
    8189,
    5190,
    5209,
    5210,
    5211,
    5212,
    5214,
    5215
  },
  _GuardianSkillList_2 = {
    5155,
    5156,
    5157,
    5153,
    5178,
    5158,
    5159,
    5160,
    5161,
    5169,
    5170,
    5171,
    5172,
    5162,
    5163,
    5164,
    5165,
    5166,
    5167,
    5175,
    5176,
    5177,
    5168,
    5174,
    5173,
    5179,
    5180,
    5181,
    5183,
    5182,
    5091,
    5072,
    5081,
    5086,
    5050,
    5123,
    5117,
    5113,
    5130,
    5067,
    6457
  },
  _HashashinSkillList_0 = {
    5613,
    5614,
    5520,
    5521,
    5522,
    5502,
    5503,
    5530,
    5531,
    5506,
    5507,
    5508,
    5509,
    5510,
    5525,
    5526,
    5527,
    5495,
    5496,
    5497,
    5498,
    5600,
    5601,
    5602,
    5535,
    5536,
    5537,
    5538,
    5489,
    5490,
    5491,
    5492,
    5544,
    5545,
    5546,
    5547,
    5518,
    5596,
    5597,
    5541,
    5542,
    5566,
    5567,
    5582,
    5585,
    5586,
    5587,
    5588,
    5610,
    5611,
    5513,
    5514,
    5515,
    5604,
    5516,
    5606,
    5607,
    5608,
    5482,
    5483,
    5484,
    5485,
    5533,
    5550,
    5551,
    5552,
    5553,
    5554,
    5555,
    5556,
    5557,
    5558,
    5590,
    5570,
    5571,
    5572,
    5573,
    5574,
    5575,
    5576,
    5577,
    5578,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076,
    5478,
    5615,
    5532,
    5499,
    5603,
    5539,
    5493,
    5486
  },
  _HashashinSkillList_1 = {
    5665,
    5674,
    5675,
    5676,
    5671,
    5672,
    5673,
    5677,
    5678,
    5679,
    5680,
    5681,
    5682,
    5683,
    5667,
    5684,
    5685,
    5686,
    5687,
    5688,
    5689,
    5690,
    5691,
    5658,
    5669,
    5670,
    5666,
    5668,
    5660,
    5661,
    5662,
    5663,
    5664,
    5659
  },
  _HashashinSkillList_2 = {
    5619,
    5618,
    5617,
    5648,
    5626,
    5627,
    5628,
    5630,
    5631,
    5632,
    5633,
    5634,
    5635,
    5636,
    5637,
    5638,
    5639,
    5640,
    5641,
    5642,
    5643,
    5644,
    5645,
    5646,
    5647,
    5653,
    5649,
    5651,
    5650,
    5652,
    5701,
    5523,
    5504,
    5511,
    5528,
    5548,
    5598,
    5568,
    5589,
    5609,
    6470
  },
  _NovaSkillList_0 = {
    5829,
    5785,
    5786,
    5787,
    5788,
    5789,
    5790,
    5738,
    5739,
    5740,
    5741,
    5744,
    5745,
    5746,
    5747,
    5807,
    5808,
    5809,
    5760,
    5761,
    5762,
    5763,
    5766,
    5767,
    5768,
    5877,
    5831,
    5837,
    5838,
    5749,
    5750,
    5830,
    5782,
    5783,
    5835,
    5753,
    5754,
    5755,
    5756,
    5757,
    5758,
    5804,
    5805,
    5806,
    5771,
    5772,
    5773,
    5774,
    5792,
    5793,
    5794,
    5795,
    5798,
    5799,
    5800,
    5801,
    5732,
    5733,
    5734,
    5735,
    5777,
    5778,
    5779,
    5722,
    5723,
    5724,
    5725,
    5726,
    5730,
    5832,
    5833,
    5863,
    5864,
    5811,
    5812,
    5813,
    5815,
    5816,
    5817,
    5818,
    5834,
    5839,
    5840,
    5841,
    5842,
    5843,
    5844,
    5845,
    5846,
    5847,
    5848,
    5849,
    5850,
    5851,
    5852,
    5853,
    5854,
    5855,
    5856,
    5857,
    5858,
    5859,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _NovaSkillList_1 = {
    5940,
    5941,
    5942,
    5943,
    5944,
    5945,
    5946,
    5947,
    5948,
    5949,
    5950,
    5951,
    5952,
    5953,
    5954,
    5955,
    5956,
    5957,
    5958,
    5959,
    5960,
    5961,
    5962,
    5963,
    5964,
    5965,
    5966,
    5967,
    5969,
    5970,
    5971,
    5973,
    5974,
    5975,
    5977,
    5988
  },
  _NovaSkillList_2 = {
    5742,
    5747,
    5764,
    5769,
    5836,
    5775,
    5796,
    5802,
    5736,
    5780,
    5727,
    5865,
    5909,
    5881,
    5913,
    5888,
    5889,
    5890,
    5891,
    5892,
    5893,
    5894,
    5895,
    5896,
    5897,
    5898,
    5900,
    5901,
    5903,
    5904,
    5905,
    5906,
    5907,
    5923,
    5921,
    6469
  },
  _SageSkillList_0 = {
    6153,
    6156,
    6157,
    6158,
    6159,
    6162,
    6163,
    6164,
    6165,
    6168,
    6169,
    6170,
    6171,
    6174,
    6175,
    6176,
    6178,
    6179,
    6180,
    6181,
    6182,
    6184,
    6185,
    6186,
    6187,
    6189,
    6191,
    6192,
    6195,
    6196,
    6197,
    6198,
    6200,
    6201,
    6202,
    6205,
    6206,
    6207,
    6210,
    6211,
    6212,
    6220,
    6221,
    6222,
    6223,
    6225,
    6226,
    6227,
    6229,
    6214,
    6215,
    6216,
    6217,
    6231,
    6232,
    6233,
    6234,
    6235,
    6236,
    6237,
    6238,
    6239,
    6240,
    6241,
    6242,
    6243,
    6244,
    6245,
    6246,
    6247,
    6248,
    6249,
    6250,
    6251,
    6252,
    6306,
    6307,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076
  },
  _SageSkillList_1 = {
    6264,
    6265,
    6266,
    6267,
    6268,
    6271,
    6274,
    6275,
    6276,
    6277,
    6278,
    6279,
    6280,
    6281,
    6282,
    6283,
    6284,
    6285,
    6286,
    6287,
    6288,
    6289,
    6290,
    6291,
    6292,
    6293,
    6294,
    6295,
    6296,
    6297,
    6298,
    6154,
    6345,
    6346
  },
  _SageSkillList_2 = {
    6160,
    6166,
    6172,
    6177,
    6190,
    6203,
    6208,
    6213,
    6218,
    6228,
    6338,
    6272,
    6308,
    6309,
    6310,
    6311,
    6312,
    6313,
    6314,
    6315,
    6316,
    6317,
    6318,
    6319,
    6320,
    6321,
    6322,
    6323,
    6324,
    6325,
    6326,
    6327,
    6328,
    6329,
    6330,
    6331,
    6332,
    6333,
    6334,
    6335,
    6336,
    6337,
    6339,
    6340,
    6341,
    6342
  },
  _CorsairSkillList_0 = {
    6487,
    6551,
    6552,
    6553,
    6554,
    6509,
    6510,
    6511,
    6542,
    6543,
    6544,
    6545,
    6546,
    6547,
    6548,
    6499,
    6500,
    6501,
    6502,
    6540,
    6520,
    6521,
    6522,
    6523,
    6658,
    6556,
    6557,
    6558,
    6578,
    6579,
    6580,
    6662,
    6663,
    6664,
    6665,
    6514,
    6515,
    6516,
    6517,
    6518,
    6504,
    6505,
    6506,
    6588,
    6589,
    6590,
    6666,
    6667,
    6668,
    6583,
    6584,
    6585,
    6561,
    6562,
    6565,
    6566,
    6569,
    6570,
    6573,
    6574,
    6575,
    6528,
    6529,
    6530,
    6531,
    6533,
    6534,
    6535,
    6490,
    6491,
    6492,
    6494,
    6495,
    6496,
    6659,
    6660,
    6597,
    6598,
    6599,
    6600,
    6601,
    6602,
    6603,
    6604,
    6605,
    6606,
    6607,
    6608,
    6609,
    6610,
    6611,
    6612,
    6613,
    6614,
    6615,
    6616,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076,
    4856
  },
  _CorsairSkillList_1 = {
    6630,
    6631,
    6632,
    6633,
    6641,
    6642,
    6643,
    6634,
    6635,
    6636,
    6637,
    6652,
    6626,
    6627,
    6628,
    6629,
    6644,
    6645,
    6646,
    6638,
    6639,
    6640,
    6649,
    6650,
    6647,
    6648,
    6625,
    6731,
    6732,
    6651,
    6619,
    6620,
    6621,
    6622,
    6623,
    6624
  },
  _CorsairSkillList_2 = {
    6512,
    6524,
    6559,
    6581,
    6507,
    6591,
    6586,
    6563,
    6567,
    6571,
    6576,
    6661,
    6705,
    6696,
    6697,
    6676,
    6677,
    6678,
    6683,
    6684,
    6685,
    6686,
    6706,
    6699,
    6679,
    6680,
    6681,
    6690,
    6691,
    6692,
    6702,
    6687,
    6688,
    6689,
    6698,
    6693,
    6694,
    6695,
    6707,
    6703,
    6682,
    6701,
    6549
  },
  _DrakaniaSkillList_0 = {
    6811,
    6865,
    6866,
    6867,
    6869,
    6870,
    6871,
    6861,
    6862,
    6884,
    6885,
    6930,
    6931,
    6932,
    6888,
    6889,
    6890,
    6891,
    6893,
    6894,
    6895,
    6851,
    6852,
    6853,
    6856,
    6857,
    6858,
    6833,
    6834,
    6835,
    6828,
    6829,
    6830,
    6821,
    6822,
    6823,
    6824,
    6826,
    6845,
    6846,
    6847,
    6848,
    6873,
    6874,
    6875,
    6876,
    6925,
    6926,
    6879,
    6880,
    6881,
    6814,
    6815,
    6817,
    6818,
    6819,
    6838,
    6839,
    6840,
    6841,
    6842,
    6843,
    6934,
    6935,
    6936,
    6937,
    6938,
    6939,
    6940,
    6941,
    6942,
    6943,
    6944,
    6945,
    6946,
    6947,
    6948,
    6949,
    6950,
    6951,
    6952,
    6953,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    2072,
    2073,
    2074,
    2075,
    2076,
    4856
  },
  _DrakaniaSkillList_1 = {
    6897,
    6898,
    6899,
    6900,
    6901,
    6902,
    6903,
    6904,
    6905,
    6906,
    6907,
    6908,
    6909,
    6910,
    6911,
    6912,
    6913,
    6914,
    6915,
    6916,
    6917,
    6918,
    6919,
    6920,
    6921,
    6923,
    6954,
    6955,
    6956,
    6957,
    6958,
    6976,
    6980,
    6981,
    6933,
    6922
  },
  _DrakaniaSkillList_2 = {
    6868,
    6863,
    6886,
    6854,
    6859,
    6836,
    6831,
    6825,
    6849,
    6877,
    6882,
    7016,
    6988,
    7045,
    6990,
    6991,
    6992,
    6993,
    6994,
    6995,
    6996,
    6997,
    6998,
    6999,
    7000,
    7001,
    7002,
    7008,
    7009,
    7010,
    7011,
    7012,
    7013,
    7014,
    7015,
    7017,
    7018,
    7019,
    7063,
    7020,
    7021,
    7022,
    7023,
    7024,
    7025,
    7026,
    7027,
    7028,
    7029,
    7030,
    7031,
    7032,
    7033,
    7034,
    7035,
    7036,
    7037,
    7038,
    7039,
    7040,
    7041,
    7042
  }
}
function LearnSkillForQA()
  ToClient_qaLevelUp(63)
  awakening()
  createSkillPoint(3000)
  ToClient_qaCreateItem(17697, 0, 1)
  luaTimer_AddEvent(ToClient_qaUseInventoryItem, 10000, false, 0, 17697, 0)
  luaTimer_AddEvent(LearnAllSkill, 10000, false, 0)
end
function LearnAllSkill(skillType)
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isClassType = selfPlayer:getClassType()
  local SkillList_0, SkillList_1, SkillList_2
  if isClassType == __eClassType_Warrior then
    SkillList_0 = PaGlobalQASupport._WarriorSkillList_0
    SkillList_1 = PaGlobalQASupport._WarriorSkillList_1
    SkillList_2 = PaGlobalQASupport._WarriorSkillList_2
  elseif isClassType == __eClassType_ElfRanger then
    SkillList_0 = PaGlobalQASupport._ElfRangerSkillList_0
    SkillList_1 = PaGlobalQASupport._ElfRangerSkillList_1
    SkillList_2 = PaGlobalQASupport._ElfRangerSkillList_2
  elseif isClassType == __eClassType_Sorcerer then
    SkillList_0 = PaGlobalQASupport._SorcererSkillList_0
    SkillList_1 = PaGlobalQASupport._SorcererSkillList_1
    SkillList_2 = PaGlobalQASupport._SorcererSkillList_2
  elseif isClassType == __eClassType_Giant then
    SkillList_0 = PaGlobalQASupport._GiantSkillList_0
    SkillList_1 = PaGlobalQASupport._GiantSkillList_1
    SkillList_2 = PaGlobalQASupport._GiantSkillList_2
  elseif isClassType == __eClassType_Tamer then
    SkillList_0 = PaGlobalQASupport._TamerSkillList_0
    SkillList_1 = PaGlobalQASupport._TamerSkillList_1
    SkillList_2 = PaGlobalQASupport._TamerSkillList_2
  elseif isClassType == __eClassType_BladeMaster then
    SkillList_0 = PaGlobalQASupport._BladeMasterSkillList_0
    SkillList_1 = PaGlobalQASupport._BladeMasterSkillList_1
    SkillList_2 = PaGlobalQASupport._BladeMasterSkillList_2
  elseif isClassType == __eClassType_Valkyrie then
    SkillList_0 = PaGlobalQASupport._ValkyrieSkillList_0
    SkillList_1 = PaGlobalQASupport._ValkyrieSkillList_1
    SkillList_2 = PaGlobalQASupport._ValkyrieSkillList_2
  elseif isClassType == __eClassType_BladeMasterWoman then
    SkillList_0 = PaGlobalQASupport._BladeMasterWomanSkillList_0
    SkillList_1 = PaGlobalQASupport._BladeMasterWomanSkillList_1
    SkillList_2 = PaGlobalQASupport._BladeMasterWomanSkillList_2
  elseif isClassType == __eClassType_Kunoichi then
    SkillList_0 = PaGlobalQASupport._KunoichiSkillList_0
    SkillList_1 = PaGlobalQASupport._KunoichiSkillList_1
    SkillList_2 = PaGlobalQASupport._KunoichiSkillList_2
  elseif isClassType == __eClassType_NinjaMan then
    SkillList_0 = PaGlobalQASupport._NinjaManSkillList_0
    SkillList_1 = PaGlobalQASupport._NinjaManSkillList_1
    SkillList_2 = PaGlobalQASupport._NinjaManSkillList_2
  elseif isClassType == __eClassType_WizardWoman then
    SkillList_0 = PaGlobalQASupport._WizardWomanSkillList_0
    SkillList_1 = PaGlobalQASupport._WizardWomanSkillList_1
    SkillList_2 = PaGlobalQASupport._WizardWomanSkillList_2
  elseif isClassType == __eClassType_WizardMan then
    SkillList_0 = PaGlobalQASupport._WizardManSkillList_0
    SkillList_1 = PaGlobalQASupport._WizardManSkillList_1
    SkillList_2 = PaGlobalQASupport._WizardManSkillList_2
  elseif isClassType == __eClassType_DarkElf then
    SkillList_0 = PaGlobalQASupport._DarkElfSkillList_0
    SkillList_1 = PaGlobalQASupport._DarkElfSkillList_1
    SkillList_2 = PaGlobalQASupport._DarkElfSkillList_2
  elseif isClassType == __eClassType_Combattant then
    SkillList_0 = PaGlobalQASupport._CombattantSkillList_0
    SkillList_1 = PaGlobalQASupport._CombattantSkillList_1
    SkillList_2 = PaGlobalQASupport._CombattantSkillList_2
  elseif isClassType == __eClassType_Mystic then
    SkillList_0 = PaGlobalQASupport._MysticSkillList_0
    SkillList_1 = PaGlobalQASupport._MysticSkillList_1
    SkillList_2 = PaGlobalQASupport._MysticSkillList_2
  elseif isClassType == __eClassType_Lhan then
    SkillList_0 = PaGlobalQASupport._LhanSkillList_0
    SkillList_1 = PaGlobalQASupport._LhanSkillList_1
    SkillList_2 = PaGlobalQASupport._LhanSkillList_2
  elseif isClassType == __eClassType_RangerMan then
    SkillList_0 = PaGlobalQASupport._RangerManSkillList_0
    SkillList_1 = PaGlobalQASupport._RangerManSkillList_1
    SkillList_2 = PaGlobalQASupport._RangerManSkillList_2
  elseif isClassType == __eClassType_ShyWaman then
    SkillList_0 = PaGlobalQASupport._ShyWamanSkillList_0
    SkillList_1 = PaGlobalQASupport._ShyWamanSkillList_1
    SkillList_2 = PaGlobalQASupport._ShyWamanSkillList_2
  elseif isClassType == __eClassType_Guardian then
    SkillList_0 = PaGlobalQASupport._GuardianSkillList_0
    SkillList_1 = PaGlobalQASupport._GuardianSkillList_1
    SkillList_2 = PaGlobalQASupport._GuardianSkillList_2
  elseif isClassType == __eClassType_Hashashin then
    SkillList_0 = PaGlobalQASupport._HashashinSkillList_0
    SkillList_1 = PaGlobalQASupport._HashashinSkillList_1
    SkillList_2 = PaGlobalQASupport._HashashinSkillList_2
  elseif isClassType == __eClassType_Nova then
    SkillList_0 = PaGlobalQASupport._NovaSkillList_0
    SkillList_1 = PaGlobalQASupport._NovaSkillList_1
    SkillList_2 = PaGlobalQASupport._NovaSkillList_2
  elseif isClassType == __eClassType_Sage then
    SkillList_0 = PaGlobalQASupport._SageSkillList_0
    SkillList_1 = PaGlobalQASupport._SageSkillList_1
    SkillList_2 = PaGlobalQASupport._SageSkillList_2
  elseif isClassType == __eClassType_Corsair then
    SkillList_0 = PaGlobalQASupport._CorsairSkillList_0
    SkillList_1 = PaGlobalQASupport._CorsairSkillList_1
    SkillList_2 = PaGlobalQASupport._CorsairSkillList_2
  elseif isClassType == __eClassType_Drakania then
    SkillList_0 = PaGlobalQASupport._DrakaniaSkillList_0
    SkillList_1 = PaGlobalQASupport._DrakaniaSkillList_1
    SkillList_2 = PaGlobalQASupport._DrakaniaSkillList_2
  elseif isClassType == __eClassType_Giant_Reserved0 then
  elseif isClassType == __eClassType_Giant_Reserved2 then
  elseif isClassType == __eClassType_KunoichiOld then
  end
  if skillType == 0 then
    for index, value in pairs(SkillList_0) do
      luaTimer_AddEvent(ToClient_qaLearnSkill, 150 * index, false, 0, value)
    end
  elseif skillType == 1 then
    for index, value in pairs(SkillList_1) do
      luaTimer_AddEvent(ToClient_qaLearnSkill, 150 * index, false, 0, value)
    end
  elseif skillType == 2 then
    for index, value in pairs(SkillList_2) do
      luaTimer_AddEvent(ToClient_qaLearnSkill, 150 * index, false, 0, value)
    end
  end
end
function toggleTrace()
  _PA_LOG("ì‹ ìŠ¹ê¶Œ", "toggleTrace")
  ToClient_ToggleStateFlag()
  ToClient_SetTraceFlag()
end
function sealAllPet()
  pa_sendMessage("/newpet seal 0")
  pa_sendMessage("/newpet seal 1")
  pa_sendMessage("/newpet seal 2")
  pa_sendMessage("/newpet seal 3")
  pa_sendMessage("/newpet seal 4")
end
local enTimeValue = {
  Second = 1,
  RunningTime = 6,
  StandingTime = 24,
  StandingTime_Half = 12
}
local enCameraValue = {
  UpdateCameraYaw = 0,015,
  SetCameraPich_Low = -0,2,
  SetCameraPich_High = 0,35,
  ForLogAngle = 0,1,
  GoalArea = 300,
  BreakArea = 50
}
local ProcessEnum = {
  eProcessMove = 0,
  eProcessWait = 1,
  eProcessFunc = 2,
  eProcessPosFunc = 3,
  eProcessMovingWait = 4
}
local QASupport = {
  _isOn = false,
  _index = 0,
  _maxIndex = 0,
  _ProcessList = {},
  _oldPositionX = 0,
  _oldPositionY = 0,
  _oldPositionZ = 0,
  _logPositionX = 0,
  _logPositionY = 0,
  _logPositionZ = 0,
  _logCameraYaw = 0,
  _isScopeCapture = false,
  _isWaitting = false,
  _waitTime = 0,
  _goalWaitTime = 0,
  _processQueue = 1
}
function QASupport:goNextProcess()
  self._index = self._index + 1
  if self._maxIndex <= self._index then
    self._isOn = false
    self._index = 0
    self._maxIndex = 0
    self._ProcessList = {}
    self._isWaitting = false
    self._waitTime = 0
    self._goalWaitTime = 0
    self._processQueue = 1
    _PA_LOG("ì‹ ìŠ¹ê¶Œ", "############################ QASupport End!! ####################################")
    return
  end
  if ProcessEnum.eProcessMove == self._ProcessList[self._index]._type then
    local X1 = self._ProcessList[self._index]._goalX
    local Y1 = self._ProcessList[self._index]._goalY
    local Z1 = self._ProcessList[self._index]._goalZ
    local Position = float3(X1, Y1, Z1)
    ToClient_StopNavi()
    ToClient_WorldMapNaviStart(Position, NavigationGuideParam(), false, true)
    ToClient_NaviReStart()
    _PA_LOG("ì‹ ìŠ¹ê¶Œ", "GotoNextPosition:" .. "(" .. X1 .. "," .. Y1 .. "," .. Z1 .. ")")
  elseif ProcessEnum.eProcessWait == self._ProcessList[self._index]._type then
    self._isWaitting = true
    self._waitTime = 0
    self._goalWaitTime = self._ProcessList[self._index]._time
    _PA_LOG("ì‹ ìŠ¹ê¶Œ", "waitTime:" .. self._goalWaitTime)
  elseif ProcessEnum.eProcessFunc == self._ProcessList[self._index]._type then
  elseif ProcessEnum.eProcessPosFunc == self._ProcessList[self._index]._type and false == self._ProcessList[self._index]._isExe then
    _PA_LOG("ì‹ ìŠ¹ê¶Œ", "ì´ë™ì¤‘ì— í•¨ìˆ˜ê°€ ì‹¤í–‰ë˜ì§€ì•Šì•˜ë‹¤!")
  end
end
function QASupport:isArriveGoalbyPosition(X, Y, Z)
  local selfPlayer = getSelfPlayer()
  local nowPositionX = selfPlayer:get():getPositionX()
  local nowPositionY = selfPlayer:get():getPositionY()
  local nowPositionZ = selfPlayer:get():getPositionZ()
  local fixedPositionX = math.abs(X - nowPositionX)
  local fixedPositionY = math.abs(Y - nowPositionY)
  local fixedPositionZ = math.abs(Z - nowPositionZ)
  if fixedPositionX < enCameraValue.GoalArea and fixedPositionY < enCameraValue.GoalArea and fixedPositionZ < enCameraValue.GoalArea then
    return true
  end
  return false
end
function FGlobal_QASupport_addMovePosition(X, Y, Z, strWhere)
  local nowIndex = QASupport._maxIndex
  local tempString = ""
  if nil ~= strWhere then
    tempString = strWhere
  end
  QASupport._maxIndex = QASupport._maxIndex + 1
  QASupport._ProcessList[nowIndex] = {
    _type = ProcessEnum.eProcessMove,
    _goalX = X,
    _goalY = Y,
    _goalZ = Z,
    _where = tempString
  }
end
function FGlobal_QASupport_addWait(time)
  local nowIndex = QASupport._maxIndex
  QASupport._maxIndex = QASupport._maxIndex + 1
  QASupport._ProcessList[nowIndex] = {
    _type = ProcessEnum.eProcessWait,
    _time = time
  }
end
function FGlobal_QASupport_addMovingWaitAndFunc(time, func, param1, param2, param3)
  local nowIndex = QASupport._maxIndex
  QASupport._maxIndex = QASupport._maxIndex + 1
  QASupport._ProcessList[nowIndex] = {
    _type = ProcessEnum.eProcessMovingWait,
    _time = time,
    _func = func,
    _param1 = param1,
    _param2 = param2,
    _param3 = param3
  }
end
function FGlobal_QASupport_addFunc(func, param1, param2, param3)
  local nowIndex = QASupport._maxIndex
  QASupport._maxIndex = QASupport._maxIndex + 1
  QASupport._ProcessList[nowIndex] = {
    _type = ProcessEnum.eProcessFunc,
    _func = func,
    _param1 = param1,
    _param2 = param2,
    _param3 = param3
  }
end
function FGlobal_QASupport_addPositionFunc(X, Y, Z, func, param1, param2, param3)
  local nowIndex = QASupport._maxIndex
  QASupport._maxIndex = QASupport._maxIndex + 1
  QASupport._ProcessList[nowIndex] = {
    _type = ProcessEnum.eProcessPosFunc,
    _goalX = X,
    _goalY = Y,
    _goalZ = Z,
    _func = func,
    _param1 = param1,
    _param2 = param2,
    _param3 = param3,
    _isExe = false
  }
end
function FGlobal_QASupport_Start()
  self = QASupport
  self._index = 0
  self._nowRepeatCount = 0
  self._processQueue = 1
  if ProcessEnum.eProcessMove == self._ProcessList[self._index]._type then
    local X1 = self._ProcessList[self._index]._goalX
    local Y1 = self._ProcessList[self._index]._goalY
    local Z1 = self._ProcessList[self._index]._goalZ
    local Position = float3(X1, Y1, Z1)
    ToClient_StopNavi()
    ToClient_WorldMapNaviStart(Position, NavigationGuideParam(), false, true)
    ToClient_NaviReStart()
  elseif ProcessEnum.eProcessWait == self._ProcessList[self._index]._type then
    self._isWaitting = true
    self._waitTime = 0
    self._goalWaitTime = waitTime
  elseif ProcessEnum.eProcessFunc == self._ProcessList[self._index]._type then
    self._ProcessList[self._index]._func(self._ProcessList[self._index]._param1, self._ProcessList[self._index]._param2, self._ProcessList[self._index]._param3)
  end
  _PA_LOG("ì‹ ìŠ¹ê¶Œ", "self._processQueue = " .. self._processQueue)
  _PA_LOG("ì‹ ìŠ¹ê¶Œ", "############################ QASupport Start!! ####################################")
  QASupport._isOn = true
end
function QASupport:positionCheck(deltaTime)
  if self._maxIndex <= 0 then
    return false
  end
  local X = self._ProcessList[self._index]._goalX
  local Y = self._ProcessList[self._index]._goalY
  local Z = self._ProcessList[self._index]._goalZ
  local NowWhere = self._ProcessList[self._index]._where
  local selfPlayer = getSelfPlayer()
  if self._index + self._processQueue < self._maxIndex then
    local nextProcess = self._ProcessList[self._index + self._processQueue]
    if nextProcess._type == ProcessEnum.eProcessPosFunc and false == nextProcess._isExe then
      local X = nextProcess._goalX
      local Y = nextProcess._goalY
      local Z = nextProcess._goalZ
      if true == self:isArriveGoalbyPosition(X, Y, Z) then
        nextProcess._func(nextProcess._param1, nextProcess._param2, nextProcess._param3)
        nextProcess._isExe = true
        self._processQueue = self._processQueue + 1
        _PA_LOG("ì‹ ìŠ¹ê¶Œ", "self._processQueue = " .. self._processQueue)
      end
    end
    if nextProcess._type == ProcessEnum.eProcessMovingWait then
      if false == self._isWaitting then
        self._isWaitting = true
        self._waitTime = 0
        self._goalWaitTime = nextProcess._time
      else
        self._waitTime = self._waitTime + deltaTime
        if self._goalWaitTime < self._waitTime then
          nextProcess._func(nextProcess._param1, nextProcess._param2, nextProcess._param3)
          self._isWaitting = false
          self._waitTime = 0
          self._goalWaitTime = 0
          self._processQueue = self._processQueue + 1
          _PA_LOG("ì‹ ìŠ¹ê¶Œ", "self._processQueue = " .. self._processQueue)
        end
      end
    end
  end
  if true == self:isArriveGoalbyPosition(X, Y, Z) then
    _PA_LOG("ì‹ ìŠ¹ê¶Œ", "GoalByPosition")
    ToClient_StopNavi()
    self._processQueue = 1
    return true
  end
  return false
end
function QASupport:waitTimeCheck(deltaTime)
  if false == self._isWaitting then
    return true
  end
  self._waitTime = self._waitTime + deltaTime
  if self._waitTime < self._goalWaitTime then
    return false
  end
  self._isWaitting = false
  self._waitTime = 0
  self._goalWaitTime = 0
  return true
end
local processWaitTime = 0
function QASupport_UpdatePerFrame(deltaTime)
  local self = QASupport
  local processTerm = 0,2
  if false == self._isOn then
    return
  end
  local gotoNext = false
  if ProcessEnum.eProcessMove == self._ProcessList[self._index]._type and processTerm < processWaitTime then
    gotoNext = QASupport:positionCheck(deltaTime)
  elseif ProcessEnum.eProcessWait == self._ProcessList[self._index]._type then
    gotoNext = QASupport:waitTimeCheck(deltaTime)
  elseif ProcessEnum.eProcessFunc == self._ProcessList[self._index]._type then
    gotoNext = true
    self._ProcessList[self._index]._func(self._ProcessList[self._index]._param1, self._ProcessList[self._index]._param2, self._ProcessList[self._index]._param3)
  elseif ProcessEnum.eProcessPosFunc == self._ProcessList[self._index]._type or ProcessEnum.eProcessMovingWait == self._ProcessList[self._index]._type then
    gotoNext = true
  end
  if true == gotoNext then
    QASupport:goNextProcess()
    processWaitTime = 0
  end
  processWaitTime = processWaitTime + deltaTime
end
local count = 0
function sayYea()
  chatting_sendMessage("", "í…ŒìŠ¤íŠ¸~" .. count, CppEnums.ChatType.Public)
  count = count + 1
end
function sayMove()
  chatting_sendMessage("", "ë§ˆêµ¿ê°„ì§€ê¸°ì•ì„ì§€ë‚œë‹¤", CppEnums.ChatType.Public)
end
function sayMove2()
  chatting_sendMessage("", "ì¹¼í˜ì˜¨ì— ì…ì„±í–ˆë‹¤.", CppEnums.ChatType.Public)
end
function sayMove3()
  chatting_sendMessage("", "í”„ë¡œíŒŒì¼ì‹œì‘", CppEnums.ChatType.Public)
  toggleTrace()
end
function sayWatting1()
  chatting_sendMessage("", "4ì´ˆê²½ê³¼ í”„ë¡œíŒŒì¼ ë", CppEnums.ChatType.Public)
  toggleTrace()
end
function SummonMonster()
end
function testAutoMoveStart()
  if nil == runningTime then
    runningTime = 5
  end
  if nil == standingTime then
    standingTime = 10
  end
  FGlobal_QASupport_addFunc(pa_sendMessage, "/create item 720710 1")
  FGlobal_QASupport_addMovePosition(-255592,234375, -2507,007734, -25550,748047)
  FGlobal_QASupport_addWait(1)
  local monsterKey = 21135
  local monsterCount = 10
  FGlobal_QASupport_addFunc(PaGlobal_PetList_ReverseAllUnSeal_ForQA)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° ì†Œí™˜", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/create monster " .. monsterKey .. " " .. monsterCount)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° í‚¬", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/killNearAllMonster")
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ì‹œì‘", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addWait(5)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ë", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(sealAllPet)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° ë£¨íŒ… í”„ë¡œíŒŒì¼ ì™„ë£Œ ì´ë™ ì‹œì‘", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/create item 720710 1")
  FGlobal_QASupport_addMovePosition(-244949,078125, -3092,061035, -43628,03125)
  FGlobal_QASupport_addPositionFunc(-252103,265625, -2868,881104, -39513,242188, sayMove3)
  FGlobal_QASupport_addMovingWaitAndFunc(4, sayWatting1)
  FGlobal_QASupport_Start()
end
function testSkillStart()
  if nil == runningTime then
    runningTime = 5
  end
  if nil == standingTime then
    standingTime = 10
  end
  local monsterKey = 999
  local monsterCount = 3
  selfPlayerSetCameraPich(-1)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° ì†Œí™˜", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/create monster " .. monsterKey .. " " .. monsterCount)
  FGlobal_QASupport_addWait(2)
  FGlobal_QASupport_addFunc(ToClient_ChangeCameraToMonster, monsterKey)
  FGlobal_QASupport_addWait(1)
  FGlobal_QASupport_addFunc(ToClient_InputPhotoModeFromLua)
  FGlobal_QASupport_addWait(1)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ì ì‹œ í”„ë ˆì„ì•ˆì •í™” ëŒ€ê¸°", CppEnums.ChatType.Public)
  FGlobal_QASupport_addWait(10)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ì‹œì‘", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯1 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 0)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯2 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 1)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯3 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 2)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° í‚¬", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/killNearAllMonster")
  FGlobal_QASupport_addWait(5)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ë", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(ToClient_InputPhotoModeFromLua)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_Start()
end
function testSkillCase1()
  local monsterKey = 999
  local monsterCount = 10
  selfPlayerSetCameraPich(-2)
  FGlobal_QASupport_addFunc(PaGlobal_PetList_ReverseAllUnSeal_ForQA)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° ì†Œí™˜", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/create monster " .. monsterKey .. " " .. monsterCount)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ì‹œì‘", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ìŠ¤í‚¬ ì“°ëŠ” ë™ì•ˆ ëŒ€ê¸°", CppEnums.ChatType.Public)
  FGlobal_QASupport_addWait(9)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° í‚¬", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(pa_sendMessage, "/killNearAllMonster")
  FGlobal_QASupport_addWait(5)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ë", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(sealAllPet)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_Start()
end
function testSkillCase2()
  local monsterKey = 999
  local monsterCount = 10
  selfPlayerSetCameraPich(-2)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "ëª¬ìŠ¤í„° ì†Œí™˜ ì•ˆí•˜ê³  í…ŒìŠ¤íŠ¸", CppEnums.ChatType.Public)
  FGlobal_QASupport_addWait(2)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ì‹œì‘", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯1 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 0)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯2 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 1)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "í€µìŠ¬ë¡¯3 ì‚¬ìš©", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(quickSlot_UseSlot, 2)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_addWait(5)
  FGlobal_QASupport_addFunc(chatting_sendMessage, "", "íŠ¸ë ˆì´ìŠ¤ë", CppEnums.ChatType.Public)
  FGlobal_QASupport_addFunc(toggleTrace)
  FGlobal_QASupport_addWait(3)
  FGlobal_QASupport_Start()
end
function testChatMacro()
  local chatTypeList = {
    [CppEnums.ChatType.Notice] = "ê³µì§€",
    [CppEnums.ChatType.Guild] = "ê¸¸ë“œ"
  }
  local sendCount = 1000
  for ii = 0, sendCount - 1 do
    for key, value in pairs(chatTypeList) do
      chatting_sendMessage("", "[" .. value .. "] ii = " .. tostring(ii) .. "ì±„íŒ… ë©”í¬ë¡œ í…ŒìŠ¤íŠ¸", key)
    end
  end
end
