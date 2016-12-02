require 'spec_helper'
require 'date'
require 'countries'
require_relative '../src/llamada'
require_relative '../src/costo_de_llamada'
require_relative '../src/costos_de_llamada_basicos'



describe do

  before(:each) do
    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('US'),'NY')

    @llamada = Llamada.new(origen,destino,5, DateTime.new(2016,11,30,11,1,1,'+7'))
    @costo_local_habil = CostoDeLlamada.new(0.2, ->(llamada) { llamada.es_local? && llamada.es_dia_de_semana? & llamada.es_horario_laboral?})
    @costo_local_no_habil = CostoDeLlamada.new(0.1, ->(llamada){llamada.es_local? &&  llamada.es_fin_de_semana? || llamada.es_horario_no_laboral? })
  end

  it 'sadd' do
    @llamada.momento = dia_habil

    expect(@costo_local_habil.costo_por_minuto).to be 0.2
  end

  it 'ddhf' do
    @llamada.momento = fin_de_semana

    expect(@costo_local_no_habil.costo_por_minuto).to be 0.1
  end

  it 'gsd' do
    @llamada.momento = dia_semana_madrugada

    expect(@costo_local_no_habil.costo_por_minuto).to be 0.1
  end

  it ' asd' do
    @llamada.momento = dia_habil
    minutos = 5

    @llamada.duracion = minutos

    expect(@costo_local_habil.costo_total(@llamada)).to be 0.2 * minutos
  end





  def dia_habil
    DateTime.new(2016,11,30,11,1,1,'+7')
  end

  def dia_semana_madrugada
    DateTime.new(2016,11,30,4,1,1,'+7')
  end

  def fin_de_semana
    DateTime.new(2016,11,27,11,1,1,'+7')
  end

end