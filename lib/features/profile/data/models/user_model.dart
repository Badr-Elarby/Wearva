class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatar;
  final String joinDate;
  final int totalOrders;
  final double totalSpent;
  final String? address;
  final String? city;
  final String? country;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.joinDate,
    required this.totalOrders,
    required this.totalSpent,
    this.address,
    this.city,
    this.country,
  });

  // Factory constructor for JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      joinDate: json['joinDate'] ?? '',
      totalOrders: json['totalOrders'] ?? 0,
      totalSpent: (json['totalSpent'] ?? 0.0).toDouble(),
      address: json['address'],
      city: json['city'],
      country: json['country'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'joinDate': joinDate,
      'totalOrders': totalOrders,
      'totalSpent': totalSpent,
      'address': address,
      'city': city,
      'country': country,
    };
  }

  // Copy with method
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? joinDate,
    int? totalOrders,
    double? totalSpent,
    String? address,
    String? city,
    String? country,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      joinDate: joinDate ?? this.joinDate,
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, joinDate: $joinDate, totalOrders: $totalOrders, totalSpent: $totalSpent, address: $address, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar &&
        other.joinDate == joinDate &&
        other.totalOrders == totalOrders &&
        other.totalSpent == totalSpent &&
        other.address == address &&
        other.city == city &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        avatar.hashCode ^
        joinDate.hashCode ^
        totalOrders.hashCode ^
        totalSpent.hashCode ^
        address.hashCode ^
        city.hashCode ^
        country.hashCode;
  }
}
