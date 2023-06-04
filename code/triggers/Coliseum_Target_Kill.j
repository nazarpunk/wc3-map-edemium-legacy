function Trig_Coliseum_Target_Kill_Conditions takes nothing returns boolean
    return GetTriggerUnit() == udg_CS_TargetUnit
endfunction

function Trig_Coliseum_Target_Kill_Actions takes nothing returns nothing
    set udg_CS_Bool = false
    set udg_CS_Reward = (udg_CS_Reward * 2)
    set udg_CS_RewardReal = (udg_CS_RewardReal * 2.00)
    set udg_CS_TargetPower = (udg_CS_TargetPower + 15)
    set udg_CS_Round = (udg_CS_Round + 1)
    set udg_QG_Count[1] = (udg_QG_Count[1] + 1)
    call DisplayTimedTextToForce(GetPlayersAll(), 30.00, ("Текущая награда: |cFFFFFF89" + (I2S(udg_CS_Reward) + " |rСвета.")))
    call StartTimerBJ(udg_CS_Timer, false, 1.50)
    call UnitAddAbilityBJ(0x41303644, gg_unit_n006_0028)
    call UnitAddAbilityBJ(0x41303643, gg_unit_n006_0028)
    set udg_CS_KeeperBool = false
    call SetUnitLifePercentBJ(ArctUnit, 100)
    call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

function InitTrig_Coliseum_Target_Kill takes nothing returns nothing
    set gg_trg_Coliseum_Target_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Coliseum_Target_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Coliseum_Target_Kill, Condition(function Trig_Coliseum_Target_Kill_Conditions))
    call TriggerAddAction(gg_trg_Coliseum_Target_Kill, function Trig_Coliseum_Target_Kill_Actions)
endfunction
