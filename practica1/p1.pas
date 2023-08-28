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

  lista = ^nodo;
  nodo = record
    dato:venta;
    sig:lista;
  end;

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

procedure ordenarCodVenta(var v:vectorVentas; dimL:integer);
var
i, j :integer;
actual :venta;
begin
  for i:= 1 to dimL do begin
    actual := v[i];
    j := i-1;
    while (j > 0) and (v[j].codigo > actual.codigo) do begin
      v[j+1] := v[j];
      j := j - 1;
    end;
    v[j+1] := actual;
  end;
end;

procedure insertarValoresBorrar(var pos1:integer; var pos2:integer);
begin
  WriteLn('Ingrese valor 1');
  ReadLn(pos1);
  WriteLn('Ingrese valor 1');
  ReadLn(pos2);
end;

function encontrar(v :vectorVentas; dimL:integer; codigoVenta:integer):integer;
var
  i:integer;
  pos: integer;
begin
  pos := 1;
  while(pos <= dimL) and (v[pos].codigo <> codigoVenta) do begin
    pos := pos +1;
  end;
  if(pos > dimL) then pos := 0;
  encontrar := pos;
end;

procedure eliminarDatos(var v:vectorVentas; var dimL:integer; codInf:integer; codSup:integer);
var
	i:integer;
	j:integer;
	salto :integer;
  posInf, posSup :integer;
begin
  posInf := encontrar(v, dimL,codInf);
  posSup := encontrar(v,dimL,codSup);

  if (posInf <> 0) and (posSup <> 0) then begin
			salto := posSup - posInf + 1;
			for i:= posInf to (dimL-salto) do begin
				v[i] := v[i+salto];
			end;
			diml := diml - salto;
		end;
end;

procedure recorrerLista(l :lista);
begin
  while(l <> nil) do begin
    WriteLn('Dia de venta: ');
    WriteLn(l^.dato.diaVenta);
    WriteLn('codigo: ');
    WriteLn(l^.dato.codigo);
    WriteLn('cantidad vendida: ');
    WriteLn(l^.dato.cantVendida);
    l := l^.sig;
  end;
end;

procedure agregarAlFinal2 (var pI:lista;var pU:lista; d:venta);
Var
 nuevo:lista;
Begin
   new (nuevo); 
   nuevo^.dato := d;
  nuevo^.sig := nil;
   if (pI = nil) then begin
      pI:= nuevo;
      pU:= nuevo;
   end
   else begin
      pU^.sig :=nuevo;
      pU := nuevo;       
    end;
End;

procedure crearLista(var l:lista; v :vectorVentas; var ult: lista; dimL :integer);
var
  i :integer;
begin
  for  i := 1 to dimL do begin
    if ((v[i].codigo mod 2) = 0) then
    begin
      agregarAlFinal2(l,ult,v[i]);
    end;
  end;  
end;


var
  v: vectorVentas;
  dimL :integer;
  pos1,pos2:integer;
  l :lista;
  ult :lista;
begin
  Randomize;
  dimL := 0;
  retornarInfo(v, dimL); // a
  imprimirVector(v, dimL); // b
  
  ordenarCodVenta(v, dimL); // c
  WriteLn('|- - - - Ordenado- - - - -|');
  imprimirVector(v, dimL); // d

  insertarValoresBorrar(pos1,pos2);
  eliminarDatos(v, dimL, pos1, pos2); // e
  WriteLn('ELIMINADO');
  imprimirVector(v, dimL); // f

  l := nil;
  ult := nil;
  crearLista(l,v,ult,dimL);
  WriteLn('-- LISTA CON SOLO PARES --');
  recorrerLista(l);
end.
