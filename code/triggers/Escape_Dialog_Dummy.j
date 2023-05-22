
function Trig_Escape_Dialog_Dummy_Actions takes nothing returns nothing
    call IssueImmediateOrderBJ(gg_unit_h009_0006, "berserk")
endfunction

function InitTrig_Escape_Dialog_Dummy takes nothing returns nothing
    set gg_trg_Escape_Dialog_Dummy = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Escape_Dialog_Dummy, Player(0))
    call TriggerAddAction(gg_trg_Escape_Dialog_Dummy, function Trig_Escape_Dialog_Dummy_Actions)
endfunction
