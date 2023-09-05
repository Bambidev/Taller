{
2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
}

program p2;
type
  venta = record
    codProducto :integer;
    fecha :string;
    cantVendidos :integer;
  end;

  producto = record
    codProducto :integer;
    cantVendidos :Integer;
  end;

  arbol = ^nodo;
  nodo = record
    dato :venta;
    HI :arbol;
    HD :arbol;
  end;

  arbol2 = ^nodo2;
  nodo2 = record
    dato :producto;
    HI :arbol2;
    HD :arbol2;
  end;

  procedure leerVenta(var v:venta);
  begin
    WriteLn('Ingrese el codigo de producto: ');
    ReadLn(v.codProducto);
    if (v.codProducto <> 0) then begin
      WriteLn('Ingrese la fecha: ');
      ReadLn(v.fecha);
      WriteLn('Ingrese la cantidad vendida de productos: ');
      ReadLn(v.cantVendidos);
    end;
  end;

  procedure generarArboles(var a:arbol; var a2:arbol2);
    procedure agregarArbolVenta(var a:arbol; v:venta);
    begin
      if (a = nil) then begin
        new(a);
        a^.dato := v; a^.HI := nil; a^.HD := nil;
      end
      else begin
        if (v.codProducto <= a^.dato.codProducto) then 
          agregarArbolVenta(a^.HI,v)
        else
          agregarArbolVenta(a^.HD,v);
      end;
    end;

    procedure agregarArbolProducto(var a:arbol2; p:producto);
    begin
      if (a = nil) then begin
        new(a);
        a^.dato := p; a^.HI := nil; a^.HD := nil;
      end
      else begin
        if (p.codProducto <= a^.dato.codProducto) then 
          agregarArbolProducto(a^.HI,p)
        else
          agregarArbolProducto(a^.HD,p);
      end;
    end;

    procedure igualar(var p:producto; v:venta);
    begin
      p.codProducto := v.codProducto;
      p.cantVendidos := v.cantVendidos;
    end;

  var
    v :venta;
    p :producto;
  begin
    leerVenta(v);
    while (v.codProducto <> 0) do begin
      igualar(p,v);
      agregarArbolVenta(a,v);
      agregarArbolProducto(a2,p);
      leerVenta(v);
    end;
  end;

  procedure imprimirOrden(a :arbol);
  begin
    if (a <> nil) then begin
      imprimirOrden(a^.HI);
      Write(a^.dato.codProducto, ' | ');
      imprimirOrden(a^.HD);
    end;
  end;

  procedure cantidadVendidos(a:arbol);

    function contarCantidad(a:arbol; cod:integer): integer;
    begin
      if (a = nil) then Write('No hay propductos')
      else if (a^.dato.codProducto = cod) then contarCantidad := a^.dato.cantVendidos
      else if (cod < a^.dato.codProducto) then contarCantidad := contarCantidad (a^.HI,cod)
      else contarCantidad := contarCantidad(a^.HD,cod);
    end;

  var
    cod, cantidad :integer;
  begin
    cantidad := 0;
    WriteLn('Ingrese codigo para retornar cantidad de vendidos: ');
    ReadLn(cod);
    if (cod = 0) then begin
      WriteLn('Codigo invalido ingrese nuevamente: ');
      ReadLn(cod);
    end
    else begin
      cantidad := contarCantidad(a,cod);
    end;
    WriteLn('La cantidad de ventas para el codigo: ',cod, ' es: ', cantidad);
  end;

var
  a :arbol;
  a2 :arbol2;
begin
  generarArboles(a,a2);
  imprimirOrden(a);
  cantidadVendidos(a);
end.