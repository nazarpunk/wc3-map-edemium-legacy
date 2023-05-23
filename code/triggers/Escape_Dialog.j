function Trig_Escape_Dialog_Actions takes nothing returns nothing
    call DestroyGroup(udg_UnitGroup)
    call DialogClearBJ(udg_LeaveDialog)
    call DialogSetMessageBJ(udg_LeaveDialog, "Покинуть Эдемиум?")
    call DialogAddButtonBJ(udg_LeaveDialog, "Да!")
    if not udg_EnchantingRoom and not udg_ER_Logic and not udg_OnkieRoom and not udg_CS_Bool then
        set udg_LeaveButton = GetLastCreatedButtonBJ()
    else
        set udg_LeaveButton2 = GetLastCreatedButtonBJ()
    endif
    call DialogAddButtonBJ(udg_LeaveDialog, "Стоп, забыл кое-что.")
    call DialogDisplayBJ(true, udg_LeaveDialog, Player(0))
endfunction

function InitTrig_Escape_Dialog takes nothing returns nothing
    set gg_trg_Escape_Dialog = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Dialog)
    call TriggerRegisterUnitEvent(gg_trg_Escape_Dialog, gg_unit_h009_0006, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_Escape_Dialog, function Trig_Escape_Dialog_Actions)
endfunction