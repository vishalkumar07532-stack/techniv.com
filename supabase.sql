-- TechNiv shared catalogue setup
-- Run this in Supabase Dashboard > SQL Editor.
create table if not exists public.techniv_products (
  id text primary key,
  name text not null,
  type text not null,
  brand text not null,
  capacity text not null,
  condition text not null,
  warranty text not null,
  description text default '',
  image_url text default '',
  featured boolean default false,
  rating_verified boolean default false,
  stars numeric default 5,
  reviews integer default 0,
  created_at timestamptz default now()
);
alter table public.techniv_products enable row level security;
create policy "Public can read TechNiv catalogue" on public.techniv_products for select to anon, authenticated using (true);
create policy "Public can add TechNiv catalogue items" on public.techniv_products for insert to anon, authenticated with check (true);
create policy "Public can update TechNiv catalogue items" on public.techniv_products for update to anon, authenticated using (true) with check (true);
create policy "Public can delete TechNiv catalogue items" on public.techniv_products for delete to anon, authenticated using (true);
