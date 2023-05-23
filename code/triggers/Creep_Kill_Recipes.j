function Trig_Creep_Kill_Recipes_Actions takes nothing returns nothing
    local integer id = GetUnitTypeId(GetDyingUnit())

    if GetRandomInt(1, 100) <= 2 then
        set udg_Point = GetUnitLoc(GetDyingUnit())
        if (id == 0x6E303032 or id == 0x6E303033) and not udg_CC_SecretUnlocked[1] then
            call CreateItemLoc(0x49303137, udg_Point)
        endif
        if id == 0x6E30304A and not udg_CC_SecretUnlocked[2] then
            call CreateItemLoc(0x49303132, udg_Point)
        endif
        if (id == 0x6E303031 or id == 0x6E303030) and not udg_CC_SecretUnlocked[3] then
            call CreateItemLoc(0x49303134, udg_Point)
        endif
        if (id == 0x6E303035 or id == 0x6E303034) and not udg_CC_SecretUnlocked[4] then
            call CreateItemLoc(0x49303136, udg_Point)
        endif
        if id == 0x6E30304E and not udg_CC_SecretUnlocked[6] then
            call CreateItemLoc(0x49303037, udg_Point)
        endif
        if id == 0x6E303043 and not udg_CC_SecretUnlocked[7] then
            call CreateItemLoc(0x49303038, udg_Point)
        endif
        if id == 0x6E30304B and not udg_CC_SecretUnlocked[8] then
            call CreateItemLoc(0x49303039, udg_Point)
        endif
        if id == 0x6E303055 and not udg_CC_SecretUnlocked[9] then
            call CreateItemLoc(0x49303041, udg_Point)
        endif
        if id == 0x6E303051 and not udg_CC_SecretUnlocked[10] then
            call CreateItemLoc(0x49303042, udg_Point)
        endif
        if id == 0x6E303041 and not udg_CC_SecretUnlocked[11] then
            call CreateItemLoc(0x49303043, udg_Point)
        endif
        if id == 0x6E303052 and not udg_CC_SecretUnlocked[12] then
            call CreateItemLoc(0x49303044, udg_Point)
        endif
        if id == 0x6E30304F and not udg_CC_SecretUnlocked[14] then
            call CreateItemLoc(0x49303048, udg_Point)
        endif
        if id == 0x6E30305A and not udg_CC_SecretUnlocked[15] then
            call CreateItemLoc(0x49303049, udg_Point)
        endif
        if id == 0x6E303050 and not udg_CC_SecretUnlocked[16] then
            call CreateItemLoc(0x4930304A, udg_Point)
        endif
        if id == 0x6E303056 and not udg_CC_SecretUnlocked[18] then
            call CreateItemLoc(0x4930304E, udg_Point)
        endif
        if id == 0x6E303054 and not udg_CC_SecretUnlocked[19] then
            call CreateItemLoc(0x4930304F, udg_Point)
        endif
        call RemoveLocation(udg_Point)
    endif
endfunction

function InitTrig_Creep_Kill_Recipes takes nothing returns nothing
    set gg_trg_Creep_Kill_Recipes = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Recipes, function Trig_Creep_Kill_Recipes_Actions)
endfunction
