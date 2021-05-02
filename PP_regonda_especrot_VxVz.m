%% Calculo do espectro rotatorio nas componentes Vx e Vz para direções de
%% 0, 30, 45, 60, 90, 120, 135, 150 e 180 graus.
clear,clc,close all
%Periodo de 12 segundos

nm=1;
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
    
    %% Chama subrotina do espectro rotatório para ondas vindas de 0 graus
    %Registro de 0 graus

    vx0=reg0(:,2); %Vx
    vy0=reg0(:,3); %Vy
    vz0=reg0(:,4); %Vz
    dt=1;

    [aa0]=Especrot(vx0,vz0,dt);

    figure
    subplot(3,1,1)
    plot(aa0(:,1),aa0(:,2),'b'), hold on %autoespec de x
    plot(aa0(:,1),aa0(:,3),'r')           %autoespec de z
    plot(aa0(:,1),aa0(:,6),'g'), hold off %espectro total
    title('Ondas de 0 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa0(:,1),aa0(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa0(:,1),aa0(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 30 graus
    %Registro de 30 graus

    vx30=reg30(:,2); %Vx
    vy30=reg30(:,3); %Vy
    vz30=reg30(:,4); %Vz
    dt=1;

    [aa30]=Especrot(vx30,vz30,dt);

    figure
    subplot(3,1,1)
    plot(aa30(:,1),aa30(:,2),'b'), hold on %autoespec de x
    plot(aa30(:,1),aa30(:,3),'r')           %autoespec de z
    plot(aa30(:,1),aa30(:,6),'g'), hold off %espectro total
    title('Ondas de 30 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa30(:,1),aa30(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa30(:,1),aa30(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 45 graus
    %Registro de 45 graus

    vx45=reg45(:,2); %Vx
    vy45=reg45(:,3); %Vy
    vz45=reg45(:,4); %Vz
    dt=1;

    [aa45]=Especrot(vx45,vz45,dt);

    figure
    subplot(3,1,1)
    plot(aa45(:,1),aa45(:,2),'b'), hold on 
    plot(aa45(:,1),aa45(:,3),'r')
    plot(aa45(:,1),aa45(:,6),'g'), hold off
    title('Ondas de 45 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa45(:,1),aa45(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa45(:,1),aa45(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 60 graus
    %Registro de 60 graus

    vx60=reg60(:,2); %Vx
    vy60=reg60(:,3); %Vy
    vz60=reg60(:,4); %Vz
    dt=1;

    [aa60]=Especrot(vx60,vz60,dt);

    figure
    subplot(3,1,1)
    plot(aa60(:,1),aa60(:,2),'b'), hold on %autoespec de x
    plot(aa60(:,1),aa60(:,3),'r')           %autoespec de z
    plot(aa60(:,1),aa60(:,6),'g'), hold off %espectro total
    title('Ondas de 60 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa60(:,1),aa60(:,4))
    title('Espectro horário - (VxVz)'),ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa60(:,1),aa60(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 90 graus
    %Registro de 90 graus

    vx90=reg90(:,2); %Vx
    vy90=reg90(:,3); %Vy
    vz90=reg90(:,4); %Vz
    dt=1;

    [aa90]=Especrot(vx90,vz90,dt);

    figure
    subplot(3,1,1)
    plot(aa90(:,1),aa90(:,2),'b'), hold on 
    plot(aa90(:,1),aa90(:,3),'r')
    plot(aa90(:,1),aa90(:,6),'g'), hold off
    title('Ondas de 90 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa90(:,1),aa90(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa90(:,1),aa90(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 120 graus
    %Registro de 120 graus

    vx120=reg120(:,2); %Vx
    vy120=reg120(:,3); %Vy
    vz120=reg120(:,4); %Vz
    dt=1;

    [aa120]=Especrot(vx120,vz120,dt);

    figure
    subplot(3,1,1)
    plot(aa120(:,1),aa120(:,2),'b'), hold on %autoespec de x
    plot(aa120(:,1),aa120(:,3),'r')           %autoespec de z
    plot(aa120(:,1),aa120(:,6),'g'), hold off %espectro total
    title('Ondas de 120 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa120(:,1),aa120(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa120(:,1),aa120(:,5))
    title('Espectro anti-horário - (VxVz)'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 135 graus
    %Registro de 135 graus

    vx135=reg135(:,2); %Vx
    vy135=reg135(:,3); %Vy
    vz135=reg135(:,4); %Vz
    dt=1;

    [aa135]=Especrot(vx135,vz135,dt);

    figure
    subplot(3,1,1)
    plot(aa135(:,1),aa135(:,2),'b'), hold on 
    plot(aa135(:,1),aa135(:,3),'r')
    plot(aa135(:,1),aa135(:,6),'g'), hold off
    title('Ondas de 135 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa135(:,1),aa135(:,4))
    title('Espectro horário - (VxVz)'),ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa135(:,1),aa135(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 150 graus
    %Registro de 150 graus

    vx150=reg150(:,2); %Vx
    vy150=reg150(:,3); %Vy
    vz150=reg150(:,4); %Vz
    dt=1;

    [aa150]=Especrot(vx150,vz150,dt);

    figure
    subplot(3,1,1)
    plot(aa150(:,1),aa150(:,2),'b'), hold on %autoespec de x
    plot(aa150(:,1),aa150(:,3),'r')           %autoespec de z
    plot(aa150(:,1),aa150(:,6),'g'), hold off %espectro total
    title('Ondas de 150 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa150(:,1),aa150(:,4))
    title('Espectro horário - (VxVz)'),ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa150(:,1),aa150(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Chama subrotina do espectro rotatório para ondas vindas de 180 graus
    %Registro de 180 graus

    vx180=reg180(:,2); %Vx
    vy180=reg180(:,3); %Vy
    vz180=reg180(:,4); %Vz
    dt=1;

    [aa180]=Especrot(vx180,vz180,dt);

    figure
    subplot(3,1,1)
    plot(aa180(:,1),aa180(:,2),'b'), hold on 
    plot(aa180(:,1),aa180(:,3),'r')
    plot(aa180(:,1),aa180(:,6),'g'), hold off
    title('Ondas de 180 graus - (VxVz)')
    ylabel('Energia')
    legend('Auto-espec de Vx','Auto-espec de Vz','Espectro total')
    axis tight

    subplot(3,1,2)
    plot(aa180(:,1),aa180(:,4))
    title('Espectro horário - (VxVz)'), ylabel('Energia'), axis tight

    subplot(3,1,3)
    plot(aa180(:,1),aa180(:,5))
    title('Espectro anti-horário - (VxVz)'),xlabel('Frequencia'), ylabel('Energia'), axis tight

    %% Plot do espec total, coef. rotação, dir da elipse, estabilidade da elipse

    % Direção de 0 graus
    figure
    subplot(2,2,1)
    plot(aa0(:,1),aa0(:,6)),grid on %Espectro total
    title('Espectro total - 0 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa0(:,1),aa0(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 0 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa0(:,1),aa0(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 0 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa0(:,1),aa0(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa0(:,1),aa0(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 0 graus - (VxVz)'), axis tight

    % Direção de 30 graus
    figure
    subplot(2,2,1)
    plot(aa30(:,1),aa30(:,6)),grid on %Espectro total
    title('Espectro total - 30 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa30(:,1),aa30(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 30 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa30(:,1),aa30(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 30 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa30(:,1),aa30(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa30(:,1),aa30(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 30 graus - (VxVz)'), axis tight

    % Direção de 45 graus
    figure
    subplot(2,2,1)
    plot(aa45(:,1),aa45(:,6)),grid on %Espectro total
    title('Espectro total - 45 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa45(:,1),aa45(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 45 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa45(:,1),aa45(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 45 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa45(:,1),aa45(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa45(:,1),aa45(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 45 graus - (VxVz)'), axis tight

    % Direção de 60 graus
    figure
    subplot(2,2,1)
    plot(aa60(:,1),aa60(:,6)),grid on %Espectro total
    title('Espectro total - 60 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa60(:,1),aa60(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 60 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa60(:,1),aa60(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 60 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa60(:,1),aa60(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa60(:,1),aa60(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 60 graus - (VxVz)'), axis tight

    % Direção de 90 graus
    figure
    subplot(2,2,1)
    plot(aa90(:,1),aa90(:,6)),grid on %Espectro total
    title('Espectro total - 90 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa90(:,1),aa90(:,8)), grid on %Coef. de rotação
    title('Coef. de Rotação - 90 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa90(:,1),aa90(:,9)), grid on %Direção da elipse
    title('Direção da elipse - 90 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa90(:,1),aa90(:,10)), grid on, hold on %Estabilidade da elipse
    plot(aa90(:,1),aa90(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 90 graus - (VxVz)'), axis tight

    % Direção de 120 graus
    figure
    subplot(2,2,1)
    plot(aa120(:,1),aa120(:,6)),grid on %Espectro total
    title('Espectro total - 120 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa120(:,1),aa120(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 120 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa120(:,1),aa120(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 135 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa120(:,1),aa120(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa120(:,1),aa120(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 120 graus - (VxVz)'), axis tight

    % Direção de 135 graus
    figure
    subplot(2,2,1)
    plot(aa135(:,1),aa135(:,6)),grid on %Espectro total
    title('Espectro total - 135 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa135(:,1),aa135(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 135 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa135(:,1),aa135(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 135 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa135(:,1),aa135(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa135(:,1),aa135(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 135 graus - (VxVz)'), axis tight

    % Direção de 150 graus
    figure
    subplot(2,2,1)
    plot(aa150(:,1),aa150(:,6)),grid on %Espectro total
    title('Espectro total - 150 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa150(:,1),aa150(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 150 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa150(:,1),aa150(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 150 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa150(:,1),aa150(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa150(:,1),aa150(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 150 graus - (VxVz)'), axis tight

    % Direção de 180 graus
    figure
    subplot(2,2,1)
    plot(aa180(:,1),aa180(:,6)),grid on %Espectro total
    title('Espectro total - 180 graus - (VxVz)'), axis tight
    subplot(2,2,2)
    plot(aa180(:,1),aa180(:,8)),grid on %Coef. de rotação
    title('Coef. de Rotação - 180 graus - (VxVz)'), axis tight
    subplot(2,2,3)
    plot(aa180(:,1),aa180(:,9)),grid on %Direção da elipse
    title('Direção da elipse - 180 graus - (VxVz)'), axis tight
    subplot(2,2,4)
    plot(aa180(:,1),aa180(:,10)),grid on,hold on %Estabilidade da elipse
    plot(aa180(:,1),aa180(:,13),'r') %intervalo de confiança
    legend('Estabilidade da elipse','Intervalo de conf.')
    title('Estabilidade da elipse - 180 graus - (VxVz)'), axis tight

    %% Plot da velocidade orbital Vx,Vz
    figure
    subplot(3,3,1)
    plot(vx0,vz0)
    title('Velocidade orbital - 0 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,2)
    plot(vx30,vz30)
    title('Velocidade orbital - 30 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,3)
    plot(vx45,vz45)
    title('Velocidade orbital - 45 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,4)
    plot(vx60,vz60)
    title('Velocidade orbital - 60 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,5)
    plot(vx90,vz90)
    title('Velocidade orbital - 90 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,6)
    plot(vx120,vz120)
    title('Velocidade orbital - 120 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,7)
    plot(vx135,vz135)
    title('Velocidade orbital - 135 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,8)
    plot(vx150,vz150)
    title('Velocidade orbital - 150 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal
    subplot(3,3,9)
    plot(vx180,vz180)
    title('Velocidade orbital - 180 graus'),xlabel('Vel x'),ylabel('Vel z'), axis equal

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

    %% Plot do espectro da diferença

    figure
    subplot(3,3,1)
    plot(aa0(:,1),aa0(:,7)), axis tight
    title('Espectro da diferença - 0 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,2)
    plot(aa30(:,1),aa30(:,7)), axis tight
    title('Espectro da diferença - 30 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,3)
    plot(aa45(:,1),aa45(:,7)), axis tight
    title('Espectro da diferença - 45 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,4)
    plot(aa60(:,1),aa60(:,7)), axis tight
    title('Espectro da diferença - 60 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,5)
    plot(aa90(:,1),aa90(:,7)), axis tight
    title('Espectro da diferença - 90 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,6)
    plot(aa120(:,1),aa120(:,7)), axis tight
    title('Espectro da diferença - 120 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,7)
    plot(aa135(:,1),aa135(:,7)), axis tight
    title('Espectro da diferença - 135 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,8)
    plot(aa150(:,1),aa150(:,7)), axis tight
    title('Espectro da diferença - 150 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')
    subplot(3,3,9)
    plot(aa180(:,1),aa180(:,7)), axis tight
    title('Espectro da diferença - 180 graus - (VxVz)'), xlabel('Frequência'),ylabel('Energia')

    %% Calcula a frequencia de pico e os parâmetros do espectro rotatório para a fp para cada direção
    % a frequencia de pico é calculada a partir do espectro total

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

    %Espectro horário para a frequencia de pico (h)
    h0=aa0(find(aa0(:,6)==max(aa0(:,6))),4);
    h30=aa30(find(aa30(:,6)==max(aa30(:,6))),4);
    h45=aa45(find(aa45(:,6)==max(aa45(:,6))),4);
    h60=aa0(find(aa60(:,6)==max(aa60(:,6))),4);
    h90=aa90(find(aa90(:,6)==max(aa90(:,6))),4);
    h120=aa120(find(aa120(:,6)==max(aa120(:,6))),4);
    h135=aa135(find(aa135(:,6)==max(aa135(:,6))),4);
    h150=aa150(find(aa150(:,6)==max(aa150(:,6))),4);
    h180=aa180(find(aa180(:,6)==max(aa180(:,6))),4);

    %Espectro anti-horário para a frequencia de pico (ah)
    ah0=aa0(find(aa0(:,6)==max(aa0(:,6))),5);
    ah30=aa30(find(aa30(:,6)==max(aa30(:,6))),5);
    ah45=aa45(find(aa45(:,6)==max(aa45(:,6))),5);
    ah60=aa0(find(aa60(:,6)==max(aa60(:,6))),5);
    ah90=aa90(find(aa90(:,6)==max(aa90(:,6))),5);
    ah120=aa120(find(aa120(:,6)==max(aa120(:,6))),5);
    ah135=aa135(find(aa135(:,6)==max(aa135(:,6))),5);
    ah150=aa150(find(aa150(:,6)==max(aa150(:,6))),5);
    ah180=aa180(find(aa180(:,6)==max(aa180(:,6))),5);

    %Espectro da diferença para a frequencia de pico (d)
    d0=aa0(find(aa0(:,6)==max(aa0(:,6))),7);
    d30=aa30(find(aa30(:,6)==max(aa30(:,6))),7);
    d45=aa45(find(aa45(:,6)==max(aa45(:,6))),7);
    d60=aa0(find(aa60(:,6)==max(aa60(:,6))),7);
    d90=aa90(find(aa90(:,6)==max(aa90(:,6))),7);
    d120=aa120(find(aa120(:,6)==max(aa120(:,6))),7);
    d135=aa135(find(aa135(:,6)==max(aa135(:,6))),7);
    d150=aa150(find(aa150(:,6)==max(aa150(:,6))),7);
    d180=aa180(find(aa180(:,6)==max(aa180(:,6))),7);

    %Coeficiente de rotação para a frequencia de pico (cr)
    cr0=aa0(find(aa0(:,6)==max(aa0(:,6))),8);
    cr30=aa30(find(aa30(:,6)==max(aa30(:,6))),8);
    cr45=aa45(find(aa45(:,6)==max(aa45(:,6))),8);
    cr60=aa0(find(aa60(:,6)==max(aa60(:,6))),8);
    cr90=aa90(find(aa90(:,6)==max(aa90(:,6))),8);
    cr120=aa120(find(aa120(:,6)==max(aa120(:,6))),8);
    cr135=aa135(find(aa135(:,6)==max(aa135(:,6))),8);
    cr150=aa150(find(aa150(:,6)==max(aa150(:,6))),8);
    cr180=aa180(find(aa180(:,6)==max(aa180(:,6))),8);

    %% Cria tabela com parâmetros do espectro rotatório para a frequencia de pico
    %dadosrot=[dir fp h ah d cr]

    dadosrot=[0 fp0 h0 ah0 d0 cr0
              30 fp30 h30 ah30 d30 cr30
              45 fp45 h45 ah45 d45 cr45
              60 fp60 h60 ah60 d60 cr60
              90 fp90 h90 ah90 d90 cr90
              120 fp120 h120 ah120 d120 cr120
              135 fp135 h135 ah135 d135 cr135
              150 fp150 h150 ah150 d150 cr150
              180 fp180 h180 ah180 d180 cr180];

    %% Plot dos parâmetros do espectro rotatório para a frequencia de pico
    figure
    subplot(2,2,1)
    plot(dadosrot(:,1),dadosrot(:,3),'-*'), title('Espectro horário - (VxVz)'), xlabel('Direção'),ylabel('Espec.hor')
    subplot(2,2,2)
    plot(dadosrot(:,1),dadosrot(:,4),'-*'), title('Espectro anti-horário - (VxVz)'), xlabel('Direção'),ylabel('Espec.anti-hor')
    subplot(2,2,3)
    plot(dadosrot(:,1),dadosrot(:,5),'-*'), title('Espectro da diferença - (VxVz)'), xlabel('Direção'),ylabel('Espec.dif')
    subplot(2,2,4)
    plot(dadosrot(:,1),dadosrot(:,6),'-*'), title('Coeficiente de rotação - (VxVz)'), xlabel('Direção'),ylabel('Coef.Rot')

    %% Cria matriz para os vários registros
    %cria matriz de direção
    dir=[0 30 45 60 90 120 135 150 180]';
    %cria matriz do espec.horário
    h_mat(:,ii)=[h0 h30 h45 h60 h90 h120 h135 h150 h180]';
    %cria matriz do espec. anti-horário
    h_mat(:,ii)=[ah0 ah30 ah45 ah60 ah90 ah120 ah135 ah150 ah180]';
    %cria matriz do espec.horário
    h_mat(:,ii)=[d0 d30 d45 d60 d90 d120 d135 d150 d180]';
    %cria matriz do espec.horário
    h_mat(:,ii)=[cr0 cr30 cr45 cr60 cr90 cr120 cr135 cr150 cr180]';
end

