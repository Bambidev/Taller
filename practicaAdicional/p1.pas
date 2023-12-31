{
El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total de las expensas.
}

program p1;
type
  vector = array [1..300] of oficina;

  oficina = record
    codigo :integer;
    dni :integer;
    valorExpensa :real;
  end;

  procedure cargarVector(v :vector);

  procedure busquedaDicotomica (v: vector; ini, fin: integer; num: integer; pos: integer);
  var
	  med: integer; 			//ini:=1; fin,pos:=dimL;
  begin
	if (pos <> 0) then begin      
		med:= (ini + fin) div 2;
		if (num = v[med]) then writeln('Lo encontre')
		else
			if (num < v[med]) then busquedadicotomica(v, ini, med-1, num, pos-1)
      else busquedadicotomica(v, med+1, fin, num, pos+1);
  end
  else
    writeln('No lo encontre');
  end;


var
  v :vector
begin
  cargarVector(v);


  
end.