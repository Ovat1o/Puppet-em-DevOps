# webserver.pp
#
# Exemplo clássico de manifest Puppet.
# Este manifest garante que um servidor web (nginx) esteja:
#   1. Instalado (package)
#   2. Configurado (file)
#   3. Rodando (service)
#
# Conceito principal: Puppet trabalha com "recursos" (resources).
# Cada bloco abaixo (package, file, service) é um tipo de recurso,
# e declaramos o ESTADO DESEJADO — não o passo a passo de como chegar lá.
# O Puppet decide como aplicar isso na máquina (idempotência).

# 1. Garante que o pacote do nginx esteja instalado
package { 'nginx':
  ensure => installed,
}

# 2. Garante que o arquivo de configuração exista com o conteúdo definido
#    O "notify" faz o Puppet reiniciar o serviço automaticamente
#    sempre que este arquivo for alterado.
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {\n    listen 80;\n    server_name localhost;\n    root /var/www/html;\n    index index.html;\n}\n",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# 3. Garante que o serviço esteja ativo e habilitado para iniciar com o sistema
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}