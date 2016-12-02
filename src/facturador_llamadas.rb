require_relative '../src/llamada'

class FacturadorDeLlamadas

  def initialize(tipos_de_llamada)
    @tipos_de_llamada = tipos_de_llamada
  end

  def factura_del_mes(llamadas)
    10 + costo_total_llamadas(llamadas)
  end

  def costo_total_llamadas(llamadas)
    llamadas.reduce(0) { |acumulador, llamada| acumulador += costo_llamada(llamada) }
  end

  def costo_llamada(llamada)
    tipo_de_llamada(llamada).costo_total(llamada)
  end

  private

  def tipo_de_llamada(llamada)
    @tipos_de_llamada.detect { |tipo| tipo.puede_hacerse_cargo(llamada)}
  end

end