require 'date'
class CostoLlamadaLocalInhabil

  def costo_por_minuto
    0.1
  end

  def esta_en_tiempo(tiempo)

    tiempo.to_date
    !tiempo.saturday? || !tiempo.sunday? || (tiempo.hour <= 8) || (tiempo.hour >= 20)
  end

end