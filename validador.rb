module Validador
  def self.validar(documento, strategy)
    strategy.validar(documento)
  end
end
  