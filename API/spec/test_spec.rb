

describe 'suite de teste' do

    it 'soma valor' do
        v1 = 2
        v2 = 3
        result = v1 + v2
        valor_tela = 'R$5'
        valor_numerico = valor_tela.gsub("R$","")
        expect(result).to eql valor_numerico.to_i
    end
end