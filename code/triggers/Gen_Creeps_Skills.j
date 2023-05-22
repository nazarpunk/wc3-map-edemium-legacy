
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303055))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303054))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303052))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303051))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303050))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E30304F))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303043))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func003C takes nothing returns boolean
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303033))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304A))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304E))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303041))then
        return true
    endif
    return false
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001C takes nothing returns boolean
    if(not Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func003C())then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001Func003C takes nothing returns boolean
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303032))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303030))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303034))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304B))then
        return true
    endif
    return false
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002Func001C takes nothing returns boolean
    if(not Trig_Gen_Creeps_Skills_Func002Func002Func001Func003C())then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002Func002C takes nothing returns boolean
    if(not(udg_Difficulty != 1))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Creeps_Skills_Func002A takes nothing returns nothing
    call UnitAddAbilityBJ(0x4177616E, GetEnumUnit())
    if(Trig_Gen_Creeps_Skills_Func002Func002C())then
        if(Trig_Gen_Creeps_Skills_Func002Func002Func001C())then
            call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
        else
            if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001C())then
                call UnitAddAbilityBJ(0x41303139, GetEnumUnit())
            else
                if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001C())then
                    call UnitAddAbilityBJ(0x41303456, GetEnumUnit())
                else
                    if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001C())then
                        call UnitAddAbilityBJ(0x41303541, GetEnumUnit())
                    else
                        if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001C())then
                            call UnitAddAbilityBJ(0x41303544, GetEnumUnit())
                        else
                            if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001C())then
                                call UnitAddAbilityBJ(0x4130354C, GetEnumUnit())
                            else
                                if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001C())then
                                    call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
                                    call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                else
                                    if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                        call UnitAddAbilityBJ(0x41303546, GetEnumUnit())
                                        call UnitAddAbilityBJ(0x41303551, GetEnumUnit())
                                    else
                                        if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                        else
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
endfunction

function Trig_Gen_Creeps_Skills_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_UnitGroup, function Trig_Gen_Creeps_Skills_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Gen_Creeps_Skills takes nothing returns nothing
    set gg_trg_Gen_Creeps_Skills = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps_Skills, function Trig_Gen_Creeps_Skills_Actions)
endfunction
