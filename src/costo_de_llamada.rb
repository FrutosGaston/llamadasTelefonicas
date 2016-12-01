require_relative '../src/llamada'

class CostoDeLlamada

  attr_accessor :costo
  attr_accessor :llamada

  def initialize(llamada)
    @llamada = llamada
  end

  def costo_total
    costo = costo_por_minuto * @llamada.duracion
  end

end