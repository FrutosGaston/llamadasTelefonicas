require_relative '../src/costo_de_llamada'
require_relative '../src/costo_llamada_norteamerica_europa'
require_relative '../src/costo_llamada_sudamerica'
require_relative '../src/costo_llamada_resto'
require 'countries'

class CostoLlamadaInternacional < CostoDeLlamada

  attr_accessor :destino

  def initialize(llamada)
    super
    @subclases = [CostoLlamadaNorteamericaEuropa.new, CostoLlamadaSudamerica.new, CostoLlamadaResto.new]
  end

  def costo_por_minuto
    subclase_encargada.costo_por_minuto
  end

  def puede_acerse_cargo(llamada)
    llamada.origen.first != llamada.destino.first
  end

  private
  def subclase_encargada
    (@subclases.select { |llamada| llamada.se_encarga_del_destino(@llamada.destino.first) }).first
  end

end