
function Trig_Talent_Kill_Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303039))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303133))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303134))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x7567686F))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6F737031))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303039))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Kill_Conditions takes nothing returns boolean
    if(not Trig_Talent_Kill_Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Talent_Kill_Func002C takes nothing returns boolean
    if(not(udg_ART[4] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Kill_Func003Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (3 * udg_ART[5])))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Kill_Func003C takes nothing returns boolean
    if(not(udg_ART[5] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Talent_Kill_Actions takes nothing returns nothing
    if(Trig_Talent_Kill_Func002C())then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * (2.00 * I2R(udg_ART[4])))
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
    endif
    if(Trig_Talent_Kill_Func003C())then
        if(Trig_Talent_Kill_Func003Func001C())then
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
