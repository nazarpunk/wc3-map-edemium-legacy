function Trig_Events_Elapsed_Actions takes nothing returns nothing
    if udg_EdemEventType == 1 then
        set udg_EventAttribute = (10 + GetHeroLevel(udg_Arct))
        call DialogClearBJ(udg_EdemEventDialog)
        call DialogSetMessageBJ(udg_EdemEventDialog, "Бродя по Эдемиуму, его стены всегда |nказались Аркту безупречно гладкими, |nбудто вытесанный и отполированный |nмрамор, однако в одном месте Аркт|nслучайно нащупал небольшое |nотверстие, идеально подходящее для |nуказательного пальца. Стоит ли Аркту |nпросунуть в отверстие палец, или нет?")
        call DialogAddButtonBJ(udg_EdemEventDialog, "Засунуть палец.")
        set udg_EdemEventButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EdemEventDialog, ("Осмотреться (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
        set udg_EdemEventButton[2] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EdemEventDialog, "Пройти мимо.")
        call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Events_Elapsed takes nothing returns nothing
    set gg_trg_Events_Elapsed = CreateTrigger()
    call DisableTrigger(gg_trg_Events_Elapsed)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Events_Elapsed, 120.00)
    call TriggerAddAction(gg_trg_Events_Elapsed, function Trig_Events_Elapsed_Actions)
endfunction
