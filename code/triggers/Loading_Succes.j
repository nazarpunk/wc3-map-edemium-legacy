function Trig_Loading_Succes_Actions takes nothing returns nothing
    if udg_LoadSucces then
        call CinematicModeExBJ(false, GetPlayersAll(), 2.00)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
        call ConditionalTriggerExecute(gg_trg_Attributes_Multiboard)
        set udg_TutorialHint[4] = true
        call ConditionalTriggerExecute(gg_trg_QG_Generate)
        call DestroyTrigger(gg_trg_Initialisation_Dialog)
    else
        call DialogClearBJ(udg_InitDialog)
        call DialogSetMessageBJ(udg_InitDialog, "")
        call DialogAddButtonBJ(udg_InitDialog, "Пройти обучение")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_InitDialog, "Обойтись без обучения")
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogDisplayBJ(true, udg_InitDialog, Player(0))
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Loading_Succes takes nothing returns nothing
    set gg_trg_Loading_Succes = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Loading_Succes, udg_LoadingTimer)
    call TriggerAddAction(gg_trg_Loading_Succes, function Trig_Loading_Succes_Actions)
endfunction
