# Manifesto_nginx.pp
# Este manifesto demonstra a instalação e configuração de um servidor web Nginx,
# incluindo uma página inicial personalizada e a criação de um usuário no sistema.

# 1. Primeiro, garantimos que o pacote do Nginx esteja instalado no sistema
package { 'nginx':
  ensure => installed,
}

# 2. Em seguida, garantimos que o serviço do Nginx esteja em execução e habilitado no boot
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'], # Essa linha garante que o pacote seja instalado ANTES de iniciar o serviço
}

# 3. Agora, criamos a página inicial que será exibida pelo servidor Nginx
file { '/var/www/html/index.html':
  ensure  => file,
  content => '<h1>Servidor configurado pelo Puppet!</h1>',
  require => Package['nginx'], # Essa linha garante que o diretório do Nginx já exista ANTES de criar o arquivo
}

# 4. Por fim, garantimos que o usuário "devops" exista no sistema
user { 'devops':
  ensure => present,
}

# 5. Portanto, esse manifesto é um exemplo simples de automação de configuração de servidores com Puppet: 
# Em vez de configurar tudo manualmente, você descreve o estado desejado e o Puppet aplica essa configuração.
