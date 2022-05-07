import personas.*

object woody {
	var pintura = 100
	const frasesDelCordon = ["Hay una serpiente en mi bota",
							 "Alguien enveneno el abrevadero",
							 "Corre como el viento Tiro al Blanco"]
	
	method jugar(persona) {
		pintura = 0.max(pintura -10)
		persona.aumentarFelicidad(self.cantCaracteresFrases())
	}
	method tirarDelCordon() = frasesDelCordon.anyOne()
	method hacerseElGalan(frase) { frasesDelCordon.add(frase) }
	method cantCaracteresFrases() = frasesDelCordon.sum({ f => f.size() })
	method buenEstado() = pintura > 50
	method nombreOriginal() = "El vaquero Woody"
	method restaurarValorInicial() { pintura = 100 }
}

object buzz {
	var energia = 100
	
	method jugar(persona) {
		self.volar(persona)
		self.tirarRayosLaser(10)
		self.volar(persona)
		self.tirarRayosLaser(1)
	}
	method volar(persona) {
		persona.aumentarFelicidad(energia *2)
		energia *= 0.5
	}
	method tirarRayosLaser(cantidad) { energia += cantidad *5 }
	method buenEstado() = energia > 50
	method nombreOriginal() = "Buzz Lightyear"
	method restaurarValorInicial() { energia = 100 }
}

object rex {
	var potenciador = 1
	var companieroDeJuego = woody
	
	method jugarVideojuegos() { potenciador *= 2 }
	method companieroDeJuego(nuevoCompaniero) { companieroDeJuego = nuevoCompaniero }
	method jugar(persona) {
		persona.aumentarFelicidad(potenciador *2)
		companieroDeJuego.jugar(persona)
	}
	method buenEstado() = companieroDeJuego.buenEstado()
	method nombreOriginal() = "Rex"
	method restaurarValorInicial() { potenciador = 1 companieroDeJuego = woody }
}

object barbie {
	
	method jugar(persona) {
		if(persona.juegaConMuniecas()) persona.aumentarFelicidad(50)
	}
	method buenEstado() = true
	method nombreOriginal() = "La Barbie Guia"
	method restaurarValorInicial() {}
}