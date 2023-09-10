
class GetDataModel {
    String? status;
    List<Data>? data;
    int? dataLength;

    GetDataModel({this.status, this.data, this.dataLength});

    GetDataModel.fromJson(Map<String, dynamic> json) {
        if(json["status"] is String) {
            status = json["status"];
        }
        if(json["data"] is List) {
            data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
        }
        if(json["dataLength"] is int) {
            dataLength = json["dataLength"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["status"] = status;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["dataLength"] = dataLength;
        return _data;
    }
}

class Data {
    int? id;
    late String title;
    String? slug;
    String? alt;
    String? path;
    dynamic content;
    String? type;
    dynamic userId;
    String? createdAt;
    String? updatedAt;
    String? model;
    String? yearManufacture;
    dynamic warehouse;
    String? code;
    String? serial;
    String? status;
    dynamic risk;
    int? amount;
    String? manufacturer;
    String? origin;
    dynamic maintenanceId;
    dynamic providerId;
    dynamic repairId;
    int? cateId;
    int? devicesId;
    int? unitId;
    int? departmentId;
    int? image;
    String? lastInspection;
    String? nextInspection;
    String? lastMaintenance;
    String? nextMaintenance;
    dynamic specificat;
    dynamic firstValue;
    dynamic presentValue;
    String? process;
    String? yearUse;
    int? officerChargeId;
    dynamic officersUseId;
    String? firstInformation;
    String? importPrice;
    int? bidProjectId;
    dynamic warrantyDate;
    dynamic configurat;
    dynamic depreciat;
    dynamic note;
    int? officerDepartmentChargeId;
    dynamic officersTrainingId;
    dynamic supplieId;
    int? regularInspection;
    int? regularMaintenance;
    int? parentId;
    String? dateFailure;
    String? reason;
    String? criticalLevel;
    dynamic dateDelivery;
    dynamic liquidationDate;
    int? datePersonId;
    String? updateDay;
    dynamic funding;
    int? periodicRadiationInspection;
    String? lastRadiationInspection;
    String? nextRadiationInspection;
    String? jvContractTerminationDate;
    int? periodOfExternalQualityAssessment;
    dynamic lastExternalQualityAssessment;
    String? nextExternalQualityAssessment;
    int? periodOfClinicEnvironmentInspection;
    String? lastClinicEnvironmentInspection;
    String? nextClinicEnvironmentInspection;
    int? periodOfLicenseRenewalOfRadiationWork;
    String? lastLicenseRenewalOfRadiationWork;
    String? nextLicenseRenewalOfRadiationWork;
    String? hashcode;

    Data({this.id,required this.title, this.slug, this.alt, this.path, this.content, this.type, this.userId, this.createdAt, this.updatedAt, this.model, this.yearManufacture, this.warehouse, this.code, this.serial, this.status, this.risk, this.amount, this.manufacturer, this.origin, this.maintenanceId, this.providerId, this.repairId, this.cateId, this.devicesId, this.unitId, this.departmentId, this.image, this.lastInspection, this.nextInspection, this.lastMaintenance, this.nextMaintenance, this.specificat, this.firstValue, this.presentValue, this.process, this.yearUse, this.officerChargeId, this.officersUseId, this.firstInformation, this.importPrice, this.bidProjectId, this.warrantyDate, this.configurat, this.depreciat, this.note, this.officerDepartmentChargeId, this.officersTrainingId, this.supplieId, this.regularInspection, this.regularMaintenance, this.parentId, this.dateFailure, this.reason, this.criticalLevel, this.dateDelivery, this.liquidationDate, this.datePersonId, this.updateDay, this.funding, this.periodicRadiationInspection, this.lastRadiationInspection, this.nextRadiationInspection, this.jvContractTerminationDate, this.periodOfExternalQualityAssessment, this.lastExternalQualityAssessment, this.nextExternalQualityAssessment, this.periodOfClinicEnvironmentInspection, this.lastClinicEnvironmentInspection, this.nextClinicEnvironmentInspection, this.periodOfLicenseRenewalOfRadiationWork, this.lastLicenseRenewalOfRadiationWork, this.nextLicenseRenewalOfRadiationWork, this.hashcode});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["id"] is int) {
            id = json["id"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["slug"] is String) {
            slug = json["slug"];
        }
        if(json["alt"] is String) {
            alt = json["alt"];
        }
        if(json["path"] is String) {
            path = json["path"];
        }
        content = json["content"];
        if(json["type"] is String) {
            type = json["type"];
        }
        userId = json["user_id"];
        if(json["created_at"] is String) {
            createdAt = json["created_at"];
        }
        if(json["updated_at"] is String) {
            updatedAt = json["updated_at"];
        }
        if(json["model"] is String) {
            model = json["model"];
        }
        if(json["year_manufacture"] is String) {
            yearManufacture = json["year_manufacture"];
        }
        warehouse = json["warehouse"];
        if(json["code"] is String) {
            code = json["code"];
        }
        if(json["serial"] is String) {
            serial = json["serial"];
        }
        if(json["status"] is String) {
            status = json["status"];
        }
        risk = json["risk"];
        if(json["amount"] is int) {
            amount = json["amount"];
        }
        if(json["manufacturer"] is String) {
            manufacturer = json["manufacturer"];
        }
        if(json["origin"] is String) {
            origin = json["origin"];
        }
        maintenanceId = json["maintenance_id"];
        providerId = json["provider_id"];
        repairId = json["repair_id"];
        if(json["cate_id"] is int) {
            cateId = json["cate_id"];
        }
        if(json["devices_id"] is int) {
            devicesId = json["devices_id"];
        }
        if(json["unit_id"] is int) {
            unitId = json["unit_id"];
        }
        if(json["department_id"] is int) {
            departmentId = json["department_id"];
        }
        if(json["image"] is int) {
            image = json["image"];
        }
        if(json["last_inspection"] is String) {
            lastInspection = json["last_inspection"];
        }
        if(json["next_inspection"] is String) {
            nextInspection = json["next_inspection"];
        }
        if(json["last_maintenance"] is String) {
            lastMaintenance = json["last_maintenance"];
        }
        if(json["next_maintenance"] is String) {
            nextMaintenance = json["next_maintenance"];
        }
        specificat = json["specificat"];
        firstValue = json["first_value"];
        presentValue = json["present_value"];
        if(json["process"] is String) {
            process = json["process"];
        }
        if(json["year_use"] is String) {
            yearUse = json["year_use"];
        }
        if(json["officer_charge_id"] is int) {
            officerChargeId = json["officer_charge_id"];
        }
        officersUseId = json["officers_use_id"];
        if(json["first_information"] is String) {
            firstInformation = json["first_information"];
        }
        if(json["import_price"] is String) {
            importPrice = json["import_price"];
        }
        if(json["bid_project_id"] is int) {
            bidProjectId = json["bid_project_id"];
        }
        warrantyDate = json["warranty_date"];
        configurat = json["configurat"];
        depreciat = json["depreciat"];
        note = json["note"];
        if(json["officer_department_charge_id"] is int) {
            officerDepartmentChargeId = json["officer_department_charge_id"];
        }
        officersTrainingId = json["officers_training_id"];
        supplieId = json["supplie_id"];
        if(json["regular_inspection"] is int) {
            regularInspection = json["regular_inspection"];
        }
        if(json["regular_maintenance"] is int) {
            regularMaintenance = json["regular_maintenance"];
        }
        if(json["parent_id"] is int) {
            parentId = json["parent_id"];
        }
        if(json["date_failure"] is String) {
            dateFailure = json["date_failure"];
        }
        if(json["reason"] is String) {
            reason = json["reason"];
        }
        if(json["critical_level"] is String) {
            criticalLevel = json["critical_level"];
        }
        dateDelivery = json["date_delivery"];
        liquidationDate = json["liquidation_date"];
        if(json["date_person_id"] is int) {
            datePersonId = json["date_person_id"];
        }
        if(json["update_day"] is String) {
            updateDay = json["update_day"];
        }
        funding = json["funding"];
        if(json["periodic_radiation_inspection"] is int) {
            periodicRadiationInspection = json["periodic_radiation_inspection"];
        }
        if(json["last_radiation_inspection"] is String) {
            lastRadiationInspection = json["last_radiation_inspection"];
        }
        if(json["next_radiation_inspection"] is String) {
            nextRadiationInspection = json["next_radiation_inspection"];
        }
        if(json["jv_contract_termination_date"] is String) {
            jvContractTerminationDate = json["jv_contract_termination_date"];
        }
        if(json["period_of_external_quality_assessment"] is int) {
            periodOfExternalQualityAssessment = json["period_of_external_quality_assessment"];
        }
        lastExternalQualityAssessment = json["last_external_quality_assessment"];
        if(json["next_external_quality_assessment"] is String) {
            nextExternalQualityAssessment = json["next_external_quality_assessment"];
        }
        if(json["period_of_clinic_environment_inspection"] is int) {
            periodOfClinicEnvironmentInspection = json["period_of_clinic_environment_inspection"];
        }
        if(json["last_clinic_environment_inspection"] is String) {
            lastClinicEnvironmentInspection = json["last_clinic_environment_inspection"];
        }
        if(json["next_clinic_environment_inspection"] is String) {
            nextClinicEnvironmentInspection = json["next_clinic_environment_inspection"];
        }
        if(json["period_of_license_renewal_of_radiation_work"] is int) {
            periodOfLicenseRenewalOfRadiationWork = json["period_of_license_renewal_of_radiation_work"];
        }
        if(json["last_license_renewal_of_radiation_work"] is String) {
            lastLicenseRenewalOfRadiationWork = json["last_license_renewal_of_radiation_work"];
        }
        if(json["next_license_renewal_of_radiation_work"] is String) {
            nextLicenseRenewalOfRadiationWork = json["next_license_renewal_of_radiation_work"];
        }
        if(json["hash_code"] is String) {
            hashcode = json["hash_code"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["slug"] = slug;
        _data["alt"] = alt;
        _data["path"] = path;
        _data["content"] = content;
        _data["type"] = type;
        _data["user_id"] = userId;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        _data["model"] = model;
        _data["year_manufacture"] = yearManufacture;
        _data["warehouse"] = warehouse;
        _data["code"] = code;
        _data["serial"] = serial;
        _data["status"] = status;
        _data["risk"] = risk;
        _data["amount"] = amount;
        _data["manufacturer"] = manufacturer;
        _data["origin"] = origin;
        _data["maintenance_id"] = maintenanceId;
        _data["provider_id"] = providerId;
        _data["repair_id"] = repairId;
        _data["cate_id"] = cateId;
        _data["devices_id"] = devicesId;
        _data["unit_id"] = unitId;
        _data["department_id"] = departmentId;
        _data["image"] = image;
        _data["last_inspection"] = lastInspection;
        _data["next_inspection"] = nextInspection;
        _data["last_maintenance"] = lastMaintenance;
        _data["next_maintenance"] = nextMaintenance;
        _data["specificat"] = specificat;
        _data["first_value"] = firstValue;
        _data["present_value"] = presentValue;
        _data["process"] = process;
        _data["year_use"] = yearUse;
        _data["officer_charge_id"] = officerChargeId;
        _data["officers_use_id"] = officersUseId;
        _data["first_information"] = firstInformation;
        _data["import_price"] = importPrice;
        _data["bid_project_id"] = bidProjectId;
        _data["warranty_date"] = warrantyDate;
        _data["configurat"] = configurat;
        _data["depreciat"] = depreciat;
        _data["note"] = note;
        _data["officer_department_charge_id"] = officerDepartmentChargeId;
        _data["officers_training_id"] = officersTrainingId;
        _data["supplie_id"] = supplieId;
        _data["regular_inspection"] = regularInspection;
        _data["regular_maintenance"] = regularMaintenance;
        _data["parent_id"] = parentId;
        _data["date_failure"] = dateFailure;
        _data["reason"] = reason;
        _data["critical_level"] = criticalLevel;
        _data["date_delivery"] = dateDelivery;
        _data["liquidation_date"] = liquidationDate;
        _data["date_person_id"] = datePersonId;
        _data["update_day"] = updateDay;
        _data["funding"] = funding;
        _data["periodic_radiation_inspection"] = periodicRadiationInspection;
        _data["last_radiation_inspection"] = lastRadiationInspection;
        _data["next_radiation_inspection"] = nextRadiationInspection;
        _data["jv_contract_termination_date"] = jvContractTerminationDate;
        _data["period_of_external_quality_assessment"] = periodOfExternalQualityAssessment;
        _data["last_external_quality_assessment"] = lastExternalQualityAssessment;
        _data["next_external_quality_assessment"] = nextExternalQualityAssessment;
        _data["period_of_clinic_environment_inspection"] = periodOfClinicEnvironmentInspection;
        _data["last_clinic_environment_inspection"] = lastClinicEnvironmentInspection;
        _data["next_clinic_environment_inspection"] = nextClinicEnvironmentInspection;
        _data["period_of_license_renewal_of_radiation_work"] = periodOfLicenseRenewalOfRadiationWork;
        _data["last_license_renewal_of_radiation_work"] = lastLicenseRenewalOfRadiationWork;
        _data["next_license_renewal_of_radiation_work"] = nextLicenseRenewalOfRadiationWork;
        _data["hash_code"] = hashCode;
        return _data;
    }
}