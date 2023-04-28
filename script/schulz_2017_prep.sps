* Encoding: UTF-8.

MISSING VALUES kp5_421ka TO kp5_421ei (LOWEST THRU -1).
MISSING VALUES kp5_421ha TO kp5_421ii (LOWEST THRU -1).

COMPUTE kp5_421a=SUM(kp5_421aa to kp5_421ai).
COMPUTE kp5_421g=SUM(kp5_421ga to kp5_421gi).
COMPUTE kp5_421d=SUM(kp5_421da to kp5_421di).
COMPUTE kp5_421e=SUM(kp5_421ea to kp5_421ei).
COMPUTE kp5_421k=SUM(kp5_421ka to kp5_421ki).

COMPUTE kp5_421h=SUM(kp5_421ha to kp5_421hi).
COMPUTE kp5_421b=SUM(kp5_421ba to kp5_421bi).
COMPUTE kp5_421l=SUM(kp5_421la to kp5_421li).
COMPUTE kp5_421i=SUM(kp5_421ia to kp5_421ii).

RECODE kp5_421a TO kp5_421i (1 THRU HI=1) (ELSE =COPY) .

COMPUTE kp5_wwtot = SUM(kp5_421d,kp5_421e,kp5_421g, kp5_421b) .
FREQUENCIES kp5_wwtot .

MISSING VALUES kp6_421ka TO kp6_421ei (LOWEST THRU -1).
MISSING VALUES kp6_421ha TO kp6_421ii (LOWEST THRU -1).

COMPUTE kp6_421a=SUM(kp6_421aa to kp6_421ai).
COMPUTE kp6_421g=SUM(kp6_421ga to kp6_421gi).
COMPUTE kp6_421d=SUM(kp6_421da to kp6_421di).
COMPUTE kp6_421e=SUM(kp6_421ea to kp6_421ei).
COMPUTE kp6_421k=SUM(kp6_421ka to kp6_421ki).

COMPUTE kp6_421h=SUM(kp6_421ha to kp6_421hi).
COMPUTE kp6_421b=SUM(kp6_421ba to kp6_421bi).
COMPUTE kp6_421l=SUM(kp6_421la to kp6_421li).
COMPUTE kp6_421i=SUM(kp6_421ia to kp6_421ii).

RECODE kp6_421a TO kp6_421i (1 THRU HI=1) (ELSE =COPY) .

COMPUTE kp6_wwtot = SUM(kp6_421d,kp6_421e,kp6_421g, kp6_421b) .
FREQUENCIES kp6_wwtot .

MISSING VALUES kp7_421ka TO kp7_421ei (LOWEST THRU -1).
MISSING VALUES kp7_421ha TO kp7_421ii (LOWEST THRU -1).

COMPUTE kp7_421a=SUM(kp7_421aa to kp7_421ai).
COMPUTE kp7_421g=SUM(kp7_421ga to kp7_421gi).
COMPUTE kp7_421d=SUM(kp7_421da to kp7_421di).
COMPUTE kp7_421e=SUM(kp7_421ea to kp7_421ei).
COMPUTE kp7_421k=SUM(kp7_421ka to kp7_421ki).

COMPUTE kp7_421h=SUM(kp7_421ha to kp7_421hi).
COMPUTE kp7_421b=SUM(kp7_421ba to kp7_421bi).
COMPUTE kp7_421l=SUM(kp7_421la to kp7_421li).
COMPUTE kp7_421i=SUM(kp7_421ia to kp7_421ii).

RECODE kp7_421a TO kp7_421i (1 THRU HI=1) (ELSE =COPY) .

COMPUTE kp7_wwtot = SUM(kp7_421d,kp7_421e,kp7_421g, kp7_421b) .
FREQUENCIES kp7_wwtot .


FACTOR
  /VARIABLES kp5_421a kp5_421g kp5_421d kp5_421e kp5_421k kp5_421h kp5_421b kp5_421l kp5_421i
  /MISSING LISTWISE 
  /ANALYSIS kp5_421a kp5_421g kp5_421d kp5_421e kp5_421k kp5_421h kp5_421b kp5_421l kp5_421i
  /PRINT INITIAL ROTATION
  /FORMAT SORT BLANK(.10)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

USE ALL.
COMPUTE filter_$=(NMISS(kp5_170,kp6_170,kp7_170,kp5_wwtot,kp6_wwtot,kp7_wwtot) = 0).
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

USE ALL.
COMPUTE filter_$=(n_teilnahmen = 9).
VARIABLE LABELS filter_$ 'n_teilnahmen = 9 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


FREQUENCIES kp5_170 kp6_170 kp7_170 kp5_wwtot.
FREQ kp7_421da to kp7_421di .

USE ALL.
COMPUTE filter_$=((n_teilnahmen = 9) & NMISS(kp5_170,kp6_170,kp7_170) = 0).
FILTER BY filter_$.
EXECUTE.

USE ALL.
COMPUTE filter_$=(SUM(w5b,w6b,w7b) = 3).
FILTER BY filter_$.
EXECUTE.
