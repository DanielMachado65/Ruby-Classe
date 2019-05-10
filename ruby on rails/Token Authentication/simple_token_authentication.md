# Simple Token Autentication

Como fazer a autenticação para rails fazendo com o email e senha.
+ o que precisamos fazer em adicional
  + adicionar uma `gem`: {`simple_token_authencation`}
  ```Gemfile
    gem 'simple_token_authentication', '~> 1.0'
  ```

### @Route: 

```

POST
localhost:3000/v1/sessions

```

### @Code

O que precisamos fazer com que o `token`, funcione com a autenticação.

```ruby
# o que precisamos retornar o token, assim que faz uma sessão. O que precisamos de aunteticação.
class V1::SessionsController < ApllicationController
    def create
        user = User.where(email: params[:email]).first
        if user&.valid_password?(params[:password]) # que é a mesma coisa que: user && user.valid_password(...)
            render json: user.as_json(only: [:id, :email]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
    end

end

```

O que precisamos adicionar o token de aunteticação no modelo do projeto:

```ruby
class User < ApplicationRecord
    # precisamos adicionar essa linha
    act_as_token_authenticatable

    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
end
```

Precisamos adiconar a autenticação no banco:

```
rails g migration add_authentication_token_to_users "authentication_token:string{30}:uniq"

rake db:migrate
```