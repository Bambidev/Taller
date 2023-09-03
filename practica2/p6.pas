{
Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}

program p6;

procedure ingresarNumeros();
  procedure binario(decimal: integer);
  begin
    if (decimal > 0) then
    begin
      binario(decimal div 2);
      Writeln(decimal mod 2);
    end;
  end; // fin binario
var
  numero :integer;
begin
  WriteLn('Insertar Numero: ');
  ReadLn(numero);
  if (numero <> 0) then
  begin
    binario(numero);
    ingresarNumeros();
  end;
end;

begin
  ingresarNumeros();
end.