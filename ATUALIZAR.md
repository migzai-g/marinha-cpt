# Como atualizar (2 minutos)

1. Copie estes arquivos por cima do seu repositório (principalmente o `index.html`, que ganhou o botão **Importar notas**).
2. No terminal, dentro da pasta do repo:
   ```
   git add index.html ATUALIZAR.md
   git commit -m "botão de importar notas + material didático"
   git push
   ```
3. Abra o site, entre com seu login e clique em **Importar notas** (barra de cima).
4. Escolha o arquivo `notas.json` (o que veio junto, fora da pasta do repo). Ele atualiza as notas existentes e cria as 52 novas. Nada é apagado e seu progresso é mantido.

Obs.: o `notas.json` está no `.gitignore` de propósito (são suas notas pessoais); por isso ele não vai para o git, só para o Supabase.
