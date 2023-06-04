function Trig_Talent_Kill_Conditions takes nothing returns boolean
    local integer id = GetUnitTypeId(GetTriggerUnit())
    return GetOwningPlayer(GetTriggerUnit()) == Player(11) and id != 0x68303039 and id != 0x68303133 and id != 0x68303134 and id != 0x7567686F and id != 0x6F737031 and id != 0x6E303039
endfunction

function Trig_Talent_Kill_Actions takes nothing returns nothing
    if udg_ART[4] > 0 then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, ArctUnit) * (2.00 * I2R(udg_ART[4])))
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl")
        call DestroyEffect(GetLastCreatedEffectBJ())
        call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + udg_AbilityPower))
    endif
    if udg_ART[5] > 0 then
        if GetRandomInt(1, 100) <= (3 * udg_ART[5]) then
            set udg_AS_SeriesNumber = GetRandomInt(1, 4)
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        endif
    endif
endfunction

function InitTrig_Talent_Kill takes nothing returns nothing
    set gg_trg_Talent_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Talent_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Talent_Kill, Condition(function Trig_Talent_Kill_Conditions))
    call TriggerAddAction(gg_trg_Talent_Kill, function Trig_Talent_Kill_Actions)
endfunction