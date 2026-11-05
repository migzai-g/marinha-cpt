-- Cole tudo no Supabase: SQL Editor > New query > Run

create table if not exists notas (
  id text primary key,
  pasta text not null default '',
  props jsonb not null default '{}',
  corpo text not null default ''
);

create table if not exists progresso (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  chave text not null,
  feito boolean not null,
  atualizado timestamptz not null default now(),
  primary key (user_id, chave)
);

alter table notas enable row level security;
alter table progresso enable row level security;

-- só quem está logado lê e grava as notas
create policy "notas: logado le" on notas for select to authenticated using (true);
create policy "notas: logado grava" on notas for all to authenticated using (true) with check (true);

-- cada usuário só vê e grava o próprio progresso
create policy "progresso: so o dono" on progresso for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());
