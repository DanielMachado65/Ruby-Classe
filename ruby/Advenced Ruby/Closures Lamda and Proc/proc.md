## Lambdas x Procs

Lambda na verdade são classes `Proc`, por isso é importante entender a semelhança entre elas.

```ruby
my_proc = Proc.new { |x| puts x }
# But a proc will try to return from the current context
```

porém o que acontece, é que o `Proc` ele tenta dar o retorno, e continuar o código no contexto. Quando temos:

```ruby
my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"

# captura o espoco da contexto atual
my_proc = Proc.new { return 1 }
puts "Proc result: #{my_proc.call}"
```

o segundo levanta a execção: `LocalJumpError` - ele não consegue retornar para um nível superior. É o equivalente a __retornar__ o método.

```ruby
def call_proc
    puts "before proc"
    my_proc = Proc.new { return 2 }
    my_proc.call
    puts "After proc"
end
```