import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://naxdeevqvnisgguqrfom.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5heGRlZXZxdm5pc2dndXFyZm9tIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkyOTQ3NjgsImV4cCI6MjAxNDg3MDc2OH0.u0WYXUB_md6SVt8aLncNhKbc901LXQkc0JR3i4CPXCo';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
