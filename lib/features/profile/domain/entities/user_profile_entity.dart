import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/mapper.dart';
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
  final int? bankId;
  final String? bankBranch;
  final String? bankAccountNumber;
  final String? bankAccountName;
  final Marital? maritalStatus;
  final int? numberOfChildren;
  final String? emergencyContactName;
  final String? emergencyContactRelationship;
  final String? emergencyContactPhoneNumber;
  final String? emergencyContactAddress;
  final Province? permanentProvince;
  final District? permanentDistrict;
  final Ward? permanentWard;
  final String? permanentAddress;
  final Province? province;
  final District? district;
  final Ward? ward;
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
  final List<ProfilePhoto> photos;

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
    this.bankId,
    this.bankBranch,
    this.bankAccountNumber,
    this.bankAccountName,
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
    List<ProfilePhoto>? photos,
  }) : this.photos = photos ?? [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'reason': reason,
      'fullName': fullName,
      'identityCardNumber': identityCardNumber,
      'phoneNumber': phoneNumber,
      'email': email,
      'gender': gender?.name,
      'birthdate': birthdate?.formatBy(kyMd),
      'birthplace': birthplace,
      'socialInsuranceNumber': socialInsuranceNumber,
      'personalTaxCode': personalTaxCode,
      'bankId': bankId,
      'bankBranch': bankBranch,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountName': bankAccountName,
      'maritalStatus': maritalStatus?.name,
      'numberOfChildren': numberOfChildren,
      'emergencyContactName': emergencyContactName,
      'emergencyContactRelationship': emergencyContactRelationship,
      'emergencyContactPhoneNumber': emergencyContactPhoneNumber,
      'emergencyContactAddress': emergencyContactAddress,
      'permanentProvinceId': permanentProvince?.id,
      'permanentDistrictId': permanentDistrict?.id,
      'permanentWardId': permanentWard?.id,
      'permanentAddress': permanentAddress,
      'provinceId': province?.id,
      'districtId': district?.id,
      'wardId': ward?.id,
      'address': address,
      'bodyHeight': bodyHeight,
      'bodyWeight': bodyWeight,
      'bodyBust': bodyBust,
      'bodyWaist': bodyWaist,
      'bodyHips': bodyHips,
      'shirtSize': shirtSize?.name,
      'pantsSize': pantsSize?.name,
      'dressSize': dressSize?.name,
      'shoeSize': shoeSize,
      'educationLevel': educationLevel?.name,
      'desiredPosition': desiredPosition?.value.toUpperCase(),
      'desiredLocation': desiredLocation,
      'recruitmentSource': recruitmentSource?.name,
      'experiences': experiences
          .whereNot((e) {
            return e.endedAt == null &&
                e.startedAt == null &&
                e.businessLine.isEmptyOrNull &&
                e.companyName.isEmptyOrNull &&
                e.description.isEmptyOrNull &&
                e.leaveReason.isEmptyOrNull &&
                e.title.isEmptyOrNull;
          })
          .map((x) => x.toMap())
          .toList(),
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
          ? DateTime.parse(map['birthdate'] as String).toLocal()
          : null,
      birthplace:
          map['birthplace'] != null ? map['birthplace'] as String : null,
      socialInsuranceNumber: map['socialInsuranceNumber'] != null
          ? map['socialInsuranceNumber'] as String
          : null,
      personalTaxCode: map['personalTaxCode'] != null
          ? map['personalTaxCode'] as String
          : null,
      bankId: map['bankId'] != null ? map['bankId'] as int : null,
      bankBranch:
          map['bankBranch'] != null ? map['bankBranch'] as String : null,
      bankAccountNumber: map['bankAccountNumber'] != null
          ? map['bankAccountNumber'] as String
          : null,
      bankAccountName: map['bankAccountName'] != null
          ? map['bankAccountName'] as String
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
          ? Province.fromMap(map['permanentProvince'] as Map<String, dynamic>)
          : null,
      permanentDistrict: map['permanentDistrict'] != null
          ? District.fromMap(map['permanentDistrict'] as Map<String, dynamic>)
          : null,
      permanentWard: map['permanentWard'] != null
          ? Ward.fromMap(map['permanentWard'] as Map<String, dynamic>)
          : null,
      permanentAddress: map['permanentAddress'] != null
          ? map['permanentAddress'] as String
          : null,
      province: map['province'] != null
          ? Province.fromMap(map['province'] as Map<String, dynamic>)
          : null,
      district: map['district'] != null
          ? District.fromMap(map['district'] as Map<String, dynamic>)
          : null,
      ward: map['ward'] != null
          ? Ward.fromMap(map['ward'] as Map<String, dynamic>)
          : null,
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
        (map['experiences'] as List<dynamic>).map<Experience>(
          (x) => Experience.fromMap(x as Map<String, dynamic>),
        ),
      ),
      photos: List<ProfilePhoto>.from(
        (map['photos'] as List<dynamic>).map<ProfilePhoto>(
          (x) => ProfilePhoto.fromMap(x as Map<String, dynamic>),
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
    int? bankId,
    String? bankBranch,
    String? bankAccountNumber,
    String? bankAccountName,
    Marital? maritalStatus,
    int? numberOfChildren,
    String? emergencyContactName,
    String? emergencyContactRelationship,
    String? emergencyContactPhoneNumber,
    String? emergencyContactAddress,
    Value<Province>? permanentProvince,
    Value<District>? permanentDistrict,
    Value<Ward>? permanentWard,
    String? permanentAddress,
    Value<Province>? province,
    Value<District>? district,
    Value<Ward>? ward,
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
    List<ProfilePhoto>? photos,
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
      bankId: bankId ?? this.bankId,
      bankBranch: bankBranch ?? this.bankBranch,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactRelationship:
          emergencyContactRelationship ?? this.emergencyContactRelationship,
      emergencyContactPhoneNumber:
          emergencyContactPhoneNumber ?? this.emergencyContactPhoneNumber,
      emergencyContactAddress:
          emergencyContactAddress ?? this.emergencyContactAddress,
      permanentProvince: permanentProvince == null
          ? this.permanentProvince
          : permanentProvince.object,
      permanentDistrict: permanentDistrict == null
          ? this.permanentDistrict
          : permanentDistrict.object,
      permanentWard:
          permanentWard == null ? this.permanentWard : permanentWard.object,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      province: province == null ? this.province : province.object,
      district: district == null ? this.district : district.object,
      ward: ward == null ? this.ward : ward.object,
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
    );
  }

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, status: $status, reason: $reason, fullName: $fullName, identityCardNumber: $identityCardNumber, phoneNumber: $phoneNumber, email: $email, gender: $gender, birthdate: $birthdate, birthplace: $birthplace, socialInsuranceNumber: $socialInsuranceNumber, personalTaxCode: $personalTaxCode, maritalStatus: $maritalStatus, numberOfChildren: $numberOfChildren, emergencyContactName: $emergencyContactName, emergencyContactRelationship: $emergencyContactRelationship, emergencyContactPhoneNumber: $emergencyContactPhoneNumber, emergencyContactAddress: $emergencyContactAddress, permanentProvince: $permanentProvince, permanentDistrict: $permanentDistrict, permanentWard: $permanentWard, permanentAddress: $permanentAddress, province: $province, district: $district, ward: $ward, address: $address, bodyHeight: $bodyHeight, bodyWeight: $bodyWeight, bodyBust: $bodyBust, bodyWaist: $bodyWaist, bodyHips: $bodyHips, shirtSize: $shirtSize, pantsSize: $pantsSize, dressSize: $dressSize, shoeSize: $shoeSize, educationLevel: $educationLevel, desiredPosition: $desiredPosition, desiredLocation: $desiredLocation, recruitmentSource: $recruitmentSource, experiences: $experiences, photos: $photos)';
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
      'startedAt': startedAt?.formatBy(kyMd),
      'endedAt': endedAt?.formatBy(kyMd),
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
          ? DateTime.parse(map['startedAt'] as String).toLocal()
          : null,
      endedAt: map['endedAt'] != null
          ? DateTime.parse(map['endedAt'] as String).toLocal()
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

class ProfilePhoto {
  final int? id;
  final PhotoType type;
  final ImageCloud? image;
  final String? localPath;
  final String uuid;

  ProfilePhoto(
      {this.id,
      required this.type,
      this.image,
      this.localPath,
      required String uuid})
      : this.uuid = uuid;

  Map<String, dynamic> toMap(int ID) {
    return <String, dynamic>{
      'type': type.name,
      'imageId': ID,
    };
  }

  String toJson(int ID) => json.encode(toMap(ID));

  factory ProfilePhoto.fromMap(Map<String, dynamic> map) {
    return ProfilePhoto(
        id: map['id'] != null ? map['id'] as int : null,
        type: (map['type'] as String).toPhotoType(),
        image: map['image'] != null
            ? ImageCloud.fromMap(map['image'] as Map<String, dynamic>)
            : null,
        uuid: Uuid().v1());
  }

  factory ProfilePhoto.fromJson(String source) =>
      ProfilePhoto.fromMap(json.decode(source) as Map<String, dynamic>);

  ProfilePhoto copyWith(
      {int? id, PhotoType? type, ImageCloud? image, String? path}) {
    return ProfilePhoto(
        id: id ?? this.id,
        type: type ?? this.type,
        image: image ?? this.image,
        uuid: this.uuid,
        localPath: path ?? this.localPath);
  }

  @override
  String toString() =>
      'Photo(id: $id, type: $type, image: $image, path: $localPath)';
}
