require_relative 'validador'
require_relative 'validador_cpf'
require_relative 'validador_cnpj'

puts "Digite seu documento (CPF ou CNPJ):"
documento = gets.chomp

# Determina a estratégia a ser utilizada com base no tamanho do documento
strategy = documento.length > 11 ? ValidadorCNPJ : ValidadorCPF

# Valida o documento usando a estratégia apropriada
resultado = Validador.validar(documento, strategy)

if resultado
  puts "O documento #{documento} é válido."
else
  puts "O documento #{documento} é inválido."
end
