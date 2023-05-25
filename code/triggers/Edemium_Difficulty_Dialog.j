function Trig_Edemium_Difficulty_Dialog_Conditions takes nothing returns boolean
    return GetClickedButton() == udg_DialogButton[2]
endfunction

function Trig_Edemium_Difficulty_Dialog_Actions takes nothing returns nothing
    call DialogClear(udg_DifficultyDialog)
    call DialogSetMessage(udg_DifficultyDialog, "Уровень сложности:")
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFF00C850Послушник|r")
    set udg_DialogButton[3] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFBFBFC2Паломник|r")
    set udg_DialogButton[4] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFFDC00Пастырь|r")
    set udg_DialogButton[5] = bj_lastCreatedButton
    if udg_Difficulty_Unlocked[1] then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFF9000Паладин|r")
        set udg_DialogButton[6] = bj_lastCreatedButton
    endif
    if udg_Difficulty_Unlocked[2] then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFE30000Пилигрим|r")
        set udg_DialogButton[7] = bj_lastCreatedButton
    endif
    call DialogAddButtonBJ(udg_DifficultyDialog, "Мне и так хорошо.")
    set udg_DialogButton[8] = bj_lastCreatedButton
    call DialogDisplayBJ(true, udg_DifficultyDialog, Player(0))
endfunction

function InitTrig_Edemium_Difficulty_Dialog takes nothing returns nothing
    set gg_trg_Edemium_Difficulty_Dialog = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Edemium_Difficulty_Dialog, udg_TeleportDialog)
    call TriggerAddCondition(gg_trg_Edemium_Difficulty_Dialog, Condition(function Trig_Edemium_Difficulty_Dialog_Conditions))
    call TriggerAddAction(gg_trg_Edemium_Difficulty_Dialog, function Trig_Edemium_Difficulty_Dialog_Actions)
endfunction
