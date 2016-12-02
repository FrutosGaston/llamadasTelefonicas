require_relative '../src/costo_de_llamada'

class CostosDeLlamadaBasicos

  attr_accessor :tipos_de_costo
  attr_reader :costo_local_habil
  attr_reader :costo_local_no_habil
  attr_reader :costo_nacional
  attr_reader :costo_norteamerica_europa
  attr_reader :costo_sudamerica
  attr_reader :costo_internacional_resto


  def initialize
    @costo_local_habil = CostoDeLlamada.new(0.2, ->(llamada) { llamada.es_local? && llamada.es_dia_de_semana? & llamada.es_horario_laboral?})
    @costo_local_no_habil = CostoDeLlamada.new(0.1, ->(llamada){llamada.es_local? &&  llamada.es_fin_de_semana? || llamada.es_horario_no_laboral? })
    @costo_nacional = CostoDeLlamada.new(0.3, ->(llamada) {llamada.es_nacional?})
    @costo_norteamerica_europa = CostoDeLlamada.new(0.7, ->(llamada) {llamada.llamada_a_europa? || llamada.llamada_a_norteamerica?})
    @costo_sudamerica = CostoDeLlamada.new(0.5, ->(llamada) {llamada.llamada_a_sudamerica?})
    @costo_internacional_resto = CostoDeLlamada.new(1.5, ->(llamada) {llamada.es_internacional?})

    @tipos_de_costo = [ @costo_local_habil, @costo_local_no_habil, @costo_nacional, @costo_norteamerica_europa, @costo_sudamerica, @costo_internacional_resto ]
  end

end