require 'spec_helper'
require 'date'
require 'countries'
require_relative '../src/llamada'

describe do

#  3)  Las llamadas locales tienen distintos valores según la franja horaria en la que se realizan y el día.
#     Para los días hábiles, de 8 a 20 hrs. el costo es de 0,20 centavos el minuto,
# mientras en el resto de las horas es de 0,10 centavos el minuto. Los sábados y domingos cuesta 0,10 centavos el minuto

  before(:each) do
    @llamada = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('US'),'NY',5, DateTime.new(2016,11,30,11,1,1,'+7'))
    @costo_llamada = CostoLlamadaLocal.new(@llamada)
  end

  it 'sadd' do
    @llamada.momento = dia_habil

    expect(@costo_llamada.costo_por_minuto).to be 0.2
  end

  it 'ddhf' do
    @llamada.momento = fin_de_semana

    expect(@costo_llamada.costo_por_minuto).to be 0.1
  end

  it 'gsd' do
    @llamada.momento = dia_semana_madrugada

    expect(@costo_llamada.costo_por_minuto).to be 0.1
  end

  it ' asd' do
    @llamada.momento = dia_habil
    minutos = 5

    @llamada.duracion = minutos

    expect(@costo_llamada.costo_total).to be 0.2 * minutos
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