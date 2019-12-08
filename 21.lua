local i,j,s
s=0

for i=1,1000 do
     for j=1,i-1 do
         if i%j==0 then
             s=s+j

		 end
	end
 if i==s then
        print(i)
		s=0
 else
      s=0


 end
 end
