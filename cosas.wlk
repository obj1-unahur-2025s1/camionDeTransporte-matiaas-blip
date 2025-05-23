object knightRider {
    method peso() {
      return 500
    }
    method peligrosidad() {
      return 10
    }
}

object bumblebee {
    var forma = "auto"
    method peso() {
      return 800
    }
    method peligrosidad() {
      if (forma == "auto") {
        return 15
    } else {
        return 30
    }
    }
    method setearTransformacion(unaForma) {
      forma = unaForma
    }
}

object paqueteLadrillos {
    var cantidad = 10
    method peso() {
      return 2 * cantidad
    }
    method peligrosidad() {
      return 2
    }
    method cantidadDelPaquete(unaCantidad) {
      cantidad = unaCantidad
    }
}

object arenaGranel {
    var peso = 100
    method peso() {
      return peso
    }
    method peligrosidad() {
      return 1
    }
    method setPeso(unPeso) {
      peso = unPeso
    }
}

object bateriaAntiaerea {
    var misiles = true
    method estaConMisiles() {
      return misiles
    }
    method peso() {
      if (self.estaConMisiles()) {
        return 300
      }else {
        return 200
      }
    }
    method peligrosidad() {
      if (self.estaConMisiles()) {
        return 100
    } else {
        return 0
    }
    }
    method activarMisiles() {
      misiles = true
    }
}

object contenedorPortuario {
    var carga = #{} 
    method cargaPeso() {
     return carga.sum({
        cosas => cosas.peso()
      })
    }
    method peso() {
      return 100 + self.cargaPeso()
    }
    method peligrosidad() {
      if (carga.isEmpty()) {
        return 0
      } else {
        carga.max({
            cosa => cosa.peligrosidad()
        })
      }
    }
    method guardar(cosa) {
      carga.add(cosa)
    }
}

object residuosRadioactivos {
    var peso = 100
    method peso() {
      return peso
    }
    method peligrosidad() {
      return 200
    }
    method decidirPeso(unpeso) {
      peso = unpeso
    }
}

object embalajeSeguridad {
    var cosaAdentro = bumblebee
    method peso() {
      return cosaAdentro.peso()
    }
    method peligrosidad() {
      return cosaAdentro.peligrosidad()/2
    }
    method embalar(cosa) {
      cosaAdentro = cosa
    }
}


