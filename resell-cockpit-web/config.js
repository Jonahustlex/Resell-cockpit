// Verbindung zu deinem Supabase-Projekt.
// Werte findest du in Supabase unter Project Settings → API Keys (bzw. Data API).
// Der Publishable Key (oder "anon public" Key) darf öffentlich sein: Die Datenbank-Regeln
// (Row Level Security) sorgen dafür, dass nur du nach dem Login deine Daten siehst.
// NIEMALS hier den "secret" oder "service_role" Key eintragen!
window.RESELL_CONFIG = {
  supabaseUrl: 'https://DEIN-PROJEKT.supabase.co',
  supabaseKey: 'DEIN-PUBLISHABLE-KEY'
};window.RESELL_CONFIG = {
  supabaseUrl: 'https://abcdefgh.supabase.co',
  supabaseKey: 'sb_publishable_...'
};
