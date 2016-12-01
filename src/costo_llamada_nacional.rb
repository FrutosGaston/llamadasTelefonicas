require_relative '../src/costo_de_llamada'

class CostoLlamadaNacional < CostoDeLlamada

  attr_accessor :costo

  def costo_por_minuto
    0.3
  end

  def puede_acerse_cargo(llamada)
    llamada.origen.first == llamada.destino.first
  end

end