# Lambda

> Uma maneira de definir um bloco e seus parâmetros com alguma sintaxe especial

```ruby
say_something = -> { puts "lambda" }

# chamar 
say_something.call
```

você também pode usar a palavra `lambda`:

```ruby
say_something = lambda { puts 'lambda' }
```

um exemplo mais prático, seria passar a `lambda` como informação variável ao um bloco.

```ruby
puts_lambda = -> { |msg| puts "#{msg}" }

[1,2,3,4,5].each &puts lambda
```


### Another Types of __call__

```ruby
say_something.call
say_something.()
say_something[]
say_something.===
```

mas elas podem ser argumentos

```ruby
2_time = ->(x) { x * 2}

2_time.call(10)
```

---------


