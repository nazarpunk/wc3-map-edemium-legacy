function Trig_Creep_Kill_Reward_Actions takes nothing returns nothing
    if GetRandomInt(1, 2) == 1 then
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_RewardDustReal = (udg_RewardDustReal + I2R(udg_RandomNumber))
        set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
        set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
        call EnableTrigger(gg_trg_Orbs_Spawn)
    else
        set udg_IG_RandomNumber = GetRandomInt(1, 100)
        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
        if udg_IG_RandomNumber <= 85 then
            set udg_IG_ItemQuality = 1
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if udg_IG_RandomNumber > 85 and udg_IG_RandomNumber < 94 then
                set udg_IG_ItemQuality = 2
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
                set udg_IG_ItemQuality = 3
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            endif
        endif
        call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffect(GetLastCreatedEffectBJ())
    endif
endfunction

function InitTrig_Creep_Kill_Reward takes nothing returns nothing
    set gg_trg_Creep_Kill_Reward = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Reward, function Trig_Creep_Kill_Reward_Actions)
endfunction