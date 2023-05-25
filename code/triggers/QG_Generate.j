function Trig_QG_Generate_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 4)
    if udg_RandomNumber == 1 then
        set udg_QG_Count[1] = 0
        set udg_RandomNumber = GetRandomInt(40, 80)
        set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveState[1] = 1
        set udg_QG_CountMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveName[1] = "Убито монстров "
        set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    endif
    if udg_RandomNumber == 2 then
        set udg_QG_Count[2] = 0
        set udg_RandomNumber = GetRandomInt(1, 2)
        set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveState[1] = 2
        set udg_QG_CountMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveName[1] = "Пройдено подземелий "
        set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    endif
    if udg_RandomNumber == 3 then
        set udg_QG_Count[3] = 0
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveState[1] = 3
        set udg_QG_CountMax[3] = udg_RandomNumber
        set udg_QG_ObjectiveName[1] = "Пройдено арен Эдемора "
        set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    endif

    if udg_RandomNumber == 4 then
        set udg_QG_Count[4] = 0
        set udg_RandomNumber = GetRandomInt(2, 6)
        set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveState[1] = 4
        set udg_QG_CountMax[4] = udg_RandomNumber
        set udg_QG_ObjectiveName[1] = "Открыто сундуков "
        set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    endif

    set udg_RandomNumber = GetRandomInt(1, 4)
    
    if udg_RandomNumber == 1 then
        set udg_QG_Count[5] = 0
        set udg_RandomNumber = GetRandomInt(1, 2)
        set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveState[2] = 5
        set udg_QG_CountMax[5] = udg_RandomNumber
        set udg_QG_ObjectiveName[2] = "Убито боссов "
        set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    endif
    if udg_RandomNumber == 2 then
        set udg_QG_Count[6] = 0
        set udg_RandomNumber = GetRandomInt(5, 10)
        set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveState[2] = 6
        set udg_QG_CountMax[6] = udg_RandomNumber
        set udg_QG_ObjectiveName[2] = "Распылено предметов "
        set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    endif
    if udg_RandomNumber == 3 then
        set udg_QG_Count[7] = 0
        set udg_RandomNumber = GetRandomInt(40, 80)
        set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveState[2] = 7
        set udg_QG_CountMax[7] = udg_RandomNumber
        set udg_QG_ObjectiveName[2] = "Применено навыков "
        set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    endif
    if udg_RandomNumber == 4 then
        set udg_QG_Count[8] = 0
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveState[2] = 8
        set udg_QG_CountMax[8] = udg_RandomNumber
        set udg_QG_ObjectiveName[2] = "Изучено секретов "
        set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    endif

    call PlaySoundBJ(gg_snd_NewQuest)
    call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Миссия Пилигрима", ("Текущий коэффициент получения опыта и Света: |cFF00FF00" + R2SW(udg_EX_Rate, 1, 1)), "ReplaceableTextures\\CommandButtons\\BTNArcturus.blp")
    call CreateQuestItemBJ(GetLastCreatedQuestBJ(), udg_QG_Objective[1])
    set udg_QG_Requirement[1] = GetLastCreatedQuestItemBJ()
    call CreateQuestItemBJ(GetLastCreatedQuestBJ(), udg_QG_Objective[2])
    set udg_QG_Requirement[2] = GetLastCreatedQuestItemBJ()
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, udg_QG_Objective[1])
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, udg_QG_Objective[2])
    call EnableTrigger(gg_trg_QG_Completion_Check)
endfunction

function InitTrig_QG_Generate takes nothing returns nothing
    set gg_trg_QG_Generate = CreateTrigger()
    call TriggerAddAction(gg_trg_QG_Generate, function Trig_QG_Generate_Actions)
endfunction
