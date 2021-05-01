%% Programa principal para calcular os espectros cruzados para Eta, Velx, Vely, Velzzz e Press�o
clear,clc,close all
%% Chama subrotina 'geraonda3'
%Entrar com a dire��o m�dia
tetamean=input('Entre com a dire��o das ondas: ');

%Chama subrotina 'geraonda3'
[neta,netax,netay,netaxx,netayy,velx,vely,velz,velzz,velzzz,pr,dt]=geraonda3(tetamean);
%neta - eleva��o
%netax - inclina��o em x
%netay - inclina��o em y
%netaxx - curvatura em x
%netayy - curvatura em y
%velx - velocidade horizontal em x
%vely - velocidade horizontal em y
%velz - velocidade vertical superficial (Dneta/Dt)
%velzz - velocidade vertical (Equa��o integral - papaer RAPPORT)
%velzzz - velocidade vertical (Dpot.vel/Dz) (utilizar esta pois varia com o z e � maios parecida com a velz quando z=0)
%pr - press�o (peso especifico = 1.025 g/cm^3)
%dt - intervalo de amostragem

%% Espectros
[aaetavx]=espec2(neta,velx,dt); %cruzamento de eta com vel x - fig.1
[aaetavy]=espec2(neta,vely,dt); %cruzamento de eta com vel y - fig.2
[aaetavz]=espec2(neta,velzzz,dt); %cruzamento de eta com vel z - fig.3
[aaetapr]=espec2(neta,pr,dt); %cruzamento de eta com press�o - fig.4
[aavxvy]=espec2(velx,vely,dt); %cruzamento de vel x com vel y - fig.5
[aavxvz]=espec2(velx,velzzz,dt); %cruzamento de vel x com vel z - fig.6
[aavxpr]=espec2(velx,pr,dt); %cruzamento de vel x com press�o - fig.7
[aavyvz]=espec2(vely,velzzz,dt); %cruzamento de vel y com vel z - fig.8
[aavypr]=espec2(vely,pr,dt); %cruzamento de vel y com press�o - fig.9
[aavzpr]=espec2(velzzz,pr,dt); %cruzamento de vel z com press�o - fig.10

%% Plot dos espectros cruzados %%
%%
%Auto-espectro de Eta com Vel x
figure (1)
subplot(2,2,1)
hold on
plot(aaetavx(:,1),aaetavx(:,2),'b'), grid on
plot(aaetavx(:,1),aaetavx(:,3),'r'), grid on
axis tight
title('Auto espectro de Eta e Vx')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Eta','Vx')
hold off

%Amplitude do espectro cruzado de Eta com Vel x
subplot(2,2,2)
plot(aaetavx(:,1),aaetavx(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Eta e Vx')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Eta com Vel x
subplot(2,2,3)
plot(aaetavx(:,1),aaetavx(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Eta e Vx')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Eta com Vel x
subplot(2,2,4)
hold on
plot(aaetavx(:,1),aaetavx(:,8),'b'), grid on
plot(aaetavx(:,1),aaetavx(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Eta e Vx')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Eta com Vel y
figure (2)
subplot(2,2,1)
hold on
plot(aaetavy(:,1),aaetavy(:,2),'b'), grid on
plot(aaetavy(:,1),aaetavy(:,3),'r'), grid on
axis tight
title('Auto espectro de Eta e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Eta','Vy')
hold off

%Amplitude do espectro cruzado de Eta com Vel y
subplot(2,2,2)
plot(aaetavy(:,1),aaetavy(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Eta e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Eta com Vy
subplot(2,2,3)
plot(aaetavy(:,1),aaetavy(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Eta e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Eta com Vy
subplot(2,2,4)
hold on
plot(aaetavy(:,1),aaetavy(:,8),'b'), grid on
plot(aaetavy(:,1),aaetavy(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Eta e Vy')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Eta com Vel z
figure (3)
subplot(2,2,1)
hold on
plot(aaetavz(:,1),aaetavz(:,2),'b'), grid on
plot(aaetavz(:,1),aaetavz(:,3),'r'), grid on
axis tight
title('Auto espectro de Eta e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Eta','Vz')
hold off

%Amplitude do espectro cruzado de Eta com Vel z
subplot(2,2,2)
plot(aaetavz(:,1),aaetavz(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Eta e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Eta com Vz
subplot(2,2,3)
plot(aaetavz(:,1),aaetavz(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Eta e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Eta com Vz
subplot(2,2,4)
hold on
plot(aaetavz(:,1),aaetavz(:,8),'b'), grid on
plot(aaetavz(:,1),aaetavz(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Eta e Vz')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Eta com Press�o
figure (4)
subplot(2,2,1)
hold on
plot(aaetapr(:,1),aaetapr(:,2),'b'), grid on
plot(aaetapr(:,1),aaetapr(:,3),'r'), grid on
axis tight
title('Auto espectro de Eta e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Eta','Pr')
hold off

%Amplitude do espectro cruzado de Eta com Press�o
subplot(2,2,2)
plot(aaetapr(:,1),aaetapr(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Eta e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Eta com Press�o
subplot(2,2,3)
plot(aaetapr(:,1),aaetapr(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Eta e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Eta com Press�o
subplot(2,2,4)
hold on
plot(aaetapr(:,1),aaetapr(:,8),'b'), grid on
plot(aaetapr(:,1),aaetapr(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Eta e Press�o')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vx e Vy
figure (5)
subplot(2,2,1)
hold on
plot(aavxvy(:,1),aavxvy(:,2),'b'), grid on
plot(aavxvy(:,1),aavxvy(:,3),'r'), grid on
axis tight
title('Auto espectro de Vx e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vx','Vy')
hold off

%Amplitude do espectro cruzado de Vx e Vy
subplot(2,2,2)
plot(aavxvy(:,1),aavxvy(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vx e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vx e Vy
subplot(2,2,3)
plot(aavxvy(:,1),aavxvy(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vx e Vy')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vx e Vy
subplot(2,2,4)
hold on
plot(aavxvy(:,1),aavxvy(:,8),'b'), grid on
plot(aavxvy(:,1),aavxvy(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vx e Vy')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vx e Vz
figure (6)
subplot(2,2,1)
hold on
plot(aavxvz(:,1),aavxvz(:,2),'b'), grid on
plot(aavxvz(:,1),aavxvz(:,3),'r'), grid on
axis tight
title('Auto espectro de Vx e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vx','Vz')
hold off

%Amplitude do espectro cruzado de Vx e Vz
subplot(2,2,2)
plot(aavxvz(:,1),aavxvz(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vx e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vx e Vz
subplot(2,2,3)
plot(aavxvy(:,1),aavxvy(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vx e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vx e Vy
subplot(2,2,4)
hold on
plot(aavxvz(:,1),aavxvz(:,8),'b'), grid on
plot(aavxvz(:,1),aavxvz(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vx e Vz')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vx e Press�o
figure (7)
subplot(2,2,1)
hold on
plot(aavxpr(:,1),aavxpr(:,2),'b'), grid on
plot(aavxpr(:,1),aavxpr(:,3),'r'), grid on
axis tight
title('Auto espectro de Vx e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vx','Pr')
hold off

%Amplitude do espectro cruzado de Vx e Press�o
subplot(2,2,2)
plot(aavxpr(:,1),aavxpr(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vx e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vx e Press�o
subplot(2,2,3)
plot(aavxpr(:,1),aavxpr(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vx e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vx e Press�o
subplot(2,2,4)
hold on
plot(aavxpr(:,1),aavxpr(:,8),'b'), grid on
plot(aavxpr(:,1),aavxpr(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vx e Press�o')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vy e Vz
figure (8)
subplot(2,2,1)
hold on
plot(aavyvz(:,1),aavyvz(:,2),'b'), grid on
plot(aavyvz(:,1),aavyvz(:,3),'r'), grid on
axis tight
title('Auto espectro de Vy e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vy','Vz')
hold off

%Amplitude do espectro cruzado de Vy e Vz
subplot(2,2,2)
plot(aavyvz(:,1),aavyvz(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vy e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vy e Vz
subplot(2,2,3)
plot(aavyvz(:,1),aavyvz(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vy e Vz')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vy e Vz
subplot(2,2,4)
hold on
plot(aavyvz(:,1),aavyvz(:,8),'b'), grid on
plot(aavyvz(:,1),aavyvz(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vy e Vz')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vy e Press�o
figure (9)
subplot(2,2,1)
hold on
plot(aavypr(:,1),aavypr(:,2),'b'), grid on
plot(aavypr(:,1),aavypr(:,3),'r'), grid on
axis tight
title('Auto espectro de Vy e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vy','Pr')
hold off

%Amplitude do espectro cruzado de Vy e Press�o
subplot(2,2,2)
plot(aavypr(:,1),aavypr(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vy e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vy e Press�o
subplot(2,2,3)
plot(aavypr(:,1),aavypr(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vy e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vy e Press�o
subplot(2,2,4)
hold on
plot(aavypr(:,1),aavypr(:,8),'b'), grid on
plot(aavypr(:,1),aavypr(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vy e Press�o')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off

%%
%Auto-espectro de Vz e Press�o
figure (10)
subplot(2,2,1)
hold on
plot(aavzpr(:,1),aavzpr(:,2),'b'), grid on
plot(aavzpr(:,1),aavzpr(:,3),'r'), grid on
axis tight
title('Auto espectro de Vz e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')
legend('Vz','Pr')
hold off

%Amplitude do espectro cruzado de Vz e Press�o
subplot(2,2,2)
plot(aavzpr(:,1),aavzpr(:,6)), grid on
axis tight
title('Amplitude do espectro cruzado de Vz e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Fase do espectro cruzado de Vz e Press�o
subplot(2,2,3)
plot(aavzpr(:,1),aavzpr(:,7)), grid on
axis tight
title('Fase do espectro cruzado de Vz e Press�o')
xlabel('Frequ�ncia')
ylabel('Energia')

%Espectro de coer�ncia de Vz e Press�o
subplot(2,2,4)
hold on
plot(aavzpr(:,1),aavzpr(:,8),'b'), grid on
plot(aavzpr(:,1),aavzpr(:,11),'r'), grid on
axis tight
title('Espectro de Coer�ncia de Vz e Press�o')
xlabel('Frequ�ncia')
ylabel('Coer�ncia')
hold off