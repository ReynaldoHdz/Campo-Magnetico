function [By,Bz] = CM(X,Y,p1,p2,I,a)
%CM (Campo magnetico) Se calcula el campo magnetico
%   X: una matriz de los puntos en x creada con la función meshgrid()
%   Y: una matriz de los puntos en y creada con la función meshgrid()
%   p1: el indice para la posición en y de la carga
%   p2: el indice para la posición en x de la carga
%   I: el valor de la corriente en amperes
%   a: el radio del disco

u = 4*pi*10^-7;

By = zeros(length(X));
Bz = zeros(length(X));
Bm = zeros(length(X));

for i= 1:length(X)
    for j = 1:length(X)

        % Vector que va de la carga al punto de observación
        r = [X(j,i),Y(j,i)]-[X(p1,p2),Y(p1,p2)];

        % Magnitud
        rm = sqrt(r(1).^2 + r(2).^2);
        y = r(1);
        z = r(2);

        % Campo
        By(j,i) = (u*I*(a^2)*3*y*z)./(4*(rm.^5));
        Bz(j,i) = ((u*I*(a^2))./(2*(rm.^3)))*(1-((3*y^2)./(2*(rm.^2))));

        % Magnitud campo electrico
        Bm(i,j) = sqrt(By(j,i).^2+Bz(j,i).^2);
        
    end
end
end

