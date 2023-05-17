* Encoding: UTF-8.
 * Encoding: .
  
DATASET ACTIVATE DataSet1.
FILTER OFF.

USE ALL.
SELECT IF (n_participation = 9).
EXECUTE.

RECODE kpx_2280 (1, 2=COPY) into Frau.
RECODE ostwest (0,1=COPY) into westdeutsch.
*COMPUTE alter=(2017-kpx_2290).
*RECODE alter (18 thru 29=1)(ELSE=2) INTO kohorten.
RECODE kp1_2320 (1,2=1)(3=2)(4=3)(5,9=4) INTO schule.
COMPUTE schule2=schule.
IF (kp1_2330 eq 10) schule2=5.
COMPUTE schule3=schule2.
RECODE schule (1,2=0)(3,4=1) INTO Hochschulreife.
IF (schule2 eq 2) and (kp1_2330 ge 6 and kp1_2330 le 9) schule3=3.
RECODE kp1_2591 (1 thru 13, -99=COPY) INTO einkom.
RECODE kp1_2580 (1 thru 6, -99=COPY) INTO schicht.
RECODE kp1_2090a (1, 4, 5, 6, 7, 322, 801=1)(808=0)(ELSE=COPY) INTO mitPI.
RECODE kp5_2090a (1, 4, 5, 6, 7, 322, 801=1)(808=0)(ELSE=COPY) INTO mitPI5.
RECODE kp7_2090a (1, 4, 5, 6, 7, 322, 801=1)(808=0)(ELSE=COPY) INTO mitPI7.
RECODE kp5_050l (1 thru 5, -99=COPY) INTO wahlnorm.
RECODE kp5_050l (5=1) (2 thru 4=0)(ELSE=COPY) INTO diwahlnorm.

DO REPEAT var1= kp1_2100   kp5_2100 kp6_2100 kp7_2100/
                    var2=PIstärke1  PIstärke5 PIstärke6 PIstärke7.
                   RECODE var1 (1=4)(2=3)(3,4,5=2)(-97=1)(ELSE=COPY) INTO var2.
END REPEAT. 

DO REPEAT var1= kp1_2101   kp5_2101 kp6_2101 kp7_2101/
                    var2=PIstark1  PIstark5 PIstark6 PIstark7.
                   RECODE var1 (1,2=1)(ELSE=0) INTO var2.
END REPEAT. 

* politisches Wissen

RECODE kp6_3430q (322=1)(ELSE=0) INTO wissen1.
RECODE kp6_3430c (3=1)(ELSE=0) INTO wissen2.
RECODE kp6_3430l (6=1)(ELSE=0) INTO wissen3.
RECODE kp7_3430j (4=1)(ELSE=0) INTO wissen4.
RECODE kp7_3430s (6=1)(ELSE=0) INTO wissen5.
RECODE kp7_3430t (2=1)(ELSE=0) INTO wissen6.
RECODE kp7_3430u (7=1)(ELSE=0) INTO wissen7.
RECODE kp7_3430v (322=1)(ELSE=0) INTO wissen8.
RECODE kp6_090 (5=1)(ELSE=0) INTO wissen11.
RECODE kp6_110 (2=1)(ELSE=0) INTO wissen12.
RECODE kp6_130 (3=1)(ELSE=0) INTO wissen13.
COMPUTE wissindex2=wissen2+wissen7+wissen11+wissen12+wissen13.



COMPUTE keinekontakte5=0.
IF (kp5_421z ne 1 and kp5_421z ne 1)keinekontakte5=1.
COMPUTE keinekontakte6=0.
IF (kp6_421z ne 1 and kp6_421z ne 1)keinekontakte6=1.
COMPUTE keinekontakte7=0.
IF (kp7_421z ne 1 and kp7_421z ne 1)keinekontakte7=1.


*Kampagnenkontakte

COUNT KampaUnion5=kp5_421ka kp5_421ga kp5_421aa kp5_421da kp5_421ea kp5_421ha kp5_421ba kp5_421la kp5_421ia (1).
COUNT KampaUnion6=kp6_421ka kp6_421ga kp6_421aa kp6_421da kp6_421ea kp6_421ha kp6_421ba kp6_421la kp6_421ia (1).
COUNT KampaUnion7=kp7_421ka kp7_421ga kp7_421aa kp7_421da kp7_421ea kp7_421ha kp7_421ba kp7_421la kp7_421ia (1).
COUNT KampaSPD5=kp5_421kc kp5_421gc kp5_421ac kp5_421dc kp5_421ec kp5_421hc kp5_421bc kp5_421lc kp5_421ic (1).
COUNT KampaSPD6=kp6_421kc kp6_421gc kp6_421ac kp6_421dc kp6_421ec kp6_421hc kp6_421bc kp6_421lc kp6_421ic (1).
COUNT KampaSPD7=kp7_421kc kp7_421gc kp7_421ac kp7_421dc kp7_421ec kp7_421hc kp7_421bc kp7_421lc kp7_421ic (1).
COUNT KampaLinke5=kp5_421kf kp5_421gf kp5_421af kp5_421df kp5_421ef kp5_421hf  kp5_421bf kp5_421lf  kp5_421if (1).
COUNT KampaLinke6=kp6_421kf kp6_421gf  kp6_421af kp6_421df kp6_421ef kp6_421hf  kp6_421bf kp6_421lf kp6_421if (1).
COUNT KampaLinke7=kp7_421kf kp7_421gf  kp7_421af kp7_421df kp7_421ef kp7_421hf  kp7_421bf  kp7_421lf kp7_421if (1).
COUNT KampaGrün5=kp5_421ke kp5_421ge kp5_421ae kp5_421de kp5_421ee kp5_421he kp5_421be kp5_421le kp5_421ie (1).
COUNT KampaGrün6=kp6_421ke kp6_421ge kp6_421ae kp6_421de kp6_421ee kp6_421he kp6_421be kp6_421le kp6_421ie (1).
COUNT KampaGrün7=kp7_421ke kp7_421ge kp7_421ae kp7_421de kp7_421ee kp7_421he kp7_421be kp7_421le kp7_421ie (1).
COUNT KampaFDP5=kp5_421kd kp5_421gd kp5_421ad kp5_421dd kp5_421ed kp5_421hd  kp5_421bd kp5_421ld kp5_421id (1).
COUNT KampaFDP6=kp6_421kd kp6_421gd kp6_421ad kp6_421dd kp6_421ed kp6_421hd  kp6_421bd kp6_421ld kp6_421id (1).
COUNT KampaFDP7=kp7_421kd kp7_421gd  kp7_421ad kp7_421dd kp7_421ed kp7_421hd  kp7_421bd kp7_421ld kp7_421id (1).
COUNT KampaAfD5=kp5_421ki kp5_421gi kp5_421ai kp5_421di kp5_421ei kp5_421hi kp5_421bi kp5_421li kp5_421ii (1).
COUNT KampaAfD6=kp6_421ki kp6_421gi kp6_421ai kp6_421di kp6_421ei kp6_421hi kp6_421bi kp6_421li kp6_421ii (1).
COUNT KampaAfD7=kp7_421ki kp7_421gi kp7_421ai kp7_421di kp7_421ei kp7_421hi kp7_421bi kp7_421li kp7_421ii (1).
COUNT KampaFDP5=kp5_421kd kp5_421gd kp5_421ad kp5_421dd kp5_421ed kp5_421hd  kp5_421bd kp5_421ld kp5_421id (1).
COUNT KampaFDP6=kp6_421kd kp6_421gd kp6_421ad kp6_421dd kp6_421ed kp6_421hd  kp6_421bd kp6_421ld kp6_421id (1).
COUNT KampaFDP7=kp7_421kd kp7_421gd  kp7_421ad kp7_421dd kp7_421ed kp7_421hd  kp7_421bd kp7_421ld kp7_421id (1).


*Wahlwerbung der Parteien

COUNT WerbUnion5=kp5_421ga  kp5_421da kp5_421ea  kp5_421ba  (1).
COUNT WerbUnion6=kp6_421ga  kp6_421da kp6_421ea  kp6_421ba  (1).
COUNT WerbUnion7=kp7_421ga  kp7_421da kp7_421ea  kp7_421ba  (1).
COUNT WerbSPD5=kp5_421gc  kp5_421dc kp5_421ec  kp5_421bc  (1).
COUNT WerbSPD6=kp6_421gc kp6_421dc kp6_421ec kp6_421bc  (1).
COUNT WerbSPD7=kp7_421gc kp7_421dc kp7_421ec kp7_421bc  (1).
COUNT WerbLinke5=kp5_421gf kp5_421df kp5_421ef kp5_421bf (1).
COUNT WerbLinke6=kp6_421gf kp6_421df kp6_421ef kp6_421bf (1).
COUNT WerbLinke7=kp7_421gf kp7_421df kp7_421ef kp7_421bf  (1).
COUNT WerbGrün5=kp5_421ge kp5_421de kp5_421ee kp5_421be (1).
COUNT WerbGrün6=kp6_421ge kp6_421de kp6_421ee kp6_421be (1).
COUNT WerbGrün7=kp7_421ge kp7_421de kp7_421ee kp7_421be  (1).
COUNT WerbFDP5=kp5_421gd kp5_421dd kp5_421ed kp5_421bd (1).
COUNT WerbFDP6=kp6_421gd kp6_421dd kp6_421ed kp6_421bd (1).
COUNT WerbFDP7=kp7_421gd kp7_421dd kp7_421ed kp7_421bd  (1).
COUNT WerbAfD5=kp5_421gi kp5_421di kp5_421ei kp5_421bi  (1).
COUNT WerbAfD6=kp6_421gi kp6_421di kp6_421ei kp6_421bi (1).
COUNT WerbAfD7=kp7_421gi kp7_421di kp7_421ei kp7_421bi (1).

*aktive Kampagnenkontakte

COUNT aktKaUnion5=kp5_421ka kp5_421aa  kp5_421ha kp5_421la kp5_421ia (1).
COUNT aktKaUnion6=kp6_421ka  kp6_421aa kp6_421ha kp6_421la kp6_421ia (1).
COUNT aktKaUnion7=kp7_421ka  kp7_421aa  kp7_421ha kp7_421la kp7_421ia (1).
COUNT aktKaSPD5=kp5_421kc  kp5_421ac  kp5_421hc kp5_421lc kp5_421ic (1).
COUNT aktKaSPD6=kp6_421kc  kp6_421ac  kp6_421hc kp6_421lc kp6_421ic (1).
COUNT aktKaSPD7=kp7_421kc  kp7_421ac kp7_421hc kp7_421lc kp7_421ic (1).
COUNT aktKaLinke5=kp5_421kf kp5_421af  kp5_421hf  kp5_421lf kp5_421if (1).
COUNT aktKaLinke6=kp6_421kf  kp6_421af kp6_421hf  kp6_421lf kp6_421if (1).
COUNT aktKaLinke7=kp7_421kf  kp7_421af kp7_421hf  kp7_421lf  kp7_421if (1).
COUNT aktKaGrün5=kp5_421ke  kp5_421ae  kp5_421he kp5_421le kp5_421ie (1).
COUNT aktKaGrün6=kp6_421ke  kp6_421ae kp6_421he kp6_421le kp6_421ie (1).
COUNT aktKaGrün7=kp7_421ke  kp7_421ae  kp7_421he kp7_421le kp7_421ie (1).
COUNT aktKaFDP5=kp5_421kd  kp5_421ad  kp5_421hd  kp5_421ld kp5_421id (1).
COUNT aktKaFDP6=kp6_421kd  kp6_421ad  kp6_421hd  kp6_421ld kp6_421id (1).
COUNT aktKaFDP7=kp7_421kd  kp7_421ad  kp7_421hd  kp7_421ld kp7_421id (1).
COUNT aktKaAfD5=kp5_421ki  kp5_421ai  kp5_421hi kp5_421li kp5_421ii (1).
COUNT aktKaAfD6=kp6_421ki  kp6_421ai  kp6_421hi kp6_421li kp6_421ii (1).
COUNT aktKaAfD7=kp7_421ki  kp7_421ai  kp7_421hi kp7_421li kp7_421ii (1).

***Welle5

COMPUTE Npartweb5=SUM(kp5_421ka to kp5_421ki).
COMPUTE Nplakate5=SUM(kp5_421ga to kp5_421gi).
COMPUTE Nkundgeb5=SUM(kp5_421aa to kp5_421ai).
COMPUTE Ntvspot5=SUM(kp5_421da to kp5_421di).
COMPUTE Nradiospot5=SUM(kp5_421ea to kp5_421ei).
COMPUTE Nwahlstand5=SUM(kp5_421ha to kp5_421hi).
COMPUTE Ninfos5=SUM(kp5_421ba to kp5_421bi).
COMPUTE Nspende5=SUM(kp5_421la to kp5_421li).
COMPUTE Nnetzwerk5=SUM(kp5_421ia to kp5_421ii).
DO REPEAT Var1=Npartweb5 to Nnetzwerk5/
  Var2=partweb5 plakate5 kundgeb5 tvspot5 radiospot5 wahlstand5 infos5 spende5 netzwerk5.
  RECODE Var1 (1 through 6=1)(ELSE=COPY) INTO Var2.
END REPEAT.
***Welle6

COMPUTE Npartweb6=SUM(kp6_421ka to kp6_421ki).
COMPUTE Nplakate6=SUM(kp6_421ga to kp6_421gi).
COMPUTE Nkundgeb6=SUM(kp6_421aa to kp6_421ai).
COMPUTE Ntvspot6=SUM(kp6_421da to kp6_421di).
COMPUTE Nradiospot6=SUM(kp6_421ea to kp6_421ei).
COMPUTE Nwahlstand6=SUM(kp6_421ha to kp6_421hi).
COMPUTE Ninfos6=SUM(kp6_421ba to kp6_421bi).
COMPUTE Nspende6=SUM(kp6_421la to kp6_421li).
COMPUTE Nnetzwerk6=SUM(kp6_421ia to kp6_421ii).
DO REPEAT Var1=Npartweb6 to Nnetzwerk6/
  Var2=partweb6 plakate6 kundgeb6 tvspot6 radiospot6 wahlstand6 infos6 spende6 netzwerk6.
  RECODE Var1 (1 through 6=1)(ELSE=COPY) INTO Var2.
END REPEAT.

***Welle7

COMPUTE Npartweb7=SUM(kp7_421ka to kp7_421ki).
COMPUTE Nplakate7=SUM(kp7_421ga to kp7_421gi).
COMPUTE Nkundgeb7=SUM(kp7_421aa to kp7_421ai).
COMPUTE Ntvspot7=SUM(kp7_421da to kp7_421di).
COMPUTE Nradiospot7=SUM(kp7_421ea to kp7_421ei).
COMPUTE Nwahlstand7=SUM(kp7_421ha to kp7_421hi).
COMPUTE Ninfos7=SUM(kp7_421ba to kp7_421bi).
COMPUTE Nspende7=SUM(kp7_421la to kp7_421li).
COMPUTE Nnetzwerk7=SUM(kp7_421ia to kp7_421ii).
DO REPEAT Var1=Npartweb7 to Nnetzwerk7/
  Var2=partweb7 plakate7 kundgeb7 tvspot7 radiospot7 wahlstand7 infos7 spende7 netzwerk7.
  RECODE Var1 (1 through 6=1)(ELSE=COPY) INTO Var2.
END REPEAT.

*Skalen Kampagne

COUNT werbung5=tvspot5 plakate5 radiospot5 infos5 (1).
COUNT werbung6=tvspot6 plakate6 radiospot6 infos6 (1).
COUNT werbung7=tvspot7 plakate7 radiospot7 infos7 (1).
COUNT kampagne5=partweb5 kundgeb5 wahlstand5 spende5 netzwerk5 (1).
COUNT kampagne6=partweb6 kundgeb6 wahlstand6 spende6 netzwerk6 (1).
COUNT kampagne7=partweb7 kundgeb7 wahlstand7 spende7 netzwerk7 (1).
COUNT kontakte5=partweb5 plakate5 kundgeb5 tvspot5 radiospot5 wahlstand5 infos5 spende5 netzwerk5 (1).
COUNT kontakte6=partweb6 plakate6 kundgeb6 tvspot6 radiospot6 wahlstand6 infos6 spende6 netzwerk6 (1).
COUNT kontakte7=partweb7 plakate7 kundgeb7 tvspot7 radiospot7 wahlstand7 infos7 spende7 netzwerk7 (1).

COMPUTE Nwerbung5=SUM(Ntvspot5, Nplakate5, Nradiospot5, Ninfos5).
COMPUTE Nwerbung6=SUM(Ntvspot6, Nplakate6, Nradiospot6, Ninfos6).
COMPUTE Nwerbung7=SUM(Ntvspot7, Nplakate7, Nradiospot7, Ninfos7).

COMPUTE Neuwerbung5=SUM(Ntvspot5, Nplakate5).
COMPUTE Neuwerbung6=SUM(Ntvspot6, Nplakate6).
COMPUTE Neuwerbung7=SUM(Ntvspot7, Nplakate7).

COMPUTE Nkampagne5=SUM(Npartweb5, Nkundgeb5, Nwahlstand5, Nspende5, Nnetzwerk5 ).
COMPUTE Nkampagne6=SUM(Npartweb6, Nkundgeb6, Nwahlstand6, Nspende6, Nnetzwerk6 ).
COMPUTE Nkampagne7=SUM(Npartweb7, Nkundgeb7, Nwahlstand7, Nspende7, Nnetzwerk7 ).

COMPUTE Neukampa5=SUM(Nkundgeb5, Nwahlstand5)/2.
COMPUTE Neukampa6=SUM(Nkundgeb6, Nwahlstand6)/2.
COMPUTE Neukampa7=SUM(Nkundgeb7, Nwahlstand7)/2.

COMPUTE Neuweb5=SUM(Npartweb5, Nnetzwerk5)/2.
COMPUTE Neuweb6=SUM(Npartweb6, Nnetzwerk6)/2.
COMPUTE Neuweb7=SUM(Npartweb7, Nnetzwerk7)/2.

COMPUTE Nkontakte5=SUM(Npartweb5 to Nnetzwerk5)/2.
COMPUTE Nkontakte6=SUM(Npartweb6 to Nnetzwerk6)/2.
COMPUTE Nkontakte7=SUM(Npartweb7 to Nnetzwerk7)/2.



*Medien

DO REPEAT Variable= kp5_1600 kp6_1600 kp7_1600
       kp5_1681a kp6_1681a kp7_1681a
       kp5_1681b kp6_1681b kp7_1681b
       kp5_1681c kp6_1681c kp7_1681c
       kp5_1681d kp6_1681d kp7_1681d
       kp5_1681e kp6_1681e kp7_1681e
       kp5_1661a kp6_1661a kp7_1661a/
      Medium= internet5 internet6 internet7
                    ard5 ard6 ard7 zdf5 zdf6 zdf7
                    rtl5 rtl6 rtl7 sat15 sat16 sat17 
                    sonstTV5 sonstTV6 sonstTV7
                    bild5 bild6 bild7.
     COMPUTE medium= (MAX(variable)-1).
END REPEAT.

DO REPEAT var1=ard5 ard6 ard7
                           df5 zdf6 zdf7
                           rtl5 rtl6 rtl7
                           sat15 sat16 sat17/
                    var2= ardviel5 ardviel6 ardviel7
                             zdfviel5 zdfviel6 zdfviel7
                             rtlviel5 rtlviel6 rtlviel7
                             sat1viel5 sat1viel6 sat1viel7.                          
                   COMPUTE var2=0.
                   IF (var1 ge 5)var2=1.
END REPEAT.

COMPUTE TV5viel=ardviel5 +zdfviel5+rtlviel5+sat1viel5.
COMPUTE TV6viel=ardviel6 +zdfviel6+rtlviel6+sat1viel6.
COMPUTE TV7viel=ardviel7 +zdfviel7+rtlviel7+sat1viel7.

COMPUTE örtv5=(ard5+zdf5)/2.
COMPUTE örtv6=(ard6+zdf6)/2.
COMPUTE örtv7=(ard7+zdf7)/2.

COMPUTE Mörtv5=MAX(ard5, zdf5).
COMPUTE Mörtv6=MAX(ard6, zdf6).
COMPUTE Mörtv7=MAX(ard7, zdf7).

COMPUTE privtv5=(rtl5+sat15)/2.
COMPUTE privtv6=(rtl6+sat16)/2.
COMPUTE privtv7=(rtl7+sat17)/2.

COMPUTE Mprivtv5=MAX(rtl5, sat15).
COMPUTE Mprivtv6=MAX(rtl6, sat16).
COMPUTE Mprivtv7=MAX(rtl7, sat17).

DO REPEAT var1= kp5_1661b kp6_1661b  kp7_1661b
                    kp5_1661c kp6_1661c  kp7_1661c
                    kp5_1661d kp6_1661d  kp7_1661d
                    kp5_1661e kp6_1661e  kp7_1661e
                    kp5_1661f kp6_1661f  kp7_1661f
                    kp5_1661g kp6_1661g  kp7_1661g/
                    var2= FR5 FR6 FR7
                    FAZ5 FAZ6 FAZ7
                    SZ5 SZ6 SZ7
                    taz5 taz6 taz7
                    welt5 welt6 welt7
                    ztg5 ztg6 ztg7.
                    COMPUTE var2= (MAX(var1)-1).
END REPEAT.

COMPUTE print5=MAX(FR5, FAZ5, SZ5, taz5, welt5, ztg5).
COMPUTE print6=MAX(FR6, FAZ6, SZ6, taz6, welt6, ztg6).
COMPUTE print7=MAX(FR7, FAZ7, SZ7, taz7, welt7, ztg7).

DO REPEAT var1= kp4_1610 kp5_1610  kp7_1610/
                   var2=kp4_1615y kp5_1615y kp7_1615y.
                    IF (var2 NE 1) var1=1.
                    END REPEAT.

DO REPEAT var1= kp4_1610 kp5_1610  kp7_1610/
                    var2= socmedia4 socmedia5 socmedia7.
                    COMPUTE var2= (MAX(var1)-1).
                   END REPEAT.

DO REPEAT var1= kp5_1933 kp6_1933 kp7_1933/
                    var2= gespräche5 gespräche6 gespräche7.
                    COMPUTE var2= (MAX(var1)-1).            
END REPEAT.


RECODE kp6_1800 (1,2=1)(3=0)(ELSE=copy) into Duell.
RECODE kp6_1800 (1=1)(2,3=0)(ELSE=copy) into Duellganz.

COMPUTE Wahlomat=0.
IF (kp6_3490 eq 1 or kp7_3490 eq 1) Wahlomat=1.

DO REPEAT var1= kp5_010 kp6_010 kp7_010/
                    var2= polint5 polint6 polint7.
                    RECODE var1 (1=4)(2=3)(3=2)(4=1)(5=0) into var2.
END REPEAT.

RECODE polint5 (0,1=0)(2,3,4=1) into hochpolint5.

DO REPEAT var1= kp5_390 kp6_390 kp7_390 
                            kp5_380 kp6_380 kp7_380 /
                   var2= wahlint5 wahlint6 wahlint7
                           ausgang5 ausgang6 ausgang7.
                   RECODE var1 (1=4)(2=3)(3=2)(4=1)(5=0) into var2.
END REPEAT.

*Mobilisierung

RECODE kp5_170 (1=4)(2=3)(3=2)(4=1)(5=0)(6=-97)(else=COPY) INTO absicht51.
RECODE kp6_170 (1=4)(2=3)(3=2)(4=1)(5=0)(6=-97)(else=COPY) INTO absicht61.
RECODE kp7_170 (1=4)(2=3)(3=2)(4=1)(5=0)(6=-97)(else=COPY) INTO absicht71.

RECODE kp4_170 (1,6,-97=4)(2=3)(3=2)(4=1)(5=0)(else=COPY) INTO absicht4.
RECODE kp5_170 (1,6,-97=4)(2=3)(3=2)(4=1)(5=0)(else=COPY) INTO absicht5.
RECODE kp6_170 (1,6,-97=4)(2=3)(3=2)(4=1)(5=0)(else=COPY) INTO absicht6.
RECODE kp7_170 (1,6,-97=4)(2=3)(3=2)(4=1)(5=0)(else=COPY) INTO absicht7.

RECODE kp5_170 (6,-97=6)(1=5)(2=4)(3=3)(4=2)(5=1)(else=COPY) INTO wahl5.
RECODE kp6_170 (6,-97=6)(1=5)(2=4)(3=3)(4=2)(5=1)(else=COPY) INTO wahl6.
RECODE kp7_170 (6,-97=6)(1=5)(2=4)(3=3)(4=2)(5=1)(else=COPY) INTO wahl7.

RECODE kp5_170 (6,-97=9)(1,2,3,4,5=0)(else=COPY) INTO brief5.
RECODE kp6_170 (6,-97=9)(1,2,3,4,5=0)(else=COPY) INTO brief6.
RECODE kp7_170 (6,-97=9)(1,2,3,4,5=0)(else=COPY) INTO brief7.

COMPUTE mobilisiert=absicht7-absicht5.

RECODE kp5_190aa (1 thru 801, -97=1)(-98, -99 =0) into erststim5.
RECODE kp5_190ba (1 thru 801, -97=1)(-98, -99 =0) into zweitstim5.
COMPUTE Parteistim5=0.
IF (erststim5 eq 1) or (zweitstim5 eq 1) Parteistim5=1.
RECODE kp7_190aa (1 thru 801, -97=1)(-98, -99 =0) into erststim7.
RECODE kp7_190ba (1 thru 801, -97=1)(-98, -99 =0) into zweitstim7.
COMPUTE Parteistim7=0.
IF (erststim7 eq 1) or (zweitstim7 eq 1) Parteistim7=1.

COMPUTE aktiviert=1-(Parteistim7 - Parteistim5).

COMPUTE bestärkt=PIstärke7 - PIstärke5.

RECODE kp8_180 (1, 6, -97=1)(2=0)(ELSE=COPY) INTO gewählt.

COMPUTE mobil_ab5=0.
COMPUTE mobil_ab6=0.
IF (kp5_170 GE 2) AND (kp5_170 LT 6) AND (gewählt EQ 1)mobil_ab5=1.
IF (kp6_170 GE 2) AND (kp6_170 LT 6) AND (gewählt EQ 1)mobil_ab6=1.

RECODE kp5_170 (1,6,-97=1)(2,3,4,5=0)(else=COPY) INTO starkabsicht5.
RECODE kp6_170 (1,6,-97=1)(2,3,4,5=0)(else=COPY) INTO starkabsicht6.
RECODE kp7_170 (1,6,-97=1)(2,3,4,5=0)(else=COPY) INTO starkabsicht7.

COMPUTE invol5=(absicht5+wahlint5+ausgang5)/3.
COMPUTE invol6=(absicht6+wahlint6+ausgang6)/3.
COMPUTE invol7=(absicht7+wahlint7+ausgang7)/3.
 
COMPUTE involneu5=(polint5+wahlint5+ausgang5)/3.
COMPUTE involneu6=(polint6+wahlint6+ausgang6)/3.
COMPUTE involneu7=(polint7+wahlint7+ausgang7)/3.

*Parteisympathie

RECODE kp5_430a (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_CDU.
RECODE kp5_430b (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_CSU.
RECODE kp5_430c (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_SPD.
RECODE kp5_430d (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_FDP.
RECODE kp5_430e (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_Grüne.
RECODE kp5_430f (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_Linke.
RECODE kp5_430i (1 thru 7=0)(8 thru 11=1)(else=COPY) INTO symp_AfD.
COMPUTE symp_Union=0.
IF (symp_CDU eq 1) or (symp_CSU EQ 1) symp_Union=1.

**********************************************************************************************************************************
    Fluktuationen der Wahlabsicht
    
IF (absicht6 GT absicht5) flukt56=1.
IF (absicht6 LT absicht5) flukt56=-1.
IF (absicht6 EQ absicht5) flukt56=0.
IF (absicht7 GT absicht6) flukt67=1.
IF (absicht7 LT absicht6) flukt67=-1.
IF (absicht6 EQ absicht7) flukt67=0.

***********************************************************************************************************************************

FORMATS Frau westdeutsch PIstärke1 PIstärke5 PIstärke6 PIstärke7
                mitPI  FR4 to ztg7 print5 to print7 
                ardviel5 to sat1viel7  aktiviert mobilisiert (F1.0).

VARIABLE LABELS Frau 'Geschlecht'/alter 'Alter'/schule 'Schulabschluss'/
                         mitPI 'mit Parteiidentifikation'/einkom 'Netto-Einkommen HH'/schicht 'Schichtzugehörigkeit subjektiv'/
                         absicht5 absicht6 absicht7 'Wahlabsicht'/absicht51 absicht61 absicht71 'Wahlabsicht ohne Briefwahl'/
                         brief5 brief6 brief7 Briefwähler/
                         aktiviert 'Welle 5 und 7 für Partei entschieden'/
                         mobilisiert 'Differenz zwischen Wahlabsicht Welle7-Welle5 ohne Briefwahl'/
                         kampagne5 kampagne6 kampagne7 'Skala Kampagnenbeachtung pull'/
                         kontakte5 kontakte6 kontakte7 'Skala Wahlkommunikation insgesamt'/.
VALUE LABELS Frau 1 'Mann' 2 'Frau' /westdeutsch 0 'ostdeutsch' 1 'westdeutsch'/
                         kohorten 1 'unter 30' 2 'über 30'/
                         Parteistim5  1 'für Partei entschieden Welle5' 2 'noch nicht entschieden'/
                         Parteistim7  1 'für Partei entschieden Welle7' 2 'noch nicht entschieden'.
                         

MISSING VALUES  internet5 internet6 internet7 diwahlnorm
               mitPI mitPI5 mitPI7 PIstärke1  PIstärke5 PIstärke6 PIstärke7 Duell Duellganz gewählt starkabsicht5 starkabsicht6 starkabsicht7 (-99)
               ard5 ard6 ard7 zdf5 zdf6 zdf7
               rtl5 rtl6 rtl7 sat15 sat16 sat17 
               sonstTV5 sonstTV6 sonstTV7
               örtv5 örtv6 örtv7
               privtv5 privtv6 privtv7
               bild5 bild6 bild7 
               partei5
               gespräche5 gespräche6 gespräche7 (-92, -99)
               einkom schicht wahlnorm
               wahlint5 wahlint6 wahlint7
               ausgang5 ausgang6 ausgang7
               absicht5 absicht6 absicht7
                absicht51 absicht61 absicht71
               wahl5 wahl6 wahl7 mitPI mitPI5 (-97, -99)
               symp_CDU to symp_AfD (-71, -99).

**************************************************************
                      
   
*Fälle mit Missings ausschliessen

DO REPEAT Var=absicht5 to absicht7
                   Nplakate5 Nplakate6 Nplakate7
                   Npartweb5 Npartweb6 Npartweb7
                   Ntvspot5 Ntvspot6 Ntvspot7
                   print5 to print7
                   internet5 to internet7
                   Mörtv5 to Mörtv7
                   Mprivtv5 to Mprivtv7.
    SELECT IF  (Var GE 0).
    END REPEAT.

************************************************************

DO REPEAT Var=brief5 to brief7.               
    SELECT IF (Var NE 9).
    END REPEAT.

DO REPEAT Var=internet5 to internet7
                     absicht5 to absicht7.
    SELECT IF (Var GE 0).
    END REPEAT.

DO REPEAT Var=gespräche5 to gespräche7
                    absicht5 to absicht7.
     SELECT IF (Var GE 0).
    END REPEAT.

DO REPEAT Var=socmedia4 socmedia5 socmedia7
                    absicht4 absicht5 absicht7.
     SELECT IF (Var GE 0).
    END REPEAT.

***********************************************************************************************************************
*Sozial- und regionalstrukturelles Gewicht (Anpassung MZ2016) Teilnahme an allen Wellen  wei4_mz 

WEIGHT BY wei4_mz.

********************************************************************


FREQUENCIES VARIABLES= brief5 to brief7
    /STATISTICS KURTOSIS SKEWNESS
    /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=brief5 to brief7 
  /STATISTICS=MEAN STDDEV MIN MAX.

CROSSTABS 
  /TABLES= Frau westdeutsch kohorten Hochschulreife einkom wissindex2 PIstark7 wahlnorm BY brief7
  /FORMAT=AVALUE TABLES
   /CELLS= COLUMN
  /COUNT CASE
   /MISSING TABLE
   /STATISTICS  PHI.

CROSSTABS 
  /TABLES= flukt67 BY  mitPI5
  /FORMAT=AVALUE TABLES
   /CELLS=  COLUMN
  /COUNT CASE
   /MISSING TABLE.

  /STATISTICS CHISQ PHI.

MEANS TABLES=absicht5 to absicht7 BY mitPI5
  /CELLS=MEAN COUNT STDDEV.

FACTOR
  /VARIABLES   mitPI5 diwahlnorm hochpolint5 kp5_050h kp5_050k absicht5
  /MISSING LISTWISE 
  /ANALYSIS    mitPI5 diwahlnorm hochpolint5 kp5_050h kp5_050k absicht5
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES  Ntvspot7, Nplakate7, Nradiospot7, Ninfos7 Npartweb7 Nkundgeb7  Nwahlstand7 Nspende7 Nnetzwerk7
  /MISSING LISTWISE 
  /ANALYSIS  Ntvspot7, Nplakate7, Nradiospot7, Ninfos7 Npartweb7 Nkundgeb7  Nwahlstand7 Nspende7 Nnetzwerk7
  /PRINT INITIAL EXTRACTION ROTATION
   /EXTRACTION PC
  /CRITERIA FACTORS(3) ITERATE(25)
  /ROTATION  VARIMAX
  /METHOD=CORRELATION.

RELIABILITY
  /VARIABLES=  kp5_050h kp5_050k wissen2 mitPI5 involneu5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

*************************************************************************************************************

PLUM absicht7   BY  kampagne7 werbung7 gespräche7 WITH Frau alter westdeutsch Hochschulreife einkom wissindex2 PIstark7 wahlnorm  
  /CRITERIA=CIN(95) DELTA(0) LCONVERGE(0) MXITER(100) MXSTEP(5) PCONVERGE(1.0E-6) SINGULAR(1.0E-8)
  /LINK=LOGIT
  /LOCATION=Frau alter westdeutsch Hochschulreife einkom wissindex2 PIstark7 wahlnorm  
  /PRINT=FIT PARAMETER SUMMARY.

***************************************************************************************************
 
 REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE 
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT absicht7
   /METHOD=ENTER  werbung7 kampagne7  gespräche7
  /METHOD=ENTER Frau alter westdeutsch Hochschulreife einkom wissindex2 PIstärke7  wahlnorm.


  /METHOD=ENTER   print7   bild7  Mörtv7 Mprivtv7  internet7  socmedia7  gespräche7 . 

***************************************************************************************************
 
LOGISTIC REGRESSION VARIABLES starkabsicht7
   /METHOD=ENTER  werbung7 kampagne7
    /METHOD=ENTER  print7   bild7  Mörtv7   Mprivtv7  internet7  socmedia7  gespräche7
   /METHOD=ENTER  Frau alter westdeutsch Hochschulreife einkom wissindex2 PIstark7 wahlnorm.

   /METHOD=ENTER Ntvspot7, Nplakate7, Nradiospot7, Ninfos7 kampagne7  

    
 
LOGISTIC REGRESSION VARIABLES aktiviert
    /METHOD=ENTER Frau alter westdeutsch schule einkom wissindex PIstärke7
   /METHOD=ENTER   wahlint7
   /METHOD=ENTER WerbUnion7 WerbSPD7 WerbGrün7 WerbAfD7  
    /METHOD=ENTER   KampaUnion7 KampaSPD7 KampaGrün7 KampaAfD7
  /METHOD=ENTER   print7 bild7  örtv7  privtv7 internet7   socmedia7  gespräche7
   /METHOD=ENTER duell wahlomat.

  
CORRELATIONS
  /VARIABLES=partweb7 plakate7 kundgeb7 tvspot7 radiospot7 wahlstand7 infos7 spende7 netzwerk7 WITH starkabsicht7
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


MEANS TABLES=KampaAfD7 BY symp_afd7
  /CELLS=MEAN COUNT STDDEV.


* Verallgemeinerte lineare Modelle.

GENLIN absicht7 (ORDER=ASCENDING) WITH Frau alter westdeutsch Hochschulreife einkom wissindex2 mitPI7 wahlnorm gespräche7 werbung7 kampagne7  internet7 
  /MODEL Frau alter westdeutsch Hochschulreife einkom wissindex2 mitPI7 wahlnorm gespräche7 werbung7  kampagne7  internet7  
 DISTRIBUTION=MULTINOMIAL LINK=CUMLOGIT
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT  CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION.


FACTOR
  /VARIABLES Ntvspot5, Nplakate5, Nradiospot5, Ninfos5 Npartweb5 Nkundgeb5  Nwahlstand5 Nspende5 Netzwerk5
  /MISSING PAIRWISE 
  /ANALYSIS Ntvspot5, Nplakate5, Nradiospot5, Ninfos5 Npartweb5 Nkundgeb5  Nwahlstand5 Nspende5 Netzwerk5
  /PRINT INITIAL EXTRACTION ROTATION
  /FORMAT SORT
  /CRITERIA FACTORS(3) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.


* Verallgemeinerte lineare Modelle.
GENLIN absicht7 (ORDER=ASCENDING) BY internet7 (ORDER=ASCENDING) WITH Frau alter westdeutsch Hochschulreife einkom wissindex2 mitPI7 wahlnorm
  /MODEL internet7
 DISTRIBUTION=MULTINOMIAL LINK=CUMLOGIT
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION.

