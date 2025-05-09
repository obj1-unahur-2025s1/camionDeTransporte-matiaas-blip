import cosas2.*
object camion {
    var carga = #{}
    method peso() {
      return 1000
    }
    method cargaPeso() {
      return carga.sum({
        cosas => cosas.peso()
      })
    }
    method cargar(cosa) {
      carga.add(cosa)
      cosa.sufrirCambios()
    }
    method descargar(cosa) {
      carga.remove(cosa)
    }
    method pesoTotal() {
      return self.peso() + self.cargaPeso()
    }
    method pesoCargaEsPar() {
      return self.cargaPeso().even()
    }
    method hayAlgoQuePese(unPeso) {
      return carga.any({
        cosa => cosa.peso() == unPeso
      })
    }
    method primeraCosaConPeligrosidad(nivelPeligrosidad) {
      return carga.find({
        cosa => cosa.peligrosidad() == nivelPeligrosidad
      })
    }
    method cosasConIgualPeligrosidad(nivelPeligrosidad) {
      var cosasConMas = carga.add({
        cosas => carga.any({
          cosa => cosa.peligrosidad() == nivelPeligrosidad
        })
      })
      return cosasConMas
    }
    method listaCosasQueSuperanPeligrosidad(unaCosa) {
      var cosasConMas = carga.add({
        cosas => carga.any({
          cosa => cosa.peligrosidad() > unaCosa.peligrosidad()
        })
      })
      return cosasConMas
    }
    method estaExcedidoDePeso() {
      return self.pesoTotal() > 2500
    }
    method puedeCircularEnRuta(nivelMaximo) {
      return !self.estaExcedidoDePeso() || !carga.any({
        cosa => cosa.peligrosidad() > nivelMaximo
      })
    }
    method cosaMasPesada() {
      return carga.max({
        cosa => cosa.peso()
      })
    }
    method hayCosaConPesoEntre(minimo,maximo) {
      return carga.any({
        cosa => cosa.peso().between(minimo, maximo)
      })
    }
}