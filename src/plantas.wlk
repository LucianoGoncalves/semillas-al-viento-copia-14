class Planta {

	var property anioDeObtencion = 0
	var property alturaEnMetros = 0

//	var property cantidadDeSolQueSoporta = 7
	method cantidadDeSolQueTolera()

	method esFuerte() {
		return self.toleraCantidadDeHoras(9)
	}

	method daNuevasSemillas() {
		return self.esFuerte() or self.daSemillas()
	}

	method daSemillas()

	method espacioQueOcupa()

	method toleraCantidadDeHoras(numeroDeHoras) {
		return toleranciaDeSolAlDia.cantidadDeSolQueSoporta() > numeroDeHoras
	}

}

object toleranciaDeSolAlDia {

	var property cantidadDeSolQueSoporta = 7

}

class Menta inherits Planta {

	override method daSemillas() {
		return alturaEnMetros > 0.4
	}

	override method espacioQueOcupa() {
		return alturaEnMetros + 1
	}

}

class Soja inherits Planta {

	override method toleraCantidadDeHoras(numeroDeHoras) {
		return self.toleranciaDeSolDeLaPlanta() > numeroDeHoras
	}

	method toleranciaDeSolDeLaPlanta() {
		return if (alturaEnMetros < 0.5) {
			6
		} else if (alturaEnMetros.between(0.5, 1)) {
			8
		} else {
			12
		}
	}

	override method daSemillas() {
		return anioDeObtencion > 2007 and alturaEnMetros.between(0.75, 09)
	}

	override method espacioQueOcupa() {
		return alturaEnMetros / 2
	}

}

class Quinoa inherits Soja {

	var property espacio = 0

	override method espacioQueOcupa() {
		return espacio
	}

	override method toleranciaDeSolDeLaPlanta() {
		return if (alturaEnMetros < 0.3) {
			10
		} else {
			toleranciaDeSolAlDia.cantidadDeSolQueSoporta()
		}
	}

	override method daSemillas() {
		return anioDeObtencion < 2005
	}

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() {
		return false
	}

}

class Hierbabuena inherits Menta {

	override method espacioQueOcupa() {
		return super() * 2
	}

}

