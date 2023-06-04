
function Trig_Meditation_Cast_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303147
endfunction

function Trig_Meditation_Cast_Actions takes nothing returns nothing
    if GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) == 0.00 then
        call CreateTextTagUnitBJ("Нет сил...", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
    else
        set udg_MeditationPower = GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true)
        if not IsTriggerEnabled(gg_trg_Combo_Ability_Use) then
            set udg_MeditationLogic = true
            call AddUnitAnimationPropertiesBJ(true, "gold", ArctUnit)
            call SetUnitMoveSpeed(GetTriggerUnit(), 0.00)
            call SetUnitTurnSpeedBJ(GetTriggerUnit(), 0.00)
            call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "Abilities\\Spells\\NightElf\\Tranquility\\TranquilityTarget.mdl")
            set udg_MeditationEffect = GetLastCreatedEffectBJ()
            set udg_SprintLogic = false
            call DisableTrigger(gg_trg_Sprint_Energy)
            call EnableTrigger(gg_trg_Meditation_Heal)
            call EnableTrigger(gg_trg_Meditation_Turn_Off)
            call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
            call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
            call DisableTrigger(gg_trg_Camera_Hero)
            call DisableTrigger(gg_trg_Camera_Angle_Increase)
            call DisableTrigger(gg_trg_Camera_Angle_Decrease)
            call DisableTrigger(gg_trg_Camera_Increase)
            call DisableTrigger(gg_trg_Camera_Decrease)
            set udg_Point = GetUnitLoc(ArctUnit)
            call PanCameraToTimedLocForPlayer(Player(0), udg_Point, 0)
            call RemoveLocation(udg_Point)
        else
            call CreateTextTagUnitBJ("Я в бою!", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
        endif
    endif
endfunction

function InitTrig_Meditation_Cast takes nothing returns nothing
    set gg_trg_Meditation_Cast = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Cast, ArctUnit, EVENT_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Meditation_Cast, Condition(function Trig_Meditation_Cast_Conditions))
    call TriggerAddAction(gg_trg_Meditation_Cast, function Trig_Meditation_Cast_Actions)
endfunction
