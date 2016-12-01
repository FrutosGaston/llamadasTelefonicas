require_relative '../src/costo_de_llamada'
require_relative '../src/costo_llamada_local_habil'
require_relative '../src/costo_llamada_local_inhabil'
require 'date'

class CostoLlamadaLocal < CostoDeLlamada


  def initialize(llamada)
    super
    @subclases = [CostoLlamadaLocalHabil.new, CostoLlamadaLocalInhabil.new]
  end

  def costo_por_minuto
    subclase_encargada.costo_por_minuto
  end

  def puede_acerse_cargo(llamada)
    llamada.origen.first == llamada.destino.first && llamada.origen.last == llamada.destino.last
  end

  private
  def subclase_encargada
    (@subclases.select { |llamada| llamada.esta_en_tiempo(@llamada.momento) }).first
  end

end