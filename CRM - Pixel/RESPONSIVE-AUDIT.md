# Auditoria de Responsividade — CRM Pixel Rain
**Data:** 08/06/2026 | **Arquivo:** crm-pixel-rain.html

## Status: CRÍTICO — Sistema não responsivo

---

## 1. Problemas Críticos (Breaking)

### 1.1 Body com overflow:hidden
- **Linha:** 36
- **Problema:** `body { overflow: hidden }` impede scroll nativo no mobile/tablet
- **Impacto:** Conteúdo cortado no iOS Safari, Android Chrome

### 1.2 Kanban com largura fixa
- **Linha:** 814 (override), 106 (original)
- **Problema:** `.col { width: 272px }` — colunas não respondem ao viewport
- **Impacto:** Overflow horizontal visível em notebooks (1280px) e tablets

### 1.3 Sidebar com largura fixa
- **Linhas:** 762 (override), 547 (original)
- **Problema:** `.sidebar { width: 216px }` — sem colapso em telas menores
- **Impacto:** Em 1024px, sidebar + kanban ultrapassam viewport

### 1.4 Drawer com largura fixa
- **Linha:** ~374
- **Problema:** `.drawer { width: 480px }` — cobre tela inteira em mobile
- **Impacto:** Impossível usar drawer em telas < 520px

### 1.5 Apenas 1 media query no arquivo inteiro
- **Linha:** 342
- **Problema:** `@media (max-width: 900px)` só afeta form-grid
- **Impacto:** Sem adaptação para Mobile, Tablet, Notebook, Ultrawide

---

## 2. Problemas Moderados (Degradação visual)

### 2.1 Tipografia com px fixo
- `font-size: 20px` em `.stat-value` — grande demais em zoom 150%
- `font-size: 13px` em cards — pequeno demais em mobile
- Sem uso de `clamp()` para escala fluida

### 2.2 Stats bar sem wrap
- `overflow-x: auto; flex-wrap: nowrap` — scroll horizontal em telas < 1200px
- 8 cards de 130px mínimo = 1040px mínimo necessário

### 2.3 `max-height: calc(100vh - 240px)` nas colunas
- `.col { max-height: calc(100vh - 240px) }` — valor hardcoded
- Em 768px de altura, colunas ficam com max-height: 528px

### 2.4 `height: 100vh` no body
- Em mobile browsers, 100vh inclui a barra do navegador
- Deve usar `100dvh` (dynamic viewport height)

### 2.5 Notif panel fixo
- `.notif-panel { width: 320px; top: 100px }` — sai do viewport em mobile

### 2.6 Input min-width fixo
- `input.filter-input { min-width: 160px }` — empurra filtros para nova linha cedo demais

---

## 3. Cobertura de Breakpoints (antes da correção)

| Breakpoint | Status |
|------------|--------|
| Mobile 320–767px | ❌ Não suportado |
| Tablet 768–1023px | ❌ Não suportado |
| Notebook 1024–1279px | ⚠️ Funcional mas degradado |
| Notebook 1280–1439px | ⚠️ Funcional mas colunas apertadas |
| Desktop 1440–1919px | ✅ Layout projetado para este range |
| Ultrawide 1920px+ | ⚠️ Sidebar pequena, muito espaço vazio |

---

## 4. Elementos com Largura/Altura Fixa (inventário)

| Seletor | Propriedade | Valor | Linha |
|---------|-------------|-------|-------|
| `.col` | `width` | 272px | 814 |
| `.sidebar` | `width` | 216px | 762 |
| `.drawer` | `width` | 480px | ~374 |
| `.notif-panel` | `width` | 320px | ~652 |
| `.topnav` | `height` | 44px | 755 |
| `.sb-item` | `height` | 38px | 771 |
| `.stat-card` | `min-width` | 130px | 73 |
| `.col` | `max-height` | calc(100vh - 240px) | 109 |
| `body` | `height` | 100vh | 36 |
| `.cmd-palette` | `max-width` | 600px | ~667 |

---

## 5. Plano de Correção

- [ ] Adicionar variáveis CSS fluidas no `:root`
- [ ] Corrigir `body` overflow e height
- [ ] Sidebar responsiva com colapso icon-only (tablet) e bottom-nav (mobile)
- [ ] Kanban com `clamp()` e scroll horizontal correto
- [ ] Stats bar com `flex-wrap` e grid em mobile
- [ ] Drawer com `min(480px, 95vw)`
- [ ] Tipografia com `clamp()`
- [ ] Adicionar 5 media queries (mobile, tablet, notebook, desktop, ultrawide)
- [ ] Corrigir `100vh` → `100dvh`

**Status pós-correção:** Ver RESPONSIVE-TEST.md
