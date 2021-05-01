%% C�lculo da dire��o do somat�rio de ondas com frequencias iguais e diferentes dire��es
clear,clc,close all

onda30=load('registro30f.txt'); %Tp=12 segundos
onda60=load('registro150f.txt'); %Tp=12 segundos

somaonda=onda30+onda60;
%coluna 1-neta - eleva��o
%  "    2-netax - inclina��o em x
%  "    3-netay - inclina��o em y
%  "    4-netaxx - curvatura em x
%  "    5-netayy - curvatura em y
%  "    6-velx - velocidade horizontal em x
%  "    7-vely - velocidade horizontal em y
%  "    8-velzzz - velocidade vertical (Dpot.vel/Dz) (utilizar esta pois varia com o z e � maios parecida com a velz quando z=0)
%  "    9-pr - press�o (peso especifico = 1.025 g/cm^3)

%% Criando vari�veis com os par�metros de ondas somadas
neta=somaonda(:,1)';
velx=somaonda(:,6)';
vely=somaonda(:,7)';
velz=somaonda(:,8)';
pr=somaonda(:,9)';
dt=1;

%% Plot das s�ries de eta, velx, vely e velz
figure
subplot(3,1,1)
plot(onda30(:,1)), hold on
plot(onda30(:,6),'r')
plot(onda30(:,7),'k')
plot(onda30(:,8),'g'),hold off, axis tight
title('S�rie de onda - 30 graus'),xlabel('Tempo (registros)'),ylabel('(m) ; (m/s)')
legend('Eta','Vel x','Vel y','Vel z')

subplot(3,1,2)
plot(onda60(:,1)),hold on
plot(onda60(:,6),'r')
plot(onda60(:,7),'k')
plot(onda60(:,8),'g'),hold off, axis tight
title('S�rie de onda - 60 graus'),xlabel('Tempo (registros)'),ylabel('(m) ; (m/s)')
legend('Eta','Vel x','Vel y','Vel z')

subplot(3,1,3)
plot(neta),hold on
plot(velx,'r')
plot(vely,'k')
plot(velz,'g'),hold off, axis tight
title('S�rie de ondas somadas'),xlabel('Tempo (registros)'),ylabel('(m) ; (m/s)')
legend('Eta','Vel x','Vel y','Vel z')

%% Plot do eta com a press�o para as duas dire��es
figure
subplot(2,1,1)
[AX,H1,H2]=plotyy(1:length(onda30),onda30(:,1),1:length(onda30),onda30(:,9),'plot');
set(get(AX(1),'Ylabel'),'String','Eta (m)') ;
set(get(AX(2),'Ylabel'),'String','Press�o (mbar)'); 
title('S�rie da Eleva��o e Press�o para ondas de 30 graus e Tp igual a 12 segundos') 
subplot(2,1,2)
[AX,H1,H2]=plotyy(1:length(onda60),onda60(:,1),1:length(onda60),onda60(:,9),'plot');
set(get(AX(1),'Ylabel'),'String','Eta (m)') ;
set(get(AX(2),'Ylabel'),'String','Press�o (mbar)'); 
title('S�rie da Eleva��o e Press�o para ondas de 60 graus e Tp de 12 segundos') 

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
plot(aaxp(:,1),aaxp(:,3),'m') %auto-espec da press�o
title('Auto-Espectro'),xlabel('Frequ�ncia'),ylabel('Energia')
legend('Press�o')
subplot(2,1,2)
hold on
plot(aaeta(:,1),aaeta(:,2),'b') %auto-espec de eta
plot(aaxy(:,1),aaxy(:,2),'r') %auto-espec de vel x
plot(aaxy(:,1),aaxy(:,3),'k') %auto-espec de vel y
plot(aaxz(:,1),aaxz(:,3),'g') %auto-espec de vel z
legend('Eta','Vel x','Vel y','Vel z')
title('Auto-Espectro'),xlabel('Frequ�ncia'),ylabel('Energia')
hold off

%% Vari�veis de entrada para a rotina 'numeronda'
%deltat
deltat=1;
%Profundidade
h=200;
%Cota
z=0;
%Comprimento da s�rie
reg=length(neta);
%Comprimento da matriz do espectro da s�rie (reg/2)
reg2=reg/2;
%Frequencia de corte
fc=1/(2*deltat);
%Vetor de frequencia
deltaf=(fc*2/reg:fc*2/reg:fc)';

%% Chama subrotina numonda (vari�vel de sa�da - 'k')
[k]=numeronda(h,deltaf,reg2)'; 
figure
plot(deltaf,k)
title(['N�mero de onda (k) para h=',num2str(h),' e z=',num2str(z)]),xlabel('Frequ�ncia'),ylabel('k')

%% Calcular a fun��o de transfer�ncia de Vx, Vy e Vz e P para cada frequencia
%Calculo para Vx
for i=1:length(velx)/2
    U(i,1)=2*pi*deltaf(i,1)*((cosh(k(i,1)*(h+z)))/(sinh(k(i,1)*h)));
end

%Calculo para Vy (Vx=Vy)
V=U;

%Calculo para Vz
for i=1:length(velz)/2
    W(i,1)=2*pi*deltaf(i,1)*((sinh(k(i,1)*(h+z)))/(sinh(k(i,1)*h)));
end

%Calculo para Press�o
for i=1:length(pr)/2
    P(i,1)=((cosh(k(i,1)*(h+z)))/cosh(k(i,1)*h));
end

figure
plot(deltaf,U,'r','linewidth',1.5),hold on
plot(deltaf,V,'k')
plot(deltaf,W,'g')
plot(deltaf,P,'y'), hold off
title(['Fun��o de transferencia de U, V, W e P para h=',num2str(h),' e z=',num2str(z)]),xlabel('Frequ�ncia'),ylabel('U, V, W e P')
legend('U','V','W','P')
    
%% Calcula o Espectro simples (S(f)) com a fun��o de transfer�ncia
%Cria vari�veis com os co-espectros (calculados pela espec2)
cuu=aaxy(:,2); %auto-espec de U (mesma coisa que o co-espec de U e U)
cvv=aaxy(:,3); %auto-espec de V (mesma coisa que o co-espec de V e V)
cww=aaxz(:,3); %auto-espec de W (mesma coisa que o co-espec de W e W)
cpp=aaxp(:,3); %auto-espec de P (mesma coisa que o co-espec de P E P)
cup=aaxp(:,4); %co-espec de U e P
cvp=aayp(:,4); %co-espec de W e P

%Fun��o de transfer�ncia ao quadrado
U2=U.^2;
V2=V.^2;
W2=W.^2;
P2=P.^2;

%Calculo de S(f) com a fun��o de transfer�ncia de 2 formas
sf1=(cuu./U2)+(cvv./V2); %auto-espec vel x e vel y (fun��o de trasferencia) forma do papaer rapport - utilizando vel u e v
sf11=(cuu+cvv)./U2; %auto-espec vel x e vel y (fun��o de trasferencia) forma do relatorio do joao - utilizando vel u e v
sf2=cww./W2; %igual nos 2 papers - utiliza a velz 
sf3=cpp./P2; %igual nos 2 papers - utiliza a press�o

%Plot para comparar S(f) simples e S(f) utilizando a fun��o de transfer�ncia
figure
subplot(2,1,1)
hold on
plot(aaeta(:,1),aaeta(:,2),'b') %auto-espectro eta
plot(aaxy(:,1),aaxy(:,2),'r') %auto-espec de vel x
plot(aaxy(:,1),aaxy(:,3),'k') %auto-espec de vel y
plot(aaxz(:,1),aaxz(:,3),'g') %auto-espec de vel z
%plot(aaxp(:,1),aaxp(:,3),'y') %auto-espec da press�o
legend('Eta','Vel x','Vel y','Vel z','Press�o')
title('Auto-Espectro'),xlabel('Frequ�ncia'),ylabel('Energia')
hold off
subplot(2,1,2)
hold on
plot(deltaf,sf1,'b','linewidth',1.5), hold on
plot(deltaf,sf11,'r')
plot(deltaf,sf2,'g')
%plot(deltaf,sf3,'y')
hold off
title('Auto-espectro utilizando a fun��o de transfer�ncia'), xlabel('Frequ�ncia'),ylabel('Energia')
legend('U e V - 1','U e V - 2','W','P')
hold off

%% Filtra as altas e baixas frequ�ncias dos espectros com fun��o de transfer�ncia 
% % Retira os valores de energia nas freq�encias menores que 0.04 (25 seg) e maiores que 0.25 (4 seg)
% sf1_corr=sf1;
% sf11_corr=sf11;
% sf2_corr=sf2;
% sf3_corr=sf3;
% 
% for i=1:length(sf1)
%     if deltaf(i,1)<0.04
%         
%         sf1_corr(i,1)=0;
%         sf11_corr(i,1)=0;
%         sf2_corr(i,1)=0;
%         sf3_corr(i,1)=0;
%         
%     elseif deltaf(i,1)>0.25
%         
%         sf1_corr(i,1)=0;
%         sf11_corr(i,1)=0;
%         sf2_corr(i,1)=0;
%         sf3_corr(i,1)=0;
%         
%     end
% end
% 
% %Plot do auto-espectro filtrando as altas e baixas frequ�ncias
% figure
% plot(deltaf,sf1_corr,'b','linewidth',1.5), hold on
% plot(deltaf,sf11_corr,'r')
% plot(deltaf,sf2_corr,'k')
% plot(deltaf,sf3_corr,'g'), hold off
% title('Auto-espectro utilizando a fun��o de transfer�ncia FILTRADO em 0.25<f<0.04'), xlabel('Frequ�ncia'),ylabel('S(f)')
% legend('Rapport (U e V)','Rel. joao (U e V)','W','P')

%% C�lculo dos coeficientes 'a1' e 'b1'

for i=1:length(deltaf)
    
    a1(i,1)=cup(i,1)/(U(i,1)*P(i,1)*aaeta(i,2)*pi);
    
    b1(i,1)=cvp(i,1)/(V(i,1)*P(i,1)*aaeta(i,2)*pi);
    
end
    
%% C�lculo da dire��o m�dia em radianos

for i=1:length(deltaf)
    
    dirrad(i,1)=atan(b1(i,1)/a1(i,1));
    
end

%Passa de rad. para grau
dirt=dirrad.*(180/pi);

%Plot da dire��o em arco trigonom�trico
% figure
% subplot(2,1,1)
% plot(deltaf,sf1_corr,'b','linewidth',1.5), hold on
% plot(deltaf,sf11_corr,'r')
% plot(deltaf,sf2_corr,'k')
% plot(deltaf,sf3_corr,'g'), hold off
% title('Auto-espectro utilizando a fun��o de transfer�ncia FILTRADO em 0.25<f<0.04'), xlabel('Frequ�ncia'),ylabel('S(f)')
% legend('Rapport (U e V)','Rel. joao (U e V)','W','P')
% subplot(2,1,2)
% plot(deltaf,dirgrau)
% title('Dire��o (trigonom�trico)'),xlabel('Frequ�ncia'),ylabel('Dire��o')

%% Fun��o de corre��o angular - Transforma de trigonom�trico para azimute
%Chama subrotina para corre��o angular
[diraz]=trig_para_azim(dirt);

%Plot da dire��o em azimute
figure
subplot(2,1,1)
plot(deltaf,aaeta(:,2)),hold on, plot(deltaf(89,1),aaeta(89,2),'ro'), hold off;
title('Auto-Espectro da Eleva��o'), xlabel('Frequ�ncia'),ylabel('Energia')
subplot(2,1,2)
plot(deltaf,diraz),hold on, plot(deltaf(89,1),diraz(89,1),'ro'), hold off;
title('Dire��o (azimute)'),xlabel('Frequ�ncia'),ylabel('Dire��o (graus)')

%% Calcula par�metros de onda
%Periodo de pico no espectro de eta
fp=aaeta(find(aaeta(:,2)==max(aaeta(:,2))),1);
linha_fp=find(deltaf==fp);

tp=1/fp;
%Altura Hm0 calculado pela espectro de eta
df=deltaf(2)-deltaf(1);
m0=0;

%Integral do espec de eta
for i=1:length(aaeta)
    m0=m0+(aaeta(i,2)*df);
end

%Calculo da alt. sig, usando  momento espectral zero
Hm0=4.01*sqrt(m0);

%cria matriz para [f diraz] para o c�lculo da dire��o de pico
fdir=[deltaf,diraz];
%Dire��o de pico
dirtp=fdir(find(fdir(:,1)==fp),2);

%% Chama subrotina cos2s
% [Gs,ht,Gsi,hti,s1,s1p,g0]=FEA_cos2s(deltaf,a1,b1,diraz,dirrad,dirtp,fp,dt);
% 
% %% Plot do s1 em fun��o da frequ�ncia
% figure
% subplot(2,1,1)
% plot(deltaf,aaeta(:,2))
% title('Auto-Espectro de Eta'), xlabel('Frequ�ncia'),ylabel('S(f)')
% subplot(2,1,2)
% plot(deltaf,s1)
% title('Par�metro de Espalhamento angular �s1�'),xlabel('Frequ�ncia'),ylabel('s1')
% 
% %% Filtra as frequ�ncia que n�o tem mais energia
% diraz_corr=diraz;
% ht_corr=ht;
% dti_corr=hti;
% s1_corr=s1;
% en_eta=aaeta(:,2);
% en_eta_corr=en_eta;
% 
% for i=1:length(deltaf)
%     if deltaf(i,1)<0.04
%         
%         diraz_corr(i,1)=0;
%         ht_corr(i,1)=0;
%         dti_corr(i,1)=0;
%         en_eta_corr(i,1)=0;
%         s1_corr(i,1)=0;
%         
%     elseif deltaf(i,1)>0.25
%         
%         diraz_corr(i,1)=0;
%         ht_corr(i,1)=0;
%         dti_corr(i,1)=0;
%         en_eta_corr(i,1)=0;
%         s1_corr(i,1)=0;
%         
%     end
% end
% 
% %% Plot do s1 em fun��o da frequ�ncia
% % figure
% % subplot(2,1,1)
% % plot(deltaf,en_eta_corr)
% % title('Auto-Espectro de Eta'), xlabel('Frequ�ncia'),ylabel('S(f)')
% % subplot(2,1,2)
% % plot(deltaf,s1_corr)
% % title('Par�metro de Espalhamento angular �s1�'),xlabel('Frequ�ncia'),ylabel('s1')
