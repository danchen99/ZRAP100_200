@Metadata.allowExtensions: true
@EndUserText.label: '##GENERATED Travel App (200)'
@Search.searchable: true
@AccessControl.authorizationCheck: #CHECK
define root view entity ZRAP100_C_TRAVELTP_200
  provider contract transactional_query
  as projection on ZRAP100_R_TRAVELTP_200
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelId,


      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName'] //case-sensitive
      @Consumption.valueHelpDefinition: [{
            entity: {
                name: '/DMO/I_Agency_StdVH',
                element: 'AgencyID'
            },
            useForValidation: true
      }]
      AgencyId,
      _Agency.Name              as AgencyName, //利用原CDS暴露宣告部分來使用



      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName'] //case-sensitive
      @Consumption.valueHelpDefinition: [{
            entity: {
                name: '/DMO/I_Customer_StdVH',
                element: 'CustomerID'
            },
            useForValidation: true
      }]
      CustomerId,
      _Customer.LastName        as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,

      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'I_CurrencyStdVH',
              element: 'Currency'
          },
          useForValidation: true
      }]
      CurrencyCode,
      Description,

      

      @ObjectModel.text.element: ['OverallStatusText'] //case-sensitive
      @Consumption.valueHelpDefinition: [{
            entity: {
                name: '/DMO/I_Overall_Status_VH',
                element: 'OverallStatus'
            },
            useForValidation: true
      }] 
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized, //邏輯？？


      Attachment,
      MimeType,
      FileName,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
