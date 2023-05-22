
function Trig_Effect_4_Vampirism_Func004C takes nothing returns boolean
    if(not(udg_DamageEventOverride == false))then
        return false
    endif
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Conditions takes nothing returns boolean
    if(not Trig_Effect_4_Vampirism_Func004C())then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Func003C takes nothing returns boolean
    if(not(udg_AbilityPower > 1.00))then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Actions takes nothing returns nothing
    set udg_AbilityPower = (udg_DamageEventAmount * 0.30)
    set udg_AbilityPower = (udg_AbilityPower + I2R(udg_CO_Combo))
    if(Trig_Effect_4_Vampirism_Func003C())then
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 7.50, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
    endif
endfunction
function InitTrig_Effect_4_Vampirism takes nothing returns nothing
    set gg_trg_Effect_4_Vampirism = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_4_Vampirism)
    call TriggerRegisterVariableEvent(gg_trg_Effect_4_Vampirism, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Effect_4_Vampirism, Condition(function Trig_Effect_4_Vampirism_Conditions))
    call TriggerAddAction(gg_trg_Effect_4_Vampirism, function Trig_Effect_4_Vampirism_Actions)
endfunction