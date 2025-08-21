@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_VENDOR_MASTER_FINAL'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_VENDOR_MASTER_FINAL as select from ZMM_VENDOR_MASTER_CDS
{
         @UI.lineItem             : [{ position: 10 }]
         @EndUserText.label       : 'Supplier'
         @UI.selectionField       : [{position: 10 }]
         @Consumption.valueHelpDefinition: [ 
        { entity:  { name:    'I_Supplier',
                     element: 'Supplier' }
        }] 
   key   Supplier,
         
          @UI.lineItem             : [{ position: 20 }]
          @EndUserText.label       : 'GST'
          @UI.selectionField       : [{position: 20 }]
   case when    TaxNumber3 is not initial then TaxNumber3 when (SupplierAccountGroup = 'ZIMR' or SupplierAccountGroup = 'ZIMS ')
   then 'Not Applicable' end as TAXNUMBER3,
         
          @UI.lineItem             : [{ position: 30 }]
          @EndUserText.label       : 'CityName'
          CityName,
         
          @UI.lineItem             : [{ position: 40 }]
          @EndUserText.label       : 'Country'
          Country,
         
          @UI.lineItem             : [{ position: 50 }]
          @EndUserText.label       : 'Region'
          Region,
         
          @UI.lineItem             : [{ position: 60 }]
          @EndUserText.label       : 'Mobile'
          PhoneNumber1,
         
          @UI.lineItem             : [{ position: 70 }]
          @EndUserText.label       : 'PostalCode'
          PostalCode,
         
          @UI.lineItem             : [{ position: 80 }]
          @EndUserText.label       : 'SupplierAccountGroup'
          @UI.selectionField       : [{position: 30 }]
          SupplierAccountGroup,
         
          @UI.lineItem             : [{ position: 90 }]
          @EndUserText.label       : 'SupplierName'
          SupplierName,
         
          @UI.lineItem             : [{ position: 100 }]
          @EndUserText.label       : 'DistrictName'
          DistrictName,
         
          @UI.lineItem             : [{ position: 110 }]
          @EndUserText.label       : 'PanNumber'
          BusinessPartnerPanNumber,
         
          @UI.lineItem             : [{ position: 120 }]
          @EndUserText.label       : 'CompanyCodeName'
          @UI.selectionField       : [{position: 40 }]
          CompanyCodeName,
         
          @UI.lineItem             : [{ position: 130 }]
          @EndUserText.label       : 'ReconciliationAccount'
          ReconciliationAccount,
         
          @UI.lineItem             : [{ position: 140 }]
          @EndUserText.label       : 'CheckDoubleInvoice'
          IsDoubleInvoice,
         
          @UI.lineItem             : [{ position: 150 }]
          @EndUserText.label       : 'MSME Indicator'
          MinorityGroup,
          
           @UI.lineItem             : [{ position: 150 }]
          @EndUserText.label       : 'MSME Description'
          MSMEDescription,
          
         
          @UI.lineItem             : [{ position: 160 }]
          @EndUserText.label       : 'EmailAddress'
          @UI.selectionField       : [{position: 50 }]
          EmailAddress,
         
          @UI.lineItem             : [{ position: 170 }]
          @EndUserText.label       : 'Msmenumber'
           Msmenumber,
         
          @UI.lineItem             : [{ position: 180 }]
          @EndUserText.label       : 'Addressline1'
          CareOfName,
         
          @UI.lineItem             : [{ position: 190 }]
          @EndUserText.label       : 'SearchTerm'
          @UI.selectionField       : [{position: 60 }]
          AddressSearchTerm1,
         
          @UI.lineItem             : [{ position: 200 }]
          @EndUserText.label       : 'Addressline2'
          StreetPrefixName1,
         
          @UI.lineItem             : [{ position: 210 }]
          @EndUserText.label       : 'Addressline3'
          StreetPrefixName2,
         
          @UI.lineItem             : [{ position: 220 }]
          @EndUserText.label       : 'Createdbyuser'
          @UI.selectionField       : [{position: 70 }]
          PersonFullName,
         
          @UI.lineItem             : [{ position: 230 }]
          @EndUserText.label       : 'IsWithholdingTaxSubject'
          IsWithholdingTaxSubject,
         
          @UI.lineItem             : [{ position: 240 }]
          @EndUserText.label       : 'WithholdingTaxType'
          WithholdingTaxType,
         
          @UI.lineItem             : [{ position: 250 }]
          @EndUserText.label       : 'Bank'
          Bank,
          
            @UI.lineItem             : [{ position: 260 }]
          @EndUserText.label       : 'BankAccount'
          @UI.selectionField       : [{position: 80 }]
          BankAccount,
          
//            @UI.lineItem             : [{ position: 270 }]
//          @EndUserText.label       : 'BankControlKey'
//          BankControlKey,
//          
            @UI.lineItem             : [{ position: 280 }]
          @EndUserText.label       : 'CalculationSchemaGroupCode'
          CalculationSchemaGroupCode,
          
            @UI.lineItem             : [{ position: 290 }]
          @EndUserText.label       : 'PurchaseOrderCurrency'
          PurchaseOrderCurrency,
          
            @UI.lineItem             : [{ position: 300 }]
          @EndUserText.label       : 'InvoiceIsGoodsReceiptBased'
          InvoiceIsGoodsReceiptBased,
          
            @UI.lineItem             : [{ position: 310 }]
          @EndUserText.label       : 'PaymentTerms'
          PaymentTerms,
          
            @UI.lineItem             : [{ position: 320 }]
          @EndUserText.label       : 'PurchasingOrganization'
          @UI.selectionField       : [{position: 90 }]
          PurchasingOrganization,
          
           @UI.lineItem             : [{ position: 330 }]
          @EndUserText.label       : 'CreationDate'
//          @UI.selectionField       : [{position: 90 }]
          CreationDate,
         
          @UI.lineItem             : [{ position: 340 }]
          @EndUserText.label       : 'GST VEN CLASS'
//          @UI.selectionField       : [{position: 90 }]
          IN_GSTSupplierClassification
         
    
}
