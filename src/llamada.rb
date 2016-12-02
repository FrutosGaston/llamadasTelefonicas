require 'countries'
require 'date'

class Llamada

  attr_accessor :destino
  attr_accessor :momento
  attr_accessor :duracion
  attr_accessor :origen


  def initialize(pais_origen,ciudad_origen, pais_destino, ciudad_destino, duracion, momento)

    @origen = [pais_origen , ciudad_origen]
    @destino = [pais_destino, ciudad_destino]
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
    @origen.first == @destino.first
  end

  def es_local?
    es_nacional? && @origen.last == @destino.last
  end

  def es_internacional?
    ! es_nacional?
  end

  def llamada_a_europa?
    @destino.first.region == 'Europe'
  end

  def llamada_a_norteamerica?
    @destino.first.region == 'Northern America'
  end

  def llamada_a_sudamerica?
    @destino.first.region == 'South America'
  end

  def cambiar_ciudad_destino(ciudad)
    @destino[1] = ciudad
  end

  def cambiar_pais_destino(pais)
    @destino[0] = pais
  end

end