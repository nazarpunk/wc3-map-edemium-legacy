
function Trig_Enter_Dialog_Conditions takes nothing returns boolean
    if(not(GetEnteringUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 4))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 3))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 2))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011C takes nothing returns boolean
    if(not(udg_Difficulty == 1))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001C takes nothing returns boolean
    if(not(udg_Tutorial[5] == false))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Actions takes nothing returns nothing
    if(Trig_Enter_Dialog_Func001C())then
        call DialogClearBJ(udg_TeleportDialog)
        call DialogSetMessageBJ(udg_TeleportDialog, "Вперёд?")
        call DialogAddButtonBJ(udg_TeleportDialog, "Да!")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        if(Trig_Enter_Dialog_Func001Func011C())then
            call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFF00C850Послушник|r")
        else
            if(Trig_Enter_Dialog_Func001Func011Func001C())then
                call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFBFBFC2Паломник|r")
            else
                if(Trig_Enter_Dialog_Func001Func011Func001Func001C())then
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFFDC00Пастырь|r")
                else
                    if(Trig_Enter_Dialog_Func001Func011Func001Func001Func001C())then
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
    else
        set udg_Tutorial[5] = false
        call DisableTrigger(gg_trg_Camera_Fix)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 1.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
        call TriggerSleepAction(1.00)
        call TriggerExecute(gg_trg_Tutorial_Cinematic)
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Enter_Dialog takes nothing returns nothing
    set gg_trg_Enter_Dialog = CreateTrigger()
    call DisableTrigger(gg_trg_Enter_Dialog)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Dialog, gg_rct_Edemium)
    call TriggerAddCondition(gg_trg_Enter_Dialog, Condition(function Trig_Enter_Dialog_Conditions))
    call TriggerAddAction(gg_trg_Enter_Dialog, function Trig_Enter_Dialog_Actions)
endfunction