
function Trig_Boss_III_Portal_Spawn_Func001Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Func001C takes nothing returns boolean
    if(not(udg_Boss3PortalCounter == 0))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Actions takes nothing returns nothing
    if(Trig_Boss_III_Portal_Spawn_Func001C())then
        set udg_RandomNumber = GetRandomInt(1, 3)
        if(Trig_Boss_III_Portal_Spawn_Func001Func002C())then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
        else
            if(Trig_Boss_III_Portal_Spawn_Func001Func002Func002C())then
                set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
            else
                set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
            endif
        endif
        call CreateNUnitsAtLoc(1, 0x6E303048, Player(PLAYER_NEUTRAL_PASSIVE), udg_CO_Point, bj_UNIT_FACING)
        set udg_Boss3PortalCounter = (udg_Boss3PortalCounter + 1)
        call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 4)], Player(11), udg_CO_Point, bj_UNIT_FACING)
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
        call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
        call RemoveLocation(udg_CO_Point)
    else
    endif
endfunction
function InitTrig_Boss_III_Portal_Spawn takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Portal_Spawn, 15.00)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Spawn, function Trig_Boss_III_Portal_Spawn_Actions)
endfunction