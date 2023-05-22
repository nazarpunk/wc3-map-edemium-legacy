

function Trig_Ending_Dialogue_2_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] then
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor4, "Отвечай честно.", bj_TIMETYPE_ADD, 1.00, true)
        call DialogClearBJ(udg_EndingDialog)
        call DialogSetMessageBJ(udg_EndingDialog, "Отвечай честно.")
        call DialogAddButtonBJ(udg_EndingDialog, "Я готов")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EndingDialog, "Я не готов")
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
        call EnableTrigger(gg_trg_Ending_Dialogue_3)
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor5, "Тогда путь был проделан зря. Твои деяния потеряли значение. Возвращайся обратно и доживай свой век на поводу у своих слабостей. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction


function InitTrig_Ending_Dialogue_2 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_2)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_2, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_2, function Trig_Ending_Dialogue_2_Actions)
endfunction
