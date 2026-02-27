# 🌴 Backyard Survivor — Setup Guide

This guide walks you through getting your app live on the internet using
Supabase (database) and Vercel (hosting). No coding required — just clicking around!

---

## STEP 1: Get the code on GitHub

You need to put the code somewhere Vercel can find it. GitHub is free.

1. Go to **github.com** and create a free account if you don't have one
2. Click the **+** icon → **New repository**
3. Name it `survivor-app`, leave it Private, click **Create repository**
4. Download **GitHub Desktop** from desktop.github.com
5. In GitHub Desktop: File → Add Local Repository → point it at this `survivor-app` folder
6. Click **Publish repository** → it will push the code to GitHub

---

## STEP 2: Set up Supabase (your database)

1. Go to **supabase.com** → Sign up for free
2. Click **New Project**, give it a name like `survivor-app`, set a database password (save this somewhere!), pick any region
3. Wait ~2 minutes for it to spin up
4. In your project, go to the left sidebar → **SQL Editor** → **New Query**
5. Open the file `supabase-schema.sql` from this folder, copy the entire contents, paste it in, and click **Run**
6. **Create your host password:**
   - Go to **bcrypt-generator.com**
   - Type your chosen host password, set rounds to 10, click Generate
   - Copy the result (it starts with `$2a$10$...`)
   - Back in Supabase SQL Editor, run:
     ```sql
     UPDATE users SET password_hash = 'PASTE_YOUR_HASH_HERE' WHERE username = 'host';
     ```
7. Get your API keys:
   - Left sidebar → **Settings** → **API**
   - Copy **Project URL** → this is your `NEXT_PUBLIC_SUPABASE_URL`
   - Copy **anon/public key** → this is your `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - Copy **service_role key** (click to reveal) → this is your `SUPABASE_SERVICE_ROLE_KEY`
   - ⚠️ Keep the service_role key secret — never share it publicly

---

## STEP 3: Deploy to Vercel

1. Go to **vercel.com** → Sign up (use your GitHub account — easiest)
2. Click **Add New → Project**
3. You'll see your GitHub repos — click **Import** next to `survivor-app`
4. Before clicking Deploy, click **Environment Variables** and add these three:
   - `NEXT_PUBLIC_SUPABASE_URL` → paste your Project URL
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` → paste your anon key
   - `SUPABASE_SERVICE_ROLE_KEY` → paste your service role key
5. Click **Deploy** and wait ~2 minutes
6. Vercel will give you a URL like `survivor-app-abc123.vercel.app` — that's your site! 🎉

---

## STEP 4: Log in and start setting up

1. Go to your Vercel URL
2. Log in with username `host` and the password you chose in Step 2
3. You'll land on the host dashboard
4. Add players in the **Players** tab (you set their usernames and passwords)
5. Create tribes in the **Tribes** tab
6. On game night: assign players to tribes, then hit **Start Game** when ready!

---

## Adding players for future games

Any time you want to add, remove, or change passwords for players, log in as host
and use the **Players** tab. No code editing needed.

---

## Sharing with friends

Just send them your Vercel URL. They log in with the username and password you gave them.
You can share the URL in your Discord server or group chat.

---

## Questions / something broke?

Come back and ask! Share what's happening and we'll sort it out.
