require './utils/input.rb'

def normaliza_string(str)
  str = str.length > 11 ? str.slice(0,11) : str
  str.length < 11 ? str.ljust(11, ' ') : str
end

def solucao(arg)
  arg.map do |hash| 
    "#{normaliza_string(hash[:name])}#{normaliza_string(hash[:cpf])}#{normaliza_string(hash[:state])}#{normaliza_string(hash[:value])}"
  end.join("\n")
end

puts solucao(INPUT)