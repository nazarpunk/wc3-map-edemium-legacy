function Trig_CodeGen_Init_Actions takes nothing returns nothing
    set udg_SaveLoad_SaveToDisk = true
    set udg_SaveLoad_Directory = "Edemium"
    set udg_SaveLoad_Filename = ""
    set udg_SaveLoad_Alphabet = "abcdefghkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789"
    set udg_SaveLoad_CheckName = true
    set udg_SaveLoad_Security = true
    set udg_SaveLoad_HyphenSpace = 4
    set udg_SaveLoad_SeperationChar = ""
    set udg_SaveLoad_Lower = ""
    set udg_SaveLoad_Number = ""
    set udg_SaveLoad_Upper = ""
    set udg_SaveLoad_MaxValue = 6
    set udg_SaveLoad_Hero[0] = 0x48303030
    set udg_SaveLoad_HeroCount = 0
    set udg_SaveLoad_Item[0] = GetItemTypeId(null)
    set udg_SaveLoad_Item[1] = 0x49303347
    set udg_SaveLoad_Item[2] = 0x49303344
    set udg_SaveLoad_Item[3] = 0x49303341
    set udg_SaveLoad_Item[4] = 0x4930334A
    set udg_SaveLoad_Item[5] = 0x49303346
    set udg_SaveLoad_Item[6] = 0x49303343
    set udg_SaveLoad_Item[7] = 0x49303339
    set udg_SaveLoad_Item[8] = 0x49303349
    set udg_SaveLoad_Item[9] = 0x49303345
    set udg_SaveLoad_Item[10] = 0x49303342
    set udg_SaveLoad_Item[11] = 0x49303338
    set udg_SaveLoad_Item[12] = 0x49303348
    set udg_SaveLoad_Item[13] = 0x4930304C
    set udg_SaveLoad_ItemCount = 13
    set udg_SaveLoad_Full = udg_SaveLoad_Alphabet
    set udg_SaveLoad_Error = ""
    set udg_SaveLoad_Base = StringLength(udg_SaveLoad_Alphabet)
    set udg_SaveLoad_Char[0] = ""
    set udg_Load[0] = 0
    set udg_LoadCount = 0
    call CodeGen_Init()
endfunction

function InitTrig_CodeGen_Init takes nothing returns nothing
    set gg_trg_CodeGen_Init = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Init, function Trig_CodeGen_Init_Actions)
endfunction