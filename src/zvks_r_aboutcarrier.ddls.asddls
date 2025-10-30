@EndUserText.label: 'About Carrier'
-- DCL
@AccessControl.authorizationCheck: #NOT_REQUIRED
-- Metadata
@Metadata:{
 allowExtensions: true,
 ignorePropagatedAnnotations: true
}
-- Data Model
@VDM.viewType: #CONSUMPTION
-- Performance
@ObjectModel.usageType:{
    serviceQuality: #C,
    dataClass: #MASTER,
    sizeCategory: #L
}
define view entity ZVKS_R_AboutCarrier
  as select from zvks_ta_cr_about
  /* Value Help */
  association [0..1] to /DMO/I_Carrier as _Airline on $projection.AirlineID = _Airline.AirlineID
{
  key carrier_id            as AirlineID,
      call_sign             as CallSign,
      founded_on            as FoundedOn,
      commenced_on          as CommencedOn,
      website               as Website,
      url                   as URL,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      /* Value Associations */
      _Airline
}
