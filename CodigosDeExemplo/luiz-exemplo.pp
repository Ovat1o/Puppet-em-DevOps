# Gerencia a instalação do pacote do servidor SSH
package { 'openssh-server':
  ensure => installed, # Garante que o pacote esteja instalado no sistema
}

# Gerencia o arquivo de configuração do SSH
file { '/etc/ssh/sshd_config':
  source  => 'puppet:///modules/sshd/sshd_config', # Caminho do arquivo de origem no servidor Puppet
  owner   => 'root',                               # Define o proprietário do arquivo como 'root'
  group   => 'root',                               # Define o grupo do arquivo como 'root'
  mode    => '0640',                               # Define permissões: leitura/escrita p/ dono, leitura p/ grupo
  notify  => Service['sshd'],                      # Reinicia o serviço 'sshd' se este arquivo for alterado
  require => Package['openssh-server'],            # Exige que o pacote esteja instalado antes de criar/alterar o arquivo
}

# Gerencia o estado e a inicialização do serviço SSH
service { 'sshd':
  ensure => running, # Garante que o serviço esteja em execução
  enable => true,    # Configura o serviço para iniciar automaticamente com o sistema
}
