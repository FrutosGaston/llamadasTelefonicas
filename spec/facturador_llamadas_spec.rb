require 'spec_helper'
require_relative '../src/facturador_llamadas'
require 'factory_girl'

describe  do

  before(:each) do
    @facturador = FacturadorDeLlamadas.new
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.factura_del_mes).to be 10
  end

  it 'A bill with a local national call of a minute should cost 10.3 and its national calls cost must be 0.3' do

    @facturador.agregar_llamada_nacional(FG.build)

    expect(@facturador.factura_del_mes).to be 10.3
  end


end