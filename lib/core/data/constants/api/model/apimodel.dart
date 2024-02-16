class ApiRequestModel {
  ApiRequestModel({
    required this.authorization,
    this.openAiOrganization,
    this.data,
  });

  String authorization;
  String? openAiOrganization;
  Map<String, dynamic>? data;
}
