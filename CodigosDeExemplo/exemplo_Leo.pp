# exemplo_Leo.pp
# Este manifesto demonstra a criação de uma estrutura básica de pastas e arquivos no sistema.

# 1. Primeiro, garantimos que um diretório específico exista
file { '/tmp/exemplo_puppet':
  ensure => 'directory',
  mode   => '0755',
}

# 2. Em seguida, criamos um arquivo de texto dentro desse diretório
file { '/tmp/exemplo_puppet/boas_vindas.txt':
  ensure  => 'file',
  content => "Olá, turma! Este arquivo foi gerado automaticamente pelo Puppet.\nInstalação e configuração inicial concluídas com sucesso!\n",
  require => File['/tmp/exemplo_puppet'], # Essa linha garante que o diretório seja criado ANTES do arquivo
}
