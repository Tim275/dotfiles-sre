#!/bin/bash
# =============================================================================
# TMUX Help (Prefix + ?)
# =============================================================================

cat << 'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║                      TMUX POWER USER REFERENCE                               ║
║                         Prefix = Ctrl+a                                      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  SPLITS & PANES                          │  SESSIONS & WINDOWS               ║
║    v         Split vertikal              │    c         Neues Window         ║
║    s         Split horizontal            │    w         Session Tree         ║
║    x         Pane schließen              │    o         SessionX (Pro!)      ║
║    m / z     Pane maximieren             │    d         Session detachen     ║
║    q         Pane-Nummern zeigen         │    C         Neue Session         ║
║    Ctrl+h/j/k/l  Navigation              │    X         Session killen       ║
║                                          │    S         Letzte Session       ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  OHNE PREFIX! (Root Bindings)            │  PLUGINS                          ║
║    Alt+1-5     Window wechseln           │    F         Fuzzy-Suche (tmux)   ║
║    Alt+h/l     Vorheriges/Nächstes Win   │    f         Finger-Copy Mode     ║
║    Alt+n       Neues Window              │    e         Extrakto (Text)      ║
║    Alt+w       Window schließen          │    u         URL Finder           ║
║    Shift+←→↑↓  Pane resizen              │    Tab       Sidebar (Dateien)    ║
║                                          │    P         Logging starten      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  POPUPS                                  │  COPY MODE (Prefix + [)           ║
║    g         LazyGit                     │    v         Selection starten    ║
║    a         Claude Code (AI)            │    C-v       Block Selection      ║
║    T         Scratch Pad                 │    y         Kopieren             ║
║    ?         Diese Hilfe                 │    /         Regex Suche          ║
║                                          │    Ctrl+f    File Suche           ║
║  SONSTIGES                               │    Ctrl+u    URL Suche            ║
║    r         Config neu laden            │    o         URL öffnen           ║
║    I         Plugins installieren        │    n/N       Nächster Match       ║
║    U         Plugins updaten             │    Doppelklick = Wort kopieren    ║
║    Ctrl+s    Session speichern           │    Dreifachklick = Zeile kopieren ║
║    Ctrl+r    Session restore             │                                   ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  STATUSBAR: 🔋 Battery │ 󰍛 CPU │ 󰥔 Zeit │ 󰃭 Datum │ 󰅒 Host                  ║
║  Windows werden automatisch nach aktuellem Pfad benannt!                     ║
╚══════════════════════════════════════════════════════════════════════════════╝
                         Press any key to close
EOF

read -n 1 -s
