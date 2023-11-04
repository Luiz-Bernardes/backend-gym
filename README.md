# Backend Gym

Api para o projeto de academia

### 📋 Pré-requisitos

* Ruby versão 2.7.0
* Banco de dados PostgreSQL

### 🔧 Instalação

```
rails db:drop db:create db:migrate db:seed
```

## ⚙️ Executando os testes

Para testar todos os componentes:

```
rspec spec/
```

Para testar somente models: 

```
rspec spec/models/
```

Para testar somente controllers:

```
rspec spec/controllers/
```

Para testar somente requests:

```
rspec spec/requests/
```

Para testar qualquer arquivo em específico, nome do arquivo após a '/'. Para testar método em uma linha específica, :numero_da_linha, aṕos nome do arquivo.

## ✒️ Autores

* **Luiz Henrique** - *Backend* - [github](https://github.com/Luiz-Bernardes/)
* **Rafael** - *Frontend* - [github](https://github.com/0x7266)

## 📄 Licença

Este projeto está sob a licença - veja o arquivo [LICENSE.md] para detalhes.