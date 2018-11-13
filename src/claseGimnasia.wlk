class ClaseGimnasia {
	const idiomas = ["Español"]
	
	method getIdiomas(){
		return idiomas.asList()
	}
	method implicaEsfuerzo() { return true }
	method sirveParaBroncearse() { return false}
	method diasActividad() { return 1}
	method recomendadaA(socio){
		return socio.edad().between(20,30)
	}
}
