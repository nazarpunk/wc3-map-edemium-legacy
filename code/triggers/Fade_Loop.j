
function Trig_Fade_Loop_Func001Func005C takes nothing returns boolean
    if(not(udg_TempBool == true))then
        return false
    endif
    return true
endfunction
function Trig_Fade_Loop_Func001Func006Func004001001 takes nothing returns boolean
    return(udg_TempBool == true)
endfunction
function Trig_Fade_Loop_Func001Func006Func004001002 takes nothing returns boolean
    return(LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) <= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash))
endfunction
function Trig_Fade_Loop_Func001Func006Func004001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Fade_Loop_Func001Func006Func004001001(), Trig_Fade_Loop_Func001Func006Func004001002())
endfunction
function Trig_Fade_Loop_Func001Func006Func004002001 takes nothing returns boolean
    return(udg_TempBool == false)
endfunction
function Trig_Fade_Loop_Func001Func006Func004002002 takes nothing returns boolean
    return(LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) >= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash))
endfunction
function Trig_Fade_Loop_Func001Func006Func004002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Fade_Loop_Func001Func006Func004002001(), Trig_Fade_Loop_Func001Func006Func004002002())
endfunction
function Trig_Fade_Loop_Func001Func006C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Fade_Loop_Func001Func006Func004001(), Trig_Fade_Loop_Func001Func006Func004002()))then
        return false
    endif
    return true
endfunction
function Trig_Fade_Loop_Func001A takes nothing returns nothing
    set udg_TempUnit = GetEnumUnit()
    set udg_FadeUnitKey = GetHandleId(udg_TempUnit)
    set udg_TempBool = LoadBooleanBJ(udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call SetUnitVertexColorBJ(udg_TempUnit, 100.00, 100.00, 100.00, LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash))
    if(Trig_Fade_Loop_Func001Func005C())then
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) - LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    else
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) + LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    endif
    if(Trig_Fade_Loop_Func001Func006C())then
        call GroupRemoveUnitSimple(udg_TempUnit, udg_FadeSystemGroup)
        call RemoveUnit(udg_TempUnit)
        call FlushChildHashtableBJ(udg_FadeUnitKey, udg_FadeSystemHash)
    else
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
    else
    endif
endfunction
function InitTrig_Fade_Loop takes nothing returns nothing
    set gg_trg_Fade_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Fade_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Fade_Loop, 0.05)
    call TriggerAddAction(gg_trg_Fade_Loop, function Trig_Fade_Loop_Actions)
endfunction