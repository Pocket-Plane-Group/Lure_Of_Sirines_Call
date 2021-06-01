
/*
REPLACE_STATE_TRIGGER %tutu_var%sil 7 ~!Global("J#TalkedPirate","GLOBAL",1) !Global("J#TalkedSil","GLOBAL",1) !Allegiance(Myself,[ENEMY])~
*/
REPLACE_STATE_TRIGGER %tutu_var%sil 7 ~!Allegiance(Myself,[ENEMY])~

REPLACE_STATE_TRIGGER %tutu_var%sil 11 ~Allegiance(Myself,[ENEMY])~


REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 0 END BEGIN END ~Enemy()~ ~~
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 1 END BEGIN END ~Enemy()~ ~~

REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 0 END BEGIN END ~Shout(1)~ ~~
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 1 END BEGIN END ~Shout(1)~ ~~

/* bgee */
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 0 END BEGIN END ~Shout(99)~ ~~
REPLACE_TRANS_ACTION %tutu_var%sil BEGIN 1 END BEGIN END ~Shout(99)~ ~~

APPEND %tutu_var%sil


IF WEIGHT #-1 ~Global("J#TalkedPirate","GLOBAL",1)
Global("J#TalkedSil","GLOBAL",0)~ piratetalk
  SAY @0
++ @1 GOTO nowwefight
++ @2 GOTO trespass
++ @3 + trespass
++ @4 + nowwefight
END

IF ~~ nowwefight
  SAY @5
  IF ~~ THEN DO ~Shout(1) SetGlobal("J#SilEnemy","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ trespass
  SAY @6
=
@7
  ++ @8 GOTO helpyou
  ++ @9 GOTO treasurefight
  ++ @10 GOTO helpyou
  ++ @11 GOTO treasurefight
END

IF ~~ treasurefight
  SAY @12
  IF ~~ THEN DO ~Shout(1) SetGlobal("J#SilEnemy","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ helpyou
  SAY @13
=
@14
  IF ~~ THEN DO ~SetGlobal("J#TalkedSil","GLOBAL",1)~ EXIT
END

IF WEIGHT #-1 ~Global("J#TalkedSil","GLOBAL",1)~ silkill
  SAY @15
  ++ @16 + backtoit
  + ~Global("J#PirateFight","GLOBAL",2)
!Dead("J#pirat1")~ + @17 + manythanks

  + ~!Global("J#PirateFight","GLOBAL",2)
Dead("J#pirat1")~ + @17 + manythanks


  + ~Global("J#PirateFight","GLOBAL",2)
Dead("J#pirat1")~ + @17 + manythanks

  + ~Global("J#SilMurder","GLOBAL",1)~ + @18 + fightme
END

IF ~~ backtoit
  SAY @19
  IF ~~ THEN EXIT
END

IF ~~ manythanks
  SAY @20
  IF ~~ THEN DO ~SetGlobal("J#PirateFight","GLOBAL",3)
AddExperienceParty(1500) 
SetGlobal("J#TalkedSil","GLOBAL",2)~ EXIT
END

IF ~~ fightme
  SAY @21
  IF ~~ THEN DO ~Shout(1)
ReputationInc(-1)
SetGlobal("J#SilMurder","GLOBAL",2) SetGlobal("J#SilEnemy","GLOBAL",1)
Enemy()~ EXIT
END
END // end APPEND
