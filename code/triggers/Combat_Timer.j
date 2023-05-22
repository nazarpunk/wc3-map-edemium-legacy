
function Trig_Combat_Timer_Actions takes nothing returns nothing
    set udg_Combat = false
    set udg_CO_Combo = 0
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CO_ComboSeries[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("|cFFFFFFFFСерия ударов:|r |cFF449EFF" + I2S(udg_CO_Combo)))
    call CreateTextTagUnitBJ("X", udg_Arct, 0, 20.00, 80.00, 0.00, 0.00, 10.00)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 200.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.50)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.25)
    call DisableTrigger(gg_trg_Combo_Ability_Use)
endfunction
function InitTrig_Combat_Timer takes nothing returns nothing
    set gg_trg_Combat_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combat_Timer, udg_CO_CombatTimer)
    call TriggerAddAction(gg_trg_Combat_Timer, function Trig_Combat_Timer_Actions)
endfunction