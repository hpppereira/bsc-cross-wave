%% Programa principal para análisar os espectros horários e anti-horários 
%% para mar uni e bi-modal utilizando VyVz - utilizando a função FLIPUD (Muda para de onde a onda vem)
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

%% Cria variáveis com as velocidades nas direções: %Com o flipud analisa-se de onde a onda vem
%Registro de 0 graus
vx0=flipud(reg0(:,2)); %Vx
vy0=flipud(reg0(:,3)); %Vy
vz0=flipud(reg0(:,4)); %Vz
%Registro de 30 graus
vx30=flipud(reg30(:,2)); %Vx
vy30=flipud(reg30(:,3)); %Vy
vz30=flipud(reg30(:,4)); %Vz
%Registro de 45 graus
vx45=flipud(reg45(:,2)); %Vx
vy45=flipud(reg45(:,3)); %Vy
vz45=flipud(reg45(:,4)); %Vz
%Registro de 60 graus
vx60=flipud(reg60(:,2)); %Vx
vy60=flipud(reg60(:,3)); %Vy
vz60=flipud(reg60(:,4)); %Vz
%Registro de 90 graus
vx90=flipud(reg90(:,2)); %Vx
vy90=flipud(reg90(:,3)); %Vy
vz90=flipud(reg90(:,4)); %Vz
%Registro de 120 graus
vx120=flipud(reg120(:,2)); %Vx
vy120=flipud(reg120(:,3)); %Vy
vz120=flipud(reg120(:,4)); %Vz
%Registro de 135 graus
vx135=flipud(reg135(:,2)); %Vx
vy135=flipud(reg135(:,3)); %Vy
vz135=flipud(reg135(:,4)); %Vz
%Registro de 150 graus
vx150=flipud(reg150(:,2)); %Vx
vy150=flipud(reg150(:,3)); %Vy
vz150=flipud(reg150(:,4)); %Vz
%Registro de 180 graus
vx180=flipud(reg180(:,2)); %Vx
vy180=flipud(reg180(:,3)); %Vy
vz180=flipud(reg180(:,4)); %Vz

%% Chama subrotina do espectro rotatório para as várias direções
dt=1;
%Onda de 0 graus
[aa0]=Especrot(vy0,vz0,dt);
%Onda de 30 graus
[aa30]=Especrot(vy30,vz30,dt);
%Onda de 45 graus
[aa45]=Especrot(vy45,vz45,dt);
%Onda de 60 graus
[aa60]=Especrot(vy60,vz60,dt);
%Onda de 90 graus
[aa90]=Especrot(vy90,vz90,dt);
%Onda de 120 graus
[aa120]=Especrot(vy120,vz120,dt);
%Onda de 135 graus
[aa135]=Especrot(vy135,vz135,dt);
%Onda de 150 graus
[aa150]=Especrot(vy150,vz150,dt);
%Onda de 180 graus
[aa180]=Especrot(vy180,vz180,dt);

%% Somatório de ondas: a) rega= 0º e 90º / b) regb= 90º e 180º / c) regc= 0º e 180º / 
%% d) regd= 45º e 135º / e) rege= 30º e 60º / f) regf= 120º e 150º
rega=reg0+reg90;
regb=reg90+reg180;
regc=reg0+reg180;
regd=reg45+reg135;
rege=reg30+reg60;
regf=reg120+reg150;

%% Chama subrotina do espectro rotatório para mar cruzado 'a'
%Cria variáveis com as velocidades orbitais
vxa=flipud(rega(:,2)); %Vx
vya=flipud(rega(:,3)); %Vy
vza=flipud(rega(:,4)); %Vz
dt=1;

[aaa]=Especrot(vya,vza,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'b'
%Cria variáveis com as velocidades orbitais
vxb=flipud(regb(:,2)); %Vx
vyb=flipud(regb(:,3)); %Vy
vzb=flipud(regb(:,4)); %Vz
dt=1;

[aab]=Especrot(vyb,vzb,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'c'
%Cria variáveis com as velocidades orbitais
vxc=flipud(regc(:,2)); %Vx
vyc=flipud(regc(:,3)); %Vy
vzc=flipud(regc(:,4)); %Vz
dt=1;

[aac]=Especrot(vyc,vzc,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'd'
%Cria variáveis com as velocidades orbitais
vxd=flipud(regd(:,2)); %Vx
vyd=flipud(regd(:,3)); %Vy
vzd=flipud(regd(:,4)); %Vz
dt=1;

[aad]=Especrot(vyd,vzd,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'e'
%Cria variáveis com as velocidades orbitais
vxe=flipud(rege(:,2)); %Vx
vye=flipud(rege(:,3)); %Vy
vze=flipud(rege(:,4)); %Vz
dt=1;

[aae]=Especrot(vye,vze,dt);

%% Chama subrotina do espectro rotatório para mar cruzado 'f'
%Cria variáveis com as velocidades orbitais
vxf=flipud(regf(:,2)); %Vx
vyf=flipud(regf(:,3)); %Vy
vzf=flipud(regf(:,4)); %Vz
dt=1;

[aaf]=Especrot(vyf,vzf,dt);

%% Plot dos espectros horários e anti-horários para os mares cruzados
%mar 'a'
figure
subplot(3,2,1)
plot(aa30(:,1),aa30(:,4)), title('Espectro horário - 30 graus - VyVz'), hold all
plot(aa30(:,1),aa30(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa60(:,1),aa60(:,4)), title('Espectro horário - 60 graus'), hold all
plot(aa60(:,1),aa60(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aaa(:,1),aaa(:,4)), title('Espectro horário - 30+60 graus'), xlabel('Frequencia'), hold all
plot(aaa(:,1),aaa(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa30(:,1),aa30(:,5)), title('Espectro anti-horário - 30 graus'), hold all
plot(aa30(:,1),aa30(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa60(:,1),aa60(:,5)), title('Espectro anti-horário - 60 graus'), hold all
plot(aa60(:,1),aa60(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aaa(:,1),aaa(:,5)), title('Espectro anti-horário - 30+60 graus'), xlabel('Frequencia'), hold all
plot(aaa(:,1),aaa(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
%mar 'b'
figure
subplot(3,2,1)
plot(aa45(:,1),aa45(:,4)), title('Espectro horário - 45 graus - VyVz'), hold all
plot(aa45(:,1),aa45(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa135(:,1),aa135(:,4)), title('Espectro horário - 135 graus'), hold all
plot(aa135(:,1),aa135(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aab(:,1),aab(:,4)), title('Espectro horário - 45+135 graus'), xlabel('Frequencia'), hold all
plot(aab(:,1),aab(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa45(:,1),aa45(:,5)), title('Espectro anti-horário - 45 graus'), hold all
plot(aa45(:,1),aa45(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa135(:,1),aa135(:,5)), title('Espectro anti-horário - 135 graus'), hold all
plot(aa135(:,1),aa135(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aab(:,1),aab(:,5)), title('Espectro anti-horário - 45+135 graus'), xlabel('Frequencia'), hold all
plot(aab(:,1),aab(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
%mar 'c'
figure
subplot(3,2,1)
plot(aa120(:,1),aa120(:,4)), title('Espectro horário - 120 graus - VyVz'), hold all
plot(aa120(:,1),aa120(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa150(:,1),aa150(:,4)), title('Espectro horário - 150 graus'), hold all
plot(aa150(:,1),aa150(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aac(:,1),aac(:,4)), title('Espectro horário - 120+150 graus'), xlabel('Frequencia'), hold all
plot(aac(:,1),aac(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa120(:,1),aa120(:,5)), title('Espectro anti-horário - 120 graus'), hold all
plot(aa120(:,1),aa120(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa150(:,1),aa150(:,5)), title('Espectro anti-horário - 150 graus'), hold all
plot(aa150(:,1),aa150(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aac(:,1),aac(:,5)), title('Espectro anti-horário - 120+150 graus'), xlabel('Frequencia'), hold all
plot(aac(:,1),aac(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
%mar 'd'
figure
subplot(3,2,1)
plot(aa0(:,1),aa0(:,4)), title('Espectro horário - 0 graus - VyVz'), hold all
plot(aa0(:,1),aa0(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa180(:,1),aa180(:,4)), title('Espectro horário - 180 graus'), hold all
plot(aa180(:,1),aa180(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aad(:,1),aad(:,4)), title('Espectro horário - 0+180 graus'), xlabel('Frequencia'), hold all
plot(aad(:,1),aad(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa0(:,1),aa0(:,5)), title('Espectro anti-horário - 0 graus'), hold all
plot(aa0(:,1),aa0(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa180(:,1),aa180(:,5)), title('Espectro anti-horário - 180 graus'), hold all
plot(aa180(:,1),aa180(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aad(:,1),aad(:,5)), title('Espectro anti-horário - 0+180 graus'), xlabel('Frequencia'), hold all
plot(aad(:,1),aad(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
%mar 'e'
figure
subplot(3,2,1)
plot(aa0(:,1),aa0(:,4)), title('Espectro horário - 0 graus - VyVz'), hold all
plot(aa0(:,1),aa0(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa30(:,1),aa30(:,4)), title('Espectro horário - 30 graus'), hold all
plot(aa30(:,1),aa30(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aae(:,1),aae(:,4)), title('Espectro horário - 0+30 graus'), xlabel('Frequencia'), hold all
plot(aae(:,1),aae(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa0(:,1),aa0(:,5)), title('Espectro anti-horário - 0 graus'), hold all
plot(aa0(:,1),aa0(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa30(:,1),aa30(:,5)), title('Espectro anti-horário - 30 graus'), hold all
plot(aa30(:,1),aa30(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aae(:,1),aae(:,5)), title('Espectro anti-horário - 0+30 graus'), xlabel('Frequencia'), hold all
plot(aae(:,1),aae(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
%mar 'f'
figure
subplot(3,2,1)
plot(aa150(:,1),aa150(:,4)), title('Espectro horário - 150 graus - VyVz'), hold all
plot(aa150(:,1),aa150(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,3)
plot(aa180(:,1),aa180(:,4)), title('Espectro horário - 180 graus'), hold all
plot(aa180(:,1),aa180(:,6)),legend('Espec horário','Espec total') ,hold off
subplot(3,2,5)
plot(aaf(:,1),aaf(:,4)), title('Espectro horário - 150+180 graus'), xlabel('Frequencia'), hold all
plot(aaf(:,1),aaf(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aa150(:,1),aa150(:,5)), title('Espectro anti-horário - 150 graus'), hold all
plot(aa150(:,1),aa150(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,4)
plot(aa180(:,1),aa180(:,5)), title('Espectro anti-horário - 180 graus'), hold all
plot(aa180(:,1),aa180(:,6)),legend('Espec anti-horário','Espec total') ,hold off
subplot(3,2,6)
plot(aaf(:,1),aaf(:,5)), title('Espectro anti-horário - 150+30 graus'), xlabel('Frequencia'), hold all
plot(aaf(:,1),aaf(:,6)), hold off, legend('Espectro anti-horário','Espectro total')


%Plot das direções somadas de 30+60, 45+135 e 120+150 e co coeficiente de rotação
figure
subplot(3,2,1)
plot(aaa(:,1),aaa(:,4)), title('Espectro horário - 30+60 graus'), xlabel('Frequencia'), hold all
plot(aaa(:,1),aaa(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,2)
plot(aaa(:,1),aaa(:,5)), title('Espectro horário - 30+60 graus'), xlabel('Frequencia'), hold all
plot(aaa(:,1),aaa(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
subplot(3,2,3)
plot(aab(:,1),aab(:,4)), title('Espectro horário - 45+135 graus'), xlabel('Frequencia'), hold all
plot(aab(:,1),aab(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,4)
plot(aab(:,1),aab(:,5)), title('Espectro horário - 45+135 graus'), xlabel('Frequencia'), hold all
plot(aab(:,1),aab(:,6)), hold off, legend('Espectro anti-horário','Espectro total')
subplot(3,2,5)
plot(aac(:,1),aac(:,4)), title('Espectro horário - 120+150 graus'), xlabel('Frequencia'), hold all
plot(aac(:,1),aac(:,6)), hold off, legend('Espectro horário','Espectro total')
subplot(3,2,6)
plot(aac(:,1),aac(:,5)), title('Espectro horário - 120+150 graus'), xlabel('Frequencia'), hold all
plot(aac(:,1),aac(:,6)), hold off, legend('Espectro anti-horário','Espectro total')

%Plotyy das direções somadas de 30+60, 45+135 e 120+150 e co coeficiente de rotação
figure
subplot(3,2,1)
[AX,H1,H2]=plotyy(aaa(:,1),aaa(:,4),aaa(:,1),aaa(:,6)), title('Espectro horário - 30+60 graus'), xlabel('Frequencia (Hz)'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(3,2,2)
[AX,H1,H2]=plotyy(aaa(:,1),aaa(:,5),aaa(:,1),aaa(:,6)), title('Espectro anti-horário - 30+60 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(3,2,3)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,4),aab(:,1),aab(:,6)), title('Espectro horário - 45+135 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(3,2,4)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,5),aab(:,1),aab(:,6)), title('Espectro anti-horário - 45+135 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(3,2,5)
[AX,H1,H2]=plotyy(aac(:,1),aac(:,4),aab(:,1),aab(:,6)), title('Espectro horário - 120+150 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(3,2,6)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,5),aab(:,1),aab(:,6)), title('Espectro anti-horário - 120+150 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 

%% Plot de ondas vindas de 90 graus, para comparar com o mar aab
figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(aa90(:,1),aa90(:,4),aa90(:,1),aa90(:,6)), title('Espectro horário - 90 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(2,1,2)
[AX,H1,H2]=plotyy(aa90(:,1),aa90(:,5),aa90(:,1),aa90(:,6)), title('Espectro anti-horário - 90 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 

figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(aac(:,1),aac(:,4),aab(:,1),aab(:,6)), title('Espectro horário - 120+150 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(2,1,2)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,5),aab(:,1),aab(:,6)), title('Espectro anti-horário - 120+150 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 

 %% plot figuras separadas
figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(aaa(:,1),aaa(:,4),aaa(:,1),aaa(:,6)), title('Espectro horário - 30+60 graus'), xlabel('Frequencia (Hz)'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(2,1,2)
[AX,H1,H2]=plotyy(aaa(:,1),aaa(:,5),aaa(:,1),aaa(:,6)), title('Espectro anti-horário - 30+60 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 

figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,4),aab(:,1),aab(:,6)), title('Espectro horário - 45+135 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro horário')
set(get(AX(1),'Ylabel'),'String','Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 
subplot(2,1,2)
[AX,H1,H2]=plotyy(aab(:,1),aab(:,5),aab(:,1),aab(:,6)), title('Espectro anti-horário - 45+135 graus'), xlabel('Frequencia (Hz)'),ylabel('Energia'),legend('Espectro total','Espectro anti-horário')
set(get(AX(1),'Ylabel'),'String','Anti-Horário') ;
set(get(AX(2),'Ylabel'),'String','Total'); 

%% Cálculo do m0
%Integral do espec horario de 30 e 60
df=aab(2,1)-aab(1,1);
mha=0;
for i=1:length(aaa)
    mha=mha+(aaa(i,4)*df);
end

%Integral do espec anti-horario de 30 e 60
maha=0;
for i=1:length(aaa)
    maha=maha+(aaa(i,5)*df);
end

%Integral do espec total de 30 e 60
mta=0;
for i=1:length(aaa)
    mta=mta+(aaa(i,6)*df);
end

%Integral do espec horario de 45 e 135
mhb=0;
for i=1:length(aab)
    mhb=mhb+(aab(i,4)*df);
end

%Integral do espec anti-horario de 45 e 135
mahb=0;
for i=1:length(aab)
    mahb=mahb+(aab(i,5)*df);
end

%Integral do espec total de 45 e 135
mtb=0;
for i=1:length(aab)
    mtb=mtb+(aab(i,6)*df);
end

%Integral do espec horario de 120 e 150
mhc=0;
for i=1:length(aac)
    mhc=mhc+(aac(i,4)*df);
end

%Integral do espec anti-horario de 120 e 150
mahc=0;
for i=1:length(aac)
    mahc=mahc+(aac(i,5)*df);
end

%Integral do espec total de 120 e 150
mtc=0;
for i=1:length(aac)
    mtc=mtc+(aac(i,6)*df);
end

%Integral do espec horario de 90
mh90=0;
for i=1:length(aa90)
    mh90=mh90+(aa90(i,4)*df);
end

%Integral do espec anti-horario de 90
mah90=0;
for i=1:length(aa90)
    mah90=mah90+(aa90(i,5)*df);
end

%Integral do espec total de 90
mt90=0;
for i=1:length(aa90)
    mt90=mt90+(aa90(i,6)*df);
end

%% Plot dos espectros horários e anti-horários para as varias direções

%Horário
figure
subplot(3,3,1)
plot(aa0(:,1),aa0(:,4)), title('Espectro horário - 0 graus')
subplot(3,3,2)
plot(aa30(:,1),aa30(:,4)), title('Espectro horário - 30 graus')
subplot(3,3,3)
plot(aa45(:,1),aa45(:,4)), title('Espectro horário - 45 graus')
subplot(3,3,4)
plot(aa60(:,1),aa60(:,4)), title('Espectro horário - 60 graus')
subplot(3,3,5)
plot(aa90(:,1),aa90(:,4)), title('Espectro horário - 90 graus')
subplot(3,3,6)
plot(aa120(:,1),aa120(:,4)), title('Espectro horário - 120 graus')
subplot(3,3,7)
plot(aa135(:,1),aa135(:,4)), title('Espectro horário - 135 graus'), xlabel('Frequencia')
subplot(3,3,8)
plot(aa150(:,1),aa150(:,4)), title('Espectro horário - 150 graus'), xlabel('Frequencia')
subplot(3,3,9)
plot(aa180(:,1),aa180(:,4)), title('Espectro horário - 180 graus'), xlabel('Frequencia')

%Anti-Horário
figure
subplot(3,3,1)
plot(aa0(:,1),aa0(:,5)), title('Espectro anti-horário - 0 graus')
subplot(3,3,2)
plot(aa30(:,1),aa30(:,5)), title('Espectro anti-horário - 30 graus')
subplot(3,3,3)
plot(aa45(:,1),aa45(:,5)), title('Espectro anti-horário - 45 graus')
subplot(3,3,4)
plot(aa60(:,1),aa60(:,5)), title('Espectro anti-horário - 60 graus')
subplot(3,3,5)
plot(aa90(:,1),aa90(:,5)), title('Espectro anti-horário - 90 graus')
subplot(3,3,6)
plot(aa120(:,1),aa120(:,5)), title('Espectro anti-horário - 120 graus')
subplot(3,3,7)
plot(aa135(:,1),aa135(:,5)), title('Espectro anti-horário - 135 graus'), xlabel('Frequencia')
subplot(3,3,8)
plot(aa150(:,1),aa150(:,5)), title('Espectro anti-horário - 150 graus'), xlabel('Frequencia')
subplot(3,3,9)
plot(aa180(:,1),aa180(:,5)), title('Espectro anti-horário - 180 graus'), xlabel('Frequencia')

%% Plot do espectro horário, anti-horário e total - paper gonella
% cria eixo x
x=linspace(-max(aa0(:,1)),max(aa0(:,1)),2*length(aa0));
x1=linspace(0,0,21);
y1=[0:20];

et0=[flipud(aa0(:,6));aa0(:,6)];
et30=[flipud(aa30(:,6));aa30(:,6)];
et45=[flipud(aa45(:,6));aa45(:,6)];
et60=[flipud(aa60(:,6));aa60(:,6)];
et90=[flipud(aa90(:,6));aa90(:,6)];
et120=[flipud(aa120(:,6));aa120(:,6)];
et135=[flipud(aa135(:,6));aa135(:,6)];
et150=[flipud(aa150(:,6));aa150(:,6)];
et180=[flipud(aa180(:,6));aa180(:,6)];
eta=[flipud(aaa(:,6));aaa(:,6)];
etb=[flipud(aab(:,6));aab(:,6)];
etc=[flipud(aac(:,6));aac(:,6)];
etd=[flipud(aad(:,6));aad(:,6)];
ete=[flipud(aae(:,6));aae(:,6)];
etf=[flipud(aaf(:,6));aaf(:,6)];


%Onda de 0 graus
figure
en_h=flipud(aa0(:,4)); en_ah=(aa0(:,5));
en_hah=[en_h;en_ah];
plot(x,et0,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), hold off
legend('Espec. Total','Horário/Anti-Horário')
title('0 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 30 graus
figure
en_h=flipud(aa30(:,4)); en_ah=(aa30(:,5));
en_hah=[en_h;en_ah];
plot(x,et30,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('30 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 45 graus
figure
en_h=flipud(aa45(:,4)); en_ah=(aa45(:,5));
en_hah=[en_h;en_ah];
plot(x,et45,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('45 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 60 graus
figure
en_h=flipud(aa60(:,4)); en_ah=(aa60(:,5));
en_hah=[en_h;en_ah];
plot(x,et60,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('60 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 90 graus
figure
en_h=flipud(aa90(:,4)); en_ah=(aa90(:,5));
en_hah=[en_h;en_ah];
plot(x,et90,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('90 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 120 graus
figure
en_h=flipud(aa120(:,4)); en_ah=(aa120(:,5));
en_hah=[en_h;en_ah];
plot(x,et120,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('120 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 135 graus
figure
en_h=flipud(aa135(:,4)); en_ah=(aa135(:,5));
en_hah=[en_h;en_ah];
plot(x,et135,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('135 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 150 graus
figure
en_h=flipud(aa150(:,4)); en_ah=(aa150(:,5));
en_hah=[en_h;en_ah];
plot(x,et150,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('150 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%Onda de 180 graus
figure
en_h=flipud(aa180(:,4)); en_ah=(aa180(:,5));
en_hah=[en_h;en_ah];
plot(x,et180,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('180 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%% Plot da dispersão de Vx,Vy
figure
plot(vx0,vy0,'.'), title('0 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
figure
plot(vx90,vy90,'.'), title('90 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal
figure
plot(vx180,vy180,'.'), title('180 graus'),xlabel('Vel x'),ylabel('Vel y'), axis equal

%% Plot do somatório do espectro horario e anti-horário para mares cruzados a fim de comparar com o espectro total
% mar cruzado 'b'
%soma o espectro anti-horário de 45 graus com a horári de 135
soma_b=aa45(:,5)+aa135(:,4);
figure
plot(aab(:,1),aab(:,6),'linewidth',2), hold on
plot(aab(:,1),soma_b,'r'), hold off, legend('Espectro total','Espec hor(135)+anti-hor(45)')
title('Espectro total do mar cruzado e hor+anti-hor para 135 e 45')

%% Plot do espectro horário, anti-horário e total para mares cruzados de mesma frequencaia

% mar cruzado a (0+90)
figure
en_h=flipud(aaa(:,4)); en_ah=(aaa(:,5));
en_hah=[en_h;en_ah];
plot(x,eta,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('0+90 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
% x2=linspace(0,0,25);
% y2=1:25;
plot(x1,y1,'k','linewidth',2), axis tight
hold off

% mar cruzado b (90+180)
figure
en_h=flipud(aab(:,4)); en_ah=(aab(:,5));
en_hah=[en_h;en_ah];
plot(x,etb,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('90+180 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

% mar cruzado c (0+180)
figure
en_h=flipud(aac(:,4)); en_ah=(aac(:,5));
en_hah=[en_h;en_ah];
plot(x,etc,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('0+180 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
% x2=linspace(0,0,25);
% y2=1:25;
plot(x1,y1,'k','linewidth',2), axis tight
hold off

% mar cruzado d (45+135)
figure
en_h=flipud(aad(:,4)); en_ah=(aad(:,5));
en_hah=[en_h;en_ah];
plot(x,etd,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('45+135 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

% mar cruzado e (30+60)
figure
en_h=flipud(aae(:,4)); en_ah=(aae(:,5));
en_hah=[en_h;en_ah];
plot(x,ete,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('30+60 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

% mar cruzado f (120+150)
figure
en_h=flipud(aaf(:,4)); en_ah=(aaf(:,5));
en_hah=[en_h;en_ah];
plot(x,etf,'g','linewidth',2), grid on, hold on
plot(x,en_hah,'r-.','linewidth',1.5), grid on
legend('Espec. Total','Horário/Anti-Horário')
title('120+150 graus - Vy,Vz')
xlabel('Frequência (Hz)'), ylabel('(m/s)^2/Hz')
text(-0.5,13,'Espec. Horário (-)'),text(0.2,13,'Espec. Anti-Horário (+)')

hold on
plot(x1,y1,'k','linewidth',2), axis tight
hold off

%% Plot de VxVz e VyVz no mesmo gráfico, utilizando o flipud
%mar cruzado 'a'
figure
n=15;
plot(vxa(1:n),vza(1:n),'b*-'), hold on
plot(vya(1:n),vza(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 0+90 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxa(i,1),vza(i,1),['p',n])    
    text(vya(i,1),vza(i,1),['p',n])     
end
hold off

%mar cruzado 'b'
figure
n=15;
plot(vxb(1:n),vzb(1:n),'b*-'), hold on
plot(vyb(1:n),vzb(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 90+180 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxb(i,1),vzb(i,1),['p',n])    
    text(vyb(i,1),vzb(i,1),['p',n])     
end
hold off

%mar cruzado 'c'
figure
n=15;
plot(vxc(1:n),vzc(1:n),'b*-'), hold on
plot(vyc(1:n),vzc(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 0+180 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxc(i,1),vzc(i,1),['p',n])    
    text(vyc(i,1),vzc(i,1),['p',n])     
end
hold off

%mar cruzado 'd'
figure
n=15;
plot(vxd(1:n),vzd(1:n),'b*-'), hold on
plot(vyd(1:n),vzd(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 45+135 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxd(i,1),vzd(i,1),['p',n])    
    text(vyd(i,1),vzd(i,1),['p',n])     
end
hold off

%mar cruzado 'e'
figure
n=15;
plot(vxe(1:n),vze(1:n),'b*-'), hold on
plot(vye(1:n),vze(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 30+60 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxe(i,1),vze(i,1),['p',n])    
    text(vye(i,1),vze(i,1),['p',n])     
end
hold off

%mar cruzado 'f'
figure
n=15;
plot(vxf(1:n),vzf(1:n),'b*-'), hold on
plot(vyf(1:n),vzf(1:n),'r*-'), axis equal
legend('VxVz','VyVz'), xlabel('Vel.x , Vel.y'), ylabel('Vel.z'), title('Velocidade orbital - mar cruzado de 120+150 graus')

k=0;
for i=1:n
    k=k+1;
    n=num2str(k);
    text(vxf(i,1),vzf(i,1),['p',n])    
    text(vyf(i,1),vzf(i,1),['p',n])     
end
hold off