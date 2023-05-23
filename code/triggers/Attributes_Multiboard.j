function Trig_Attributes_Multiboard_Actions takes nothing returns nothing
    call CreateMultiboardBJ(1, 3, "|cFFFFFFFFХарактеристики:|r ")
    set udg_AttributesBoard = GetLastCreatedMultiboard()
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 1, "ReplaceableTextures\\CommandButtons\\BTNArcturus.blp")
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 2, "ReplaceableTextures\\CommandButtons\\PASSkill20.blp")
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 3, "ReplaceableTextures\\CommandButtons\\PASSkill4.blp")
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call MultiboardSetItemWidthBJ(udg_AttributesBoard, 1, bj_forLoopAIndex, 12.00)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
endfunction

function InitTrig_Attributes_Multiboard takes nothing returns nothing
    set gg_trg_Attributes_Multiboard = CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Attributes_Multiboard, 3.00)
    call TriggerAddAction(gg_trg_Attributes_Multiboard, function Trig_Attributes_Multiboard_Actions)
endfunction
