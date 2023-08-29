{
2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6
}

program p2;

procedure imprimir (num:integer);
var
  dig:integer;
begin
  if (num > 0) then begin
      dig := num mod 10;
      imprimir(num div 10);
      WriteLn(dig);
  end;
end;

procedure leernumeros (var num:integer);
begin
  WriteLn('Inserta numero');
  ReadLn(num);
end;

var
  num :integer;
begin
  leernumeros(num);
  imprimir(num);
end.