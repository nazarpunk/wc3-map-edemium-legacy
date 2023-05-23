
function Trig_Meditation_Heal_Func001Func001Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))then
        return false
    endif
    return true
endfunction

function Trig_Meditation_Heal_Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) != GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct)))then
        return false
    endif
    return true
endfunction

function Trig_Meditation_Heal_Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > 0.00))then
        return false
    endif
    return true
endfunction

function Trig_Meditation_Heal_Actions takes nothing returns nothing
    if(Trig_Meditation_Heal_Func001C())then
        if(Trig_Meditation_Heal_Func001Func001C())then
            if(Trig_Meditation_Heal_Func001Func001Func001C())then
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (I2R(udg_MeditationPower) * 3.00)))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ(("+" + I2S((udg_MeditationPower * 3))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            else
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + I2R(udg_MeditationPower)))
                call CreateTextTagUnitBJ(("+" + I2S(udg_MeditationPower)), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            endif
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 1.50))
        endif
    else
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
        call SetUnitMoveSpeed(gg_unit_H000_0004, GetUnitDefaultMoveSpeed(gg_unit_H000_0004))
        call SetUnitTurnSpeedBJ(gg_unit_H000_0004, 1.00)
        call DestroyEffectBJ(udg_MeditationEffect)
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
