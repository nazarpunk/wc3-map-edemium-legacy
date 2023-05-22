

function Trig_Ending_Dialogue_1_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] or GetClickedButton() == udg_DialogButton[5] or GetClickedButton() == udg_DialogButton[6] then
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor2, "Если это всё что ты чувствуешь на пороге в Эдем, мне становится неясно - зачем тогда ты прошёл весь этот путь не имея высшей цели. Эдем не открывается тем, кому он не нужен. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor3, "Ты достоин войти в Эдем, но готов ли ты ради этого отбросить свои привязанности, отпустить любимых и простить врагов, отказаться от всех желаний и испытать настоящую смерть?", bj_TIMETYPE_ADD, 1.00, true)
        call DialogClearBJ(udg_EndingDialog)
        call DialogSetMessageBJ(udg_EndingDialog, "Готов ли ты?")
        call DialogAddButtonBJ(udg_EndingDialog, "Да")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EndingDialog, "Нет")
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
        call EnableTrigger(gg_trg_Ending_Dialogue_2)
        call DestroyTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Ending_Dialogue_1 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_1 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_1)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_1, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_1, function Trig_Ending_Dialogue_1_Actions)
endfunction