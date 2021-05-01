% filtro quadrático de Lanczos com corte de frequencia de 40 hs,
% elimina 60 dados no inicio e no final da serie temporal

function sinfil=lanczos(sinal)

N=length(sinal);

M=60;
FO=0.05;
R(1)=1;
T(1)=1;
sinfil=0;

%%%%%%%%%% gera a janela   
for j=2:M
   R(j)= (  sin(pi*(j-1)/M)/(pi*(j-1)/M)  )^2;
   T(j)= R(j) * ( sin(pi*FO*(j-1))/(pi*FO*(j-1)) );
end
SUMT=sum(T)-T(1);
BM=T(1)+2*SUMT;
S=T/BM;
for i=1:M                               
   SF(i)=S(M+1-i);
end
for i=M+1:2*M-1
   SF(i)=S(i-M+1);
end
   
%%%%%%%%%% filtra
for i=0:N-119
   SOMA=0;
   for j=1:119
      SOMA=SOMA+SF(j)*sinal(i+j);
   end
   sinfil(i+1)=SOMA;
end
   
  
      
   
