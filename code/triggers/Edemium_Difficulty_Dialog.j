
function Trig_Edemium_Difficulty_Dialog_Conditions takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[2]))then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Difficulty_Dialog_Func009C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[1] == true))then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Difficulty_Dialog_Func010C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[2] == true))then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Difficulty_Dialog_Actions takes nothing returns nothing
    call DialogClearBJ(udg_DifficultyDialog)
    call DialogSetMessageBJ(udg_DifficultyDialog, "Уровень сложности:")
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFF00C850Послушник|r")
    set udg_DialogButton[3] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFBFBFC2Паломник|r")
    set udg_DialogButton[4] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFFDC00Пастырь|r")
    set udg_DialogButton[5] = GetLastCreatedButtonBJ()
    if(Trig_Edemium_Difficulty_Dialog_Func009C())then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFF9000Паладин|r")
        set udg_DialogButton[6] = GetLastCreatedButtonBJ()
    else
    endif
    if(Trig_Edemium_Difficulty_Dialog_Func010C())then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFE30000Пилигрим|r")
        set udg_DialogButton[7] = GetLastCreatedButtonBJ()
    else
    endif
    call DialogAddButtonBJ(udg_DifficultyDialog, "Мне и так хорошо.")
    set udg_DialogButton[8] = GetLastCreatedButtonBJ()
    call DialogDisplayBJ(true, udg_DifficultyDialog, Player(0))
endfunction

function InitTrig_Edemium_Difficulty_Dialog takes nothing returns nothing
    set gg_trg_Edemium_Difficulty_Dialog = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Edemium_Difficulty_Dialog, udg_TeleportDialog)
    call TriggerAddCondition(gg_trg_Edemium_Difficulty_Dialog, Condition(function Trig_Edemium_Difficulty_Dialog_Conditions))
    call TriggerAddAction(gg_trg_Edemium_Difficulty_Dialog, function Trig_Edemium_Difficulty_Dialog_Actions)
endfunction
