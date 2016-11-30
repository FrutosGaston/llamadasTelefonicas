require 'spec_helper'
require_relative '../src/llamada_nacional'

describe '' do

  it 'should do something' do

    @llamada = LlamadaNacional.new
    expect(@llamada.costo_por_minuto).to be 0.3
  end

  it 'aa' do
    @llamada = LlamadaNacional.new
    @llamada.minutes(5)

    expect(@llamada.costo).to be 0.3*5
  end



end