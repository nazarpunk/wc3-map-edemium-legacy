
function Trig_Combat_Start_Func001C takes nothing returns boolean
    if(not(udg_Combat == false))then
        return false
    endif
    if(not(udg_ART[20] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Combat_Start_Actions takes nothing returns nothing
    if(Trig_Combat_Start_Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetRandomDirectionDeg())
        call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point2, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(15.00, 0x42544C46, GetLastCreatedUnit())
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_ART[20], false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "war3mapImported\\Flash.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
    endif
    set udg_Combat = true
    call StartTimerBJ(udg_CO_CombatTimer, false, 6.50)
    call EnableTrigger(gg_trg_Combo_Ability_Use)
endfunction
function InitTrig_Combat_Start takes nothing returns nothing
    set gg_trg_Combat_Start = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Combat_Start, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Combat_Start, function Trig_Combat_Start_Actions)
endfunction