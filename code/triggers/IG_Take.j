
function Trig_IG_Take_Conditions takes nothing returns boolean
    return GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED
endfunction

function Trig_IG_Take_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 4, 4))
    set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 5, 5))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 6, 6))
    if GetItemLevel(GetManipulatedItem()) == 4 then
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 9, 9))
        if udg_IG_ItemValue[1] > 1 then
            call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[1])
        endif
        if udg_IG_ItemValue[2] > 1 then
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[2])
        endif
        if udg_IG_ItemValue[3] > 1 then
            call ModifyHeroStat(bj_HEROSTAT_INT, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[3])
        endif
        if udg_IG_ItemValue[4] > 1 then
            set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[4]))
            set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[4]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        endif
        if udg_IG_ItemValue[5] > 1 then
            set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[5]))
            set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[5]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
        endif
        if udg_IG_ItemValue[6] > 1 then
            call UnitAddAbilityBJ(udg_IG_ItemAT_HP_T[udg_IG_ItemValue[6]], GetManipulatingUnit())
        endif
        if udg_IG_ItemValue[7] > 1 then
            call UnitAddAbilityBJ(udg_IG_ItemAT_MP[udg_IG_ItemValue[7]], GetManipulatingUnit())
        endif
        if udg_IG_ItemValue[8] > 1 then
            call UnitAddAbilityBJ(udg_IG_ItemAT_REG[udg_IG_ItemValue[8]], GetManipulatingUnit())
        endif
        if udg_IG_ItemValue[9] > 1 then
            set udg_IG_ItemEnchant[2] = udg_IG_ItemValue[9]
            if udg_IG_ItemValue[9] == 2 or udg_IG_ItemValue[9] == 3 or udg_IG_ItemValue[9] == 8 then
                call UnitAddAbilityBJ(0x41303532, ArctUnit)
            else
                call UnitAddAbilityBJ(0x41303347, ArctUnit)
            endif
        endif
    else
        if GetItemLevel(GetManipulatedItem()) == 2 then
            if udg_IG_ItemValue[1] > 1 then
                call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_L[udg_IG_ItemValue[1]], GetManipulatingUnit())
            endif
            if udg_IG_ItemValue[2] > 1 then
                set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
            endif
            if udg_IG_ItemValue[3] > 1 then
                call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
            endif
            if udg_IG_ItemValue[4] > 1 then
                call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
            endif
            if udg_IG_ItemValue[5] > 1 then
                call UnitAddAbilityBJ(udg_IG_ItemModelW_L[udg_IG_ItemValue[5]], GetManipulatingUnit())
                set udg_CO_LeftWeapon = true
            endif
            if udg_IG_ItemValue[6] > 1 then
                call DestroyEffect(udg_IG_ItemEnchantEffect[2])
                call AddSpecialEffectTargetUnitBJ("foot,left", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                set udg_IG_ItemEnchantEffect[2] = GetLastCreatedEffectBJ()
                set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
            endif
        else
            if GetItemLevel(GetManipulatedItem()) == 1 then
                if udg_IG_ItemValue[1] > 1 then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_R[udg_IG_ItemValue[1]], GetManipulatingUnit())
                endif
                if udg_IG_ItemValue[2] > 1 then
                    set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                    set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                endif
                if udg_IG_ItemValue[3] > 1 then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
                endif
                if udg_IG_ItemValue[4] > 1 then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                endif
                if udg_IG_ItemValue[5] > 1 then
                    call UnitAddAbilityBJ(udg_IG_ItemModelW_R[udg_IG_ItemValue[5]], GetManipulatingUnit())
                endif
                if udg_IG_ItemValue[6] > 1 then
                    call DestroyEffect(udg_IG_ItemEnchantEffect[1])
                    call AddSpecialEffectTargetUnitBJ("weapon", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                    set udg_IG_ItemEnchantEffect[1] = GetLastCreatedEffectBJ()
                    set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
                endif
            else
                if GetItemLevel(GetManipulatedItem()) == 3 then
                    if udg_IG_ItemValue[1] > 1 then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_DEF[udg_IG_ItemValue[1]], GetManipulatingUnit())
                    endif
                    if udg_IG_ItemValue[2] > 1 then
                        set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[2]))
                        set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[2]))
                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                    endif
                    if udg_IG_ItemValue[3] > 1 then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_HP_A[udg_IG_ItemValue[3]], GetManipulatingUnit())
                    endif
                    if udg_IG_ItemValue[4] > 1 then
                        call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                    endif
                    if udg_IG_ItemValue[5] > 1 then
                        call UnitAddAbilityBJ(udg_IG_ItemModelA[udg_IG_ItemValue[5]], GetManipulatingUnit())
                        if udg_IG_ItemValue[5] == 5 then
                            call UnitAddAbilityBJ(0x41303354, ArctUnit)
                            set udg_IG_ItemEffect_Helmet = 0x41303354
                        endif
                        if udg_IG_ItemValue[5] == 6 then
                            call UnitAddAbilityBJ(0x4130334F, ArctUnit)
                            set udg_IG_ItemEffect_Helmet = 0x4130334F
                        endif
                        if udg_IG_ItemValue[5] == 9 then
                            call UnitAddAbilityBJ(0x41303351, ArctUnit)
                            set udg_IG_ItemEffect_Helmet = 0x41303351
                            call UnitAddAbilityBJ(0x41303353, ArctUnit)
                            set udg_IG_ItemEffect_Pauldrons = 0x41303353
                        endif
                    endif
                    if udg_IG_ItemValue[6] > 1 then
                        set udg_IG_ItemEnchant[1] = udg_IG_ItemValue[6]
                        call UnitAddAbilityBJ(0x4130334D, ArctUnit)
                    endif
                endif
            endif
        endif
    endif
    set udg_IG_InfoItem = GetManipulatedItem()
    set udg_IG_InfoBool = true
    call TriggerExecute(gg_trg_IG_Text)
endfunction

function InitTrig_IG_Take takes nothing returns nothing
    set gg_trg_IG_Take = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_IG_Take, ArctUnit, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_IG_Take, Condition(function Trig_IG_Take_Conditions))
    call TriggerAddAction(gg_trg_IG_Take, function Trig_IG_Take_Actions)
endfunction
