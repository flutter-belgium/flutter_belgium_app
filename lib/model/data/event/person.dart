class Person {
  final String name;
  final String? email;
  final String? phone;
  final String? imageUrl;

  const Person({
    required this.name,
    this.email,
    this.phone,
    this.imageUrl,
  });
}
