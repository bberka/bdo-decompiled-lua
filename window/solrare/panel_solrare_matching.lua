PaGlobal_Solrare_Matching = {
  _ui = {
    _btn_Close = nil,
    _btn_Wiki = nil,
    _stc_RankIcon = nil,
    _txt_Tier = nil,
    _txt_RankRating = nil,
    _stc_ClassIcon = nil,
    _txt_Level = nil,
    _txt_Name = nil,
    _txt_Ranking = nil,
    _txt_RecentRecord = nil,
    _btn_RankGameReq = nil,
    _btn_NormalGameReq = nil,
    _txt_NoRecord = nil,
    _frameContent = nil,
    _frameRecentInfoList = nil,
    _frameVertiScroll = nil,
    _txt_MatchingState = nil,
    _stc_TierListBg = nil,
    _btn_MatchingCancel = nil,
    _btn_Equip = nil,
    _btn_TierList = nil,
    _btn_Rules = nil,
    _txt_TierListTable = {},
    _txt_MatchingElapsedTime = nil,
    _btn_Ranking = nil,
    _btn_CoinShop = nil
  },
  _frameControlList = Array.new(),
  _recordNumberList = Array.new(),
  _recentInfoList = {},
  _recentInfoCount = 0,
  _maxShowRecentInfoCount = 20,
  _selectedRecentRecordIndex = -1,
  _isConsole = false,
  _initialize = false,
  _normalBgSize = 0,
  _detailBgSize = 0,
  _matchingDelayTime = 2,
  _matchingTime = 0,
  _matchingCloseTime = 0,
  _maxTierCount = 21,
  _currentDeltaTime = 0,
  _currentElapsedTime = 0
}
registerEvent("FromClient_luaLoadComplete", "FromClient_Solrare_Matching_Init")
function FromClient_Solrare_Matching_Init()
  PaGlobal_Solrare_Matching:initialize()
end
function PaGlobal_Solrare_Matching:initialize()
  if true == PaGlobal_Solrare_Matching._initialize or nil == Panel_Window_Solrare_Matching then
    return
  end
  local titleBg = UI.getChildControl(Panel_Window_Solrare_Matching, "Static_Title_Bg")
  self._ui._btn_Close = UI.getChildControl(titleBg, "Button_Close")
  self._ui._btn_Wiki = UI.getChildControl(titleBg, "Button_Guide")
  local topBg = UI.getChildControl(Panel_Window_Solrare_Matching, "Static_Top")
  local rankBg = UI.getChildControl(topBg, "Static_Rank_Wrap")
  self._ui._stc_RankIcon = UI.getChildControl(rankBg, "Static_Rank_Icon")
  self._ui._txt_Tier = UI.getChildControl(rankBg, "StaticText_Tier")
  self._ui._txt_RankRating = UI.getChildControl(rankBg, "StaticText_Score")
  local profileBg = UI.getChildControl(topBg, "Static_Profile")
  self._ui._stc_ClassIcon = UI.getChildControl(profileBg, "Static_Profile_Icon")
  self._ui._txt_Level = UI.getChildControl(profileBg, "StaticText_LV")
  self._ui._txt_Name = UI.getChildControl(profileBg, "StaticText_Name")
  self._ui._txt_Ranking = UI.getChildControl(profileBg, "StaticText_My_Ranking")
  self._ui._txt_RecentRecord = UI.getChildControl(profileBg, "StaticText_My_Fight_Record")
  self._ui._btn_RankGameReq = UI.getChildControl(topBg, "Button_Find_Match")
  self._ui._btn_NormalGameReq = UI.getChildControl(topBg, "Button_NormalGame_Match")
  self._ui._btn_Equip = UI.getChildControl(topBg, "Button_Equip")
  self._ui._btn_TierList = UI.getChildControl(topBg, "Static_Tierlist_Btn")
  self._ui._btn_Rules = UI.getChildControl(topBg, "Button_Guide")
  self._ui._btn_Ranking = UI.getChildControl(topBg, "Button_Ranking")
  self._ui._txt_NoRecord = UI.getChildControl(Panel_Window_Solrare_Matching, "StaticText_NoRecord")
  self._isConsole = _ContentsGroup_RenewUI
  self._ui._frameRecentInfoList = UI.getChildControl(Panel_Window_Solrare_Matching, "Frame_1")
  self._ui._stc_TierListBg = UI.getChildControl(Panel_Window_Solrare_Matching, "Static_TierList_BG")
  self._ui._btn_CoinShop = UI.getChildControl(topBg, "Button_CoinShop")
  self._ui._btn_CoinShop:SetShow(false)
  for idx = 0, self._maxTierCount do
    local txt_Tier = UI.getChildControl(self._ui._stc_TierListBg, "StaticText_Tier_" .. tostring(idx))
    self._ui._txt_TierListTable[idx] = txt_Tier
  end
  self._ui._frameContent = UI.getChildControl(self._ui._frameRecentInfoList, "Frame_1_Content")
  self._ui._frameVertiScroll = UI.getChildControl(self._ui._frameRecentInfoList, "Frame_1_VerticalScroll")
  self._ui._txt_MatchingState = UI.getChildControl(Panel_Window_Solare_Finding_Match, "StaticText_Loading")
  self._ui._btn_MatchingCancel = UI.getChildControl(Panel_Window_Solare_Finding_Match, "Button_Cancel")
  self._ui._txt_MatchingElapsedTime = UI.getChildControl(Panel_Window_Solare_Finding_Match, "StaticText_Time")
  self._ui._btn_RankGameReq:SetTextMode(__eTextMode_AutoWrap)
  self._ui._btn_RankGameReq:SetText(self._ui._btn_RankGameReq:GetText())
  self._ui._btn_NormalGameReq:SetTextMode(__eTextMode_AutoWrap)
  self._ui._btn_NormalGameReq:SetText(self._ui._btn_NormalGameReq:GetText())
  PaGlobal_Solrare_Matching:registEventHandler()
  PaGlobal_Solrare_Matching:swichPlatform(self._isConsole)
  PaGlobal_Solrare_Matching:createFrameControl()
  PaGlobal_Solrare_Matching._initialize = true
end
function PaGlobal_Solrare_Matching:registEventHandler()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  self._ui._btn_Close:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_Matching_Close()")
  self._ui._btn_RankGameReq:addInputEvent("Mouse_LUp", "HandleEventLUp_Solrare_JoinRankMatching()")
  self._ui._btn_NormalGameReq:addInputEvent("Mouse_LUp", "HandleEventLUp_Solrare_NormalMatching()")
  if true == ToClient_IsDevelopment() then
    self._ui._btn_RankGameReq:addInputEvent("Mouse_On", "HandleEventOnOut_Solrare_AccumulateTime(true)")
    self._ui._btn_RankGameReq:addInputEvent("Mouse_Out", "HandleEventOnOut_Solrare_AccumulateTime(false)")
  end
  self._ui._btn_MatchingCancel:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_MatchingState_PrepareClose()")
  self._ui._btn_Equip:addInputEvent("Mouse_LUp", "PaGlobalFunc_PaGlobal_Solare_EquipPreset_Open()")
  self._ui._btn_TierList:addInputEvent("Mouse_On", "PaGlobalFunc_PaGlobal_Solare_EquipPreset_TierListShow(true)")
  self._ui._btn_TierList:addInputEvent("Mouse_Out", "PaGlobalFunc_PaGlobal_Solare_EquipPreset_TierListShow(false)")
  self._ui._btn_Wiki:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Solare\" )")
  self._ui._btn_Rules:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Solare\" )")
  self._ui._btn_Ranking:addInputEvent("Mouse_LUp", "HandleEventLUp_MenuRemake_SolrareRankingOpen()")
  registerEvent("FromClient_SolareRecentRecordLoad", "FromClient_SolareRecentRecordLoad")
  registerEvent("FromClient_SolareNeedSettingEquipPresetAck", "FromClient_SolareNeedSettingEquipPresetAck")
end
function PaGlobal_Solrare_Matching:swichPlatform(isConsole)
  if true == isConsole then
  else
  end
end
function PaGlobal_Solrare_Matching:createFrameControl()
  local frameContentOriginal = UI.getChildControl(self._ui._frameContent, "Static_1")
  self._normalBgSize = frameContentOriginal:GetSizeY()
  self._detailBgSize = UI.getChildControl(frameContentOriginal, "Static_Detail_BG"):GetSizeY()
  for idx = 1, self._maxShowRecentInfoCount do
    local tempTable = {
      _mainBg = nil,
      _checkButtonBg = nil,
      _line_Win = nil,
      _line_Lose = nil,
      _line_Draw = nil,
      _txt_Escape = nil,
      _txt_ResultWithRate = nil,
      _stc_RoundResult = nil,
      _txt_PlayTime = nil,
      _chk_ShowDetail = nil,
      _ATeamClassWithTier = Array.new(),
      _BTeamClassWithTier = Array.new(),
      _detailBg = nil,
      _ATeamDetail = Array.new(),
      _BTeamDetail = Array.new(),
      _isDetailControlShow = false,
      _stc_MVP = nil,
      _stc_Ace = nil,
      _stc_recordTime = nil,
      _txt_isWinStreak = nil
    }
    tempTable._mainBg = UI.cloneControl(frameContentOriginal, self._ui._frameContent, "Copied_FrameContent_RecentInfo" .. tostring(idx))
    tempTable._mainBg:SetPosXY(tempTable._mainBg:GetPosX(), (tempTable._mainBg:GetPosY() + tempTable._mainBg:GetSizeY() + 3) * (idx - 1))
    tempTable._mainBg:SetShow(false)
    tempTable._checkButtonBg = UI.getChildControl(tempTable._mainBg, "CheckButton_Bg")
    tempTable._line_Win = UI.getChildControl(tempTable._checkButtonBg, "Static_Win")
    tempTable._line_Lose = UI.getChildControl(tempTable._checkButtonBg, "Static_Lose")
    tempTable._line_Draw = UI.getChildControl(tempTable._checkButtonBg, "Static_Tie")
    tempTable._txt_Escape = UI.getChildControl(tempTable._checkButtonBg, "StaticText_Escape")
    tempTable._txt_ResultWithRate = UI.getChildControl(tempTable._checkButtonBg, "StaticText_Win")
    tempTable._stc_RoundResult = UI.getChildControl(tempTable._checkButtonBg, "Static_RecordArea")
    tempTable._txt_PlayTime = UI.getChildControl(tempTable._checkButtonBg, "StaticText_PlayTime")
    tempTable._stc_recordTime = UI.getChildControl(tempTable._checkButtonBg, "StaticText_Date")
    tempTable._txt_isWinStreak = UI.getChildControl(tempTable._checkButtonBg, "StaticText_SuccWin")
    tempTable._chk_ShowDetail = UI.getChildControl(tempTable._checkButtonBg, "CheckButton_Show_Detail")
    tempTable._chk_ShowDetail:SetShow(true)
    tempTable._chk_ShowDetail:addInputEvent("Mouse_LUp", "HandleEventLUp_Solrare_ShowDetailToggle(" .. tostring(idx) .. ")")
    tempTable._chk_ShowDetail:setNotImpactScrollEvent(true)
    local stc_MyTeam = UI.getChildControl(tempTable._checkButtonBg, "Static_MyTeam")
    local stc_EnemyTeam = UI.getChildControl(tempTable._checkButtonBg, "Static_EnemyTeam")
    tempTable._detailBg = UI.getChildControl(tempTable._mainBg, "Static_Detail_BG")
    tempTable._detailBg:SetShow(false)
    local stc_MyTeamDetail = UI.getChildControl(tempTable._detailBg, "Static_MyTeam")
    local stc_EnemyTeamDetail = UI.getChildControl(tempTable._detailBg, "Static_EnemyTeam")
    local txt_MyTitleTeam = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_Team")
    local txt_MyTitleKDA = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_KDA")
    local txt_MyTitleHeal = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_Heal")
    local txt_MyTitleHarm = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_Harm")
    local txt_MyTitleDamage = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_Damage")
    local txt_MyTitleCCCount = UI.getChildControl(stc_MyTeamDetail, "StaticText_Title_CCCount")
    local txt_Title_Team = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_Team")
    local txt_Title_KDA = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_KDA")
    local txt_Title_Heal = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_Heal")
    local txt_Title_Harm = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_Harm")
    local txt_Title_Damage = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_Damage")
    local txt_Title_CCCount = UI.getChildControl(stc_EnemyTeamDetail, "StaticText_Title_CCCount")
    UI.setLimitTextAndAddTooltip(txt_MyTitleTeam, txt_MyTitleTeam:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_MyTitleKDA, txt_MyTitleKDA:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_MyTitleHeal, txt_MyTitleHeal:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_MyTitleHarm, txt_MyTitleHarm:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_MyTitleDamage, txt_MyTitleDamage:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_Team, txt_Title_Team:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_KDA, txt_Title_KDA:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_Heal, txt_Title_Heal:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_Harm, txt_Title_Harm:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_Damage, txt_Title_Damage:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_MyTitleCCCount, txt_MyTitleCCCount:GetText(), "")
    UI.setLimitTextAndAddTooltip(txt_Title_CCCount, txt_Title_CCCount:GetText(), "")
    for idx = 1, 3 do
      local tempA = {_classBg = nil, _tierBg = nil}
      local tempB = {_classBg = nil, _tierBg = nil}
      local stc_ATeamClass = UI.getChildControl(stc_MyTeam, "Static_Profile_Icon_" .. tostring(idx))
      local stc_ATeamTier = UI.getChildControl(stc_MyTeam, "Static_TierIcon_" .. tostring(idx))
      local stc_BTeamClass = UI.getChildControl(stc_EnemyTeam, "Static_Profile_Icon_" .. tostring(idx))
      local stc_BTeamTier = UI.getChildControl(stc_EnemyTeam, "Static_TierIcon_" .. tostring(idx))
      tempA._classBg = stc_ATeamClass
      tempA._tierBg = stc_ATeamTier
      tempB._classBg = stc_BTeamClass
      tempB._tierBg = stc_BTeamTier
      tempA._classBg:SetShow(false)
      tempA._tierBg:SetShow(false)
      tempB._classBg:SetShow(false)
      tempB._tierBg:SetShow(false)
      tempTable._ATeamClassWithTier:push_back(tempA)
      tempTable._BTeamClassWithTier:push_back(tempB)
      local teamADetailBg = UI.getChildControl(stc_MyTeamDetail, "Static_Member_BG_" .. tostring(idx))
      local teamBDetailBg = UI.getChildControl(stc_EnemyTeamDetail, "Static_Member_BG_" .. tostring(idx))
      local tempDetailA = {
        _bg = teamADetailBg,
        _classBg = UI.getChildControl(teamADetailBg, "Static_Profile"),
        _stc_tier = UI.getChildControl(teamADetailBg, "Static_Tier"),
        _txt_name = UI.getChildControl(teamADetailBg, "StaticText_Name"),
        _txt_KDA = UI.getChildControl(teamADetailBg, "StaticText_KDA"),
        _txt_heal = UI.getChildControl(teamADetailBg, "StaticText_Heal"),
        _txt_harm = UI.getChildControl(teamADetailBg, "StaticText_Harm"),
        _txt_dmg = UI.getChildControl(teamADetailBg, "StaticText_Damage"),
        _stc_MVP = UI.getChildControl(teamADetailBg, "Static_MVP"),
        _stc_Ace = UI.getChildControl(teamADetailBg, "Static_Ace"),
        _btn_detail = UI.getChildControl(teamADetailBg, "Button_Detail"),
        _stc_awaken = UI.getChildControl(teamADetailBg, "Static_Type_Awaken"),
        _stc_succession = UI.getChildControl(teamADetailBg, "Static_Type_Succession"),
        _stc_shy = UI.getChildControl(teamADetailBg, "Static_Type_Shy"),
        _stc_archer = UI.getChildControl(teamADetailBg, "Static_Type_Archer"),
        _stc_CCCount = UI.getChildControl(teamADetailBg, "StaticText_CCCount")
      }
      local tempDetailB = {
        _bg = teamBDetailBg,
        _classBg = UI.getChildControl(teamBDetailBg, "Static_Profile"),
        _stc_tier = UI.getChildControl(teamBDetailBg, "Static_Tier"),
        _txt_name = UI.getChildControl(teamBDetailBg, "StaticText_Name"),
        _txt_KDA = UI.getChildControl(teamBDetailBg, "StaticText_KDA"),
        _txt_heal = UI.getChildControl(teamBDetailBg, "StaticText_Heal"),
        _txt_harm = UI.getChildControl(teamBDetailBg, "StaticText_Harm"),
        _txt_dmg = UI.getChildControl(teamBDetailBg, "StaticText_Damage"),
        _stc_MVP = UI.getChildControl(teamBDetailBg, "Static_MVP"),
        _stc_Ace = UI.getChildControl(teamBDetailBg, "Static_Ace"),
        _btn_detail = UI.getChildControl(teamBDetailBg, "Button_Detail"),
        _stc_awaken = UI.getChildControl(teamBDetailBg, "Static_Type_Awaken"),
        _stc_succession = UI.getChildControl(teamBDetailBg, "Static_Type_Succession"),
        _stc_shy = UI.getChildControl(teamBDetailBg, "Static_Type_Shy"),
        _stc_archer = UI.getChildControl(teamBDetailBg, "Static_Type_Archer"),
        _stc_CCCount = UI.getChildControl(teamBDetailBg, "StaticText_CCCount")
      }
      tempTable._ATeamDetail:push_back(tempDetailA)
      tempTable._BTeamDetail:push_back(tempDetailB)
    end
    self._frameControlList:push_back(tempTable)
  end
  frameContentOriginal:SetShow(false)
end
function PaGlobal_Solrare_Matching:reAlignFrameControl()
  local prevPosY = 0
  local gap = 3
  local isDetailClicked = false
  for idx = 1, self._maxShowRecentInfoCount do
    if nil ~= self._frameControlList[idx] then
      local controlList = self._frameControlList[idx]
      local isDetailOpen = controlList._isDetailControlShow
      controlList._mainBg:SetPosXY(controlList._mainBg:GetPosX(), prevPosY)
      if true == isDetailOpen then
        isDetailClicked = true
        prevPosY = prevPosY + (controlList._mainBg:GetSizeY() + controlList._detailBg:GetSizeY() + gap)
      else
        prevPosY = prevPosY + (controlList._mainBg:GetSizeY() + gap)
      end
    end
  end
  local totalControlSize = #self._recordNumberList * (self._normalBgSize + 10)
  if true == isDetailClicked then
    totalControlSize = totalControlSize + self._detailBgSize
  end
  self._ui._frameContent:SetSize(self._ui._frameContent:GetSizeX(), totalControlSize)
  self._ui._frameVertiScroll:SetInterval(#self._recordNumberList)
  self._ui._frameRecentInfoList:UpdateContentScroll()
  self._ui._frameRecentInfoList:UpdateContentPos()
  PaGlobal_Solrare_Matching:setFrameControlByRecentInfo()
end
function PaGlobal_Solrare_Matching:prepareOpen()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  if false == _ContentsGroup_Solare then
    return
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local isInstancePlayer = selfPlayer:isInstancePlayer()
  self._ui._btn_RankGameReq:SetIgnore(isInstancePlayer)
  self._ui._btn_RankGameReq:SetMonoTone(isInstancePlayer, isInstancePlayer)
  self._ui._btn_NormalGameReq:SetIgnore(isInstancePlayer)
  self._ui._btn_NormalGameReq:SetMonoTone(isInstancePlayer, isInstancePlayer)
  self._selectedRecentRecordIndex = -1
  self._matchingTime = 100
  Panel_Window_Solrare_Matching:RegisterUpdateFunc("FromClient_Solrare_Matching_UpdatePerFrame")
  PaGlobal_Solrare_Matching:update()
  PaGlobal_Solrare_Matching:reAlignFrameControl()
  Panel_Window_Solrare_Matching:ComputePos()
  PaGlobal_Solrare_Matching:open()
end
function PaGlobal_Solrare_Matching:update()
  local getSelfPlayer = getSelfPlayer()
  if nil == getSelfPlayer then
    return
  end
  PaGlobal_Solrare_Matching:updateSelfPlayerInfo()
  PaGlobal_Solrare_Matching:updateRecentMatchList()
  PaGlobal_Solrare_Matching:setFrameControlByRecentInfo()
  local totalControlSize = #self._recordNumberList * (self._normalBgSize + 10)
  if true == isDetailClicked then
    totalControlSize = totalControlSize + self._detailBgSize
  end
  self._ui._frameContent:SetSize(self._ui._frameContent:GetSizeX(), totalControlSize)
  self._ui._frameVertiScroll:SetInterval(#self._recordNumberList)
  self._ui._frameRecentInfoList:UpdateContentScroll()
  self._ui._frameRecentInfoList:UpdateContentPos()
  self._ui._frameVertiScroll:SetControlTop()
end
function PaGlobal_Solrare_Matching:updateSelfPlayerInfo()
  local getSelfPlayer = getSelfPlayer()
  if nil == getSelfPlayer then
    return
  end
  local info = ToClient_GetSolareSelfPlayerInfo()
  if nil == info then
    return
  end
  local myRankRating = info:getRankRating()
  local myRank = info:getRanking()
  if myRank <= 0 then
    myRank = "-"
  end
  local winCount = info:getWinCount()
  local loseCount = info:getLoseCount()
  local drawCount = info:getDrawCount()
  local playCount = info:getPlayCount()
  local classTypeRaw = getSelfPlayer:getClassType()
  local isTop = myRank == 1
  self._ui._txt_RankRating:SetText(myRankRating)
  self._ui._txt_Level:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EXPEDITION_UNIT_LEVEL", "level", getSelfPlayer:get():getLevel()))
  self._ui._txt_Name:SetText(getSelfPlayer:getUserNickname())
  self._ui._txt_Ranking:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOLARE_RANK_VALUE", "rank", myRank))
  local recentString = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_SOLARA_RECENT_VALUE", "total", playCount, "win", winCount, "tie", drawCount, "lose", loseCount)
  self._ui._txt_RecentRecord:SetText(recentString)
  self._ui._txt_NoRecord:SetShow(false)
  if nil ~= PaGlobalFunc_Solrare_MatchNotice_SetMainClassBg then
    PaGlobalFunc_Solrare_MatchNotice_SetMainClassBg(self._ui._stc_ClassIcon, classTypeRaw)
  end
  if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore then
    PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(self._ui._stc_RankIcon, myRankRating, isTop)
  end
  local myTier = CovertSolrareRankScoreToTierGrade(myRankRating)
  local rankOrder = Defines.SolrareRankOrder[myTier]
  for idx = 0, self._maxTierCount do
    if rankOrder == idx then
      self._ui._txt_TierListTable[idx]:SetFontColor(Defines.Color.C_FFF5BA3A)
    else
      self._ui._txt_TierListTable[idx]:SetFontColor(Defines.Color.C_FFDDC39E)
    end
  end
  if rankOrder < 10 then
    rankOrder = "0" .. tostring(rankOrder)
  end
  self._ui._txt_Tier:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SOLARE_RANK_TIER_" .. tostring(rankOrder)))
  UI.setLimitTextAndAddTooltip(self._ui._txt_Tier, self._ui._txt_Tier:GetText(), "")
end
function PaGlobal_Solrare_Matching:updateRecentMatchList()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  self._recentInfoList = {}
  self._recordNumberList = Array.new()
  self._recentInfoCount = 0
  local recentInfoCount = ToClient_GetSolareMyRecentRecordCount()
  if recentInfoCount <= 0 then
    self._ui._txt_NoRecord:SetShow(true)
    return
  end
  local languageType = ToClient_getResourceType()
  local selfUserNo = selfPlayer:get():getUserNo()
  local startIndex = recentInfoCount - 1
  for index = 0, recentInfoCount - 1 do
    local recentInfo = ToClient_GetSolareMyRecentRecordIndex(index)
    if nil ~= recentInfo then
      local recordNumber32 = Int64toInt32(recentInfo:getRecordNumber64())
      local teamNo = recentInfo:getTeamNo()
      local recordResult = recentInfo:getResult()
      local isWin = recordResult == __eSolareRoundResult_Win
      local recordUserNo64 = recentInfo:getUserNo64()
      local isMVPAce = recentInfo:getWinMVPUserNo64() == recordUserNo64 or recentInfo:getLoseAceUserNo64() == recordUserNo64
      local userInfoTable = {
        _recordIndex = index,
        _userNo = tostring(recordUserNo64),
        _name = recentInfo:getName(),
        _classType = recentInfo:getClassTypeRaw(),
        _attackDamage = recentInfo:getAttackedDamage(),
        _harmDamage = recentInfo:getHittedDamage(),
        _healAmount = recentInfo:getHealedAmount(),
        _killCount = recentInfo:getKillCount(),
        _deathCount = recentInfo:getDeathCount(),
        _teamNo = recentInfo:getTeamNo(),
        _rankRating = Int64toInt32(recentInfo:getUserRankRating64()),
        _isMVP = isMVPAce == true and isWin == true,
        _isAce = isMVPAce == true and isWin == false,
        _winStreakCount = 0,
        _skillBranchType = recentInfo:getSkillBranch(),
        _CCCount = recentInfo:getCCAppliedCount()
      }
      if recentInfo:getUserNo64() == selfUserNo then
        userInfoTable._name = "<PAColor0xfff5ba3a>" .. userInfoTable._name .. "<PAOldColor>"
        userInfoTable._winStreakCount = recentInfo:getWinStreak()
      else
        userInfoTable._name = "<PAColor0xffddc39e>" .. userInfoTable._name .. "<PAOldColor>"
      end
      if nil ~= self._recentInfoList[recordNumber32] then
        if 0 == userInfoTable._teamNo then
          self._recentInfoList[recordNumber32]._ATeam:push_back(userInfoTable)
        elseif 1 == userInfoTable._teamNo then
          self._recentInfoList[recordNumber32]._BTeam:push_back(userInfoTable)
        end
      else
        local tempTable = {
          _ATeam = Array.new(),
          _BTeam = Array.new(),
          _playTime = recentInfo:getPlayTime64(),
          _recordNumber32 = recordNumber32,
          _result = __eSolareRoundResult_Win,
          _varyRating = 0,
          _resultTypeList = Array.new(),
          _selfPlayerTeamNumber = -1,
          _isLogin = false,
          _recordTime = "",
          _mode = recentInfo:getMode()
        }
        if 0 == userInfoTable._teamNo then
          tempTable._ATeam:push_back(userInfoTable)
        elseif 1 == userInfoTable._teamNo then
          tempTable._BTeam:push_back(userInfoTable)
        end
        local recordTime64 = recentInfo:getRecordDateUTCTime64()
        local recordTimStamp = PATime(recentInfo:getRecordDateUTCTime64())
        tempTable._recordTime = string.sub(tostring(recordTimStamp:GetYear()), 3, 4) .. " / " .. tostring(recordTimStamp:GetMonth()) .. " / " .. tostring(recordTimStamp:GetDay())
        if languageType == CppEnums.ServiceResourceType.eServiceResourceType_EN or languageType == CppEnums.ServiceResourceType.eServiceResourceType_ID then
          tempTable._recordTime = tostring(recordTimStamp:GetMonth()) .. " / " .. tostring(recordTimStamp:GetDay()) .. " / " .. string.sub(tostring(recordTimStamp:GetYear()), 3, 4)
        elseif languageType == CppEnums.ServiceResourceType.eServiceResourceType_TR or languageType == CppEnums.ServiceResourceType.eServiceResourceType_RU or languageType == CppEnums.ServiceResourceType.eServiceResourceType_TH or languageType == CppEnums.ServiceResourceType.eServiceResourceType_FR or languageType == CppEnums.ServiceResourceType.eServiceResourceType_DE or languageType == CppEnums.ServiceResourceType.eServiceResourceType_ES or languageType == CppEnums.ServiceResourceType.eServiceResourceType_PT or languageType == CppEnums.ServiceResourceType.eServiceResourceType_SP then
          tempTable._recordTime = tostring(recordTimStamp:GetDay()) .. " / " .. tostring(recordTimStamp:GetMonth()) .. " / " .. string.sub(tostring(recordTimStamp:GetYear()), 3, 4)
        end
        self._recentInfoList[recordNumber32] = tempTable
        self._recentInfoCount = self._recentInfoCount + 1
        self._recordNumberList:push_back(recordNumber32)
      end
      if selfUserNo == recordUserNo64 then
        self._recentInfoList[recordNumber32]._selfPlayerTeamNumber = userInfoTable._teamNo
        self._recentInfoList[recordNumber32]._result = recordResult
        self._recentInfoList[recordNumber32]._varyRating = recentInfo:getResultGameRating()
        self._recentInfoList[recordNumber32]._isLogin = recentInfo:getIsLogin()
        self._recentInfoList[recordNumber32]._winStreakCount = recentInfo:getWinStreak()
        for idx = 0, recentInfo:getWinRecordCount() - 1 do
          local result = recentInfo:getWinRecordByIndex(idx)
          self._recentInfoList[recordNumber32]._resultTypeList:push_back(result)
        end
      end
    end
  end
end
function PaGlobal_Solrare_Matching:setFrameControlByRecentInfo()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  for idx = 1, #self._recordNumberList do
    local recentNumber = self._recordNumberList[idx]
    local recentRecordList = self._recentInfoList[recentNumber]
    local frameControlTable = self._frameControlList[idx]
    if nil ~= recentRecordList and nil ~= frameControlTable then
      frameControlTable._mainBg:SetShow(true)
      frameControlTable._txt_PlayTime:SetText(convertSecondsToClockTime(Int64toInt32(recentRecordList._playTime)))
      frameControlTable._stc_recordTime:SetText(recentRecordList._recordTime)
      local mode = recentRecordList._mode
      local isLogin = recentRecordList._isLogin
      local result = recentRecordList._result
      local winString = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_WIN")
      local loseString = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_LOSE")
      local drawString = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_TIE")
      local varyRatingString = tostring(recentRecordList._varyRating)
      if recentRecordList._varyRating > 0 then
        varyRatingString = "(+" .. varyRatingString .. ")"
      elseif recentRecordList._varyRating < 0 then
        varyRatingString = "(" .. varyRatingString .. ")"
      else
        varyRatingString = "(" .. varyRatingString .. ")"
      end
      if recentRecordList._mode == __eSolareMode_Normal then
        winString = PAGetString(Defines.StringSheet_GAME, "LUA_SOLARE_NORMALGAME_TITLE_WIN")
        loseString = PAGetString(Defines.StringSheet_GAME, "LUA_SOLARE_NORMALGAME_TITLE_LOSE")
        drawString = PAGetString(Defines.StringSheet_GAME, "LUA_SOLARE_NORMALGAME_TITLE_TIE")
        varyRatingString = ""
      end
      frameControlTable._line_Win:SetShow(false)
      frameControlTable._line_Lose:SetShow(false)
      frameControlTable._line_Draw:SetShow(false)
      frameControlTable._txt_Escape:SetShow(false)
      frameControlTable._txt_ResultWithRate:SetShow(false)
      frameControlTable._txt_isWinStreak:SetShow(false)
      if recentRecordList._winStreakCount >= 3 and recentRecordList._mode ~= __eSolareMode_Normal then
        frameControlTable._txt_isWinStreak:SetShow(true)
      end
      if __eSolareRoundResult_Win == result then
        frameControlTable._txt_ResultWithRate:SetText("<PAColor0xff77c2ff>" .. winString .. tostring(varyRatingString) .. "<PAOldColor>")
        frameControlTable._line_Win:SetShow(true)
        frameControlTable._txt_ResultWithRate:SetShow(true)
      elseif __eSolareRoundResult_Lose == result then
        frameControlTable._txt_ResultWithRate:SetText("<PAColor0xffff826b>" .. loseString .. tostring(varyRatingString) .. "<PAOldColor>")
        frameControlTable._line_Lose:SetShow(true)
        frameControlTable._txt_ResultWithRate:SetShow(true)
      elseif __eSolareRoundResult_Draw == result then
        frameControlTable._txt_ResultWithRate:SetText("<PAColor0xfff5ba3a>" .. drawString .. tostring(varyRatingString) .. "<PAOldColor>")
        frameControlTable._line_Draw:SetShow(true)
        frameControlTable._txt_ResultWithRate:SetShow(true)
      end
      if isLogin == false then
        frameControlTable._txt_Escape:SetShow(true)
      end
      local winTextureID = "Combine_Etc_Solare_War_Ingame_Icon_Result_Win"
      local loseTextureID = "Combine_Etc_Solare_War_Ingame_Icon_Result_Lose"
      local drawTextureID = "Combine_Etc_Solare_War_Ingame_Icon_Result_Draw"
      local roundResultControlList = Array.new()
      roundResultControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_0"))
      roundResultControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_1"))
      roundResultControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_2"))
      roundResultControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_3"))
      roundResultControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_4"))
      local slashControlList = Array.new()
      slashControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_Slash_0"))
      slashControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_Slash_1"))
      slashControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_Slash_2"))
      slashControlList:push_back(UI.getChildControl(frameControlTable._stc_RoundResult, "StaticText_Record_Slash_3"))
      local slashCount = 0
      local recordCount = 0
      for key, value in pairs(roundResultControlList) do
        if value ~= nil then
          if recentRecordList._resultTypeList[key] ~= nil then
            local roundResultValue = recentRecordList._resultTypeList[key]
            local roundResultTextureID
            if __eSolareRoundResult_Win == roundResultValue then
              roundResultTextureID = winTextureID
            elseif __eSolareRoundResult_Lose == roundResultValue then
              roundResultTextureID = loseTextureID
            elseif __eSolareRoundResult_Draw == roundResultValue then
              roundResultTextureID = drawTextureID
            end
            if roundResultTextureID ~= nil then
              value:ChangeTextureInfoTextureIDAsync(roundResultTextureID)
              value:setRenderTexture(value:getBaseTexture())
              recordCount = recordCount + 1
              value:SetShow(true)
            end
          else
            value:SetShow(false)
          end
        end
      end
      slashCount = recordCount - 1
      local allCount = slashCount + recordCount
      local middlePos = 103
      local sizeIcon = 20
      local startPos = middlePos - allCount / 2 * 20
      local iconIdx = 0
      for key, value in pairs(roundResultControlList) do
        if value ~= nil and recordCount >= key then
          value:SetPosX(startPos + sizeIcon * iconIdx)
          iconIdx = iconIdx + 2
        end
      end
      iconIdx = 1
      for key, value in pairs(slashControlList) do
        if value ~= nil and key <= slashCount then
          value:SetPosX(startPos + sizeIcon * iconIdx)
          iconIdx = iconIdx + 2
        else
          value:SetShow(false)
        end
      end
      if 0 == recentRecordList._selfPlayerTeamNumber then
        for aTeamIndex = 1, #recentRecordList._ATeam do
          if nil ~= frameControlTable._ATeamClassWithTier[aTeamIndex] and nil ~= recentRecordList._ATeam[aTeamIndex] then
            local classTypeRaw = recentRecordList._ATeam[aTeamIndex]._classType
            local rankRating = recentRecordList._ATeam[aTeamIndex]._rankRating
            if nil ~= PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg then
              PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg(frameControlTable._ATeamClassWithTier[aTeamIndex]._classBg, classTypeRaw)
              frameControlTable._ATeamClassWithTier[aTeamIndex]._classBg:SetShow(true)
            end
            if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
              PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(frameControlTable._ATeamClassWithTier[aTeamIndex]._tierBg, rankRating)
              frameControlTable._ATeamClassWithTier[aTeamIndex]._tierBg:SetShow(true)
            end
          end
        end
        for bTeamIndex = 1, #recentRecordList._BTeam do
          if nil ~= frameControlTable._BTeamClassWithTier[bTeamIndex] and nil ~= recentRecordList._BTeam[bTeamIndex] then
            local classTypeRaw = recentRecordList._BTeam[bTeamIndex]._classType
            local rankRating = recentRecordList._BTeam[bTeamIndex]._rankRating
            if nil ~= PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg then
              PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg(frameControlTable._BTeamClassWithTier[bTeamIndex]._classBg, classTypeRaw)
              frameControlTable._BTeamClassWithTier[bTeamIndex]._classBg:SetShow(true)
            end
            if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
              PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(frameControlTable._BTeamClassWithTier[bTeamIndex]._tierBg, rankRating)
              frameControlTable._BTeamClassWithTier[bTeamIndex]._tierBg:SetShow(true)
            end
          end
        end
      elseif 1 == recentRecordList._selfPlayerTeamNumber then
        for aTeamIndex = 1, #recentRecordList._ATeam do
          if nil ~= frameControlTable._BTeamClassWithTier[aTeamIndex] and nil ~= recentRecordList._ATeam[aTeamIndex] then
            local classTypeRaw = recentRecordList._ATeam[aTeamIndex]._classType
            local rankRating = recentRecordList._ATeam[aTeamIndex]._rankRating
            if nil ~= PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg then
              PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg(frameControlTable._BTeamClassWithTier[aTeamIndex]._classBg, classTypeRaw)
              frameControlTable._BTeamClassWithTier[aTeamIndex]._classBg:SetShow(true)
            end
            if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
              PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(frameControlTable._BTeamClassWithTier[aTeamIndex]._tierBg, rankRating)
              frameControlTable._BTeamClassWithTier[aTeamIndex]._tierBg:SetShow(true)
            end
          end
        end
        for bTeamIndex = 1, #recentRecordList._BTeam do
          if nil ~= frameControlTable._ATeamClassWithTier[bTeamIndex] and nil ~= recentRecordList._BTeam[bTeamIndex] then
            local classTypeRaw = recentRecordList._BTeam[bTeamIndex]._classType
            local rankRating = recentRecordList._BTeam[bTeamIndex]._rankRating
            if nil ~= PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg then
              PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg(frameControlTable._ATeamClassWithTier[bTeamIndex]._classBg, classTypeRaw)
              frameControlTable._ATeamClassWithTier[bTeamIndex]._classBg:SetShow(true)
            end
            if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
              PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(frameControlTable._ATeamClassWithTier[bTeamIndex]._tierBg, rankRating)
              frameControlTable._ATeamClassWithTier[bTeamIndex]._tierBg:SetShow(true)
            end
          end
        end
      end
      frameControlTable._detailBg:SetShow(frameControlTable._isDetailControlShow)
      if true == frameControlTable._isDetailControlShow then
        local ATeamDetailTable = frameControlTable._ATeamDetail
        local BTeamDetailTable = frameControlTable._BTeamDetail
        local recentRecordATeam = recentRecordList._ATeam
        local recentRecordBTeam = recentRecordList._BTeam
        if nil ~= ATeamDetailTable and nil ~= BTeamDetailTable then
          for idx = 1, 3 do
            ATeamDetailTable[idx]._bg:SetShow(false)
            BTeamDetailTable[idx]._bg:SetShow(false)
          end
          for idx = 1, #recentRecordATeam do
            if nil ~= recentRecordATeam[idx] then
              local classTypeRaw = recentRecordATeam[idx]._classType
              local rankRating = recentRecordATeam[idx]._rankRating
              local name = recentRecordATeam[idx]._name
              local attack = recentRecordATeam[idx]._attackDamage
              local harm = recentRecordATeam[idx]._harmDamage
              local recovery = recentRecordATeam[idx]._healAmount
              local kill = recentRecordATeam[idx]._killCount
              local death = recentRecordATeam[idx]._deathCount
              local isMVP = recentRecordATeam[idx]._isMVP
              local isAce = recentRecordATeam[idx]._isAce
              local recordIndex = recentRecordATeam[idx]._recordIndex
              local skillBranchType = recentRecordATeam[idx]._skillBranchType
              local ccCount = recentRecordATeam[idx]._CCCount
              if 0 == recentRecordList._selfPlayerTeamNumber and nil ~= ATeamDetailTable[idx] then
                ATeamDetailTable[idx]._bg:SetShow(true)
                ATeamDetailTable[idx]._txt_name:SetText(name)
                ATeamDetailTable[idx]._txt_KDA:SetText(kill .. " / " .. death)
                ATeamDetailTable[idx]._txt_heal:SetText(recovery)
                ATeamDetailTable[idx]._txt_harm:SetText(harm)
                ATeamDetailTable[idx]._txt_dmg:SetText(attack)
                ATeamDetailTable[idx]._stc_MVP:SetShow(isMVP)
                ATeamDetailTable[idx]._stc_Ace:SetShow(isAce)
                ATeamDetailTable[idx]._stc_CCCount:SetText(ccCount)
                ATeamDetailTable[idx]._btn_detail:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_OtherInfo_OpenByRecord(" .. tostring(recordIndex) .. ")")
                PaGlobalFunc_Solrare_MatchNotice_SetClassBg(ATeamDetailTable[idx]._classBg, classTypeRaw)
                ATeamDetailTable[idx]._classBg:SetShow(true)
                if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
                  PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(ATeamDetailTable[idx]._stc_tier, rankRating)
                  ATeamDetailTable[idx]._stc_tier:SetShow(true)
                else
                  ATeamDetailTable[idx]._stc_tier:SetShow(false)
                end
                PaGlobalFunc_Solrare_Ranking_SetSkillBranchType(ATeamDetailTable[idx], skillBranchType, classTypeRaw)
              elseif 1 == recentRecordList._selfPlayerTeamNumber and nil ~= BTeamDetailTable[idx] then
                BTeamDetailTable[idx]._bg:SetShow(true)
                BTeamDetailTable[idx]._txt_name:SetText(name)
                BTeamDetailTable[idx]._txt_KDA:SetText(kill .. " / " .. death)
                BTeamDetailTable[idx]._txt_heal:SetText(recovery)
                BTeamDetailTable[idx]._txt_harm:SetText(harm)
                BTeamDetailTable[idx]._txt_dmg:SetText(attack)
                BTeamDetailTable[idx]._stc_MVP:SetShow(isMVP)
                BTeamDetailTable[idx]._stc_Ace:SetShow(isAce)
                BTeamDetailTable[idx]._stc_CCCount:SetText(ccCount)
                BTeamDetailTable[idx]._btn_detail:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_OtherInfo_OpenByRecord(" .. tostring(recordIndex) .. ")")
                PaGlobalFunc_Solrare_MatchNotice_SetClassBg(BTeamDetailTable[idx]._classBg, classTypeRaw)
                BTeamDetailTable[idx]._classBg:SetShow(true)
                if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
                  PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(BTeamDetailTable[idx]._stc_tier, rankRating)
                  BTeamDetailTable[idx]._stc_tier:SetShow(true)
                else
                  BTeamDetailTable[idx]._stc_tier:SetShow(false)
                end
                PaGlobalFunc_Solrare_Ranking_SetSkillBranchType(BTeamDetailTable[idx], skillBranchType, classTypeRaw)
              end
            end
          end
          for idx = 1, #recentRecordBTeam do
            if nil ~= recentRecordBTeam[idx] then
              local classTypeRaw = recentRecordBTeam[idx]._classType
              local rankRating = recentRecordBTeam[idx]._rankRating
              local name = recentRecordBTeam[idx]._name
              local attack = recentRecordBTeam[idx]._attackDamage
              local harm = recentRecordBTeam[idx]._harmDamage
              local recovery = recentRecordBTeam[idx]._healAmount
              local kill = recentRecordBTeam[idx]._killCount
              local death = recentRecordBTeam[idx]._deathCount
              local isMVP = recentRecordBTeam[idx]._isMVP
              local isAce = recentRecordBTeam[idx]._isAce
              local recordIndex = recentRecordBTeam[idx]._recordIndex
              local skillBranchType = recentRecordBTeam[idx]._skillBranchType
              local ccCount = recentRecordBTeam[idx]._CCCount
              if 0 == recentRecordList._selfPlayerTeamNumber and nil ~= BTeamDetailTable[idx] then
                BTeamDetailTable[idx]._bg:SetShow(true)
                BTeamDetailTable[idx]._txt_name:SetText(name)
                BTeamDetailTable[idx]._txt_KDA:SetText(kill .. " / " .. death)
                BTeamDetailTable[idx]._txt_heal:SetText(recovery)
                BTeamDetailTable[idx]._txt_harm:SetText(harm)
                BTeamDetailTable[idx]._txt_dmg:SetText(attack)
                BTeamDetailTable[idx]._stc_MVP:SetShow(isMVP)
                BTeamDetailTable[idx]._stc_Ace:SetShow(isAce)
                BTeamDetailTable[idx]._stc_CCCount:SetText(ccCount)
                BTeamDetailTable[idx]._btn_detail:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_OtherInfo_OpenByRecord(" .. tostring(recordIndex) .. ")")
                PaGlobalFunc_Solrare_MatchNotice_SetClassBg(BTeamDetailTable[idx]._classBg, classTypeRaw)
                BTeamDetailTable[idx]._classBg:SetShow(true)
                if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
                  PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(BTeamDetailTable[idx]._stc_tier, rankRating)
                  BTeamDetailTable[idx]._stc_tier:SetShow(true)
                else
                  BTeamDetailTable[idx]._stc_tier:SetShow(false)
                end
                PaGlobalFunc_Solrare_Ranking_SetSkillBranchType(BTeamDetailTable[idx], skillBranchType, classTypeRaw)
              elseif 1 == recentRecordList._selfPlayerTeamNumber and nil ~= ATeamDetailTable[idx] then
                ATeamDetailTable[idx]._bg:SetShow(true)
                ATeamDetailTable[idx]._txt_name:SetText(name)
                ATeamDetailTable[idx]._txt_KDA:SetText(kill .. " / " .. death)
                ATeamDetailTable[idx]._txt_heal:SetText(recovery)
                ATeamDetailTable[idx]._txt_harm:SetText(harm)
                ATeamDetailTable[idx]._txt_dmg:SetText(attack)
                ATeamDetailTable[idx]._stc_MVP:SetShow(isMVP)
                ATeamDetailTable[idx]._stc_Ace:SetShow(isAce)
                ATeamDetailTable[idx]._stc_CCCount:SetText(ccCount)
                ATeamDetailTable[idx]._btn_detail:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_OtherInfo_OpenByRecord(" .. tostring(recordIndex) .. ")")
                PaGlobalFunc_Solrare_MatchNotice_SetClassBg(ATeamDetailTable[idx]._classBg, classTypeRaw)
                ATeamDetailTable[idx]._classBg:SetShow(true)
                if nil ~= PaGlobalFunc_Solrare_Ranking_SetTierIconByScore and mode ~= __eSolareMode_Normal then
                  PaGlobalFunc_Solrare_Ranking_SetTierIconByScore(ATeamDetailTable[idx]._stc_tier, rankRating)
                  ATeamDetailTable[idx]._stc_tier:SetShow(true)
                else
                  ATeamDetailTable[idx]._stc_tier:SetShow(false)
                end
                PaGlobalFunc_Solrare_Ranking_SetSkillBranchType(ATeamDetailTable[idx], skillBranchType, classTypeRaw)
              end
            end
          end
        end
      end
    end
  end
end
function PaGlobal_Solrare_Matching:open()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  Panel_Window_Solrare_Matching:SetShow(true)
end
function PaGlobal_Solrare_Matching:prepareClose()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  self._ui._stc_TierListBg:SetShow(false)
  allClearMessageData()
  Panel_Window_Solrare_Matching:ClearUpdateLuaFunc()
  PaGlobal_Solrare_Matching:close()
end
function PaGlobal_Solrare_Matching:close()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  Panel_Window_Solrare_Matching:SetShow(false)
end
function PaGlobal_Solrare_Matching:switchMatchingBtn(isMatching)
  if true == isMatching then
    local curMatchMode = ToClient_GetMatchMode()
    if curMatchMode == __eMatchMode_Normal then
      self._ui._btn_RankGameReq:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_FIND_MATCH_BTN_RANK_CANCEL"))
      self._ui._btn_RankGameReq:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_MatchingState_PrepareClose()")
      self._ui._btn_NormalGameReq:addInputEvent("Mouse_LUp", "")
    elseif curMatchMode == __eMatchMode_Party then
      self._ui._btn_NormalGameReq:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_FIND_MATCH_BTN_RANK_CANCEL"))
      self._ui._btn_NormalGameReq:addInputEvent("Mouse_LUp", "PaGlobalFunc_Solrare_MatchingState_PrepareClose()")
      self._ui._btn_RankGameReq:addInputEvent("Mouse_LUp", "")
    end
  else
    self._ui._btn_RankGameReq:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_FIND_MATCH_BTN_RANK"))
    self._ui._btn_RankGameReq:addInputEvent("Mouse_LUp", "HandleEventLUp_Solrare_JoinRankMatching()")
    self._ui._btn_NormalGameReq:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_FIND_MATCH_BTN_NORMAL"))
    self._ui._btn_NormalGameReq:addInputEvent("Mouse_LUp", "HandleEventLUp_Solrare_NormalMatching()")
  end
end
function HandleEventLUp_Solrare_JoinRankMatching()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  if PaGlobal_Solrare_Matching._matchingTime < PaGlobal_Solrare_Matching._matchingDelayTime then
    local remainSecTime = math.floor(PaGlobal_Solrare_Matching._matchingDelayTime - PaGlobal_Solrare_Matching._matchingTime)
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "GAME_CONSOLE_REFRESH_MAIL_COOLTIME", "cooltime", remainSecTime))
    return
  end
  PaGlobal_Solrare_Matching._matchingTime = 0
  ToClient_requestJoinMatching(__eMatchMode_Normal, __eInstanceContentsType_Solare, 0, -100)
  audioPostEvent_SystemUi(30, 15)
  _AudioPostEvent_SystemUiForXBOX(30, 15)
end
function HandleEventLUp_Solrare_NormalMatching()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  if PaGlobal_Solrare_Matching._matchingTime < PaGlobal_Solrare_Matching._matchingDelayTime then
    local remainSecTime = math.floor(PaGlobal_Solrare_Matching._matchingDelayTime - PaGlobal_Solrare_Matching._matchingTime)
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "GAME_CONSOLE_REFRESH_MAIL_COOLTIME", "cooltime", remainSecTime))
    return
  end
  PaGlobal_Solrare_Matching._matchingTime = 0
  ToClient_requestJoinMatching(__eMatchMode_Party, __eInstanceContentsType_Solare, 0, -100)
  audioPostEvent_SystemUi(30, 15)
  _AudioPostEvent_SystemUiForXBOX(30, 15)
end
function HandleEventLUp_Solrare_ShowDetailToggle(index)
  local self = PaGlobal_Solrare_Matching
  if nil == self._frameControlList[index] then
    return
  end
  for idx = 1, self._maxShowRecentInfoCount do
    if nil ~= self._frameControlList[idx] then
      if index == idx then
        if true == self._frameControlList[idx]._isDetailControlShow then
          self._frameControlList[idx]._isDetailControlShow = false
          self._frameControlList[idx]._chk_ShowDetail:SetCheck(false)
        else
          self._frameControlList[idx]._isDetailControlShow = true
          self._frameControlList[idx]._chk_ShowDetail:SetCheck(true)
        end
      else
        self._frameControlList[idx]._isDetailControlShow = false
        self._frameControlList[idx]._chk_ShowDetail:SetCheck(false)
      end
    end
  end
  PaGlobal_Solrare_Matching:reAlignFrameControl()
end
function FromClient_Solrare_MatchServerAlreadyConnected()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoAlreadyConnect"))
end
function FromClient_Solrare_MatchServerConnectSuccess()
  ToClient_requestJoinMatching(__eMatchMode_Count, __eInstanceContentsType_Solare, 0, -1)
end
function FromClient_Solrare_SuccessMatchServerLogin()
  PaGlobalFunc_Solrare_MatchingState_Open()
end
function FromClient_Solrare_MatchingSuccess()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  local successString = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SOLARE_FOUND_MATCH_TITLE")
  PaGlobal_Solrare_Matching._ui._txt_MatchingState:SetText(successString)
  PaGlobal_Solrare_Matching._ui._btn_MatchingCancel:SetMonoTone(true, true)
  PaGlobal_Solrare_Matching._ui._btn_MatchingCancel:SetIgnore(true)
  PaGlobalFunc_Solrare_MatchingConfirm_Close()
  if nil ~= Panel_Window_GameExit_All and Panel_Window_GameExit_All:GetShow() == true then
    PaGlobal_GameExit_All_Close()
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CASH_CUSTOMIZATION_BUYITEM_TITLE"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_SOLRARE_LOADING_MSG"),
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FromClient_Solrare_SuccessMatchServerLogout()
  PaGlobalFunc_Solrare_MatchingState_Close()
  PaGlobalFunc_Solrare_MatchingConfirm_Close()
end
function FromClient_Solare_Matching_Resize()
  Panel_Window_Solrare_Matching:ComputePos()
end
function FromClient_Solare_MatchingStateUpdate(isMatching)
  if true == ToClient_IsMatchingStateByMatchServer() then
    PaGlobalFunc_Solrare_MatchingState_Open()
  elseif Panel_Window_Solare_Finding_Match:GetShow() == true then
    PaGlobalFunc_Solrare_MatchingState_Close()
  end
end
function FromClient_SolareNeedSettingEquipPresetAck()
  if nil == Panel_Window_Solrare_Matching then
    return
  end
  local confirm = function()
    PaGlobalFunc_PaGlobal_Solare_EquipPreset_Open()
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
    content = PAGetString(Defines.StringSheet_GAME, "SOLARE_EQUIP_ALERT_DESC"),
    functionYes = confirm,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FromClient_SolareRecentRecordLoad()
  PaGlobalFunc_Solrare_Matching_Open()
end
function FromClient_Solrare_Matching_UpdatePerFrame(deltaTime)
  PaGlobal_Solrare_Matching._matchingTime = PaGlobal_Solrare_Matching._matchingTime + deltaTime
end
function FromClient_Solrare_MatchingState_UpdatePerFrame(deltaTime)
  PaGlobal_Solrare_Matching._matchingCloseTime = PaGlobal_Solrare_Matching._matchingCloseTime + deltaTime
  PaGlobal_Solrare_Matching._currentDeltaTime = PaGlobal_Solrare_Matching._currentDeltaTime + deltaTime
  if PaGlobal_Solrare_Matching._currentDeltaTime > 1 then
    PaGlobal_Solrare_Matching._currentElapsedTime = PaGlobal_Solrare_Matching._currentElapsedTime + 1
    PaGlobal_Solrare_Matching._currentDeltaTime = 0
    PaGlobal_Solrare_Matching._ui._txt_MatchingElapsedTime:SetText(convertSecondsToClockTime(PaGlobal_Solrare_Matching._currentElapsedTime))
  end
end
function PaGlobalFunc_Solrare_Matching_Open()
  PaGlobal_Solrare_Matching:prepareOpen()
end
function PaGlobalFunc_Solrare_Matching_Close()
  PaGlobal_Solrare_Matching:prepareClose()
end
function PaGlobalFunc_Solrare_MatchingState_Open()
  if true == Panel_Window_Solare_Finding_Match:GetShow() then
    return
  end
  PaGlobal_Solrare_Matching._ui._txt_MatchingElapsedTime:SetText("")
  PaGlobal_Solrare_Matching._currentElapsedTime = 0
  PaGlobal_Solrare_Matching._currentDeltaTime = 0
  Panel_Window_Solare_Finding_Match:ClearUpdateLuaFunc()
  Panel_Window_Solare_Finding_Match:RegisterUpdateFunc("FromClient_Solrare_MatchingState_UpdatePerFrame")
  PaGlobal_Solrare_Matching._ui._txt_MatchingState:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BLOODALTAR_MATCHING_WAITING"))
  Panel_Window_Solare_Finding_Match:ComputePos()
  Panel_Window_Solare_Finding_Match:SetShow(true)
  Panel_Window_Solare_Finding_Match:EraseAllEffect()
  Panel_Window_Solare_Finding_Match:AddEffect("fUI_Solrare_Start_01A", true, 0, 0)
  PaGlobal_Solrare_Matching._ui._btn_MatchingCancel:SetMonoTone(false, false)
  PaGlobal_Solrare_Matching._ui._btn_MatchingCancel:SetIgnore(false)
  PaGlobal_Solrare_Matching:switchMatchingBtn(true)
end
function PaGlobalFunc_Solrare_MatchingState_PrepareClose()
  if PaGlobal_Solrare_Matching._matchingCloseTime < PaGlobal_Solrare_Matching._matchingDelayTime then
    local remainSecTime = math.floor(PaGlobal_Solrare_Matching._matchingDelayTime - PaGlobal_Solrare_Matching._matchingCloseTime)
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "GAME_CONSOLE_REFRESH_MAIL_COOLTIME", "cooltime", remainSecTime))
    return
  end
  PaGlobal_Solrare_Matching._matchingCloseTime = 0
  ToClient_requestCancleMatching()
end
function HandleEventOnOut_Solrare_AccumulateTime(isShow)
  if false == isShow then
    TooltipSimple_Hide()
    return
  end
  local accumTime = Int64toInt32(ToClient_GetAccumulateMatchTime())
  if accumTime > 0 then
    local convertTime = convertSecondsToClockTime(accumTime)
    local desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOLARE_MATCH_WAITINGTIME_DESC", "time", convertTime)
    TooltipSimple_Show(PaGlobal_Solrare_Matching._ui._btn_RankGameReq, "", desc)
  end
end
function PaGlobalFunc_Solrare_MatchingState_Close()
  Panel_Window_Solare_Finding_Match:SetShow(false)
  Panel_Window_Solare_Finding_Match:ClearUpdateLuaFunc()
  PaGlobal_Solrare_Matching._currentElapsedTime = 0
  PaGlobal_Solrare_Matching._currentDeltaTime = 0
  PaGlobal_Solrare_Matching:switchMatchingBtn(false)
end
function PaGlobalFunc_PaGlobal_Solare_EquipPreset_TierListShow(isShow)
  PaGlobal_Solrare_Matching._ui._stc_TierListBg:SetShow(isShow)
end
function PaGlobalFunc_Solrare_MatchNotice_SetMainClassBg(control, classType)
  if nil == control then
    return
  end
  control:ChangeTextureInfoNameDefault("Combine/Etc/Combine_Etc_Solare_War_01.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if classType == __eClassType_Warrior then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 1636, 902, 1766)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_03")
  elseif classType == __eClassType_Hashashin then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2160, 1804, 2290)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_21")
  elseif classType == __eClassType_ElfRanger then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 1636, 1353, 1766)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_04")
  elseif classType == __eClassType_Sorcerer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 1636, 1804, 1766)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_05")
  elseif classType == __eClassType_Giant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 1767, 451, 1897)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_06")
  elseif classType == __eClassType_Tamer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 1767, 902, 1897)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_07")
  elseif classType == __eClassType_BladeMaster then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 1767, 1353, 1897)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_08")
  elseif classType == __eClassType_BladeMasterWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 2291, 1353, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_24")
  elseif classType == __eClassType_Valkyrie then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 1767, 1804, 1897)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_09")
  elseif classType == __eClassType_WizardMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 1898, 1353, 2028)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_12")
  elseif classType == __eClassType_WizardWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 1898, 1804, 2028)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_13")
  elseif classType == __eClassType_Kunoichi then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 1898, 451, 2028)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_10")
  elseif classType == __eClassType_NinjaMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 1898, 902, 2028)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_11")
  elseif classType == __eClassType_DarkElf then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 2029, 451, 2159)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_14")
  elseif classType == __eClassType_Combattant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 2029, 902, 2159)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_15")
  elseif classType == __eClassType_Mystic then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 2029, 1353, 2159)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_16")
  elseif classType == __eClassType_Lhan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 2160, 451, 2290)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_18")
  elseif classType == __eClassType_RangerMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 1636, 451, 1766)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_01")
  elseif classType == __eClassType_ShyWaman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2029, 1804, 2159)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_17")
  elseif classType == __eClassType_Guardian then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 2160, 902, 2290)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_19")
  elseif classType == __eClassType_Nova then
    x1, y1, x2, y2 = setTextureUV_Func(control, 903, 2160, 1353, 2290)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_20")
  elseif classType == __eClassType_Sage then
    x1, y1, x2, y2 = setTextureUV_Func(control, 452, 2291, 902, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_23")
  elseif classType == __eClassType_Corsair then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 2291, 451, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_22")
  elseif classType == __eClassType_Drakania then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2291, 1804, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_25")
  elseif classType == __eClassType_Giant_Reserved0 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2291, 1804, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_25")
  elseif classType == __eClassType_Giant_Reserved2 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2291, 1804, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_25")
  elseif classType == __eClassType_KunoichiOld then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1354, 2291, 1804, 2421)
    control:ChangeTextureInfoTextureIDAsync("Combine_Etc_Solare_War_Icon_Cha_Profile_25")
  end
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function PaGlobalFunc_Solrare_MatchNotice_SetClassBg(control, classType)
  if nil == control then
    return
  end
  control:ChangeTextureInfoNameDefault("Combine/Etc/Combine_Etc_Solare_War_02.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if classType == __eClassType_Warrior then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 825, 191, 905)
  elseif classType == __eClassType_Hashashin then
    x1, y1, x2, y2 = setTextureUV_Func(control, 192, 1068, 382, 1148)
  elseif classType == __eClassType_ElfRanger then
    x1, y1, x2, y2 = setTextureUV_Func(control, 192, 825, 382, 905)
  elseif classType == __eClassType_Sorcerer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 383, 825, 573, 905)
  elseif classType == __eClassType_Giant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 574, 825, 764, 905)
  elseif classType == __eClassType_Tamer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 765, 825, 955, 905)
  elseif classType == __eClassType_BladeMaster then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 825, 1146, 905)
  elseif classType == __eClassType_BladeMasterWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 906, 191, 986)
  elseif classType == __eClassType_Valkyrie then
    x1, y1, x2, y2 = setTextureUV_Func(control, 192, 906, 382, 986)
  elseif classType == __eClassType_WizardMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 765, 906, 955, 986)
  elseif classType == __eClassType_WizardWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 906, 1146, 986)
  elseif classType == __eClassType_Kunoichi then
    x1, y1, x2, y2 = setTextureUV_Func(control, 383, 906, 573, 986)
  elseif classType == __eClassType_NinjaMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 574, 906, 764, 986)
  elseif classType == __eClassType_DarkElf then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 987, 191, 1067)
  elseif classType == __eClassType_Combattant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 192, 987, 382, 1067)
  elseif classType == __eClassType_Mystic then
    x1, y1, x2, y2 = setTextureUV_Func(control, 383, 987, 573, 1067)
  elseif classType == __eClassType_Lhan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 574, 987, 764, 1067)
  elseif classType == __eClassType_RangerMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 765, 987, 955, 1067)
  elseif classType == __eClassType_ShyWaman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 987, 1146, 1067)
  elseif classType == __eClassType_Guardian then
    x1, y1, x2, y2 = setTextureUV_Func(control, 1, 1068, 191, 1148)
  elseif classType == __eClassType_Nova then
    x1, y1, x2, y2 = setTextureUV_Func(control, 383, 1068, 573, 1148)
  elseif classType == __eClassType_Sage then
    x1, y1, x2, y2 = setTextureUV_Func(control, 574, 1068, 764, 1148)
  elseif classType == __eClassType_Corsair then
    x1, y1, x2, y2 = setTextureUV_Func(control, 765, 1068, 955, 1148)
  elseif classType == __eClassType_Drakania then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 1068, 1146, 1148)
  elseif classType == __eClassType_Giant_Reserved0 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 1068, 1146, 1148)
  elseif classType == __eClassType_Giant_Reserved2 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 1068, 1146, 1148)
  elseif classType == __eClassType_KunoichiOld then
    x1, y1, x2, y2 = setTextureUV_Func(control, 956, 1068, 1146, 1148)
  end
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function PaGlobalFunc_Solrare_MatchNotice_SetMiniClassBg(control, classType)
  if nil == control then
    return
  end
  control:ChangeTextureInfoNameDefault("Combine/Etc/Combine_Etc_Minigame_06.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if classType == __eClassType_Warrior then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1277, 227, 1347)
  elseif classType == __eClassType_Hashashin then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1632, 227, 1702)
  elseif classType == __eClassType_ElfRanger then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1277, 298, 1347)
  elseif classType == __eClassType_Sorcerer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1348, 227, 1418)
  elseif classType == __eClassType_Giant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1348, 298, 1418)
  elseif classType == __eClassType_Tamer then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1419, 227, 1489)
  elseif classType == __eClassType_BladeMaster then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1419, 298, 1489)
  elseif classType == __eClassType_BladeMasterWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 86, 1643, 156, 1713)
  elseif classType == __eClassType_Valkyrie then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1490, 227, 1560)
  elseif classType == __eClassType_WizardMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 86, 1359, 156, 1429)
  elseif classType == __eClassType_WizardWoman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 15, 1430, 85, 1500)
  elseif classType == __eClassType_Kunoichi then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1490, 298, 1560)
  elseif classType == __eClassType_NinjaMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 15, 1359, 85, 1429)
  elseif classType == __eClassType_DarkElf then
    x1, y1, x2, y2 = setTextureUV_Func(control, 86, 1430, 156, 1500)
  elseif classType == __eClassType_Combattant then
    x1, y1, x2, y2 = setTextureUV_Func(control, 15, 1501, 85, 1571)
  elseif classType == __eClassType_Mystic then
    x1, y1, x2, y2 = setTextureUV_Func(control, 86, 1501, 156, 1571)
  elseif classType == __eClassType_Lhan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 86, 1572, 156, 1642)
  elseif classType == __eClassType_RangerMan then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1206, 227, 1276)
  elseif classType == __eClassType_ShyWaman then
    x1, y1, x2, y2 = setTextureUV_Func(control, 15, 1572, 85, 1642)
  elseif classType == __eClassType_Guardian then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1561, 227, 1631)
  elseif classType == __eClassType_Nova then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1561, 298, 1631)
  elseif classType == __eClassType_Sage then
    x1, y1, x2, y2 = setTextureUV_Func(control, 157, 1703, 227, 1773)
  elseif classType == __eClassType_Corsair then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1632, 298, 1702)
  elseif classType == __eClassType_Drakania then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1703, 298, 1773)
  elseif classType == __eClassType_Giant_Reserved0 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1703, 298, 1773)
  elseif classType == __eClassType_Giant_Reserved2 then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1703, 298, 1773)
  elseif classType == __eClassType_KunoichiOld then
    x1, y1, x2, y2 = setTextureUV_Func(control, 228, 1703, 298, 1773)
  end
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function PaGlobalFunc_Solrare_Ranking_SetSkillBranchType(control, skillBranchType, classType)
  if control == nil then
    return
  end
  if control._stc_awaken == nil or control._stc_succession == nil or control._stc_shy == nil or control._stc_archer == nil then
    return
  end
  control._stc_awaken:SetShow(false)
  control._stc_succession:SetShow(false)
  control._stc_shy:SetShow(false)
  control._stc_archer:SetShow(false)
  if (__eClassType_Sage == classType or __eClassType_Corsair == classType or __eClassType_Drakania == classType) and skillBranchType == __eSkillTypeParam_Normal then
    skillBranchType = __eSkillTypeParam_Inherit
  end
  if classType == __eClassType_ShyWaman then
    control._stc_shy:SetShow(true)
  elseif classType == __eClassType_RangerMan then
    control._stc_archer:SetShow(true)
  elseif skillBranchType == __eSkillTypeParam_Awaken then
    control._stc_awaken:SetShow(true)
  elseif skillBranchType == __eSkillTypeParam_Inherit or skillBranchType == __eSkillTypeParam_Normal then
    control._stc_succession:SetShow(true)
  end
  return
end
