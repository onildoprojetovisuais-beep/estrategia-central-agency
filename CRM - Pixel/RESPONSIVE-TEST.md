# Teste de Responsividade — CRM Pixel Rain
**Data:** 08/06/2026 | **Versão:** Pós-correção responsiva

---

## Checklist de Níveis de Zoom

Abrir o arquivo `crm-pixel-rain.html` no Chrome. Para cada nível de zoom (Ctrl +/-):

| Zoom | Sidebar | Kanban | Stats | Cards | Status |
|------|---------|--------|-------|-------|--------|
| 75% | OK (216px) | 22vw col | 8 em linha | Legível | ✅ Testar |
| 100% | OK (216px) | ~272px col | 8 em linha | Normal | ✅ Testar |
| 110% | OK (216px) | ~247px col | 8 em linha | Normal | ✅ Testar |
| 125% | OK (196px NB) | ~220px col | Wrap em 2 linhas | Compacto | ✅ Testar |
| 150% | Colapsado (icon) | ~210px col | Grid 2x4 | Compacto | ✅ Testar |
| 175% | Bottom nav | Scroll snap | Grid 2x4 | OK | ✅ Testar |
| 200% | Bottom nav | Scroll snap | Grid 2x4 | OK | ✅ Testar |

### Passos do teste de zoom:
1. Abrir o CRM no Chrome
2. Ctrl+Shift+I → Device toolbar (Toggle device toolbar)
3. Selecionar cada resolução abaixo
4. Verificar que não há overflow horizontal
5. Verificar que a sidebar se adapta
6. Verificar que o kanban tem scroll horizontal funcional
7. Verificar que os cards são legíveis

---

## Checklist de Resoluções

### Desktop e Ultrawide

| Resolução | Viewport CSS | Sidebar | Col Width | Obs |
|-----------|-------------|---------|-----------|-----|
| 1280×720 | 1280px | 196px | ~246px | Notebook pequeno |
| 1366×768 | 1366px | 196px | ~260px | Notebook padrão |
| 1440×900 | 1440px | 216px | ~272px | Desktop padrão |
| 1920×1080 | 1920px | 240px | ~288px | Full HD |
| 2560×1440 | 2560px | 240px | ~320px | 2K — ultrawide |
| 3440×1440 | 3440px | 240px | ~320px | Ultrawide 21:9 |

### Tablet

| Dispositivo | Viewport | Sidebar | Layout |
|-------------|----------|---------|--------|
| iPad (Safari) | 768px | 56px icon-only | Kanban com scroll |
| iPad Air | 820px | 56px icon-only | Kanban com scroll |
| iPad Pro 11" | 1024px | 196px reduzido | Full |

### Mobile

| Dispositivo | Viewport | Nav | Kanban | Cards |
|-------------|----------|-----|--------|-------|
| iPhone SE | 375px | Bottom nav 58px | Scroll snap 1 col | OK |
| iPhone 14 | 390px | Bottom nav 58px | Scroll snap 1 col | OK |
| Samsung S23 | 412px | Bottom nav 58px | Scroll snap 1 col | OK |
| Pixel 7 | 412px | Bottom nav 58px | Scroll snap 1 col | OK |

---

## Como testar no Chrome DevTools

```
1. F12 → Toggle Device Toolbar (Ctrl+Shift+M)
2. Selecionar "Responsive" e arrastar para cada largura
3. Ou selecionar dispositivo pelo nome na lista
```

### Breakpoints implementados:

| Range | Comportamento |
|-------|---------------|
| ≥ 1920px | Sidebar 240px, colunas até 320px, padding 32px |
| 1440–1919px | Sidebar 216px, colunas clamp(250px,20vw,290px) |
| 1024–1439px | Sidebar 196px, colunas clamp(230px,22vw,270px) |
| 768–1023px | Sidebar 56px icon-only, stats wrap |
| < 768px | Sidebar → bottom nav, modais → sheet bottom, kanban scroll-snap |

---

## Comportamentos esperados pós-correção

### ✅ Deve funcionar
- [ ] Sem overflow horizontal em nenhuma resolução ≥ 320px
- [ ] Sidebar colapsa para ícones em tablet
- [ ] Sidebar vira barra inferior no mobile
- [ ] Kanban com scroll horizontal suave
- [ ] Scroll-snap no mobile (1 coluna por vez)
- [ ] Stats bar com wrap em tablet/mobile
- [ ] Drawer cobre tela toda no mobile
- [ ] Modais sobem do rodapé no mobile
- [ ] Tipografia legível em zoom 200%
- [ ] Touch targets ≥ 44px em dispositivos touch
- [ ] SLA dots visíveis (não desaparecem em alta densidade)

### ⚠️ Limitações conhecidas
- Kanban drag-and-drop pode ter comportamento diferente no touch
- Command palette (Ctrl+K) não funciona no mobile (sem teclado)
- Emojis no iOS podem renderizar diferente (mas foram removidos do sistema)

---

## Critérios de aprovação

O CRM passa no teste se:
1. Zero overflow horizontal em 1280px+
2. Sidebar funcional (icon ou full) em 768px+
3. Kanban scrollável e legível em todos os tamanhos
4. Stats bar sem scroll horizontal em 768px+
5. Cards legíveis (font ≥ 11px) em todos os tamanhos
6. Bottom nav funcional em mobile (< 768px)
