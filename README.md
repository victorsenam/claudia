# claudia
Este projeto tem como objetivo criar um sistema de gerenciamento de eventos focado especificamente no XXI COREEQ (Congresso Regional dos Estudantes de Engenharia Química) que será organizado pelos estudantes de engenharia química da USP.  
O sistema está sendo desenvolvido como um projeto para a matéria de MAC0242 (Laboratório de Programação II) do curso de Ciências da Computação do IME-USP.  

# Desenvolvedores
- [Caio Barrocal](http://github.com/caiobarrocal)
- [Nathan Proença](http://github.com/nathanpro)
- [Pedro Nepomuceno](http://github.com/pisn)
- [Hélio Assakura](http://github.com/hassakura)
- [Victor Sena](http://github.com/victorsenam)

# Root User
Para poder acessar funcionalidades restritas a usuários nomais, é necessário gerar o usuário root com`rake db:migrate`.  
Isso vai gerar um super-usuário com email root@root.com e senha roottoor.  
Ele está presente por padrão na versão disponível [online](http://177.153.13.84:3000).

# Instalação
## Requerimentos
- ruby versão 2.1.1 `rvm install ruby-2.1.1`
- gema bundler `gem install bundler`

## Instruções
`bundle install`
