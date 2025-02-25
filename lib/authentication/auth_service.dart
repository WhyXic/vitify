import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  // sign up
  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(
      email: email, 
      password: password);
  }

  // sign in
  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password);
  }

  // sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }


  // getting user email
  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;

    final user = session?.user;

   
    return user?.email;
  }
}