require 'spec_helper'
require_relative '../src/costo_llamada_nacional'
require 'countries'
require_relative '../src/llamada'

describe do

  before(:each) do
    @costo_llamada = CostoLlamadaNacional.new(@llamada)
    @llamada = Llamada.new(ISO3166::Country.new('US'),ISO3166::Country.new('US'),1, DateTime.new(2016,11,30,11,1,1,'+7'))
  end

  it 'should do something' do

    expect(@costo_llamada.costo_por_minuto).to be 0.3
  end

  it 'aa' do
    @llamada.duracion = 5

    expect(@costo_llamada.costo_total).to be 0.3*5
  end

end