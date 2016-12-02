require 'spec_helper'
require_relative '../src/facturador_llamadas'
require_relative '../src/costo_de_llamada'
require_relative '../src/ubicacion'
require_relative '../src/costos_de_llamada_basicos'

describe  do

  before(:each) do


    @tipos_de_costo = CostosDeLlamadaBasicos.new.tipos_de_costo

    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('US'),'Miami')

    @llamada = Llamada.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    @facturador = FacturadorDeLlamadas.new(@tipos_de_costo)
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.factura_del_mes([])).to be 10
  end

  it 'A bill with a local NATIONAL call of 2 minutes should cost 10.6' do


    expect(@facturador.factura_del_mes([@llamada])).to be 10.6
  end

  it 'A bill with a local LOCAL call of 2 minutes should cost 10.4' do

    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('US'),'NY')

    @llamada = Llamada.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.factura_del_mes([@llamada])).to be 10.4
  end

  it 'A bill with a local INTERNATIONAL call of 2 minutes should cost 10.4' do

    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('ZW'),'Kokonut')

    @llamada = Llamada.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.factura_del_mes([@llamada])).to be 13.0
  end

  it 'A bill with a local INTERNATIONAL and a NATIONAL call of 2 minutes each one, should cost 13.6' do

    origen = Ubicacion.new(ISO3166::Country.new('US'),'NY')
    destino = Ubicacion.new(ISO3166::Country.new('ZW'),'Miami')

    llamada_nueva = Llamada.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.factura_del_mes([@llamada, llamada_nueva])).to be 13.6
  end


end