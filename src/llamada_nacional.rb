class LlamadaNacional

  attr_accessor :costo

  def initialize
    @costo = 0
  end

  def costo_por_minuto
    0.3
  end

  def minutes(minutos)
    self.costo = costo_por_minuto * minutos
  end

end