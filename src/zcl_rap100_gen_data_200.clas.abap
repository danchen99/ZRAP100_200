CLASS zcl_rap100_gen_data_200 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP100_GEN_DATA_200 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "利用程式產生demo資料

    DATA group_id   TYPE string VALUE '200'.
    DATA attachment TYPE /dmo/attachment.
    DATA file_name  TYPE /dmo/filename.
    DATA mime_type  TYPE /dmo/mime_type.


    "clear database data.
    DELETE FROM zrap100_atrav200.

    "每個欄位都要寫到，不然編譯時，會產生錯誤訊息

    "insert travel demo data to database
    INSERT zrap100_atrav200 FROM (

    SELECT FROM /dmo/travel AS travel
    FIELDS
    travel~travel_id        AS travel_id,
    travel~agency_id        AS agency_id,
    travel~customer_id      AS customer_id,
    travel~begin_date       AS begin_date,
    travel~end_date         AS end_date,
    travel~booking_fee      AS booking_fee,
    travel~total_price      AS total_price,
    travel~currency_code    AS currency_code,
    travel~description      AS description,
    CASE travel~status
      WHEN 'N' THEN 'O'
      WHEN 'P' THEN 'O'
      WHEN 'B' THEN 'A'
      ELSE 'X'
    END                     AS overall_status,
    @attachment             AS attachment,         "用@的目的？為何還要再宣告？
    @mime_type              AS mime_type,
    @file_name              AS file_name,
    travel~createdby        AS created_by,
    travel~createdat        AS created_at,
    travel~lastchangedby    AS last_changed_by,
    travel~lastchangedat    AS last_changed_at,
    travel~lastchangedat    AS local_last_changed_at

    ORDER BY travel_id UP TO 30 ROWS

    ).

    COMMIT WORK.

    out->write( |[RAP100] Demo data generated for table ZRAP100_ATRAV{ group_id }.| ).

  ENDMETHOD.
ENDCLASS.
