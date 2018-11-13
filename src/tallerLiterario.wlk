class TallerLiterario {
	const librosUsados = []
	
	method addLibro(libro){
		librosUsados.add(libro)
	}
	method getLibros(){
		return librosUsados.asList()
	}

	method idiomasUsados(){
		return librosUsados.map({libro => libro.idioma()}).asSet()
	}
	method diasActividad(){
		return librosUsados.size()+1
	}
	method implicaEsfuerzo(){
		return self.libroHeavy() or self.fanAutor() 
	}
	method fanAutor(){
		var autor = librosUsados.first().nomAutor()
		return (librosUsados.all({libro => libro.nomAutor() == autor}) and
			librosUsados.size()>1
		) 
	}
	method libroHeavy(){
		return librosUsados.any({libro => libro.cantPaginas()>500})
	}
	
	method sirveParaBroncearse(){
		return false
	}
	method recomendadaA(socio){
		return socio.getIdiomas().size()>1
	}

	
}
class Libro{
	var property idioma
	var property cantPaginas
	var property nomAutor
}