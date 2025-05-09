object knightRider {
    method peso() {
      return 500
    }
    method peligrosidad() {
      return 10
    }
    method bulto() {
      return 1
    }
    method sufrirCambios() {
      
    }
}

object bumblebee {
    var forma = auto
    method peso() {
      return 800
    }
    method peligrosidad() {
      if (forma == auto) {
        return 15
    } else {
        return 30
    }
    }
    method setearTransformacion(unaForma) {
      forma = unaForma
    }
    method bulto() {
      return 2
    }
    method sufrirCambios() {
        forma = robot
    }
}
object robot {
}
object auto {
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
    method bulto() {
      if (cantidad < 100) {
        return 1
      } else if (cantidad.between(101, 300)) {
        return 2
      } else {
        return 3
      }
    }
    method sufrirCambios() {
        cantidad = cantidad + 12
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
    method bulto() {
      return 1
    }
    method sufrirCambios() {
     peso = peso - 10 
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
    method bulto() {
      if (self.estaConMisiles()) {
        return 2
      } else {
        return 1
      }
    }
    method sufrirCambios() {
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
    method bulto() {
      return 1 + carga.sum({
        cosa => cosa.bulto()
      })
    }
    method sufrirCambios() {
        carga.forEach({
            cosa => cosa.sufrirCambios()
        })
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
    method bulto() {
      return 1
    }
    method sufrirCambios() {
     peso = peso + 15 
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
    method bulto() {
      return 2
    }
    method sufrirCambios() { 
    }
}