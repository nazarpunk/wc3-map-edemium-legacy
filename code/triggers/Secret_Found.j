
function Trig_Secret_Found_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130335A
endfunction

function Trig_Secret_Found_Func003A takes nothing returns nothing
    if GetUnitTypeId(GetEnumUnit()) == 0x68303044 then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        if DistanceBetweenPoints(udg_Point, udg_D_Point1) <= 200.00 then
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call RemoveUnit(GetEnumUnit())
            call UnitRemoveBuffBJ(0x42303039, udg_Arct)
            set udg_RandomNumber = GetRandomInt(1, 2)
            if udg_RandomNumber == 1 then
                set udg_RandomNumber = GetRandomInt(6, 10)
                set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + GetRandomInt(6, 10))
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
                if udg_RandomNumber == 2 then
                    set udg_RandomNumber = GetRandomInt(1, 2)
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = udg_RandomNumber
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call CreateItemLoc(0x4930304D, udg_Point)
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                endif
            endif
        else
            call CreateTextTagUnitBJ("Не здесь...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
        call UnitRemoveAbilityBJ(0x4130335A, udg_Arct)
        call RemoveLocation(udg_Point)
    endif
endfunction

function Trig_Secret_Found_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(udg_Arct)
    set udg_D_Pick = GetUnitsInRangeOfLocAll(450.00, udg_D_Point1)
    call ForGroupBJ(udg_D_Pick, function Trig_Secret_Found_Func003A)
    call RemoveLocation(udg_D_Point1)
    call DestroyGroup(udg_D_Pick)
endfunction

function InitTrig_Secret_Found takes nothing returns nothing
    set gg_trg_Secret_Found = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Secret_Found, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Secret_Found, Condition(function Trig_Secret_Found_Conditions))
    call TriggerAddAction(gg_trg_Secret_Found, function Trig_Secret_Found_Actions)
endfunction
