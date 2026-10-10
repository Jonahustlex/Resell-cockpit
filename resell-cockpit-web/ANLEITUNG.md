# Resell Cockpit – Website einrichten

Die Website besteht aus zwei Teilen:

- **Supabase**: Datenbank und Login. Speichert deine Artikel, nur du kommst mit deinem Passwort rein.
- **GitHub Pages**: hostet die Website kostenlos unter `https://DEINNAME.github.io/resell-cockpit/`.

Beides ist im Gratis-Tarif kostenlos. Dauer: ca. 20 Minuten am Computer.

> **Alter:** Für GitHub musst du mindestens 13 sein. Für Supabase musst du laut Nutzungsbedingungen
> berechtigt sein, einen Vertrag einzugehen. Mit 15 heißt das: Ein Elternteil sollte das
> Supabase-Konto mit dir zusammen anlegen bzw. zustimmen.

---

## Teil 1: Datenbank (Supabase)

1. Auf **supabase.com** ein Konto anlegen und auf **New project** klicken.
   - Name: `resell-cockpit`
   - Database Password: ein starkes Passwort ausdenken und sicher aufschreiben
   - Region: **Central EU (Frankfurt)** oder **West EU (Ireland)**
2. Warten, bis das Projekt fertig ist (1–2 Minuten).
3. Links auf **SQL Editor** → **New query** klicken, den kompletten Inhalt von `supabase.sql` einfügen und **Run** klicken.
   Danach sollte „Success“ erscheinen.
4. **Deinen Login anlegen:** Links auf **Authentication → Users → Add user → Create new user** klicken.
   - E-Mail und Passwort eintragen
   - **Auto Confirm User** anhaken
5. **Fremde Registrierungen sperren:** Unter **Authentication → Sign In / Providers** (je nach Version auch *Settings*)
   die Option **Allow new users to sign up** ausschalten. So kann sich niemand außer dir ein Konto anlegen.
6. **Schlüssel kopieren:** Unter **Project Settings → API Keys** (bzw. *Data API*):
   - **Project URL**, z. B. `https://abcdefgh.supabase.co`
   - **Publishable key** (`sb_publishable_…`) oder, falls nur der angezeigt wird, den **anon public** Key
7. Beides in `config.js` eintragen und die Datei speichern:
   ```js
   window.RESELL_CONFIG = {
     supabaseUrl: 'https://abcdefgh.supabase.co',
     supabaseKey: 'sb_publishable_...'
   };
   ```
   ⚠️ Niemals den **secret** oder **service_role** Key eintragen. Der würde jedem vollen Zugriff geben.

## Teil 2: Website online stellen (GitHub Pages)

1. Auf **github.com** ein Konto anlegen.
2. Oben rechts auf **+ → New repository** klicken.
   - Name: `resell-cockpit`
   - **Public** auswählen (im Gratis-Tarif nötig für Pages; deine *Daten* sind trotzdem privat, sie liegen in Supabase)
   - **Create repository**
3. Auf **uploading an existing file** klicken und **alle Dateien aus diesem Ordner** hineinziehen:
   `index.html`, `config.js`, `sw.js`, `manifest.webmanifest`, `icon-192.png`, `icon-512.png`, `apple-touch-icon.png`.
   (`supabase.sql` und `ANLEITUNG.md` sind nicht nötig, schaden aber auch nicht.)
   Dann **Commit changes** klicken.
4. **Settings → Pages**:
   - Source: **Deploy from a branch**
   - Branch: **main**, Ordner **/ (root)** → **Save**
5. Nach 1–2 Minuten ist die Website erreichbar unter
   `https://DEINNAME.github.io/resell-cockpit/`.

## Teil 3: Aufs Handy

1. Website im Handy-Browser öffnen und mit deiner E-Mail und deinem Passwort anmelden. Du bleibst danach angemeldet.
2. Als App installieren:
   - **iPhone (Safari):** Teilen → **Zum Home-Bildschirm**
   - **Android (Chrome):** ⋮ → **App installieren** bzw. **Zum Startbildschirm hinzufügen**
3. Die App startet im Vollbild mit eigenem Icon.
   - **Android:** Wenn du lange auf das Icon drückst, erscheint „Schnell erfassen“.
   - **iPhone:** Lege ein zweites Lesezeichen mit `?schnell` am Ende der URL an.

---

## Gut zu wissen

- **Passwort vergessen?** In Supabase unter Authentication → Users beim Nutzer auf „…“ → Passwort zurücksetzen.
- **Pause:** Gratis-Projekte in Supabase pausieren nach etwa 1 Woche ohne Nutzung. Dann im Supabase-Dashboard
  auf „Restore“ klicken. Deine Daten bleiben erhalten.
- **Backup:** Im Tab „Verkäufe“ auf **CSV für Buchhaltung** klicken. Mach das ab und zu, z. B. jeden Monat.
- **Updates:** Geänderte Dateien in GitHub erneut hochladen (gleicher Name überschreibt). Danach die App einmal
  komplett schließen und neu öffnen.
