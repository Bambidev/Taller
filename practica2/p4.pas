{
  4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}
program p4;
const dimF = 20;
type
  vector = array [1..dimF] of integer;

  procedure retonarVector (var v:vector;var dimL:integer);
  var
    numero:integer;
  begin
    if (dimL < dimF) then begin
      numero := random(19)+1;
      dimL:= dimL + 1;
      v[dimL] := numero;
      retonarVector(v, dimL);
    end;
  end;

  procedure imprimir(v:vector; dimL:integer);
  begin
    if (dimL > 0) then
    begin
      WriteLn(v[dimL]);
      dimL := dimL - 1;
      imprimir(v,dimL);
    end;
  end;

  procedure devolverMax(v:vector;dimL:Integer;var max:integer);
  begin
    if (dimL > 0) then begin
      if (v[dimL] > max) then begin 
        max := v[dimL];
      end;
      dimL := dimL -1;
      devolverMax(v,dimL,max);
    end;
  end;


  procedure devolverMin(v:vector;dimL:Integer;var min:integer);
  begin
    if (dimL > 0) then begin
      if (v[dimL] < min) then begin 
        min := v[dimL];
      end;
      dimL := dimL -1;
      devolverMin(v,dimL,min);
    end;
  end;

var
  v:vector;
  dimL :integer;
  max,min :integer;
begin
  Randomize;
  dimL := 0;
  max := -1;
  min := 9999;
  retonarVector(v, dimL);
  imprimir(v,dimL);
  devolverMax(v,dimL,max);
  WriteLn('El max es: ', max);

  devolverMin(v,dimL,min);
  WriteLn('El min es: ', min);


end.