class Viajes {
	const idiomas = []
	method agregarIdioma(idioma){
		idiomas.add(idioma)
	}
	method getIdiomas(){
		return idiomas.asList()
	}
	method cantIdiomas() { 
		return idiomas.size()
	}
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasActividad()
	method esInteresante(){
		return self.cantIdiomas()>1
	}
	method recomendadaA(socio){
		return (self.esInteresante() and 
				socio.leAtraeActividad(self) and 
				not socio.actividadRealizada(self)
		)
	}
}

class ViajePlaya inherits Viajes{
	var property largoPlaya
	
	override method implicaEsfuerzo(){
		return (largoPlaya>1200)
	}
	override method diasActividad(){
		return largoPlaya/500
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class ViajeCiudad inherits Viajes{
	var property cantAtracciones
	
	override method implicaEsfuerzo(){
		return (cantAtracciones.between(5,8))
	}
	override method diasActividad(){
		return cantAtracciones/2
	}
	override method sirveParaBroncearse(){
		return false
	}
	override method esInteresante(){
		return super() or cantAtracciones == 5
	}
}

class ViajeCiudadTropical inherits ViajeCiudad{
	override method diasActividad(){
		return super()+1
	}
	override method sirveParaBroncearse(){
		return true
	}
}

class SalidaTrekking inherits Viajes{
	var property kmsSenderos
	var property diasSolXAnio
	
	override method diasActividad(){
		return kmsSenderos/50
	}
	override method implicaEsfuerzo(){
		return kmsSenderos>80
	}
	override method sirveParaBroncearse(){
		return diasSolXAnio>200 or 
				(diasSolXAnio.between(100,200) and kmsSenderos>120)
	}
	override method esInteresante(){
		return super() and diasSolXAnio>140
	}
}



