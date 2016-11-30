class Llamada

  attr_accessor :destino
  attr_accessor :momento
  attr_accessor :duracion


  def initialize(origen, destino, duracion, momento)

    @origen = origen
    @destino = destino
    @duracion = duracion
    @momento = momento

  end

end