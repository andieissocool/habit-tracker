# Habit Tracker

Simpler Habit Tracker im Notizbuch-Stil. Die Daten liegen in Supabase, du kannst also von jedem Gerät darauf zugreifen.

## Einrichtung

1. **Supabase-Projekt anlegen:** Auf [supabase.com](https://supabase.com) ein kostenloses Konto und ein neues Projekt erstellen.
2. **Tabellen anlegen:** Im Dashboard den **SQL Editor** öffnen, den Inhalt von [supabase.sql](supabase.sql) einfügen und auf **Run** klicken.
3. **Zugangsdaten eintragen:** Unter **Project Settings → API** (bzw. **API Keys**) die *Project URL* und den *anon*- bzw. *publishable*-Key kopieren und in [config.js](config.js) eintragen.
   Der Key darf öffentlich sein, denn die Row Level Security sorgt dafür, dass jeder nur seine eigenen Daten sieht.
4. **Seite hosten:** Der Login-Link funktioniert nur, wenn die Seite über `http(s)://` geöffnet wird, nicht per Doppelklick als Datei.
   - Lokal testen: `npx serve .` und dann `http://localhost:3000` öffnen
   - Online stellen: den Ordner auf GitHub Pages, Netlify oder Cloudflare Pages hochladen (alles kostenlos)
5. **Adresse freigeben:** Unter **Authentication → URL Configuration** die Adresse deiner Seite als *Site URL* eintragen und zusätzlich unter *Redirect URLs* hinzufügen, zum Beispiel `http://localhost:3000` und `https://deinname.github.io/habit-tracker/`.

Danach die Seite öffnen, E-Mail eingeben und auf den Link in der Mail klicken. Das war's.

## Hinweise

- Der kostenlose E-Mail-Versand von Supabase ist auf wenige Mails pro Stunde begrenzt. Für den Eigengebrauch reicht das.
- Kostenlose Supabase-Projekte werden nach etwa einer Woche ohne Nutzung pausiert und lassen sich im Dashboard mit einem Klick wieder starten.
