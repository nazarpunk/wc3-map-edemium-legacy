function Trig_Fade_Loop_Func001A takes nothing returns nothing
    unit u = GetEnumUnit()
    set udg_FadeUnitKey = GetHandleId(u)
    set udg_TempBool = LoadBooleanBJ(udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call SetUnitVertexColorBJ(u, 100.00, 100.00, 100.00, LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash))
    if udg_TempBool then
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) - LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    else
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) + LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    endif
    if (udg_TempBool and LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) <= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)) or not udg_TempBool and LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) >= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash) then
        call GroupRemoveUnitSimple(u, udg_FadeSystemGroup)
        call RemoveUnit(u)
        call FlushChildHashtableBJ(udg_FadeUnitKey, udg_FadeSystemHash)
    endif

    set u = null
endfunction

function Trig_Fade_Loop_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FadeSystemGroup, function Trig_Fade_Loop_Func001A)
    if CountUnitsInGroup(udg_FadeSystemGroup) == 0 then
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Fade_Loop takes nothing returns nothing
    set gg_trg_Fade_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Fade_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Fade_Loop, 0.05)
    call TriggerAddAction(gg_trg_Fade_Loop, function Trig_Fade_Loop_Actions)
endfunction