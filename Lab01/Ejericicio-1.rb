#Lab 1	

module Lab01
	
	#a) boolean palindromo?(string s): Función que determina si un string conteniendo una palabra o frase es un palindromo, devolviendo un booleano. Debe ingnorar todo lo que no sea una letra, por ejemplo: “A man, a plan, a canal – Panama” es un palíndromo. Como recomendación considere el uso de expresiones regulares. Puede ayudarse en este enlace
	def palindromo(s)
		s = s.downcase.gsub(/[^(a-z)]/, '') #Primero paso a minusculas, luego me quedo solo con las letras sin escpacios ni nada mas
		s == s.reverse
	end


	#b) Hash cuenta_palabras(string s): Función que recibe un string con una frase como argumento, y devuelve un Hash, en donde las llaves son las palabras de la frase, y el valor es la cantidad de veces que dicha palabra aparece en la frase.
	def cuenta_palabras(s)
		cont_hash = Hash.new(0)
		s.downcase.scan(/\w+/) {|s| cont_hash[s]+=1}
		return cont_hash
	end

	#c) void hanoi(int numero_discos, int t_origen, int t_destino, int t_alterna): Procedimiento que imprime los pasos para resolver el juego Torres de Hanoi.
	def hanoi(numero_discos, t_origen, t_destino, t_alterna)
		if numero_discos == 1
			puts "Mover disco desde la torre " + t_origen.to_s + " hacia la torre " + t_destino.to_s
		else
			hanoi(numero_discos - 1, t_origen, t_alterna, t_destino)
			hanoi(1, t_origen, t_destino, t_alterna)
			hanoi(numero_discos - 1, t_alterna, t_destino, t_origen)
		end
	end

	#d) Array sort(Array a, boolean asc): Función que recibe un arreglo y devuelve una copia del arreglo ordenado, ascendente o descendentemente, según se indique.
	def sort(a, asc)
		if asc == 1
			aNuevo = a.sort
		elsif asc == 0
			anuevo = a.sort {|x,y| y <=> x}
		end
		return aNuevo
	end

	#e) int char_count(string s, char c): Función que devuelve la cantidad de ocurrencias de un caracter c en un string s.
	def char_count(s, c)
		sCharCont = s.size
		cont = 0
		i = 0
		while i < sCharCont do
			if s[i].downcase == c
				cont+=1
			end
			i+=1
		end

		cont
	end

	#f) int atoi(string s): Función que recibe un string representando un entero con signo (en base 10) como argumento y devuelve ese numero en un entero.
	def atoi(s)
		s.to_i
	end
end

class Test
	include Lab01

	def display
		puts "Modulo Lab01 incluido en clase Test"
	end
end


objeto_nuevo = Test.new()
#puts objeto_nuevo.atoi("-10")
