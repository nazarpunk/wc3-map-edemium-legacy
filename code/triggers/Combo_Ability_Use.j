
function Trig_Combo_Ability_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303138))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303537))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303530))then
        return true
    endif
    return false
endfunction
function Trig_Combo_Ability_Use_Conditions takes nothing returns boolean
    if(not Trig_Combo_Ability_Use_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func005C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303138))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func006C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303537))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303530))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func005C takes nothing returns boolean
    if(not(udg_CO_LeftWeapon == true))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func004C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[1] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func005C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[2] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func006C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[3] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func007C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[4] == 9))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func009C takes nothing returns boolean
    if((udg_CO_ComboSeries[1] == 3))then
        return true
    endif
    if((udg_CO_ComboSeries[2] == 5))then
        return true
    endif
    if((udg_CO_ComboSeries[3] == 7))then
        return true
    endif
    if((udg_CO_ComboSeries[4] == 9))then
        return true
    endif
    return false
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004C takes nothing returns boolean
    if(not Trig_Combo_Ability_Use_Func010Func018Func004Func009C())then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018A takes nothing returns nothing
    set udg_AS_EnemyTarget = udg_CO_AttackingUnit[GetUnitUserData(GetEnumUnit())]
    call UnitAddAbilityBJ(0x41303445, GetTriggerUnit())
    call StartTimerBJ(udg_CO_CombatTimer2, false, 0.40)
    if(Trig_Combo_Ability_Use_Func010Func018Func004C())then
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func004C())then
            set udg_CO_ComboSeries[1] = 0
            set udg_AS_SeriesNumber = 1
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func005C())then
            set udg_CO_ComboSeries[2] = 0
            set udg_AS_SeriesNumber = 2
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func006C())then
            set udg_CO_ComboSeries[3] = 0
            set udg_AS_SeriesNumber = 3
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func007C())then
            set udg_CO_ComboSeries[4] = 0
            set udg_AS_SeriesNumber = 4
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        call RemoveUnit(GetEnumUnit())
    else
        set udg_CO_Damage = true
        call ConditionalTriggerExecute(gg_trg_Combat_Damage)
        call RemoveUnit(GetEnumUnit())
    endif
endfunction
function Trig_Combo_Ability_Use_Func010Func019Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (5 * udg_ART[11])))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func019C takes nothing returns boolean
    if(not(udg_ART[11] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_CO_UnitGroup2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Actions takes nothing returns nothing
    call GroupClear(udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup)
    if(Trig_Combo_Ability_Use_Func005C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x6830304F)
        set udg_CO_Ability = 0x41303138
    else
    endif
    if(Trig_Combo_Ability_Use_Func006C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x68303050)
        set udg_CO_Ability = 0x41303537
    else
    endif
    if(Trig_Combo_Ability_Use_Func007C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x68303051)
        set udg_CO_Ability = 0x41303530
    else
    endif
    set udg_CO_UnitGroup2 = GetRandomSubGroup(1, udg_CO_UnitGroup)
    if(Trig_Combo_Ability_Use_Func010C())then
        call DestroyEffectBJ(udg_CO_SweapEffect[1])
        call DestroyEffectBJ(udg_CO_SweapEffect[2])
        call AddSpecialEffectTargetUnitBJ("weapon", udg_Arct, "war3mapImported\\Sweep_Holy_Large.mdx")
        set udg_CO_SweapEffect[1] = GetLastCreatedEffectBJ()
        if(Trig_Combo_Ability_Use_Func010Func005C())then
            call AddSpecialEffectTargetUnitBJ("foot, left", udg_Arct, "war3mapImported\\Sweep_Holy_Large.mdx")
            set udg_CO_SweapEffect[2] = GetLastCreatedEffectBJ()
        else
        endif
        set udg_CO_Combo = (udg_CO_Combo + 1)
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_CO_ComboSeries[bj_forLoopAIndex] = (udg_CO_ComboSeries[bj_forLoopAIndex] + 1)
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set udg_CO_ComboSeries[5] = 0
        call ForGroupBJ(udg_CO_UnitGroup2, function Trig_Combo_Ability_Use_Func010Func018A)
        if(Trig_Combo_Ability_Use_Func010Func019C())then
            if(Trig_Combo_Ability_Use_Func010Func019Func001C())then
                set udg_Point = GetUnitLoc(udg_Arct)
                set udg_Point2 = GetUnitLoc(udg_AS_EnemyTarget)
                call CreateNUnitsAtLoc(1, 0x68303149, Player(0), udg_Point, bj_UNIT_FACING)
                call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
                call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
                call RemoveLocation(udg_Point)
                call RemoveLocation(udg_Point2)
            else
            endif
        else
        endif
    else
        set udg_CO_Combo = 0
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_CO_ComboSeries[bj_forLoopAIndex] = 0
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 1))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - 2.00))
        call CreateTextTagUnitBJ("X", udg_Arct, 0, 20.00, 80.00, 0.00, 0.00, 10.00)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 200.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.60)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.45)
    endif
    call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("|cFFFFFFFFСерия ударов:|r |cFF449EFF" + I2S(udg_CO_Combo)))
    call GroupClear(udg_CO_UnitGroup2)
    call DestroyGroup(udg_CO_UnitGroup2)
endfunction
function InitTrig_Combo_Ability_Use takes nothing returns nothing
    set gg_trg_Combo_Ability_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Combo_Ability_Use)
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Combo_Ability_Use, Player(0), EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Combo_Ability_Use, Condition(function Trig_Combo_Ability_Use_Conditions))
    call TriggerAddAction(gg_trg_Combo_Ability_Use, function Trig_Combo_Ability_Use_Actions)
endfunction