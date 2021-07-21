clc
clear 
close all
% p=optimizer.math.sharif.edu_DataLoader2021_Data2021.asdf.pdf
% c=pathsep
% isequal(class(p),class(c))
filename = 'book2.xlsx';
sheet = 1;
xlRange = 'A4:C363';
St = xlsread(filename,sheet,xlRange);
[n,m]=size(St);
s=zeros(72,95);
for i=1:n
    s(St(i,1),St(i,2))=St(i,3);
end
Lt=xlsread(filename,'A410:B450');
[nl,ml]=size(Lt);
l1=zeros(95,1);
for i=1:nl
    l1(Lt(i,1))=Lt(i,2);
end
Ut=xlsread(filename,'A367:B406');
[nu,mu]=size(Ut);
u1=zeros(95,1);
for i=1:nu
    u1(Ut(i,1))=Ut(i,2);
end
Aeq=[]
beq=[]
b=zeros(72,1);
f=ones(95,1);
v=linprog(f,Aeq,beq,s,b,l1,u1)
%v=quadprog([],f,Aeq,beq,s,b,l1,u1)
t=sum(v==0)
filename = 'output.xlsx';
A = [v];
xlswrite(filename,A)
