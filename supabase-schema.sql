-- Run this entire file in the Supabase SQL Editor to set up your database.
-- Go to: supabase.com → Your Project → SQL Editor → New Query → paste this → Run

-- Users table (both host and players)
create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  username text unique not null,
  display_name text not null,
  password_hash text not null,
  role text not null default 'player' check (role in ('host', 'player')),
  is_active boolean not null default true,
  tribe_id uuid,
  has_immunity boolean not null default false,
  is_eliminated boolean not null default false,
  created_at timestamptz default now()
);

-- Tribes table
create table if not exists tribes (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  color text not null default '#FF4D00',
  created_at timestamptz default now()
);

-- Add foreign key from users to tribes
alter table users
  add constraint fk_tribe foreign key (tribe_id) references tribes(id) on delete set null;

-- Game settings (always a single row with id = 'global')
create table if not exists game_settings (
  id text primary key,
  season_name text not null default 'Backyard Survivor',
  season_number integer not null default 1,
  num_tribes integer not null default 2,
  game_active boolean not null default false,
  tribal_council_active boolean not null default false,
  updated_at timestamptz default now()
);

-- Insert the default settings row
insert into game_settings (id) values ('global') on conflict (id) do nothing;

-- !! IMPORTANT: Create your host account !!
-- Replace YOUR_BCRYPT_HASH below. To generate one, go to:
-- https://bcrypt-generator.com and hash your chosen password with 10 rounds.
-- Then paste the result in place of the placeholder below.

insert into users (username, display_name, password_hash, role)
values (
  'host',
  'The Host',
  '$2a$10$REPLACE_THIS_WITH_YOUR_BCRYPT_HASH',
  'host'
) on conflict (username) do nothing;
