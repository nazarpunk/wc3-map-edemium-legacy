function Trig_Map_Generate_Func014Func002Func001A takes nothing returns nothing
    set udg_Point = GetDestructableLoc(GetEnumDestructable())
    call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
    call RemoveLocation(udg_Point)
    if GetDestructableTypeId(GetEnumDestructable()) == 0x42303136 then
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_Map_Generate_Func014Func002Func003Func001Func004C takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == 0x42303136
endfunction

function Trig_Map_Generate_Func014Func002Func003Func001A takes nothing returns nothing
    set udg_Point = GetDestructableLoc(GetEnumDestructable())
    call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
    call RemoveLocation(udg_Point)
    if(Trig_Map_Generate_Func014Func002Func003Func001Func004C())then
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_Map_Generate_Func014Func002Func003Func003A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 7)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func010A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 1)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func012A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 2)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func014A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 3)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func016A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 4)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func018A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 71)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func020A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 72)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003Func022A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 74)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func003C takes nothing returns boolean
    if(not(udg_EM_Generate == 3))then
        return false
    endif
    return true
endfunction

function Trig_Map_Generate_Func014Func002Func007A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 7)
endfunction

function Trig_Map_Generate_Func014Func002Func009A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 1)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func011A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 2)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func013A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 3)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func015A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 4)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func017A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 71)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func019A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 72)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002Func021A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 74)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func002C takes nothing returns boolean
    if(not(udg_EM_Generate == 2))then
        return false
    endif
    return true
endfunction

function Trig_Map_Generate_Func014Func008A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 7)
endfunction

function Trig_Map_Generate_Func014Func010A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 1)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func012A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 3)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func014A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 4)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func016A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 71)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014Func018A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 72)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_UnitGroup)
endfunction

function Trig_Map_Generate_Func014C takes nothing returns boolean
    if(not(udg_EM_Generate == 1))then
        return false
    endif
    return true
endfunction

function Trig_Map_Generate_Actions takes nothing returns nothing
    if(Trig_Map_Generate_Func014C())then
        set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Tier_1)
        call GroupRemoveUnitSimple(gg_unit_h00K_0105, udg_UnitGroup)
        call GroupRemoveUnitSimple(gg_unit_h00K_0095, udg_UnitGroup)
        call SetUnitUserData(gg_unit_h00K_0105, 6)
        call SetUnitUserData(gg_unit_h00K_0095, 7)
        call ForGroupBJ(udg_UnitGroup, function Trig_Map_Generate_Func014Func008A)
        call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func010A)
        call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func012A)
        call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func014A)
        call ForGroupBJ(GetRandomSubGroup(2, udg_UnitGroup), function Trig_Map_Generate_Func014Func016A)
        call ForGroupBJ(GetRandomSubGroup(2, udg_UnitGroup), function Trig_Map_Generate_Func014Func018A)
        call DestroyGroup(udg_UnitGroup)
    else
        if(Trig_Map_Generate_Func014Func002C())then
            call EnumDestructablesInRectAll(gg_rct_Tier_2, function Trig_Map_Generate_Func014Func002Func001A)
            set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Tier_2)
            call GroupRemoveUnitSimple(gg_unit_h00K_0123, udg_UnitGroup)
            call SetUnitUserData(gg_unit_h00K_0123, 6)
            call ForGroupBJ(udg_UnitGroup, function Trig_Map_Generate_Func014Func002Func007A)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func009A)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func011A)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func013A)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func015A)
            call ForGroupBJ(GetRandomSubGroup(3, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func017A)
            call ForGroupBJ(GetRandomSubGroup(2, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func019A)
            call ForGroupBJ(GetRandomSubGroup(2, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func021A)
            call DestroyGroup(udg_UnitGroup)
        else
            if(Trig_Map_Generate_Func014Func002Func003C())then
                call EnumDestructablesInRectAll(gg_rct_Tier_3, function Trig_Map_Generate_Func014Func002Func003Func001A)
                set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Tier_3)
                call ForGroupBJ(udg_UnitGroup, function Trig_Map_Generate_Func014Func002Func003Func003A)
                call GroupRemoveUnitSimple(gg_unit_h00K_0142, udg_UnitGroup)
                call GroupRemoveUnitSimple(gg_unit_h00K_0100, udg_UnitGroup)
                call GroupRemoveUnitSimple(gg_unit_h00K_0155, udg_UnitGroup)
                call GroupRemoveUnitSimple(gg_unit_h00K_0153, udg_UnitGroup)
                call SetUnitUserData(gg_unit_h00K_0142, 6)
                call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func010A)
                call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func012A)
                call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func014A)
                call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func016A)
                call ForGroupBJ(GetRandomSubGroup(3, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func018A)
                call ForGroupBJ(GetRandomSubGroup(2, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func020A)
                call ForGroupBJ(GetRandomSubGroup(3, udg_UnitGroup), function Trig_Map_Generate_Func014Func002Func003Func022A)
                call SetUnitUserData(gg_unit_h00K_0100, 73)
                call SetUnitUserData(gg_unit_h00K_0155, 73)
                call SetUnitUserData(gg_unit_h00K_0153, 73)
                call DestroyGroup(udg_UnitGroup)
            endif
        endif
    endif
endfunction

function InitTrig_Map_Generate takes nothing returns nothing
    set gg_trg_Map_Generate = CreateTrigger()
    call TriggerAddAction(gg_trg_Map_Generate, function Trig_Map_Generate_Actions)
endfunction
