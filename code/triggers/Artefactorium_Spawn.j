function Trig_Artefactorium_Spawn_Conditions takes nothing returns boolean
    return GetOrderTargetUnit() == gg_unit_h007_0065
endfunction

function Trig_Artefactorium_Spawn_Func002C takes nothing returns boolean
    return CountUnitsInGroup(udg_UnitGroup) < 5
endfunction

function Trig_Artefactorium_Spawn_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Artefactorium_Pick, Player(11))
    if(Trig_Artefactorium_Spawn_Func002C())then
        set udg_Point = GetRandomLocInRect(gg_rct_Artefactorium_Spawn)
        call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(11), udg_Point, bj_UNIT_FACING)
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", ArctUnit)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    endif
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Artefactorium_Spawn takes nothing returns nothing
    set gg_trg_Artefactorium_Spawn = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Artefactorium_Spawn, ArctUnit, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Artefactorium_Spawn, Condition(function Trig_Artefactorium_Spawn_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Spawn, function Trig_Artefactorium_Spawn_Actions)
endfunction
