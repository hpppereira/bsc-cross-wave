%% plot do vetor progressivo
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

%% plot com vetor progressivo
figure
x=[1:512]';
y=linspace(0,0,512)';
quiver(x,y,vx0(1:512),vy0(1:512)), title('Ondas de 0 graus'), axis tight
figure
quiver(x,y,vx30(1:512),vy30(1:512)), title('Ondas de 30 graus'), axis tight
figure
quiver(x,y,vx45(1:512),vy45(1:512)), title('Ondas de 45 graus'), axis tight
figure
quiver(x,y,vx60(1:512),vy60(1:512)), title('Ondas de 60 graus'), axis tight
figure
quiver(x,y,vx90(1:512),vy90(1:512)), title('Ondas de 90 graus'), axis tight
figure
quiver(x,y,vx120(1:512),vy120(1:512)), title('Ondas de 120 graus'), axis tight
figure
quiver(x,y,vx135(1:512),vy135(1:512)), title('Ondas de 135 graus'), axis tight
figure
quiver(x,y,vx150(1:512),vy150(1:512)), title('Ondas de 150 graus'), axis tight
figure
quiver(x,y,vx180(1:512),vy180(1:512)), title('Ondas de 180 graus'), axis tight





