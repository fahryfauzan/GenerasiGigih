require_relative './martabak'

describe Martabak do
    it 'is delicious' do
        martabak = Martabak.new('Keju')
        taste = martabak.taste
        expect(taste).to eq("Martabak Keju is delicious")
    end
end