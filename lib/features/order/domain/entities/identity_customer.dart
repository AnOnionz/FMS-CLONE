import 'dart:convert';

import 'order_entity.dart';

class IdentityOfCustomer {
  final int id;
  final List<CustomerInfo> customerInfos;

  IdentityOfCustomer({
    required this.id,
    required this.customerInfos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerInfos': customerInfos.map((x) => x.toMap()).toList(),
    };
  }

  factory IdentityOfCustomer.fromMap(Map<String, dynamic> map) {
    return IdentityOfCustomer(
      id: map['id'] as int,
      customerInfos: List<CustomerInfo>.from(
        (map['customerInfos'] as List<int>).map<CustomerInfo>(
          (x) => CustomerInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory IdentityOfCustomer.fromJson(String source) =>
      IdentityOfCustomer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IdentityOfCustomer(id: $id, customerInfos: $customerInfos)';
}
