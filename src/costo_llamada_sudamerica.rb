require 'countries'

class CostoLlamadaSudamerica

  def costo_por_minuto
    0.5
  end

  def se_encarga_del_destino(destino)
    destino.subregion == 'South America'
  end

end