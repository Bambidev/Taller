{
Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:

a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.

i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). 
De cada final rendido se lee el código del alumno, el código de materia y la nota (valor entre 1 y 10). 
La lectura de los finales finaliza con nota -1. La estructura debe ser eficiente para buscar por código de alumno.

ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).

b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
}

program p3;
type
  subnota = 1..10;
  subnotaAprobada = 4..10;

  alumno = record
    codigo :integer;
    notaAprobadas :subnotaAprobada;
  end;

  final = record
    codigoAlumno :integer;
    codigoMateria :integer;
    nota :subNota;
  end;

  arbolAlum = ^nodoAlum;
  arbolFinal = ^nodoFinal;

  nodoAlum = record
    dato :alumnol;
    HI :arbolAlum;
    HD :arbolAlum;
  end;

  nodoFinal = record 
    dato :final;
    HI :arbolFinal;
    HD :arbolFinal;
  end;

  procedure generarLista(var a:Arbol)
    procedure agregarArbolFinal(var a:arbolFinal; f :finales);
    begin
      
    end;

    procedure agregarArbolAlum(var a:arbolAlum; alum :alumno);
    begin
      
    end;

    procedure leerFinal(var f :final);
    begin
      WriteLn('Ingrese nota: ');
      ReadLn(f.nota);
      if (f.nota <> -1) then begin
        WriteLn('Ingrese codigo de alumno');
        ReadLn(f.codigoAlumno);
        WriteLn('Ingrese Codio de materia: ');
        ReadLn(f.codigoMateria);
      end;
    end;
  var
    alum :alumno;
    f :final;
  begin
    leerFinal(f);
    while(f.nota <> -1) do begin
      agregarArbolFinal
    end;
  end;
  
// Programa principal.
var

begin

end.