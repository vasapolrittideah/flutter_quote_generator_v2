import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_quote_generator_v2/core/constants/hive_type_ids.dart';

part 'quote.g.dart';

@HiveType(typeId: HiveTypeIds.quote)
class Quote extends Equatable {
  const Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String quote;

  @HiveField(3)
  final String author;

  @override
  List<Object?> get props => [id, quote, author];
}
