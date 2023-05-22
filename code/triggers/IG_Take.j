
function Trig_IG_Take_Conditions takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func002C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func006Func002C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 5
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func006Func003C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 6
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func006Func004C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 9
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 3
endfunction

function Trig_IG_Take_Func009Func002Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002Func008C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction

function Trig_IG_Take_Func009Func002Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 1
endfunction

function Trig_IG_Take_Func009Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction

function Trig_IG_Take_Func009Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction

function Trig_IG_Take_Func009Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction

function Trig_IG_Take_Func009Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction

function Trig_IG_Take_Func009Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction

function Trig_IG_Take_Func009Func002Func008C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction

function Trig_IG_Take_Func009Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 2
endfunction

function Trig_IG_Take_Func009Func006C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction

function Trig_IG_Take_Func009Func007C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction

function Trig_IG_Take_Func009Func008C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction

function Trig_IG_Take_Func009Func009C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction

function Trig_IG_Take_Func009Func010C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction

function Trig_IG_Take_Func009Func011C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction

function Trig_IG_Take_Func009Func012C takes nothing returns boolean
    return udg_IG_ItemValue[7] > 1
endfunction

function Trig_IG_Take_Func009Func013C takes nothing returns boolean
    return udg_IG_ItemValue[8] > 1
endfunction

function Trig_IG_Take_Func009Func014Func002C takes nothing returns boolean
    return udg_IG_ItemValue[9] == 2 or udg_IG_ItemValue[9] == 3 or udg_IG_ItemValue[9] == 8
endfunction

function Trig_IG_Take_Func009Func014C takes nothing returns boolean
    return udg_IG_ItemValue[9] > 1
endfunction

function Trig_IG_Take_Func009C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 4
endfunction

function Trig_IG_Take_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 4, 4))
    set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 5, 5))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 6, 6))
    if(Trig_IG_Take_Func009C())then
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 9, 9))
        if(Trig_IG_Take_Func009Func006C())then
            call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[1])
        else
        endif
        if(Trig_IG_Take_Func009Func007C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[2])
        else
        endif
        if(Trig_IG_Take_Func009Func008C())then
            call ModifyHeroStat(bj_HEROSTAT_INT, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[3])
        else
        endif
        if(Trig_IG_Take_Func009Func009C())then
            set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[4]))
            set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[4]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        else
        endif
        if(Trig_IG_Take_Func009Func010C())then
            set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[5]))
            set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[5]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
        else
        endif
        if(Trig_IG_Take_Func009Func011C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_HP_T[udg_IG_ItemValue[6]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func012C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_MP[udg_IG_ItemValue[7]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func013C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_REG[udg_IG_ItemValue[8]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func014C())then
            set udg_IG_ItemEnchant[2] = udg_IG_ItemValue[9]
            if(Trig_IG_Take_Func009Func014Func002C())then
                call UnitAddAbilityBJ(0x41303532, udg_Arct)
            else
                call UnitAddAbilityBJ(0x41303347, udg_Arct)
            endif
        else
        endif
    else
        if(Trig_IG_Take_Func009Func002C())then
            if(Trig_IG_Take_Func009Func002Func003C())then
                call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_L[udg_IG_ItemValue[1]], GetManipulatingUnit())
            endif
            if(Trig_IG_Take_Func009Func002Func004C())then
                set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
            endif
            if(Trig_IG_Take_Func009Func002Func005C())then
                call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
            else
            endif
            if(Trig_IG_Take_Func009Func002Func006C())then
                call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
            else
            endif
            if(Trig_IG_Take_Func009Func002Func007C())then
                call UnitAddAbilityBJ(udg_IG_ItemModelW_L[udg_IG_ItemValue[5]], GetManipulatingUnit())
                set udg_CO_LeftWeapon = true
            else
            endif
            if(Trig_IG_Take_Func009Func002Func008C())then
                call DestroyEffectBJ(udg_IG_ItemEnchantEffect[2])
                call AddSpecialEffectTargetUnitBJ("foot,left", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                set udg_IG_ItemEnchantEffect[2] = GetLastCreatedEffectBJ()
                set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
            else
            endif
        else
            if(Trig_IG_Take_Func009Func002Func002C())then
                if(Trig_IG_Take_Func009Func002Func002Func003C())then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_R[udg_IG_ItemValue[1]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func004C())then
                    set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                    set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func005C())then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func006C())then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func007C())then
                    call UnitAddAbilityBJ(udg_IG_ItemModelW_R[udg_IG_ItemValue[5]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func008C())then
                    call DestroyEffectBJ(udg_IG_ItemEnchantEffect[1])
                    call AddSpecialEffectTargetUnitBJ("weapon", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                    set udg_IG_ItemEnchantEffect[1] = GetLastCreatedEffectBJ()
                    set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
                else
                endif
            else
                if(Trig_IG_Take_Func009Func002Func002Func002C())then
                    if(Trig_IG_Take_Func009Func002Func002Func002Func002C())then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_DEF[udg_IG_ItemValue[1]], GetManipulatingUnit())
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func003C())then
                        set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[2]))
                        set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[2]))
                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func004C())then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_HP_A[udg_IG_ItemValue[3]], GetManipulatingUnit())
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func005C())then
                        call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func006C())then
                        call UnitAddAbilityBJ(udg_IG_ItemModelA[udg_IG_ItemValue[5]], GetManipulatingUnit())
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func002C())then
                            call UnitAddAbilityBJ(0x41303354, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x41303354
                        else
                        endif
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func003C())then
                            call UnitAddAbilityBJ(0x4130334F, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x4130334F
                        else
                        endif
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func004C())then
                            call UnitAddAbilityBJ(0x41303351, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x41303351
                            call UnitAddAbilityBJ(0x41303353, udg_Arct)
                            set udg_IG_ItemEffect_Pauldrons = 0x41303353
                        else
                        endif
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func007C())then
                        set udg_IG_ItemEnchant[1] = udg_IG_ItemValue[6]
                        call UnitAddAbilityBJ(0x4130334D, udg_Arct)
                    else
                    endif
                else
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
    call TriggerRegisterUnitEvent(gg_trg_IG_Take, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_IG_Take, Condition(function Trig_IG_Take_Conditions))
    call TriggerAddAction(gg_trg_IG_Take, function Trig_IG_Take_Actions)
endfunction
