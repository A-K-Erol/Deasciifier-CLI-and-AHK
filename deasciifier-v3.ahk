^!t::   ; Ctrl + Alt + T

{
    cbs := Clipboard ; save clipboard
    Clipboard := ""
    Send ^c
    ClipWait
    highlightedText := Clipboard
    highlightedText := StrReplace(highlightedText, "`n", "NEWLINE_DESIGNATOR_01000101")
    
    cmd := "python deasciifierCLIforHotkey.py    """ . highlightedText . """"
    RunWait, cmd.exe /c %cmd% ,, Hide
    
    if ErrorLevel
    {
        MsgBox, Error running the Python script.
        return
    }
    
    FileRead, deasciifiedText, temp.txt
    FileDelete temp.txt

    deasciifiedCleanedText := StrReplace(deasciifiedText, "NEWLINE_DESIGNATOR_01000101", "`n")
    Clipboard := deasciifiedCleanedText  ; Set clipboard content to deasciified text

    Send ^v  ; Paste the deasciified text
    Sleep, 100 ; wait for paste to execute
    Clipboard := cbs ; restore clipboard
    return
}

^!k::   ; Ctrl + Alt + k
{
    Clipboard := ""
    Send ^c
    ClipWait
    highlightedText := Clipboard
    highlightedText := StrReplace(highlightedText, "`n", "NEWLINE_DESIGNATOR_01000101")
    
    cmd := "python deasciifierCLIforHotkey.py    """ . highlightedText . """"
    RunWait, cmd.exe /c %cmd% ,, Hide
    
    if ErrorLevel
    {
        MsgBox, Error running the Python script.
        return
    }
    
    FileRead, deasciifiedText, temp.txt
    FileDelete temp.txt

    deasciifiedCleanedText := StrReplace(deasciifiedText, "NEWLINE_DESIGNATOR_01000101", "`n")
    Clipboard := deasciifiedCleanedText  ; Set clipboard content to deasciified text
    ; MsgBox, output on clipboard = %Clipboard%
}

