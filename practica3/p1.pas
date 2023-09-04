{
 1. Escribir un programa que:
  a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
  b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
  i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
  ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
  iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
  iv. Aumente en 1 la edad de todos los socios.
  v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
  vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
  vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
  viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
  vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
  xi. Informe los números de socio en orden creciente.
  x. Informe los números de socio pares en orden decreciente.
}

program p1;
type
  socio = record
    numero :integer;
    nombre :string;
    edad :integer;
  end;

  arbol = ^nodo;

  nodo = record
    dato :socio;
    HI :arbol;
    HD :arbol;
  end; 

  procedure leerSocio(var d:socio);
  begin
    WriteLn('Ingrese numero de socio');
    ReadLn(d.numero);
    WriteLn('Ingrese nombre de socio');
    ReadLn(d.nombre);
    WriteLn('Ingrese edad de socio');
    ReadLn(d.edad);
  end;

  procedure agregarArbol (var a:arbol; d:socio);
  begin
    if (a = nil) then begin
      new(a);
      a^.dato := d;
      a^.HD := nil;
      a^.HI := nil;
    end
    else begin
      if (d.numero <= a^.dato.numero) then agregarArbol(a^.HI,d)
      else agregarArbol(a^.HD,d);
    end;
  end;

  procedure generarArbol(var a:arbol);
  var
    d: socio;
  begin
    leerSocio(d);
    while (d.numero <> 0) do begin
      agregarArbol(a,d);
      leerSocio(d);
    end;
  end;

  procedure imprimirArbol(a :arbol);
  begin
    if (a <> nil) then begin
      imprimirArbol(a^.HI);
      Write(a^.dato.numero, ' | ');
      imprimirArbol(a^.HD);
    end;
  end;

  function socioMayor(a :arbol):Integer;
  begin
    if (a = nil) then socioMayor := -1
    else if (a^.HD = nil) then socioMayor := a^.dato.numero
    else
      socioMayor := socioMayor (a^.HD);
  end;

  function datosMinimoSocio (a :arbol): arbol;
  begin
    if (a = nil) then datosMinimoSocio := Nil
    else if (a^.HI = nil) then datosMinimoSocio := a
    else datosMinimoSocio := datosMinimoSocio(a^.HI);
  end;

  procedure imprimirNodo (a:arbol);
  begin
    WriteLn('Numero de socio: ',a^.dato.numero);
    WriteLn('Nombre socio: ',a^.dato.nombre);
    WriteLn('Edad del socio: ',a^.dato.edad);
  end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin

      if (a^.dato.edad >= maxEdad) then begin
        maxEdad := a^.dato.edad;
        maxNum := a^.dato.numero
      end;
	
		  numeroMasEdad(a^.HI, maxEdad,maxNum);
		  numeroMasEdad(a^.HD, maxEdad,maxNum);
	   end; 
	end;

var maxEdad, maxNum: integer;
begin
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);

  if (maxEdad = -1) then writeln ('Arbol sin elementos')
  else begin
      writeln ('Numero de socio con mas edad: ', maxNum);
  end;
end;

procedure AumentarEdad (a: arbol);
begin
 if (a <> nil)
 then begin
    a^.dato.edad := a^.dato.edad + 1;
    AumentarEdad(a^.HI);
    AumentarEdad(a^.HD);
  end;
end;

procedure InformarExistenciaNumeroSocio(a: arbol);
       
  function Buscar (a: arbol; num: integer): boolean;
  begin
    if (a = nil) then Buscar := false
    else if (a^.dato.numero = num) then Buscar := true
    else if (num < a^.dato.numero) then Buscar := Buscar (a^.HI, num)
    else Buscar := Buscar (a^.HD, num)
  end;
  
var numABuscar: integer;
begin
  write ('Ingrese numero de socio a buscar: ');
  Readln (numABuscar);
  if (Buscar (a, numABuscar)) then writeln('El numero ', numABuscar, ' existe')
  else writeln ('El numero ', numABuscar, ' no existe');
end;

procedure InformarExistenciaNombreSocio (a :arbol);
  function Buscar (a: arbol; num: integer): boolean;
    begin
      if (a = nil) then Buscar := false
      else if (a^.dato.numero = num) then Buscar := true
      else if (num < a^.dato.numero) then Buscar := Buscar (a^.HI, num)
      else Buscar := Buscar (a^.HD, num)
    end;
    
var nombreBurcar: String;
begin
  write ('Ingrese nombre de socio a buscar: ');
  Readln(nombreBurcar);
  if (Buscar (a, nombreBurcar)) then writeln('El numero ', nombreBurcar, ' existe')
  else writeln ('El numero ', nombreBurcar, ' no existe');
end;


// programa principal
var
  a :arbol;
  numMayor, numMayorEdad :integer;
  datosMin :arbol;
begin
  a := Nil;
  generarArbol(a);
  imprimirArbol(a);

  //i
  if (a <> nil) then begin
    numMayor := socioMayor(a);
    WriteLn('El numero de socio mas grande es: ', numMayor);
  end;

  // ii
  datosMin := datosMinimoSocio(a);
  imprimirNodo(datosMin);

  // iii;
  InformarNumeroSocioConMasEdad(a);

  //iv
  AumentarEdad(a);

  // v
  InformarExistenciaNumeroSocio(a);

  //vi
  InformarExistenciaNombreSocio (a);

  //vii
  InformarCantidadSocios (a);

  //viii
  InformarPromedioDeEdad (a);

  //ix
  InformarCantidadSociosEnRango (a);

  //x
  InformarNumerosSociosOrdenCreciente (a);

  //xi
  InformarNumerosSociosOrdenDeCreciente (a);
end.