require 'spec_helper'
require 'countries'
require_relative '../src/llamada'
require_relative '../src/costo_de_llamada'
require_relative '../src/costos_de_llamada_basicos'



describe do

  before(:all) do
    @costos_de_llamada = CostosDeLlamadaBasicos.new
  end

  it 'should do hsomething' do
    costo_norteamerica_europa = @costos_de_llamada.costo_norteamerica_europa

    expect(costo_norteamerica_europa.costo_por_minuto).to be 0.7
  end

  it 'asdf' do
    costo_sudamerica = @costos_de_llamada.costo_sudamerica

    expect(costo_sudamerica.costo_por_minuto).to be 0.5
  end

  it 'asddsfgf' do
    costo_internacional_resto = @costos_de_llamada.costo_internacional_resto

    expect(costo_internacional_resto.costo_por_minuto).to be 1.5
  end

end
