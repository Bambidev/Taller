{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).
}

program p4;
type

producto = record 
  codigoProducto :integer;
  codigoRubro :integer;
  precio :real;
end;

lista = ^nodo;
nodo = record
  dato :producto;
  sig :lista;
end;

vectorRubro3 = array [1..30] of producto;

vector = array [1..8] of lista;

procedure leerProducto(var p:producto);
begin
  WriteLn('Ingrese codigo de producto');
  ReadLn(p.codigoProducto);
  WriteLn('Ingrese codigo rubro');
  ReadLn(p.codigoRubro);
  WriteLn('ingrese precio');
  ReadLn(p.precio);
end;

procedure agregarOrdenado (var l:lista; p:producto);
var
  anterior, actual, nuevo: lista;
begin
  new(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := nil;

  if (l = nil) then l := nuevo
  else begin
    actual := l;
    anterior := l;
    
    while (actual <> nil) and (actual^.dato.codigoProducto < p.codigoProducto) do begin
      anterior := actual;
      actual := actual^.sig;
    end;

    if (actual = l) then begin
      nuevo^.sig := l;
      l := nuevo;
    end
    else begin
      anterior^.sig := nuevo;
      nuevo^.sig := actual;
    end;
  end;
end;

procedure ImprimirLista(l :lista);
begin
  while (l <> nil) do begin
    WriteLn('Codigo de Producto: ', l^.dato.codigoProducto);
    l := l^.sig;
  end;
end;

procedure imprimirCodigos(v :vector);
var
  i :integer;
begin
  for i := 1 to 8 do begin
    WriteLn('Rubro: ',i);
    ImprimirLista(v[i]);
  end;
end;

procedure generarLista (var l :lista; var v :vector);
var
  p :producto;
begin
  leerProducto(p);
  while (p.precio <> 0) do begin
    agregarOrdenado(v[p.codigoRubro], p);
    leerProducto(p);
  end;
end;

procedure generarVector(l :lista;var vRubro :vectorRubro3; var dimL:integer);
var
  cantProductos:integer;
begin
  cantProductos := 0;
  while (l <> nil) and (cantProductos < 30) do begin
    cantProductos := cantProductos + 1;
    vRubro[cantProductos] := l^.dato;
    l:= l^.sig;
  end;
  dimL := cantProductos;
end;

procedure imprimirVector(v :vectorRubro3; dimL:Integer);
var
  i :integer;
begin
  for i := 1 to dimL do begin
    WriteLn('Cod producto: ', v[i].codigoProducto);
    WriteLn('Precio: ', v[i].precio);
  end;
end;

var
  l :lista;
  v :vector;
  vRubro :vectorRubro3;
  dimL :Integer;
begin
  generarLista(l,v);
  imprimirCodigos(v);
  generarVector(v[3],vRubro, dimL);
  imprimirVector(vRubro, dimL);
end.