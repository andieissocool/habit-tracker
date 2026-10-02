-- Einmal im Supabase-Dashboard unter "SQL Editor" ausführen.

create table habits (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  name text not null,
  color text not null,
  created_at timestamptz not null default now()
);

create table marks (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  habit_id uuid not null references habits on delete cascade,
  day date not null,
  primary key (habit_id, day)
);

-- Zugriff über die Data API nur für angemeldete Nutzer
-- (nötig, wenn "Automatically expose new tables" deaktiviert ist).
grant select, insert, update, delete on habits, marks to authenticated;

-- Row Level Security: jeder sieht und ändert nur seine eigenen Daten.
alter table habits enable row level security;
alter table marks enable row level security;

create policy "eigene habits" on habits
  for all using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "eigene marks" on marks
  for all using (auth.uid() = user_id)
  with check (
    auth.uid() = user_id
    and exists (select 1 from habits h where h.id = habit_id and h.user_id = auth.uid())
  );
