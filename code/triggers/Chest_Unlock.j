
function Trig_Chest_Unlock_Func007C takes nothing returns boolean
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044))then
        return true
    endif
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045))then
        return true
    endif
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046))then
        return true
    endif
    return false
endfunction
function Trig_Chest_Unlock_Conditions takes nothing returns boolean
    if(not Trig_Chest_Unlock_Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetUnitLoc(GetOrderTargetUnit())
    set udg_Chest = GetOrderTargetUnit()
    if(Trig_Chest_Unlock_Func004C())then
        if(Trig_Chest_Unlock_Func004Func001C())then
            set udg_ChestEnergy = 10
        else
            if(Trig_Chest_Unlock_Func004Func001Func001C())then
                set udg_ChestEnergy = 20
            else
            endif
            if(Trig_Chest_Unlock_Func004Func001Func002C())then
                set udg_ChestEnergy = 30
            else
            endif
        endif
        set udg_Chest = GetOrderTargetUnit()
        call DialogClearBJ(udg_ChestDialog)
        call DialogSetMessageBJ(udg_ChestDialog, GetUnitName(udg_Chest))
        call DialogAddButtonBJ(udg_ChestDialog, ("Открыть потратив |cFF449EFF" + (I2S(udg_ChestEnergy) + " |rэнергии.")))
        set udg_ChestButtonEnergy = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_ChestDialog, "|cFFFFFFFFОткрыть Ключом Эдемора.|r")
        set udg_ChestButtonKey = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_ChestDialog, "Обойдусь.")
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