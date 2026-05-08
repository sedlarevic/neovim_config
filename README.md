Hello everybody! Here is a quick tutorial.

leader = space

- tmux
    - leader: C-a
    - move to windows: C-<hjkl>
    - create a vertical window: C-a-|
    - create horizontal window: C-a--
    - create a new session: C-[
    - delete a session: C-]
    - browse sessions: C-b
    - lazygit in tmux: C-y

- useful:
    - remapped
        - editing
            - yank to clipboard: leader + y
            - yank to eol: Y
            - delete without yanking: leader + d
            - copy filepath to clipboard: leader + p + a
            - un/redo: u/U
            - move selected chunk of text down/up: J/K
            - in/outdent: Tab/S-Tab
        - movement
            - line begin: g + h
            - line end: g + l
            - buffer top: g + k
            - buffer bottom: g + j
            - first char in line: g + s
            - catch next (){}[] in line: g + n
            - traverse downwards, cursor on half page: C-d
            - traverse upwards, cursor on half page C-u
            - traverse to next iteration of a word: n
            - traverse to previous iteration of a word: N
    - not remapped
        - mark
            - mark location: m + char
            - goto mark exact location: \` + char
            - goto mark line: ' + char
            - delete mark: :delmark char

- lsp:
    - leader + l

- arrow:
    - leader: leader + a
    - buffer leader: leader + ;

- blink:
    - accept: C-space
    - go through completion menu: Up/Down or C-,/C-.
    - documentation scroll : S-k/S-j
    - go through snippet placeholders: Tab/S-Tab

- commentary:
    - comment out a line: gcc
    - comment out a target with motion: gc + motion 

- mini-pick:
    - leader + f for find/grep/help
    - go through completion menu: Up/Down or C-,/C-.
    - scroll Up/Down: S-k/S-j

- multicursor:
    - match cursors
        - next: C-m
        - previous: C-M
    - skip matches:
        - next: C-n
        - previous: C-N
    - cursor in line:
        - below: C-v
        - above: C-V

- visual_surround:
    - S + ( { [ < " ' in Visual Mode

