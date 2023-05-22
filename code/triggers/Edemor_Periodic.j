function Trig_Edemor_Periodic_Func001Func010Func012Func012C takes nothing returns boolean
    if(not(udg_ER_Creeps[4] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Periodic_Func001Func010Func012C takes nothing returns boolean
    if(not(udg_ER_Creeps[3] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Periodic_Func001Func010C takes nothing returns boolean
    if(not(udg_ER_Creeps[2] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Periodic_Func001C takes nothing returns boolean
    if(not(udg_ER_Creeps[1] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Periodic_Actions takes nothing returns nothing
    if(Trig_Edemor_Periodic_Func001C())then
        set udg_ER_Creeps[1] = (udg_ER_Creeps[1] - 1)
        set udg_Point = GetRandomLocInRect(gg_rct_Arena_Spawn)
        call CreateNUnitsAtLoc(1, udg_D_CreepType[1], Player(11), udg_Point, GetRandomReal(0, 360.00))
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
        call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
        call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    else
        if(Trig_Edemor_Periodic_Func001Func010C())then
            set udg_ER_Creeps[2] = (udg_ER_Creeps[2] - 1)
            set udg_Point = GetRandomLocInRect(gg_rct_Arena_Spawn)
            call CreateNUnitsAtLoc(1, udg_D_CreepType[2], Player(11), udg_Point, GetRandomReal(0, 360.00))
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
            call UnitAddAbilityBJ(0x41303438, GetLastCreatedUnit())
            call UnitAddAbilityBJ(0x41303434, GetLastCreatedUnit())
            call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
            call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call RemoveLocation(udg_Point)
        else
            if(Trig_Edemor_Periodic_Func001Func010Func012C())then
                set udg_ER_Creeps[3] = (udg_ER_Creeps[3] - 1)
                set udg_Point = GetRandomLocInRect(gg_rct_Arena_Spawn)
                call CreateNUnitsAtLoc(1, udg_D_CreepType[3], Player(11), udg_Point, GetRandomReal(0, 360.00))
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
                call UnitAddAbilityBJ(0x41303436, GetLastCreatedUnit())
                call UnitAddAbilityBJ(0x41303437, GetLastCreatedUnit())
                call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
                call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
                call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call RemoveLocation(udg_Point)
            else
                if(Trig_Edemor_Periodic_Func001Func010Func012Func012C())then
                    set udg_ER_Creeps[4] = (udg_ER_Creeps[4] - 1)
                    set udg_Point = GetRandomLocInRect(gg_rct_Arena_Spawn)
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(4, 5)], Player(11), udg_Point, GetRandomReal(0, 360.00))
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
                    call UnitAddAbilityBJ(0x41303455, GetLastCreatedUnit())
                    call UnitAddAbilityBJ(0x41303451, GetLastCreatedUnit())
                    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
                    call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call RemoveLocation(udg_Point)
                else
                    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_Skills)
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Edemor_Periodic takes nothing returns nothing
    set gg_trg_Edemor_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Edemor_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemor_Periodic, 0.20)
    call TriggerAddAction(gg_trg_Edemor_Periodic, function Trig_Edemor_Periodic_Actions)
endfunction