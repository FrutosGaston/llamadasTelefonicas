require 'spec_helper'
require_relative '../src/facturador_llamadas'
require_relative '../src/costo_de_llamada'

describe  do

  before(:each) do
    costo_local_habil = CostoDeLlamada.new(0.2, ->(llamada) { llamada.es_local? && llamada.es_dia_de_semana? & llamada.es_horario_laboral?})
    costo_local_no_habil = CostoDeLlamada.new(0.1, ->(llamada){llamada.es_local? &&  llamada.es_fin_de_semana? || llamada.es_horario_no_laboral? })
    costo_nacional = CostoDeLlamada.new(0.3, ->(llamada) {llamada.es_nacional?})
    costo_norteamerica_europa = CostoDeLlamada.new(0.7, ->(llamada) {llamada.llamada_a_europa? || llamada.llamada_a_norteamerica?})
    costo_sudamerica = CostoDeLlamada.new(0.5, ->(llamada) {llamada.llamada_a_sudamerica?})
    costo_internacional_resto = CostoDeLlamada.new(1.5, ->(llamada) {llamada.es_internacional?})

    @tipos_de_costo = [costo_local_habil, costo_local_no_habil, costo_nacional,
                       costo_norteamerica_europa, costo_sudamerica, costo_internacional_resto]

    @llamada = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('US'),'Miami',2, DateTime.new(2016,11,30,11,1,1,'+7'))

    @facturador = FacturadorDeLlamadas.new(@tipos_de_costo)
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.factura_del_mes).to be 10
  end

  it 'A bill with a local NATIONAL call of 2 minutes should cost 10.6' do

    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 10.6
  end

  it 'A bill with a local LOCAL call of 2 minutes should cost 10.4' do

    @llamada.cambiar_ciudad_destino('NY')
    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 10.4
  end

  it 'A bill with a local INTERNATIONAL call of 2 minutes should cost 10.4' do

    @llamada.cambiar_pais_destino(ISO3166::Country.new('ZW'))
    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 13.0
  end

  it 'eA bill with a local INTERNATIONAL and a NATIONAL call of 2 minutes each one, should cost 13.6' do

    @facturador.agregar_llamada(@llamada)
    llamada_nueva = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('ZW'),'Miami',2, DateTime.new(2016,11,30,11,1,1,'+7'))
    @facturador.agregar_llamada(llamada_nueva)

    expect(@facturador.factura_del_mes).to be 13.6
  end


end