function Trig_Edemor_Check_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Arena_Pick, Player(11))
    set udg_ER_Count = CountUnitsInGroup(udg_UnitGroup)
    if udg_ER_Count == 0 then
        set udg_QG_Count[3] = (udg_QG_Count[3] + 1)
        call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
        set udg_ER_RewardReal = I2R(udg_ER_Reward)
        set udg_ER_RewardReal = (udg_ER_RewardReal * udg_DifficultyRate)
        set udg_ER_RewardReal = (udg_ER_RewardReal * udg_EX_Rate)
        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Holy_Heal.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        set udg_ER_Reward = R2I(udg_ER_RewardReal)
        call AdjustPlayerStateBJ(udg_ER_Reward, Player(0), PLAYER_STATE_RESOURCE_GOLD)
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Получено: |cFFFFFF89" + (I2S(udg_ER_Reward) + " |rСвета.")))
        set udg_ER_Reward = 0
        call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
        call EnableTrigger(gg_trg_Escape_Dialog)
        call DisableTrigger(GetTriggeringTrigger())
    endif
    call DestroyGroup(udg_UnitGroup)
endfunction


function InitTrig_Edemor_Check takes nothing returns nothing
    set gg_trg_Edemor_Check = CreateTrigger()
    call DisableTrigger(gg_trg_Edemor_Check)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemor_Check, 1.00)
    call TriggerAddAction(gg_trg_Edemor_Check, function Trig_Edemor_Check_Actions)
endfunction
