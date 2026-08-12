# O bloco 'package' gerencia a instalação de softwares no sistema operacional
package { 'nginx':
  # Garante que o pacote estará presente. Se já estiver, o Puppet não faz nada (idempotência)
  ensure => installed,
}

# O bloco 'service' gerencia o estado dos processos/serviços rodando no servidor
service { 'nginx':
  # Garante que o servidor web Nginx esteja ativamente ligado agora
  ensure  => running,
  
  # Configura o serviço para iniciar automaticamente caso a máquina seja reiniciada
  enable  => true,
  
  # Regra de dependência: O serviço SÓ será configurado DEPOIS que a instalação acima der certo
  require => Package['nginx'],
}