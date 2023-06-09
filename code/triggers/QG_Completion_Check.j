function Trig_QG_Completion_Check_Actions takes nothing returns nothing
    if udg_QG_Count[udg_QG_ObjectiveState[1]] >= udg_QG_ObjectiveStateMax[1] and udg_QG_Count[udg_QG_ObjectiveState[2]] >= udg_QG_ObjectiveStateMax[2] then
        call DestroyQuestBJ(GetLastCreatedQuestBJ())
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00FF00Миссия осуществлена, коэффициент повышен.|r")
        set udg_EX_Rate = (udg_EX_Rate + 0.10)
        set udg_QG_QuestCompleted = (udg_QG_QuestCompleted + 1)
        call ConditionalTriggerExecute(gg_trg_QG_Generate)
    endif
endfunction

function InitTrig_QG_Completion_Check takes nothing returns nothing
    set gg_trg_QG_Completion_Check = CreateTrigger()
    call DisableTrigger(gg_trg_QG_Completion_Check)
    call TriggerRegisterTimerEventPeriodic(gg_trg_QG_Completion_Check, 1.00)
    call TriggerAddAction(gg_trg_QG_Completion_Check, function Trig_QG_Completion_Check_Actions)
endfunction