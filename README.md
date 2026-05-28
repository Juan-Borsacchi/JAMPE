# 🏐 JAMPE! — Monitoramento de Desgaste Físico no Vôlei

O **JAMPE!** é um aplicativo nativo para iOS e iPadOS desenvolvido para auxiliar atletas de vôlei de quadra a monitorarem o desgaste físico de seus treinos. O sistema identifica áreas propensas a lesões com base na posição tática do jogador e prescreve sugestões personalizadas de tempo de descanso.

---

## 📱 Sobre o APP JAMPE!

O JAMPE! é um aplicativo focado na saúde e na performance de atletas de vôlei de quadra. Ele funciona como um simulador inteligente de desgaste físico, projetado para traduzir o cansaço de um treino em dados visuais e práticos sobre o corpo do jogador.

---

## 🚀 Como Funciona (O Fluxo do App)

O aplicativo guia o atleta por um fluxo linear de coleta de dados para gerar um diagnóstico preciso:

1. **Apresentação (`SplashScreen`):** Tela inicial que introduz o propósito do ecossistema JAMPE!.
2. **Perfil em Quadra (`VoleiView`):** O usuário informa se possui domínio técnico dos fundamentos básicos (manchete e toque) e seleciona sua posição tática de atuação.
3. **Registro do Treino (`TrainingView`):** O atleta define a duração exata da sessão (horas/minutos) e avalia a intensidade do seu esforço físico utilizando a Escala de Borg CR(10).
4. **Dashboard de Resultados (`SimulationView`):** Um algoritmo calcula a carga interna do treino. Com isso, o app exibe um modelo anatômico apontando as articulações sobrecarregadas e calcula as horas recomendadas de repouso.

---

## ✨ Funcionalidades Principais

* **Mapeamento de Lesões por Posição:** Destaca os pontos de estresse biomecânico específicos de cada posição (ex: joelhos/ombro para Ponteiros; punhos/dedos/tornozelos para Centrais e Líberos).
* **Filtro Adaptativo de Lateralidade:** Permite alternar a visualização do modelo anatômico entre "Destro" e "Canhoto", ajustando a exibição das articulações afetadas.
* **Cálculo Automatizado de sRPE:** Cruza o tempo de treino com a percepção de esforço (Borg), aplicando multiplicadores de intensidade para classificar o treino em Leve, Moderado ou Intenso.
* **Prescrição Dinâmica de Descanso:** Sugere janelas de recuperação (de 6h a 72h) baseadas no cruzamento entre o desgaste físico gerado e o nível técnico do atleta.
* **Suporte Nativo a Dispositivos:** Interface responsiva totalmente adaptada para iPhones e iPads, incluindo suporte a fontes acessíveis (*Dynamic Type*).

### 🎨 Componentes de UI Customizados
* **`TimePicker`:** Roda de seleção de tempo otimizada que oculta as linhas nativas do iOS para um design mais limpo.
* **`ButtonSelect`:** Botões de seleção que mudam de cor dinamicamente refletindo a identidade visual da Escala de Borg.
* **`NeonPulseIndicator`:** Indicadores visuais animados em formato de "sonar" para destacar graficamente os focos de impacto no corpo.
* **`ProgressBar`:** Barra de progresso visual para indicar em qual etapa do formulário o usuário está.
* **`WarningPopUpCard`:** Modais de validação preventiva para evitar o envio de formulários incompletos.

---

## 👥 Equipe de Desenvolvimento

Este projeto foi construído de forma colaborativa por[cite: 1, 2, 3, 10]:

* **Agatha Barbosa Marinho dos Santos:** Responsável pela arquitetura de mapeamento corporal, lógica biomecânica das posições e regras de lateralidade.
* **Elisa Tanada Giacomini da Silva:** Responsável pelo design gráfico e liderança nos protótipos, além de desenvolver o Keynote.
* **Juan Gabriel Borsacchi Marques:** Responsável pelo desenvolvimento dos seletores complexos (TimePicker, ButtonSelect) e estruturação de dados da Escala de Borg.
* **Mirella Bransford Lourenço:** Responsável pelos componentes informativos de feedback visual, pop-ups de aviso e cards de tempo de recuperação.
* **Pedro Henrique Hossaka Teruel:** Responsável pelo design de navegação global, tela de introdução e componentização base (botões e barras de progresso).

---
