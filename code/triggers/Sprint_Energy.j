function Trig_Sprint_Energy_Actions takes nothing returns nothing
    if GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > 0.00 then
        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 2.00))
        call CreateTextTagUnitBJ(I2S(R2I(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct))), udg_Arct, 0, 10.00, 0.00, 80.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
    else
        set udg_SprintLogic = false
        call SetUnitMoveSpeed(udg_Arct, GetUnitDefaultMoveSpeed(udg_Arct))
        call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Sprint_Energy takes nothing returns nothing
    set gg_trg_Sprint_Energy = CreateTrigger()
    call DisableTrigger(gg_trg_Sprint_Energy)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Sprint_Energy, 2.00)
    call TriggerAddAction(gg_trg_Sprint_Energy, function Trig_Sprint_Energy_Actions)
endfunction