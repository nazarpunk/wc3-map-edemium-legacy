function EditUpperButtonBarButton takes integer buttonId, integer anchor, real offsetX, real offsetY, real width, real height returns nothing
    local integer pButtonFrame = GetUpperButtonBarButton(buttonId)
    local integer pRootFrame = GetRootFrame()
    if(width >= 0)then
        call SetFrameWidth(pButtonFrame, width)
    endif
    if(height >= 0)then
        call SetFrameHeight(pButtonFrame, height)
    endif
    if(buttonId == 0)then
        call SetFramePoint(pButtonFrame, ANCHOR_TOPLEFT, pRootFrame, anchor, offsetX, - offsetY)
    else
        call SetFramePoint(pButtonFrame, ANCHOR_LEFT, pRootFrame, anchor, offsetX, - (offsetY + GetFrameHeight(pButtonFrame) / 2))
    endif
endfunction
function EditHeroBarHealthBar takes integer buttonId, integer anchor, real offsetX, real offsetY, real width, real height returns nothing
    local integer pHealthFrame = Memory[GetHeroBarButton(buttonId) / 4 + 115]
    local integer pRootFrame = GetRootFrame()
    if(width >= 0)then
        call SetFrameWidth(pHealthFrame, width)
    endif
    if(height >= 0)then
        call SetFrameHeight(pHealthFrame, height)
    endif
    call SetFramePoint(pHealthFrame, ANCHOR_TOP, pRootFrame, anchor, offsetX + GetFrameWidth(pHealthFrame) / 2, - offsetY)
endfunction
function EditHeroBarManaBar takes integer buttonId, integer anchor, real offsetX, real offsetY, real width, real height returns nothing
    local integer pManaFrame = Memory[GetHeroBarButton(buttonId) / 4 + 116]
    local integer pRootFrame = GetRootFrame()
    if(width >= 0)then
        call SetFrameWidth(pManaFrame, width)
    endif
    if(height >= 0)then
        call SetFrameHeight(pManaFrame, height)
    endif
    call SetFramePoint(pManaFrame, ANCHOR_TOP, pRootFrame, anchor, offsetX + GetFrameWidth(pManaFrame) / 2, - offsetY)
endfunction
function Interface__Init takes nothing returns nothing
    set address_GetGameUI = address_GameBase + 0x300710
    set address_SetFramePoint = address_GameBase + 0x606770
    set address_SetFramePoint2 = address_GameBase + 0x6061B0
    set address_SetFrameWidth = address_GameBase + 0x605D90
    set address_SetFrameHeight = address_GameBase + 0x605DB0
    set address_GetFrameTextAddress = address_GameBase + 0x61C7B0
    set address_GetFrameItemAddress = address_GameBase + 0x5FA970
    set address_GetFrameSkinAddress = address_GameBase + 0x31F530
    set address_UpdateFrameText = address_GameBase + 0x60CA10
    set pGameUI = GetGameUI(0, 0)
endfunction
function GetWindowX takes nothing returns integer
    return std_call1(address_GetWindowX, 0)
endfunction
function GetWindowY takes nothing returns integer
    return std_call1(address_GetWindowY, 0)
endfunction
function GetWindowWidth takes nothing returns integer
    return std_call1(address_GetWindowWidth, 0)
endfunction
function GetWindowHeight takes nothing returns integer
    return std_call1(address_GetWindowHeight, 0)
endfunction
function GetMouseX takes nothing returns integer
    return std_call1(address_GetMouseX, 0)
endfunction
function GetMouseY takes nothing returns integer
    return std_call1(address_GetMouseY, 0)
endfunction
function GetWheelDelta takes nothing returns integer
    return std_call1(address_GetWheelDelta, 0)
endfunction
function GetTriggerKey takes nothing returns integer
    return std_call1(address_GetTriggerKey, 0)
endfunction
    if(ExportAndInjectDLL(RENDEREDGE_DLL, RENDEREDGE_DLL))then
        set address_GetWindowX = GetModuleProcAddress(RENDEREDGE_DLL, "GetWindowX")
        set address_GetWindowY = GetModuleProcAddress(RENDEREDGE_DLL, "GetWindowY")
        set address_GetWindowWidth = GetModuleProcAddress(RENDEREDGE_DLL, "GetWindowWidth")
        set address_GetWindowHeight = GetModuleProcAddress(RENDEREDGE_DLL, "GetWindowHeight")
        set address_GetMouseX = GetModuleProcAddress(RENDEREDGE_DLL, "GetMouseX")
        set address_GetMouseY = GetModuleProcAddress(RENDEREDGE_DLL, "GetMouseY")
        set address_GetWheelDelta = GetModuleProcAddress(RENDEREDGE_DLL, "GetWheelDelta")
        set address_GetTriggerKey = GetModuleProcAddress(RENDEREDGE_DLL, "GetTriggerKey")
        set address_IsKeyDown = GetModuleProcAddress(RENDEREDGE_DLL, "IsKeyDown")
        set address_BlockMouse = GetModuleProcAddress(RENDEREDGE_DLL, "BlockMouse")
        set address_SetMousePos = GetModuleProcAddress(RENDEREDGE_DLL, "SetMousePos")
        set address_TriggerRegisterMouseMoveEvent = GetModuleProcAddress(RENDEREDGE_DLL, "TriggerRegisterMouseMoveEvent")
        set address_TriggerRegisterMouseWheelEvent = GetModuleProcAddress(RENDEREDGE_DLL, "TriggerRegisterMouseWheelEvent")
        set address_TriggerRegisterKeyEvent = GetModuleProcAddress(RENDEREDGE_DLL, "TriggerRegisterKeyEvent")
        set address_TriggerRegisterMouseEvent = GetModuleProcAddress(RENDEREDGE_DLL, "TriggerRegisterMouseEvent")
    else
        call Message("Failed to inject " + RENDEREDGE_DLL)
    endif
endfunction
function FromPixelX takes integer i returns real
    return i * 0.8 / GetWindowWidth()
endfunction
function FromPixelY takes integer i returns real
    return i * 0.6 / GetWindowHeight()
endfunction
function EditBlackBordersPixel takes integer upperHeight, integer bottomHeight returns nothing
    call EditBlackBorders(FromPixelX(upperHeight), FromPixelY(bottomHeight))
endfunction
function EditPortraitPixel takes integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditPortrait(anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditMinimapPixel takes integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditMinimap(anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditCommandBarButtonPixel takes integer row, integer column, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditCommandBarButton(row, column, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditItemBarButtonPixel takes integer buttonId, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditItemBarButton(buttonId, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditMinimapButtonPixel takes integer buttonId, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditMinimapButton(buttonId, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditUpperButtonBarButtonPixel takes integer buttonId, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditUpperButtonBarButton(buttonId, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditHeroBarHealthBarPixel takes integer buttonId, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditHeroBarHealthBar(buttonId, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditHeroBarManaBarPixel takes integer buttonId, integer anchor, integer offsetX, integer offsetY, integer width, integer height returns nothing
    call EditHeroBarManaBar(buttonId, anchor, FromPixelX(offsetX), FromPixelY(offsetY), FromPixelX(width), FromPixelY(height))
endfunction
function EditStandardInterface takes nothing returns nothing
    local integer portraitSize = 1
    local integer portraitStartX = 0
    local integer portraitStartY = 0
    local integer minimapSize = 1
    local integer minimapStartX = 0
    local integer minimapStartY = 0
    local integer minimapButtonSize = 1
    local integer minimapButtonStartX = 0
    local integer minimapButtonStartY = 0
    local integer minimapButtonDeltaX = 0
    local integer upperButtonWidth = 60
    local integer upperButtonHeight =- 1
    local integer upperBarStartX =- 60
    local integer upperBarStartY =- 23
    local integer upperBarDeltaY = 0
    local integer commandButtonSize = 50
    local integer commandBarStartX =- 180
    local integer commandBarStartY =- 155
    local integer commandBarDelta = commandButtonSize + 10
    local integer spellButtonSize = 50
    local integer spellBarStartX =- 180
    local integer spellBarStartY =- 100
    local integer spellBarDelta = spellButtonSize + 10
    local integer itemButtonSize = 44
    local integer itemBarStartX = 230
    local integer itemBarStartY =- 144
    local integer itemBarDelta = itemButtonSize
    local integer healthBarWidth = 400
    local integer healthBarHeight = 16
    local integer healthBarStartX =- healthBarWidth / 2 + 20
    local integer healthBarStartY =- 40
    call EditBlackBordersPixel(0, 0)
    call EditPortraitPixel(ANCHOR_TOPLEFT, portraitStartX, portraitStartY, portraitSize, portraitSize)
    call EditMinimapPixel(ANCHOR_TOPRIGHT, minimapStartX, minimapStartY, minimapSize, minimapSize)
    call EditMinimapButtonPixel(0, ANCHOR_TOPRIGHT, minimapButtonStartX + minimapButtonDeltaX * 0, minimapButtonStartY, minimapButtonSize, minimapButtonSize)
    call EditMinimapButtonPixel(1, ANCHOR_TOPRIGHT, minimapButtonStartX + minimapButtonDeltaX * 1, minimapButtonStartY, minimapButtonSize, minimapButtonSize)
    call EditMinimapButtonPixel(2, ANCHOR_TOPRIGHT, minimapButtonStartX + minimapButtonDeltaX * 2, minimapButtonStartY, minimapButtonSize, minimapButtonSize)
    call EditMinimapButtonPixel(3, ANCHOR_TOPRIGHT, minimapButtonStartX + minimapButtonDeltaX * 3, minimapButtonStartY, minimapButtonSize, minimapButtonSize)
    call EditMinimapButtonPixel(4, ANCHOR_TOPRIGHT, minimapButtonStartX + minimapButtonDeltaX * 4, minimapButtonStartY, minimapButtonSize, minimapButtonSize)
    call EditUpperButtonBarButtonPixel(0, ANCHOR_BOTTOMRIGHT, upperBarStartX - 120, upperBarStartY, upperButtonWidth, upperButtonHeight)
    call EditUpperButtonBarButtonPixel(1, ANCHOR_BOTTOMRIGHT, upperBarStartX - 60, upperBarStartY, upperButtonWidth, upperButtonHeight)
    call EditUpperButtonBarButtonPixel(2, ANCHOR_BOTTOMRIGHT, 0, 0, 0, 0)
    call EditUpperButtonBarButtonPixel(3, ANCHOR_BOTTOMRIGHT, upperBarStartX, upperBarStartY, upperButtonWidth, upperButtonHeight)
    call EditCommandBarButtonPixel(1, 2, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 0, commandBarStartY, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(0, 1, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 1, commandBarStartY, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(0, 2, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 2, commandBarStartY, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(0, 3, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 3 + 50, commandBarStartY, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(1, 0, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 4 + 50, commandBarStartY, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(0, 0, ANCHOR_BOTTOM, commandBarStartX + commandBarDelta * 5 + 50, commandBarStartY + 55, commandButtonSize, commandButtonSize)
    call EditCommandBarButtonPixel(1, 1, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 0, spellBarStartY, spellButtonSize, spellButtonSize)
    call EditCommandBarButtonPixel(2, 0, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 1, spellBarStartY, spellButtonSize, spellButtonSize)
    call EditCommandBarButtonPixel(2, 1, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 2, spellBarStartY, spellButtonSize, spellButtonSize)
    call EditCommandBarButtonPixel(2, 2, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 3 + 50, spellBarStartY, spellButtonSize, spellButtonSize)
    call EditCommandBarButtonPixel(2, 3, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 4 + 50, spellBarStartY, spellButtonSize, spellButtonSize)
    call EditCommandBarButtonPixel(1, 3, ANCHOR_BOTTOM, spellBarStartX + spellBarDelta * 6 + 147, - 122, 44, 44)
    call EditItemBarButtonPixel(0, ANCHOR_BOTTOM, itemBarStartX + itemBarDelta * 0, itemBarStartY + itemBarDelta * 0, itemButtonSize, itemButtonSize)
    call EditItemBarButtonPixel(1, ANCHOR_BOTTOM, itemBarStartX + itemBarDelta * 1, itemBarStartY + itemBarDelta * 0, itemButtonSize, itemButtonSize)
    call EditItemBarButtonPixel(2, ANCHOR_BOTTOM, itemBarStartX + itemBarDelta * 0, itemBarStartY + itemBarDelta * 0 + 44, itemButtonSize, itemButtonSize)
    call EditItemBarButtonPixel(3, ANCHOR_BOTTOM, itemBarStartX + itemBarDelta * 1, itemBarStartY + itemBarDelta * 0 + 44, itemButtonSize, itemButtonSize)
    call EditItemBarButtonPixel(4, ANCHOR_BOTTOM, 0, 100, itemButtonSize, itemButtonSize)
    call EditItemBarButtonPixel(5, ANCHOR_BOTTOM, 0, 100, itemButtonSize, itemButtonSize)
    call EditHeroBarHealthBarPixel(0, ANCHOR_BOTTOM, healthBarStartX, healthBarStartY, healthBarWidth, healthBarHeight)
    call EditHeroBarManaBarPixel(0, ANCHOR_BOTTOM, healthBarStartX, healthBarStartY + healthBarHeight + 4, healthBarWidth, healthBarHeight)
endfunction