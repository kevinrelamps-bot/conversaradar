-- ConversaRadar: estrutura de referência. As migrações aplicadas diretamente no projeto Supabase são a fonte de verdade.
create extension if not exists pgcrypto;
create schema if not exists private;
revoke all on schema private from public, anon;
grant usage on schema private to authenticated;
create table if not exists public.organizations (
 id uuid primary key default gen_random_uuid(),
 name text not null,
 created_at timestamptz not null default now()
);
create table if not exists public.organization_members (
 organization_id uuid not null references public.organizations(id) on delete cascade,
 user_id uuid not null unique references auth.users(id) on delete cascade,
 role text not null default 'owner' check (role in ('owner','admin','member')),
 created_at timestamptz not null default now(),
 primary key (organization_id,user_id)
);
create table if not exists public.conversations (
 id uuid primary key default gen_random_uuid(),
 organization_id uuid not null references public.organizations(id) on delete cascade,
 created_by uuid not null default auth.uid() references auth.users(id),
 customer_ref text not null default 'Contato sem identificação',
 message_text text not null,
 message_date text,
 status text not null default 'não informado',
 category text not null default 'Acompanhar',
 priority text not null default 'Baixa' check (priority in ('Alta','Média','Baixa')),
 suggested_action text,
 source_file text,
 created_at timestamptz not null default now()
);
alter table public.organizations enable row level security;
alter table public.organization_members enable row level security;
alter table public.conversations enable row level security;
