Hello everybody! Here is a quick tutorial.

leader = space

* Useful:
 - yank to clipboard: leader + y
 - yank to eol: Y
 - delete without yanking: leader + d
 - copy filepath to clipboard: leader + p + a
 - un/redo: u/U
 - move selected chunk of text down/up: J/K
 - in/outdent: </>

* LSP:
 - leader + l

* Arrow:
 - leader: leader + a
 - buffer leader: leader + m

* Blink:
 - accept: C-space
 - go through completion menu: Up/Down or C-k/C-j
 - documentation scroll : S-k/S-j
 - go through snippet placeholders: Tab/S-Tab

* Commentary:
 - comment out a line: gcc
 - comment out a target with motion: gc + motion 

* Mini-pick:
 - leader + f for find/grep/help
 - go through completion menu: Up/Down or C-k/C-j
 - scroll Up/Down: S-k/S-j

* Multicursor:
 - match cursors
    - next: C-n
    - previous: C-p
 - skip matches:
    - next: C-s
    - previous: C-S-s
 - skip cursors:
    - below:
    - above:

* Remaps for movement:
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

* Useful not remapped
 - mark
    - mark location: m + char
    - goto mark exact location: \` + char
    - goto mark line: ' + char
    - delete mark: :delmark char
