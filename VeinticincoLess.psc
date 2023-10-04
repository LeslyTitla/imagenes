//Escribir y ejecutar un programa que simule un calculador simple. Lee dos n�meros y 
//un car�cter. Si el car�cter es +, se imprime la suma; si el car�cter es un -, se imprime la diferencia; 
//si el car�cter es un *, se imprime el producto; si el car�cter es un /, se imprime el cociente; y si es  una %, se imprime el residuo

Proceso VeinticincoLess
	Definir r Como Real;
	Definir a,b Como Entero;
	//Definamos opcionn como caracter, de otro modo no deja
	Definir opcionn Como Caracter;
	
	Escribir "Ingresa Primer numero: ";
	Leer a;
	
	Escribir "Ingresa Segundo numero: ";
	Leer b;
	
	Escribir "Ingresa Operador (+,-,*,/,%): ";
	Leer opcionn;
	
	Segun opcionn Hacer
		"+":
			r = a+b;
			Escribir "El resultado de la suma es: ", r;
		"-":
			r <- a - b;
			Escribir "El resultado de la resta es: ", r;
		"*":
			r <- a * b;
			Escribir "El resultado de la multiplicaci�n es: ", r;
		"/":
			Si b = 0 Entonces
				Escribir "No se puede dividir por cero";
			Sino
				r <- a / b;
				Escribir "El resultado de la divisi�n es: ", r;
			FinSi
		"%":
			Si b = 0 Entonces
				Escribir "No se puede calcular el residuo de la divisi�n por cero";
			Sino
				r <- a % b;
				Escribir "El resultado del residuo es: ", r;
			FinSi
		De Otro Modo:
			Escribir "Operador no v�lido";
	FinSegun
FinProceso
