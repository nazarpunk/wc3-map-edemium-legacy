function Trig_Map_Move_Func002Func003A takes nothing returns nothing
    set udg_EM_Target = GetEnumUnit()
endfunction

function Trig_Map_Move_Func012A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction

function Trig_Map_Move_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130354D, udg_EM_Target)
    if udg_EM_Encounter then
        set udg_EM_Encounter = false
        call ForGroupBJ(GetRandomSubGroup(1, udg_EM_EventGroup), function Trig_Map_Move_Func002Func003A)
    else
        set udg_EM_Target = udg_Target
    endif
    call UnitRemoveAbilityBJ(0x4130345A, udg_EM_Target)
    call UnitRemoveAbilityBJ(0x4130354E, udg_EM_Target)
    call UnitAddAbilityBJ(0x4130354D, udg_EM_Target)
    set udg_EM_LevelDiscovered[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, udg_EM_Target))] = 1
    set udg_EM_TargetCV = R2I(GetUnitStateSwap(UNIT_STATE_LIFE, udg_EM_Target))
    call GroupAddUnitSimple(udg_EM_Target, udg_EM_EventGroup)
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_EM_Target)
    set udg_Point = GetUnitLoc(udg_EM_Target)
    call EnumDestructablesInCircleBJ(50.00, udg_Point, function Trig_Map_Move_Func012A)
    call RemoveDestructable(udg_EM_Effect)
    call CreateDestructableLoc(0x42303141, udg_TargetPoint, 0.00, 0.30, 0)
    set udg_EM_Effect = GetLastCreatedDestructable()
    if GetUnitUserData(udg_EM_Target) == 1 then
        call CreateDestructableLoc(0x42303142, udg_Point, 270.00, 12.00, 0)
    else
        if GetUnitUserData(udg_EM_Target) == 2 then
            call CreateDestructableLoc(0x42303339, udg_Point, 270.00, 12.00, 0)
        else
            if GetUnitUserData(udg_EM_Target) == 3 then
                call CreateDestructableLoc(0x42303143, udg_Point, 270.00, 12.00, 0)
            else
                if GetUnitUserData(udg_EM_Target) == 4 then
                    call CreateDestructableLoc(0x42303144, udg_Point, 270.00, 12.00, 0)
                else
                    if GetUnitUserData(udg_EM_Target) == 6 then
                        call CreateDestructableLoc(0x42303137, udg_Point, 270.00, 12.00, 0)
                    else
                        if GetUnitUserData(udg_EM_Target) == 71 then
                            call CreateDestructableLoc(0x42303145, udg_Point, 270.00, 12.00, 0)
                        else
                            if GetUnitUserData(udg_EM_Target) == 72 then
                                call CreateDestructableLoc(0x42303341, udg_Point, 270.00, 12.00, 0)
                            else
                                if GetUnitUserData(udg_EM_Target) == 73 then
                                    call CreateDestructableLoc(0x42303138, udg_Point, 270.00, 12.00, 0)
                                else
                                    if GetUnitUserData(udg_EM_Target) == 74 then
                                        call CreateDestructableLoc(0x42303342, udg_Point, 270.00, 12.00, 0)
                                    else
                                        call CreateDestructableLoc(0x42303139, udg_Point, 270.00, 12.00, 0)
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Map_Move takes nothing returns nothing
    set gg_trg_Map_Move = CreateTrigger()
    call TriggerAddAction(gg_trg_Map_Move, function Trig_Map_Move_Actions)
endfunction
