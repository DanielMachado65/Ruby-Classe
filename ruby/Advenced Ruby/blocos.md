# Blocos

> "Trabalhar para processar a informação"

o ruby, consegue tratar blocos de execução de código. Você deve passar para ele como paramêtro de uma função um pedaço de código. Exemplo

## @Funcionamento

```ruby
# definição do bloco
def metodo(&bloco)
    p 'alguma coisa antes'
    metodo.call
    p 'alguma coisa depois'
end

# a chamada para o bloco seria
metodo do 
    p 'alguma coisa no meio'
end
```

o resultado esperado seria:

```
irb(main):001:0> alguma coisa antes
irb(main):002:0> alguma coisa no meio
irb(main):003:0> alguma coisa depois
```

#### Você pode chamar `yield` tantas vezes precisar

```ruby
def print_twice
    yield
    yield
end

print_twice { puts 'hello' }

# ou passando argumentos
def one_two_three
    yield 1
    yield 2
    yield 3
end

one_two_three { |number| puts number * 10 }
# 10 20 30
```


### @Caracteristicas

* você pode chamar quantas vezes você quiser
* o bloco aceita paramêtros também
  * Exemplo: 
    ```ruby
    def teste(&meu_bloco)
        meu_bloco.call("parametro 1 para o bloco", "parametro 2 para o bloco")
    end

    teste do | param1, param2 |
        puts "Parametros recebidos pelo método"
        puts param1, param2
    end
    ```
* para a subsituição da variável `função.call` o __Ruby__ introduziou a palavra reservada `yield`
* ao invés de utilizar _"do"_ e _"end"_ você pode usar chaves
  * Exemplo:
    ```ruby
    meu_metodo { | params1, params2| puts params1, params2 }
    ```
* você pode usar um `array` para passar como parametro para o bloco.
  * exemplo:
  ```ruby
  ["a", "b", "c"].each { |param| puts params}
  ```

------------------

## Implícito ou Explícito

quando diferença está no `Explícito`:

> significa que você atribui a ele um nome em sua lista de parâmetros

```ruby
def explicit_block(&block)
    block.call # mesma coisa que yield
end

explicit_block { puts "bloco chamado"}
```

| Comando        | descrição                               |
| -------------- | --------------------------------------- |
| `block_given?` | verifica se está sendo passado um bloco |


O recomendado é __sempre__ passar o bloco, com certeza que ele é um bloco de execução, porque senão ele salta a exceção `LocalJumpError`, então o código seria:

```ruby
def say_something
    yield if block_given?
end
```
