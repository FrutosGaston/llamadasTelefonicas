require_relative '../src/delegador_de_llamadas'
require_relative '../src/llamada'

class FacturadorDeLlamadas

  def initialize
    @llamadas = []
  end

  def factura_del_mes
    10 + costo_total_llamadas
  end

  def agregar_llamada(llamada)
    @llamadas.push(llamada)
  end

  def costo_total_llamadas
    res = 0
    @llamadas.each { |llamada| res =+costo_llamada(llamada) }
    res
  end

  def costo_llamada(llamada)
    DelegadorDeLlamadas.new.delegar(llamada).costo_total
  end

end