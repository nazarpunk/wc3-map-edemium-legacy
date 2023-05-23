function Trig_Dummy_Remove_Conditions takes nothing returns boolean
    local integer id = GetUnitTypeId(GetTriggerUnit())
    return id == 0x68303039 or id == 0x68303045 or id == 0x68303034 or id == 0x68303133 or id == 0x68303134 or id == 0x68303035
endfunction

function Trig_Dummy_Remove_Actions takes nothing returns nothing
    call RemoveUnit(GetTriggerUnit())
endfunction

function InitTrig_Dummy_Remove takes nothing returns nothing
    set gg_trg_Dummy_Remove = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Dummy_Remove, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Dummy_Remove, Condition(function Trig_Dummy_Remove_Conditions))
    call TriggerAddAction(gg_trg_Dummy_Remove, function Trig_Dummy_Remove_Actions)
endfunction
