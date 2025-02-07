// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
      active: json['active'] as bool,
      recurrent: json['recurrent'] as bool,
      product: json['product'] as String,
      purchase: json['purchase'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expiration': instance.expiration.toIso8601String(),
      'active': instance.active,
      'recurrent': instance.recurrent,
      'product': instance.product,
      'purchase': instance.purchase,
      'token': instance.token,
    };
