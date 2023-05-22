
function Trig_Effect_1_Heal_Actions takes nothing returns nothing
    set udg_AbilityPower = ((I2R(udg_CO_Power) * (0.50 + (0.20 * I2R(udg_AS_AbilityLVL[1])))) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
    call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
endfunction
function InitTrig_Effect_1_Heal takes nothing returns nothing
    set gg_trg_Effect_1_Heal = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_1_Heal)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_1_Heal, 2.00)
    call TriggerAddAction(gg_trg_Effect_1_Heal, function Trig_Effect_1_Heal_Actions)
endfunction