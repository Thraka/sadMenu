201 PRINT"{clear}": print"{home}";
221 p1=10:rem row y
222 p2=2 :rem col x
223 ry=781:rx=782:rf=783 
242 pa$="dadttqsa jhkgda"
247 print"press key to test 1"
248 get zz$:if zz$="" then 248
252 gosub 20000
258 print:print:print"press key to test 2"
259 get zz$:if zz$="" then 259
260 p2=2:p1=11
265 gosub 10000
266 end
272 rem
282 rem
292 rem
10000 rem --- print to screen plotting at x,y
10010 pokerx,p2:pokery,p1:pokerf,0:sys65520:printpa$:return
20000 rem --- print to screen at x,y
20010 for x = 1 to len(pa$) 
20020 ca = (asc(mid$(pa$,x,1)) - 64)
20025 p1=INT(p1):p2=INT(p2)
20030 if ca <> -32 then poke 1024+p1*40+p2, ca
20040 p2=p2+1
20050 next
20060 return