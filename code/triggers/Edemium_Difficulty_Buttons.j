
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[7]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[6]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[5]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[4]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[3]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 4))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 3))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 2))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006C takes nothing returns boolean
    if(not(udg_Difficulty == 1))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Actions takes nothing returns nothing
    if(Trig_Edemium_Difficulty_Buttons_Func001C())then
        set udg_Difficulty = 1
        set udg_DifficultyRate = 1.00
        set udg_CO_Time = 2.00
    else
        if(Trig_Edemium_Difficulty_Buttons_Func001Func001C())then
            set udg_Difficulty = 2
            set udg_DifficultyRate = 1.50
            set udg_CO_Time = 1.75
        else
            if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001C())then
                set udg_Difficulty = 3
                set udg_DifficultyRate = 2.00
                set udg_CO_Time = 1.50
            else
                if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001C())then
                    set udg_Difficulty = 4
                    set udg_DifficultyRate = 2.50
                    set udg_CO_Time = 1.25
                else
                    if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001Func001C())then
                        set udg_Difficulty = 5
                        set udg_DifficultyRate = 3.00
                        set udg_CO_Time = 1.00
                    else
                    endif
                endif
            endif
        endif
    endif
    call DialogClearBJ(udg_TeleportDialog)
    call DialogSetMessageBJ(udg_TeleportDialog, "Вперёд?")
    call DialogAddButtonBJ(udg_TeleportDialog, "Да!")
    set udg_DialogButton[1] = GetLastCreatedButtonBJ()
    if(Trig_Edemium_Difficulty_Buttons_Func006C())then
        call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFF00C850Послушник|r")
    else
        if(Trig_Edemium_Difficulty_Buttons_Func006Func001C())then
            call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFBFBFC2Паломник|r")
        else
            if(Trig_Edemium_Difficulty_Buttons_Func006Func001Func001C())then
                call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFFDC00Пастырь|r")
            else
                if(Trig_Edemium_Difficulty_Buttons_Func006Func001Func001Func001C())then
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFF8900Паладин|r")
                else
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFE30000Пилигрим|r")
                endif
            endif
        endif
    endif
    set udg_DialogButton[2] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_TeleportDialog, "Ещё минутку...")
    call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
endfunction
function InitTrig_Edemium_Difficulty_Buttons takes nothing returns nothing
    set gg_trg_Edemium_Difficulty_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Edemium_Difficulty_Buttons, udg_DifficultyDialog)
    call TriggerAddAction(gg_trg_Edemium_Difficulty_Buttons, function Trig_Edemium_Difficulty_Buttons_Actions)
endfunction