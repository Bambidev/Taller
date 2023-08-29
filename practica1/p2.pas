{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program p2;
const
  dimF = 300;
type
  oficina = record
    codigo :integer;
    dniPropi :integer;
    expesa :real;
  end;

  vectorOriginal = array [1..dimF] of oficina;

  procedure insertarVector(var v:vector; var dimL :integer; dato:oficina);
  begin
    if (dimL < dimF) then
    begin
      dimL := dimL + 1;
      v[dimL] := dato;
    end;
  end;

  procedure leerDato(var dato:oficina);
  begin
    WriteLn('Ingresar codigo de identificacion');
    ReadLn(dato.codigo);
    WriteLn('ingresar dni del propietario');
    ReadLn(dato.dniPropi);
    WriteLn('Ingresa el valor de las expensas');
    ReadLn(dato.expesa);
  end;

  procedure retornarInfo(var v:vectorOriginal; var dimL:integer);
  var
    dato :oficina;
  begin
    leerDato(dato);
    while (dato.codigo <> -1) do begin
      insertarVector(v,dimL,dato);
      leerDato(dato);
    end;
  end;

  procedure ordenInserccion(var v:vectorOriginal; dimL :integer);
  var
  i, j:integer;
  actual :oficina;
  begin
    for i := 2 to dimL do begin
      actual := v[i];
      j := i+1;
      while (j > 0) and (v[j].codigo > actual.codigo) do begin
        v[j+1] := v[j];
        j := j - 1;
      end;
      v[j+1] := actual;
    end;
  end;

  procedure ordenSeleccion(var v:vectorOriginal; diml:integer);
  var
    i, j, pos:integer;
    item :oficina;
  begin
    for i := 1 to (diml-1) do begin
      pos := 1;
      for j := i + 1 to diml do begin
         if (v[j].codigo < v[pos].codigo) then pos := j;
      end;
      
      item := v[pos];
      v[pos] := v[i];
      v[i] := item;
    end;
  end;

var
  v :vectorOriginal;
  dimL :integer;
begin
  retornarInfo(v,dimL);
  ordenInserccion(v,dimL);
  ordenSeleccion(v,dimL);
end.