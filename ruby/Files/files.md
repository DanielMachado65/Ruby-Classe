# Files on Rails

> manipulação de arquivos em ruby

### Abrindo arquivos:

```ruby

arq = File.new("arquivo.txt", "modo_de_abertura") # abri o arquivo em modo

```

| Modo | Definição                                                         |
| ---- | ----------------------------------------------------------------- |
| r    | Abre o arquivo para leitura;                                      |
| w    | Abre o arquivo para escrita;                                      |
| a    | Anexa ao final do arquivo;                                        |
| r+   | Abre o arquivo para leitura e escrita;                            |
| w+   | Cria um arquivo vazio para leitura e escrita;                     |
| a+   | você pode ler qualquer, mas só pode escrever no final do arquivo. |


### Lendo Arquivos:

```ruby

a = File.readlines("arquivo.txt") 

# => ["Blog sobre Ruby on Rails.\n", "\n", "Possui tutoriais, dicas, criticas e muito mais sobre o framework mais comentado da atualidade!\n"

```

Devolve um vetor possuindo em cada elemento uma linha do arquivo.

### Lendo os caracteres do arquivo:


``` ruby

arq = File.open("arquivo.txt")
arq.getc.chr #=> "B"
arq.getc.chr #=> "l"
arq.getc.chr #=> "o"
arq.getc.chr #=> "g"
arq.getc.chr #=> " "

```

### Escrevendo em arquivos:

```ruby

arq = File.new("arquivo.txt", "w") # abri o arquivo em modo de escrita
arq.write "Rails Open" # escreve no arquivo e retorna quantos caracters exitem neste
arq.puts " - Ruby on Rails" # escreve no arquivo
arq.close unless file.closed? # se o arquivo não foi fechado: fechamos
```

O `unless file.closed?` foi colocado apenas para demonstrar o método `close?`. O `arq.close` já bastava para que ele funcionasse normalmente.


### Renomeando arquivos:

```ruby
File.rename("arquivo.txt", "arquivo_novo.txt")

# Descobrindo a extensão do arquivo:
extensao = File.extname("arquivo_novo.txt") # => ".txt"
```

##### Informações sobre o arquivo

* O arquivo realmente existe?
    ``` ruby
    File.exists?("arquivo_novo.txt") #=> true
    ```

* Ele pertence a determinado diretório? 
    ```ruby
    File.directory?("/home/samuelvinicius") # => true
    ```

* Qual o tamanho do arquivo em bytes?

    ```ruby
    File.size("arquivo_novo.txt") # => 24
    ```

* O arquivo está vazio?

    ```ruby
    File.zero?("arquivo_novo.txt") #=> false  
    ```

* Qual a data de criação, de última modificação e de último acesso ao arquivo?

    ```ruby
    File.ctime("arquivo_novo.txt") #=> Tue Jan 26 16:20:36 -0300 2010
    File.mtime("arquivo_novo.txt") #=> Tue Jan 26 16:27:41 -0300 2010
    File.atime("arquivo_novo.txt") #=> Tue Jan 26 16:27:42 -0300 2010
    ```

* Posiciona em um ponto do arquivo:

    ```ruby
    arq = File.open('local_filename', 'r') # abri o arquivo em modo de leitura
    arq.seek(2, IO::SEEK_SET)  # aponta pra o byte 2 do arquivo
    puts f.readline # imprime os caracteres da linha a partir do byte 2
    ```

-----------