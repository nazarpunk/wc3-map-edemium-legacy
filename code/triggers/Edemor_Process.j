function Trig_Edemor_Process_Func011Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303230))then
        return false
    endif
    if(not(udg_ER_Count < (10 + (2 * udg_TierUnlocked))))then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func001Func001Func001C takes nothing returns boolean
    if(not Trig_Edemor_Process_Func011Func001Func001Func001Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func001Func001Func002C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x4930315A))then
        return false
    endif
    if(not(udg_ER_Count < (10 + (2 * udg_TierUnlocked))))then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func001Func001C takes nothing returns boolean
    if(not Trig_Edemor_Process_Func011Func001Func001Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func001Func002C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303159))then
        return false
    endif
    if(not(udg_ER_Count < (10 + (2 * udg_TierUnlocked))))then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func001C takes nothing returns boolean
    if(not Trig_Edemor_Process_Func011Func001Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011Func002C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303158))then
        return false
    endif
    if(not(udg_ER_Count < (10 + (2 * udg_TierUnlocked))))then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func011C takes nothing returns boolean
    if(not Trig_Edemor_Process_Func011Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Func017C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303231))then
        return false
    endif
    return true
endfunction

function Trig_Edemor_Process_Actions takes nothing returns nothing
    call RemoveItemFromStockBJ(0x49303158, GetTriggerUnit())
    call RemoveItemFromStockBJ(0x49303159, GetTriggerUnit())
    call RemoveItemFromStockBJ(0x4930315A, GetTriggerUnit())
    call RemoveItemFromStockBJ(0x49303230, GetTriggerUnit())
    call RemoveItemFromStockBJ(0x49303231, GetTriggerUnit())
    call AddItemToStockBJ(0x49303158, GetTriggerUnit(), 0, 1)
    call AddItemToStockBJ(0x49303159, GetTriggerUnit(), 0, 1)
    call AddItemToStockBJ(0x4930315A, GetTriggerUnit(), 0, 1)
    call AddItemToStockBJ(0x49303230, GetTriggerUnit(), 0, 1)
    call AddItemToStockBJ(0x49303231, GetTriggerUnit(), 0, 1)
    if(Trig_Edemor_Process_Func011C())then
        set udg_ER_Creeps[1] = (udg_ER_Creeps[1] + 1)
        set udg_ER_Reward = (udg_ER_Reward + 4)
        set udg_ER_Count = (udg_ER_Count + 1)
    else
        if(Trig_Edemor_Process_Func011Func001C())then
            set udg_ER_Creeps[2] = (udg_ER_Creeps[2] + 1)
            set udg_ER_Reward = (udg_ER_Reward + 6)
            set udg_ER_Count = (udg_ER_Count + 1)
        else
            if(Trig_Edemor_Process_Func011Func001Func001C())then
                set udg_ER_Creeps[3] = (udg_ER_Creeps[3] + 1)
                set udg_ER_Reward = (udg_ER_Reward + 8)
                set udg_ER_Count = (udg_ER_Count + 1)
            else
                if(Trig_Edemor_Process_Func011Func001Func001Func001C())then
                    set udg_ER_Creeps[4] = (udg_ER_Creeps[4] + 1)
                    set udg_ER_Reward = (udg_ER_Reward + 10)
                    set udg_ER_Count = (udg_ER_Count + 1)
                else
                endif
            endif
        endif
    endif
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 600.00, ("Слабых монстров: " + I2S(udg_ER_Creeps[1])))
    call DisplayTimedTextToForce(GetPlayersAll(), 600.00, ("Обычных монстров: " + I2S(udg_ER_Creeps[2])))
    call DisplayTimedTextToForce(GetPlayersAll(), 600.00, ("Сильных монстров: " + I2S(udg_ER_Creeps[3])))
    call DisplayTimedTextToForce(GetPlayersAll(), 600.00, ("Ужасных монстров: " + I2S(udg_ER_Creeps[4])))
    if(Trig_Edemor_Process_Func017C())then
        call RemoveItemFromStockBJ(0x49303158, GetTriggerUnit())
        call RemoveItemFromStockBJ(0x49303159, GetTriggerUnit())
        call RemoveItemFromStockBJ(0x4930315A, GetTriggerUnit())
        call RemoveItemFromStockBJ(0x49303230, GetTriggerUnit())
        call RemoveItemFromStockBJ(0x49303231, GetTriggerUnit())
        call EnableTrigger(gg_trg_Creep_Kill)
        call EnableTrigger(gg_trg_Edemor_Check)
        call ClearTextMessagesBJ(GetPlayersAll())
        call EnableTrigger(gg_trg_Edemor_Transparent)
        call SetUnitAnimation(gg_unit_h00V_0063, "death")
        call EnableTrigger(gg_trg_Edemium_Hero_Dies)
        call EnableTrigger(gg_trg_Edemor_Periodic)
    else
    endif
    call RemoveItem(GetSoldItem())
endfunction

function InitTrig_Edemor_Process takes nothing returns nothing
    set gg_trg_Edemor_Process = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Edemor_Process, gg_unit_h00V_0063, EVENT_UNIT_SELL_ITEM)
    call TriggerAddAction(gg_trg_Edemor_Process, function Trig_Edemor_Process_Actions)
endfunction
