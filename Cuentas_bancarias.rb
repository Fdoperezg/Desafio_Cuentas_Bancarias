#require 'byebug'

class Usuario
    attr_accessor :cuenta_bancaria,  :nombre
    def initialize(nombre, cuenta_bancaria)
        raise ArgumentError, "Se necesita al menos una cuenta" if cuenta_bancaria.size < 1
        @nombre = nombre
        @cuenta_bancaria = cuenta_bancaria
    end

    def saldo_total
        @cuenta_bancaria.map { |x| x.saldo}.sum
    end
end

class CuentaBancaria
    attr_accessor :banco, :numero_de_cuenta, :saldo
    def initialize(banco, numero_de_cuenta, saldo = 0)
        @banco = banco
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
    end

    def transferir(monto, cuenta_destino)
        self.saldo -= monto #self.saldo es lo mismo que decir @saldo
        cuenta_destino.saldo += monto
    end
end

cuenta1 = CuentaBancaria.new("Banco de Chile", 1234,5000)
cuenta2 = CuentaBancaria.new("Banco Santander", 5678, 5000)
cuenta3 = CuentaBancaria.new("Banco Itaú", 007, 15000)
usuario1 = Usuario.new("Matías", [cuenta1, cuenta3])
usuario2 = Usuario.new("Sixto", [cuenta2])

puts cuenta1.transferir(5000, cuenta2)
puts usuario1.saldo_total