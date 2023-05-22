
function Trig_Item_Pickup_Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_POWERUP))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_PURCHASABLE))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CAMPAIGN))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetManipulatedItem()) == 0x4930304D))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Actions takes nothing returns nothing
    if(Trig_Item_Pickup_Func001C())then
        call AdjustPlayerStateBJ(1, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
        call RemoveItem(GetManipulatedItem())
    else
        if(Trig_Item_Pickup_Func001Func001C())then
            set udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] = (udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] + 1)
            call RemoveItem(GetManipulatedItem())
        else
            if(Trig_Item_Pickup_Func001Func001Func001C())then
                call ShowUnitShow(udg_CC_SecretUnit[GetItemLevel(GetManipulatedItem())])
                set udg_CC_SecretUnlocked[GetItemLevel(GetManipulatedItem())] = true
                call RemoveItem(GetManipulatedItem())
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\Slow\\SlowCaster.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call AddSpecialEffectTargetUnitBJ("overhead", gg_unit_H000_0004, "war3mapImported\\SoundEffect3.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ("Секрет раскрыт!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
            else
                if(Trig_Item_Pickup_Func001Func001Func001Func001C())then
                    call RemoveItem(GetManipulatedItem())
                else
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Item_Pickup takes nothing returns nothing
    set gg_trg_Item_Pickup = CreateTrigger()
    call DisableTrigger(gg_trg_Item_Pickup)
    call TriggerRegisterUnitEvent(gg_trg_Item_Pickup, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Item_Pickup, function Trig_Item_Pickup_Actions)
endfunction