#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

pressEnter()
{
    Send, Enter
    Sleep, 400
}
command(cmd)
{
    Send, cmd
    Sleep, 100
    Send, enter
    Sleep, 2000
}

ctrltab()
{
    Send, {CtrlDown}{Tab}{CtrlUp}
    Sleep, 1000
}

#]::
pressEnter()
pressEnter()
pressEnter()
command("mistake")
command("ni 1.txt")
command("git add .")
command("git commit -m 'New commit'")

ctrltab()
pressEnter()
pressEnter()
pressEnter()

ctrltab()
command("git reset HEAD~")
command("ri 1.txt")
command("clear")
return