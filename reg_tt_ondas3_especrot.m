clear,clc
%Rotina de geraçao de registros de onda para varias direções para serem
%utilizadas na rotina 'PP_regonda_especrot_VyVz e VxVz'

%Este programa gera registros aleatorios de ondas para serem utilizados nos
%testes dos modelos de calculo do espectro direcional. o numero maximo de
%pontos gerados eh 1024.

%Variaveis utilizadas no programa

%a = amplitude
%i = contador
%m = contador
%n = contador
%pc = contado de porcentagem de execuçao
%t = periodo
%dt = incremento de tempo

%numreg = input('Digite o numero de registros que deseja gerar: ');
numreg = 100;
format short
fop='char(';
for ii = 1:numreg; 
    
    %Dados de entrada
    %-------------------------------------------------                                 
    h=200;                                       
    hsig=2.5;                       
    tp=12;                   
    fmin=1/1024;                                 
    fmax=512/1024;     
%     fmin = 0.002;  %??
%     fmax = 0.5;
    dt=1;                                      
    x=0;                                      
    y=0;                                                                         
    tetamean=180;                        
    tetamax=tetamean+15; 
    tetamin=tetamean-15; 
    gama=3;                                       
    smax=8;                                  
    num=1024;                                 
    km=100;                                   
    kn=36;                                        
    z=0; %henrique (valores de cota negativos)
    d=1025; %(1.025 = g/cm^3) (1025 = kg/m^3)

    %-------------------------------------------------
    %INICIALIZACAO DE  VARIAVEIS

    g=9.81;
    fp=1/tp; 
    deltaf=(fmax-fmin)/(km-1); %incremento de frequencia

    %----------------------------------------------------
    %CHAMA FUNÇAO DE CORREÇAO ANGULAR (function corrige)
    %----------------------------------------------------

    tetamean=corrige(tetamean);
    tetamin=corrige(tetamin);
    tetamax=corrige(tetamax);  

    tetamin=tetamin*pi/180;
    tetamean=tetamean*pi/180;
    tetamax=tetamax*pi/180;

    deltateta=(tetamax-tetamin)/(kn-1); %Incremento de direção

    %CALCULO DOS SENOS E COSSENOS

    for n=1:kn; %Variando a direção (36 vezes)
        teta=tetamin+(n-1)*deltateta;  %Calcula varias direções, de 45 à 75
        oo=tetamean-teta; %Calcula a direção em relação a direção média
        co(n)=cos(teta); %cosseno da direção
        si(n)=sin(teta); %seno da direção
        cs(n)=cos(oo); %cosseno da direção menos a media
        sn(n)=sin(oo); %seno da direção menos a media
        cn(n)=cos(-oo/2); %cosseno da direção menos a media /2
    
    %     dir_teta(n,1)=teta; %henrique
    %     dir_oo(n,1)=oo; %henrique
    %     dir_teta(n,2)=teta*180/pi; %henrique
    %     dir_oo(n,2)=oo*180/pi; %henrique
    end

    for m=1:km; %Variando a frequencia
    
        f(m)=fmin+(m-1)*deltaf+rand*deltaf; %Calacula a frquencia (aleatória)
        coss(1,m)=cos(2*pi*f(m)*dt);     %Cosseno da parte final da formula do eta (sem a fase)
        sinn(1,m)=sin(2*pi*f(m)*dt);     %Seno da parte final da formula da inclinação (sem a fase)
        codt(m)=coss(1,m);   %Coloca os valores de coss em codt (cria um vetor codt com os valores de cos 2pift)
        sndt(m)=sinn(1,m);   %Coloca os valores de sinn em sndt
        k(m)=4*pi^2*f(m)^2/g;            %Calcula os valores de k (numero de onda)
        periodo(m)=1/f(m); %henrique
    %-----------------------------------------------
    %Espectro Simulado
    %-----------------------------------------------

        sf=fpierson(f(m), fp, gama, hsig); %um valor de 'sf' para cada frequencia

    %COEFICIENTE DE ESPALHAMENTO

        if f(m)<=fp;
            s=smax*(f(m)/fp)^5; 
        else
            s=smax/(f(m)/fp)^2.5; 
        end

    %INTEGRAL DA FUNÇAO DE ESPALHAMENTO ANGULAR

        integ=0;
        for j=2:kn-1;
            integ=integ+cn(j)^(2*s)*deltateta; %faz um somatório (integral)
        end
        somat=integ+((cn(1)^(2*s)+cn(kn)^(2*s))/2)*deltateta; 
        gzero=1/somat;
     
        for n=1:kn; %variar a direção
        
        %DETERMINACAO DA AMPLITUDE
    
            fase=rand*2*pi; %determinação da fase aleatória (função rand) para cada componente de direção
        
            gteta=gzero*cn(n)^(2*s);     
            a=sqrt(2*sf*deltaf)*sqrt(gteta*deltateta); %Oq faz o gteta? o 2 não precisa estar fora?
    
        %REDUÇAO GEOMETRICA DO PONTO DE ANALISE
        
            tt=k(m)*(x*cs(n)+y*sn(n))+fase;     %Parte das fórmulas integrais dentro do colchetes [] (sem o 2*pi*f*t)
        
            ttc(m,n)=a*cos(tt);     %"Cm" tese joao (Parte da esquerda das fórmulas inegrais (cos --> eta e etaxx (elevação e curvatura))
            tts(m,n)=a*sin(tt);     %"Sm" tese joao (sin --> etax (inclinação)
        
            ttcx(m,n)=ttc(m,n)*k(m)*co(n); %"Sm' em x" - tese joao (Parte da direita entre colchetes da formula da inclinação (+) com o cosseno(ttc) * co(n)
            ttsx(m,n)=-tts(m,n)*k(m)*co(n); %"Cm' em x" -  teste joao (Parte da direita entre colchetes da formula da inclinação (-) com o seno(tts) * co(n)
        
            ttcy(m,n)=ttc(m,n)*k(m)*si(n); %"Sm' em y" - tese joao (Parte da direita entre colchetes da formula da inclinação (+) com o cosseno(ttc) * si(n)
            ttsy(m,n)=-tts(m,n)*k(m)*si(n); %"Cm' em y" - tese joao (Parte da direita entre colchetes da formula da inclinação (+) com o cosseno(ttc) * si(n)
        
            ttcxx(m,n)=-tts(m,n)*(k(m)*co(n))^2;    %"Sm'' em x" - tese joao (Parte da direita entre colchetes da formula da curvatura (-) com o cosseno(ttc) * co(n)^2
            ttsxx(m,n)=-ttc(m,n)*(k(m)*co(n))^2;    %"Cm'' em x" - tese joao (Parte da direita entre colchetes da formula da curvatura (-) com o seno(tts) * co(n)^2
        
            ttcyy(m,n)=-tts(m,n)*(k(m)*si(n))^2;    %"Sm'' em y" - tese joao (Parte da direita entre colchetes da formula da elevação (-) com o seno(tts) * si(n)^2
            ttsyy(m,n)=-ttc(m,n)*(k(m)*si(n))^2;    %"Cm'' em y" - tese joao (Parte da direita entre colchetes da formula da curvatura (-) com o cosseno(ttc) * si(n)^2
        
            ttcvx(m,n)=-ttc(m,n)*(2*pi*f(m)*cosh(k(m)*(h+z))*co(n))/sinh(k(m)*h); %Henrique - Calculo de Vx positivo pq deriva o cosseno e fica seno
            ttsvx(m,n)=-tts(m,n)*(2*pi*f(m)*cosh(k(m)*(h+z))*co(n))/sinh(k(m)*h); %henrique - positivo pq deriva o cosseno e fica seno
        
            ttcvy(m,n)=-ttc(m,n)*(2*pi*f(m)*cosh(k(m)*(h+z))*si(n))/sinh(k(m)*h); %Henrique - Calculo de vy positivo pq deriva o cosseno e fica seno
            ttsvy(m,n)=-tts(m,n)*(2*pi*f(m)*cosh(k(m)*(h+z))*si(n))/sinh(k(m)*h); %henrique - positivo pq deriva o cosseno e fica seno
        
            ttcvz(m,n)=+tts(m,n)*2*pi*f(m); %henrique - fórmula derivando o eta no tempo - negativo pq quero saber o cosseno, que é menos seno
            ttsvz(m,n)=-ttc(m,n)*2*pi*f(m); %henrique - positivo pq quero saber o cosseno, que a derivada de seno é cosseno
        
            ttcvzz(m,n)=+tts(m,n)*(2*pi*f(m)*sinh(k(m)*(h+z))/sinh(k(m)*h)); %henrique - velocidade vertical (deriva eta em t) - negativo pq quero saber o cosseno, que é menos seno
            ttsvzz(m,n)=-tts(m,n)*(2*pi*f(m)*sinh(k(m)*(h+z))/sinh(k(m)*h)); %henrique - formula paper rapport - positivo pq quero saber o cosseno, que a derivada de seno é cosseno 
        
            ttcvzzz(m,n)=+tts(m,n)*(g/(2*pi*f(m)))*(sinh(k(m)*(h+z))/cosh(k(m)*h))*k(m); %henrique - vel z derivando o pot. de vel em z - negativo pq quero saber o cosseno, que é menos seno
            ttsvzzz(m,n)=-ttc(m,n)*(g/(2*pi*f(m)))*(sinh(k(m)*(h+z))/cosh(k(m)*h))*k(m); %henrique - vel z derivando o pot. de vel em z - positivo pq quero saber o cosseno, que a derivada de seno é cosseno 
        
            ttcp(m,n)=ttc(m,n)*(d*g*cosh(k(m)*(h+z))/sinh(k(m)*h)); %henrique - pressão
            ttsp(m,n)=tts(m,n)*(d*g*cosh(k(m)*(h+z))/sinh(k(m)*h)); %henrique

        end
    end

    for i=1:num; %Variando a quantidade de registros (1024)
    
        pc=i*10/(num/10) %Calcula o periodo de corte
        
        eta=0;
        etax=0;
        etay=0;
        etaxx=0;
        etayy=0;
        vx=0; %henrique
        vy=0; %henrique
        vz=0; %henrique
        vzz=0; %henrique
        vzzz=0; %henrique
        p=0; %henrique
    
        t=i*dt; %Criar valor de tempo, passando de 1 em 1

        for m=1:km; %Variando a frequencia
        
            cm=0; %para cada novo valor de f, vai ser zerado o cm, sm....
            sm=0;
            cmx=0;
            smx=0;
            cmy=0;
            smy=0;
            cmxx=0;
            smxx=0;
            cmyy=0;
            smyy=0;
            cvx=0; %henrique - vel x cosseno
            svx=0; %henrique - vel x seno
            cvy=0; %henrique - vel y cosseno
            svy=0; %henrique - vel y seno
            cvz=0; %henrique - vel z cosseno
            svz=0; %henrique - vel z seno
            cvzz=0; %henrique - vel zz cosseno
            svzz=0; %henrique - vel zz seno
            cvzzz=0; %henrique - vel zzz cosseno
            svzzz=0; %henrique - vel zzz seno
            cp=0; %henrique - pressao cosseno
            sp=0; %henrique - pressao seno
        
            for n=1:kn; %Variando a direção
            
                cm=cm+ttc(m,n); %somatório dos senos em cada frequencia
                sm=sm+tts(m,n); %elevação - seno
            
                cmx=cmx+ttcx(m,n); %inclinação em x
                smx=smx+ttsx(m,n);
            
                cmy=cmy+ttcy(m,n); %inclinação em y
                smy=smy+ttsy(m,n);
            
                cmxx=cmxx+ttcxx(m,n); %curvatura em x
                smxx=smxx+ttsxx(m,n);
            
                cmyy=cmyy+ttcyy(m,n); %curvatura em y
                smyy=smyy+ttsyy(m,n);
            
                cvx=cvx+ttcvx(m,n); %henrique - Vx
                svx=svx+ttsvx(m,n); %henrique
            
                cvy=cvy+ttcvy(m,n); %henrique - Vy
                svy=svy+ttsvy(m,n); %henrique
            
                cvz=cvz+ttcvz(m,n); %henrique - Vz - derivando o eta
                svz=svz+ttsvz(m,n); %henrique        
            
                cvzz=cvzz+ttcvzz(m,n); %henrique - Vz - formula rapport
                svzz=svzz+ttsvzz(m,n); %henrique
            
                cvzzz=cvzzz+ttcvzzz(m,n); %henrique - Vz derivando o pot de vel em z
                svzzz=svzzz+ttsvzzz(m,n); %henrique
            
                cp=cp+ttcp(m,n); %henrique - Pressão
                sp=sp+ttsp(m,n); %henrique
            end

            if i==1 %quando o registro for 1 (vai calcular só uma vez) -> não precisa variar em direção , só em frequencia
            
                arg=2*pi*f(m)*t; 
                eta=eta+cm*cos(arg)+sm*sin(arg); %cm = somatório dos cossenos e sm somatório dos senos
                etax=etax+smx*cos(arg)+cmx*sin(arg);
                etay=etay+smy*cos(arg)+cmy*sin(arg);
                etaxx=etaxx+smxx*cos(arg)+cmxx*sin(arg);
                etayy=etayy+smyy*cos(arg)+cmyy*sin(arg);
                vx=vx+cvx*cos(arg)+svx*sin(arg); %henrique - vel x
                vy=vy+cvy*cos(arg)+svy*sin(arg); %henrique - vel y
                vz=vz+cvz*cos(arg)+svz*sin(arg); %henrique  - vel z derivando o eta no tempo
                vzz=vzz+cvzz*cos(arg)+svzz*sin(arg); %henrique - vel z formula rapport
                vzzz=vzzz+cvzzz*cos(arg)+svzzz*sin(arg); %henrique - vel z derivando o pot. de vel em z
                p=p+cp*cos(arg)+sp*sin(arg); %henrique - pressao
            
                coss(2,m)=coss(1,m);  %coss(1,m) = cos(2*pi(f(m)*dt)
                sinn(2,m)=sinn(1,m);  %sinn(1,m) = sin(2*pi(f(m)*dt)
            
            else
            
                coss(2,m)=coss(1,m)*codt(m)-sinn(1,m)*sndt(m);  
                sinn(2,m)=sinn(1,m)*codt(m)+coss(1,m)*sndt(m);   
                eta=eta+cm*coss(2,m)+sm*sinn(2,m);
                etax=etax+smx*coss(2,m)+cmx*sinn(2,m);
                etay=etay+smy*coss(2,m)+cmy*sinn(2,m);
                etaxx=etaxx+smxx*coss(2,m)+cmxx*sinn(2,m);
                etayy=etayy+smyy*coss(2,m)+cmyy*sinn(2,m);
                vx=vx+cvx*coss(2,m)+svx*sinn(2,m); %henrique - vel x
                vy=vy+cvy*coss(2,m)+svy*sinn(2,m); %henrique - vel y
                vz=vz+cvz*coss(2,m)+svz*sinn(2,m); %henrique - derivando o eta no tempo
                vzz=vzz+cvzz*coss(2,m)+svzz*sinn(2,m); %henrique - vel z
                vzzz=vzzz+cvzzz*coss(2,m)+svzzz*sinn(2,m); %henrique - vel z derivando o pot. de vel em z
                p=p+cp*coss(2,m)+sp*sinn(2,m); %henrique - pressao

            end
        
        end
    
        for m=1:km;
            coss(1,m)=coss(2,m); 
            sinn(1,m)=sinn(2,m); 
        end
    
        neta(i)=eta;
        netax(i)=etax;
        netay(i)=etay;
        netaxx(i)=etaxx;
        netayy(i)=etayy;
        velx(i)=vx; %henrique
        vely(i)=vy; %henrique
        velz(i)=vz; %henrique
        velzz(i)=vzz; %henrique
        velzzz(i)=vzzz; %henrique
        pr(i)=p; %henrique
        
    end 
    contador = ii
    tbneta(ii,1:num) = neta;
    tbnetax(ii,1:num) = netax;
    tbnetay(ii,1:num) = netay;
    tbnetaxx(ii,1:num) = netaxx;
    tbnetayy(ii,1:num) = netayy;
    
    registro = [neta',netax',netay',netaxx',netayy',velx',vely',velzzz',pr'];
    registro1 = [neta',velx',vely',velzzz'];
   
    str = num2str(ii);
    csvwrite([str,'_registro180.txt'],registro1)
end
%tbneta;
%tmneta=length(tbneta);
%dirpr = cdirtt2(tbneta',tbnetax',tbnetay',tbnetaxx',tbnetayy');



%Salva arquivo


