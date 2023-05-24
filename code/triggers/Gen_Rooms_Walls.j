function Trig_Gen_Rooms_Walls_Func002Func004A takes nothing returns nothing
    set udg_RandomNumber = (udg_RandomNumber + 1)
endfunction

function Trig_Gen_Rooms_Walls_Func002Func009A takes nothing returns nothing
    set udg_RandomNumber = (udg_RandomNumber + 1)
endfunction

function Trig_Gen_Rooms_Walls_Func002Func014A takes nothing returns nothing
    set udg_RandomNumber = (udg_RandomNumber + 1)
endfunction

function Trig_Gen_Rooms_Walls_Func002Func019A takes nothing returns nothing
    set udg_RandomNumber = (udg_RandomNumber + 1)
endfunction

function Trig_Gen_Rooms_Walls_Func002A takes nothing returns nothing
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 400.00, 0)
    set udg_RandomNumber = 0
    call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Walls_Func002Func004A)
    if udg_RandomNumber == 0 then
        call CreateDestructableLoc(udg_D_WallTierTypeRoom[3], udg_D_PointOffset, 0.00, 1.40, 0)
        call SetDestructableOccluderHeight(GetLastCreatedDestructable(), 1.00)
    endif
    set udg_RandomNumber = 0
    call RemoveLocation(udg_D_PointOffset)
    set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, - 400.00)
    call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Walls_Func002Func009A)
    if udg_RandomNumber == 0 then
        call CreateDestructableLoc(udg_D_WallTierTypeRoom[1], udg_D_PointOffset, 0.00, 1.40, 0)
    endif
    set udg_RandomNumber = 0
    call RemoveLocation(udg_D_PointOffset)
    set udg_D_PointOffset = OffsetLocation(udg_D_Point2, - 350.00, 0.00)
    call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Walls_Func002Func014A)
    if udg_RandomNumber == 0 then
        call CreateDestructableLoc(udg_D_WallTierTypeRoom[4], udg_D_PointOffset, 0.00, 1.40, 0)
        call SetDestructableOccluderHeight(GetLastCreatedDestructable(), 1.00)
    endif
    set udg_RandomNumber = 0
    call RemoveLocation(udg_D_PointOffset)
    set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, 350.00)
    call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Walls_Func002Func019A)
    if udg_RandomNumber == 0 then
        call CreateDestructableLoc(udg_D_WallTierTypeRoom[2], udg_D_PointOffset, 0.00, 1.40, 0)
    endif
    call RemoveLocation(udg_D_PointOffset)
    call RemoveLocation(udg_D_Point2)
endfunction

function Trig_Gen_Rooms_Walls_Func004A takes nothing returns nothing
    local integer id = GetDestructableTypeId(GetEnumDestructable())
    if id == 0x4230314A or id == 0x42303151 or id == 0x42303149 or id == 0x42303152 or id == 0x42303236 or id == 0x42303237 or id == 0x42303238 or id == 0x42303239 then
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_Gen_Rooms_Walls_Func005A takes nothing returns nothing
    local integer id = GetDestructableTypeId(GetEnumDestructable())
    if id == 0x4230314A or id == 0x42303151 or id == 0x42303149 or id == 0x42303152 or id == 0x42303236 or id == 0x42303237 or id == 0x42303238 or id == 0x42303239 then
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_Gen_Rooms_Walls_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Rooms_Walls_Func002A)
    call DestroyGroup(udg_D_Pick)
    call EnumDestructablesInRectAll(gg_rct_Cell3_Delete_1, function Trig_Gen_Rooms_Walls_Func004A)
    call EnumDestructablesInRectAll(gg_rct_Cell3_Delete_2, function Trig_Gen_Rooms_Walls_Func005A)
    call ConditionalTriggerExecute(gg_trg_Gen_Rooms_Doors)
endfunction

function InitTrig_Gen_Rooms_Walls takes nothing returns nothing
    set gg_trg_Gen_Rooms_Walls = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Rooms_Walls, function Trig_Gen_Rooms_Walls_Actions)
endfunction