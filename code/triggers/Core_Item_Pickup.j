function Trig_Core_Item_Pickup_Actions takes nothing returns nothing
    if GetItemType(GetManipulatedItem()) == ITEM_TYPE_CAMPAIGN then
        set udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] = (udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] + 1)
        call RemoveItem(GetManipulatedItem())
    endif
    if GetItemType(GetManipulatedItem()) == ITEM_TYPE_PURCHASABLE then
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
    endif
endfunction

function InitTrig_Core_Item_Pickup takes nothing returns nothing
    set gg_trg_Core_Item_Pickup = CreateTrigger()
    call DisableTrigger(gg_trg_Core_Item_Pickup)
    call TriggerRegisterUnitEvent(gg_trg_Core_Item_Pickup, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Core_Item_Pickup, function Trig_Core_Item_Pickup_Actions)
endfunction
