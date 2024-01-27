// float_data.dart

class MessagesAll {
  double float1;
  double float2;

  MessagesAll({required this.float1, required this.float2});

  // Factory constructor to create a new FloatData instance from a map structure.
  factory MessagesAll.fromJson(Map<String, dynamic> json) {
    return MessagesAll(
      float1: json['float1'].toDouble(),
      float2: json['float2'].toDouble(),
    );
  }

  // Method to convert the FloatData instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'float1': float1,
      'float2': float2,
    };
  }
}
