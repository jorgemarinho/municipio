Projeto de exemplo: layout estático usando AdminLTE 4

Servindo com Docker + Nginx

Arquivos adicionados para Docker
- `Dockerfile` - imagem baseada em nginx que copia os arquivos estáticos
- `nginx/default.conf` - configuração simples do Nginx
- `docker-compose.yml` - define serviço `web` que expõe a aplicação na porta 8000 do host

Como rodar com Docker Compose
1. Certifique-se de ter Docker e Docker Compose instalados.
2. A partir do diretório do projeto execute:

```bash
docker compose up --build -d
```

3. Abra no navegador: http://localhost:8000

Como parar e remover:

```bash
docker compose down
```

O que o serviço faz
- O Nginx serve os arquivos estáticos a partir do diretório do projeto.
- A porta 80 do container é mapeada para a porta 8000 do host.

Notas
- Se estiver usando WSL ou Docker Toolbox, verifique o IP da VM/host.
- As páginas ainda dependem de CDNs para CSS/JS (AdminLTE, Bootstrap, DataTables). Se quiser uma imagem autossuficiente, posso baixar e embutir os assets localmente.
Projeto de exemplo: layout estático usando AdminLTE 4

Arquivos importantes
- `index.html` - Página inicial com menu lateral (link para listas)
- `municipios.html` - Lista estática com 20 municípios (dados fictícios)
- `municipios-dinamicos.html` - Lista dinâmica que consulta a API pública do IBGE e apresenta paginação cliente

O que há de novo
- A página `municipios-dinamicos.html` usa DataTables (jQuery) para paginação, ordenação e tradução para pt-BR.
- A paginação é configurada para 20 itens por página por padrão.

Como rodar / testar localmente
1. A opção mais simples: abra `index.html` no navegador e use o menu para navegar até "Municípios Dinâmicos".
2. Recomendo servir os arquivos por um servidor estático local (evita problemas de CORS/segurança ao usar `file://`):

```bash
# a partir do diretório do projeto
python3 -m http.server 8000
# abra no navegador: http://localhost:8000/index.html
```

Notas sobre a API
- Endpoint usado pela página dinâmica: `https://servicodados.ibge.gov.br/api/v1/localidades/municipios` (API pública do IBGE).
- A página faz uma requisição fetch no carregamento e apresenta os resultados paginados no cliente.
- Caso haja erro de rede ou resposta inesperada, a página mostra uma mensagem de erro no rodapé.

Dependências carregadas via CDN na página dinâmica
- jQuery 3.6
- DataTables 1.13.6 (e integração com Bootstrap 5)
- AdminLTE 4 e Bootstrap 5

Possíveis próximos passos
- Adicionar filtros e busca por estado/IBGE na UI.
- Carregar dados adicionais (população, área) da API ou de outra fonte e mostrar detalhes em modal.

Arquivo criado/atualizado para habilitar paginação na listagem dinâmica.
Projeto de exemplo: layout estático usando AdminLTE 4

Arquivos adicionados:

Como abrir
1. Abra `index.html` ou `municipios.html` no seu navegador (duplo-clique ou "Abrir arquivo..." no navegador).
2. Não é necessário servidor; páginas usam CDNs do AdminLTE/Bootstrap.

Observações

```bash
# Python 3
python3 -m http.server 8000
# então acesse http://localhost:8000/index.html
Projeto de exemplo: layout estático usando AdminLTE 4

Arquivos adicionados:
- `index.html` - Página inicial com menu lateral (link para lista de municípios)
- `municipios.html` - Página com tabela estática exibindo 20 municípios
- `municipios-dinamicos.html` - Página que consulta uma API pública (IBGE) e mostra 20 municípios

Como abrir
1. Abra `index.html`, `municipios.html` ou `municipios-dinamicos.html` no seu navegador (duplo-clique ou "Abrir arquivo..." no navegador).
2. Não é necessário servidor; páginas usam CDNs do AdminLTE/Bootstrap. Entretanto, para a página dinâmica é recomendado servir via HTTP local para evitar problemas de CORS em alguns ambientes.

Observações
- Os dados na `municipios.html` são fictícios e apenas para demonstração.
- A página `municipios-dinamicos.html` consome a API pública do IBGE:
	- Endpoint usado: `https://servicodados.ibge.gov.br/api/v1/localidades/municipios`
	- A página busca registros e mostra os primeiros 20.

Executando um servidor local (recomendado para a página dinâmica)

```bash
# Python 3: inicia um servidor simples na porta 8000
python3 -m http.server 8000
# então acesse http://localhost:8000/index.html
```

Observações sobre CORS
- A API do IBGE costuma permitir requisições diretas do navegador. Se você ver erros relacionados a CORS ao abrir arquivos via `file://`, use o servidor local acima. Se ainda ocorrerem erros, verifique extensões do navegador ou políticas de rede.

Próximos passos sugeridos
- Tornar a tabela da página dinâmica paginável/ordenável (ex.: DataTables).
- Carregar dados reais adicionais (população, área) e exibir detalhes por município.

Arquivo criado automaticamente pelo exemplo.

