PaGlobal_AwakeningSuccession = {
  _ui = {
    _btn_left_awakening = UI.getChildControl(Panel_Widget_Awakening_Succession_Select_All, "RadioButton_Awakening_Tab"),
    _btn_right_succession = UI.getChildControl(Panel_Widget_Awakening_Succession_Select_All, "RadioButton_Succession_Tab"),
    _btn_confirm = UI.getChildControl(Panel_Widget_Awakening_Succession_Select_All, "Button_Select"),
    _stc_console_keyguides = UI.getChildControl(Panel_Widget_Awakening_Succession_Select_All, "Static_ConsoleUI_KeyGuide")
  },
  _leftInfo = {
    _stc_characterTexture = nil,
    _stc_WeaponTypeValue = nil,
    _stc_CombatTypeValue = nil,
    _stc_Desc = nil
  },
  _rightInfo = {
    _stc_characterTexture = nil,
    _stc_WeaponTypeValue = nil,
    _stc_CombatTypeValue = nil,
    _stc_Desc = nil
  },
  _processInfo = {_isWatingClearSkillResult = false, _requestSkillType = nil},
  _texturePath = "Combine/Etc/",
  _awakenTextureFileName = {
    [__eClassType_Warrior] = "Combine_Etc_ClassSelect_Awaken_Warrior.dds",
    [__eClassType_ElfRanger] = "Combine_Etc_ClassSelect_Awaken_Ranger.dds",
    [__eClassType_Sorcerer] = "Combine_Etc_ClassSelect_Awaken_Sorceress.dds",
    [__eClassType_Giant] = "Combine_Etc_ClassSelect_Awaken_Berserker.dds",
    [__eClassType_Tamer] = "Combine_Etc_ClassSelect_Awaken_Tamar.dds",
    [__eClassType_BladeMaster] = "Combine_Etc_ClassSelect_Awaken_Musa.dds",
    [__eClassType_BladeMasterWoman] = "Combine_Etc_ClassSelect_Awaken_Maewha.dds",
    [__eClassType_Valkyrie] = "Combine_Etc_ClassSelect_Awaken_Valkyrie.dds",
    [__eClassType_Kunoichi] = "Combine_Etc_ClassSelect_Awaken_Kunoichi.dds",
    [__eClassType_KunoichiOld] = "Combine_Etc_ClassSelect_Awaken_Kunoichi.dds",
    [__eClassType_NinjaMan] = "Combine_Etc_ClassSelect_Awaken_Ninja.dds",
    [__eClassType_WizardMan] = "Combine_Etc_ClassSelect_Awaken_Wizard.dds",
    [__eClassType_WizardWoman] = "Combine_Etc_ClassSelect_Awaken_Witch.dds",
    [__eClassType_DarkElf] = "Combine_Etc_ClassSelect_Awaken_DK.dds",
    [__eClassType_Combattant] = "Combine_Etc_ClassSelect_Awaken_Striker.dds",
    [__eClassType_Mystic] = "Combine_Etc_ClassSelect_Awaken_Mystic.dds",
    [__eClassType_Lhan] = "Combine_Etc_ClassSelect_Awaken_Lahn.dds",
    [__eClassType_RangerMan] = "Combine_Etc_ClassSelect_Awaken_Archer.dds",
    [__eClassType_ShyWaman] = "Combine_Etc_ClassSelect_Awaken_Shai.dds",
    [__eClassType_Guardian] = "Combine_Etc_ClassSelect_Awaken_Guardian.dds",
    [__eClassType_Hashashin] = "Combine_Etc_ClassSelect_Awaken_Hashashin.dds",
    [__eClassType_Nova] = "Combine_Etc_ClassSelect_Awaken_Nova.dds",
    [__eClassType_Sage] = "Combine_Etc_ClassSelect_Awaken_Sage.dds",
    [__eClassType_Corsair] = "Combine_Etc_ClassSelect_Awaken_PFW.dds"
  },
  _awakenInfo = {
    [__eClassType_Warrior] = {
      _weaponType = "LUA_WARRIOR_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_WARRIOR_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_WARRIOR_AWAKEN_DESC"
    },
    [__eClassType_ElfRanger] = {
      _weaponType = "LUA_RANGER_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_RANGER_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_RANGER_AWAKEN_DESC"
    },
    [__eClassType_Sorcerer] = {
      _weaponType = "LUA_SORCERER_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_SORCERER_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_SORCERER_AWAKEN_DESC"
    },
    [__eClassType_Giant] = {
      _weaponType = "LUA_GIANT_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_GIANT_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_GIANT_AWAKEN_DESC"
    },
    [__eClassType_Tamer] = {
      _weaponType = "LUA_TAMER_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_TAMER_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_TAMER_AWAKEN_DESC"
    },
    [__eClassType_BladeMaster] = {
      _weaponType = "LUA_MUSA_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_MUSA_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_MUSA_AWAKEN_DESC"
    },
    [__eClassType_BladeMasterWoman] = {
      _weaponType = "LUA_MAEWHA_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_MAEWHA_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_MAEWHA_AWAKEN_DESC"
    },
    [__eClassType_Valkyrie] = {
      _weaponType = "LUA_VALKYRIE_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_VALKYRIE_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_VALKYRIE_AWAKEN_DESC"
    },
    [__eClassType_Kunoichi] = {
      _weaponType = "LUA_KUNOICHI_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_KUNOICHI_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_KUNOICHI_AWAKEN_DESC"
    },
    [__eClassType_KunoichiOld] = {
      _weaponType = "LUA_KUNOICHI_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_KUNOICHI_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_KUNOICHI_AWAKEN_DESC"
    },
    [__eClassType_NinjaMan] = {
      _weaponType = "LUA_NINJA_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_NINJA_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_NINJA_AWAKEN_DESC"
    },
    [__eClassType_WizardMan] = {
      _weaponType = "LUA_WIZARD_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_WIZARD_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_WIZARD_AWAKEN_DESC"
    },
    [__eClassType_WizardWoman] = {
      _weaponType = "LUA_WITCH_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_WITCH_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_WITCH_AWAKEN_DESC"
    },
    [__eClassType_DarkElf] = {
      _weaponType = "LUA_DARKKNIGHT_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_DARKKNIGHT_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_DARKKNIGHT_AWAKEN_DESC"
    },
    [__eClassType_Combattant] = {
      _weaponType = "LUA_COMBATTANT_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_COMBATTANT_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_COMBATTANT_AWAKEN_DESC"
    },
    [__eClassType_Mystic] = {
      _weaponType = "LUA_MYSTIC_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_MYSTIC_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_MYSTIC_AWAKEN_DESC"
    },
    [__eClassType_Lhan] = {
      _weaponType = "LUA_LHAN_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_LHAN_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_LHAN_AWAKEN_DESC"
    },
    [__eClassType_RangerMan] = {
      _weaponType = "LUA_ARCHER_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_ARCHER_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_ARCHER_AWAKEN_DESC"
    },
    [__eClassType_ShyWaman] = {
      _weaponType = "LUA_SHAI_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_SHAI_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_SHAI_AWAKEN_DESC"
    },
    [__eClassType_Guardian] = {
      _weaponType = "LUA_GUARDIAN_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_GUARDIAN_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_GUARDIAN_AWAKEN_DESC"
    },
    [__eClassType_Hashashin] = {
      _weaponType = "LUA_HASHASHIN_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_HASHASHIN_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_HASHASHIN_AWAKEN_DESC"
    },
    [__eClassType_Nova] = {
      _weaponType = "LUA_NOVA_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_NOVA_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_NOVA_AWAKEN_DESC"
    },
    [__eClassType_Sage] = {
      _weaponType = "LUA_SAGE_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_SAGE_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_SAGE_AWAKEN_DESC"
    },
    [__eClassType_Corsair] = {
      _weaponType = "LUA_CORSAIR_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_CORSAIR_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_CORSAIR_AWAKEN_DESC"
    },
    [__eClassType_Drakania] = {
      _weaponType = "LUA_DRAKANIA_AWAKEN_WEAPON_TYPE",
      _combatType = "LUA_DRAKANIA_AWAKEN_COMBAT_TYPE",
      _desc = "LUA_DRAKANIA_AWAKEN_DESC"
    }
  },
  _successionTextureFileName = {
    [__eClassType_Warrior] = "Combine_Etc_ClassSelect_Succesion_Warrior.dds",
    [__eClassType_ElfRanger] = "Combine_Etc_ClassSelect_Succesion_Ranger.dds",
    [__eClassType_Sorcerer] = "Combine_Etc_ClassSelect_Succesion_Sorceress.dds",
    [__eClassType_Giant] = "Combine_Etc_ClassSelect_Succesion_Berserker.dds",
    [__eClassType_Tamer] = "Combine_Etc_ClassSelect_Succesion_Tamar.dds",
    [__eClassType_BladeMaster] = "Combine_Etc_ClassSelect_Succesion_Musa.dds",
    [__eClassType_BladeMasterWoman] = "Combine_Etc_ClassSelect_Succesion_Maewha.dds",
    [__eClassType_Valkyrie] = "Combine_Etc_ClassSelect_Succesion_Valkyrie.dds",
    [__eClassType_Kunoichi] = "Combine_Etc_ClassSelect_Succesion_Kunoichi.dds",
    [__eClassType_KunoichiOld] = "Combine_Etc_ClassSelect_Succesion_Kunoichi.dds",
    [__eClassType_NinjaMan] = "Combine_Etc_ClassSelect_Succesion_Ninja.dds",
    [__eClassType_WizardMan] = "Combine_Etc_ClassSelect_Succesion_Wizard.dds",
    [__eClassType_WizardWoman] = "Combine_Etc_ClassSelect_Succesion_Witch.dds",
    [__eClassType_DarkElf] = "Combine_Etc_ClassSelect_Succesion_DK.dds",
    [__eClassType_Combattant] = "Combine_Etc_ClassSelect_Succesion_Striker.dds",
    [__eClassType_Mystic] = "Combine_Etc_ClassSelect_Succesion_Mystic.dds",
    [__eClassType_Lhan] = "Combine_Etc_ClassSelect_Succesion_Lahn.dds",
    [__eClassType_RangerMan] = "Combine_Etc_ClassSelect_Succesion_Archer.dds",
    [__eClassType_ShyWaman] = "Combine_Etc_ClassSelect_Succesion_Shai.dds",
    [__eClassType_Guardian] = "Combine_Etc_ClassSelect_Succesion_Guardian.dds",
    [__eClassType_Hashashin] = "Combine_Etc_ClassSelect_Succesion_Hashashin.dds",
    [__eClassType_Nova] = "Combine_Etc_ClassSelect_Succesion_Nova.dds",
    [__eClassType_Sage] = "Combine_Etc_ClassSelect_Succesion_Sage.dds",
    [__eClassType_Corsair] = "Combine_Etc_ClassSelect_Succesion_PFW.dds"
  },
  _successionInfo = {
    [__eClassType_Warrior] = {
      _weaponType = "LUA_WARRIOR_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_WARRIOR_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_WARRIOR_SUCCESSION_DESC"
    },
    [__eClassType_ElfRanger] = {
      _weaponType = "LUA_RANGER_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_RANGER_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_RANGER_SUCCESSION_DESC"
    },
    [__eClassType_Sorcerer] = {
      _weaponType = "LUA_SORCERER_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_SORCERER_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_SORCERER_SUCCESSION_DESC"
    },
    [__eClassType_Giant] = {
      _weaponType = "LUA_GIANT_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_GIANT_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_GIANT_SUCCESSION_DESC"
    },
    [__eClassType_Tamer] = {
      _weaponType = "LUA_TAMER_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_TAMER_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_TAMER_SUCCESSION_DESC"
    },
    [__eClassType_BladeMaster] = {
      _weaponType = "LUA_MUSA_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_MUSA_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_MUSA_SUCCESSION_DESC"
    },
    [__eClassType_BladeMasterWoman] = {
      _weaponType = "LUA_MAEWHA_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_MAEWHA_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_MAEWHA_SUCCESSION_DESC"
    },
    [__eClassType_Valkyrie] = {
      _weaponType = "LUA_VALKYRIE_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_VALKYRIE_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_VALKYRIE_SUCCESSION_DESC"
    },
    [__eClassType_Kunoichi] = {
      _weaponType = "LUA_KUNOICHI_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_KUNOICHI_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_KUNOICHI_SUCCESSION_DESC"
    },
    [__eClassType_KunoichiOld] = {
      _weaponType = "LUA_KUNOICHI_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_KUNOICHI_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_KUNOICHI_SUCCESSION_DESC"
    },
    [__eClassType_NinjaMan] = {
      _weaponType = "LUA_NINJA_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_NINJA_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_NINJA_SUCCESSION_DESC"
    },
    [__eClassType_WizardMan] = {
      _weaponType = "LUA_WIZARD_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_WIZARD_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_WIZARD_SUCCESSION_DESC"
    },
    [__eClassType_WizardWoman] = {
      _weaponType = "LUA_WITCH_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_WITCH_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_WITCH_SUCCESSION_DESC"
    },
    [__eClassType_DarkElf] = {
      _weaponType = "LUA_DARKKNIGHT_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_DARKKNIGHT_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_DARKKNIGHT_SUCCESSION_DESC"
    },
    [__eClassType_Combattant] = {
      _weaponType = "LUA_COMBATTANT_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_COMBATTANT_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_COMBATTANT_SUCCESSION_DESC"
    },
    [__eClassType_Mystic] = {
      _weaponType = "LUA_MYSTIC_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_MYSTIC_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_MYSTIC_SUCCESSION_DESC"
    },
    [__eClassType_Lhan] = {
      _weaponType = "LUA_LHAN_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_LHAN_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_LHAN_SUCCESSION_DESC"
    },
    [__eClassType_RangerMan] = {
      _weaponType = "LUA_ARCHER_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_ARCHER_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_ARCHER_SUCCESSION_DESC"
    },
    [__eClassType_ShyWaman] = {
      _weaponType = "LUA_SHAI_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_SHAI_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_SHAI_SUCCESSION_DESC"
    },
    [__eClassType_Guardian] = {
      _weaponType = "LUA_GUARDIAN_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_GUARDIAN_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_GUARDIAN_SUCCESSION_DESC"
    },
    [__eClassType_Hashashin] = {
      _weaponType = "LUA_HASHASHIN_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_HASHASHIN_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_HASHASHIN_SUCCESSION_DESC"
    },
    [__eClassType_Nova] = {
      _weaponType = "LUA_NOVA_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_NOVA_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_NOVA_SUCCESSION_DESC"
    },
    [__eClassType_Sage] = {
      _weaponType = "LUA_SAGE_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_WIZARD_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_SAGE_SUCCESSION_DESC"
    },
    [__eClassType_Corsair] = {
      _weaponType = "LUA_CORSAIR_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_COMBATTANT_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_CORSAIR_SUCCESSION_DESC"
    },
    [__eClassType_Drakania] = {
      _weaponType = "LUA_PQW_SUCCESSION_WEAPON_TYPE",
      _combatType = "LUA_COMBATTANT_SUCCESSION_COMBAT_TYPE",
      _desc = "LUA_PQW_SUCCESSION_DESC"
    }
  },
  _isConsole = false,
  _initialize = false
}
runLua("UI_Data/Script/Widget/Awakening_Succession/Panel_Awakening_Succession_1.lua")
runLua("UI_Data/Script/Widget/Awakening_Succession/Panel_Awakening_Succession_2.lua")
registerEvent("FromClient_luaLoadComplete", "FromClient_AwakeningSuccessionInit")
function FromClient_AwakeningSuccessionInit()
  PaGlobal_AwakeningSuccession:initialize()
end
