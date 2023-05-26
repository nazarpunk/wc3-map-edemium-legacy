function Trig_Chest_Unlock_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044 or GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045 or GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046
endfunction

function Trig_Chest_Unlock_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetUnitLoc(GetOrderTargetUnit())
    set udg_Chest = GetOrderTargetUnit()
    if DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00 then
        if GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044 then
            set udg_ChestEnergy = 10
        else
            if GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045 then
                set udg_ChestEnergy = 20
            endif
            if GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046 then
                set udg_ChestEnergy = 30
            endif
        endif
        set udg_Chest = GetOrderTargetUnit()
        call DialogClear(udg_ChestDialog)
        call DialogSetMessage(udg_ChestDialog, GetUnitName(udg_Chest))
        call DialogAddButton(udg_ChestDialog, ("Открыть потратив |cFF449EFF" + (I2S(udg_ChestEnergy) + " |rэнергии.")), 0)
        set udg_ChestButtonEnergy = bj_lastCreatedButton
        call DialogAddButton(udg_ChestDialog, "|cFFFFFFFFОткрыть Ключом Эдемора.|r", 0)
        set udg_ChestButtonKey = bj_lastCreatedButton
        call DialogAddButton(udg_ChestDialog, "Обойдусь.", 0)
        call DialogDisplayBJ(true, udg_ChestDialog, Player(0))
    else
        call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
endfunction

function InitTrig_Chest_Unlock takes nothing returns nothing
    set gg_trg_Chest_Unlock = CreateTrigger()
    call DisableTrigger(gg_trg_Chest_Unlock)
    call TriggerRegisterUnitEvent(gg_trg_Chest_Unlock, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Chest_Unlock, Condition(function Trig_Chest_Unlock_Conditions))
    call TriggerAddAction(gg_trg_Chest_Unlock, function Trig_Chest_Unlock_Actions)
endfunction