class Socio {
	const idiomasQHabla = []
	const activRealizadas = []
	var property cantMaxActiv
	var property edad
	
	
	method addIdioma(idioma){
		idiomasQHabla.add(idioma)
	}
	method getIdiomas(){
		return idiomasQHabla.asList()
	}
	
	method cantActivRealiz(){
		return activRealizadas.size()
	}
	
	method esAdoradorDelSol(){
		return activRealizadas.all({activ => activ.sirveParaBroncearse()})
	}
	
	method actividadesEsforzadas(){
		return activRealizadas.filter({activ => activ.implicaEsfuerzo()})
	}
	
	method registrarActividad(activ){
		if (self.cantActivRealiz()<cantMaxActiv){
			activRealizadas.add(activ)
		} else { self.error("Llego al limite de actividades maxima") }
	}
	
	method actividadRealizada(activ){
		return activRealizadas.any({ act => act == activ})
	}
	
	method leAtraeActividad(activ)
	
}

class SocioTranquilo inherits Socio{
	override method leAtraeActividad(activ){
		return (activ.diasActividad()>3)
	} 
}

class SocioCoherente inherits Socio{
	override method leAtraeActividad(activ){
		if (self.esAdoradorDelSol()){
			return (activ.sirveParaBroncearse())
		} else { return activ.implicaEsfuerzo() }
	} 
}

class SocioRelajado inherits Socio{
	override method leAtraeActividad(activ){
		return idiomasQHabla.any({idio =>  activ.getIdiomas().any({idiom => idiom == idio})})
	}
}

