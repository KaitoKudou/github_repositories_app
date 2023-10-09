import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_response.freezed.dart';
part 'github_search_response.g.dart';

@freezed
class GitHubSearchResponse with _$GitHubSearchResponse {

  const factory GitHubSearchResponse({
    required final int id,
    required final String fullName,
    @Default('') final String language,
    required final int stargazersCount,
    required final int watchersCount,
    required final int forksCount,
    required final int openIssuesCount,
    required final Owner owner,
  }) = _GitHubSearchResponse;

  factory GitHubSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$GitHubSearchResponseFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    required String avatarUrl,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
