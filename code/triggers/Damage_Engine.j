
function Trig_Damage_Engine_Func009C takes nothing returns boolean
    if(not(IsUnitType(udg_TempUnit, UNIT_TYPE_STRUCTURE) == false))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func044C takes nothing returns boolean
    if(not(udg_DamageEventAmount == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func003C takes nothing returns boolean
    if(not(udg_DamageEventExplodesUnit == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func008Func004C takes nothing returns boolean
    if(not(udg_DmgEvN == 1))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func008C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_DamageEventTarget) < udg_DmgEvLife))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002C takes nothing returns boolean
    if(not(udg_DamageEventAmount > udg_DamageEventPrevAmt))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049C takes nothing returns boolean
    if(not(udg_DamageEventAmount != udg_DamageEventPrevAmt))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func081C takes nothing returns boolean
    if(not(udg_DamageEvent == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006Func003Func007C takes nothing returns boolean
    if(not(udg_UnitDamageRegistered[udg_UDex] == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006Func003C takes nothing returns boolean
    if(not(udg_DamageEventsWasted == 15))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006C takes nothing returns boolean
    if(not(udg_UnitDamageRegistered[udg_UDex] == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092C takes nothing returns boolean
    if(not(udg_UnitIndexEvent == 1.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Actions takes nothing returns nothing
    set udg_DamageBlockingAbility = 0x41303032
    set udg_DamageTypeSpell = 1
    set udg_DamageTypeDOT = 2
    set udg_DamageTypeRanged = 3
    call ExecuteFunc("InitDamageEvent")
endfunction
function DmgEvFilter takes nothing returns boolean
    if(Trig_Damage_Engine_Func009C())then
        return true
    else
    endif
    return false
endfunction
function DmgEvRemoveAbilities takes nothing returns nothing
    local real r
    loop
        set udg_DmgEvN = (udg_DmgEvN - 1)
        set r = GetWidgetLife(udg_DmgEvStack[udg_DmgEvN])
        call UnitRemoveAbilityBJ(udg_DamageBlockingAbility, udg_DmgEvStack[udg_DmgEvN])
        call SetWidgetLife(udg_DmgEvStack[udg_DmgEvN], r)
        set udg_DmgEvStack[udg_DmgEvN] = null
        exitwhen udg_DmgEvN == 0
    endloop
endfunction
function DmgEvSetVars takes nothing returns nothing
    set udg_DamageEventAmount = GetEventDamage()
    set udg_DamageEventSource = GetEventDamageSource()
    set udg_DamageEventTarget = GetTriggerUnit()
endfunction
function FireDmgEv takes nothing returns nothing
    local boolean b = GetUnitAbilityLevel(udg_DamageEventTarget, udg_DamageBlockingAbility) > 0
    local real life = 0
    local real pain = 0
    if b then
        set life = GetWidgetLife(udg_DamageEventTarget)
        call UnitRemoveAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
        call SetWidgetLife(udg_DamageEventTarget, life)
        set pain = GetWidgetLife(udg_DamageEventTarget)
    endif
    set udg_DamageEventPrevAmt = udg_DamageEventAmount
    set udg_DamageEventExplodesUnit = false
    set udg_DamageEventOverride = false
    if(Trig_Damage_Engine_Func044C())then
        set udg_DamageEvent = 2.00
    else
        set udg_DamageModifierEvent = 1.00
        set udg_DamageEvent = 1.00
    endif
    if b then
        call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
        call SetWidgetLife(udg_DamageEventTarget, life + GetWidgetLife(udg_DamageEventTarget) - pain)
    endif
    if(Trig_Damage_Engine_Func049C())then
        set udg_DmgEvLife = (GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + (udg_DamageEventPrevAmt - udg_DamageEventAmount))
        if(Trig_Damage_Engine_Func049Func002C())then
            call SetUnitLifeBJ(udg_DamageEventTarget, RMaxBJ(0.41, udg_DmgEvLife))
            if udg_DmgEvLife <= .405 then
                if(Trig_Damage_Engine_Func049Func002Func003C())then
                    call SetUnitExplodedBJ(udg_DamageEventTarget, true)
                else
                endif
                call DisableTrigger(udg_DamageEventTrigger)
                call UnitDamageTarget(udg_DamageEventSource, udg_DamageEventTarget, 999, false, false, null, null, null)
                call EnableTrigger(udg_DamageEventTrigger)
            endif
        else
            if(Trig_Damage_Engine_Func049Func002Func008C())then
                call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
                set udg_DmgEvStack[udg_DmgEvN] = udg_DamageEventTarget
                set udg_DmgEvN = (udg_DmgEvN + 1)
                if(Trig_Damage_Engine_Func049Func002Func008Func004C())then
                    call TimerStart(udg_DmgEvTimer, 0, false, function DmgEvRemoveAbilities)
                else
                endif
            else
            endif
            call SetUnitLifeBJ(udg_DamageEventTarget, udg_DmgEvLife)
        endif
    else
    endif
endfunction
function FireRecursiveDmgEv takes nothing returns nothing
    local real d = udg_DamageEventAmount
    local unit s = udg_DamageEventSource
    local unit t = udg_DamageEventTarget
    local integer ptype = udg_DmgTypPrev
    local boolean explode = udg_DamageEventExplodesUnit
    local boolean override = udg_DamageEventOverride
    local real prev = udg_DamageEventPrevAmt
    call DmgEvSetVars()
    if udg_DamageEventTarget != t or udg_DamageEventSource != s or udg_DamageEventAmount != d or udg_DamageEventType != ptype then
        set udg_DamageEvent = 0.00
        set udg_DamageModifierEvent = 0.00
        call FireDmgEv()
    else
        call ClearTextMessagesBJ(GetPlayersAll())
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "WARNING: Recursion error when dealing damage! Make sure when you deal damage from within a DamageEvent trigger, do it like this:|n|n    Trigger - Turn off DamageEventTrigger|n    Unit - Cause...|n    Trigger - Turn on DamageEventTrigger")
    endif
    set udg_DamageEventOverride = override
    set udg_DamageEventExplodesUnit = explode
    set udg_DamageEventPrevAmt = prev
    set udg_DmgTypPrev = ptype
    set udg_DamageEventAmount = d
    set udg_DamageEventSource = s
    set udg_DamageEventTarget = t
    set s = null
    set t = null
endfunction
function OnDmgEv takes nothing returns boolean
    if(Trig_Damage_Engine_Func081C())then
        set udg_DmgTypPrev = udg_DamageEventType
        call DmgEvSetVars()
        call FireDmgEv()
        set udg_DamageModifierEvent = 0.00
        set udg_DamageEvent = 0.00
        set udg_DamageEventType = 0
    else
        call FireRecursiveDmgEv()
    endif
    return false
endfunction
function CreateDmgEv takes nothing returns nothing
    set udg_DamageEventTrigger = CreateTrigger()
    call TriggerAddCondition(udg_DamageEventTrigger, Filter(function OnDmgEv))
endfunction
function SetupDmgEv takes nothing returns boolean
    local integer pdex = udg_UDex
    if(Trig_Damage_Engine_Func092C())then
        set udg_TempUnit = udg_UDexUnits[udg_UDex]
        if GetUnitAbilityLevel(udg_TempUnit, 0x416C6F63) == 0 and DmgEvFilter()then
            set udg_UnitDamageRegistered[udg_UDex] = true
            call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_TempUnit, EVENT_UNIT_DAMAGED)
        endif
    else
        if(Trig_Damage_Engine_Func092Func006C())then
            set udg_UnitDamageRegistered[udg_UDex] = false
            set udg_DamageEventsWasted = (udg_DamageEventsWasted + 1)
            if(Trig_Damage_Engine_Func092Func006Func003C())then
                set udg_DamageEventsWasted = 0
                call DestroyTrigger(udg_DamageEventTrigger)
                call CreateDmgEv()
                set udg_UDex = udg_UDexNext[0]
                loop
                    exitwhen udg_UDex == 0
                    if(Trig_Damage_Engine_Func092Func006Func003Func007C())then
                        call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_UDexUnits[udg_UDex], EVENT_UNIT_DAMAGED)
                    else
                    endif
                    set udg_UDex = udg_UDexNext[udg_UDex]
                endloop
                set udg_UDex = pdex
            else
            endif
        else
        endif
    endif
    return false
endfunction
function InitDamageEvent takes nothing returns nothing
    call CreateDmgEv()
    call TriggerAddCondition(GetTriggeringTrigger(), Filter(function SetupDmgEv))
    set udg_UnitIndexerEnabled = false
    set udg_TempUnit = CreateUnit(Player(15), 0x756C6F63, 0, 0, 0)
    set udg_UnitIndexerEnabled = true
    call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_TempUnit)
    call RemoveUnit(udg_TempUnit)
    call StartTimerBJ(udg_DmgEvTimer, false, 0.00)
    call ConditionalTriggerExecute(GetTriggeringTrigger())
endfunction
function InitTrig_Damage_Engine takes nothing returns nothing
    set gg_trg_Damage_Engine = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Damage_Engine, "udg_UnitIndexEvent", EQUAL, 1.00)
    call TriggerRegisterVariableEvent(gg_trg_Damage_Engine, "udg_UnitIndexEvent", EQUAL, 2.00)
    call TriggerAddAction(gg_trg_Damage_Engine, function Trig_Damage_Engine_Actions)
endfunction