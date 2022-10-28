clear
clc

sup = 10; inf = -10; intervalo = 1;

% Estableciendo variables para la función
[X,Y] = meshgrid(inf:intervalo:sup,inf:intervalo:sup);
I = 1;
a = 5;

% Puntos en el disco
j = 1;
for i = 6:1:16
    [Bpx(:,:,j),Bpy(:,:,j)] = CM(X,Y,11,i,I,a);
    j = j + 1;
end


% Campo magnético total
Bx = 0;
By = 0;
for i = 1:11
    Bx = Bpx(:,:,i) + Bx;
    By = Bpy(:,:,i) + By;
end

Bm = sqrt(Bx.^2+By.^2);
Bx = Bx./Bm;
By = By./Bm;

% Creando gráfica de campo magnético
quiver(X, Y, Bx, By)

% Dibujando disco
cargap = [-6 0.2 12 0.3];
rectangle('Position',cargap,'Curvature',[1,1],'FaceColor','r','EdgeColor','r')

xlim([inf,sup])
ylim([inf,sup])
xline(0)
yline(0)
title('Campo magnetico')
xlabel('y')
ylabel('z')
pbaspect([1 1 1])