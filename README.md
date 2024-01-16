# Crawler Pokémon em Ruby

Este é um crawler simples desenvolvido em Ruby utilizando a gem httparty para consumir dados da API oficial do Pokémon. O objetivo é extrair informações detalhadas sobre os Pokémon disponíveis na API e exportá-las para um arquivo JSON para uso posterior.

## Como Funciona

1. **Configuração:**

Certifique-se de ter o Ruby instalado em seu ambiente de desenvolvimento.

2. **Instalação de Dependências:**

Execute o seguinte comando para instalar a gem httparty:
```
bundle install
```

3. **Execução do Crawler:**

Execute o script crawler.rb para iniciar o crawler e obter os dados da API do Pokémon:
```
ruby crawler.rb
```

4. **Saída JSON:**

O crawler irá consumir os dados da API, processá-los e exportá-los para um arquivo JSON chamado pokemons.json.

## Dependências

* httparty:

O crawler utiliza a gem httparty para facilitar as requisições HTTP à API do Pokémon.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas, propor melhorias ou enviar pull requests.
