{
Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}

program p5;
const dimF = 5;
type

vector = array [1..5] of integer;

procedure CargarVector (var v: vector; var dimL: integer);
  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var numero: integer;
  begin
    if (dimL < dimF) then begin
      write ('Ingrese un numero: ');
      readln(numero);  
      dimL:= dimL + 1;
      v[dimL]:= numero;
      CargarVectorRecursivo (v, dimL);
    end;
  end;
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;

procedure OrdenarInsercion( var v:vector; dimL :integer);
var
  i,j,actual :integer;
begin
  for i:= 2 to dimL do begin
    actual := v[i];
    j := i-1;
    while (j > 0) and (v[j] > actual) do begin
      v[j+1] := v[j];
      j := j-1;
    end;
    v[j+1] := actual;
  end;
end;

procedure BusquedaDicotomicaRecursiva(v: array of integer; ini: integer; fin: integer; num: integer; var pos: integer);
var
  medio: integer;
begin
  if ini <= fin then
  begin
    medio := (ini + fin) div 2; // Encontrar el punto medio del rango
    
    if v[medio] = num then
      pos := 1 // El número se encontró, actualizamos pos
    else if v[medio] < num then
      BusquedaDicotomicaRecursiva(v, medio + 1, fin, num, pos) // Búsqueda en la mitad derecha
    else
      BusquedaDicotomicaRecursiva(v, ini, medio - 1, num, pos); // Búsqueda en la mitad izquierda
  end
  else
    pos := -1; // No se encontró el número
end;

procedure ImprimirVectorRecursivo(v: vector; dimL: integer; ind: integer);
begin
  if ind <= dimL then
  begin
    Write(v[ind], ' ');
    ImprimirVectorRecursivo(v, dimL, ind + 1);
  end;
end;

var
  v:vector;
  dimL,num,pos,ini,fin,ind :integer;
begin
  ind :=1;

  cargarVector(v,dimL);

  ImprimirVectorRecursivo(v,dimL,ind);

  OrdenarInsercion(v,dimL);

  WriteLn();
  ImprimirVectorRecursivo(v,dimL,ind);

  Write('Ingrese numero a buscar: ');
  ReadLn(num);
  ini := 1;
  fin := dimL;
  BusquedaDicotomicaRecursiva(v,ini,fin,num,pos);
  WriteLn('la pos es la: ', pos);
end.
