%teste vetor progressivo
clear,clc,close all
reg0=load('registro0.txt');

vx=reg0(:,2);
vy=reg0(:,3);

y=sqrt((vx.^2)+(vy.^2));

plot(vx,vy)

for i=1:length(vx)-1
    vx1(i,1)=vx(i+1)-vx(i);
    vy1(i,1)=vy(i+1)-vy(i);
end

figure
plot(vx1,vy1)