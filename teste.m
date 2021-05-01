%% Calculo do espectro rotatorio nas componentes Vx e Vy para direções de
%% 0, 30, 45, 60, 90, 120, 135, 150 e 180 graus.
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

%% Chama subrotina do espectro rotatório para ondas vindas de 0 graus
%Registro de 0 graus

vx0=reg0(:,2); %Vx
vy0=reg0(:,3); %Vy
vz0=reg0(:,4); %Vz
dt=1;

[aa0]=Especrot(vy0,vz0,dt);

figure
subplot(3,1,1)
plot(aa0(:,1),aa0(:,2),'b'), hold on %autoespec de x
plot(aa0(:,1),aa0(:,3),'r')           %autoespec de z
plot(aa0(:,1),aa0(:,6),'g'), hold off %espectro total
title('Ondas de 0 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa0(:,1),aa0(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa0(:,1),aa0(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 30 graus
%Registro de 30 graus

vx30=reg30(:,2); %Vx
vy30=reg30(:,3); %Vy
vz30=reg30(:,4); %Vz
dt=1;

[aa30]=Especrot(vy30,vz30,dt);

figure
subplot(3,1,1)
plot(aa30(:,1),aa30(:,2),'b'), hold on %autoespec de x
plot(aa30(:,1),aa30(:,3),'r')           %autoespec de z
plot(aa30(:,1),aa30(:,6),'g'), hold off %espectro total
title('Ondas de 30 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa30(:,1),aa30(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa30(:,1),aa30(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 45 graus
%Registro de 45 graus

vx45=reg45(:,2); %Vx
vy45=reg45(:,3); %Vy
vz45=reg45(:,4); %Vz
dt=1;

[aa45]=Especrot(vy45,vz45,dt);

figure
subplot(3,1,1)
plot(aa45(:,1),aa45(:,2),'b'), hold on 
plot(aa45(:,1),aa45(:,3),'r')
plot(aa45(:,1),aa45(:,6),'g'), hold off
title('Ondas de 45 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa45(:,1),aa45(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa45(:,1),aa45(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 60 graus
%Registro de 60 graus

vx60=reg60(:,2); %Vx
vy60=reg60(:,3); %Vy
vz60=reg60(:,4); %Vz
dt=1;

[aa60]=Especrot(vy60,vz60,dt);

figure
subplot(3,1,1)
plot(aa60(:,1),aa60(:,2),'b'), hold on %autoespec de x
plot(aa60(:,1),aa60(:,3),'r')           %autoespec de z
plot(aa60(:,1),aa60(:,6),'g'), hold off %espectro total
title('Ondas de 60 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa60(:,1),aa60(:,4))
title('Espectro horário'),ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa60(:,1),aa60(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 90 graus
%Registro de 90 graus

vx90=reg90(:,2); %Vx
vy90=reg90(:,3); %Vy
vz90=reg90(:,4); %Vz
dt=1;

[aa90]=Especrot(vy90,vz90,dt);

figure
subplot(3,1,1)
plot(aa90(:,1),aa90(:,2),'b'), hold on 
plot(aa90(:,1),aa90(:,3),'r')
plot(aa90(:,1),aa90(:,6),'g'), hold off
title('Ondas de 90 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa90(:,1),aa90(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa90(:,1),aa90(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 120 graus
%Registro de 120 graus

vx120=reg120(:,2); %Vx
vy120=reg120(:,3); %Vy
vz120=reg120(:,4); %Vz
dt=1;

[aa120]=Especrot(vy120,vz120,dt);

figure
subplot(3,1,1)
plot(aa120(:,1),aa120(:,2),'b'), hold on %autoespec de x
plot(aa120(:,1),aa120(:,3),'r')           %autoespec de z
plot(aa120(:,1),aa120(:,6),'g'), hold off %espectro total
title('Ondas de 120 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa120(:,1),aa120(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa120(:,1),aa120(:,5))
title('Espectro anti-horário'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 135 graus
%Registro de 135 graus

vx135=reg135(:,2); %Vx
vy135=reg135(:,3); %Vy
vz135=reg135(:,4); %Vz
dt=1;

[aa135]=Especrot(vy135,vz135,dt);

figure
subplot(3,1,1)
plot(aa135(:,1),aa135(:,2),'b'), hold on 
plot(aa135(:,1),aa135(:,3),'r')
plot(aa135(:,1),aa135(:,6),'g'), hold off
title('Ondas de 135 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa135(:,1),aa135(:,4))
title('Espectro horário'),ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa135(:,1),aa135(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 150 graus
%Registro de 150 graus

vx150=reg150(:,2); %Vx
vy150=reg150(:,3); %Vy
vz150=reg150(:,4); %Vz
dt=1;

[aa150]=Especrot(vy150,vz150,dt);

figure
subplot(3,1,1)
plot(aa150(:,1),aa150(:,2),'b'), hold on %autoespec de x
plot(aa150(:,1),aa150(:,3),'r')           %autoespec de z
plot(aa150(:,1),aa150(:,6),'g'), hold off %espectro total
title('Ondas de 150 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa150(:,1),aa150(:,4))
title('Espectro horário'),ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa150(:,1),aa150(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Chama subrotina do espectro rotatório para ondas vindas de 180 graus
%Registro de 180 graus

vx180=reg180(:,2); %Vx
vy180=reg180(:,3); %Vy
vz180=reg180(:,4); %Vz
dt=1;

[aa180]=Especrot(vy180,vz180,dt);

figure
subplot(3,1,1)
plot(aa180(:,1),aa180(:,2),'b'), hold on 
plot(aa180(:,1),aa180(:,3),'r')
plot(aa180(:,1),aa180(:,6),'g'), hold off
title('Ondas de 180 graus')
ylabel('Energia')
legend('Auto-espec de Vy','Auto-espec de Vz','Espectro total')
axis tight

subplot(3,1,2)
plot(aa180(:,1),aa180(:,4))
title('Espectro horário'), ylabel('Energia'), axis tight

subplot(3,1,3)
plot(aa180(:,1),aa180(:,5))
title('Espectro anti-horário'),xlabel('Frequencia'), ylabel('Energia'), axis tight

%% Plot do espec total, coef. rotação, dir da elipse, estabilidade da elipse

% Direção de 0 graus
figure
subplot(2,2,1)
plot(aa0(:,1),aa0(:,6)),grid on %Espectro total
title('Espectro total - 0 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa0(:,1),aa0(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 0 graus'), axis tight
subplot(2,2,3)
plot(aa0(:,1),aa0(:,9)),grid on %Direção da elipse
title('Direção da elipse - 0 graus'), axis tight
subplot(2,2,4)
plot(aa0(:,1),aa0(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa0(:,1),aa0(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 0 graus'), axis tight

% Direção de 30 graus
figure
subplot(2,2,1)
plot(aa30(:,1),aa30(:,6)),grid on %Espectro total
title('Espectro total - 30 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa30(:,1),aa30(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 30 graus'), axis tight
subplot(2,2,3)
plot(aa30(:,1),aa30(:,9)),grid on %Direção da elipse
title('Direção da elipse - 30 graus'), axis tight
subplot(2,2,4)
plot(aa30(:,1),aa30(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa30(:,1),aa30(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 30 graus'), axis tight

% Direção de 45 graus
figure
subplot(2,2,1)
plot(aa45(:,1),aa45(:,6)),grid on %Espectro total
title('Espectro total - 45 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa45(:,1),aa45(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 45 graus'), axis tight
subplot(2,2,3)
plot(aa45(:,1),aa45(:,9)),grid on %Direção da elipse
title('Direção da elipse - 45 graus'), axis tight
subplot(2,2,4)
plot(aa45(:,1),aa45(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa45(:,1),aa45(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 45 graus'), axis tight

% Direção de 60 graus
figure
subplot(2,2,1)
plot(aa60(:,1),aa60(:,6)),grid on %Espectro total
title('Espectro total - 60 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa60(:,1),aa60(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 60 graus'), axis tight
subplot(2,2,3)
plot(aa60(:,1),aa60(:,9)),grid on %Direção da elipse
title('Direção da elipse - 60 graus'), axis tight
subplot(2,2,4)
plot(aa60(:,1),aa60(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa60(:,1),aa60(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 60 graus'), axis tight

% Direção de 90 graus
figure
subplot(2,2,1)
plot(aa90(:,1),aa90(:,6)),grid on %Espectro total
title('Espectro total - 90 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa90(:,1),aa90(:,8)), grid on %Coef. de rotação
title('Coef. de Rotação - 90 graus'), axis tight
subplot(2,2,3)
plot(aa90(:,1),aa90(:,9)), grid on %Direção da elipse
title('Direção da elipse - 90 graus'), axis tight
subplot(2,2,4)
plot(aa90(:,1),aa90(:,10)), grid on, hold on %Estabilidade da elipse
plot(aa90(:,1),aa90(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 90 graus'), axis tight

% Direção de 120 graus
figure
subplot(2,2,1)
plot(aa120(:,1),aa120(:,6)),grid on %Espectro total
title('Espectro total - 120 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa120(:,1),aa120(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 120 graus'), axis tight
subplot(2,2,3)
plot(aa120(:,1),aa120(:,9)),grid on %Direção da elipse
title('Direção da elipse - 135 graus'), axis tight
subplot(2,2,4)
plot(aa120(:,1),aa120(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa120(:,1),aa120(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 120 graus'), axis tight

% Direção de 135 graus
figure
subplot(2,2,1)
plot(aa135(:,1),aa135(:,6)),grid on %Espectro total
title('Espectro total - 135 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa135(:,1),aa135(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 135 graus'), axis tight
subplot(2,2,3)
plot(aa135(:,1),aa135(:,9)),grid on %Direção da elipse
title('Direção da elipse - 135 graus'), axis tight
subplot(2,2,4)
plot(aa135(:,1),aa135(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa135(:,1),aa135(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 135 graus'), axis tight

% Direção de 150 graus
figure
subplot(2,2,1)
plot(aa150(:,1),aa150(:,6)),grid on %Espectro total
title('Espectro total - 150 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa150(:,1),aa150(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 150 graus'), axis tight
subplot(2,2,3)
plot(aa150(:,1),aa150(:,9)),grid on %Direção da elipse
title('Direção da elipse - 150 graus'), axis tight
subplot(2,2,4)
plot(aa150(:,1),aa150(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa150(:,1),aa150(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 150 graus'), axis tight

% Direção de 180 graus
figure
subplot(2,2,1)
plot(aa180(:,1),aa180(:,6)),grid on %Espectro total
title('Espectro total - 180 graus - VyVz'), axis tight
subplot(2,2,2)
plot(aa180(:,1),aa180(:,8)),grid on %Coef. de rotação
title('Coef. de Rotação - 180 graus'), axis tight
subplot(2,2,3)
plot(aa180(:,1),aa180(:,9)),grid on %Direção da elipse
title('Direção da elipse - 180 graus'), axis tight
subplot(2,2,4)
plot(aa180(:,1),aa180(:,10)),grid on,hold on %Estabilidade da elipse
plot(aa180(:,1),aa180(:,13),'r') %intervalo de confiança
legend('Estabilidade da elipse','Intervalo de conf.')
title('Estabilidade da elipse - 180 graus'), axis tight

%% Plot da velocidade orbital Vy,Vz
figure
subplot(3,3,1)
plot(vy0,vz0)
title('Velocidade orbital - 0 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,2)
plot(vy30,vz30)
title('Velocidade orbital - 30 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,3)
plot(vy45,vz45)
title('Velocidade orbital - 45 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,4)
plot(vy60,vz60)
title('Velocidade orbital - 60 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,5)
plot(vy90,vz90)
title('Velocidade orbital - 90 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,6)
plot(vy120,vz120)
title('Velocidade orbital - 120 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,7)
plot(vy135,vz135)
title('Velocidade orbital - 135 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,8)
plot(vy150,vz150)
title('Velocidade orbital - 150 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal
subplot(3,3,9)
plot(vy180,vz180)
title('Velocidade orbital - 180 graus'),xlabel('Vel y'),ylabel('Vel z'), axis equal

%% Plot da velocidade orbital Vx,Vy
figure
subplot(3,3,1)
plot(vx0,vy0,'.')
title('Velocidade orbital - 0 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,2)
plot(vx30,vy30,'.')
title('Velocidade orbital - 30 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,3)
plot(vx45,vy45,'.')
title('Velocidade orbital - 45 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,4)
plot(vx60,vy60,'.')
title('Velocidade orbital - 60 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,5)
plot(vx90,vy90,'.')
title('Velocidade orbital - 90 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,6)
plot(vx120,vy120,'.')
title('Velocidade orbital - 120 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,7)
plot(vx135,vy135,'.')
title('Velocidade orbital - 135 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,8)
plot(vx150,vy150,'.')
title('Velocidade orbital - 150 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
subplot(3,3,9)
plot(vx180,vy180,'.')
title('Velocidade orbital - 180 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
