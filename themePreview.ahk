#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

pressEnter()
{
    Send, {Enter}
    Sleep, 600
}
command(cmd, delay := 2000)
{
    Send, %cmd%
    Sleep, 600
    Send, {Enter}
    Sleep, delay
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
command("ni 1.js")
command("ni 1.php")
command("ni 1.cs")
command("git add 1.js")
command("git commit -m 'New commit'")

ctrltab()
pressEnter()
pressEnter()
pressEnter()
command("clear")

ctrltab()
command("git reset HEAD~", 300)
command("ri 1.js", 300)
command("ri 1.php", 300)
command("ri 1.cs", 300)
command("clear", 300)
return