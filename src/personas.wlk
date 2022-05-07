import juguetes.*

object andy {
	var felicidad = 200
	const juguetes = []
	
	method nivelFelicidad() = felicidad
	method agarrarJuguete(juguete) { juguetes.add(juguete) }
	method perderJuguete() { juguetes.remove(juguetes.last()) }
	method aburrirse(minutos) { felicidad = 0.max(felicidad - minutos*10) }
	method dormir() { felicidad = 200 }
	method jugar() { juguetes.forEach({ j => j.jugar(self) }) }
	method juegaConMuniecas() = false
	method pasarLaNoche() {
		self.dormir()
		felicidad += self.cantJuguetesEnBuenEstado() *20
	}
	method cantJuguetesEnBuenEstado() = juguetes.count({ j => j.buenEstado() })
	method aumentarFelicidad(aumento) { felicidad += aumento }
	method nombresJuguetes() = juguetes.map({ j => j.nombreOriginal() })
}

object molly {
	var felicidad = 400
	
	method nivelFelicidad() = felicidad
	method manotear(juguete) { juguete.jugar(self) }
	method juegaConMuniecas() = true
}

object reparador {
	
	method reparar(juguete) {
		juguete.jugar(self)
		juguete.restaurarValorInicial()
	}
}