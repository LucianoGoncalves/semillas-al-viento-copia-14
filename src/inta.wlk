import parcelas.*

object inta {

	var property parcelasQueTiene = #{}

	method promedioDePlantas() {
		return parcelasQueTiene.sum({ parcela => parcela.tamanioDeLaColeccion() }) / self.cantidadDeParcelasQueTiene()
	}

	method cantidadDeParcelasQueTiene() {
		return parcelasQueTiene.size()
	}

	method parcelaMasAutosustentable() {
		return parcelasQueTiene.max({ parcela => parcela.tamanioDeLaColeccion() > 4 and parcela.porcentajeDePlantasBienAsociadas() })
	}

}

