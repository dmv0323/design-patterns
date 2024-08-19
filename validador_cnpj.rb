class ValidadorCNPJ
  def self.validar(cnpj)
    cnpj = cnpj.gsub(/\D/, '')
    return false unless cnpj.length == 14

    digitos_calculados = calcular_digitos_verificadores(cnpj)
    digitos_fornecidos = [cnpj[12].to_i, cnpj[13].to_i]

    digitos_calculados == digitos_fornecidos
  end

  private

  def self.calcular_digitos_verificadores(cnpj)
    num_base = cnpj[0..11]
    multiplicadores_1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    multiplicadores_2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

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
