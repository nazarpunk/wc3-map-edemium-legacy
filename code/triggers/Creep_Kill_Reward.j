
function Trig_Creep_Kill_Reward_Func001Func003Func001Func005001 takes nothing returns boolean
    return(udg_IG_RandomNumber > 85)
endfunction
function Trig_Creep_Kill_Reward_Func001Func003Func001Func005002 takes nothing returns boolean
    return(udg_IG_RandomNumber < 94)
endfunction
function Trig_Creep_Kill_Reward_Func001Func003Func001C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Creep_Kill_Reward_Func001Func003Func001Func005001(), Trig_Creep_Kill_Reward_Func001Func003Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Reward_Func001Func003C takes nothing returns boolean
    return udg_IG_RandomNumber <= 85
endfunction
function Trig_Creep_Kill_Reward_Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Reward_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Reward_Func001C())then
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_RewardDustReal = (udg_RewardDustReal + I2R(udg_RandomNumber))
        set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
        set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
        call EnableTrigger(gg_trg_Orbs_Spawn)
    else
        set udg_IG_RandomNumber = GetRandomInt(1, 100)
        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
        if(Trig_Creep_Kill_Reward_Func001Func003C())then
            set udg_IG_ItemQuality = 1
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if(Trig_Creep_Kill_Reward_Func001Func003Func001C())then
                set udg_IG_ItemQuality = 2
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
                set udg_IG_ItemQuality = 3
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            endif
        endif
        call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    endif
endfunction
function InitTrig_Creep_Kill_Reward takes nothing returns nothing
    set gg_trg_Creep_Kill_Reward = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Reward, function Trig_Creep_Kill_Reward_Actions)
endfunction