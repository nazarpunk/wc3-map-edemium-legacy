function Trig_Coliseum_Exit_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303644
endfunction

function Trig_Coliseum_Exit_Func013002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Coliseum_Exit_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
    call EnableTrigger(gg_trg_Escape_Dialog)
    set udg_CS_Bool = false
    call ClearTextMessagesBJ(GetPlayersAll())
    call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Holy_Heal.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_CS_RewardReal = (udg_CS_RewardReal * udg_EX_Rate)
    call AdjustPlayerStateBJ(R2I(udg_CS_RewardReal), Player(0), PLAYER_STATE_RESOURCE_GOLD)
    set udg_CS_Reward = R2I(udg_CS_RewardReal)
    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Получено: |cFFFFFF89" + (I2S(udg_CS_Reward) + " |rСвета.")))
    call UnitRemoveAbilityBJ(0x41303643, GetTriggerUnit())
    call UnitRemoveAbilityBJ(GetSpellAbilityId(), GetTriggerUnit())
    call EnumItemsInRectBJ(gg_rct_Coliseum, function Trig_Coliseum_Exit_Func013002)
endfunction

function InitTrig_Coliseum_Exit takes nothing returns nothing
    set gg_trg_Coliseum_Exit = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Coliseum_Exit, gg_unit_n006_0028, EVENT_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Coliseum_Exit, Condition(function Trig_Coliseum_Exit_Conditions))
    call TriggerAddAction(gg_trg_Coliseum_Exit, function Trig_Coliseum_Exit_Actions)
endfunction
