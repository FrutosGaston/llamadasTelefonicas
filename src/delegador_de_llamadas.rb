require_relative '../src/costo_llamada_nacional'
require_relative '../src/costo_llamada_internacional'
require_relative '../src/costo_llamada_local'
require_relative '../src/llamada'

class DelegadorDeLlamadas

  def initialize
    @tipos_de_llamada = [CostoLlamadaLocal.new(nil), CostoLlamadaInternacional.new(nil), CostoLlamadaNacional.new(nil)]
  end

  def delegar(llamada)

    tipo = @tipos_de_llamada.detect { |tipo| tipo.puede_acerse_cargo(llamada)}
    tipo.llamada = llamada
    tipo
  end

end