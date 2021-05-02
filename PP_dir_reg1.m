%% Programa para cálculo da direção das varias ondas geradas pela rotina 'geraonda3'
clear,clc,close all

%% nm = número de registros
nm = 3;
for ii = 1:nm
    str = num2str(ii);
    dados = csvread([str '_registro45.txt']);
    %Cria variáveis com os parâmetros de onda
    neta = dados(:,1);
    netax = dados(:,2);
    netay = dados(:,3);
    netaxx = dados(:,4);
    netayy = dados(:,5);
    velx = dados(:,6);
    vely = dados(:,7);
    velz = dados(:,8);velzzz=velz;
    pr = dados(:,9);
    
    %Inicializaçao de constantes
    
    dt=1;
    h=200;
    z=0;
    g=9.81;
    d=1025; %(1.025 = g/cm^3) (1025 = kg/m^3)
    
    %% Espectros
    [aaeta]=espec(neta',dt); %Espec. de neta
    [aaxy]=espec2(velx',vely',dt); %Espec. cruzado entre 'Vx' e 'Vy'
    [aaxz]=espec2(velx',velzzz',dt); %Espec. cruzado entre 'Vx' e 'Vz'
    [aayz]=espec2(vely',velzzz',dt); %Espec. cruzado entre 'Vy' e 'Vz'
    [aaxp]=espec2(velx',pr',dt); %Espec. cruzado entre 'Vx' e 'pressão'
    [aayp]=espec2(vely',pr',dt); %Espec. cruzado entre 'Vy' e 'pressão'

    %% Variáveis de entrada para a rotina 'numeronda'
    %deltat
    deltat=1;
    %Profundidade
    %h=200; %Vem da subrotina geraonda3
    %Cota
    %z=0; %Vem da subrotina geraonda3
    %Comprimento da série
    reg=length(neta);
    %Comprimento da matriz do espectro da série (reg/2)
    reg2=reg/2;
    %Frequencia de corte
    fc=1/(2*deltat);
    %Vetor de frequencia
    deltaf=(fc*2/reg:fc*2/reg:fc)';

    %% Chama subrotina numonda (variável de saída - 'k')
    [k]=numeronda(h,deltaf,reg2)'; 
    %% Calcular a função de transferência de Vx, Vy e Vz e P para cada frequencia
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

    %Calculo para Pressão
    for i=1:length(pr)/2
        P(i,1)=d*g*((cosh(k(i,1)*(h+z)))/cosh(k(i,1)*h));
    end

    %% Calcula o Espectro simples (S(f)) com a função de transferência
    %Cria variáveis com os co-espectros (calculados pela espec2)
    cuu=aaxy(:,2); %auto-espec de U (mesma coisa que o co-espec de U e U)
    cvv=aaxy(:,3); %auto-espec de V (mesma coisa que o co-espec de V e V)
    cww=aaxz(:,3); %auto-espec de W (mesma coisa que o co-espec de W e W)
    cpp=aaxp(:,3); %auto-espec de P (mesma coisa que o co-espec de P E P)
    cup=aaxp(:,4); %co-espec de U e P
    cvp=aayp(:,4); %co-espec de W e P

    %Função de transferência ao quadrado
    U2=U.^2;
    V2=V.^2;
    W2=W.^2;
    P2=P.^2;

    %Calculo de S(f) com a função de transferência de 2 formas
    sf1=(cuu./U2)+(cvv./V2); %auto-espec vel x e vel y (função de trasferencia) forma do papaer rapport - utilizando vel u e v
    sf11=(cuu+cvv)./U2; %auto-espec vel x e vel y (função de trasferencia) forma do relatorio do joao - utilizando vel u e v
    sf2=cww./W2; %igual nos 2 papers - utiliza a velz 
    sf3=cpp./P2; %igual nos 2 papers - utiliza a pressão

    %% Filtra as altas e baixas frequências dos espectros com função de transferência 
    % Filtra as frequência que não tem mais energia
    % Retira os valores de energia nas freqûencias menores que 0.04 (25 seg) e maiores que 0.2 (5 seg)
    sf1_corr=sf1;
    sf11_corr=sf11;
    sf2_corr=sf2;
    sf3_corr=sf3;

    for i=1:length(sf1)
        if deltaf(i,1)<0.04

            sf1_corr(i,1)=0;
            sf11_corr(i,1)=0;
            sf2_corr(i,1)=0;
            sf3_corr(i,1)=0;


        elseif deltaf(i,1)>0.2

            sf1_corr(i,1)=0;
            sf11_corr(i,1)=0;
            sf2_corr(i,1)=0;
            sf3_corr(i,1)=0;

        end
    end

    %% Cálculo dos coeficientes 'a1' e 'b1'

    for i=1:length(deltaf)

        a1(i,1)=cup(i,1)/(U(i,1)*P(i,1)*aaeta(i,2)*pi);

        b1(i,1)=cvp(i,1)/(V(i,1)*P(i,1)*aaeta(i,2)*pi);

    end

    %% Cálculo da direção média em radianos

    for i=1:length(deltaf)

        dirrad(i,1)=atan(b1(i,1)/a1(i,1));

    end

    %Passa de rad. para grau
    dirt=dirrad.*(180/pi);

    %% Função de correção angular - Transforma de trigonométrico para azimute
    %Chama subrotina para correção angular
    [diraz]=trig_para_azim(dirt);

    %% Calcula parâmetros de onda
    %Periodo de pico no espectro de eta
    fp=aaeta(find(aaeta(:,2)==max(aaeta(:,2))),1);
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

    %cria matriz para [f diraz] para o cálculo da direção de pico
    fdir=[deltaf,diraz];
    %Direção de pico
    dirtp=fdir(find(fdir(:,1)==fp),2);

    %% Chama subrotina cos2s
    [Gs,ht,Gsi,hti,s1,s1p,g0]=FEA_cos2s(deltaf,a1,b1,diraz,dirrad,dirtp,fp,dt);

    %Filtra as frequência que não tem mais energia
    diraz_corr=diraz;
    ht_corr=ht;
    dti_corr=hti;
    s1_corr=s1;
    en_eta=aaeta(:,2);
    en_eta_corr=en_eta;

    for i=1:length(deltaf)
        if deltaf(i,1)<0.04

            diraz_corr(i,1)=0;
            ht_corr(i,1)=0;
            dti_corr(i,1)=0;
            en_eta_corr(i,1)=0;
            s1_corr(i,1)=0;

        elseif deltaf(i,1)>0.25

            diraz_corr(i,1)=0;
            ht_corr(i,1)=0;
            dti_corr(i,1)=0;
            en_eta_corr(i,1)=0;
            s1_corr(i,1)=0;

        end
    end

    %% Cálculo do espectro direcional 'E(f,teta)'
    %'sid' é o 's' da função de espalhamento idealizada para o calculo do espectro direcional, varia de 1 a 16
    sid=1;
    ed=hti(:,sid).*en_eta;
    
    dirtp1(ii,1)=dirtp;
    
end

hist(dirtp1)
