# print this menu
default:
    @just --list

# run hoogle
docs:
    cabal update
    printf 'http://127.0.0.1:8888\n'
    hoogle serve -p 8888 --local

# run cabal repl
repl *ARGS:
    cabal repl {{ ARGS }}

# run exe
run *ARGS:
    ghcid -W -c "cabal repl exe:{{ ARGS }}" -T :main
