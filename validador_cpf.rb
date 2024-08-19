class ValidadorCPF
  def self.validar(cpf)
    cpf = cpf.gsub(/\D/, '')
    return false unless cpf.length == 11

    digitos_calculados = calcular_digitos_verificadores(cpf)
    digitos_fornecidos = [cpf[9].to_i, cpf[10].to_i]

    digitos_calculados == digitos_fornecidos
  end

  private

  def self.calcular_digitos_verificadores(cpf)
    num_base = cpf[0..8]
    multiplicadores_1 = [10, 9, 8, 7, 6, 5, 4, 3, 2]
    multiplicadores_2 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2]

    dv1 = calcular_dv(num_base, multiplicadores_1)
    num_base_com_dv1 = num_base + dv1.to_s
    dv2 = calcular_dv(num_base_com_dv1, multiplicadores_2)

    [dv1, dv2]
  end

  def self.calcular_dv(num_base, multiplicadores)
    soma = num_base.chars.each_with_index.sum { |char, index| char.to_i * multiplicadores[index] }
    resto = soma % 11
    resto < 2 ? 0 : 11 - resto
  end
end
