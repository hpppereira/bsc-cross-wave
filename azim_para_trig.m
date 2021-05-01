function [dirt]=azim_para_trig(diraz)

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