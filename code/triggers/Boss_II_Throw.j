
function Trig_Boss_II_Throw_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303130))then
        return false
    endif
    return true
endfunction

function Trig_Boss_II_Throw_Func011Func001C takes nothing returns boolean
    if(not(GetEnumUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction

function Trig_Boss_II_Throw_Func011A takes nothing returns nothing
    if(Trig_Boss_II_Throw_Func011Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", udg_Arct)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0.00, 70.00, 100.00, 0.00)
    else
    endif
endfunction

function Trig_Boss_II_Throw_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303550, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Boss_Ability_Point)
    call TriggerSleepAction(0.60)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303552, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(220.00, udg_Boss_Ability_Point)
    call ForGroupBJ(udg_UnitGroup, function Trig_Boss_II_Throw_Func011A)
    call GroupClear(udg_UnitGroup)
    call DestroyGroup(udg_UnitGroup)
    call RemoveLocation(udg_Boss_Ability_Point)
endfunction

function InitTrig_Boss_II_Throw takes nothing returns nothing
    set gg_trg_Boss_II_Throw = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_II_Throw, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_II_Throw, Condition(function Trig_Boss_II_Throw_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Throw, function Trig_Boss_II_Throw_Actions)
endfunction
