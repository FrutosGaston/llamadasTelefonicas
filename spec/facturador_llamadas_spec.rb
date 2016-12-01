require 'spec_helper'
require_relative '../src/facturador_llamadas'

describe  do

  before(:each) do
    @llamada = Llamada.new(ISO3166::Country.new('US'),'NY',ISO3166::Country.new('US'),'Miami',2, DateTime.new(2016,11,30,11,1,1,'+7'))
    @facturador = FacturadorDeLlamadas.new
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.factura_del_mes).to be 10
  end

  it 'A bill with a local NATIONAL call of 2 minutes should cost 10.6' do

    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 10.6
  end

  it 'A bill with a local LOCAL call of 2 minutes should cost 10.4' do

    @llamada.destino[1] = 'NY'
    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 10.4
  end

  it 'A bill with a local INTERNATIONAL call of 2 minutes should cost 10.4' do

    @llamada.destino[0] = ISO3166::Country.new('ZW')
    @facturador.agregar_llamada(@llamada)

    expect(@facturador.factura_del_mes).to be 13.0
  end


end