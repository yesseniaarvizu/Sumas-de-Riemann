%Reutiliza el script de la Práctica #1 para calcular L n y R n de

% f (x) = 4x + 5 en [2, 5] con 8, 16, 32 y 48 rectángulos respectivamente

syms x
f = @(x) 4x + 5
desde = 2
hasta = 5
cant = 40
h = (hasta - desde)/cant

xi = linspace(desde, hasta, cant+2)

for i = 1 : cant+1
    yi(i) = f(xi(i));
end

    
Rn = h* sum(double(yi(1 : cant)))
Ln = h* sum(double(yi(2 : cant+1)))


ezplot(f,[desde hasta]);
hold on;

plot([xi(1) xi(end)],[0 0],'b')

for i = 1 : cant+1
    if(f(xi(i)) >= 0)
        %Rectangulo inferior
        plot([xi(i) xi(i)],[0 double(f(fminbnd(f,xi(i),xi(i+1))))],'g')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) double(f(fminbnd(f,xi(i),xi(i+1))))],'g')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) 0],'g')
    
        g = @(x) -f(x);
    
        %Rectangulo superior
        plot([xi(i) xi(i)],[0 double(f(fminbnd(g,xi(i),xi(i+1))))],'r')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) double(f(fminbnd(g,xi(i),xi(i+1))))],'r')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) 0],'r')
    else
        %Rectangulo inferior
        plot([xi(i) xi(i)],[0 double(f(fminbnd(f,xi(i),xi(i+1))))],'r')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) double(f(fminbnd(f,xi(i),xi(i+1))))],'r')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) 0],'r')
    
        g = @(x) -f(x);
    
        %Rectangulo superior
        plot([xi(i) xi(i)],[0 double(f(fminbnd(g,xi(i),xi(i+1))))],'g')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) double(f(fminbnd(g,xi(i),xi(i+1))))],'g')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) 0],'g')
    end
end