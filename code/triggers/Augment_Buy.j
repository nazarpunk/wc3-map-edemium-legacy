
function Trig_Augment_Buy_Conditions takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303047))then
        return false
    endif
    return true
endfunction

function Trig_Augment_Buy_Func001Func010Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0013))then
        return false
    endif
    return true
endfunction

function Trig_Augment_Buy_Func001Func010Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0011))then
        return false
    endif
    return true
endfunction

function Trig_Augment_Buy_Func001Func010C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0012))then
        return false
    endif
    return true
endfunction

function Trig_Augment_Buy_Func001C takes nothing returns boolean
    if(not(GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) >= udg_AugmentCost[udg_AugmentValue]))then
        return false
    endif
    return true
endfunction

function Trig_Augment_Buy_Actions takes nothing returns nothing
    if(Trig_Augment_Buy_Func001C())then
        set udg_AugmentValue = GetUnitUserData(udg_Target)
        set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
        call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
        set udg_Point = GetUnitLoc(udg_Target)
        call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
        call RemoveLocation(udg_Point)
        set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
        set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
        call ClearTextMessagesBJ(GetPlayersAll())
        if(Trig_Augment_Buy_Func001Func010C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает ловкость на |cFF00D8001|r.")
        else
            if(Trig_Augment_Buy_Func001Func010Func001C())then
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает стойкость на |cFF00D8001|r.")
            else
                if(Trig_Augment_Buy_Func001Func010Func001Func001C())then
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает мудрость на |cFF00D8001|r.")
                else
                endif
            endif
        endif
        set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Стоимость: " + I2S(udg_AugmentCost[udg_AugmentValue])))
        call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) - udg_AugmentPrice))
    else
        call PlaySoundOnUnitBJ(gg_snd_Error, 100, udg_Target)
    endif
    call AddItemToStockBJ(0x49303047, GetTriggerUnit(), 0, 1)
endfunction

function InitTrig_Augment_Buy takes nothing returns nothing
    set gg_trg_Augment_Buy = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Augment_Buy, EVENT_PLAYER_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_Augment_Buy, Condition(function Trig_Augment_Buy_Conditions))
    call TriggerAddAction(gg_trg_Augment_Buy, function Trig_Augment_Buy_Actions)
endfunction
