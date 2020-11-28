#require 'byebug'
require_relative 'cartas'

class Baraja
    attr_accessor :cartas
    def initialize
        #raise ArgumentError, "El argumento debe ser un arreglo " if cartas.class.to_s != "Array"
        
        @cartas = []
        color = ["C", "D", "E", "T"]
        
        color.each do |color|
            13.times do |numero|
                @cartas << Carta.new(numero + 1, color)
            end
        end
    end

    def barajar
        @cartas.shuffle! # Utilizando "!" no es necesario meter el resultado en una variable para mostrarla. Sin él, habría que meter el resultado del método Shuffle en una variable para que se ejecute.
    end

    def sacar
        @cartas.first
    end

    def repartir
        self.barajar
        @mano = []
        @cartas.each_with_index do |carta, index|
            if index + 1 <= 5
                @mano << carta
            end
        end
        @mano
    end
end    

#byebug