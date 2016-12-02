require 'countries'
require 'date'
require_relative '../src/ubicacion'

class Llamada

  attr_accessor :destino
  attr_accessor :momento
  attr_accessor :duracion
  attr_accessor :origen


  def initialize(ubicacion_origen, ubicacion_destino, duracion, momento)

    @origen = ubicacion_origen
    @destino = ubicacion_destino
    @duracion = duracion
    @momento = momento

  end

  def es_dia_de_semana?
    ! es_fin_de_semana?
  end

  def es_horario_laboral?
    (@momento.hour > 8) & (@momento.hour < 20)
  end

  def es_fin_de_semana?
    @momento.saturday? || @momento.sunday?
  end

  def es_horario_no_laboral?
    (@momento.hour <= 8) & (@momento.hour <= 20)
  end

  def es_nacional?
    @origen.es_mismo_pais?(@destino)
  end

  def es_local?
    es_nacional? && @origen.es_misma_ciudad?(@destino)
  end

  def es_internacional?
    ! es_nacional?
  end

  def llamada_a_europa?
    @destino.es_pais?('Europe')
  end

  def llamada_a_norteamerica?
    @destino.es_region?('Northern America')
  end

  def llamada_a_sudamerica?
    @destino.es_region?('South America')
  end

end