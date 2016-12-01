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

end