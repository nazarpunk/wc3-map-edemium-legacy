function Trig_Meditation_Heal_Actions takes nothing returns nothing
    if GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) > 0.00 then
        if GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) != GetUnitStateSwap(UNIT_STATE_MAX_LIFE, ArctUnit) then
            if GetRandomInt(1, 100) <= GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true) then
                call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + (I2R(udg_MeditationPower) * 3.00)))
                call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffect(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ(("+" + I2S((udg_MeditationPower * 3))), ArctUnit, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            else
                call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + I2R(udg_MeditationPower)))
                call CreateTextTagUnitBJ(("+" + I2S(udg_MeditationPower)), ArctUnit, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            endif
            call SetUnitManaBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) - 1.50))
        endif
    else
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", ArctUnit)
        call SetUnitMoveSpeed(ArctUnit, GetUnitDefaultMoveSpeed(ArctUnit))
        call SetUnitTurnSpeedBJ(ArctUnit, 1.00)
        call DestroyEffect(udg_MeditationEffect)
        call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
        call EnableTrigger(gg_trg_Camera_Hero)
        call EnableTrigger(gg_trg_Camera_Angle_Increase)
        call EnableTrigger(gg_trg_Camera_Angle_Decrease)
        call EnableTrigger(gg_trg_Camera_Increase)
        call EnableTrigger(gg_trg_Camera_Decrease)
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Meditation_Heal takes nothing returns nothing
    set gg_trg_Meditation_Heal = CreateTrigger()
    call DisableTrigger(gg_trg_Meditation_Heal)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Meditation_Heal, 1.00)
    call TriggerAddAction(gg_trg_Meditation_Heal, function Trig_Meditation_Heal_Actions)
endfunction
