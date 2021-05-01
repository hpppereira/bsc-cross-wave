%portuga:
%abre teus dados de vento no matlab da seguinte forma:

%1 --> salva em um bloco de notas (dados.txt) duas colunas com os dados de
%velocidade em m/s (coluna 1) e direcao em graus (coluna 2)

%2 --> importa estes dados pro matlab

%3 --> executa o codigo abaixo

% resultado: na coluna 3 e 4 de "dados" estara salvo o ve e vn
% respectivamente


load('dados.txt')

%%%VENTO%%%
for i=1:length(dados)
    if dados(i,2)==90 % se todos os angulos for igual a 90, 
        angulot(i,1)=0;%angulo de azimute para trigonometrico
    elseif dados(i,2)==0
        angulot(i,1)=90;
    elseif dados(i,2)==270
        angulot(i,1)=180;
    elseif dados(i,2)==180
        angulot(i,1)=270;
    elseif dados(i,2)==360
        angulot(i,1)=90;
    elseif 0<dados(i,2) & dados(i,2)<90
        angulot(i,1)=90-dados(i,2);
    elseif 90<dados(i,2) & dados(i,2)<180
        angulot(i,1)=270+(180-dados(i,2));
    elseif 180<dados(i,2) & dados(i,2)<270
        angulot(i,1)=180+(270-dados(i,2));
    elseif 270<dados(i,2) & dados(i,2)<360
        angulot(i,1)=90+(360-dados(i,2));
    end
end
