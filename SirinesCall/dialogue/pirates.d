BEGIN J#pirat1

IF ~NumTimesTalkedTo(0)
!Global("J#SilMurder","GLOBAL",3)~ pirate
  SAY @0
=
@1
++ @2 GOTO explain
++ @3 GOTO explain
+ ~Global("J#ArdTalk","GLOBAL",1)~ + @4 GOTO rude
+ ~Global("J#ArdTalk","GLOBAL",1)~ + @5 GOTO polite
+ ~Global("J#ArdTalk","GLOBAL",1)~ + @6 GOTO rescue
END

IF ~~ explain
  SAY @7
  IF ~~ GOTO boyname
END

IF ~~ rude
  SAY @8
  IF ~~ GOTO boyname
END

IF ~~ polite
  SAY @9
  IF ~~ GOTO boyname
END

IF ~~ rescue
  SAY @10
  IF ~~ GOTO boyname
END

IF ~~ boyname
  SAY @11
  IF ~~ EXTERN J#Bren brennan
END

BEGIN J#bren
IF ~~ brennan
  SAY @12
  + ~!Global("J#ArdTalk","GLOBAL",1)~ + @13 GOTO south
  + ~!Global("J#ArdTalk","GLOBAL",1)~ + @14 EXTERN J#pirat1 beoff
  + ~!Global("J#ArdTalk","GLOBAL",1)~ + @15 EXTERN J#pirat1 beoff
  + ~Global("J#ArdTalk","GLOBAL",1)~ + @16 EXTERN J#pirat1 beoff
  + ~Global("J#ArdTalk","GLOBAL",1)~ + @17 EXTERN J#pirat1 beoff
  + ~Global("J#ArdTalk","GLOBAL",1)~ + @18 EXTERN J#pirat1 beoff
  + ~Global("J#ArdTalk","GLOBAL",1)~ + @19 EXTERN J#pirat1 beoff
END

IF ~~ south
  SAY @20
  IF ~~ THEN EXTERN J#pirat1 beoff
END

APPEND J#pirat1
IF ~~ beoff
  SAY @21
  IF ~ReactionGT(LastTalkedToBy(),NEUTRAL_UPPER)~ GOTO advice
  IF ~ReactionLT(LastTalkedToBy(),FRIENDLY_LOWER)
ReactionGT(LastTalkedToBy(),HOSTILE_UPPER)~ GOTO advice2
  IF ~ReactionLT(LastTalkedToBy(),NEUTRAL_LOWER)~ GOTO bribe
END

IF ~~ advice
  SAY @22
=
@23
  IF ~~ THEN DO ~SetGlobal("J#TalkedPirate","GLOBAL",1)
%EscapeArea_Move%~ EXIT
END

IF ~~ advice2
  SAY @24
  IF ~~ THEN DO ~SetGlobal("J#TalkedPirate","GLOBAL",1)
%EscapeArea_Move%~ EXIT
END

IF ~~ bribe
  SAY @25
  IF ~~ THEN DO ~SetGlobal("J#TalkedPirate","GLOBAL",1)
GivePartyGold(50)
%EscapeArea_Move%~ EXIT
END

IF ~Global("J#SireneTreasure","GLOBAL",1)~ pirate_attack
SAY @63
= @64
= @61   
= @62
IF ~~ THEN DO ~SetGlobal("J#PirateFight","GLOBAL",1) // His men spawn on this global and turn hostile
Enemy()~ EXIT
END


IF ~Global("J#TalkedPirate","GLOBAL",1)~ furtherchat
  SAY @26
  ++ @27 + sirinewarn
  ++ @28 + piracy
  + ~Global("J#TalkedSil","GLOBAL",1)~ + @29 + siltalk
  ++ @30 EXIT
END

IF ~~ sirinewarn
  SAY @31
=
@32
  ++ @28 + piracy
  + ~Global("J#TalkedSil","GLOBAL",1)~ + @29 + siltalk
  ++ @33 EXIT
END

IF ~~ piracy
  SAY @34
=
@35
  ++ @27 + sirinewarn
  + ~Global("J#TalkedSil","GLOBAL",1)~ + @29 + siltalk
  ++ @33 EXIT
END

IF ~~ siltalk
  SAY @36
=
@37
  + ~CheckStatGT(LastTalkedToBy(Myself),13,CHR)~ + @38 + confess
  + ~CheckStatLT(LastTalkedToBy(Myself),14,CHR)~ + @38 + noconfess
  + ~CheckStatGT(LastTalkedToBy(Myself),12,INT)~ + @39 + confess
  + ~CheckStatLT(LastTalkedToBy(Myself),13,INT)~ + @39 + noconfess
  ++ @40 + fight
  ++ @41 + nofight
  ++ @42 + confess
END

IF ~~ fight
  SAY @43
=
@44
  IF ~~ THEN DO ~SetGlobal("J#PirateFight","GLOBAL",1) // Hostile men spawn
Enemy()~ EXIT
END

IF ~~ nofight
  SAY @45
=
@46
  IF ~~ THEN DO ~SetGlobal("J#TalkedPirate","GLOBAL",2) // If talked to again, will attack~ EXIT
END

IF ~~ noconfess
  SAY @47
=
@46
  IF ~~ THEN DO ~SetGlobal("J#TalkedPirate","GLOBAL",2) // If talked to again, will attack~ EXIT
END

IF ~~ confess
  SAY @48
=
@49
=
@50
++ @51 GOTO fight
++ @52 GOTO bribeyou
END

IF ~~ bribeyou
  SAY @53
=
@54
  ++ @55 + dealstruck
  ++ @56 + fight
END

IF ~Global("J#TalkedPirate","GLOBAL",2)~ killjoo
  SAY @57
=
@44
  IF ~~ THEN DO ~SetGlobal("J#PirateFight","GLOBAL",1) // His men spawn on this global and turn hostile
Enemy()~ EXIT
END

IF ~~ dealstruck
  SAY @58
  IF ~!Dead("sil")~ THEN DO ~GivePartyGold(1000)
SetGlobal("J#SilMurder","GLOBAL",1) // Sil has had the hit taken out on her
EscapeArea()~ EXIT
  IF ~Dead("sil")~ THEN DO ~GivePartyGold(1000)
SetGlobal("J#SilMurder","GLOBAL",2) // Sil is already dead
EscapeArea()~ EXIT
END

IF WEIGHT #-2 ~Global("J#SilMurder","GLOBAL",3)~ betrayed
  SAY @59
=
@60
=
@61
=
@62
  IF ~~ THEN DO ~SetGlobal("J#SilMurder","GLOBAL",4) // His men turn hostile on this global
Enemy()~ EXIT
END
END
