// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GitHubSearchResponse _$$_GitHubSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GitHubSearchResponse(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      language: json['language'] as String? ?? '',
      stargazersCount: json['stargazers_count'] as int,
      watchersCount: json['watchers_count'] as int,
      forksCount: json['forks_count'] as int,
      openIssuesCount: json['open_issues_count'] as int,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GitHubSearchResponseToJson(
        _$_GitHubSearchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'owner': instance.owner,
    };

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) => _$_Owner(
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };
