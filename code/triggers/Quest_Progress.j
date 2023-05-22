
function Trig_Quest_Progress_Actions takes nothing returns nothing
    set udg_QG_Count[udg_QG_ObjectiveState[1]] = (udg_QG_Count[udg_QG_ObjectiveState[1]] + 3)
    set udg_QG_Count[udg_QG_ObjectiveState[2]] = (udg_QG_Count[udg_QG_ObjectiveState[2]] + 3)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
endfunction
function InitTrig_Quest_Progress takes nothing returns nothing
    set gg_trg_Quest_Progress = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Quest_Progress, Player(0), "-", true)
    call TriggerAddAction(gg_trg_Quest_Progress, function Trig_Quest_Progress_Actions)
endfunction