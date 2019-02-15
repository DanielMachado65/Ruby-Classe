# Upload Files on Ruby

> Link para você conseguir estudar: [Acesse](https://code.tutsplus.com/pt/tutorials/uploading-files-with-rails-and-shrine--cms-27596)

Como fazer o updaload de arquivos com rails.

```ruby
<% form_for :user, @user, :url => user_path, :html => { :multipart => true } do |form| %>
  <%= form.file_field :avatar %>
  <%= form.submit %>
<% end %>
```

mas na verdade vai gerar o seguinte código:

```html
<form action="/users" class="new_user" enctype="multipart/form-data" id="new_user" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="sz00w4kW/+QBTjreuI/RyTR3Plo7yI1jhLkuQtE6NwE=" /></div>        
  <input id="user_avatar" name="user[avatar]" size="30" type="file" />
  <input id="user_submit" name="commit" type="submit" value="Create User" />
</form>
```

no controller vamos receber no params:

```ruby
# IDEIA: params[:exemplo]

# manipulação de arquivo, criando um caminho físico do arquivo
path = File.join(Rails.root, "public/imagens", params[:user][:avatar].original_filename)

FIle.open(path, "wb") do |f|
    f.write(params[:user][:avatar].read)
end

```


#### coisas importantes:

* `enctype="multipart/form-data"` - para poder reconhecer que vai ser várias partes do arquivo

* `authenticity_token` - vai ser a parte de conferir o token
  * por padrão o **Rails** ele é contra o CSRF (Cross Site Request Forgery). Para todo o fórmulario ele gera um `token`. 
  * Isso faz com que evite os formulários de fora do seu site possam enviar dados ao seu aplicativo. 

