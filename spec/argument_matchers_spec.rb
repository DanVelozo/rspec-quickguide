# page 57 - rspec quickguide (howto)

require 'rails_helper'

describe User do
  it 'initializes user with name' do
    User.should_receive(:new).with(name: 'Danilo Velozo')
    User.new name: 'Danilo Velozo'
  end

  # Com um ou mais argumentos, de qualquer tipo
  it 'initializes with anything' do
    User.should_receive(:new).with(anything)
    User.new(name: 'Danilo Velozo')
  end

  # Com qualquer quantidade de argumentos, de qualquer tipo
  it 'initializes with or without arguments' do
    User.should_receive(:new).with(any_args).twice
    User.new
    User.new(name: 'Danilo Velozo')
  end

  # Com os valores de um hash
  it 'initializes with name' do
    User.should_receive(:new).with(hash_including(name: 'Danilo Velozo'))
    User.new(email: 'danilo@teste.com', name: 'Danilo Velozo')
  end

  # Sem os valores de um hash
  it 'initializes without name' do
    User.should_receive(:new).with(hash_not_including(name: 'Danilo Velozo'))
    User.new(email: 'danilo@teste.com')
  end

  # Com uma string em um determinado padrao
  it 'sets name' do
    subject.should_receive(:name=).with(/Danilo/)
    subject.name = 'Danilo Velozo'
  end

  # Com uma instancia
  it 'sets name' do
    subject.should_receive(:name=).with(instance_of(String))
    subject.name = 'Danilo Velozo'
  end

  # vc tb pode especificar se ele deve apenas descender de uma superclasse.
  it 'should set name' do
    Object.const_set(:SuperString, Class.new(String))

    subject.should_receive(:name=).with(kind_of(String))
    subject.name = SuperString.new
  end

  # Com um objeto que responde a um metodo
  it 'sets name' do
    subject.should_receive(:name=).with(duck_type(:<<)).twice
    subject.name = 'Danilo Velozo'
    subject.name = ['Danilo Velozo']
  end

  # com um valor booleano
  it 'is not an admin' do
    subject.should_receive(:admin=).with(boolean)
    subject.admin = false
  end
end
