
function Trig_Gen_Creeps_Func003002 takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 0)
endfunction

function Trig_Gen_Creeps_Func005Func002Func004C takes nothing returns boolean
    if(not(udg_RandomNumber <= 50))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func005Func002Func005Func003001 takes nothing returns boolean
    return(udg_RandomNumber > 50)
endfunction

function Trig_Gen_Creeps_Func005Func002Func005Func003002 takes nothing returns boolean
    return(udg_RandomNumber <= 91)
endfunction

function Trig_Gen_Creeps_Func005Func002Func005C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Gen_Creeps_Func005Func002Func005Func003001(), Trig_Gen_Creeps_Func005Func002Func005Func003002()))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func005Func002Func006C takes nothing returns boolean
    if(not(udg_RandomNumber > 91))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func005Func002Func007C takes nothing returns boolean
    if(not(GetUnitUserData(GetEnumUnit()) == 2))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func005Func002A takes nothing returns nothing
    set udg_CO_CustomValue = (udg_CO_CustomValue + 1)
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point1 = OffsetLocation(udg_D_Point2, GetRandomReal(- 300.00, 300.00), GetRandomReal(- 300.00, 300.00))
    if(Trig_Gen_Creeps_Func005Func002Func004C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[1], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    endif
    if(Trig_Gen_Creeps_Func005Func002Func005C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[2], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    endif
    if(Trig_Gen_Creeps_Func005Func002Func006C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[3], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    endif
    if(Trig_Gen_Creeps_Func005Func002Func007C())then
        call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
    endif
    call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CO_CustomValue)
    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
    call RemoveLocation(udg_D_Point1)
endfunction

function Trig_Gen_Creeps_Func007Func002C takes nothing returns boolean
    if(not(udg_D_Rooms < 45))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func007C takes nothing returns boolean
    if(not(udg_EM_Encounter == false))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func008Func005C takes nothing returns boolean
    if(not(udg_D_CreepType[udg_RandomNumber] == 0x6E30304F))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Func008A takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(4, 5)
    call ReplaceUnitBJ(GetEnumUnit(), udg_D_CreepType[udg_RandomNumber], bj_UNIT_STATE_METHOD_RELATIVE)
    call SetUnitOwner(GetLastReplacedUnitBJ(), Player(11), false)
    call SetUnitManaPercentBJ(GetLastReplacedUnitBJ(), 100)
    if(Trig_Gen_Creeps_Func008Func005C())then
        set udg_Point = GetUnitLoc(GetLastReplacedUnitBJ())
        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
        call RemoveLocation(udg_Point)
        call UnitAddAbilityBJ(0x4130315A, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", GetLastReplacedUnitBJ())
        call SetUnitUserData(GetLastReplacedUnitBJ(), 70)
        call SetUnitAnimation(GetLastReplacedUnitBJ(), "death")
    endif
endfunction

function Trig_Gen_Creeps_Func010Func001A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E726174, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_Point1, bj_UNIT_FACING)
    call RemoveLocation(udg_D_Point1)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction

function Trig_Gen_Creeps_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Creeps_Func003002)
    call GroupRemoveUnitSimple(udg_D_CellLast, udg_D_Pick)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = udg_D_CreepsTotal
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_RandomNumber = GetRandomInt(1, 100)
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Creeps_Func005Func002A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_Gen_Creeps_Func007C())then
        if(Trig_Gen_Creeps_Func007Func002C())then
            set udg_RandomNumber = GetRandomInt(2, 4)
        else
            set udg_RandomNumber = GetRandomInt(4, 6)
        endif
    else
        set udg_RandomNumber = GetRandomInt(1, 2)
    endif
    call ForGroupBJ(GetRandomSubGroup(udg_RandomNumber, udg_D_Pick), function Trig_Gen_Creeps_Func008A)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(5, 9)
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Creeps_Func010Func001A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    call ConditionalTriggerExecute(gg_trg_Gen_Final)
endfunction

function InitTrig_Gen_Creeps takes nothing returns nothing
    set gg_trg_Gen_Creeps = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps, function Trig_Gen_Creeps_Actions)
endfunction
