object luisa{
    var personajeActivo = mario

    method personajeActivo(){
        return personajeActivo
    }

    method cambiarJugador(unPersonaje){
        personajeActivo = unPersonaje
    }

    method aparece(unElemento){
        (personajeActivo.encontrar(unElemento))
    }
}

object floki{
    var armaActual = ballesta
    
    method cambiarArma(nuevaArma){
        armaActual = nuevaArma
    }

    method encontrar(elemento){
        armaActual.atacar()
        elemento.recibirAtaque(armaActual.potencia())
    }
}

object mario{
    var valorRecolectado = 0
    var ultimoElementoEncontrado = aurora
    
    method encontrar(elemento){
        elemento.recibirTrabajo()
        valorRecolectado = valorRecolectado + elemento.valorQueOtorga()
        ultimoElementoEncontrado = elemento
    }

    method valorRecolectado(){
        return valorRecolectado
    }

    method estaFeliz(elemento){
        return (valorRecolectado >= 50) or (elemento.altura() >= 10)
    }


}

object ballesta{
    const potencia = 4
    var municion = 10

    method potencia(){
        return potencia
    }

    method atacar(){
        if (municion > 0){
            municion = municion - 1
        }
    }

}

object jabalina{
    const potencia = 30
    var usos = 1

    method potencia(){
        return potencia
    }

    method atacar(){
        if (usos > 0) {
            usos = usos - 1
        }
    }
}

object castillo{
    const altura = 20
    var nivelDeDefensa = 150

    method alturaCastillo(){
        return altura
    }

    method defensaCastillo(){
        return nivelDeDefensa
    }

    method recibirAtaque(potencia){
        nivelDeDefensa = nivelDeDefensa - potencia
    }

    method recibirTrabajo(){
        nivelDeDefensa= (nivelDeDefensa + (20)).min(200)
    }

    method valorQueOtorga(mario){
        mario.valorRecolectado() + (self.defensaCastillo() / 5)
    }
}

object aurora{
    const altura = 1
    var estaViva = true

    method recibirAtaque(potencia){
        if (potencia >= 10){
            estaViva = false
        }
    }
    
    method valorQueOtorga(mario){
        mario.valorRecolectado() + 15
    }

    method altura() {
      return altura
    }

}

object tipa{
    var altura = 8

    method recibirAtaque(potencia){
    }


    method altura(){
        return altura
    }

    method recibirTrabajo(){
        altura= altura + 1
    }

    method valorQueOtorga(mario){
        mario.valorRecolectado() + (self.altura() * 2)
    }
}