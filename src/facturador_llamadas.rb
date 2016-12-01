require_relative '../src/llamada'

class FacturadorDeLlamadas

  def initialize(tipos_de_llamada)
    @llamadas = []
    @tipos_de_llamadas = tipos_de_llamada
  end

  def factura_del_mes
    10 + costo_total_llamadas
  end

  def agregar_llamada(llamada)
    @llamadas.push(llamada)
  end

  def costo_total_llamadas
    res = 0
    @llamadas.each { |llamada| res += costo_llamada(llamada) }
    res
  end

  def costo_llamada(llamada)
    delegar(llamada).costo_total(llamada)
  end

  def tipo_de_llamada(llamada)
    @tipos_de_llamada.detect { |tipo| tipo.puede_acerse_cargo(llamada)}
  end

end