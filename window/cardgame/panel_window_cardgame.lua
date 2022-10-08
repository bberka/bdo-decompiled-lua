local PaGlobal_CardGame = {
  _ui = {
    _closeButton = UI.getChildControl(Panel_Window_CardGame, "Button_Win_Close"),
    _cardSettingBg = UI.getChildControl(Panel_Window_CardGame, "Static_SelectCardBg"),
    _card = {
      [0] = {},
      [1] = {},
      [2] = {},
      [3] = {}
    },
    _cardDesc = nil,
    _saveButton = nil,
    _resetButton = nil,
    _boardBg = UI.getChildControl(Panel_Window_CardGame, "Static_GameBoardBg"),
    _myCard = {
      [0] = {},
      [1] = {},
      [2] = {},
      [3] = {},
      [4] = {}
    },
    _otherCard = {
      [0] = {},
      [1] = {},
      [2] = {},
      [3] = {},
      [4] = {}
    }
  },
  _maxValue = 53,
  _haveCount = 5,
  _totalValue = 0,
  _totalSelectedCount = 0,
  _grade = {
    [0] = {
      10,
      14,
      17,
      19,
      20
    },
    [1] = {
      4,
      7,
      11,
      15,
      18
    },
    [2] = {
      2,
      5,
      8,
      12,
      16
    },
    [3] = {
      1,
      3,
      6,
      9,
      13
    }
  },
  _myCard = {},
  _currentRount = 1,
  _lala = {
    [0] = {
      {0, 4},
      {0, 5},
      {2, 2},
      {3, 1},
      {3, 4}
    },
    [1] = {
      {1, 4},
      {2, 4},
      {3, 3},
      {3, 4},
      {3, 5}
    },
    [2] = {
      {0, 3},
      {0, 4},
      {2, 1},
      {2, 5},
      {3, 1}
    }
  },
  _lalaCard = 0,
  _lalaOrder = {},
  _roundScore = {},
  _myScore = 0,
  _lalaScore = 0,
  _lalaWinMsg = {},
  _lalaWinMessage = {
    [0] = "íˆí›, ì•½í•˜ì‹œêµ°ìš”.",
    "ì¢€ ë” í˜ë‚´ë³´ì„¸ìš”.",
    "ì¬ë¯¸ìˆê²Œ ì¢€ í•´ì£¼ì„¸ìš”.",
    "ê³ ë¸”ë¦°ì´ ë” ë¨¸ë¦¬ê°€ ì¢‹ì„ ê±° ê°™ì•„ìš”.",
    "ë„ˆë¬´ ë§‰ë¬´ê°€ë‚´ ì•„ë‹Œê°€ìš”",
    "ì´ê±´ ë¨¸ë¦¬ë¥¼ ì¨ì•¼ í•˜ëŠ” ê²Œì„ì´ëë‹ˆë‹¤.",
    "ë²Œì¨ í¬ê¸°ì¸ê°€ìš”",
    "ê°ì‚¬í•©ë‹ˆë‹¤~",
    "ë§›ìˆëŠ” ì ìˆ˜ë„¤ìš”.",
    "ë¬´ë‹¤ë¬´ë‹¤ë¬´ë‹¤ë¬´ë‹¤ë¬´ë‹¤!!"
  },
  _lalaLoseMsg = {},
  _lalaLoseMessage = {
    [0] = "ë‹¤ìŒ ë¼ìš´ë“œì— ë§ŒíšŒí•˜ê² ì–´ìš”.",
    "ì œë²•ì´ì‹œë„¤ìš”.",
    "ì•„ì§ ëª¸ì´ ì•ˆ í’€ë ¸ì–´ìš”.",
    "ì•ˆ ë´ì£¼ì„¸ìš”",
    "ë„ˆë¬´ ì¢‹ì•„í•˜ì‹œì§€ ë§ˆì„¸ìš”!",
    "ë°¤ê¸¸ ì¡°ì‹¬í•˜ì„¸ìš”~.",
    "ì•„ì‰~ ë„ˆë¬´í•´ìš”~",
    "ì–´ì„œ ë‹¤ìŒ ê²Œì„ í•˜ì£ .",
    "ì œê°€ ì§€ë©´ ì•„ì´ë“¤ì´ ìŠ¬í¼í•´ìš”. ã…œ.ã…œ",
    "í›Œì©, í›Œì©. íˆë…~ í ~"
  }
}
function PaGlobal_CardGame:Init()
  for index = 1, 20 do
    local grade = math.floor((index - 1) / 5)
    local gradeString = ""
    if 0 == grade then
      gradeString = "S"
    elseif 1 == grade then
      gradeString = "A"
    elseif 2 == grade then
      gradeString = "B"
    elseif 3 == grade then
      gradeString = "C"
    end
    local value = (index - 1) % 5 + 1
    self._ui._card[grade][value] = {}
    self._ui._card[grade][value]._bg = UI.getChildControl(self._ui._cardSettingBg, "Static_CardSlot" .. gradeString .. value)
    self._ui._card[grade][value]._check = UI.getChildControl(self._ui._card[grade][value]._bg, "Checkbox_Receive")
    self._ui._card[grade][value]._check:SetCheck(false)
    self._ui._card[grade][value]._check:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_SetCard(" .. index .. "," .. grade .. "," .. value .. ")")
  end
  self._ui._cardDesc = UI.getChildControl(self._ui._cardSettingBg, "StaticText_CardDesc")
  self._ui._cardDesc:SetText("ì„ íƒí•œ ì¹´ë“œ : " .. self._totalSelectedCount .. "ì¥\nì¹´ë“œ ì ìˆ˜ : " .. self._totalValue .. "ì ")
  self._ui._saveButton = UI.getChildControl(self._ui._cardSettingBg, "Button_Confirm")
  self._ui._resetButton = UI.getChildControl(self._ui._cardSettingBg, "Button_Reset")
  self._ui._saveButton:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_Save()")
  self._ui._resetButton:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_Reset()")
  self._ui._closeButton:addInputEvent("Mouse_LUp", "FGlobal_CardGame_Close()")
  for index = 0, 4 do
    self._ui._myCard[index] = {}
    self._ui._myCard[index]._bg = UI.getChildControl(self._ui._boardBg, "Static_MyCardSlot" .. index + 1)
    self._ui._myCard[index]._check = UI.getChildControl(self._ui._myCard[index]._bg, "Checkbox_Receive")
    self._ui._myCard[index]._check:SetIgnore(false)
    self._ui._myCard[index]._check:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_SelectCard(" .. index .. ")")
    self._ui._myCard[index]._grade = UI.getChildControl(self._ui._myCard[index]._bg, "StaticText_Grade")
    self._ui._myCard[index]._point = UI.getChildControl(self._ui._myCard[index]._bg, "StaticText_Point")
    self._ui._myCard[index]._value = UI.getChildControl(self._ui._myCard[index]._bg, "StaticText_Value")
    self._ui._myCard[index]._result = UI.getChildControl(self._ui._myCard[index]._bg, "StaticText_Result")
    self._ui._myCard[index]._result:SetShow(false)
  end
  for index = 0, 4 do
    self._ui._otherCard[index] = {}
    self._ui._otherCard[index]._bg = UI.getChildControl(self._ui._boardBg, "Static_OtherCardSlot" .. index + 1)
    self._ui._otherCard[index]._bg:SetShow(false)
    self._ui._otherCard[index]._grade = UI.getChildControl(self._ui._otherCard[index]._bg, "StaticText_Grade")
    self._ui._otherCard[index]._point = UI.getChildControl(self._ui._otherCard[index]._bg, "StaticText_Point")
    self._ui._otherCard[index]._value = UI.getChildControl(self._ui._otherCard[index]._bg, "StaticText_Value")
    self._ui._otherCard[index]._result = UI.getChildControl(self._ui._otherCard[index]._bg, "StaticText_Result")
    self._ui._otherCard[index]._result:SetShow(false)
  end
  self._ui._score = UI.getChildControl(self._ui._boardBg, "StaticText_Score")
  self._ui._round = UI.getChildControl(self._ui._boardBg, "StaticText_RoundDesc")
  self._ui._currentRoundScore = UI.getChildControl(self._ui._boardBg, "StaticText_CurrentRoundScore")
  self._ui._bubbleBg = UI.getChildControl(self._ui._boardBg, "Static_Obsidian_B_Left")
  self._ui._bubbleText = UI.getChildControl(self._ui._bubbleBg, "StaticText_Obsidian_B")
  self._ui._bubbleBg:SetShow(false)
  self._ui._resultMessage = UI.getChildControl(self._ui._boardBg, "StaticText_ResultMessage")
  self._ui._resultMessage:SetShow(false)
  self._ui._btnOut = UI.getChildControl(self._ui._boardBg, "Button_Out")
  self._ui._btnGiveUp = UI.getChildControl(self._ui._boardBg, "Button_Giveup")
  self._ui._btnOut:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_Go()")
  self._ui._btnGiveUp:SetText("ë‹¤ì‹œ í•˜ê¸°")
  self._ui._btnGiveUp:addInputEvent("Mouse_LUp", "PaGlobal_CardGame_GameReset()")
  self._ui._cardSettingBg:SetShow(true)
  self._ui._boardBg:SetShow(false)
end
function PaGlobal_CardGame:Open()
  self._currentRount = 1
  self._ui._cardSettingBg:SetShow(true)
  self._ui._boardBg:SetShow(false)
  PaGlobal_CardGame_Reset()
  Panel_Window_CardGame:SetShow(true)
end
function PaGlobal_CardGame:Close()
  Panel_Window_CardGame:SetShow(false)
end
function PaGlobal_CardGame_SetCard(index, grade, value)
  local self = PaGlobal_CardGame
  if self._ui._card[grade][value]._check:IsCheck() then
    if self._haveCount <= self._totalSelectedCount then
      self._ui._card[grade][value]._check:SetCheck(false)
      Proc_ShowMessage_Ack("ë” ì´ìƒ ì¹´ë“œë¥¼ ì„ íƒí•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
      return
    end
    if self._maxValue < self._totalValue + self._grade[grade][value] then
      self._ui._card[grade][value]._check:SetCheck(false)
      Proc_ShowMessage_Ack("53ì ì„ ë„˜ëŠ” ì ìˆ˜ë¥¼ ì„¸íŒ…í•  ìˆ˜ ì—†ìŠµë‹ˆë‹¤.")
      return
    end
    self._totalSelectedCount = self._totalSelectedCount + 1
    self._totalValue = self._totalValue + self._grade[grade][value]
    self._ui._cardDesc:SetText("ì„ íƒí•œ ì¹´ë“œ : " .. self._totalSelectedCount .. "ì¥\nì¹´ë“œ ì ìˆ˜ : " .. self._totalValue .. "ì ")
  else
    self._totalSelectedCount = self._totalSelectedCount - 1
    self._totalValue = self._totalValue - self._grade[grade][value]
    self._ui._cardDesc:SetText("ì„ íƒí•œ ì¹´ë“œ : " .. self._totalSelectedCount .. "ì¥\nì¹´ë“œ ì ìˆ˜ : " .. self._totalValue .. "ì ")
  end
end
function PaGlobal_CardGame_Save()
  local self = PaGlobal_CardGame
  if self._haveCount ~= self._totalSelectedCount then
    Proc_ShowMessage_Ack("ì¹´ë“œë¥¼ ë§ˆì € ì„ íƒí•´ì£¼ì„¸ìš”.")
    return
  end
  local cIndex = 0
  for index = 1, 20 do
    local grade = math.floor((index - 1) / 5)
    local gradeString = ""
    if 0 == grade then
      gradeString = "S"
    elseif 1 == grade then
      gradeString = "A"
    elseif 2 == grade then
      gradeString = "B"
    elseif 3 == grade then
      gradeString = "C"
    end
    local value = (index - 1) % 5 + 1
    local temp = {}
    if self._ui._card[grade][value]._check:IsCheck() then
      temp._grade = grade
      temp._value = value
      temp._index = cIndex
      self._myCard[cIndex] = {}
      self._myCard[cIndex] = temp
      cIndex = cIndex + 1
    end
  end
  for index = 0, 4 do
    local gradeString = ""
    if 0 == self._myCard[index]._grade then
      gradeString = "S"
    elseif 1 == self._myCard[index]._grade then
      gradeString = "A"
    elseif 2 == self._myCard[index]._grade then
      gradeString = "B"
    elseif 3 == self._myCard[index]._grade then
      gradeString = "C"
    end
    self._ui._myCard[index]._grade:SetText(gradeString .. " ë“±ê¸‰")
    self._ui._myCard[index]._point:SetText(self._myCard[index]._value .. "ë‹¨ê³„")
    self._ui._myCard[index]._value:SetText(self._grade[self._myCard[index]._grade][self._myCard[index]._value] .. "ì ")
    self._ui._myCard[index]._check:SetShow(true)
    self._ui._myCard[index]._check:SetCheck(false)
    self._ui._myCard[index]._result:SetShow(false)
  end
  self._lalaCard = math.random(0, 2)
  self._currentRount = 1
  for index = 0, 4 do
    if index > 0 then
      local isMatch = true
      local currentOrder
      while isMatch do
        currentOrder = math.random(0, 4)
        isMatch = false
        for pIndex = 0, index - 1 do
          isMatch = isMatch or self._lalaOrder[pIndex] == currentOrder
        end
      end
      self._lalaOrder[index] = currentOrder
      local isMatch = true
      local currentOrder
      while isMatch do
        currentOrder = math.random(1, 5)
        isMatch = false
        for pIndex = 0, index - 1 do
          isMatch = isMatch or self._roundScore[pIndex] == currentOrder
        end
      end
      self._roundScore[index] = currentOrder
      local isMatch = true
      local currentOrder
      while isMatch do
        currentOrder = math.random(0, 9)
        isMatch = false
        for pIndex = 0, index - 1 do
          isMatch = isMatch or self._lalaWinMsg[pIndex] == currentOrder
        end
      end
      self._lalaWinMsg[index] = currentOrder
      local isMatch = true
      local currentOrder
      while isMatch do
        currentOrder = math.random(0, 9)
        isMatch = false
        for pIndex = 0, index - 1 do
          isMatch = isMatch or self._lalaLoseMsg[pIndex] == currentOrder
        end
      end
      self._lalaLoseMsg[index] = currentOrder
    else
      self._lalaOrder[index] = math.random(0, 4)
      self._roundScore[index] = math.random(1, 5)
      self._lalaWinMsg[index] = math.random(0, 9)
      self._lalaLoseMsg[index] = math.random(0, 9)
    end
    local lalaCardTable = self._lala[self._lalaCard][self._lalaOrder[index] + 1]
    local lalaCardValue = self._grade[lalaCardTable[1]][lalaCardTable[2]]
    local gradeString = ""
    if 0 == lalaCardTable[1] then
      gradeString = "S"
    elseif 1 == lalaCardTable[1] then
      gradeString = "A"
    elseif 2 == lalaCardTable[1] then
      gradeString = "B"
    elseif 3 == lalaCardTable[1] then
      gradeString = "C"
    end
    self._ui._otherCard[index]._grade:SetText(gradeString .. " ë“±ê¸‰")
    self._ui._otherCard[index]._point:SetText(lalaCardTable[2] .. "ë‹¨ê³„")
    self._ui._otherCard[index]._value:SetText(lalaCardValue .. "ì ")
    self._ui._otherCard[index]._bg:SetShow(false)
    self._ui._otherCard[index]._result:SetShow(false)
  end
  self._ui._currentRoundScore:SetText("ì´ë²ˆ ë¼ìš´ë“œì— ê±¸ë¦° ì ìˆ˜ : " .. self._roundScore[0] .. "ì ")
  self._ui._round:SetText(self._currentRount .. " / 5 ë¼ìš´ë“œ")
  self._ui._score:SetText("ë‚´ ì ìˆ˜ : 0ì \në¼ë¼ ì ìˆ˜ : 0ì ")
  self._myScore = 0
  self._lalaScore = 0
  self:bubbleAniRun("ì•ˆë…•í•˜ì„¸ìš”, ëª¨í—˜ê°€ë‹˜. ì €ë‘ í•œ ê²œ í•˜ì‹¤ë˜ìš”")
  self._ui._cardSettingBg:SetShow(false)
  self._ui._boardBg:SetShow(true)
end
function PaGlobal_CardGame_Reset()
  local self = PaGlobal_CardGame
  for index = 1, 20 do
    local grade = math.floor((index - 1) / 5)
    local gradeString = ""
    if 0 == grade then
      gradeString = "S"
    elseif 1 == grade then
      gradeString = "A"
    elseif 2 == grade then
      gradeString = "B"
    elseif 3 == grade then
      gradeString = "C"
    end
    local value = (index - 1) % 5 + 1
    self._ui._card[grade][value]._check:SetCheck(false)
  end
  self._totalSelectedCount = 0
  self._totalValue = 0
  self._ui._cardDesc:SetText("ì„ íƒí•œ ì¹´ë“œ : " .. self._totalSelectedCount .. "ì¥\nì¹´ë“œ ì ìˆ˜ : " .. self._totalValue .. "ì ")
end
function PaGlobal_CardGame_SelectCard(index)
  local self = PaGlobal_CardGame
  for cIndex = 0, 4 do
    self._ui._myCard[cIndex]._check:SetCheck(cIndex == index)
  end
end
function PaGlobal_CardGame_Go()
  local self = PaGlobal_CardGame
  local isCheck = false
  local _index = 0
  for index = 0, 4 do
    if self._ui._myCard[index]._check:IsCheck() then
      isCheck = true
      _index = index
    end
  end
  if not isCheck then
    Proc_ShowMessage_Ack("ì¹´ë“œë¥¼ ì„ íƒí•´ì£¼ì„¸ìš”.")
    return
  end
  PaGlobal_CardGame_EnemyCard(self._currentRount, _index)
end
function PaGlobal_CardGame_GameReset()
  local self = PaGlobal_CardGame
  if 5 < self._currentRount then
    self._currentRount = 1
    self._ui._cardSettingBg:SetShow(true)
    self._ui._boardBg:SetShow(false)
    PaGlobal_CardGame_Reset()
  else
    Proc_ShowMessage_Ack("ê²Œì„ì´ ì•„ì§ ì§„í–‰ì¤‘ì…ë‹ˆë‹¤.")
  end
end
function PaGlobal_CardGame_EnemyCard(round, myCardIndex)
  local self = PaGlobal_CardGame
  local lalaCardTable = self._lala[self._lalaCard][self._lalaOrder[round - 1] + 1]
  local lalaCardValue = self._grade[lalaCardTable[1]][lalaCardTable[2]]
  local myCardValue = self._grade[self._myCard[myCardIndex]._grade][self._myCard[myCardIndex]._value]
  if 5 == lalaCardTable[2] and 1 == self._myCard[myCardIndex]._value then
    self._ui._myCard[myCardIndex]._result:SetText("O")
    self._ui._otherCard[round - 1]._result:SetText("X")
    self._myScore = self._myScore + self._roundScore[round - 1]
  elseif 1 == lalaCardTable[2] and 5 == self._myCard[myCardIndex]._value then
    self._ui._myCard[myCardIndex]._result:SetText("X")
    self._ui._otherCard[round - 1]._result:SetText("O")
    self._lalaScore = self._lalaScore + self._roundScore[round - 1]
  elseif lalaCardValue < myCardValue then
    self._ui._myCard[myCardIndex]._result:SetText("O")
    self._ui._otherCard[round - 1]._result:SetText("X")
    self._myScore = self._myScore + self._roundScore[round - 1]
  elseif lalaCardValue > myCardValue then
    self._ui._myCard[myCardIndex]._result:SetText("X")
    self._ui._otherCard[round - 1]._result:SetText("O")
    self._lalaScore = self._lalaScore + self._roundScore[round - 1]
  else
    self._ui._myCard[myCardIndex]._result:SetText("=")
    self._ui._otherCard[round - 1]._result:SetText("=")
    self._roundScore[round] = self._roundScore[round] + self._roundScore[round - 1]
  end
  self._ui._myCard[myCardIndex]._check:SetShow(false)
  self._ui._myCard[myCardIndex]._result:SetShow(true)
  self._ui._myCard[myCardIndex]._check:SetCheck(false)
  self._ui._otherCard[round - 1]._bg:SetShow(true)
  self._ui._otherCard[round - 1]._result:SetShow(true)
  self._currentRount = self._currentRount + 1
  if 5 < self._currentRount then
    if self._myScore < self._lalaScore then
      self._ui._round:SetText("íŒ¨ë°°")
      self:bubbleAniRun("ë„ˆë¬´ë‚˜ ì‰¬ìš´ ê²Œì„ì˜€ë„¤ìš”. ì¢€ ë” ì—°ìŠµí•´ì˜¤ì„¸ìš”.")
      self:resultMessageShow("íŒ¨ë°°í–ˆìŠµë‹ˆë‹¤.\në‚´ ì ìˆ˜ : " .. self._myScore .. " / ë¼ë¼ ì ìˆ˜ : " .. self._lalaScore)
    else
      self._ui._round:SetText("ìŠ¹ë¦¬")
      self:bubbleAniRun("ì•„ì´ë¥¼ ìƒëŒ€ë¡œ í”¼ë„ ëˆˆë¬¼ë„ ì—†ìœ¼ì‹œêµ°ìš”. ã…œ.ã…œ")
      self:resultMessageShow("ìŠ¹ë¦¬í–ˆìŠµë‹ˆë‹¤.\në‚´ ì ìˆ˜ : " .. self._myScore .. " / ë¼ë¼ ì ìˆ˜ : " .. self._lalaScore)
    end
  else
    self._ui._currentRoundScore:SetText("ì´ë²ˆ ë¼ìš´ë“œì— ê±¸ë¦° ì ìˆ˜ : " .. self._roundScore[round] .. "ì ")
    self._ui._round:SetText(self._currentRount .. " / 5 ë¼ìš´ë“œ")
    if "X" == self._ui._myCard[myCardIndex]._result:GetText() then
      self:bubbleAniRun(self._lalaWinMessage[self._lalaWinMsg[round - 1]])
      self:resultMessageShow("ì´ë²ˆ ë¼ìš´ë“œ íŒ¨ë°°! ë¼ë¼ì—ê²Œ +" .. self._roundScore[round - 1] .. "ì ")
    elseif "O" == self._ui._myCard[myCardIndex]._result:GetText() then
      self:bubbleAniRun(self._lalaLoseMessage[self._lalaLoseMsg[round - 1]])
      self:resultMessageShow("ì´ë²ˆ ë¼ìš´ë“œ ìŠ¹ë¦¬! ìì‹ ì—ê²Œ +" .. self._roundScore[round - 1] .. "ì ")
    else
      self:bubbleAniRun("ë‹¤ìŒ íŒì€ ì œê°€ ê¼­ ê°€ì ¸ê°ˆ ê±°ì—ìš”.")
      self:resultMessageShow("ì´ë²ˆ ë¼ìš´ë“œ ë¬´ìŠ¹ë¶€! ë‹¤ìŒ ë¼ìš´ë“œ ì ìˆ˜ì— +" .. self._roundScore[round - 1] .. "ì ")
    end
  end
  self._ui._score:SetText("ë‚´ ì ìˆ˜ : " .. self._myScore .. "ì \në¼ë¼ ì ìˆ˜ : " .. self._lalaScore .. "ì ")
end
function PaGlobal_CardGame:bubbleAniRun(text)
  self._ui._bubbleText:SetText(text)
  self._ui._bubbleText:SetSize(math.max(117, self._ui._bubbleText:GetTextSizeX()), self._ui._bubbleText:GetSizeY())
  self._ui._bubbleBg:SetSize(self._ui._bubbleText:GetSizeX() + 33, self._ui._bubbleBg:GetSizeY())
  self._ui._bubbleBg:ComputePos()
  self._ui._bubbleBg:SetShow(true)
  local openAni = self._ui._bubbleBg:addColorAnimation(0, 0,22, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  openAni:SetStartColor(Defines.Color.C_00FFFFFF)
  openAni:SetEndColor(Defines.Color.C_FFFFFFFF)
  openAni:SetStartIntensity(3)
  openAni:SetEndIntensity(1)
  openAni.IsChangeChild = true
  local closeAni = self._ui._bubbleBg:addColorAnimation(3, 3,22, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor(Defines.Color.C_FFFFFFFF)
  closeAni:SetEndColor(Defines.Color.C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end
function PaGlobal_CardGame:resultMessageShow(text)
  self._ui._resultMessage:SetText(text)
  self._ui._resultMessage:SetShow(true)
  local openAni = self._ui._resultMessage:addColorAnimation(0, 0,22, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  openAni:SetStartColor(Defines.Color.C_00FFFFFF)
  openAni:SetEndColor(Defines.Color.C_FFFFFFFF)
  openAni:SetStartIntensity(3)
  openAni:SetEndIntensity(1)
  openAni.IsChangeChild = true
  local closeAni = self._ui._resultMessage:addColorAnimation(5, 5,22, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor(Defines.Color.C_FFFFFFFF)
  closeAni:SetEndColor(Defines.Color.C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end
function FGlobal_CardGame_Open()
  local self = PaGlobal_CardGame
  self:Open()
end
function FGlobal_CardGame_Close()
  PaGlobal_CardGame:Close()
end
function FGlobal_CardGame_Init()
  PaGlobal_CardGame:Init()
end
registerEvent("FromClient_luaLoadComplete", "FGlobal_CardGame_Init")
