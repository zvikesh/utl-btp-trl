@EndUserText.label: 'Airline Carrier Contact'
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
define view entity ZVKS_R_CarrierContact
  as select from zvks_ta_cr_cont
  -- Value Table
  association [0..1] to I_Country as _Country on $projection.CountryCode = _Country.Country
{
  key carrier_id            as AirlineID,
  key contact_id            as ContactID,

      @Semantics.name.givenName: true
      first_name            as FirstName,

      @Semantics.name.familyName: true
      last_name             as LastName,

      @Semantics.address.street: true
      street                as Street,

      @Semantics.address.zipCode: true
      postal_code           as PostalCode,

      @Semantics.address.city: true
      city                  as City,

      @Semantics.address.country: true
      @EndUserText.label: 'Country'
      country_code          as CountryCode,

      @Semantics.telephone.type: [ #CELL,#WORK ]
      phone_number          as PhoneNumber,

      @Semantics.eMail.address: true
      @Semantics.eMail.type: [ #WORK ]
      email_address         as EmailAddress,

      /* Admin */

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true //local ETag field --> OData ETag
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      /* Associations */
      _Country
}
