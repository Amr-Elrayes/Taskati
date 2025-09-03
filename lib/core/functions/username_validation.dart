String? usernameValidation(String? username) {
  if (username == null || username.isEmpty) {
    return "Username is required";
  }

  if (username.length < 3) {
    return "Username must be at least 3 characters long";
  }

  if (username.length > 20) {
    return "Username must not exceed 20 characters";
  }

  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
    return "Username can only contain letters, numbers, and underscores";
  }

  if (RegExp(r'^\d').hasMatch(username)) {
    return "Username cannot start with a number";
  }

  return null;
}
