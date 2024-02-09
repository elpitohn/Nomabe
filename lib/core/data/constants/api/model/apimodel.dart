class ApiRequestModel {
  ApiRequestModel({
    required this.authorization,
    this.openAiOrganization,
    this.openAiBody,
  });

  String authorization;
  String? openAiOrganization;
  String? openAiBody;
}
