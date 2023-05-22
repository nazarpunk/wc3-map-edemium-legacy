
function Trig_Unit_Indexer_Func005Func002C takes nothing returns boolean
    if(not(udg_UnitIndexLock[udg_UDex] == 0))then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func005C takes nothing returns boolean
    if(not(GetUnitUserData(udg_UDexUnits[udg_UDex]) == 0))then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func011Func003C takes nothing returns boolean
    if(not(udg_UDexWasted == 15))then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func011Func005C takes nothing returns boolean
    if(not(udg_UDexRecycle == 0))then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func011C takes nothing returns boolean
    if(not(udg_UnitIndexerEnabled == true))then
        return false
    endif
    if(not(GetUnitUserData(GetFilterUnit()) == 0))then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Actions takes nothing returns nothing
    call ExecuteFunc("InitializeUnitIndexer")
endfunction

function ClearUnitIndex takes nothing returns nothing
    if(Trig_Unit_Indexer_Func005C())then
        set udg_UnitIndexLock[udg_UDex] = (udg_UnitIndexLock[udg_UDex] - 1)
        if(Trig_Unit_Indexer_Func005Func002C())then
            set udg_UDexNext[udg_UDexPrev[udg_UDex]] = udg_UDexNext[udg_UDex]
            set udg_UDexPrev[udg_UDexNext[udg_UDex]] = udg_UDexPrev[udg_UDex]
            set udg_UDexPrev[udg_UDex] = 0
            set udg_UnitIndexEvent = 0.00
            set udg_UnitIndexEvent = 2.00
            set udg_UnitIndexEvent = 0.00
            set udg_UDexUnits[udg_UDex] = null
            set udg_UDexNext[udg_UDex] = udg_UDexRecycle
            set udg_UDexRecycle = udg_UDex
        else
        endif
    else
    endif
endfunction

function IndexUnit takes nothing returns boolean
    local integer pdex = udg_UDex
    local integer ndex
    if(Trig_Unit_Indexer_Func011C())then
        set udg_UDexWasted = (udg_UDexWasted + 1)
        if(Trig_Unit_Indexer_Func011Func003C())then
            set udg_UDexWasted = 0
            set udg_UDex = udg_UDexNext[0]
            loop
                exitwhen udg_UDex == 0
                set ndex = udg_UDexNext[udg_UDex]
                call ClearUnitIndex()
                set udg_UDex = ndex
            endloop
        endif
        if(Trig_Unit_Indexer_Func011Func005C())then
            set udg_UDex = (udg_UDexGen + 1)
            set udg_UDexGen = udg_UDex
        else
            set udg_UDex = udg_UDexRecycle
            set udg_UDexRecycle = udg_UDexNext[udg_UDex]
        endif
        set udg_UDexUnits[udg_UDex] = GetFilterUnit()
        call SetUnitUserData(udg_UDexUnits[udg_UDex], udg_UDex)
        set udg_UDexPrev[udg_UDexNext[0]] = udg_UDex
        set udg_UDexNext[udg_UDex] = udg_UDexNext[0]
        set udg_UDexNext[0] = udg_UDex
        set udg_UnitIndexLock[udg_UDex] = 1
        set udg_UnitIndexEvent = 0.00
        set udg_UnitIndexEvent = 1.00
        set udg_UnitIndexEvent = 0.00
        set udg_UDex = pdex
    endif
    return false
endfunction

function InitializeUnitIndexer takes nothing returns nothing
    local integer i = 16
    local boolexpr b = Filter(function IndexUnit)
    local region re = CreateRegion()
    local trigger t = GetTriggeringTrigger()
    local rect r = GetWorldBounds()
    call RegionAddRect(re, r)
    call TriggerRegisterEnterRegion(t, re, b)
    call TriggerClearActions(t)
    call TriggerAddAction(t, function ClearUnitIndex)
    set udg_UnitIndexerEnabled = true
    loop
        set i = i - 1
        call GroupEnumUnitsOfPlayer(bj_lastCreatedGroup, Player(i), b)
        exitwhen i == 0
    endloop
    call RemoveRect(r)
    set re = null
    set r = null
    set t = null
    set b = null
    set udg_UnitIndexEvent = 3.00
    set udg_UnitIndexEvent = 0.00
endfunction

function InitTrig_Unit_Indexer takes nothing returns nothing
    set gg_trg_Unit_Indexer = CreateTrigger()
    call TriggerAddAction(gg_trg_Unit_Indexer, function Trig_Unit_Indexer_Actions)
endfunction
