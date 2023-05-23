function Trig_Boss_Casts_Conditions takes nothing returns boolean
    return GetOwningPlayer(GetTriggerUnit()) == Player(11)
endfunction

function Trig_Boss_Casts_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 0x41303053 or GetSpellAbilityId() == 0x41303130 then
        set udg_Boss_Ability_Point = GetUnitLoc(GetSpellTargetUnit())
        call CreateTextTagUnitBJ("!!!", GetTriggerUnit(), 0, 12.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 30.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    else
        if GetSpellAbilityId() == 0x4130354F then
            call SetUnitLifeBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) + GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetSpellTargetUnit())))
        endif
    endif
endfunction

function InitTrig_Boss_Casts takes nothing returns nothing
    set gg_trg_Boss_Casts = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_Casts, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Boss_Casts, Condition(function Trig_Boss_Casts_Conditions))
    call TriggerAddAction(gg_trg_Boss_Casts, function Trig_Boss_Casts_Actions)
endfunction
