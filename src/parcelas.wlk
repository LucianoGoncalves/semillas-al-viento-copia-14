import plantas.*

class Parcela {

	var property ancho = 0
	var property largo = 0
	var property horasDeSolAlDia = 0
	var property plantasQueTiene = #{}

	method superficieDeLaParcela() {
		return ancho * largo
	}

	method cantidaMaximaDePlantasQueTolera() {
		return if (largo > 3) {
			largo + 4
		} else {
			self.superficieDeLaParcela() / 2
		}
	}

	method tieneComplicaciones() {
		return plantasQueTiene.any({ planta => planta.cantidadDeSolQueTolera() < horasDeSolAlDia })
	}

	method plantar(unaPlanta) {
		if (self.tamanioDeLaColeccion() > self.cantidaMaximaDePlantasQueTolera()) {
			self.error("La planta supera la cantidad maxima")
		} else if (unaPlanta.cantidadDeSolQueTolera() + 2 <= self.horasDeSolAlDia()) {
			self.error("La parcela recibe mas sol que la planta tolera")
		}
		plantasQueTiene.add(unaPlanta)
	}

	method tamanioDeLaColeccion() {
		return plantasQueTiene.size()
	}

	method esIdealPara(unaPlanta) {
		return unaPlanta.esIdealEn(self)
	}

	method seAsociaBien(unaPlanta)

	method porcentajeDePlantasBienAsociadas() {
		return (plantasQueTiene.count({ planta => planta.seAsociaBien(planta) }) * 100) / self.tamanioDeLaColeccion()
	}

}

class ParcelaEcologica inherits Parcela {

	override method seAsociaBien(unaPlanta) {
		return not self.tieneComplicaciones() and self.esIdealPara(unaPlanta)
	}

}

class ParcelaIndustrial inherits Parcela {

	override method seAsociaBien(unaPlanta) {
		return self.tamanioDeLaColeccion() <= 2 and unaPlanta.esFuerte()
	}

}

