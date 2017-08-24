EmptyVar := ""
FirstName = 
LastName = 
UserVariable1 = Select
UserVariable2 = Select
UserVarOne = This`n
( Comment  ;UserVarOne
is ;UserVarOne
some ;UserVarOne
multiline ;UserVarOne
%EmptyVar% ;UserVarOne
text. ;UserVarOne
) ;UserVarOne
UserVarTwo = This`n
( Comment  ;UserVarTwo
is ;UserVarTwo
some ;UserVarTwo
multiline ;UserVarTwo
%EmptyVar% ;UserVarTwo
text. ;UserVarTwo
) ;UserVarTwo

^!c::
SetTitleMatchMode, 2
IfWinExist, - SciTE4
    MsgBox, Your AutoHotkey script file must be closed before pressing "OK" to continue.
Gui, New, +Resize
Gui, Add, Text,, First Name
Gui, Add, Edit, vFirstName, %FirstName%
Gui, Add, Text,, Last Name
Gui, Add, Edit, vLastName, %LastName%
Gui, Add, Text,, User Variable 1
Gui, Add, DropDownList, w75 vUserVariable1, Select||1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100
GuiControl, ChooseString, ComboBox1, %UserVariable1%
Gui, Add, Text,, User Variable 2
Gui, Add, DropDownList, w75 vUserVariable2, Select||1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100
GuiControl, ChooseString, ComboBox2, %UserVariable2%
Gui, Add, Text, ys, User Var 1
Gui, Add, Edit, wantTab r20 w500 vUserVarOne, %UserVarOne%
Gui, Add, Text,, User Var 2
Gui, Add, Edit, wantTab r20 w500 vUserVarTwo, %UserVarTwo%
Gui, Add, Button, default, &Update
Gui, Show,, Update User Information
return

ButtonUpdate:
EmptyVar := ""
Gui, Submit
TempVar = 0
StringSplit, LinesOne, UserVarOne, `n 
StringSplit, LinesTwo, UserVarTwo, `n
Loop, read, C:\Users\%FirstName%.%LastName%\Desktop\Hardcode variables.AHK, C:\Users\%FirstName%.%LastName%\Desktop\Hardcode variables.AHK 
{
    If (TempVar = 1)
        FileAppend, %A_LoopReadUser%`n
    Else 
        {
        IfInString, A_LoopReadUser, F1::
            TempVar = 1
        Else If (UserVarOne) and InStr(A_LoopReadUser, "UserVarOne =" )
            {
            FileAppend, UserVarOne = %LinesOne1%``n`n`( Comment  `;UserVarOne`n
            Increment = 1
            While (Increment < LinesOne0)
                {
                Increment += 1
                LineOfText := LinesOne%Increment%
                If (LineOfText = "")
                    FileAppend, `%emptyVar`% `;UserVarOne`n
                else
                    FileAppend, %LineOfText% `;UserVarOne`n
                }
            FileAppend, `) `;UserVarOne`n
            }
        Else If (UserVarOne) and InStr(A_LoopReadUser, ";UserVarOne" )
            FileAppend,
        Else If (UserVarTwo) and InStr(A_LoopReadUser, "UserVarTwo =" )
            {
            FileAppend, UserVarTwo = %LinesTwo1%``n`n`( Comment  `;UserVarTwo`n
            Increment = 1
            While (Increment < LinesTwo0)
                {
                Increment += 1
                LineOfText := LinesTwo%Increment%
                If (LineOfText = "")
                    FileAppend, `%EmptyVar`% `;UserVarTwo`n
                else
                    FileAppend, %LineOfText% `;UserVarTwo`n
                }
            FileAppend, `) `;UserVarTwo`n
            }
        Else If (UserVarTwo) and InStr(A_LoopReadUser, ";UserVarTwo" )
            FileAppend,
        Else If (UserVar1) and InStr(A_LoopReadUser, "UserVar1 =" )
            FileAppend, UserVar1 = %UserVar1%`n
        Else If (UserVar2) and InStr(A_LoopReadUser, "UserVar2 =" )
            FileAppend, UserVar2 = %UserVar2%`n
        Else If (UserVariable1) and InStr(A_LoopReadUser, "UserVariable1 =" )
            FileAppend, UserVariable1 = %UserVariable1%`n
        Else If (UserVariable2) and InStr(A_LoopReadUser, "UserVariable2 =" )
            FileAppend, UserVariable2 = %UserVariable2%`n
        Else 
            FileAppend, %A_LoopReadUser%`n
        }
    }
FileCopy, C:\Users\%FirstName%.%LastName%\Documents\Temp.AHK, C:\Users\%FirstName%.%LastName%\Documents\AutoHotKey.AHK, 1
FileDelete, C:\Users\%FirstName%.%LastName%\Documents\Temp.AHK
Reload
sleep 2000
Exit