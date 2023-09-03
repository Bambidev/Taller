{
 Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).
}

program p3;
type
  pelicula = record
    codigo :integer;
    codigoGenero :integer;
    puntaje :real;
  end;

  lista = ^nodo;
  nodo = record
    dato :pelicula;
    sig :lista;
  end;

  milista = record
    pri :lista;
    ult :lista;
  end;

  vector = array [1..8] of milista;

  procedure registroPeli(var peli:pelicula);
  begin
    WriteLn('Ingrese codigo');
    ReadLn(peli.codigo);
    WriteLn('ingrese codigo Genero (1-8)');
    ReadLn(peli.codigoGenero);
    WriteLn('Ingrese puntaje');
    ReadLn(peli.puntaje);
  end;

  procedure agregarFinal(var pI:lista; var pU :lista; peli :pelicula);
  var
    nuevo :lista;
  begin
    new (nuevo);
    nuevo^.dato := peli;
    nuevo^.sig := nil;
    if (pI = Nil) then begin
      pI := nuevo;
      pU := nuevo;
    end
    else begin
      pU^.sig := nuevo;
      pU := nuevo;
    end;  
  end;

  procedure leerPelicula(var v:vector);
  var
    peli :pelicula;
  begin
    registroPeli(peli);
    while (peli.codigo <> -1) do begin
      AgregarFinal(v[peli.codigoGenero].pri, v[peli.codigoGenero].ult, peli);
    end;
  end;

  procedure imprimirLista(l :lista);
  begin
    if (l <> nil) then
    begin
      WriteLn(l^.dato.codigo);
      WriteLn(l^.dato.codigoGenero);
      WriteLn(l^.dato.puntaje);
      imprimirLista(l^.sig);
    end;
  end;

  procedure imprimirVector(v:vector);
  var
    i :integer;
  begin
    for i:= 1 to 8 do begin
      imprimirLista(v[i].pri);
      imprimirLista(v[i].ult);
    end;
  end;

var
  l :lista;
  v :vector;
begin
  leerPelicula(v);
  imprimirVector(v);
end.