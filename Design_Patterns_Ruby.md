# Design Patterns Aplicados em Ruby

Este documento aborda como aplicar Design Patterns no código de validação de CPF e CNPJ implementado em Ruby, seguindo boas práticas de design de software.

## Código de Validação de Documentos

No projeto, o código foi dividido em classes responsáveis pela validação de CPF e CNPJ, utilizando os padrões de projeto Strategy e Template Method. Esses padrões ajudam a tornar o código mais modular, reutilizável e fácil de manter.

### Padrão Strategy

O padrão Strategy foi utilizado para separar a lógica de validação de diferentes tipos de documentos (CPF e CNPJ). Isso permite que cada tipo de documento seja validado por uma classe específica, sem a necessidade de condicional lógica espalhada pelo código.

- **ValidadorCPF** e **ValidadorCNPJ**: Cada uma dessas classes implementa a validação de um tipo específico de documento.
- **Validador**: Este módulo funciona como um orquestrador, escolhendo a estratégia adequada com base no tipo de documento fornecido.

### Padrão Template Method

O padrão Template Method poderia ser aplicado para definir um esqueleto básico para a validação de documentos, deixando que as subclasses (no caso, CPF e CNPJ) implementem os detalhes específicos de seus cálculos de dígito verificador.

### Benefícios dos Design Patterns

- **Reutilização de código**: O código de validação foi modularizado e pode ser facilmente adaptado para novos tipos de documentos.
- **Manutenibilidade**: O uso de padrões de projeto facilita a manutenção do código, pois cada classe tem uma responsabilidade única e bem definida.
- **Extensibilidade**: Novos tipos de documentos podem ser adicionados sem modificar o código existente, apenas criando novas classes de validação.

### Considerações Finais

Ao utilizar Design Patterns no desenvolvimento de sistemas, especialmente em Ruby, é possível criar soluções mais elegantes e robustas. O código é mais fácil de entender, manter e evoluir, além de seguir boas práticas de desenvolvimento orientado a objetos.
