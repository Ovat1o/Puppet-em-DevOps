# Exemplo simples de manifest Puppet. Agenda uma tarefa automática 
# (cron job) que roda todo dia à meia-noite, fazendo um "backup" 
# de um diretório.

cron { 'backup_diario':
  command => 'tar -czf /tmp/backup.tar.gz /var/www/html',   # informa o comando que vai rodar.
  user    => 'root',                                        # quem vai executar o comando.
  hour    => 0,                                             # quando irá rodar (neste caso à meia-noite).
  minute  => 0,                                             # _|_
  ensure  => present,                                       # garante que essa tarefa exista no crontab.
}

# Ponto importante: o recurso "cron" garante que uma tarefa agendada
# exista no sistema, sem precisar editar o crontab manualmente com
# "crontab -e" — o comando tradicional para editar uma tabela de
# tarefas.


