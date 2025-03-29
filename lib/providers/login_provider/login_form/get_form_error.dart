String

getFormErrors(String email, String password) {
  List<String> errors = [];

  if (email.isEmpty) {
    errors.add("📧 Email is required.");
  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
    errors.add("📧 Enter a valid email.");
  }

  if (password.isEmpty) {
    errors.add("🔒 Password is required.");
  } else if (password.length < 6) {
    errors.add("🔒 Password must be at least 6 characters.");
  }

  return errors.join("\n"); // Combine all errors into a single string
}
