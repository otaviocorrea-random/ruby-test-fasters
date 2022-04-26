require 'yaml'
CFG = YAML.load_file('./utils/format_1.yaml')

require './utils/input.rb'

def normaliza_string(key, value, params)
  len = params['length'].to_i

  value = value.slice(0,len) if value.length > len
  value = add_padding(value, params['align'], params['spaces'], len) if value.length < len

  value
end

def add_padding(value, align, type, len)
  space = type == 'spaces' ? ' ' : '0'
  obj = {
    left: value.ljust(len, space),
    right: value.rjust(len, space),
  }[align.to_sym || :right] 
end

def solucao(arg)
  arg.map do |hash|
    CFG.keys.map do |key|
      normaliza_string(key, hash[key.to_sym], CFG[key])
    end.join
  end.join("\n") 
end

puts solucao(INPUT)

