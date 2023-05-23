function Trig_Dungeon_Room_Leave_Conditions takes nothing returns boolean
    return GetClickedButton() == udg_LeaveButton2
endfunction

function Trig_Dungeon_Room_Leave_Func004Func006002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Dungeon_Room_Leave_Actions takes nothing returns nothing
    set udg_EM_EncounterChance = 0
    set udg_EnchantingRoom = false
    set udg_OnkieRoom = false
    if udg_ER_Logic or udg_CS_Bool then
        set udg_ER_Logic = false
        set udg_CS_Bool = false
        set udg_D_Pick = GetUnitsInRectAll(gg_rct_Coliseum)
        call GroupRemoveUnitSimple(gg_unit_n006_0028, udg_D_Pick)
        call ForGroupBJ(udg_D_Pick, function Trig_Dungeon_Room_Leave_Func004Func006002)
        call GroupClear(udg_D_Pick)
        call DestroyGroup(udg_D_Pick)
        call DisableTrigger(gg_trg_Keeper_Look)
        call ConditionalTriggerExecute(gg_trg_Edemor_Exit)
    endif
    call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    if udg_EX_LevelUp > 0 then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = udg_EX_LevelUp
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_RandomNumber = GetRandomInt(1, 3)
            if udg_RandomNumber == 1 then
                set udg_Target = gg_unit_h012_0011
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
            else
                if udg_RandomNumber == 2 then
                    set udg_Target = gg_unit_h012_0012
                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                else
                    set udg_Target = gg_unit_h012_0013
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                endif
            endif
            set udg_AugmentValue = GetUnitUserData(udg_Target)
            set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
            set udg_Point = GetUnitLoc(udg_Target)
            call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
            call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
            set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
            call RemoveLocation(udg_Point)
            set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
            set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set udg_EX_LevelUp = 0
    endif
    call ExecuteFunc("Autosave")
endfunction

function InitTrig_Dungeon_Room_Leave takes nothing returns nothing
    set gg_trg_Dungeon_Room_Leave = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Dungeon_Room_Leave, udg_LeaveDialog)
    call TriggerAddCondition(gg_trg_Dungeon_Room_Leave, Condition(function Trig_Dungeon_Room_Leave_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Room_Leave, function Trig_Dungeon_Room_Leave_Actions)
endfunction
