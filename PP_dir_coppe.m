%% Programa para c�lculo da dire��o das ondas geradas pelo tanque de ondas
clear,clc,close all

%Chama subrotina 'geraonda3'
%[neta,netax,netay,netaxx,netayy,velx,vely,velz,velzz,velzzz,pr,dt,h,z,d,g]=geraonda3(tetamean);

dados=load('puv_coppe.txt');

%% dados de entrada
%intervalo de amostragem
dt=0.5;

%cria vari�veis de pressao, velx, vely, velz e eta

pr=dados(:,1);
velx=dados(:,2);
vely=dados(:,3);
velz=dados(:,4);
neta=pr-mean(pr);

figure
plot(neta), hold all
plot(velx)
plot(vely)
plot(velz)

%% Plot das s�ries dos par�metros de onda
figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(1:length(neta),neta,1:length(pr),pr,'plot');
set(get(AX(1),'Ylabel'),'String','Eta (m)') ;
set(get(AX(2),'Ylabel'),'String','Press�o (mbar)'); 
title('S�rie') 
subplot(2,1,2)
plot(neta),hold on
plot(velx,'r')
plot(vely,'k')
plot(velz,'g'), hold off
title('S�rie'),xlabel('Tempo (registros)'),ylabel('(m) ; (m/s)')
legend('Eta','Vel x','Vel y','Vel z')

%% Espectros
[aaeta]=espec(neta,dt); %Espec. de neta
[aaxy]=espec2(velx,vely,dt); %Espec. cruzado entre 'Vx' e 'Vy'
[aaxz]=espec2(velx,velz,dt); %Espec. cruzado entre 'Vx' e 'Vz'
[aayz]=espec2(vely,velz,dt); %Espec. cruzado entre 'Vy' e 'Vz'
[aaxp]=espec2(velx,pr,dt); %Espec. cruzado entre 'Vx' e 'press�o'
[aayp]=espec2(vely,pr,dt); %Espec. cruzado entre 'Vy' e 'press�o'

%Plot dos autoespectros
figure
subplot(2,1,1)
plot(aaxp(:,1),aaxp(:,3),'y') %auto-espec da press�o
legend('Press�o')
title('Auto-Espectro'),xlabel('Frequ�ncia'),ylabel('Energia')
subplot(2,1,2)
hold on
plot(aaeta(:,1),aaeta(:,2),'b') %auto-espec de eta
plot(aaxy(:,1),aaxy(:,2),'r') %auto-espec de vel x
plot(aaxy(:,1),aaxy(:,3),'k') %auto-espec de vel y
plot(aaxz(:,1),aaxz(:,3),'g') %auto-espec de vel z
legend('Eta','Vel x','Vel y','Vel z')
title('Auto-Espectro'),xlabel('Frequ�ncia'),ylabel('Energia')
hold off
