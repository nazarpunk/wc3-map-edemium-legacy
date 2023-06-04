function Trig_Dungeon_Battle_Portal_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303048
endfunction

function Trig_Dungeon_Battle_Portal_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetOrderTargetUnit())
    set udg_Point2 = GetUnitLoc(ArctUnit)
    if DistanceBetweenPoints(udg_Point, udg_Point2) < 300.00 then
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BlinkCaster.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveUnit(GetOrderTargetUnit())
        call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point, bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_Difficulty, false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call EnableTrigger(gg_trg_Follower_Movement)
        set udg_RandomNumber = GetRandomInt(1, 9)
        if udg_RandomNumber == 1 then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack1, "Да свершится правосудие!", bj_TIMETYPE_ADD, 0, false)
        else
            if udg_RandomNumber == 2 then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack2, "Во имя Света!", bj_TIMETYPE_ADD, 0, false)
            else
                if udg_RandomNumber == 3 then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack3, "Смерть неверным!", bj_TIMETYPE_ADD, 0, false)
                else
                    if udg_RandomNumber == 4 then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_ArthasWhat1, "Свет даёт мне силу!", bj_TIMETYPE_ADD, 0, false)
                    else
                        if udg_RandomNumber == 5 then
                            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_PriestYesAttack3, "Свет испепелит тебя!", bj_TIMETYPE_ADD, 0, false)
                        else
                            if udg_RandomNumber == 6 then
                                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_FootmanYesAttack3, "К оружию!", bj_TIMETYPE_ADD, 0, false)
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        call IssuePointOrderLocBJ(ArctUnit, "move", udg_Point)
        if GetRandomInt(1, 2) == 1 then
            call CreateTextTagUnitBJ("Поближе бы...", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
        else
            call CreateTextTagUnitBJ("Слишком далеко.", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
        endif
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction

function InitTrig_Dungeon_Battle_Portal takes nothing returns nothing
    set gg_trg_Dungeon_Battle_Portal = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Battle_Portal)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Battle_Portal, ArctUnit, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Dungeon_Battle_Portal, Condition(function Trig_Dungeon_Battle_Portal_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Battle_Portal, function Trig_Dungeon_Battle_Portal_Actions)
endfunction
