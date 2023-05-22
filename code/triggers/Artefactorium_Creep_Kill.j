
function Trig_Artefactorium_Creep_Kill_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Artefactorium_Creep_Kill_Func008C takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_TutorialCreep))then
        return false
    endif
    return true
endfunction

function Trig_Artefactorium_Creep_Kill_Actions takes nothing returns nothing
    call GroupAddUnitSimple(GetTriggerUnit(), udg_FadeSystemGroup)
    call SaveRealBJ(0.00, udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    call SaveRealBJ(100.00, udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)
    call SaveRealBJ(2.50, udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)
    call SaveBooleanBJ(false, udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call EnableTrigger(gg_trg_Fade_Loop)
    call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetDyingUnit())])
    if(Trig_Artefactorium_Creep_Kill_Func008C())then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_6F, "Ну, неплохо. Если хочешь ещё парочку призвать - нажми правой кнопкой на сферу. Когда наловчишься справляться с монстрами без проблем - пойди прогуляйся с Арктом по замку.", bj_TIMETYPE_ADD, 0.00, true)
        call EnableTrigger(gg_trg_Artefactorium_Spawn)
        call EnableTrigger(gg_trg_Enter_Regions)
        set udg_Target = gg_unit_h006_0081
        call RemoveDestructable(gg_dest_B003_2936)
        call ShowDestructableBJ(true, gg_dest_B00B_1355)
        set udg_Point = GetUnitLoc(gg_unit_h006_0081)
        call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
        call RemoveLocation(udg_Point)
        set udg_MagneticField[2] = GetLastCreatedDestructable()
        set udg_AS_Logic[2] = true
        set udg_AS_Value[GetUnitUserData(udg_Target)] = 2
        set udg_AS_SeriesNumber = 2
        set udg_AS_Effect[udg_AS_SeriesNumber] = 1
        set udg_AS_AbilityStudied[1] = 1
        call CreateTextTagUnitBJ("5", gg_unit_h006_0081, 0, 15.00, 100, 100, 100, 0)
        set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
        call UnitRemoveAbilityBJ(0x41303241, gg_unit_h006_0081)
        call UnitAddAbilityBJ(0x41303649, gg_unit_h006_0081)
        set udg_AS_Points = 300
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_7F, "Кстати, теперь через каждые 5 правильных нажатий Аркт применяет навык, который повышает броню и периодически исцеляет. Можешь проверить.", bj_TIMETYPE_ADD, 0.00, true)
    else
    endif
endfunction

function InitTrig_Artefactorium_Creep_Kill takes nothing returns nothing
    set gg_trg_Artefactorium_Creep_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Artefactorium_Creep_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Artefactorium_Creep_Kill, Condition(function Trig_Artefactorium_Creep_Kill_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Creep_Kill, function Trig_Artefactorium_Creep_Kill_Actions)
endfunction
