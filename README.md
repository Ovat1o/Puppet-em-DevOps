# 🛠️ Guia Prático de Utilização: Puppet

Este repositório contém um guia passo a passo para instalação, configuração e uso prático do **Puppet** (Grupo 2). O objetivo deste guia é ser direto e funcional, permitindo que qualquer pessoa configure a ferramenta rapidamente.

---

## 1. Instalação do Puppet

O Puppet geralmente funciona num modelo Servidor/Agente (Master/Agent), mas para fins práticos, testes e para rodar os arquivos de exemplo deste repositório, utilizaremos a execução local com o **Puppet Agent**.

Os comandos abaixo foram testados em distribuições baseadas em **Debian/Ubuntu**.

### Passo 1.1: Adicionar o Repositório Oficial
Primeiro, baixe e instale o pacote que adiciona o repositório oficial da Puppet ao seu gerenciador de pacotes:
```bash
wget [https://apt.puppet.com/puppet8-release-jammy.deb](https://apt.puppet.com/puppet8-release-jammy.deb)
sudo dpkg -i puppet8-release-jammy.deb
sudo apt-get update

```

*(Nota: O termo `jammy` refere-se ao Ubuntu 22.04. Caso use outra versão, substitua pelo codinome correspondente, como `focal` para 20.04).*

### Passo 1.2: Instalar o Puppet Agent

Agora, instale o pacote principal que contém os executáveis da ferramenta:

```bash
sudo apt-get install puppet-agent -y

```

### Passo 1.3: Configurar as Variáveis de Ambiente (PATH)

Por padrão, os binários do Puppet são instalados no diretório `/opt/puppetlabs/bin/`. Para executar os comandos de qualquer lugar no terminal, adicione esse caminho ao seu PATH:

```bash
export PATH=/opt/puppetlabs/bin:$PATH

```

*(Dica: Para não ter que digitar isso toda vez, adicione essa linha ao final do seu arquivo `~/.bashrc` e rode o comando `source ~/.bashrc`).*

---

## 2. Configuração Inicial e Validação

Para confirmar que a instalação foi concluída com sucesso e que a ferramenta está pronta para ler os nossos códigos, verifique a versão instalada:

```bash
puppet --version

```

Se o terminal retornar a versão (ex: `8.x.x`), o ambiente está pronto para uso!

A partir daqui, os códigos do Puppet (chamados de **Manifests**, com extensão `.pp`) já podem ser executados localmente utilizando o comando base `puppet apply <nome-do-arquivo.pp>`.

# Principais comandos do Puppet

Em ordem de execução dos comandos: primeiro valida, depois aplica.

## Puppet parser validate

Verifica se um manifest possui erros de sintaxe.

```bash
puppet parser validate site.pp

```
Se houver um erro de sintaxe, o Puppet informa o problema.

## Puppet apply --noop

Executa o manifest em modo de simulação, mostrando o que seria alterado sem realmente aplicar as mudanças.

```bash
puppet apply --noop site.pp

```
Essa flag --noop diz ao Puppet para não fazer as alterações, apenas mostrar o que seria alterado.

## Puppet resource

Permite inspecionar o estado atual em tempo real dos recursos do sistema, como usuários, grupos, pacotes e serviços.
Por exemplo: Vou inspecionar o recurso serviço (service).

```bash
puppet resource service nginx

```

A saída do Resource será na linguagem natural do Puppet.

```bash
service { 'nginx':
  ensure => 'stopped',
  enable => 'false',
}

```

Essa saída mostra que o serviço existe, mas está parado e desabilitado.
Mais precisamente:
o ensure => 'stopped' → indica que o serviço não deve estar rodando.

enable => 'false' → indica que o serviço não deve iniciar automaticamente no boot.

### Principais tipos de recursos do Puppet

Aqui são os elementos que o Puppet gerencia.

## 📦 Package
Gerencia pacotes de software (instalação, remoção, atualização).

```bash
package { 'nginx':
  ensure => installed,
}

```

## 🗂️ File
Controla arquivos e diretórios (conteúdo, permissões, dono).

```bash
file { '/etc/motd':
  ensure  => file,
  content => "Bem-vindo ao servidor!\n",
}

```

## 👤 User
Gerencia usuários do sistema.

```bash
user { 'joao':
  ensure     => present,
  managehome => true,
  shell      => '/bin/bash',
}

```

## 👥 Group
Gerencia grupos de usuários.

```bash
group { 'devs':
  ensure => present,
}

```

## ⚙️ Service
Controla serviços (iniciar, parar, habilitar no boot).

```bash
service { 'nginx':
  ensure => running,
  enable => true,
}

```

## ⏰ Cron
Gerencia tarefas agendadas no cron.

```bash
cron { 'backup':
  ensure  => present,
  command => '/usr/local/bin/backup.sh',
  user    => 'root',
  minute  => '0',
  hour    => '2',
}

```
