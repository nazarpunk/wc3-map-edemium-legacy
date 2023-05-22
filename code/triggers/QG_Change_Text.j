
function Trig_QG_Change_Text_Actions takes nothing returns nothing
    set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    call QuestItemSetDescriptionBJ(udg_QG_Requirement[1], udg_QG_Objective[1])
    call QuestItemSetDescriptionBJ(udg_QG_Requirement[2], udg_QG_Objective[2])
endfunction

function InitTrig_QG_Change_Text takes nothing returns nothing
    set gg_trg_QG_Change_Text = CreateTrigger()
    call TriggerAddAction(gg_trg_QG_Change_Text, function Trig_QG_Change_Text_Actions)
endfunction
