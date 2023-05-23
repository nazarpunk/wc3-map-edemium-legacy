
function Trig_IG_Generate_Func005Func001Func001Func003Func004Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001Func003Func004Func003Func001C takes nothing returns boolean
    if(not(GetHeroLevel(udg_Arct) >= 15))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001Func003Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001Func003Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 12))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001Func003Func010C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 11))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 3))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004Func008Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004Func008Func002Func001C takes nothing returns boolean
    if(not(GetHeroLevel(udg_Arct) >= 25))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004Func008Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004Func008C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 8))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 7))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func001C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 2))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func004Func008Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func004Func008Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func004Func008C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 4))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom == 3))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Func005C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 1))then
        return false
    endif
    return true
endfunction

function Trig_IG_Generate_Actions takes nothing returns nothing
    if(Trig_IG_Generate_Func005C())then
        set udg_IG_ItemRandom = GetRandomInt(1, 4)
        call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
        if(Trig_IG_Generate_Func005Func004C())then
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 9
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_IG_ItemAtt[bj_forLoopBIndex] = "1"
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set udg_IG_ItemAtt[GetRandomInt(1, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
            if(Trig_IG_Generate_Func005Func004Func003C())then
                set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
            else
            endif
        else
            set bj_forLoopAIndex = 2
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
            set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
            set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
            if(Trig_IG_Generate_Func005Func004Func008C())then
                if(Trig_IG_Generate_Func005Func004Func008Func003C())then
                    set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                else
                    set udg_IG_ItemAtt[6] = "1"
                endif
            else
                if(Trig_IG_Generate_Func005Func004Func008Func001C())then
                    set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                else
                    set udg_IG_ItemAtt[6] = "1"
                endif
            endif
        endif
    else
        if(Trig_IG_Generate_Func005Func001C())then
            set udg_IG_ItemRandom = GetRandomInt(5, 8)
            call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
            if(Trig_IG_Generate_Func005Func001Func004C())then
                set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
                set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
                set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
                if(Trig_IG_Generate_Func005Func001Func004Func008C())then
                    if(Trig_IG_Generate_Func005Func001Func004Func008Func002C())then
                        if(Trig_IG_Generate_Func005Func001Func004Func008Func002Func001C())then
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 6))
                        else
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                        endif
                    else
                        set udg_IG_ItemAtt[6] = "1"
                    endif
                else
                    if(Trig_IG_Generate_Func005Func001Func004Func008Func001C())then
                        set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                    else
                        set udg_IG_ItemAtt[6] = "1"
                    endif
                endif
                set bj_forLoopAIndex = 2
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_IG_ItemAtt[GetRandomInt(2, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
            else
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 9
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_IG_ItemAtt[GetRandomInt(1, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                set udg_IG_ItemAtt[GetRandomInt(5, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                if(Trig_IG_Generate_Func005Func001Func004Func004C())then
                    set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
                else
                endif
            endif
        else
            if(Trig_IG_Generate_Func005Func001Func001C())then
                set udg_IG_ItemRandom = GetRandomInt(9, 12)
                call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
                if(Trig_IG_Generate_Func005Func001Func001Func003C())then
                    set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
                    set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
                    set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
                    if(Trig_IG_Generate_Func005Func001Func001Func003Func004C())then
                        if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func003C())then
                            if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func003Func001C())then
                                set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 6))
                            else
                                set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                            endif
                        else
                            set udg_IG_ItemAtt[6] = "1"
                        endif
                    else
                        if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func001C())then
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                        else
                            set udg_IG_ItemAtt[6] = "1"
                        endif
                    endif
                    set bj_forLoopAIndex = 2
                    set bj_forLoopAIndexEnd = 4
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        set udg_IG_ItemAtt[bj_forLoopAIndex] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_IG_ItemAtt[GetRandomInt(2, 4)] = "1"
                else
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 9
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_IG_ItemAtt[GetRandomInt(1, 2)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(3, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(5, 6)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(7, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    if(Trig_IG_Generate_Func005Func001Func001Func003Func010C())then
                        set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
                    else
                    endif
                endif
            else
            endif
        endif
    endif
    call RemoveLocation(udg_IG_Point)
    set udg_IG_ItemCode = (udg_IG_ItemAtt[1] + udg_IG_ItemAtt[2] + udg_IG_ItemAtt[3] + udg_IG_ItemAtt[4] + udg_IG_ItemAtt[5] + udg_IG_ItemAtt[6] + udg_IG_ItemAtt[7] + udg_IG_ItemAtt[8] + udg_IG_ItemAtt[9])
    call SetItemUserData(GetLastCreatedItem(), S2I(udg_IG_ItemCode))
endfunction

function InitTrig_IG_Generate takes nothing returns nothing
    set gg_trg_IG_Generate = CreateTrigger()
    call TriggerAddAction(gg_trg_IG_Generate, function Trig_IG_Generate_Actions)
endfunction
