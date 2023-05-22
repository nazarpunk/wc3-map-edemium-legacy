
function Trig_Creep_Kill_Recipes_Func001Func002Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303032))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303033))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303031))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303030))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303054))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[19] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303056))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[18] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303050))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[16] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30305A))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[15] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304F))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[14] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303052))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[12] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303041))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[11] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303051))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[10] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303055))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[9] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304B))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[8] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303043))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[7] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304E))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[6] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func002C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303034))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func002C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[4] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func001C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[3] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304A))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[2] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func001C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[1] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 2))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Recipes_Func001C())then
        set udg_Point = GetUnitLoc(GetDyingUnit())
        if(Trig_Creep_Kill_Recipes_Func001Func002C())then
            call CreateItemLoc(0x49303137, udg_Point)
        else
            if(Trig_Creep_Kill_Recipes_Func001Func002Func003C())then
                call CreateItemLoc(0x49303132, udg_Point)
            else
                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003C())then
                    call CreateItemLoc(0x49303134, udg_Point)
                else
                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003C())then
                        call CreateItemLoc(0x49303136, udg_Point)
                    else
                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001C())then
                            call CreateItemLoc(0x49303037, udg_Point)
                        else
                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001C())then
                                call CreateItemLoc(0x49303038, udg_Point)
                            else
                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001C())then
                                    call CreateItemLoc(0x49303039, udg_Point)
                                else
                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001C())then
                                        call CreateItemLoc(0x49303041, udg_Point)
                                    else
                                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001C())then
                                            call CreateItemLoc(0x49303042, udg_Point)
                                        else
                                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001C())then
                                                call CreateItemLoc(0x49303043, udg_Point)
                                            else
                                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001C())then
                                                    call CreateItemLoc(0x49303044, udg_Point)
                                                else
                                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004C())then
                                                        call CreateItemLoc(0x49303048, udg_Point)
                                                    else
                                                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001C())then
                                                            call CreateItemLoc(0x49303049, udg_Point)
                                                        else
                                                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001C())then
                                                                call CreateItemLoc(0x4930304A, udg_Point)
                                                            else
                                                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001C())then
                                                                    call CreateItemLoc(0x4930304E, udg_Point)
                                                                else
                                                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001Func001C())then
                                                                        call CreateItemLoc(0x4930304F, udg_Point)
                                                                    else
                                                                    endif
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        call RemoveLocation(udg_Point)
    else
    endif
endfunction
function InitTrig_Creep_Kill_Recipes takes nothing returns nothing
    set gg_trg_Creep_Kill_Recipes = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Recipes, function Trig_Creep_Kill_Recipes_Actions)
endfunction