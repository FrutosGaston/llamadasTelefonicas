require 'date'
class CostoLlamadaLocalHabil

  def costo_por_minuto
    0.2
  end

  def esta_en_tiempo(tiempo)

    tiempo.to_date
    !tiempo.saturday? & !tiempo.sunday? & (tiempo.hour > 8) & (tiempo.hour < 20)
  end

end