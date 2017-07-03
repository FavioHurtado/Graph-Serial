clear all;clc;
delete(instrfind({'Port'},{'COM28'}));
pserial=serial('COM28','BaudRate',9600);
fopen(pserial);
figure('Name','Gráfica de valores obtenidos')
title('LECTURA ANALOGICA CON ARDUINO');
xlabel('Muestra');
ylabel('Voltaje de Salida');
val=zeros(1,200);
for i=1:200
    ylim([0 5.1]);
    xlim([i-100 i+10]);
    lectura=fscanf(pserial,'%d');
    val(i)=lectura*(5/1023);
    hold on
    plot(i,val(i),'*');
    drawnow
end
dlmwrite('D:\\Valores_Obtenidos.dat', val,'\n')
fclose(pserial);
delete(pserial);
clear all;
