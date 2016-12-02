require 'spec_helper'
require 'countries'
require_relative '../src/llamada'
require_relative '../src/costo_de_llamada'


describe do

  before(:each) do
    @llamada = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('US'),'NY',5, DateTime.new(2016,11,30,11,1,1,'+7'))
  end

  it 'should do hsomething' do
    costo_norteamerica_europa = CostoDeLlamada.new(0.7, ->(llamada) {llamada.llamada_a_europa? || llamada.llamada_a_norteamerica?})

    @llamada.cambiar_pais_destino(ISO3166::Country.new('US'))

    expect(costo_norteamerica_europa.costo_por_minuto).to be 0.7
  end

  it 'asdf' do
    costo_sudamerica = CostoDeLlamada.new(0.5, ->(llamada) {llamada.llamada_a_sudamerica?})

    @llamada.cambiar_pais_destino(ISO3166::Country.new('AR'))

    expect(costo_sudamerica.costo_por_minuto).to be 0.5
  end

  it 'asddsfgf' do
    costo_internacional_resto = CostoDeLlamada.new(1.5, ->(llamada) {llamada.es_internacional?})

    @llamada.cambiar_pais_destino(ISO3166::Country.new('ZW'))

    expect(costo_internacional_resto.costo_por_minuto).to be 1.5
  end

end
