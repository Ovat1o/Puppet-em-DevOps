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

