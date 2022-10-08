local edit_createCount, edit_shotSizeX, edit_shotSizeY
if true == ToClient_IsDevelopment() then
  registerEvent("FromClient_luaLoadComplete", "initCreateFaceBone")
end
function initCreateFaceBone()
  if false == ToClient_IsDevelopment() then
    return
  end
  local static_MainBG = UI.getChildControl(Panel_CreateRandomFaceBoneForDEV, "Static_MainBG")
  local btn_close = UI.getChildControl(Panel_CreateRandomFaceBoneForDEV, "Button_Close")
  btn_close:addInputEvent("Mouse_LUp", "HandleClicked_CreateFaceBoneForDev_ClosePanel()")
  local createBtn = UI.getChildControl(static_MainBG, "Button_1")
  createBtn:addInputEvent("Mouse_LUp", "HandleClicked_createRandomFace()")
  edit_createCount = UI.getChildControl(static_MainBG, "Edit_1")
  edit_createCount:SetEditText("1")
  local explorerBtn = UI.getChildControl(static_MainBG, "Button_2")
  explorerBtn:addInputEvent("Mouse_LUp", "HandleClicked_loadFaceBoneExplorer()")
  edit_shotSizeX = UI.getChildControl(static_MainBG, "Edit_2")
  edit_shotSizeX:SetEditText("800")
  edit_shotSizeY = UI.getChildControl(static_MainBG, "Edit_3")
  edit_shotSizeY:SetEditText("600")
  ToClient_resetCreateRandomFaceBone()
  registerEvent("FromClient_TakeFaceScreenShotForRandoeFace", "FromClient_TakeFaceScreenShotForRandoeFace")
  registerEvent("FromClient_TakeFaceScreenShotForRandoeFaceEnd", "FromClient_TakeFaceScreenShotForRandoeFaceEnd")
  registerEvent("onScreenResize", "rePosition_FaceBoneUI_DEV")
  FaceBoneUI_Show(false)
end
function initializeValue()
  edit_createCount:SetEditText("1")
  edit_shotSizeX:SetEditText("800")
  edit_shotSizeY:SetEditText("600")
end
function HandleClicked_CreateFaceBoneForDev_ClosePanel()
  Panel_CreateRandomFaceBoneForDEV:SetShow(false)
  if nil ~= PaGloabl_RandFaceBoneOpen_DEV_Show then
    PaGloabl_RandFaceBoneOpen_DEV_Show(true)
  end
end
function loadFaceBone(fileName)
  local paramIndex = 0
  local paramValue = PaGlobalFunc_CustomizationMesh_GetParamValue(0)
  local folderName = FileExplorer_GetCurrentFolderName()
  ToClient_applyFaceBoneDataByBeautyAlbumDev(folderName, fileName, paramIndex, paramValue)
  closeExplorer()
  setUseFaceCustomizationHair(true)
end
function closeFaceBoneExplorer()
end
function HandleClicked_loadFaceBoneExplorer()
  local FilterType = {"txt"}
  FileExplorer_Open("FaceBone íƒìƒ‰ê¸°", 0, FilterType)
  FileExplorerSetFilterBoxAtIndex(0)
  FileExplorerAddPathToCurrentPath("FaceBone")
  FileExplorer_NotUseFilterComboBox(false)
  FileExplorer_SetEditText("None")
  FileExplorer_setEditTextMaxInput(100)
  FileExplorer_CustomConfirmFunction(loadFaceBone)
  refreshFileList()
end
function FaceBoneUI_Show(isShow)
  Panel_CreateRandomFaceBoneForDEV:SetShow(isShow)
  Panel_CreateRandomFaceBoneForDEV:SetPosX(getScreenSizeX() / 1,5)
  Panel_CreateRandomFaceBoneForDEV:SetPosY(getScreenSizeY() / 2)
  if true == isShow then
    PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(1)
  end
end
function FromClient_TakeFaceScreenShotForRandoeFaceEnd()
  initializeValue()
  FaceBoneUI_Show(true)
  if nil ~= PaGloabl_RandFaceBoneOpen_DEV_Show then
    PaGloabl_RandFaceBoneOpen_DEV_Show(true)
  end
end
function rePosition_FaceBoneUI_DEV()
end
function FromClient_TakeFaceScreenShotForRandoeFace()
  if nil ~= TakeFaceScreenShotForRandomFace then
    TakeFaceScreenShotForRandomFace()
  end
end
function HandleClicked_createRandomFace()
  if true == ToClient_isPregressCreationFaceBone() then
    _PA_LOG("ë°•ê´‘ìš´", "ì´ë¯¸ FaceBone ìƒì„±ì´ ì‹¤í–‰ ì¤‘ ì…ë‹ˆë‹¤.")
    return
  end
  local function useConfirm()
    local count = edit_createCount:GetEditNumber()
    local sizeX = edit_shotSizeX:GetEditNumber()
    local sizeY = edit_shotSizeY:GetEditNumber()
    if count <= 0 then
      _PA_LOG("ë°•ê´‘ìš´", "ì´ë¯¸ FaceBone ìƒì„± ê°œìˆ˜ê°€ 0 ì´í•˜ ì´ë©´ ì•ˆë©ë‹ˆë‹¤.")
    end
    PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(1)
    ToClient_setRandomFaceCreationCountAndShotSize(count, sizeX, sizeY)
    ToClient_startCreateRandomFaceBone()
    FaceBoneUI_Show(false)
  end
  PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(1)
  local strTemp = "FaceBoneì„" .. tostring(edit_createCount:GetEditText()) .. "ê°œ ìƒì„± í•©ë‹ˆê¹Œ"
  local messageboxData = {
    title = "Random FaceBone ìƒì„±",
    content = strTemp,
    functionYes = useConfirm,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
local _fileExplorer
local _currentFileIndex = 0
local _maxFileCount = 0
local _isWating = false
local _curWatingTime = 0
local _maxWatingTime = 0,5
local _beautyFileName = ""
local _beautyFolderName = "BeautyAlbum_DEV"
local _beautyTexturefolderName = "BeautyAlbumTexture_DEV"
local _curState = 0
local _screenSizeX = 1024
local _screenSizeY = 1024
local _focusOn = false
function HandleClicked_CreateFaceBoneForDev_CreateBeautyAlbum()
  if nil == Panel_CreateRandomFaceBoneForDEV then
    return
  end
  local messageboxData = {
    title = "ë·°í‹°ì•¨ë²” ì •ë³´ë¡œ ì´ˆìƒí™” ì´¬ì˜",
    content = "BeautyAlbum_DEV í´ë”ì— ìˆëŠ” ë·°í‹°ì•¨ë²” ì •ë³´ë“¤ ëª¨ë‘ ì´ˆìƒí™” ì´¬ì˜í•˜ì‹œê² ìŠµë‹ˆê¹Œ",
    functionYes = PaGlobalFunc_CreateFaceBoneForDev_StartCaptureByBeautyAlbum,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_CreateFaceBoneForDev_StartCaptureByBeautyAlbum()
  if nil == Panel_CreateRandomFaceBoneForDEV then
    return
  end
  _fileExplorer = ToClient_getFileExplorer()
  if nil == _fileExplorer then
    return
  end
  _fileExplorer:init()
  _fileExplorer:setAddPathToCurrentPath(_beautyFolderName)
  _maxFileCount = _fileExplorer:getCurrentFoloderFileList("")
  if 0 == _maxFileCount then
    _PA_LOG("ì¡°ê´‘ë¯¼", "_maxFileCount ê°€ 0ì´ë‹¤!")
    return
  end
  _focusOn = false
  startPosePickingMode()
  _currentFileIndex = 0
  _beautyFileName = ""
  _curWatingTime = _maxWatingTime
  _curState = 0
  Panel_CreateRandomFaceBoneForDEV:SetShow(true)
  Panel_CreateRandomFaceBoneForDEV:SetPosX(getScreenSizeX() - 1)
  Panel_CreateRandomFaceBoneForDEV:SetPosY(getScreenSizeY() - 1)
  Panel_CreateRandomFaceBoneForDEV:RegisterUpdateFunc("PaGlobalFunc_CreateFaceBoneForDev_UpdatePerFrame")
end
function PaGlobalFunc_CreateFaceBoneForDev_UpdatePerFrame(deltaTime)
  if nil == Panel_CreateRandomFaceBoneForDEV then
    return
  end
  if _maxFileCount <= _currentFileIndex then
    _currentFileIndex = 0
    _maxFileCount = 0
    _beautyFileName = ""
    Panel_CreateRandomFaceBoneForDEV:ClearUpdateLuaFunc()
    Panel_CreateRandomFaceBoneForDEV:SetShow(false)
    endPickingMode()
    return
  end
  _curWatingTime = _curWatingTime + deltaTime
  if _curWatingTime < _maxWatingTime then
    return
  end
  _curWatingTime = 0
  if 0 == _curState then
    local fileName = _fileExplorer:getFileNameAtIndex(_currentFileIndex)
    if nil ~= fileName and fileName ~= _beautyFileName then
      _beautyFileName = fileName
      if nil ~= _beautyFileName then
        if nil ~= PaGlobal_SetCameraLookDisable then
          PaGlobal_SetCameraLookDisable()
        end
        if nil ~= string.find(_beautyFileName, ".bdc", -4) then
          loadCustomizationData(_beautyFileName, FileExplorer_getCurrentPath())
          if true == MessageBoxGetShow() then
            postProcessMessageData()
          end
          _maxWatingTime = 0,1
          if false == _focusOn then
            _curState = 1
          else
            _curState = 2
          end
        end
      end
    end
    if 0 == _curState and fileName == _beautyFileName then
      _currentFileIndex = _currentFileIndex + 1
      _maxWatingTime = 0,1
    end
  elseif 1 == _curState then
    PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(2)
    _maxWatingTime = 0,1
    _curState = 2
  elseif 2 == _curState then
    local paramIndex = 0
    local paramValue = PaGlobalFunc_CustomizationMesh_GetParamValue(0)
    lobby_saveAndClearFaceBoneByBeautyAlbumDev(paramIndex, paramValue)
    lobby_reapplyCustomizationDataByBeautyAlbumDev()
    setUseFaceCustomizationHair(true)
    _maxWatingTime = 0,1
    if false == _focusOn then
      _curState = 3
      _focusOn = true
    else
      _curState = 4
    end
  elseif 3 == _curState then
    PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(1)
    _maxWatingTime = 1,4
    _curState = 4
  else
    if true == TakeFaceScreenShotByBeautyAlbum(_screenSizeX, _screenSizeY) then
      _curState = 0
    end
    _maxWatingTime = 0,3
  end
end
function PaGlobalFunc_CreateFaceBoneForDev_CaptureFaceByBeautyAlbum()
  local index = _currentFileIndex
  ToClientEnd_CaptureFaceByBeautyAlbumDev(index, _beautyTexturefolderName, _beautyFileName, _screenSizeX, _screenSizeY)
  _currentFileIndex = _currentFileIndex + 1
end
function PaGlobalFunc_CreateFaceBoneForDev_CaptureBaseSetting(CustomizationGroupIndex)
  if nil ~= SelectCustomizationGroup then
    SelectCustomizationGroup(CustomizationGroupIndex)
    if nil ~= Panel_CustomizationFrame then
      Panel_CustomizationFrame:SetShow(false)
    end
  end
  if nil ~= PaGlobal_SetCameraLookDisable then
    PaGlobal_SetCameraLookDisable()
  end
  setUseFaceCustomizationHair(true)
end
