%% Calculo do espectro rotatorio nas componentes Vy e Vz para dire��es de
%% 0, 30, 45, 60, 90, 120, 135, 150 e 180 graus.
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
    
    %%%%%%%%%%%
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 0 graus
    %Registro de 0 graus

    vx0=reg0(:,2); %Vx
    vy0=reg0(:,3); %Vy
    vz0=reg0(:,4); %Vz
    dt=1;

    [aa0]=Especrot(vy0,vz0,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 30 graus
    %Registro de 30 graus

    vx30=reg30(:,2); %Vx
    vy30=reg30(:,3); %Vy
    vz30=reg30(:,4); %Vz
    dt=1;

    [aa30]=Especrot(vy30,vz30,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 45 graus
    %Registro de 45 graus

    vx45=reg45(:,2); %Vx
    vy45=reg45(:,3); %Vy
    vz45=reg45(:,4); %Vz
    dt=1;

    [aa45]=Especrot(vy45,vz45,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 60 graus
    %Registro de 60 graus

    vx60=reg60(:,2); %Vx
    vy60=reg60(:,3); %Vy
    vz60=reg60(:,4); %Vz
    dt=1;

    [aa60]=Especrot(vy60,vz60,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 90 graus
    %Registro de 90 graus

    vx90=reg90(:,2); %Vx
    vy90=reg90(:,3); %Vy
    vz90=reg90(:,4); %Vz
    dt=1;

    [aa90]=Especrot(vy90,vz90,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 120 graus
    %Registro de 120 graus

    vx120=reg120(:,2); %Vx
    vy120=reg120(:,3); %Vy
    vz120=reg120(:,4); %Vz
    dt=1;

    [aa120]=Especrot(vy120,vz120,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 135 graus
    %Registro de 135 graus

    vx135=reg135(:,2); %Vx
    vy135=reg135(:,3); %Vy
    vz135=reg135(:,4); %Vz
    dt=1;

    [aa135]=Especrot(vy135,vz135,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 150 graus
    %Registro de 150 graus

    vx150=reg150(:,2); %Vx
    vy150=reg150(:,3); %Vy
    vz150=reg150(:,4); %Vz
    dt=1;

    [aa150]=Especrot(vy150,vz150,dt);
    
    %% Chama subrotina do espectro rotat�rio para ondas vindas de 180 graus
    %Registro de 180 graus

    vx180=reg180(:,2); %Vx
    vy180=reg180(:,3); %Vy
    vz180=reg180(:,4); %Vz
    dt=1;

    [aa180]=Especrot(vy180,vz180,dt);
    
    %% Calcula a frequencia de pico e os par�metros do espectro rotat�rio para a fp para cada dire��o
    % a frequencia de pico � calculada a partir do espectro total

    %Frequencia de pico (fp)
    fp0=aa0(find(aa0(:,6)==max(aa0(:,6))),1);
    fp30=aa30(find(aa30(:,6)==max(aa30(:,6))),1);
    fp45=aa45(find(aa45(:,6)==max(aa45(:,6))),1);
    fp60=aa0(find(aa60(:,6)==max(aa60(:,6))),1);
    fp90=aa90(find(aa90(:,6)==max(aa90(:,6))),1);
    fp120=aa120(find(aa120(:,6)==max(aa120(:,6))),1);
    fp135=aa135(find(aa135(:,6)==max(aa135(:,6))),1);
    fp150=aa150(find(aa150(:,6)==max(aa150(:,6))),1);
    fp180=aa180(find(aa180(:,6)==max(aa180(:,6))),1);

    %Espectro hor�rio para a frequencia de pico (h)
    h0=aa0(find(aa0(:,6)==max(aa0(:,6))),4);
    h30=aa30(find(aa30(:,6)==max(aa30(:,6))),4);
    h45=aa45(find(aa45(:,6)==max(aa45(:,6))),4);
    h60=aa0(find(aa60(:,6)==max(aa60(:,6))),4);
    h90=aa90(find(aa90(:,6)==max(aa90(:,6))),4);
    h120=aa120(find(aa120(:,6)==max(aa120(:,6))),4);
    h135=aa135(find(aa135(:,6)==max(aa135(:,6))),4);
    h150=aa150(find(aa150(:,6)==max(aa150(:,6))),4);
    h180=aa180(find(aa180(:,6)==max(aa180(:,6))),4);

    %Espectro anti-hor�rio para a frequencia de pico (ah)
    ah0=aa0(find(aa0(:,6)==max(aa0(:,6))),5);
    ah30=aa30(find(aa30(:,6)==max(aa30(:,6))),5);
    ah45=aa45(find(aa45(:,6)==max(aa45(:,6))),5);
    ah60=aa0(find(aa60(:,6)==max(aa60(:,6))),5);
    ah90=aa90(find(aa90(:,6)==max(aa90(:,6))),5);
    ah120=aa120(find(aa120(:,6)==max(aa120(:,6))),5);
    ah135=aa135(find(aa135(:,6)==max(aa135(:,6))),5);
    ah150=aa150(find(aa150(:,6)==max(aa150(:,6))),5);
    ah180=aa180(find(aa180(:,6)==max(aa180(:,6))),5);

    %Espectro da diferen�a para a frequencia de pico (d)
    d0=aa0(find(aa0(:,6)==max(aa0(:,6))),7);
    d30=aa30(find(aa30(:,6)==max(aa30(:,6))),7);
    d45=aa45(find(aa45(:,6)==max(aa45(:,6))),7);
    d60=aa0(find(aa60(:,6)==max(aa60(:,6))),7);
    d90=aa90(find(aa90(:,6)==max(aa90(:,6))),7);
    d120=aa120(find(aa120(:,6)==max(aa120(:,6))),7);
    d135=aa135(find(aa135(:,6)==max(aa135(:,6))),7);
    d150=aa150(find(aa150(:,6)==max(aa150(:,6))),7);
    d180=aa180(find(aa180(:,6)==max(aa180(:,6))),7);

    %Coeficiente de rota��o para a frequencia de pico (cr)
    cr0=aa0(find(aa0(:,6)==max(aa0(:,6))),8);
    cr30=aa30(find(aa30(:,6)==max(aa30(:,6))),8);
    cr45=aa45(find(aa45(:,6)==max(aa45(:,6))),8);
    cr60=aa0(find(aa60(:,6)==max(aa60(:,6))),8);
    cr90=aa90(find(aa90(:,6)==max(aa90(:,6))),8);
    cr120=aa120(find(aa120(:,6)==max(aa120(:,6))),8);
    cr135=aa135(find(aa135(:,6)==max(aa135(:,6))),8);
    cr150=aa150(find(aa150(:,6)==max(aa150(:,6))),8);
    cr180=aa180(find(aa180(:,6)==max(aa180(:,6))),8);
    
    %% Cria matriz para os v�rios registros
    %cria matriz de dire��o
    dir=[0 30 45 60 90 120 135 150 180]';
    %cria matriz do espec.hor�rio
    h_mat(ii,:)=[h0 h30 h45 h60 h90 h120 h135 h150 h180]';
    %cria matriz do espec. anti-hor�rio
    ah_mat(ii,:)=[ah0 ah30 ah45 ah60 ah90 ah120 ah135 ah150 ah180]';
    %cria matriz do espec.hor�rio
    d_mat(ii,:)=[d0 d30 d45 d60 d90 d120 d135 d150 d180]';
    %cria matriz do espec.hor�rio
    cr_mat(ii,:)=[cr0 cr30 cr45 cr60 cr90 cr120 cr135 cr150 cr180]';
    
    
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

