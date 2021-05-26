%% Calculo do espectro rotatorio nas componentes Vy e Vz para mares
%% cruzados de a) rega= 30� e 60� / b) regb= 45� e 135� / c) regc= 120� e 150�
%Gera um gr�fico para os conjuntos de onda
clear,clc,close all
%Periodo de 12 segundos

nm=100;
for ii=1:nm
    
    str = num2str(ii);

    %matriz --> registro = [neta',netax',netay',netaxx',netayy',velx',vely',velzzz',pr'];
    reg0 = csvread([str '_registro0.txt']);
    reg30 = csvread([str '_registro30.txt']);
    reg45 = csvread([str '_registro45.txt']);
    reg60 = csvread([str '_registro60.txt']);
    reg90 = csvread([str '_registro90.txt']);
    reg120 = csvread([str '_registro120.txt']);
    reg135 = csvread([str '_registro135.txt']);
    reg150 = csvread([str '_registro150.txt']);
    reg180 = csvread([str '_registro180.txt']);
    
    %% Cria mar cruzado - somat�rio de ondas: a) rega= 30� e 60� / b) regb= 45� e 135� / c) regc= 120� e 150�
    
    rega=reg30+reg60;
    regb=reg45+reg135;
    regc=reg120+reg150;
    
    
    %% Chama subrotina do espectro rotat�rio para mar cruzado 'a'
    %Registro a) rega= 30� e 60�

    vxa=rega(:,2); %Vx
    vya=regb(:,3); %Vy
    vza=regc(:,4); %Vz
    dt=1;

    [aaa]=Especrot(vya,vza,dt);
    
    %% Chama subrotina do espectro rotat�rio para mar cruzado 'b'
    %Registro b) regb= 45� e 135�

    vxb=regb(:,2); %Vx
    vyb=regb(:,3); %Vy
    vzb=regb(:,4); %Vz
    dt=1;

    [aab]=Especrot(vyb,vzb,dt);
    
    %% Chama subrotina do espectro rotat�rio para mar cruzado 'c'
    %Registro c) regb= 120� e 150�

    vxc=regc(:,2); %Vx
    vyc=regc(:,3); %Vy
    vzc=regc(:,4); %Vz
    dt=1;

    [aac]=Especrot(vyc,vzc,dt);
    
    
    %% Calcula a frequencia de pico e os par�metros do espectro rotat�rio para a fp para mar cruzado
    % a frequencia de pico � calculada a partir do espectro total

    %Frequencia de pico (fp)
    fpa=aaa(find(aaa(:,6)==max(aaa(:,6))),1);
    fpb=aab(find(aab(:,6)==max(aab(:,6))),1);
    fpc=aac(find(aac(:,6)==max(aac(:,6))),1);

    %Espectro hor�rio para a frequencia de pico (h)
    ha=aaa(find(aaa(:,6)==max(aaa(:,6))),4);
    hb=aab(find(aab(:,6)==max(aab(:,6))),4);
    hc=aac(find(aac(:,6)==max(aac(:,6))),4);
    
    %Espectro anti-hor�rio para a frequencia de pico (ah)
    aha=aaa(find(aaa(:,6)==max(aaa(:,6))),5);
    ahb=aab(find(aab(:,6)==max(aab(:,6))),5);
    ahc=aac(find(aac(:,6)==max(aac(:,6))),5);
    
    %Espectro da diferen�a para a frequencia de pico (d)
    da=aaa(find(aaa(:,6)==max(aaa(:,6))),7);
    db=aab(find(aab(:,6)==max(aab(:,6))),7);
    dc=aac(find(aac(:,6)==max(aac(:,6))),7);

    %Coeficiente de rota��o para a frequencia de pico (cr)
    cra=aaa(find(aaa(:,6)==max(aaa(:,6))),8);
    crb=aab(find(aab(:,6)==max(aab(:,6))),8);
    crc=aac(find(aac(:,6)==max(aac(:,6))),8);
    
    %% Cria matriz para os v�rios registros
    %cria matriz de dire��o (1=mar 'a', 2=mar 'b', 3=mar 'c')
    dir=[1 2 3]';
    %cria matriz do espec.hor�rio
    h_mat(ii,:)=[ha hb hc]';
    %cria matriz do espec. anti-hor�rio
    ah_mat(ii,:)=[aha ahb ahc]';
    %cria matriz do espec.hor�rio
    d_mat(ii,:)=[da db dc]';
    %cria matriz do espec.hor�rio
    cr_mat(ii,:)=[cra crb crc]';
    
    
end

%% Plot dos par�metros da espec.rot para fp
figure
plot(dir,h_mat,'-*'), title('Espectro hor�rio para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
figure
plot(dir,ah_mat,'-*'), title('Espectro anti-hor�rio para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
figure
plot(dir,d_mat,'-*'), title('Espectro da diferen�a para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
figure
plot(dir,cr_mat,'-*'), title('Coeficiente de Rota��o para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')

%% Calcula a m�dia e desvio padr�o dos parametros nos 100 registros
%m�dia
h_med=mean(h_mat);
ah_med=mean(ah_mat);
d_med=mean(d_mat);
cr_med=mean(cr_mat);
%desvio padr�o
h_dp=std(h_mat);
ah_dp=std(ah_mat);
d_dp=std(d_mat);
cr_dp=std(cr_mat);

% Cria g�fico com a m�dia e desvio padr�o
dpp_h=h_med+h_dp;
dpn_h=h_med-h_dp;
dpp_ah=ah_med+ah_dp;
dpn_ah=ah_med-ah_dp;
dpp_d=d_med+d_dp;
dpn_d=d_med-d_dp;
dpp_cr=cr_med+cr_dp;
dpn_cr=cr_med-cr_dp;

figure
plot(dir,h_med,'-*')
title('Espectro hor�rio (m�dia) - (Vy,Vz)'), xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,dpp_h,'r--',dir,dpn_h,'r--'), hold off, legend('M�dia','Des. Pad')
figure
plot(dir,ah_med,'-*')
title('Espectro anti-hor�rio (m�dia) - (Vy,Vz)'), xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,dpp_ah,'r--',dir,dpn_ah,'r--'), hold off, legend('M�dia','Des. Pad')
figure
plot(dir,d_med,'-*')
title('Espectro da diferen�a (m�dia) - (Vy,Vz)'), xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,dpp_d,'r--',dir,dpn_d,'r--'), hold off, legend('M�dia','Des. Pad')
figure
plot(dir,cr_med,'-*')
title('Coeficiente de rota��o (m�dia) - (Vy,Vz)'), xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,dpp_cr,'r--',dir,dpn_cr,'r--'), hold off, legend('M�dia','Des. Pad')

figure
plot(dir,h_med,'-*',dir,ah_med,'-*')
title('Espectro hor�rio e anti-hor�rio (m�dia) - (Vy,Vz)'),legend('espec. hor','espec. anti-hor'), xlabel('Dire��o'),ylabel('Energia')

%% 
% figure
% plot(dir,h_med)
% title('Espectro hor�rio (m�dia)'), xlabel('Dire��o'),ylabel('Energia')
% figure
% plot(dir,ah_med)
% title('Espectro anti-hor�rio (m�dia)'), xlabel('Dire��o'),ylabel('Energia')
% figure
% plot(dir,d_med)
% title('Espectro da diferen�a (m�dia)'), xlabel('Dire��o'),ylabel('Energia')
% figure
% plot(dir,cr_med)
% title('Coeficiente de rota��o (m�dia)'), xlabel('Dire��o'),ylabel('Energia')
% figure
% plot(dir,h_med,'-*',dir,ah_med,'-*')
% title('Espectro hor�rio e anti-hor�rio (m�dia)'),legend('espec. hor','espec. anti-hor'), xlabel('Dire��o'),ylabel('Energia')

%% Plot dos par�metros da espec.rot para fp com a m�dia
figure
subplot(2,2,1)
plot(dir,h_mat,'*'), title('Espectro hor�rio para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,h_med,'r'), hold off
subplot(2,2,2)
plot(dir,ah_mat,'*'), title('Espectro anti-hor�rio para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,ah_med,'r'), hold off
subplot(2,2,3)
plot(dir,d_mat,'*'), title('Espectro da diferen�a para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,d_med,'r'), hold off
subplot(2,2,4)
plot(dir,cr_mat,'*'), title('Coeficiente de Rota��o para frequ�ncia de pico - 100 reg. (Vy,Vz)'),xlabel('Dire��o'),ylabel('Energia')
hold on, plot(dir,cr_med,'r'), hold off

