require 'spec_helper'
require 'countries'
require_relative '../src/costo_llamada_internacional'
require_relative '../src/llamada'

describe do

  before(:each) do
    @llamada = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('US'),'NY',5, DateTime.new(2016,11,30,11,1,1,'+7'))
      @costo_llamada = CostoLlamadaInternacional.new(@llamada)
  end

  it 'should do hsomething' do
      @llamada.destino[0] = ISO3166::Country.new('US')

      expect(@costo_llamada.costo_por_minuto).to be 0.7
  end

  it 'asdf' do
    @llamada.destino[0] = ISO3166::Country.new('AR')

    expect(@costo_llamada.costo_por_minuto).to be 0.5
  end

  it 'asddsfgf' do
    @llamada.destino[0] = ISO3166::Country.new('ZW')

    expect(@costo_llamada.costo_por_minuto).to be 1.5
  end

end
