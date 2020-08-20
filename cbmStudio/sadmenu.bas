10 rem lets go!
20 PRINT"{clear}{home}": POKE 53272,23 :REM LOWER/UPPER CASE MODE
21 db$="" : rem debug text
22 ff=1 : rem init time flag
24 p1=0: rem row  
30 p2=0 :rem col
40 mt=0: rem total items 
45 he$="": rem disk header 
46 bf$="": rem blockes free
50 mn=500 : rem current ndx
60 md=0: rem direction of next menu item
70 ry=781:rx=782:rf=783 : rem cursor location crap
75 dv=8 : rem drive number
80 ft=1 : rem 1st load
!---------------  Array MUST be the last var declared
!-=====================================
!-===================================
100 dim mi$(256) : rem dir items
103 gosub 23000 : rem load screen
104 p1=3:p2=3:pa$="Loading...": gosub 20000
108 gosub 17000 : rem load array
115 gosub 17500 : rem load 1st time menu
!-120 db$ = "len of mi$ = " + len(mn$) : gosub 16000 : rem DEBUG
195 gosub 16500 : rem print drive info
200 get k$ : if k$ = "" then 200
205 rem print asc(k$)
208 ky = asc(k$)
210 if ky = 17 then md=0: gosub 19000 : rem down arrow
215 if ky = 145 then md=1: gosub 19000 : rem up arrow
220 if ky = 81 then print"{clear}{home}sadMenu (c)sadLogic 2020":end : rem Quit
225 goto 200
300 end


#region DEBUG print2screen 1600
15999 rem === print DEBUG to screen at row, col
16000 poke rx,3: poke ry,24: poke rf,0: sys65520
16010 print "{space*36}";
16015 poke rx,3: poke ry,24: poke rf,0: sys65520
16020 print"{reverse on}";db$;"{reverse off}";
16030 return
#endregion


#region print-drive-#-and-type
16500 dt$="1541" : rem optimize later
16501 ff=len(str$(dv))
16502 dv$=right$(str$(dv),ff-1)
16504 if len(dv$) = 1 then dv$ = "0" + dv$
16505 p5=1:p1=0:p2=30:pa$="#"+dv$+ "  "+ dt$ : gosub 20000
16510 return
#endregion


#region load array 17000
!-=====================================
17000 rem load array
17010 mi$(0)="new menu 1"
17081 mi$(1)="new menu 2"
17082 mi$(2)="new menu 3"
17083 mi$(3)="new menu 4"
17086 mi$(4)="new menu 5"
17087 mi$(5)="new menu 6"
17097 mi$(6)="new menu 7"
17107 mi$(7)="new menu 8"
17117 mi$(8)="new menu 9"
17127 mi$(9)="new menu 10"
17137 mi$(10)="new menu 11"
17147 mi$(11)="new menu 12"
17157 mi$(12)="new menu 13"
17167 mi$(13)="new menu 14"
17177 mi$(14)="new menu 15"
17187 mi$(15)="new menu 16"
17288 mt=15 : rem total items = 17
17293 return
#endregion

#region load menu 1st time 17500
17499 rem Load menu 1st time
17500 p2=3 : rem col
17510 mn=0 : rem reset menu ndx
17515 p1=1
!-=====================================
17520 for x = 0 to mt step 1
17530   p1=p1+1:pa$=mi$(x)
17540   if x=mn then p5=1
17550   if x<>mn then p5=0
17597   gosub20000
17599 next
17600 ft=0 : rem turn off 1st time menu init
17620 p1=2: rem reset row
!-=====================================
17660 return

#endregion


#region hi-light / move menu item 19000
18995 rem === print a menu item
19000 gosub 19500: rem clear old selection
19010 gosub 19700: rem highlight new selection
19020 return
#endregion


#region un-hi-light menu item 19500
19500 if ft=0 then if md=1 then if mn=0 then return : rem top of menu
19505 if ft=0 then if md=0 then if mn >= (mt) then return : rem bottom of menu
19510 if md=0 then mn=mn+1 : pa$=mi$(mn-1):
19520 if md=1 then mn=mn-1 : pa$=mi$(mn+1):
19530 p5=0: rem set to un-hilight
19540 gosub 20000 : return
#endregion


#region hi-light new row 19700
19700 if ft=0 then if mn >= (mt+1) then return : rem btm or top of menu
19702 db$ = "mn(array index) = " + str$(mn) : gosub 16000 : rem DEBUG
19705 rem if direction (md=0) we are going down
19708 p5=1 : rem set to hi-light
19710 p1= 2 + mn: pa$=mi$(mn):  gosub 20000
19799 return
#endregion


#region print2screen 20000
19999 rem === print to screen at row, col
20000  poke ry,p1:poke rx,p2: poke rf,0: sys65520
20010 if p5=1 then print"{reverse on}";pa$;"{reverse off}"
20020 if p5=0 then printpa$
20025 rem db$="p1(row) = " + str$(p1)+" p2(col)"+str$(p2):gosub 16000:rem DEBUG
20028 rem db$ = "mn(array index) = " + str$(mn) : gosub 16000 : rem DEBUG
20030 return
#endregion




#region draw screen 21000
!-=================================================================================================
!-21000 rem ===========  dummy test screen
!-21001 PRINT "{cyan}{176}CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC{174}";
!-21010 PRINT "{125}            {169}sad  menu{127}               {125}";
!-21020 PRINT "{125}CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC{125}";
!-21030 PRINT "{125}                                      {125}";
!-21040 PRINT "{125}                                      {125}";
!-21050 PRINT "{125}                                      {125}";
!-21060 PRINT "{125}                                      {125}";
!-21070 PRINT "{125}                                      {125}";
!-21080 PRINT "{125}                                      {125}";
!-21090 PRINT "{125}                                      {125}";
!-21100 PRINT "{125}                                      {125}";
!-21110 PRINT "{125}                                      {125}";
!-21120 PRINT "{125}                                      {125}";
!-21130 PRINT "{125}                                      {125}";
!-21140 PRINT "{125}                                      {125}";
!-21150 PRINT "{125}                                      {125}";
!-21160 PRINT "{125}                                      {125}";
!-21170 PRINT "{125}                                      {125}";
!-21180 PRINT "{125}                                      {125}";
!-21190 PRINT "{125}                                      {125}";
!-21200 PRINT "{125}                                      {125}";
!-21210 PRINT "{125}                                      {125}";
!-21220 PRINT "{125}        (s)ort     (d)rive=8          {125}";
!-21230 PRINT "{173}CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC{189}";                                  
!-21250 return
!-=================================================================================================
#endregion

#region draw screen 23000
23000 REM SCREEN 1 - 
23010 PRINT "{cyan}{176}@@@@@@@@@@@@@@@@@@@@@@@@@@@@{178}@@@@@@@@@{174}";
23020 PRINT "{reverse off}{125}                            {125}         {125}";
23030 PRINT "{125}                            {125}         {125}";
23040 PRINT "{125}                            {125}D-Drive  {125}";
23050 PRINT "{125}                            {125}         {125}";
23060 PRINT "{125}                            {125}         {125}";
23070 PRINT "{125}                            {125}         {125}";
23080 PRINT "{125}                            {125}         {125}";
23090 PRINT "{125}                            {125}         {125}";
23100 PRINT "{125}                            {125}         {125}";
23110 PRINT "{125}                            {125}         {125}";
23130 PRINT "{125}                            {125}         {125}";
23140 PRINT "{125}                            {125}         {125}";
23150 PRINT "{125}                            {125}         {125}";
23160 PRINT "{125}                            {125}         {125}";
23170 PRINT "{125}                            {125}         {125}";
23175 PRINT "{125}                            {125}         {125}";
23180 PRINT "{125}                            {125}         {125}";
23190 PRINT "{125}                            {125}         {125}";
23200 PRINT "{125}                            {125}         {125}";
23210 PRINT "{125}                            {125}---------{125}";
23220 PRINT "{125}                            {125}Q-Quit{160}{160}{160}{125}";
23230 PRINT "{125}                            {125}A-About  {125}";
23240 PRINT "{173}@@@@@@@@@@@@@@@@@@@@@@@@@@@@{177}@@@@@@@@@{189}";
!-23250 PRINT "{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}{160}";
23255 return
#endregion

