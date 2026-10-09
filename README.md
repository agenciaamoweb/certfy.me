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
| `amostras/` | Capturas das telas (desktop, mobile e inglês). |

Para rodar a versão editável, sirva a pasta `codigo/` por um servidor local e abra `certfy.me.dc.html`:

```bash
npx serve codigo
```

Código de teste válido na validação: `CF-8Q2N-4TX7`.

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

**Rodapé**
- 4 colunas: marca, Produto, Certificados e Atendimento.
- Links legais (termos, privacidade, LGPD) e seletor de idioma.

### 4. Login e cadastro
- Abas Entrar / Criar conta. O cadastro pede nome, organização, e-mail e senha.
- Link "Esqueci a senha" e um atalho para quem só quer validar um certificado.

### 5. Painel do gestor
- Resumo em números: certificados emitidos, eventos ativos e validações nos últimos 30 dias.
- Lista de eventos com status: Rascunho, Aguardando pagamento ou Emitido.
- Botão "+ Novo evento".

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
   - Depois de emitir: lista com o status de entrega de cada participante, exportação dos links e opção de reenviar para um participante, para os pendentes ou para todos. O reenvio permite escolher o canal, escrever uma mensagem e não consome créditos.

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
- Os pagamentos, a leitura do QR, os envios e o login não estão conectados a nada; servem só para navegar.
- Dados de exemplo: o evento "Semana de Inovação 2026", 142 participantes e o código válido `CF-8Q2N-4TX7`.
- As capas do blog são blocos coloridos; não há imagens reais.

### 10. Pendências e decisões em aberto
- [ ] Dados da empresa: CNPJ, razão social, telefone e e-mail estão com valores fictícios.
- [ ] Confirmar preço em dólar e regras de exemplo (parcelamento, validade da tabela de preços, limite de 2.000 participantes).
- [ ] PayPal via Stripe: confirmar se estará disponível na conta.
- [ ] Funções citadas no site sem tela no painel: pesquisa de satisfação, verso do certificado, mensagem em vídeo do organizador e API.

**Ainda não desenhados**
- [ ] Página do participante, que abre pelo link enviado.
- [ ] Configurações da conta e compra avulsa de créditos.
- [ ] Edição e inclusão de participantes depois do envio.
- [ ] Recuperação de senha.
- [ ] Termos de uso e política de privacidade.

---

> É um protótipo de design: pagamentos, envios, login e leitura de QR são simulados. Para produção, o front-end deve ser reimplementado no framework escolhido (ex.: React/Next.js) com backend, Stripe e serviços de envio.
