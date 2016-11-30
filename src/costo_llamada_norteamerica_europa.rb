require 'countries'

class CostoLlamadaNorteamericaEuropa

  def costo_por_minuto
    0.7
  end

  def se_encarga_del_destino(destino)
    destino.region == 'Europe' || destino.subregion == 'Northern America'
  end

end