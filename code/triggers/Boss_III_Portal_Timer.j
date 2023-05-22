
function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 6))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Func012C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Boss_III_Portal_Timer_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Boss3Portal)
    call CreateNUnitsAtLoc(1, 0x4830314A, Player(1), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
    call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
    call SetHeroLevelBJ(GetLastCreatedUnit(), GetHeroLevel(udg_Arct), false)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_EM_BossUnit)
    call UnitRemoveAbilityBJ(0x41303631, gg_unit_H000_0004)
    call RemoveUnit(udg_Boss3Portal)
    set udg_Boss3PortalCounter = (udg_Boss3PortalCounter - 1)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    set udg_RandomNumber = GetRandomInt(1, 10)
    if(Trig_Boss_III_Portal_Timer_Func012C())then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandeWarcry1, "Стражи, к бою!", bj_TIMETYPE_ADD, 0, false)
    else
        if(Trig_Boss_III_Portal_Timer_Func012Func001C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandePissed1, "Вечная жизнь - вечная служба.", bj_TIMETYPE_ADD, 0, false)
        else
            if(Trig_Boss_III_Portal_Timer_Func012Func001Func001C())then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandePissed4, "Анутерадор-мали!", bj_TIMETYPE_ADD, 0, false)
            else
                if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001C())then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandeYes4, "Без промедления!", bj_TIMETYPE_ADD, 0, false)
                else
                    if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001C())then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_ArcherYesAttack4, "Пощады не будет!", bj_TIMETYPE_ADD, 0, false)
                    else
                        if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001C())then
                            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroWardenYesAttack2, "Да свершится правосудие!", bj_TIMETYPE_ADD, 0, false)
                        else
                            if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001Func001C())then
                                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroWardenYesAttack1, "Исполняю приговор!", bj_TIMETYPE_ADD, 0, false)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
    call UnitAddAbilityBJ(0x41303545, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
    set udg_Point = GetUnitLoc(udg_EM_BossUnit)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Point)
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Boss_III_Portal_Timer takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Timer = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_III_Portal_Timer, udg_Boss3Timer)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Timer, function Trig_Boss_III_Portal_Timer_Actions)
endfunction
