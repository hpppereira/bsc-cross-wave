%% Calculo do espectro rotatorio nas componentes Vy e Vz para mar cruzado
%Somatório de ondas de a) 30º e 60º / b) 45º e 135º / c) 120º e 150º
clear,clc,close all
%Periodo de 12 segundos
%matriz --> registro=[neta' velx' vely' velz'];
reg0=load('registro0.txt');
reg30=load('registro30.txt');
reg45=load('registro45.txt');
reg60=load('registro60.txt');
reg90=load('registro90.txt');
reg120=load('registro120.txt');
reg135=load('registro135.txt');
reg150=load('registro150.txt');
reg180=load('registro180.txt');

%% Cria variáveis com as velocidades nas direções:
%Registro de 0 graus
vx0=reg0(:,2); %Vx
vy0=reg0(:,3); %Vy
vz0=reg0(:,4); %Vz
%Registro de 30 graus
vx30=reg30(:,2); %Vx
vy30=reg30(:,3); %Vy
vz30=reg30(:,4); %Vz
%Registro de 45 graus
vx45=reg45(:,2); %Vx
vy45=reg45(:,3); %Vy
vz45=reg45(:,4); %Vz
%Registro de 60 graus
vx60=reg60(:,2); %Vx
vy60=reg60(:,3); %Vy
vz60=reg60(:,4); %Vz
%Registro de 90 graus
vx90=reg90(:,2); %Vx
vy90=reg90(:,3); %Vy
vz90=reg90(:,4); %Vz
%Registro de 120 graus
vx120=reg120(:,2); %Vx
vy120=reg120(:,3); %Vy
vz120=reg120(:,4); %Vz
%Registro de 135 graus
vx135=reg135(:,2); %Vx
vy135=reg135(:,3); %Vy
vz135=reg135(:,4); %Vz
%Registro de 150 graus
vx150=reg150(:,2); %Vx
vy150=reg150(:,3); %Vy
vz150=reg150(:,4); %Vz
%Registro de 180 graus
vx180=reg180(:,2); %Vx
vy180=reg180(:,3); %Vy
vz180=reg180(:,4); %Vz

%% Somatório de ondas: a) rega= 30º e 60º / b) regb= 45º e 135º / c) regc= 120º e 150º
rega=reg30+reg60;
regb=reg45+reg135;
regc=reg120+reg150;

%Plot das elevações dos mares cruzados
figure
subplot(3,1,1)
plot(rega(:,1)), title('Mar cruzado de 30 e 60 graus'), ylabel('Elevação'), axis tight
subplot(3,1,2)
plot(regb(:,1)), title('Mar cruzado de 45 e 135 graus'), ylabel('Elevação'), axis tight
subplot(3,1,3)
plot(regc(:,1)), title('Mar cruzado de 120 e 150 graus'), ylabel('Elevação'), xlabel('Registros'), axis tight

%% Chama subrotina do espectro rotatório para mar cruzado 'a'
%Cria variáveis com as velocidades orbitais
vxa=rega(:,2); %Vx
vya=rega(:,3); %Vy
vza=rega(:,4); %Vz
dt=1;

[aaa]=Especrot(vya,vza,dt);

figure
subplot(3,1,1)
plot(aaa(:,1),aaa(:,2),'b'), hold on %autoespec de x
plot(aaa(:,1),aaa(:,3),'r')           %autoespec de z
plot(aaa(:,1),aaa(:,6),'g'), hold off %espectro total
title('Mar cruzado de 30 e 60 graus - VyVz')
ylabel('Energia')
legend('Auto-espec de Vx','Auto-espec de Vy','Espectro total')
axis tight

subplot(3,1,2)
plot(aaa(:,1),aaa(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aaa(:,1),aaa(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para mar cruzado 'b'
%Cria variáveis com as velocidades orbitais
vxb=regb(:,2); %Vx
vyb=regb(:,3); %Vy
vzb=regb(:,4); %Vz
dt=1;

[aab]=Especrot(vyb,vzb,dt);

figure
subplot(3,1,1)
plot(aab(:,1),aab(:,2),'b'), hold on %autoespec de x
plot(aab(:,1),aab(:,3),'r')           %autoespec de z
plot(aab(:,1),aab(:,6),'g'), hold off %espectro total
title('Mar cruzado de 45 e 135 graus - VyVz')
ylabel('Energia')
legend('Auto-espec de Vx','Auto-espec de Vy','Espectro total')
axis tight

subplot(3,1,2)
plot(aab(:,1),aab(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aab(:,1),aab(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para mar cruzado 'c'
%Cria variáveis com as velocidades orbitais
vxc=regc(:,2); %Vx
vyc=regc(:,3); %Vy
vzc=regc(:,4); %Vz
dt=1;

[aac]=Especrot(vyc,vzc,dt);

figure
subplot(3,1,1)
plot(aac(:,1),aac(:,2),'b'), hold on %autoespec de y
plot(aac(:,1),aac(:,3),'r')           %autoespec de z
plot(aac(:,1),aac(:,6),'g'), hold off %espectro total
title('Mar cruzado de 120 e 150 graus - VyVz')
ylabel('Energia')
legend('Auto-espec de Vx','Auto-espec de Vy','Espectro total')
axis tight

subplot(3,1,2)
plot(aac(:,1),aac(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aac(:,1),aac(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Plot do espec total, coef. rotação, dir da elipse, estabilidade da elipse

% Mar cruzado 'a'
figure
subplot(2,2,1)
plot(aaa(:,1),aaa(:,6),'b'), hold on %Espectro total
plot(aaa(:,1),aaa(:,4),'r') %Espectro horário
plot(aaa(:,1),aaa(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 30 e 60 graus - VyVz'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,2,2)
plot(aaa(:,1),aaa(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - Mar cruzado de 30 e 60 graus'), axis tight
subplot(2,2,3)
plot(aaa(:,1),aaa(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 30 e 60 graus'), axis tight
subplot(2,2,4)
plot(aaa(:,1),aaa(:,10)),grid on,hold on %Estabilidade da elipse
plot(aaa(:,1),aaa(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - Mar cruzado de 30 e 60 graus'), axis tight

% Mar cruzado 'b'
figure
subplot(2,2,1)
plot(aab(:,1),aab(:,6),'b'), hold on %Espectro total
plot(aab(:,1),aab(:,4),'r') %Espectro horário
plot(aab(:,1),aab(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 45 e 135 graus - VyVz'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,2,2)
plot(aab(:,1),aab(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - Mar cruzado de 45 e 135 graus'), axis tight
subplot(2,2,3)
plot(aab(:,1),aab(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 45 e 135 graus'), axis tight
subplot(2,2,4)
plot(aab(:,1),aab(:,10)),grid on,hold on %Estabilidade da elipse
plot(aab(:,1),aab(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - Mar cruzado de 45 e 135 graus'), axis tight

% Mar cruzado 'c'
figure
subplot(2,2,1)
plot(aac(:,1),aac(:,6),'b'), hold on %Espectro total
plot(aac(:,1),aac(:,4),'r') %Espectro horário
plot(aac(:,1),aac(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 120 e 150 graus - VyVz'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,2,2)
plot(aac(:,1),aac(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - Mar cruzado de 120 e 150 graus'), axis tight
subplot(2,2,3)
plot(aac(:,1),aac(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 120 e 150 graus'), axis tight
subplot(2,2,4)
plot(aac(:,1),aac(:,10)),grid on,hold on %Estabilidade da elipse
plot(aac(:,1),aac(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - Mar cruzado de 120 e 150 graus'), axis tight

%% Plot da velocidade orbital Vx,Vy
figure
subplot(3,3,1)
plot(vx30,vy30,'.')
title('Velocidade orbital - 30 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,2)
plot(vx60,vy60,'.')
title('Velocidade orbital - 60 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,3)
plot(vxa,vya,'.')
title('Velocidade orbital - Mar cruzado de 30 e 60 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,4)
plot(vx45,vy45,'.')
title('Velocidade orbital - 45 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,5)
plot(vx135,vy135,'.')
title('Velocidade orbital - 135 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,6)
plot(vxb,vyb,'.')
title('Velocidade orbital - Mar cruzado de 45 e 135 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,7)
plot(vx120,vy120,'.')
title('Velocidade orbital - 120 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,8)
plot(vx150,vy150,'.')
title('Velocidade orbital - 150 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,9)
plot(vxc,vyc,'.')
title('Velocidade orbital - Mar cruzado de 120 e 150 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal

%% Plot do espectro total, horário e anti-horário e a direção da elipse

% Mar cruzado 'a'
figure
subplot(2,1,1)
plot(aaa(:,1),aaa(:,6),'b'), hold on %Espectro total
plot(aaa(:,1),aaa(:,4),'r') %Espectro horário
plot(aaa(:,1),aaa(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 30 e 60 graus'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,1,2)
plot(aaa(:,1),aaa(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 30 e 60 graus'), axis tight

% Mar cruzado 'b'
figure
subplot(2,1,1)
plot(aab(:,1),aab(:,6),'b'), hold on %Espectro total
plot(aab(:,1),aab(:,4),'r') %Espectro horário
plot(aab(:,1),aab(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 45 e 135 graus'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,1,2)
plot(aab(:,1),aab(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 45 e 135 graus'), axis tight

% Mar cruzado 'c'
figure
subplot(2,1,1)
plot(aac(:,1),aac(:,6),'b'), hold on %Espectro total
plot(aac(:,1),aac(:,4),'r') %Espectro horário
plot(aac(:,1),aac(:,5),'g'), hold off %Espectro anti-horário
title('Espectro Rotatório - Mar cruzado de 120 e 150 graus'), grid on, axis tight
legend('Espec.total','Espec.horário','Espec.anti-horário')
subplot(2,1,2)
plot(aac(:,1),aac(:,9)),grid on %Direção da elipse
title('Direção da elipse - Mar cruzado de 120 e 150 graus'), axis tight


