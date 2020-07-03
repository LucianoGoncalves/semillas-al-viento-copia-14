import parcelas.*

class Planta {

	var property anioDeObtencion = 0
	var property alturaEnMetros = 0

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
		return self.cantidadDeSolQueTolera() > numeroDeHoras
	}

	method esIdealEn(unaParcela)

}

class Menta inherits Planta {

	override method daSemillas() {
		return alturaEnMetros > 0.4
	}

	override method espacioQueOcupa() {
		return alturaEnMetros + 1
	}

	override method cantidadDeSolQueTolera() {
		return toleranciaDeSolAlDia.cantidadDeSolQueSoporta()
	}

	override method esIdealEn(unaParcela) {
		return unaParcela.superficieDeLaParcela() > 6
	}

}

object toleranciaDeSolAlDia {

	var property cantidadDeSolQueSoporta = 7

}

class Soja inherits Planta {

	override method cantidadDeSolQueTolera() {
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

	override method esIdealEn(unaParcela) {
		return unaParcela.horasDeSolAlDia() == self.cantidadDeSolQueTolera()
	}

}

class Quinoa inherits Soja {

	var property espacio = 0

	override method espacioQueOcupa() {
		return espacio
	}

	override method cantidadDeSolQueTolera() {
		return if (alturaEnMetros < 0.3) {
			10
		} else {
			toleranciaDeSolAlDia.cantidadDeSolQueSoporta()
		}
	}

	override method daSemillas() {
		return anioDeObtencion < 2005
	}

	override method esIdealEn(unaParcela) {
		return unaParcela.plantasQueTiene().all({ planta => planta.alturaEnMetros() <= 1.5 })
	}

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() {
		return false
	}
	
	override method daSemillas() {
		return false
	}

	override method esIdealEn(unaParcela) {
		return unaParcela.cantidaMaximaDePlantasQueTolera() == 1
	}

}

class Hierbabuena inherits Menta {

	override method espacioQueOcupa() {
		return super() * 2
	}

}

