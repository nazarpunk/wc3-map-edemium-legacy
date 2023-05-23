
function Trig_Talent_Periodic_Func001Func001Func002C takes nothing returns boolean
    if(not(udg_ARTInteger[1] == 10))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func001Func001C takes nothing returns boolean
    if(not(udg_Combat == true))then
        return false
    endif
    if(not(udg_Artefactorium == false))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func001C takes nothing returns boolean
    if(not(udg_ART[2] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func002Func001Func011Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    if(not(IsUnitAliveBJ(GetEnumUnit()) == true))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func002Func001Func011A takes nothing returns nothing
    if(Trig_Talent_Periodic_Func002Func001Func011Func001C())then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Blue Lightning.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    endif
endfunction

function Trig_Talent_Periodic_Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 5))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func002C takes nothing returns boolean
    if(not(udg_ART[8] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func003Func001Func002C takes nothing returns boolean
    if(not(udg_ARTInteger[2] == 5))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func003Func001C takes nothing returns boolean
    if(not(udg_Combat == true))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func003C takes nothing returns boolean
    if(not(udg_ART[9] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func004Func003Func001C takes nothing returns boolean
    if(not(udg_ARTInteger[4] == 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func004Func003C takes nothing returns boolean
    if(not(udg_AbilityPower > GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct)))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Func004C takes nothing returns boolean
    if(not(udg_ART[14] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Periodic_Actions takes nothing returns nothing
    if(Trig_Talent_Periodic_Func001C())then
        if(Trig_Talent_Periodic_Func001Func001C())then
            set udg_ARTInteger[1] = (udg_ARTInteger[1] + 1)
            if(Trig_Talent_Periodic_Func001Func001Func002C())then
                set udg_ARTInteger[1] = 0
                set udg_RandomNumber = (udg_ART[GetUnitUserData(gg_unit_h00H_0002)] + 1)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            endif
        endif
    endif
    if(Trig_Talent_Periodic_Func002C())then
        if(Trig_Talent_Periodic_Func002Func001C())then
            set udg_AbilityPower = (I2R(udg_ART[8]) * 50.00)
            set udg_Point = GetUnitLoc(udg_Arct)
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(500.00, udg_Point)
            call RemoveLocation(udg_Point)
            set udg_UnitGroupPlayer = GetUnitsOfPlayerAll(Player(0))
            call GroupRemoveGroup(udg_UnitGroupPlayer, udg_UnitGroup)
            call DestroyGroup(udg_UnitGroupPlayer)
            set udg_UnitGroupPlayer = GetUnitsOfPlayerAll(Player(1))
            call GroupRemoveGroup(udg_UnitGroupPlayer, udg_UnitGroup)
            call DestroyGroup(udg_UnitGroupPlayer)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Talent_Periodic_Func002Func001Func011A)
            call DestroyGroup(udg_UnitGroup)
        endif
    endif
    if(Trig_Talent_Periodic_Func003C())then
        if(Trig_Talent_Periodic_Func003Func001C())then
            set udg_ARTInteger[2] = (udg_ARTInteger[2] + 1)
            if(Trig_Talent_Periodic_Func003Func001Func002C())then
                set udg_ARTInteger[2] = 0
                set udg_CO_Combo = (udg_CO_Combo + (1 * udg_ART[9]))
                call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("Серия ударов: " + I2S(udg_CO_Combo)))
            endif
        endif
    endif
    if(Trig_Talent_Periodic_Func004C())then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00)
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        if(Trig_Talent_Periodic_Func004Func003C())then
            if(Trig_Talent_Periodic_Func004Func003Func001C())then
                set udg_ARTInteger[4] = 1
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (100.00 * I2R(udg_ART[14]))))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            endif
        endif
    endif
endfunction

function InitTrig_Talent_Periodic takes nothing returns nothing
    set gg_trg_Talent_Periodic = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Talent_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Talent_Periodic, function Trig_Talent_Periodic_Actions)
endfunction
