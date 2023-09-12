{
Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:

a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.

i. En una estructura cada préstamo debe estar en un nodo.

ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).

b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.

c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.

d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.

i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).

j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
}

program p2;
type
  prestamo = record
    ISBN :integer;
    numeroSocio :integer;
    diaYmes :integer;
    diasPrestado :Integer;
  end;

  cantprestamos = record
    ISBN :integer;
    cantidad :integer;
  end;

  arbol = ^nodo;
  arbolSoloPrestamos = ^nodoCantidad;

  nodoCantidad = record
    dato :cantprestamos;
    HI :arbolSoloPrestamos;
    HD :arbolSoloPrestamos;
  end;

  nodo = record
    dato :prestamo;
    HI :arbol;
    HD :arbol;
  end;  
  
  Procedure generarArbol(var a:arbol; var a2:arbolSoloPrestamos);
    procedure leerPrestamo (var p:prestamo);
      begin
        WriteLn('Ingrese el ISBN');
        ReadLn(p.ISBN);
        if (p.ISBN <> -1) then begin
          WriteLn('Ingrese numero de socio');
          ReadLn(p.numeroSocio);
          WriteLn('Ingrese dia y mes');
          ReadLn(p.diaYmes);
          WriteLn('Ingrese la cantidad de dias del prestamo');
          ReadLn(p.diasPrestado);
        end;
      end;

    procedure armarCantidad (p :prestamo; var pcant :cantprestamos);
    begin
      pcant.ISBN := p.ISBN;
      pcant.cantidad := 1; 
    end;

    procedure agregarArbolCompleto(var a:arbol; p:prestamo);
    begin
      if (a = nil) then begin
        new(a);
        a^.dato := p;
        a^.HI := nil;
        a^.HD := nil;
      end
      else if (p.ISBN < a^.dato.ISBN) then agregarArbolCompleto(a^.HI,p)
      else agregarArbolCompleto(a^.HD,p);
    end;

    procedure agregarArbolCantidad (var a2:arbolSoloPrestamos; pcant :cantprestamos);
    begin
      if (a2 = nil) then begin
        new(a2);
        a2^.dato := pcant;
        a2^.HI := nil;
        a2^.HD := nil;
      end
      else if (pcant.ISBN = a^.dato.ISBN) then a2^.dato.cantidad := a2^.dato.cantidad + 1
      else if (pcant.ISBN < a^.dato.ISBN) then agregarArbolCantidad(a2^.HI,pcant)
      else agregarArbolCantidad(a2^.HD,pcant);
    end;
  var
    p :prestamo;
    pcant :cantprestamos;
  begin
    leerPrestamo(p);
    while p.ISBN <> -1 do begin
      agregarArbolCompleto(a,p);
      armarCantidad(p,pcant);
      agregarArbolCantidad(a2,pcant);
      leerPrestamo(p);
    end;
  end;

  procedure imprimirArbolCompleto(a :arbol);
  begin
    if (a <> Nil) then begin
    imprimirArbolCompleto(a^.HI);
    WriteLn('ISBN: ', a^.dato.ISBN, ' Num socio: ', a^.dato.numeroSocio, ' Dia y mes: ',a^.dato.diaYmes, 'dias prestado: ',a^.dato.diasPrestado);
    imprimirArbolCompleto(a^.HD);
    end;
  end;

  procedure imprimirArbolCantidad(a2 :arbolSoloPrestamos);
  begin
    if (a2 <> Nil) then begin
    imprimirArbolCantidad(a2^.HI);
    WriteLn('ISBN: ', a2^.dato.ISBN, ' TOTAL ', a2^.dato.cantidad);
    imprimirArbolCantidad(a2^.HD);
    end;
  end;

  procedure retornarISBNmasGrande(a :arbol);
    function isbnSup(a :arbol):integer;
    begin
      if (a^.HD = nil) then isbnSup := a^.dato.ISBN
      else isbnSup := isbnSup(a^.HD);
    end;
  var
    Max :integer;
  begin
    max := isbnSup(A);
    WriteLn('El ISBN superior es: ', Max);
  end;

  procedure retornarISBNmasPequenio(a: arbol);
    function isbnInf(a :Arbol):integer;
    begin
      if (a^.HI = nil) then isbnInf := a^.dato.ISBN
      else isbnInf := isbnInf(a^.HI);
    end;
  var
    inf :integer;
  begin
    inf := isbnInf(A);
    WriteLn('El ISBN inferior es: ', inf);
  end;

  { d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
  módulo debe retornar la cantidad de préstamos realizados a dicho socio.}

  procedure retornarCantSociosNum(a :arbol);
    function retornarCantISBN(a :arbol; socio :integer):integer;
    begin
      if a = Nil then retornarCantISBN := 0
      else begin
        if a^.dato.numeroSocio = socio then retornarCantISBN := 1
        else  retornarCantISBN := 0;
        retornarCantISBN := retornarCantISBN + retornarCantISBN(a^.HI, socio) + retornarCantISBN(a^.HD, socio);
      end;
    end;
  var
    socio, cantidad :integer;
  begin
    WriteLn('Ingrese el numero del socio a buscar los prestados');
    ReadLn(socio);
    cantidad := retornarCantISBN(a,socio);
    WriteLn('La cantidad de prestados del socio ', socio, ' son: ', cantidad);
  end;

  { Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
  módulo debe retornar la cantidad total de préstamos realizados a los ISBN
  comprendidos entre los dos valores recibidos (incluidos). }

  procedure retornarEntreRangos(a:arbolSoloPrestamos);
    function retornarValores(a:arbolSoloPrestamos; valor1:integer; valor2: integer):integer;
    begin
      if (a = nil) then retornarValores := 0
      else if (a^.dato.ISBN > valor2) then retornarValores := 0
      else if (a^.dato.ISBN >= valor1) then retornarValores := a^.dato.cantidad + retornarValores(a^.HI,valor1,valor2)
      else retornarValores := retornarValores(a^.HI,valor1,valor2) + retornarValores(a^.HD,valor1,valor2)
    end;
  var
    cantidad,valor1,valor2 :integer;
  begin
    WriteLn('Ingrese valor 1');
    ReadLn(valor1);
    WriteLn('Ingrese valor 2');
    ReadLn(valor2);
    cantidad := retornarValores(a,valor1,valor2);
    WriteLn('La cantidad de prestados entre: ', valor1, ' y ', valor2, ' es: ',cantidad);
  end;

var
  a :arbol;
  a2 :arbolSoloPrestamos;
begin
  generarArbol(a,a2);
  imprimirArbolCompleto(a);
  imprimirArbolCantidad(a2);
  // b
  retornarISBNmasGrande(a);
  // C
  retornarISBNmasPequenio(a);
  // D
  retornarCantSociosNum(a);
  // i
  retornarEntreRangos(a2);

end.