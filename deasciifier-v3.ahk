^!t::   ; Ctrl + Alt + T
{
    Clipboard := ""
    Send ^c
    ClipWait
    highlightedText := Clipboard
    
    cmd := "python deasciifyCLI.py    """ . highlightedText . """"
    RunWait, cmd.exe /c %cmd% ,, Hide
    
    if ErrorLevel
    {
        MsgBox, Error running the Python script.
        return
    }
    
    FileRead, deasciifiedText, temp.txt
    FileDelete temp.txt
    
    Clipboard := deasciifiedText  ; Set clipboard content to deasciified text
    Send ^v  ; Paste the deasciified text
    return
}

^!k::   ; Ctrl + Alt + T
{
    Clipboard := ""
    Send ^c
    ClipWait
    highlightedText := Clipboard
    
    cmd := "python deasciifyCLI.py    """ . highlightedText . """"
    RunWait, cmd.exe /c %cmd% ,, Hide
    
    if ErrorLevel
    {
        MsgBox, Error running the Python script.
        return
    }
    
    FileRead, deasciifiedText, temp.txt
    FileDelete temp.txt
    
    Clipboard := deasciifiedText  ; Set clipboard content to deasciified text
    MsgBox, output on clipboard = %Clipboard%
}

