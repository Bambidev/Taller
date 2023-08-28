{
1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).

b. Un módulo que muestre el contenido del vector resultante del punto a).

c. Un módulo que ordene el vector de ventas por código.

d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).

}


program p1;
const
  dimF = 50;
type

  venta = record
    diaVenta: integer;
    codigo: integer;
    cantVendida: Integer;
  end;

  vectorVentas = array [1..dimF] of venta;

procedure leerRegistro(var dato:venta);
begin
  WriteLn('Ingrese el dia de la venta (1-31) 0 para finalizar');
  ReadLn(dato.diaVenta);
  if (dato.diaVenta <> 0 ) then begin
    dato.codigo := random(15);
    WriteLn('Ingrese la cantidad vendida');
    ReadLn(dato.cantVendida);
  end;
end;

procedure insertarVector(var v:vectorVentas; var dimL:integer; dato:venta);
begin
  if (dimL < dimF) then
  begin
    dimL := dimL + 1;
    v[dimL] := dato;
  end;
end;

procedure retornarInfo(var v:vectorVentas; var dimL:integer);
var
  dato :venta;
begin
  dimL := 0;
  leerRegistro(dato);
  while (dato.diaVenta <> 0) do begin
    insertarVector(v, dimL, dato);
    leerRegistro(dato);
  end;
end;

procedure imprimirVector(v:vectorVentas; dimL:integer);
var
  i :integer;
  dato :venta;
begin
  for i := 1 to dimL do begin
    WriteLn('--------- VENTA ',i, ' ---------');
    dato := v[i];
    WriteLn('Dia de la venta: ',dato.diaVenta);
    WriteLn('Codigo de producto: ',dato.codigo);
    WriteLn('Cantidad Vendida: ',dato.cantVendida);
  end;
end;

procedure ordenarCodVenta(var v:vectorVentas);
begin
  
end;

var
  v: vectorVentas;
  dimL :integer;
begin
  dimL := 0;
  retornarInfo(v, dimL); // a
  imprimirVector(v, dimL); // b
  ordenarCodVenta(v);
end.
