!--------------------------------------------------
!- Tuesday, August 18, 2020 4:03:34 PM
!- Import of : LISTDIRECTORY.PRG
!- From Disk : e:\c64dev\disks\andy_utils.d64
!- Commodore 64
!--------------------------------------------------


!-===============================================================
!-999 dim mi$(256)
!-1000 open1,dv,0,"$":poke781,1:sys65478:get a$,a$
!-1010 tp$="" :rem temp var
!-1020 li=0 : rem line worked on
!-1030 he$="": rem disk header 
!-1040 bf$="": rem blockes free
!-1050 rem *********************************************
!-1060 x=0
!-1070 get a$,a$ : ifst=64thensys65484:close1:bf$=tp$:end
!-1080 tp$=""
!-1090 geta$,b$:tp$=tp$+str$(asc(a$+chr$(0))+256*asc(b$+chr$(0)))
!-1100 geta$ : tp$= tp$ + a$
!-1110 if a$<>"" then goto 1100
!-1120 if li=0 then li=1:he$=tp$ :goto1050
!-1130 mi$(x)=tp$:x=x+1
!-1140 goto1050
!-2000 end
!-===============================================================


10 ? "start"
20 gosub 1000
30 ? "end"
40 end


1000 open1,8,0,"$":poke781,1:sys65478:get a$,a$
1010 tp$="" :rem temp var
1020 li=0 : rem line worked on
1030 he$="": rem disk header
1040 bf$="": rem blockes free
1050 rem *********************************************
1060 get a$,a$ : if st=64 then sys65484: close1 : bf$=tp$:gosub1140:return
1070 tp$=""
1080 geta$,b$:tp$=tp$+str$(asc(a$+chr$(0))+256*asc(b$+chr$(0)))

!-1020 geta$,b$:print""asc(a$+chr$(0))+256*asc(b$+chr$(0));

!-1030 geta$:printa$;:ifa$<>""then goto 1090
1090 geta$ : tp$= tp$ + a$
1100 if a$<>"" then goto 1090
1110 print tp$:if li=0 then li=1:he$=tp$ :goto1050
1120 goto1050
1130 end
1140 rem ************************************
1150 rem ************************************
1160 ?:?:?:?
1170 ? "header "; he$
1180 ? "blocks free ";bf$
1190 return




22000 DIM X$(30)
22010 OPEN 15,8,15,"i":REM INIT
22020 OPEN 3,8,3,"#":REM BUFFER
22030 OPEN 2,8,2,"$":REM DIRECTORY
22040 FOR J=1 TO 254:GET#2,X$:NEXT
22050 FOR J=1 TO 8
22060 FOR K=1 TO 30:GET#2,X$(K):NEXT
22070 IF X$(1)<>CHR$(130) GOTO 22120
22080 FOR K=4 TO 19:PRINT X$(K);:NEXT
22090 PRINT#15,"u1:";3;0;ASC(X$(2)+CHR$(0));ASC(X$(3)+CHR$(0))
22100 GET#3,X$,X$,L$,H$
22110 PRINT ASC(L$+CHR$(0)) + 256ASC(H$+CHR$(0))"{left}"
22120 IF J<8 THEN GET#2,X$,X$
22130 NEXT J
22140 IF ST=0 GOTO 22050
22150 CLOSE 2: CLOSE 3: CLOSE 15:END

