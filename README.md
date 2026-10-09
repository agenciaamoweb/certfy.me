# certfy.me

Plataforma para emitir, enviar e validar certificados de eventos, para clientes no mundo todo.

Este repositório contém, por enquanto, o **protótipo clicável** (design). Ele funciona no computador e no celular; uma barra fixa no rodapé leva a todas as telas e alterna entre desktop e mobile.

## Conteúdo

| Caminho | O que é |
|---|---|
| `certfy.me-standalone.html` | Protótipo completo em um único arquivo. Abra direto no navegador, funciona offline. |
| `codigo/certfy.me.dc.html` | Todas as telas e a lógica do protótipo (fonte editável). |
| `codigo/i18n.js` | Dicionário de traduções PT → EN / ES. |
| `codigo/support.js` | Runtime necessário para abrir o arquivo `.dc.html`. |
| `amostras/` | Capturas das telas originais (desktop, mobile e inglês). As telas adicionadas em 10/2026 ainda não têm captura. |
| `scripts/serve.ps1` | Servidor local mínimo em PowerShell, para quem não tem Node nem Python. |
| `scripts/build-standalone.ps1` | Regenera o `certfy.me-standalone.html` a partir de `codigo/`. |

Para rodar a versão editável, sirva a pasta do projeto por um servidor local e abra `codigo/certfy.me.dc.html`. Com Node:

```bash
npx serve .
```

No Windows, sem instalar nada (abre em `http://localhost:8080/codigo/certfy.me.dc.html`):

```bash
powershell -ExecutionPolicy Bypass -File scripts/serve.ps1
```

Depois de editar `codigo/certfy.me.dc.html` ou `codigo/i18n.js`, regenere o arquivo único:

```bash
powershell -ExecutionPolicy Bypass -File scripts/build-standalone.ps1
```

Código de teste válido na validação: `CF-8Q2N-4TX7`.

### Traduções
O protótipo é escrito em português. O `i18n.js` traduz cada texto pelo conteúdo exato, então qualquer texto novo precisa de uma entrada `"texto em português": ["inglês", "espanhol"]`. Textos montados com dados (nomes, valores, contagens) são traduzidos no próprio código, com `this.L(pt, en, es)`.

---

## Escopo do projeto

### 1. Produto
- **Quem usa:** de um lado, os organizadores de eventos (gestores); do outro, os participantes e qualquer pessoa que queira conferir um certificado.
- **Como cobra:** por certificado emitido, sem mensalidade. Os pagamentos passam pela Stripe.
- **Idiomas:** português, inglês e espanhol. O idioma aparece no endereço (`/en`, `/es`).

### 2. Identidade visual
- **Estilo:** sóbrio e institucional, como um cartório moderno.
- **Cores:** azul-tinta (`#1b2a4e` / `#111c36`) e branco, com cinzas frios. Verde e vermelho aparecem só para indicar status.
- **Fontes:** Source Serif 4 nos títulos, IBM Plex Sans nos textos e IBM Plex Mono nos códigos. Pinyon Script é a opção cursiva do editor.
- **Logo:** escrita "certfy.me", com um quadrado e um círculo ao lado.

### 3. Site público
**Landing page**
- Abertura com título, botões de ação e um certificado de exemplo com QR code.
- "Sua primeira emissão em 4 passos".
- 12 benefícios com ícones.
- Preços com simulador de quantidade, faixas de desconto, observações e a faixa "Incluído em cada certificado".
- Perguntas frequentes: 10 perguntas que abrem e fecham.
- Chamada final para criar o primeiro evento.

**Página de benefícios**
- 4 blocos com ilustração: validação por QR, página do participante, frente e verso, pesquisa de satisfação.
- Grade com mais 12 benefícios e chamada final.

**Blog**
- Lista com filtro por categoria e um artigo em destaque.
- Página do artigo com texto, chamada para criar conta e "Leia também".
- 6 artigos de exemplo.

**Termos de uso e política de privacidade**
- Uma página com as duas abas, índice lateral e seções numeradas (10 nos termos, 11 na privacidade).
- Cobre créditos e reembolso (7 dias), responsabilidades do organizador, usos proibidos, disponibilidade dos certificados, papéis na LGPD (organizador controlador, certfy.me operadora), dados coletados, o que fica público, retenção, direitos e cookies.
- Aviso no topo: é uma minuta para revisão jurídica, com razão social, CNPJ, foro e encarregado provisórios.

**Rodapé**
- 4 colunas: marca, Produto, Certificados e Atendimento. Todos os links levam a uma tela ou seção (Como funciona, Preços e Perguntas rolam até a seção da landing).
- Links legais (termos, privacidade, LGPD) e seletor de idioma. "LGPD" abre a política de privacidade na seção de direitos.

### 4. Login, cadastro e recuperação de senha
- Abas Entrar / Criar conta. O cadastro pede nome, organização, e-mail e senha.
- Link "Esqueci a senha" e um atalho para quem só quer validar um certificado.
- Recuperação de senha em 4 passos: informar o e-mail (com validação), aviso de "confira seu e-mail" com reenvio, criação da nova senha com requisitos conferidos ao digitar (8 caracteres, letras e números, senhas iguais) e confirmação.

### 5. Painel do gestor
- Resumo em números: certificados emitidos, eventos ativos e validações nos últimos 30 dias.
- Faixa com o saldo de créditos e atalho para comprar mais.
- Lista de eventos com status: Rascunho, Aguardando pagamento ou Emitido.
- Botão "+ Novo evento".
- Menu do topo: Eventos, Créditos, Conta e Validar.

### 5.1 Conta
- **Perfil e organização:** nome, e-mail de acesso, organização, CPF/CNPJ para recibos, e-mail de contato para participantes, país, idioma dos e-mails para participantes e envio do logo (com prévia).
- **Créditos e compras:** saldo, próximo vencimento e uso nos últimos 12 meses; compra avulsa de créditos com o mesmo seletor de quantidade, faixas de desconto e formas de pagamento do evento; histórico de compras com recibo e exportação em CSV.
- **Segurança:** troca de senha, sessões ativas com opção de encerrar as outras e pedido de exclusão da conta e dos dados (LGPD), com confirmação.
- **API:** marcada como "Em breve", com descrição, chave mascarada, os 4 endpoints previstos e botão "Avise-me quando lançar".

### 6. Criação do evento (7 etapas)
1. **Evento:** nome, organização, data, local, carga horária, quem assina e o cargo.
2. **Participantes:** envio de planilha CSV ou XLSX com nome, e-mail e WhatsApp, planilha modelo para baixar e uma amostra da lista. O sistema avisa quem está sem WhatsApp. Não há campo de documento.
3. **Modelo:** escolha entre Clássico, Moderno e Minimalista, ou envio da própria arte em PNG ou JPG.
4. **Editor visual:**
   - Cada informação é um campo que se arrasta, com alças para mudar a largura e uma guia que mostra quando o campo está centralizado.
   - Ao selecionar um campo, dá para editar o texto com variáveis, o tamanho, o alinhamento, a fonte, negrito, itálico, maiúsculas e a cor.
   - Dá para adicionar e remover campos: nome, data, local, carga horária, evento, texto livre, assinatura e código com QR.
   - Uma lista mostra todos os campos e suas posições, e há um botão para restaurar o layout original.
5. **Prévia:** mostra o certificado de cada participante, um por vez.
6. **Pagamento:**
   - Seletor de quantidade com faixas de desconto e aviso quando faltam certificados para cobrir todos os participantes.
   - Em português: Pix (QR e copia e cola), cartão, boleto (pede CPF ou CNPJ de quem paga), Apple Pay / Google Pay e PayPal.
   - Em inglês e espanhol: cartão, Apple Pay / Google Pay e PayPal.
7. **Envio:**
   - Canais: e-mail automático, link público e WhatsApp.
   - Recursos da página do participante, que o organizador liga ou desliga: pesquisa de satisfação, verso com conteúdo programático e mensagem em vídeo (com envio do arquivo). Link "Ver como o participante vê".
   - Depois de emitir: lista com o status de entrega de cada participante, exportação dos links (CSV de verdade) e opção de reenviar para um participante, para os pendentes ou para todos. O reenvio permite escolher o canal, escrever uma mensagem e não consome créditos.
   - **Editar participante:** corrige nome, e-mail e WhatsApp e reemite sem custo, mantendo o mesmo código. Opção de reenviar na hora.
   - **Adicionar participante:** emite um certificado novo, consome 1 crédito do saldo e já aparece na lista, na validação e na página do participante.
   - Cada linha tem Editar, Reenviar, Ver página e Validar.

A planilha modelo da etapa 2 também é baixada de verdade (CSV com as colunas no idioma escolhido).

### 6.1 Página do participante
É a página que abre pelo link enviado por e-mail ou WhatsApp. Não pede login.
- Saudação com o primeiro nome, nome do evento, data e local.
- O certificado renderizado com o mesmo layout montado no editor, com alternância Frente / Verso (o verso traz o conteúdo programático, a carga horária e o código).
- Ações: Baixar PDF, Adicionar ao LinkedIn, compartilhar no WhatsApp e copiar o link.
- Quadro "Certificado verificável" com o código e atalho para a validação pública.
- Pesquisa de satisfação opcional (3 notas de 1 a 5 e um comentário). O envio só libera depois das 3 notas; dá para pular.
- Mensagem em vídeo do organizador.
- Dados do certificado e orientação para pedir correção à organização.
- Na validação, "Ver certificado original", "Baixar PDF" e "Adicionar ao LinkedIn" levam a esta página.

### 7. Validação pública
- Busca pelo código no formato `CF-XXXX-XXXX`.
- Leitura do QR code pela câmera, por enquanto simulada.
- Ajuda "Onde encontrar o código?" com um desenho do certificado.
- Código válido: mostra participante, evento, data, local, carga horária, emissor, quem assinou, data de emissão e código, com os botões Ver original, Baixar PDF e Adicionar ao LinkedIn.
- Código inexistente: mostra uma mensagem de erro com orientação.
- Pontos de confiança e link para o suporte.

### 8. Preços (valores atuais)
| Faixa | BRL | USD |
|---|---|---|
| 1 a 99 certificados | R$ 2,00 | US$ 0,49 |
| 100 a 499 | R$ 1,80 | US$ 0,44 |
| 500 ou mais | R$ 1,50 | US$ 0,37 |

Créditos valem por 12 meses e podem ser usados em qualquer evento.

### 9. O que é só simulação
- Os pagamentos, a leitura do QR, os envios, o login, a recuperação de senha, a compra de créditos, o download do PDF, o LinkedIn e o vídeo não estão conectados a nada; servem só para navegar.
- O que funciona de verdade no navegador: download da planilha modelo, exportação da lista de links e do histórico de compras (CSV) e o botão "Copiar link".
- Dados de exemplo: o evento "Semana de Inovação 2026", 142 participantes e o código válido `CF-8Q2N-4TX7`. Participantes adicionados no envio ganham códigos próprios, que também passam na validação.
- As capas do blog são blocos coloridos; não há imagens reais.

### 10. Pendências e decisões em aberto
- [ ] Dados da empresa: CNPJ, razão social, telefone e e-mail estão com valores fictícios (rodapé, termos e privacidade).
- [ ] Confirmar preço em dólar e regras de exemplo (parcelamento, validade da tabela de preços, limite de 2.000 participantes).
- [ ] PayPal via Stripe: confirmar se estará disponível na conta.
- [ ] Revisão jurídica dos termos de uso e da política de privacidade, incluindo foro e nome do encarregado de dados.
- [ ] Regra de reembolso: a minuta usa 7 dias para créditos não usados. Confirmar.
- [ ] Custo do WhatsApp: o reenvio não consome créditos, mas cada mensagem tem custo. Decidir se há limite.
- [ ] Verso e vídeo: hoje são ligados no passo de envio e o conteúdo do verso é fixo. Falta decidir onde o organizador edita o conteúdo programático (provavelmente no editor, como uma segunda página).
- [ ] Pesquisa de satisfação: as perguntas são fixas. Falta a tela de resultados para o organizador e decidir se as perguntas são editáveis.
- [ ] API: só há a tela "Em breve". Falta definir escopo e preço.

**Desenhados em 10/2026**
- [x] Página do participante, que abre pelo link enviado.
- [x] Configurações da conta e compra avulsa de créditos.
- [x] Edição e inclusão de participantes depois do envio.
- [x] Recuperação de senha.
- [x] Termos de uso e política de privacidade (minuta).
- [x] Telas para as funções citadas no site: pesquisa de satisfação, verso, mensagem em vídeo e API.

**Ainda não desenhados**
- [ ] E-mails transacionais (certificado enviado, pagamento confirmado, boleto gerado, recuperação de senha) e o texto da mensagem de WhatsApp.
- [ ] PDF final do certificado.
- [ ] Resultados da pesquisa de satisfação no painel.
- [ ] Página de suporte ao participante (o link "suporte ao participante" da validação ainda não leva a lugar nenhum).

---

> É um protótipo de design: pagamentos, envios, login e leitura de QR são simulados. Para produção, o front-end deve ser reimplementado no framework escolhido (ex.: React/Next.js) com backend, Stripe e serviços de envio.
