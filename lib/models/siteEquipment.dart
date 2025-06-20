// lib/models/site_equipment.dart
import '/utils/parsing_utils.dart';
class SiteEquipment {
  int? id;
  int? siteId;
  bool? fccModel;
  String? fccLocations;
  bool? atgModel;
  String? atgLocation;
  bool? printerRequired; // Use 'Y' or 'N' or null
  DateTime? dateUpdated;
  DateTime? dateEntry;
  int? syncStatus = 0;

  SiteEquipment({
    this.id,
    this.siteId,
    this.fccModel,
    this.fccLocations,
    this.atgModel,
    this.atgLocation,
    this.printerRequired,
    this.dateUpdated,
    this.dateEntry,
  });

  // Convert to Map for sqflite
  Map<String, dynamic> toMap() {
     final map = <String, dynamic>{
      'site_id': siteId,
      'fcc_model': fccModel,
      'fcc_locations': fccLocations,
      'atg_model': atgModel,
      'atg_location': atgLocation,
      'printer_required': printerRequired,
      'date_updated': dateUpdated?.toIso8601String(),
      'date_entry': dateEntry?.toIso8601String(),
      'sync_status': syncStatus,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  // Create from Map
  factory SiteEquipment.fromMap(Map<String, dynamic> map) {
    return SiteEquipment(
      id: map['id'],
      siteId: map['site_id'],
      fccModel: parseBool(map['fcc_model']),
      fccLocations: map['fcc_locations'],
      atgModel:parseBool( map['atg_model']),
      atgLocation: map['atg_location'],
      printerRequired: parseBool(map['printer_required']),
      dateEntry: map['date_entry'] != null ? DateTime.parse(map['date_entry']) : null,
      dateUpdated: map['date_updated'] != null ? DateTime.parse(map['date_updated']) : null,
    );
  }
}
