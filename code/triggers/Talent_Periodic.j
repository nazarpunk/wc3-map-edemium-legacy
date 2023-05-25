function Trig_Talent_Periodic_Func002Func001Func011A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(11) and UnitAlive(GetEnumUnit()) then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Blue Lightning.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    endif
endfunction

function Trig_Talent_Periodic_Actions takes nothing returns nothing
    if udg_ART[2] > 0 then
        if udg_Combat and not udg_Artefactorium then
            set udg_ARTInteger[1] = (udg_ARTInteger[1] + 1)
            if udg_ARTInteger[1] == 10 then
                set udg_ARTInteger[1] = 0
                set udg_RandomNumber = (udg_ART[GetUnitUserData(gg_unit_h00H_0002)] + 1)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            endif
        endif
    endif
    if udg_ART[8] > 0 then
        if GetRandomInt(1, 100) <= 5 then
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
    if udg_ART[9] > 0 then
        if udg_Combat then
            set udg_ARTInteger[2] = (udg_ARTInteger[2] + 1)
            if udg_ARTInteger[2] == 5 then
                set udg_ARTInteger[2] = 0
                set udg_CO_Combo = (udg_CO_Combo + (1 * udg_ART[9]))
                call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("Серия ударов: " + I2S(udg_CO_Combo)))
            endif
        endif
    endif
    if udg_ART[14] > 0 then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00)
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        if udg_AbilityPower > GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) then
            if udg_ARTInteger[4] == 0 then
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