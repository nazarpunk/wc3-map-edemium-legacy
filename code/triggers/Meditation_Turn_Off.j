function Trig_Meditation_Turn_Off_Actions takes nothing returns nothing
    set udg_MeditationLogic = false
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
    call SetUnitTurnSpeedBJ(GetTriggerUnit(), 1.00)
    call DestroyEffectBJ(udg_MeditationEffect)
    call DisableTrigger(gg_trg_Meditation_Heal)
    call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
    call EnableTrigger(gg_trg_Camera_Hero)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Meditation_Turn_Off takes nothing returns nothing
    set gg_trg_Meditation_Turn_Off = CreateTrigger()
    call DisableTrigger(gg_trg_Meditation_Turn_Off)
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Turn_Off, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Turn_Off, gg_unit_H000_0004, EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction(gg_trg_Meditation_Turn_Off, function Trig_Meditation_Turn_Off_Actions)
endfunction