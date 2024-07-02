// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../attendance/domain/entities/attendance_entity.dart';

class UserProfileEntity {
  final int? id;
  final String? status;
  final String? reason;
  final String? fullName;
  final String? identityCardNumber;
  final String? phoneNumber;
  final String? email;
  final GenderStatus? gender;
  final DateTime? birthdate;
  final String? birthplace;
  final String? socialInsuranceNumber;
  final String? personalTaxCode;
  final Marital? maritalStatus;
  final int? numberOfChildren;
  final String? emergencyContactName;
  final String? emergencyContactRelationship;
  final String? emergencyContactPhoneNumber;
  final String? emergencyContactAddress;
  final int? permanentProvince;
  final int? permanentDistrict;
  final int? permanentWard;
  final String? permanentAddress;
  final int? province;
  final int? district;
  final int? ward;
  final String? address;
  final int? bodyHeight;
  final int? bodyWeight;
  final int? bodyBust;
  final int? bodyWaist;
  final int? bodyHips;
  final DressSize? shirtSize;
  final DressSize? pantsSize;
  final DressSize? dressSize;
  final int? shoeSize;
  final EducationLevel? educationLevel;
  final DesiredPosition? desiredPosition;
  final String? desiredLocation;
  final RecruitmentSource? recruitmentSource;
  final List<Experience> experiences;
  final List<Photo> photos;
  final String? portraitImage;
  final String? fullbodyImage;
  final String? idfontImage;
  final String? idbackImage;
  final String? cvImage;

  UserProfileEntity({
    this.id,
    this.status,
    this.reason,
    this.fullName,
    this.identityCardNumber,
    this.phoneNumber,
    this.email,
    this.gender,
    this.birthdate,
    this.birthplace,
    this.socialInsuranceNumber,
    this.personalTaxCode,
    this.maritalStatus,
    this.numberOfChildren,
    this.emergencyContactName,
    this.emergencyContactRelationship,
    this.emergencyContactPhoneNumber,
    this.emergencyContactAddress,
    this.permanentProvince,
    this.permanentDistrict,
    this.permanentWard,
    this.permanentAddress,
    this.province,
    this.district,
    this.ward,
    this.address,
    this.bodyHeight,
    this.bodyWeight,
    this.bodyBust,
    this.bodyWaist,
    this.bodyHips,
    this.shirtSize,
    this.pantsSize,
    this.dressSize,
    this.shoeSize,
    this.educationLevel,
    this.desiredPosition,
    this.desiredLocation,
    this.recruitmentSource,
    this.experiences = const [],
    this.photos = const [],
    this.portraitImage,
    this.fullbodyImage,
    this.idfontImage,
    this.idbackImage,
    this.cvImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'reason': reason,
      'fullName': fullName,
      'identityCardNumber': identityCardNumber,
      'phoneNumber': phoneNumber,
      'email': email,
      'gender': gender,
      'birthdate': birthdate?.millisecondsSinceEpoch,
      'birthplace': birthplace,
      'socialInsuranceNumber': socialInsuranceNumber,
      'personalTaxCode': personalTaxCode,
      'maritalStatus': maritalStatus,
      'numberOfChildren': numberOfChildren,
      'emergencyContactName': emergencyContactName,
      'emergencyContactRelationship': emergencyContactRelationship,
      'emergencyContactPhoneNumber': emergencyContactPhoneNumber,
      'emergencyContactAddress': emergencyContactAddress,
      'permanentProvince': permanentProvince,
      'permanentDistrict': permanentDistrict,
      'permanentWard': permanentWard,
      'permanentAddress': permanentAddress,
      'province': province,
      'district': district,
      'ward': ward,
      'address': address,
      'bodyHeight': bodyHeight,
      'bodyWeight': bodyWeight,
      'bodyBust': bodyBust,
      'bodyWaist': bodyWaist,
      'bodyHips': bodyHips,
      'shirtSize': shirtSize,
      'pantsSize': pantsSize,
      'dressSize': dressSize,
      'shoeSize': shoeSize,
      'educationLevel': educationLevel,
      'desiredPosition': desiredPosition,
      'desiredLocation': desiredLocation,
      'recruitmentSource': recruitmentSource,
      'experiences': experiences.map((x) => x.toMap()).toList(),
      'photos': photos.map((x) => x.toMap()).toList(),
    };
  }

  factory UserProfileEntity.fromMap(Map<String, dynamic> map) {
    return UserProfileEntity(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      reason: map['reason'] != null ? map['reason'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      identityCardNumber: map['identityCardNumber'] != null
          ? map['identityCardNumber'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gender:
          map['gender'] != null ? (map['gender'] as String).toGender() : null,
      birthdate: map['birthdate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthdate'] as int)
          : null,
      birthplace:
          map['birthplace'] != null ? map['birthplace'] as String : null,
      socialInsuranceNumber: map['socialInsuranceNumber'] != null
          ? map['socialInsuranceNumber'] as String
          : null,
      personalTaxCode: map['personalTaxCode'] != null
          ? map['personalTaxCode'] as String
          : null,
      maritalStatus: map['maritalStatus'] != null
          ? (map['maritalStatus'] as String).toMerital()
          : null,
      numberOfChildren: map['numberOfChildren'] != null
          ? map['numberOfChildren'] as int
          : null,
      emergencyContactName: map['emergencyContactName'] != null
          ? map['emergencyContactName'] as String
          : null,
      emergencyContactRelationship: map['emergencyContactRelationship'] != null
          ? map['emergencyContactRelationship'] as String
          : null,
      emergencyContactPhoneNumber: map['emergencyContactPhoneNumber'] != null
          ? map['emergencyContactPhoneNumber'] as String
          : null,
      emergencyContactAddress: map['emergencyContactAddress'] != null
          ? map['emergencyContactAddress'] as String
          : null,
      permanentProvince: map['permanentProvince'] != null
          ? map['permanentProvince'] as int
          : null,
      permanentDistrict: map['permanentDistrict'] != null
          ? map['permanentDistrict'] as int
          : null,
      permanentWard:
          map['permanentWard'] != null ? map['permanentWard'] as int : null,
      permanentAddress: map['permanentAddress'] != null
          ? map['permanentAddress'] as String
          : null,
      province: map['province'] != null ? map['province'] as int : null,
      district: map['district'] != null ? map['district'] as int : null,
      ward: map['ward'] != null ? map['ward'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      bodyHeight: map['bodyHeight'] != null ? map['bodyHeight'] as int : null,
      bodyWeight: map['bodyWeight'] != null ? map['bodyWeight'] as int : null,
      bodyBust: map['bodyBust'] != null ? map['bodyBust'] as int : null,
      bodyWaist: map['bodyWaist'] != null ? map['bodyWaist'] as int : null,
      bodyHips: map['bodyHips'] != null ? map['bodyHips'] as int : null,
      shirtSize: map['shirtSize'] != null
          ? (map['shirtSize'] as String).toDressSize()
          : null,
      pantsSize: map['pantsSize'] != null
          ? (map['pantsSize'] as String).toDressSize()
          : null,
      dressSize: map['dressSize'] != null
          ? (map['dressSize'] as String).toDressSize()
          : null,
      shoeSize: map['shoeSize'] != null ? map['shoeSize'] as int : null,
      educationLevel: map['educationLevel'] != null
          ? (map['educationLevel'] as String).toEducationLevel()
          : null,
      desiredPosition: map['desiredPosition'] != null
          ? (map['desiredPosition'] as String).toDesiredPosition()
          : null,
      desiredLocation: map['desiredLocation'] != null
          ? map['desiredLocation'] as String
          : null,
      recruitmentSource: map['recruitmentSource'] != null
          ? (map['recruitmentSource'] as String).toRecruitmentSource()
          : null,
      experiences: List<Experience>.from(
        (map['experiences'] as List<int>).map<Experience>(
          (x) => Experience.fromMap(x as Map<String, dynamic>),
        ),
      ),
      photos: List<Photo>.from(
        (map['photos'] as List<int>).map<Photo>(
          (x) => Photo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileEntity.fromJson(String source) =>
      UserProfileEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  UserProfileEntity copyWith({
    int? id,
    String? status,
    String? reason,
    String? fullName,
    String? identityCardNumber,
    String? phoneNumber,
    String? email,
    GenderStatus? gender,
    DateTime? birthdate,
    String? birthplace,
    String? socialInsuranceNumber,
    String? personalTaxCode,
    Marital? maritalStatus,
    int? numberOfChildren,
    String? emergencyContactName,
    String? emergencyContactRelationship,
    String? emergencyContactPhoneNumber,
    String? emergencyContactAddress,
    int? permanentProvince,
    int? permanentDistrict,
    int? permanentWard,
    String? permanentAddress,
    int? province,
    int? district,
    int? ward,
    String? address,
    int? bodyHeight,
    int? bodyWeight,
    int? bodyBust,
    int? bodyWaist,
    int? bodyHips,
    DressSize? shirtSize,
    DressSize? pantsSize,
    DressSize? dressSize,
    int? shoeSize,
    EducationLevel? educationLevel,
    DesiredPosition? desiredPosition,
    String? desiredLocation,
    RecruitmentSource? recruitmentSource,
    List<Experience>? experiences,
    List<Photo>? photos,
    String? portraitImage,
    String? fullbodyImage,
    String? idfontImage,
    String? idbackImage,
    String? cvImage,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      status: status ?? this.status,
      reason: reason ?? this.reason,
      fullName: fullName ?? this.fullName,
      identityCardNumber: identityCardNumber ?? this.identityCardNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      birthplace: birthplace ?? this.birthplace,
      socialInsuranceNumber:
          socialInsuranceNumber ?? this.socialInsuranceNumber,
      personalTaxCode: personalTaxCode ?? this.personalTaxCode,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactRelationship:
          emergencyContactRelationship ?? this.emergencyContactRelationship,
      emergencyContactPhoneNumber:
          emergencyContactPhoneNumber ?? this.emergencyContactPhoneNumber,
      emergencyContactAddress:
          emergencyContactAddress ?? this.emergencyContactAddress,
      permanentProvince: permanentProvince ?? this.permanentProvince,
      permanentDistrict: permanentDistrict ?? this.permanentDistrict,
      permanentWard: permanentWard ?? this.permanentWard,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      province: province ?? this.province,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      address: address ?? this.address,
      bodyHeight: bodyHeight ?? this.bodyHeight,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      bodyBust: bodyBust ?? this.bodyBust,
      bodyWaist: bodyWaist ?? this.bodyWaist,
      bodyHips: bodyHips ?? this.bodyHips,
      shirtSize: shirtSize ?? this.shirtSize,
      pantsSize: pantsSize ?? this.pantsSize,
      dressSize: dressSize ?? this.dressSize,
      shoeSize: shoeSize ?? this.shoeSize,
      educationLevel: educationLevel ?? this.educationLevel,
      desiredPosition: desiredPosition ?? this.desiredPosition,
      desiredLocation: desiredLocation ?? this.desiredLocation,
      recruitmentSource: recruitmentSource ?? this.recruitmentSource,
      experiences: experiences ?? this.experiences,
      photos: photos ?? this.photos,
      portraitImage: portraitImage ?? this.portraitImage,
      fullbodyImage: fullbodyImage ?? this.fullbodyImage,
      idbackImage: idbackImage ?? this.idbackImage,
      idfontImage: idfontImage ?? this.idfontImage,
      cvImage: cvImage ?? this.cvImage,
    );
  }

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, status: $status, reason: $reason, fullName: $fullName, identityCardNumber: $identityCardNumber, phoneNumber: $phoneNumber, email: $email, gender: $gender, birthdate: $birthdate, birthplace: $birthplace, socialInsuranceNumber: $socialInsuranceNumber, personalTaxCode: $personalTaxCode, maritalStatus: $maritalStatus, numberOfChildren: $numberOfChildren, emergencyContactName: $emergencyContactName, emergencyContactRelationship: $emergencyContactRelationship, emergencyContactPhoneNumber: $emergencyContactPhoneNumber, emergencyContactAddress: $emergencyContactAddress, permanentProvince: $permanentProvince, permanentDistrict: $permanentDistrict, permanentWard: $permanentWard, permanentAddress: $permanentAddress, province: $province, district: $district, ward: $ward, address: $address, bodyHeight: $bodyHeight, bodyWeight: $bodyWeight, bodyBust: $bodyBust, bodyWaist: $bodyWaist, bodyHips: $bodyHips, shirtSize: $shirtSize, pantsSize: $pantsSize, dressSize: $dressSize, shoeSize: $shoeSize, educationLevel: $educationLevel, desiredPosition: $desiredPosition, desiredLocation: $desiredLocation, recruitmentSource: $recruitmentSource, experiences: $experiences, photos: $photos, portraitImage: $portraitImage, fullbodyImage: $fullbodyImage, idfontImage: $idfontImage, idbackImage: $idbackImage, cvImage: $cvImage)';
  }
}

class Experience extends Equatable {
  final int? id;
  final String? title;
  final String? companyName;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final String? description;
  final String? businessLine;
  final String? leaveReason;

  Experience({
    this.id,
    this.title,
    this.companyName,
    this.startedAt,
    this.endedAt,
    this.description,
    this.businessLine,
    this.leaveReason,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'companyName': companyName,
      'startedAt': startedAt?.millisecondsSinceEpoch,
      'endedAt': endedAt?.millisecondsSinceEpoch,
      'description': description,
      'businessLine': businessLine,
      'leaveReason': leaveReason,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      startedAt: map['startedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startedAt'] as int)
          : null,
      endedAt: map['endedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endedAt'] as int)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      businessLine:
          map['businessLine'] != null ? map['businessLine'] as String : null,
      leaveReason:
          map['leaveReason'] != null ? map['leaveReason'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(String source) =>
      Experience.fromMap(json.decode(source) as Map<String, dynamic>);

  Experience copyWith({
    int? id,
    String? title,
    String? companyName,
    DateTime? startedAt,
    DateTime? endedAt,
    String? description,
    String? businessLine,
    String? leaveReason,
  }) {
    return Experience(
      id: id ?? this.id,
      title: title ?? this.title,
      companyName: companyName ?? this.companyName,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      description: description ?? this.description,
      businessLine: businessLine ?? this.businessLine,
      leaveReason: leaveReason ?? this.leaveReason,
    );
  }

  @override
  String toString() {
    return 'Experience(id: $id, title: $title, companyName: $companyName, startedAt: $startedAt, endedAt: $endedAt, description: $description, businessLine: $businessLine, leaveReason: $leaveReason)';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        companyName,
        startedAt,
        endedAt,
        description,
        businessLine,
        leaveReason,
      ];
}

class Photo {
  final int? id;
  final PhotoType type;
  final ImageCloud image;

  Photo({
    this.id,
    required this.type,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'image': image.toMap(),
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      type: (map['type'] as String).toPhotoType(),
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  Photo copyWith({
    int? id,
    PhotoType? type,
    ImageCloud? image,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      image: image ?? this.image,
    );
  }

  @override
  String toString() => 'Photo(id: $id, type: $type, image: $image)';
}
