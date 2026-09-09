# show me all ports occupied by my Yarn/Bun projects
lsof -nP -iTCP -sTCP:LISTEN | grep -E 'node|bun'

# kill -9 55061 88229

