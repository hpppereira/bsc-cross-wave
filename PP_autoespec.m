%Programa principal para auto-espectro de eta

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

%% Chama subrotina do espectro rotatório para as várias direções
dt=1;
%Onda de 0 graus
[aa0]=Espec(reg0(:,1)',dt);
%Onda de 30 graus
[aa30]=Espec(reg30(:,1)',dt);
%Onda de 45 graus
[aa45]=Espec(reg45(:,1)',dt);
%Onda de 60 graus
[aa60]=Espec(reg60(:,1)',dt);
%Onda de 90 graus
[aa90]=Espec(reg90(:,1)',dt);
%Onda de 120 graus
[aa120]=Espec(reg120(:,1)',dt);
%Onda de 135 graus
[aa135]=Espec(reg135(:,1)',dt);
%Onda de 150 graus
[aa150]=Espec(reg150(:,1)',dt);
%Onda de 180 graus
[aa180]=Espec(reg180(:,1)',dt);

%% Plot dos auto-espectros

figure
plot(aa0(:,1),aa0(:,2)), title('0 graus')
figure
plot(aa30(:,1),aa30(:,2)), title('30 graus')
figure
plot(aa45(:,1),aa45(:,2)), title('45 graus')
figure
plot(aa60(:,1),aa60(:,2)), title('60 graus')
figure
plot(aa90(:,1),aa90(:,2)), title('90 graus')
figure
plot(aa120(:,1),aa120(:,2)), title('120 graus')
figure
plot(aa135(:,1),aa135(:,2)), title('135 graus')
figure
plot(aa150(:,1),aa150(:,2)), title('150 graus')
figure
plot(aa180(:,1),aa180(:,2)), title('180 graus')


