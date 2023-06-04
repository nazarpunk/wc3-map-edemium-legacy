function Trig_Item_Pickup_Actions takes nothing returns nothing
    if GetItemTypeId(GetManipulatedItem()) == 0x4930304D then
        call AdjustPlayerStateBJ(1, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
        call RemoveItem(GetManipulatedItem())
    else
        if GetItemType(GetManipulatedItem()) == ITEM_TYPE_CAMPAIGN then
            set udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] = (udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] + 1)
            call RemoveItem(GetManipulatedItem())
        else
            if GetItemType(GetManipulatedItem()) == ITEM_TYPE_PURCHASABLE then
                call ShowUnitShow(udg_CC_SecretUnit[GetItemLevel(GetManipulatedItem())])
                set udg_CC_SecretUnlocked[GetItemLevel(GetManipulatedItem())] = true
                call RemoveItem(GetManipulatedItem())
                call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "Abilities\\Spells\\Human\\Slow\\SlowCaster.mdl")
                call DestroyEffect(GetLastCreatedEffectBJ())
                call AddSpecialEffectTargetUnitBJ("overhead", ArctUnit, "war3mapImported\\SoundEffect3.mdx")
                call DestroyEffect(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ("Секрет раскрыт!", ArctUnit, 0, 11.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
            else
                if GetItemType(GetManipulatedItem()) == ITEM_TYPE_POWERUP then
                    call RemoveItem(GetManipulatedItem())
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Item_Pickup takes nothing returns nothing
    set gg_trg_Item_Pickup = CreateTrigger()
    call DisableTrigger(gg_trg_Item_Pickup)
    call TriggerRegisterUnitEvent(gg_trg_Item_Pickup, ArctUnit, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Item_Pickup, function Trig_Item_Pickup_Actions)
endfunction
