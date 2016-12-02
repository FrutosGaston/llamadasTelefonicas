require 'spec_helper'
require_relative '../src/llamada'
require_relative '../src/costo_de_llamada'
require 'countries'
require 'date'

describe do

  before(:each) do
    @costo_nacional = CostoDeLlamada.new(0.3, -> (llamada){ llamada.es_nacional?})
    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('US'),'Y')

    @llamada = Llamada.new(origen,destino,5, DateTime.new(2016,11,30,11,1,1,'+7'))  end

  it 'The cost per minute in a national call sould be 0.3' do
    expect(@costo_nacional.costo_por_minuto).to be 0.3
  end


  it 'The total cost in a national call of 5 minutes should be 1.5' do
    expect(@costo_nacional.costo_total(@llamada)).to be 0.3*5
  end

end