{
3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.

c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.

d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.

e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.

f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

program p3;
type
  
  final = record
    codFinal :integer;
    nota :real;
  end;

  lista = ^nodo;
  nodo = record
    dato :final;
    sig :lista;
  end;

  alumno = record
    legajo :Integer;
    dni :Int64;
    anioIngreso :integer;
    finales :lista;
  end;

  arbol = ^nodoArbol;
  nodoArbol = record
    dato :alumno;
    HI :arbol;
    HD :arbol;
  end;

  procedure agregarLista(var l:lista; f:final);
  var
    nuevo :lista;
  begin
    new(nuevo);
    nuevo^.dato := f;
    nuevo^.sig := l;
    l := nuevo;
  end;

  procedure leerNota(var d:final);
  begin
    WriteLn('Ingrese codigo de materia:');
    ReadLn(d.codFinal);
    if (d.codFinal <> -1) then begin
      WriteLn('Ingrese nota obtenida: ');
      ReadLn(d.nota);
    end;
  end;

  procedure agregarNotas(var a :alumno);
  var
    notas :final;
  begin
    leerNota(notas);
    while(notas.codFinal <> -1) do begin
      agregarLista(a.finales, notas);
      leerNota(notas);
    end;
  end;

  procedure leerAlumno(var a :alumno);
  begin
    WriteLn('Ingrese legajo del alumno: ');
    ReadLn(a.legajo);
    if (a.legajo <> 0) then begin
      WriteLn('Ingrese DNI del alumno: ');
      ReadLn(a.dni);
      WriteLn('Ingrese anio de ingreso: ');
      ReadLn(a.anioIngreso);
      agregarNotas(a);
    end;
  end;

  procedure agregarArbol(var a:arbol; reg:alumno);
  begin
    if (a = nil) then begin
      New(a); 
      a^.dato := reg;
      a^.HI := nil;
      a^.HD := nil;
    end
    else 
      if (reg.legajo <= a^.dato.legajo) then agregarArbol(a^.HI,reg)
      else agregarArbol(a^.HD,reg);
  end;

  procedure generarArbol (var a:arbol);
  var
    dato :alumno;
  begin
    leerAlumno(dato);
    while(dato.legajo <> 0) do begin
      agregarArbol(a,dato);
      leerAlumno(dato);
    end;
  end;

  procedure retAlumAnio(a :arbol);
    procedure imprimirNodo (nodo :alumno);
    begin
      WriteLn('----------------------------');
      Writeln('El DNI del alumno es: ', nodo.dni);
      WriteLn('El año de ingreso es: ', nodo.anioIngreso);
    end;

    procedure imprimirValores (a:arbol; valor:integer);
    begin
      if (a <> nil) then begin
        imprimirValores(a^.HI,valor);
        if (a^.dato.legajo < valor) then imprimirNodo(a^.dato);
        imprimirValores(a^.HD,valor);
      end;
    end;
  var
    valor :integer;
  begin
    WriteLn('Ingrese el valor del legajo');
    ReadLn(valor);
    imprimirValores(a,valor);
  end;

  procedure retornarLegSup(a :arbol);
    function max(a:arbol):Integer;
    begin
      if (a^.HD = nil) then max := a^.dato.legajo
      else max := max(a^.HD);
    end; 
  var
    maximo :integer;
  begin
    maximo := max(a);
    WriteLn('El maximo es: ',maximo);
  end;

  procedure retornarDNIsup(a:arbol);
    function buscarDni(a:arbol; var dniMax:integer):integer;
    begin
      if (a <> nil) then begin
        if (a^.dato.dni >= dniMax) then buscarDni := a^.dato.dni;
        buscarDni(a^.HI,dniMax);
        buscarDni(a^.HD,dniMax);
      end;
    end;
  var
    dniMax :integer;
  begin
    dniMax := -1;
    WriteLn('El dni maximo es: ',buscarDni(a,dniMax));
  end;

  procedure retornarImpar(a:arbol);
    procedure contarImpares(a:arbol; var impares:integer);
    begin
      if (a <> nil) then begin
        if ((a^.dato.legajo mod 2) <> 0) then impares := impares + 1;
        contarImpares(a^.HI,impares); 
        contarImpares(a^.HD,impares);
      end;
    end;
  var
    impares :integer;
  begin
    impares := 0;
    contarImpares(a,impares);
    WriteLn('La catidad de impares es: ',impares);
  end;


var
  a :arbol;
begin
  generarArbol(a);
  {b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. }
  retAlumAnio(a); 
  {c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.}
  retornarLegSup(a);
  {d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}
  retornarDNIsup(a);
  {e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.}
  retornarImpar(a);


end.