function Trig_Gen_Creeps_Skills_Func002A takes nothing returns nothing
    call UnitAddAbilityBJ(0x4177616E, GetEnumUnit())
    if udg_Difficulty != 1 then
        if GetUnitTypeId(GetEnumUnit()) == 0x6E303032 or GetUnitTypeId(GetEnumUnit()) == 0x6E303030 or GetUnitTypeId(GetEnumUnit()) == 0x6E303034 or GetUnitTypeId(GetEnumUnit()) == 0x6E30304B then
            call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
        else
            if GetUnitTypeId(GetEnumUnit()) == 0x6E303033 or GetUnitTypeId(GetEnumUnit()) == 0x6E303035 or GetUnitTypeId(GetEnumUnit()) == 0x6E30304A or GetUnitTypeId(GetEnumUnit()) == 0x6E30304E or GetUnitTypeId(GetEnumUnit()) == 0x6E303041 then
                call UnitAddAbilityBJ(0x41303139, GetEnumUnit())
            else
                if GetUnitTypeId(GetEnumUnit()) == 0x6E303043 then
                    call UnitAddAbilityBJ(0x41303456, GetEnumUnit())
                else
                    if GetUnitTypeId(GetEnumUnit()) == 0x6E30304F then
                        call UnitAddAbilityBJ(0x41303541, GetEnumUnit())
                    else
                        if GetUnitTypeId(GetEnumUnit()) == 0x6E303050 then
                            call UnitAddAbilityBJ(0x41303544, GetEnumUnit())
                        else
                            if GetUnitTypeId(GetEnumUnit()) == 0x6E303051 then
                                call UnitAddAbilityBJ(0x4130354C, GetEnumUnit())
                            else
                                if GetUnitTypeId(GetEnumUnit()) == 0x6E303052 then
                                    call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
                                    call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                else
                                    if GetUnitTypeId(GetEnumUnit()) == 0x6E303054 then
                                        call UnitAddAbilityBJ(0x41303546, GetEnumUnit())
                                        call UnitAddAbilityBJ(0x41303551, GetEnumUnit())
                                    else
                                        if GetUnitTypeId(GetEnumUnit()) == 0x6E303055 then
                                            call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
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