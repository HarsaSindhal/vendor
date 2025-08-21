@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_VENDOR_MASTER_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_VENDOR_MASTER_CDS as select from I_Supplier as A
left outer join I_SupplierCompany as B on (B.Supplier = A.Supplier)
left outer join ZSUPPLIER_DETAILS as C on (C.Supplier = A.Supplier)
left outer join ZVENDOR_MSME_CDS as D on (D.Supplier = A.Supplier)
left outer join ZMM_SUPPLIER_ADDR as e on (e.Supplier = A.Supplier )
left outer join I_BusinessUserBasic as F on (F.UserID = A.CreatedByUser )
left outer join I_SupplierWithHoldingTax as G on (G.Supplier = A.Supplier )
left outer join I_SuplrBankDetailsByIntId as H on (H.Supplier = A.Supplier)
left outer join I_SupplierPurchasingOrg as I on (I.Supplier = A.Supplier)
left outer join I_ClfnObjectCharcValForKeyDate( P_KeyDate:$session.system_date ) as j on (j.ClfnObjectID = A.Supplier
  and j.ClassType = '010' and j.ClfnObjectTable = 'LFA1' and j.CharcInternalID = '0000000824')


{
key A.Supplier,
    A.TaxNumber3,
    A.CityName,
    A.Country,
    A.Region,
    A.PhoneNumber1,
    A.PostalCode,
    A.SupplierAccountGroup,
    A.SupplierName,
    A.DistrictName,
    A.BusinessPartnerPanNumber,
    B.CompanyCodeName,
    B.ReconciliationAccount ,
    B.IsDoubleInvoice,
    B.MinorityGroup,
    A.IN_GSTSupplierClassification,
   case 
        when B.MinorityGroup = 'MIT' then 'Micro-Trading'
        when B.MinorityGroup = 'MIM' then 'Micro-Mfg'
        when B.MinorityGroup = 'MIS' then 'Micro-Service'
        when B.MinorityGroup = 'SMT' then 'Small-Trading'
        when B.MinorityGroup = 'SMM' then 'Small-Mfg'
        when B.MinorityGroup = 'SSE' then 'Small-Service'
        when B.MinorityGroup = 'MET' then 'Medium-Trading'
        when B.MinorityGroup = 'MEM' then 'Medium-Mfg'
        when B.MinorityGroup = 'MES' then 'Medium-Service'
        when B.MinorityGroup = 'NON' then 'Non-MSME'
        else ''
    end as MSMEDescription,
    
  max(  C.EmailAddress) as EmailAddress,
//    D.Msmenumber,
     e.StreetSuffixName2 as Msmenumber,
    e.CareOfName,
    e.AddressSearchTerm1,
    e.StreetPrefixName1 ,
    e.StreetPrefixName2,
    F.PersonFullName,
    G.IsWithholdingTaxSubject,
   max( G.WithholdingTaxType) as WithholdingTaxType ,
    H.Bank,
   case when j.CharcValue is not null then j.CharcValue else H.BankAccount end as BankAccount,
    H.BankControlKey,
    I.CalculationSchemaGroupCode,
    I.PurchaseOrderCurrency,
    I.InvoiceIsGoodsReceiptBased,
    I.PaymentTerms,
    I.PurchasingOrganization,
    A.CreationDate 

    
    
} group by 
    A.Supplier,
    A.TaxNumber3,
    A.CityName,
    A.Country,
    A.Region,
    A.PhoneNumber1,
    A.IN_GSTSupplierClassification,
    A.PostalCode,
    A.SupplierAccountGroup,
    A.SupplierName,
    A.DistrictName,
    A.BusinessPartnerPanNumber,
    B.CompanyCodeName,
    B.ReconciliationAccount ,
    B.IsDoubleInvoice,
    B.MinorityGroup,
//    C.EmailAddress,
    D.Msmenumber,
    e.CareOfName,
    e.AddressSearchTerm1,
    e.StreetPrefixName1 ,
    e.StreetPrefixName2,
    F.PersonFullName,
    G.IsWithholdingTaxSubject,
//    G.WithholdingTaxType,
    H.Bank,
    H.BankAccount,
    H.BankControlKey,
    I.CalculationSchemaGroupCode,
    I.PurchaseOrderCurrency,
    I.InvoiceIsGoodsReceiptBased,
    I.PaymentTerms,
    e.StreetSuffixName2,
    I.PurchasingOrganization,
    j.CharcValue,
    A.CreationDate 
   
