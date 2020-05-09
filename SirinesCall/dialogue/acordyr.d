
//REPLACE_STATE_TRIGGER %tutu_var%CORDYR 0 ~~


APPEND %tutu_var%CORDYR

IF WEIGHT #-1
~!Dead("Sil")
Global("HelpCordyr","GLOBAL",1)
Global("J#PirateFight","GLOBAL",3)
Global("C#bgqe_SilCordyr","GLOBAL",0) //bgqe
~ THEN BEGIN peaceful_sirenes
  SAY @1 
  IF ~ReputationLT(Player1,8)~ THEN DO ~GiveItem("SCRL1H",LastTalkedToBy)
AddexperienceParty(1000)
SetGlobal("HelpCordyr","GLOBAL",2)~ %SOLVED_JOURNAL% #%solved_strref% EXIT
  IF ~ReputationGT(Player1,7)~ THEN DO ~GiveItem("SCRL1F",LastTalkedToBy)
AddexperienceParty(1000)
SetGlobal("HelpCordyr","GLOBAL",2)~ %SOLVED_JOURNAL% #%solved_strref% EXIT
END

END //APPEND