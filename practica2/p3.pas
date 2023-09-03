{
3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
}

program p3;
type

lista = ^nodo;

nodo = record
  dato :integer;
  sig :lista;
end;

procedure agregarAdelante(var l:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato := num;
  nue^.sig := l;
  l := nue;
end;

procedure generarLista (var l :lista);
var
  num :integer;
  ok :integer;
begin
  WriteLn('Ingrese 1 para generar numero random 0 para finalizar');
  ReadLn(ok);
  if (ok = 1) then begin
    num := random(99)+1;
    agregarAdelante(l,num);
    generarLista(l);
  end;
end;

procedure imprimir(l:lista);
begin
  if (l <> nil) then begin
    Write(l^.dato, ' | ');
    imprimir(l^.sig);
  end;
end;

procedure retornarMin(l:lista; var min:integer);
begin
  if (l <> nil) then begin
    if (l^.dato < min) then begin
      min := l^.dato;
    end;
    retornarMin(l^.sig,min);
  end;
end;

procedure retornarMax(l:lista; var max:integer);
begin
  if (l <> nil) then begin
    if (l^.dato > max) then begin
      max := l^.dato;
    end;
    retornarMax(l^.sig,max);
  end;
end;

procedure encontrar(l:lista; numBuscar:integer; var encontre:boolean);
begin
  if ((l <> nil) and (encontre = false)) then begin
    if (l^.dato = numBuscar) then begin 
        encontre := true;
    end;
    encontrar(l^.sig,numBuscar,encontre);
  end;  
end;

var
  l:lista;
  min,max,numBuscar :integer;
  encontre :boolean;
begin
Randomize;
min := 9999;
max := -1;

generarLista(l); //a
imprimir(l);

retornarMin(l,min); //b
WriteLn('  El minimo es: ', min);

retornarMax(l,max); //c
WriteLn('  El maximo es: ', max);

encontre := false;
WriteLn('Ingresa num a buscar');
ReadLn(numBuscar);
encontrar(l,numBuscar,encontre);
WriteLn(encontre);

end.