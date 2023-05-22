function Autosave takes nothing returns nothing
    call TriggerExecute(gg_trg_CodeGen_Save)
endfunction

function Load1 takes nothing returns nothing
    set udg_ImportCode1 = GetPlayerName(Player(15))
    call TriggerExecute(gg_trg_CodeGen_Load)
endfunction

function Load2 takes nothing returns nothing
    set udg_ImportCode2 = GetPlayerName(Player(15))
    call TriggerExecute(gg_trg_CodeGen_Load_2)
endfunction

function Load3 takes nothing returns nothing
    set udg_ImportCode3 = GetPlayerName(Player(15))
    call TriggerExecute(gg_trg_CodeGen_Load_3)
endfunction

function Load4 takes nothing returns nothing
    set udg_ImportCode4 = GetPlayerName(Player(15))
    call TriggerExecute(gg_trg_CodeGen_Load_4)
endfunction

function CodeGen_SaveToDisk takes string loadcode, string filename returns nothing
    call PreloadGenClear()
    call PreloadGenStart()
    call Preload(loadcode)
    call PreloadGenEnd(filename)
    call ClearSelection()
endfunction

function CodeGen_Init takes nothing returns nothing
    local integer i = 1
    local integer b = udg_SaveLoad_Base
    local integer m = udg_SaveLoad_MaxValue
    loop
        exitwhen i >= udg_SaveLoad_MaxValue
        set udg_SaveLoad_Char[i] = SubString(udg_SaveLoad_Alphabet, i, i + 1)
        set i = i + 1
    endloop
    set udg_SaveLoad_Alphabet = SubString(udg_SaveLoad_Alphabet, 0, 1) + SubString(udg_SaveLoad_Alphabet, m + 1, b)
    set udg_SaveLoad_Base = b - m
endfunction

function CodeGen_ConvertItem takes integer id returns integer
    local integer i = 1
    loop
        exitwhen i > udg_SaveLoad_ItemCount
        if(id == udg_SaveLoad_Item[i])then
            return i
        endif
        set i = i + 1
    endloop
    return 0
endfunction

function CodeGen_ConvertUnit takes integer id returns integer
    local integer i = 1
    loop
        exitwhen i > udg_SaveLoad_HeroCount
        if(id == udg_SaveLoad_Hero[i])then
            return i
        endif
        set i = i + 1
    endloop
    return 0
endfunction

function CodeGen_Encode takes integer i returns string
    local integer b
    local string s = ""
    if i <= udg_SaveLoad_Base then
        return SubString(udg_SaveLoad_Alphabet, i, i + 1)
    endif
    loop
        exitwhen i <= 0
        set b = i - (i / udg_SaveLoad_Base) * udg_SaveLoad_Base
        set s = SubString(udg_SaveLoad_Alphabet, b, b + 1) + s
        set i = i / udg_SaveLoad_Base
    endloop
    return s
endfunction

function CodeGen_StrPos takes string s returns integer
    local integer i = 0
    loop
        exitwhen i > udg_SaveLoad_Base
        if s == SubString(udg_SaveLoad_Alphabet, i, i + 1)then
            return i
        endif
        set i = i + 1
    endloop
    return - 1
endfunction

function CodeGen_Decode takes string s returns integer
    local integer a = 0
    loop
        exitwhen StringLength(s) == 1
        set a = a * udg_SaveLoad_Base + udg_SaveLoad_Base * CodeGen_StrPos(SubString(s, 0, 1))
        set s = SubString(s, 1, 99)
    endloop
    return a + CodeGen_StrPos(s)
endfunction

function CodeGen_StringChecksum takes string in returns integer
    local integer i = 0
    local integer l = StringLength(in)
    local integer t = 0
    local integer o = 0
    loop
        exitwhen i >= l
        set t = CodeGen_Decode(SubString(in, i, i + 1))
        set o = o + t
        set i = i + 1
    endloop
    return o
endfunction

function CodeGen_Color takes string char returns string
    local integer i = 0
    local integer l = StringLength(udg_SaveLoad_Full)
    local string x = ""
    loop
        exitwhen i >= l
        set x = SubString(udg_SaveLoad_Full, i, i + 1)
        if char == x then
            if(x == "0"or S2I(x) > 0)then
                return udg_SaveLoad_Number + char
            elseif StringCase(x, false) == x then
                return udg_SaveLoad_Lower + char
            elseif StringCase(x, true) == x then
                return udg_SaveLoad_Upper + char
            endif
        endif
        set i = i + 1
    endloop
    return char
endfunction

function CodeGen_Format takes string s returns string
    local integer i = 0
    local integer x = StringLength(s)
    local integer j = 1
    local string s2 = ""
    loop
        exitwhen i >= x
        set s2 = s2 + CodeGen_Color(SubString(s, i, i + 1))
        if(j >= udg_SaveLoad_HyphenSpace and i != (x - 1))then
            set j = 0
            set s2 = s2 + udg_SaveLoad_SeperationChar
        endif
        set j = j + 1
        set i = i + 1
    endloop
    return s2
endfunction

function CodeGen_Strip takes string s returns string
    local integer i = 0
    local integer x = StringLength(s)
    local string out = ""
    local string a = ""
    loop
        exitwhen i >= x
        set a = SubString(s, i, i + 1)
        if(a != udg_SaveLoad_SeperationChar)then
            set out = out + a
        endif
        set i = i + 1
    endloop
    return out
endfunction

function CodeGen_Load takes string s returns nothing
    local string str = CodeGen_Strip(s)
    local string tmp = ""
    local string c = ""
    local integer x = 0
    local integer i = 1
    local integer l = 0
    local integer j = 1
    local integer f = 0
    local boolean b = true
    set udg_SaveLoad_Valid = false
    if(udg_SaveLoad_Security)then
        loop
            exitwhen i > 3
            if(CodeGen_Decode(SubString(str, 0, i)) == CodeGen_StringChecksum(SubString(str, i, 999)))then
                set udg_SaveLoad_Valid = true
                set str = SubString(str, i, 999)
                set i = 4
            endif
            set i = i + 1
        endloop
    endif
    if(not udg_SaveLoad_Valid)then
        set udg_SaveLoad_Error = "Invalid Code"
        return
    endif
    set i = 0
    set l = StringLength(str)
    if(udg_SaveLoad_CheckName)then
        set c = CodeGen_Encode(CodeGen_StringChecksum(GetPlayerName(GetTriggerPlayer())))
        set i = StringLength(c)
        if(c != SubString(str, l - i, i))then
            set udg_SaveLoad_Valid = false
            set udg_SaveLoad_Error = "Wrong username"
            return
        endif
        set l = l - i
    endif
    set i = 0
    loop
        exitwhen i >= l
        set tmp = SubString(str, i, i + 1)
        set b = true
        set f = 0
        set j = 1
        loop
            exitwhen f >= (udg_SaveLoad_MaxValue)
            if(tmp == udg_SaveLoad_Char[f])then
                set j = f + 2
                set udg_Load[x] = CodeGen_Decode(SubString(str, i + 1, i + (j)))
                set b = false
                set f = udg_SaveLoad_MaxValue
            endif
            set f = f + 1
        endloop
        if(b)then
            set udg_Load[x] = CodeGen_Decode(tmp)
        endif
        set i = i + j
        set x = x + 1
    endloop
    set udg_SaveLoad_Valid = true
endfunction

function CodeGen_Compile takes nothing returns string
    local integer i = 0
    local integer j = 0
    local string out = ""
    local string ln = ""
    local string x = ""
    loop
        exitwhen i > udg_SaveCount
        set x = CodeGen_Encode(udg_Save[i])
        set j = StringLength(x)
        if(j > 1)then
            set out = out + udg_SaveLoad_Char[j - 1]
        endif
        set out = out + x
        set i = i + 1
    endloop

    if(udg_SaveLoad_CheckName)then
        set out = out + CodeGen_Encode(CodeGen_StringChecksum(GetPlayerName(GetTriggerPlayer())))
    endif

    if(udg_SaveLoad_Security)then
        set out = CodeGen_Encode(CodeGen_StringChecksum(out)) + out
    endif

    if udg_SaveLoad_SaveToDisk and GetLocalPlayer() == GetTriggerPlayer()then
        call CodeGen_SaveToDisk(out, udg_SaveLoad_Directory + "\\" + udg_SaveLoad_Filename)
    endif

    return CodeGen_Format(out)
endfunction