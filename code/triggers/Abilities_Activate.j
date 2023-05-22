function Trig_Abilities_Activate_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130364A or GetSpellAbilityId() == 0x4130364B or GetSpellAbilityId() == 0x4130364C or GetSpellAbilityId() == 0x4130364D
endfunction

function Trig_Abilities_Activate_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 0x4130364A then

        if udg_AS_Logic[1] then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[1])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[1] = GetLastCreatedDestructable()
            set udg_AS_Logic[1] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 1
            set udg_AS_SeriesNumber = 1
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("3", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[1] = GetLastCreatedTextTag()
            call ConditionalTriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif

    endif
    
    if GetSpellAbilityId() == 0x4130364B then
        if udg_AS_Logic[2] then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[2])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[2] = GetLastCreatedDestructable()
            set udg_AS_Logic[2] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 2
            set udg_AS_SeriesNumber = 2
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("5", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    endif

    if GetSpellAbilityId() == 0x4130364C then
        if udg_AS_Logic[3] then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[3])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[3] = GetLastCreatedDestructable()
            set udg_AS_Logic[3] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 3
            set udg_AS_SeriesNumber = 3
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("7", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[3] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    endif

    if GetSpellAbilityId() == 0x4130364D then
        if udg_AS_Logic[4] then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[4])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[4] = GetLastCreatedDestructable()
            set udg_AS_Logic[4] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 4
            set udg_AS_SeriesNumber = 4
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("9", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[4] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    endif
    
endfunction

function InitTrig_Abilities_Activate takes nothing returns nothing
    set gg_trg_Abilities_Activate = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Activate, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Activate, Condition(function Trig_Abilities_Activate_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Activate, function Trig_Abilities_Activate_Actions)
endfunction
