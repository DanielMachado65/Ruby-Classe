# SideKiq

Redis + Sidekiq

> Uma gema para dominar o uso de job (processo).

### Caractéristica

Um job é um serviço tratado por uma Thread. Ajudam a paralelizar (_acontecerá depois_) Que vai executar depois o processamento.

- `Active Jobs`: como criar um job (__framework__)
- é importante você comunicar com outras API's externamente a partir de _jobs_.
- Sidekiq - executador de tarefas em background
  -  25 processos. 
  -  prioridade/ordem de execução
- Redis - banco de chave (chave-valor) ele coloca na fila os trabalhos. Apenas armazena o que será gravado.

#### Uso:

```ruby
# ele usa o novo active Jobs
class SendSmsJob < ApplicationJob
    queue_as :default

    def perform(*args)
        # TODO
    end
end

# Você pode escolher filas que os jobs são executados
# - default você não vai ter nenhuma prioridade
```

Você pode escolher os tipos de chamada para os trabalhos:

1. ### Executando imediatamente
  
  ```ruby
    ExampleWorkerJob.perform_now
  ```  
2. ### Executando assim que possível
  
  ```ruby
    # quando estiver livre, assim que for possivel. 
    ExampleWorkerJob.perform_later(*args)    
  ```    
3. ### Executando em uma semana
  
  ```ruby
    # fazer a tarefas depois de alguma tempo
    ExampleWorkerJob.set(wait: 1.week).perform_later(*args)  
    # vale lembrar que podemos alterar o tempo para: x.day
    #                                                x.week
    #                                                x.month
  ```    

Você consegue mandar um __email__ também:

1. ### Executando imediatamente
  
  ```ruby
    Notifier.welcome(User.first).deliver_now
  ```  
2. ### Executando assim que possível
  
  ```ruby
    Notifier.welcome(User.first).deliver_later    
  ```    
3. ### Executando em uma semana
  
  ```ruby
    Notifier.welcome(User.first).deliver_later(wait_until: 1.week.from_now)     
  ```    

-------------------

### Inicializando a aplicação

Redis já instalado

```sh
redis-server
rails new <nome_projeto>

# add on Gemfile
gem 'redis'
gem 'sidekiq'

bundle install
```

configuração para produção, você cira um `initializers`

```ruby
# config/initiaizers/sidekiq.rb

Sidekiq.configure_server do | config |
    config.redis = { url: 'redis://localhost:6379/0'}
end

Sidekiq.configure_cliente do | config | 
    config.redis = { url: 'redis://localhost:6379/0'}
end
```

logo em seguida: `config/application.rb`: 

```ruby
# config/application.rb
config.active_job.queue_adapter = :sidekiq
```

Inserindo a rota: 

```ruby
# config/routes.rb

require 'sidekiq/web'

Rails.application.routes.draw do
    # não pode ficar sem senha.
    mount Sidekiq::Web => '/sidekiq'

end
```