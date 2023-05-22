
function Trig_Boss_Casts_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Func001Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303053))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303130))then
        return true
    endif
    return false
endfunction
function Trig_Boss_Casts_Func001Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130354F))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Func001C takes nothing returns boolean
    if(not Trig_Boss_Casts_Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Actions takes nothing returns nothing
    if(Trig_Boss_Casts_Func001C())then
        set udg_Boss_Ability_Point = GetUnitLoc(GetSpellTargetUnit())
        call CreateTextTagUnitBJ("!!!", GetTriggerUnit(), 0, 12.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 30.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    else
        if(Trig_Boss_Casts_Func001Func002C())then
            call SetUnitLifeBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) + GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetSpellTargetUnit())))
        else
        endif
    endif
endfunction
function InitTrig_Boss_Casts takes nothing returns nothing
    set gg_trg_Boss_Casts = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_Casts, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Boss_Casts, Condition(function Trig_Boss_Casts_Conditions))
    call TriggerAddAction(gg_trg_Boss_Casts, function Trig_Boss_Casts_Actions)
endfunction