#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Execute terminal command
command(cmd, delay := 750)
{
    Send, %cmd%
    Sleep, 600
    Send, {Enter}
    Sleep, delay
}

; Clear screen
clear()
{
    Sleep, 1500
    command("clear", 100)
}

echo(str, delay := 100)
{
    cmd := "echo '" . str . "'" 
    command(cmd, delay)
}

; Press enter with a delay
pressEnter(delay := 500)
{
    Send, {Enter}
    Sleep, delay
}

; Prss ctrl + tab to switch panes
ctrltab()
{
    Send, {CtrlDown}{Tab}
    Sleep, 1500
    Send, {CtrlUp}
    Sleep, 600
}

; Press ctrl + shift + p to open drop-down menu
ctrlShiftP()
{
    Send, {CtrlDown}{ShiftDown}p{CtrlUp}{ShiftUp}
    Sleep, 200
}

; Select option in the drop-down menu
dropDownSelect(cmd)
{
    Send, %cmd%
    Sleep, 200
    Send, {Enter}
    Sleep, 100
}

; Prepare for the preview
#[::
    ctrlShiftP()
    dropDownSelect("New tab...")
    dropDownSelect("OhMyPosh PowerShell")
    command("clear", 100)
    ctrlShiftP()
    dropDownSelect("Close all other tabs")
    ctrlShiftP()
    dropDownSelect("New tab...")
    dropDownSelect("OhMyPosh Debian")
    command("clear", 100)
    ctrltab()
return

; Preview the theme
#]::
    ; Showcase new-lines and wrong command
    echo("PowerShell support")
    echo("Transient prompt support")
    pressEnter()
    pressEnter()
    pressEnter()
    clear()

    ; Showcase behaviour on error
    echo("On error")
    command("mistake")
    clear()

    ; Create few files to show programming language support
    echo("Language support")
    command(".\preview-files\add-preview-files.ps1")
    clear()

    ; Use some git commands to show git support
    echo("Git support")
    command("git add 1.js", 1500)
    command("git commit -m 'New commit'", 1500)
    clear()

    ; Switch to another terminal to show support of multiple types of terminals
    ctrltab()
    echo("Bash support", 300)
    echo("Transient prompt support", 300)
    pressEnter()
    pressEnter()
    pressEnter()
    clear()

    ; Clean-up
    ctrltab()
    echo("Clean-up")
    command("git reset HEAD~", 200)
    command(".\preview-files\remove-preview-files.ps1", 200)
    clear()
return