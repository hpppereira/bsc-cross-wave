%% Programa principal para calculo da ifft dos dados de ondas gerados
%% para mar uni e bi-modal utilizando VxVz
%Somatório de ondas de a) 30º e 60º / b) 45º e 135º / c) 120º e 150º / d)regd= 0º e 180º / e) rege= 0º e 30º / f) regf= 150º e 180º
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

%% Chama subrotina do espectro rotatório para as várias direções
dt=1;
%Onda de 0 graus
[aa0]=Especrot(vx0,vz0,dt);
%Onda de 30 graus
[aa30]=Especrot(vx30,vz30,dt);
%Onda de 45 graus
[aa45]=Especrot(vx45,vz45,dt);
%Onda de 60 graus
[aa60]=Especrot(vx60,vz60,dt);
%Onda de 90 graus
[aa90]=Especrot(vx90,vz90,dt);
%Onda de 120 graus
[aa120]=Especrot(vx120,vz120,dt);
%Onda de 135 graus
[aa135]=Especrot(vx135,vz135,dt);
%Onda de 150 graus
[aa150]=Especrot(vx150,vz150,dt);
%Onda de 180 graus
[aa180]=Especrot(vx180,vz180,dt);

%% Somatório de ondas: a) rega= 30º e 60º / b) regb= 45º e 135º / c) regc= 120º e 150º / 
%% d) regd= 0º e 180º / e) rege= 0º e 30º / f) regf= 150º e 180º
rega=reg30+reg60;
regb=reg45+reg135;
regc=reg120+reg150;
regd=reg0+reg180;
rege=reg0+reg30;
regf=reg150+reg180;

%% Chama subrotina do espectro rotatório para mar cruzado 'a'
%Cria variáveis com as velocidades orbitais
vxa=rega(:,2); %Vx
vya=rega(:,3); %Vy
vza=rega(:,4); %Vz
dt=1;

[aaa]=Especrot(vxa,vza,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'b'
%Cria variáveis com as velocidades orbitais
vxb=regb(:,2); %Vx
vyb=regb(:,3); %Vy
vzb=regb(:,4); %Vz
dt=1;

[aab]=Especrot(vxb,vzb,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'c'
%Cria variáveis com as velocidades orbitais
vxc=regc(:,2); %Vx
vyc=regc(:,3); %Vy
vzc=regc(:,4); %Vz
dt=1;

[aac]=Especrot(vxc,vzc,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'd'
%Cria variáveis com as velocidades orbitais
vxd=regd(:,2); %Vx
vyd=regd(:,3); %Vy
vzd=regd(:,4); %Vz
dt=1;

[aad]=Especrot(vxd,vzd,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'e'
%Cria variáveis com as velocidades orbitais
vxe=rege(:,2); %Vx
vye=rege(:,3); %Vy
vze=rege(:,4); %Vz
dt=1;

[aae]=Especrot(vxe,vze,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'f'
%Cria variáveis com as velocidades orbitais
vxf=regf(:,2); %Vx
vyf=regf(:,3); %Vy
vzf=regf(:,4); %Vz
dt=1;

[aaf]=Especrot(vxf,vzf,dt);

%% Fazer a ifft do espec horario e anti-horario para as varias direções e para os mares cruzados

%0 graus
%espec horario
yh0=ifft(aa0(:,4));
yh0r=real(yh0);
yh0i=imag(yh0);
%espec anti-horario
ya0=ifft(aa0(:,5));
ya0r=real(ya0);
ya0i=imag(ya0);

figure
subplot(3,2,1:2)
plot(reg0(:,3)), hold all
plot(reg0(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 0 graus')
subplot(3,2,3)
plot(yh0r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh0i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya0r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya0i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%30 graus
%espec horario
yh30=ifft(aa30(:,4));
yh30r=real(yh30);
yh30i=imag(yh30);
%espec anti-horario
ya30=ifft(aa30(:,5));
ya30r=real(ya30);
ya30i=imag(ya30);

figure
subplot(3,2,1:2)
plot(reg30(:,3)), hold all
plot(reg30(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 30 graus')
subplot(3,2,3)
plot(yh30r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh30i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya30r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya30i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%60 graus
%espec horario
yh60=ifft(aa60(:,4));
yh60r=real(yh60);
yh60i=imag(yh60);
%espec anti-horario
ya60=ifft(aa60(:,5));
ya60r=real(ya60);
ya60i=imag(ya60);

figure
subplot(3,2,1:2)
plot(reg60(:,3)), hold all
plot(reg60(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 60 graus')
subplot(3,2,3)
plot(yh60r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh60i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya60r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya60i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%90 graus
%espec horario
yh90=ifft(aa90(:,4));
yh90r=real(yh90);
yh90i=imag(yh90);
%espec anti-horario
ya90=ifft(aa90(:,5));
ya90r=real(ya90);
ya90i=imag(ya90);

figure
subplot(3,2,1:2)
plot(reg90(:,3)), hold all
plot(reg90(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 90 graus')
subplot(3,2,3)
plot(yh90r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh90i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya90r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya90i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%120 graus
%espec horario
yh120=ifft(aa120(:,4));
yh120r=real(yh120);
yh120i=imag(yh120);
%espec anti-horario
ya120=ifft(aa120(:,5));
ya120r=real(ya120);
ya120i=imag(ya120);

figure
subplot(3,2,1:2)
plot(reg120(:,3)), hold all
plot(reg120(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 120 graus')
subplot(3,2,3)
plot(yh120r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh120i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya120r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya120i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%135 graus
%espec horario
yh135=ifft(aa135(:,4));
yh135r=real(yh135);
yh135i=imag(yh135);
%espec anti-horario
ya135=ifft(aa135(:,5));
ya135r=real(ya135);
ya135i=imag(ya135);

figure
subplot(3,2,1:2)
plot(reg135(:,3)), hold all
plot(reg135(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 135 graus')
subplot(3,2,3)
plot(yh135r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh135i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya135r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya135i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%150 graus
%espec horario
yh150=ifft(aa150(:,4));
yh150r=real(yh150);
yh150i=imag(yh150);
%espec anti-horario
ya150=ifft(aa150(:,5));
ya150r=real(ya150);
ya150i=imag(ya150);

figure
subplot(3,2,1:2)
plot(reg150(:,3)), hold all
plot(reg150(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 150 graus')
subplot(3,2,3)
plot(yh150r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh150i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya150r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya150i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%180 graus
%espec horario
yh180=ifft(aa180(:,4));
yh180r=real(yh180);
yh180i=imag(yh180);
%espec anti-horario
ya180=ifft(aa180(:,5));
ya180r=real(ya180);
ya180i=imag(ya180);

figure
subplot(3,2,1:2)
plot(reg180(:,3)), hold all
plot(reg180(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 180 graus')
subplot(3,2,3)
plot(yh180r), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yh180i), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(ya180r), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(ya180i), axis tight, title('IFFT imaginário - Espectro anti-horário')

%Mar cruzado 'a' - 30 e 60 graus
%espec horario
yha=ifft(aaa(:,4));
yhar=real(yha);
yhai=imag(yha);
%espec anti-horario
yaa=ifft(aaa(:,5));
yaar=real(yaa);
yaai=imag(yaa);

figure
subplot(3,2,1:2)
plot(rega(:,3)), hold all
plot(rega(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 30+60 graus')
subplot(3,2,3)
plot(yhar), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yhai), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(yaar), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(yaai), axis tight, title('IFFT imaginário - Espectro anti-horário')

%Mar cruzado 'b' - 45 e 135 graus
%espec horario
yhb=ifft(aab(:,4));
yhbr=real(yhb);
yhbi=imag(yhb);
%espec anti-horario
yab=ifft(aab(:,5));
yabr=real(yab);
yabi=imag(yab);

figure
subplot(3,2,1:2)
plot(regb(:,3)), hold all
plot(regb(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 45+135 graus')
subplot(3,2,3)
plot(yhbr), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yhbi), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(yabr), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(yabi), axis tight, title('IFFT imaginário - Espectro anti-horário')

%Mar cruzado 'c' - 120+150 graus
%espec horario
yhc=ifft(aac(:,4));
yhcr=real(yhc);
yhci=imag(yhc);
%espec anti-horario
yac=ifft(aac(:,5));
yacr=real(yac);
yaci=imag(yac);

figure
subplot(3,2,1:2)
plot(regc(:,3)), hold all
plot(regc(:,4)), hold off, legend('Vel x','Vel z'), axis tight, title('Série de Velocidades orbitais - 120+150 graus')
subplot(3,2,3)
plot(yhcr), axis tight, title('IFFT real - Espectro horário')
subplot(3,2,4)
plot(yhci), axis tight, title('IFFT imaginário - Espectro horário')
subplot(3,2,5)
plot(yacr), axis tight, title('IFFT real - Espectro anti-horário')
subplot(3,2,6)
plot(yaci), axis tight, title('IFFT imaginário - Espectro anti-horário')