CLASS zvks_cl_data_gen_utility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    METHODS:
      generate_airline_contact
        IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      generate_about_airline
        IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zvks_cl_data_gen_utility IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    me->generate_airline_contact( out ).
    me->generate_about_airline( out ).

  ENDMETHOD.

  METHOD generate_airline_contact.

    TYPES:
      lty_carrier_cont TYPE zvks_ta_cr_cont,
      ltt_carrier_cont TYPE STANDARD TABLE OF lty_carrier_cont WITH DEFAULT KEY
                       WITH NON-UNIQUE SORTED KEY k_pr_keys
                                       COMPONENTS carrier_id contact_id.

    DELETE FROM zvks_ta_cr_cont.
    COMMIT WORK AND WAIT.

    DATA(lt_carrier_cont) = VALUE ltt_carrier_cont( ( client                = sy-mandt
                                                      carrier_id            = 'AA'
                                                      contact_id            = '001'
                                                      first_name            = 'American Airlines'
                                                      last_name             = 'Helpdesk'
                                                      street                = 'Redmond'
                                                      postal_code           = '111111'
                                                      city                  = 'Ohio'
                                                      country_code          = 'US'
                                                      phone_number          = '+1 111-111-1111'
                                                      email_address         = 'dummy.contact@americanairlines.com'
                                                      created_by            = cl_abap_context_info=>get_user_technical_name( )
                                                      created_at            = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                      local_last_changed_by = cl_abap_context_info=>get_user_technical_name( )
                                                      local_last_changed_at = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                      last_changed_at       = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                   ) ).

    MODIFY zvks_ta_cr_cont FROM TABLE @lt_carrier_cont.
    COMMIT WORK AND WAIT.
    out->write( 'Generated: Airline Contact.' ).

  ENDMETHOD.

  METHOD generate_about_airline.

    TYPES:
      lty_about_carr TYPE zvks_ta_cr_about,
      ltt_about_carr TYPE STANDARD TABLE OF lty_about_carr WITH DEFAULT KEY
                      WITH NON-UNIQUE SORTED KEY k_pr_keys
                                      COMPONENTS carrier_id.

    DELETE FROM zvks_ta_cr_about.
    COMMIT WORK AND WAIT.

    DATA(lt_about_carr) = VALUE ltt_about_carr( ( client                = sy-mandt
                                                  carrier_id            = 'AA'
                                                  call_sign             = 'AMERICAN'
                                                  founded_On            = '19260415'
                                                  commenced_on          = '19360625'
                                                  website               = 'aa.com'
                                                  url                   = 'https://www.americanairlines.in/'
                                                  created_by            = cl_abap_context_info=>get_user_technical_name( )
                                                  created_at            = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                  local_last_changed_by = cl_abap_context_info=>get_user_technical_name( )
                                                  local_last_changed_at = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                  last_changed_at       = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) )
                                                ) ).

    MODIFY zvks_ta_cr_about FROM TABLE @lt_about_carr.
    COMMIT WORK AND WAIT.
    out->write( 'Generated: About Airline.' ).

  ENDMETHOD.

ENDCLASS.
