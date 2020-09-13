
with open('D:\\ErvinCPU\\test\\dmemr.txt','r') as f:
    lines = f.readlines()

nlines=[]
for l in lines:      
    for i in range(4):  
        nlines.append(l[(3-i)*2:(3-i)*2+2]+'\n')
# print(nlines)

with open('D:\\ErvinCPU\\test\\dmem.txt','w') as fn:
    fn.writelines(nlines)