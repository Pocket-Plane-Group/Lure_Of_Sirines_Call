/* updated file by cmorgan */

/* Adding the transition: Ghrey just broke/rebuilt the vanilla state in tra, so just add the action */
ADD_TRANS_ACTION ~%tutu_var%ARDROU~ BEGIN 0 END BEGIN END ~SetGlobal("J#ArdTalk","GLOBAL",1)~

/* Modifying the string as per Ghrey's edit, since the kid is there, and the original string doesn't match */
REPLACE_SAY ~%tutu_var%ARDROU~ 2 @0

/* the kid leaves the area after the talk. Ardrouine stays put, in case someone else wants her for another reason. */
/*By the way, don't add EscapeArea() for her into the A_T_A, or she leaves first and doesn't complete the script... */
ADD_TRANS_ACTION ~%tutu_var%ARDROU~ BEGIN 2 END BEGIN END ~ActionOverride("J#Bren",EscapeArea())~

REPLACE_STATE_TRIGGER %tutu_var%ARDROU 0
~Global("J#ArdTalk","GLOBAL",0)
GlobalLT("WorgsDead","GLOBAL",3)
!Dead("J#Bren")
!See("J#Bren")~

REPLACE_STATE_TRIGGER %tutu_var%ARDROU 3
~GlobalGT("WorgsDead","GLOBAL",3)~

REPLACE_STATE_TRIGGER %tutu_var%ARDROU 1
~GlobalLT("WorgsDead","GLOBAL",3)
!Dead("J#Bren") 
!See("J#Bren")~

ADD_STATE_TRIGGER %tutu_var%ARDROU 2
~See("J#Bren") !Dead("J#Bren")~

//Brennan is dead
REPLACE_STATE_TRIGGER %tutu_var%ARDROU 4
~Dead("J#Bren")~

ADD_TRANS_ACTION ~%tutu_var%ARDROU~ BEGIN 4 END BEGIN END ~Enemy() EscapeArea()~