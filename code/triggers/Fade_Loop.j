function Trig_Fade_Loop_Func001A takes nothing returns nothing
    set udg_TempUnit = GetEnumUnit()
    set udg_FadeUnitKey = GetHandleId(udg_TempUnit)
    set udg_TempBool = LoadBooleanBJ(udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call SetUnitVertexColorBJ(udg_TempUnit, 100.00, 100.00, 100.00, LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash))
    if udg_TempBool then
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) - LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    else
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) + LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    endif
    if (udg_TempBool and LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) <= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)) or not udg_TempBool and LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) >= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash) then
        call GroupRemoveUnitSimple(udg_TempUnit, udg_FadeSystemGroup)
        call RemoveUnit(udg_TempUnit)
        call FlushChildHashtableBJ(udg_FadeUnitKey, udg_FadeSystemHash)
    endif
endfunction

function Trig_Fade_Loop_Func002C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_FadeSystemGroup) == 0))then
        return false
    endif
    return true
endfunction

function Trig_Fade_Loop_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FadeSystemGroup, function Trig_Fade_Loop_Func001A)
    if(Trig_Fade_Loop_Func002C())then
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Fade_Loop takes nothing returns nothing
    set gg_trg_Fade_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Fade_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Fade_Loop, 0.05)
    call TriggerAddAction(gg_trg_Fade_Loop, function Trig_Fade_Loop_Actions)
endfunction