# nayara-exemplo.pp

# Exemplo de gerenciamento de arquivo com Puppet.

# O recurso 'file' permite criar e gerenciar arquivos.
file { '/tmp/puppet_exemplo.txt':

  # Garante que o arquivo exista.
  ensure => file,

  # Define o conteúdo que será escrito no arquivo.
  content => "Puppet funcionando!\n",
}