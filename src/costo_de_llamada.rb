require_relative '../src/llamada'

class CostoDeLlamada

  attr_accessor :costo

  def initialize(llamada)
    @momento_de_llamada = DateTime.now
    @llamada = llamada
  end

  def costo_total
    costo = costo_por_minuto * @llamada.duracion
  end

end