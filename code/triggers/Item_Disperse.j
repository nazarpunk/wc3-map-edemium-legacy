
function Trig_Item_Disperse_Func017C takes nothing returns boolean
    if((GetItemType(GetSpellTargetItem()) == ITEM_TYPE_CHARGED))then
        return true
    endif
    if((GetItemType(GetSpellTargetItem()) == ITEM_TYPE_ARTIFACT))then
        return true
    endif
    return false
endfunction

function Trig_Item_Disperse_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303349))then
        return false
    endif
    if(not Trig_Item_Disperse_Func017C())then
        return false
    endif
    return true
endfunction

function Trig_Item_Disperse_Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetSpellTargetItem()) == 4))then
        return false
    endif
    return true
endfunction

function Trig_Item_Disperse_Func002C takes nothing returns boolean
    if(not(GetItemType(GetSpellTargetItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction

function Trig_Item_Disperse_Actions takes nothing returns nothing
    local integer price
    if(Trig_Item_Disperse_Func002C())then
        if(Trig_Item_Disperse_Func002Func001C())then
            set price = (S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 1, 1)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 2, 2)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 3, 3)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 4, 4)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 5, 5)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 6, 6)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 7, 7)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 8, 8)))
            set price = (price + (3 * udg_ART[6]))
            call AdjustPlayerStateBJ(price, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
            call CreateTextTagUnitBJ(("+" + I2S(price)), udg_Arct, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
        else
            set price = (S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 1, 1)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 2, 2)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 3, 3)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 4, 4)))
            set price = (price + (3 * udg_ART[6]))
            call AdjustPlayerStateBJ(price, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
            call CreateTextTagUnitBJ(("+" + I2S(price)), udg_Arct, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
        endif
    endif
    set udg_QG_Count[6] = (udg_QG_Count[6] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 75.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    set udg_Point = GetItemLoc(GetSpellTargetItem())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call RemoveItem(GetSpellTargetItem())
endfunction

function InitTrig_Item_Disperse takes nothing returns nothing
    set gg_trg_Item_Disperse = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Item_Disperse, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Item_Disperse, Condition(function Trig_Item_Disperse_Conditions))
    call TriggerAddAction(gg_trg_Item_Disperse, function Trig_Item_Disperse_Actions)
endfunction
