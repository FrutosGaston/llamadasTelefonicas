class CostoLlamadaResto

  def costo_por_minuto
    1.5
  end

  def se_encarga_del_destino(destino)
    destino.region == 'Asia' || destino.region == 'Africa'
  end

end