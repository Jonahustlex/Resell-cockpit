--Resell Cockpit: Datenbank einrichten.
-- In Supabase: SQL Editor → New query → alles einfügen → Run.

-- Artikel  (ein Eintrag pro Kleidungsstück)
create table if not exists public.items (
  id            text primary key,
  user_id       uuid not null default auth.uid() references auth.users(id) on delete cascade,
  title         text not null,
  brand         text,
  category      text,
  size          text,
  source        text,
  buy_date      date,
  buy_price     numeric(10,2) not null default 0,
  extra_cost    numeric(10,2) not null default 0,
  list_date     date,
  list_price    numeric(10,2),
  status        text not null default 'lager' check (status in ('lager', 'zu_packen', 'versendet')),
  sold_price    numeric(10,2),
  sold_date     date,
  buyer         text,
  shipped_date  date,
  notes         text,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
create index if not exists items_user_idx on public.items (user_id);

-- Einstellungen (Monatsziel, Reinvest-Anteil)
create table if not exists public.settings (
  user_id     uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  goal        numeric(10,2) not null default 500,
  reinvest    numeric(5,2)  not null default 60,
  updated_at  timestamptz not null default now()
);

-- Row Level Security: jeder eingeloggte Nutzer sieht und ändert NUR seine eigenen Zeilen.
alter table public.items    enable row level security;
alter table public.settings enable row level security;

drop policy if exists "items: eigene lesen"    on public.items;
drop policy if exists "items: eigene anlegen"  on public.items;
drop policy if exists "items: eigene ändern"   on public.items;
drop policy if exists "items: eigene löschen"  on public.items;
create policy "items: eigene lesen"   on public.items for select to authenticated using ((select auth.uid()) = user_id);
create policy "items: eigene anlegen" on public.items for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "items: eigene ändern"  on public.items for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "items: eigene löschen" on public.items for delete to authenticated using ((select auth.uid()) = user_id);

drop policy if exists "settings: eigene lesen"   on public.settings;
drop policy if exists "settings: eigene anlegen" on public.settings;
drop policy if exists "settings: eigene ändern"  on public.settings;
create policy "settings: eigene lesen"   on public.settings for select to authenticated using ((select auth.uid()) = user_id);
create policy "settings: eigene anlegen" on public.settings for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "settings: eigene ändern"  on public.settings for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
