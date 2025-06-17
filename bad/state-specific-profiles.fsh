// State-Specific Profiles and Extensions
// This file provides examples of state-specific profiles and extensions
// that states can use as templates when implementing their own customizations.

// ===== CALIFORNIA EXAMPLES =====

// California-specific Practitioner Profile
Profile: CaliforniaMedicaidPractitioner
Parent: MedicaidPractitioner
Id: california-medicaid-practitioner
Title: "California Medicaid Practitioner"
Description: "Profile for practitioners enrolled in California Medicaid (Medi-Cal)"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-medicaid-practitioner"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "California Department of Health Care Services"
* ^contact.name = "California DHCS"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.dhcs.ca.gov"

* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    npi 1..1 and
    mediCalId 1..1

* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1
* identifier[npi].value obeys npi-check
* identifier[npi].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[npi].type.coding.code = #NPI

* identifier[mediCalId].system = "http://medicaid.ca.gov/provider-id"
* identifier[mediCalId].value 1..1
* identifier[mediCalId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[mediCalId].type.coding.code = #PRN

* extension contains
    CaliforniaProviderTypeExtension named providerType 1..1 and
    CaliforniaCountyCodeExtension named countyCode 1..1

* qualification 1..*
* qualification ^slicing.discriminator.type = #pattern
* qualification ^slicing.discriminator.path = "code.coding.system"
* qualification ^slicing.rules = #open
* qualification ^slicing.description = "Slice based on qualification code system"

* qualification contains
    californiaLicense 1..1

* qualification[californiaLicense].code.coding.system = "http://medicaid.ca.gov/fhir/CodeSystem/california-license-type"
* qualification[californiaLicense].code.coding.code 1..1
* qualification[californiaLicense].identifier.value 1..1
* qualification[californiaLicense].period.start 1..1
* qualification[californiaLicense].period.end 0..1

// California Provider Type Extension
Extension: CaliforniaProviderTypeExtension
Id: california-provider-type-extension
Title: "California Provider Type Extension"
Description: "Extension for California-specific provider types"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-provider-type-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"

* value[x] only CodeableConcept
* valueCodeableConcept from CaliforniaProviderTypesValueSet (required)

// California County Code Extension
Extension: CaliforniaCountyCodeExtension
Id: california-county-code-extension
Title: "California County Code Extension"
Description: "Extension for California county codes"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-county-code-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* ^context[1].type = #element
* ^context[1].expression = "Organization"
* ^context[2].type = #element
* ^context[2].expression = "Location"

* value[x] only CodeableConcept
* valueCodeableConcept from CaliforniaCountyCodesValueSet (required)

// California Provider Types Value Set
ValueSet: CaliforniaProviderTypesValueSet
Id: california-provider-types-valueset
Title: "California Provider Types Value Set"
Description: "Value set for California-specific provider types"
* ^url = "http://medicaid.ca.gov/fhir/ValueSet/california-provider-types-valueset"
* ^status = #active
* ^date = "2025-06-17"
* include codes from system http://medicaid.ca.gov/fhir/CodeSystem/california-provider-types

// California County Codes Value Set
ValueSet: CaliforniaCountyCodesValueSet
Id: california-county-codes-valueset
Title: "California County Codes Value Set"
Description: "Value set for California county codes"
* ^url = "http://medicaid.ca.gov/fhir/ValueSet/california-county-codes-valueset"
* ^status = #active
* ^date = "2025-06-17"
* include codes from system http://medicaid.ca.gov/fhir/CodeSystem/california-county-codes

// California-specific PractitionerRole Profile
Profile: CaliforniaMedicaidPractitionerRole
Parent: MedicaidPractitionerRole
Id: california-medicaid-practitioner-role
Title: "California Medicaid Practitioner Role"
Description: "Profile for practitioner roles in California Medicaid (Medi-Cal)"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-medicaid-practitioner-role"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "California Department of Health Care Services"
* ^contact.name = "California DHCS"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.dhcs.ca.gov"

* practitioner only Reference(CaliforniaMedicaidPractitioner)
* organization only Reference(CaliforniaMedicaidOrganization)

* extension contains
    CaliforniaManagedCareContractExtension named managedCareContract 0..* and
    CaliforniaProviderEnrollmentTypeExtension named enrollmentType 1..1

* specialty 1..*
* specialty from CaliforniaMedicaidSpecialtiesValueSet (extensible)

// California Managed Care Contract Extension
Extension: CaliforniaManagedCareContractExtension
Id: california-managed-care-contract-extension
Title: "California Managed Care Contract Extension"
Description: "Extension for California Managed Care contract information"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-managed-care-contract-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "PractitionerRole"
* ^context[1].type = #element
* ^context[1].expression = "Organization"

* extension contains
    planId 1..1 and
    contractNumber 1..1 and
    contractPeriod 1..1 and
    contractStatus 1..1

* extension[planId].url = "planId"
* extension[planId].value[x] only string
* extension[planId].valueString 1..1

* extension[contractNumber].url = "contractNumber"
* extension[contractNumber].value[x] only string
* extension[contractNumber].valueString 1..1

* extension[contractPeriod].url = "contractPeriod"
* extension[contractPeriod].value[x] only Period
* extension[contractPeriod].valuePeriod.start 1..1
* extension[contractPeriod].valuePeriod.end 0..1

* extension[contractStatus].url = "contractStatus"
* extension[contractStatus].value[x] only CodeableConcept
* extension[contractStatus].valueCodeableConcept from CaliforniaContractStatusValueSet (required)

// California Provider Enrollment Type Extension
Extension: CaliforniaProviderEnrollmentTypeExtension
Id: california-provider-enrollment-type-extension
Title: "California Provider Enrollment Type Extension"
Description: "Extension for California-specific provider enrollment types"
* ^url = "http://medicaid.ca.gov/fhir/StructureDefinition/california-provider-enrollment-type-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "PractitionerRole"

* value[x] only CodeableConcept
* valueCodeableConcept from CaliforniaEnrollmentTypesValueSet (required)

// ===== NEW YORK EXAMPLES =====

// New York-specific Practitioner Profile
Profile: NewYorkMedicaidPractitioner
Parent: MedicaidPractitioner
Id: new-york-medicaid-practitioner
Title: "New York Medicaid Practitioner"
Description: "Profile for practitioners enrolled in New York Medicaid"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-medicaid-practitioner"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "New York State Department of Health"
* ^contact.name = "New York State DOH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.health.ny.gov"

* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    npi 1..1 and
    mmisId 1..1

* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1
* identifier[npi].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[npi].type.coding.code = #NPI

* identifier[mmisId].system = "http://medicaid.ny.gov/provider-id"
* identifier[mmisId].value 1..1
* identifier[mmisId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[mmisId].type.coding.code = #PRN

* extension contains
    NewYorkProviderCategoryExtension named providerCategory 1..* and
    NewYorkOPMCStatusExtension named opmcStatus 0..1

* qualification 1..*
* qualification ^slicing.discriminator.type = #pattern
* qualification ^slicing.discriminator.path = "code.coding.system"
* qualification ^slicing.rules = #open
* qualification ^slicing.description = "Slice based on qualification code system"

* qualification contains
    newYorkLicense 1..1

* qualification[newYorkLicense].code.coding.system = "http://medicaid.ny.gov/fhir/CodeSystem/new-york-license-type"
* qualification[newYorkLicense].code.coding.code 1..1
* qualification[newYorkLicense].identifier.value 1..1
* qualification[newYorkLicense].period.start 1..1
* qualification[newYorkLicense].period.end 0..1

// New York Provider Category Extension
Extension: NewYorkProviderCategoryExtension
Id: new-york-provider-category-extension
Title: "New York Provider Category Extension"
Description: "Extension for New York-specific provider categories"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-provider-category-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"

* value[x] only CodeableConcept
* valueCodeableConcept from NewYorkProviderCategoriesValueSet (required)

// New York OPMC Status Extension
Extension: NewYorkOPMCStatusExtension
Id: new-york-opmc-status-extension
Title: "New York OPMC Status Extension"
Description: "Extension for Office of Professional Medical Conduct status"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-opmc-status-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"

* extension contains
    status 1..1 and
    verificationDate 1..1 and
    expirationDate 0..1 and
    actionReference 0..1

* extension[status].url = "status"
* extension[status].value[x] only CodeableConcept
* extension[status].valueCodeableConcept from NewYorkOPMCStatusValueSet (required)

* extension[verificationDate].url = "verificationDate"
* extension[verificationDate].value[x] only date
* extension[verificationDate].valueDate 1..1

* extension[expirationDate].url = "expirationDate"
* extension[expirationDate].value[x] only date
* extension[expirationDate].valueDate 0..1

* extension[actionReference].url = "actionReference"
* extension[actionReference].value[x] only string
* extension[actionReference].valueString 0..1

// New York-specific PractitionerRole Profile
Profile: NewYorkMedicaidPractitionerRole
Parent: MedicaidPractitionerRole
Id: new-york-medicaid-practitioner-role
Title: "New York Medicaid Practitioner Role"
Description: "Profile for practitioner roles in New York Medicaid"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-medicaid-practitioner-role"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "New York State Department of Health"
* ^contact.name = "New York State DOH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.health.ny.gov"

* practitioner only Reference(NewYorkMedicaidPractitioner)
* organization only Reference(NewYorkMedicaidOrganization)

* extension contains
    NewYorkManagedCareNetworkExtension named managedCareNetwork 0..* and
    NewYorkCredentialingStatusExtension named credentialingStatus 1..1

* specialty 1..*
* specialty from NewYorkMedicaidSpecialtiesValueSet (extensible)

// New York Managed Care Network Extension
Extension: NewYorkManagedCareNetworkExtension
Id: new-york-managed-care-network-extension
Title: "New York Managed Care Network Extension"
Description: "Extension for New York Managed Care network information"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-managed-care-network-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "PractitionerRole"
* ^context[1].type = #element
* ^context[1].expression = "Organization"

* extension contains
    planId 1..1 and
    networkType 1..1 and
    effectiveDate 1..1 and
    terminationDate 0..1 and
    networkStatus 1..1

* extension[planId].url = "planId"
* extension[planId].value[x] only string
* extension[planId].valueString 1..1

* extension[networkType].url = "networkType"
* extension[networkType].value[x] only CodeableConcept
* extension[networkType].valueCodeableConcept from NewYorkNetworkTypesValueSet (required)

* extension[effectiveDate].url = "effectiveDate"
* extension[effectiveDate].value[x] only date
* extension[effectiveDate].valueDate 1..1

* extension[terminationDate].url = "terminationDate"
* extension[terminationDate].value[x] only date
* extension[terminationDate].valueDate 0..1

* extension[networkStatus].url = "networkStatus"
* extension[networkStatus].value[x] only CodeableConcept
* extension[networkStatus].valueCodeableConcept from NewYorkNetworkStatusValueSet (required)

// New York Credentialing Status Extension
Extension: NewYorkCredentialingStatusExtension
Id: new-york-credentialing-status-extension
Title: "New York Credentialing Status Extension"
Description: "Extension for New York-specific credentialing status"
* ^url = "http://medicaid.ny.gov/fhir/StructureDefinition/new-york-credentialing-status-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "PractitionerRole"

* value[x] only CodeableConcept
* valueCodeableConcept from NewYorkCredentialingStatusValueSet (required)

// ===== TEXAS EXAMPLES =====

// Texas-specific Practitioner Profile
Profile: TexasMedicaidPractitioner
Parent: MedicaidPractitioner
Id: texas-medicaid-practitioner
Title: "Texas Medicaid Practitioner"
Description: "Profile for practitioners enrolled in Texas Medicaid"
* ^url = "http://medicaid.tx.gov/fhir/StructureDefinition/texas-medicaid-practitioner"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "Texas Health and Human Services Commission"
* ^contact.name = "Texas HHSC"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.hhs.texas.gov"

* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    npi 1..1 and
    texasProviderId 1..1

* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1
* identifier[npi].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[npi].type.coding.code = #NPI

* identifier[texasProviderId].system = "http://medicaid.tx.gov/provider-id"
* identifier[texasProviderId].value 1..1
* identifier[texasProviderId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[texasProviderId].type.coding.code = #PRN

* extension contains
    TexasProviderTypeExtension named providerType 1..1 and
    TexasMedicaidProgramExtension named medicaidProgram 1..*

* qualification 1..*
* qualification ^slicing.discriminator.type = #pattern
* qualification ^slicing.discriminator.path = "code.coding.system"
* qualification ^slicing.rules = #open
* qualification ^slicing.description = "Slice based on qualification code system"

* qualification contains
    texasLicense 1..1

* qualification[texasLicense].code.coding.system = "http://medicaid.tx.gov/fhir/CodeSystem/texas-license-type"
* qualification[texasLicense].code.coding.code 1..1
* qualification[texasLicense].identifier.value 1..1
* qualification[texasLicense].period.start 1..1
* qualification[texasLicense].period.end 0..1

// Texas Provider Type Extension
Extension: TexasProviderTypeExtension
Id: texas-provider-type-extension
Title: "Texas Provider Type Extension"
Description: "Extension for Texas-specific provider types"
* ^url = "http://medicaid.tx.gov/fhir/StructureDefinition/texas-provider-type-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"

* value[x] only CodeableConcept
* valueCodeableConcept from TexasProviderTypesValueSet (required)

// Texas Medicaid Program Extension
Extension: TexasMedicaidProgramExtension
Id: texas-medicaid-program-extension
Title: "Texas Medicaid Program Extension"
Description: "Extension for Texas Medicaid program participation"
* ^url = "http://medicaid.tx.gov/fhir/StructureDefinition/texas-medicaid-program-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"
* ^context[2].type = #element
* ^context[2].expression = "Organization"

* extension contains
    programType 1..1 and
    enrollmentDate 1..1 and
    endDate 0..1 and
    programStatus 1..1

* extension[programType].url = "programType"
* extension[programType].value[x] only CodeableConcept
* extension[programType].valueCodeableConcept from TexasMedicaidProgramsValueSet (required)

* extension[enrollmentDate].url = "enrollmentDate"
* extension[enrollmentDate].value[x] only date
* extension[enrollmentDate].valueDate 1..1

* extension[endDate].url = "endDate"
* extension[endDate].value[x] only date
* extension[endDate].valueDate 0..1

* extension[programStatus].url = "programStatus"
* extension[programStatus].value[x] only CodeableConcept
* extension[programStatus].valueCodeableConcept from TexasProgramStatusValueSet (required)

// ===== FLORIDA EXAMPLES =====

// Florida-specific Organization Profile
Profile: FloridaMedicaidOrganization
Parent: MedicaidOrganization
Id: florida-medicaid-organization
Title: "Florida Medicaid Organization"
Description: "Profile for organizations enrolled in Florida Medicaid"
* ^url = "http://medicaid.fl.gov/fhir/StructureDefinition/florida-medicaid-organization"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "Florida Agency for Health Care Administration"
* ^contact.name = "Florida AHCA"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://ahca.myflorida.com"

* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    npi 1..1 and
    floridaMedicaidId 1..1 and
    floridaLicenseNumber 0..1

* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1
* identifier[npi].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[npi].type.coding.code = #NPI

* identifier[floridaMedicaidId].system = "http://medicaid.fl.gov/provider-id"
* identifier[floridaMedicaidId].value 1..1
* identifier[floridaMedicaidId].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[floridaMedicaidId].type.coding.code = #PRN

* identifier[floridaLicenseNumber].system = "http://medicaid.fl.gov/license-number"
* identifier[floridaLicenseNumber].value 0..1
* identifier[floridaLicenseNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[floridaLicenseNumber].type.coding.code = #MD

* extension contains
    FloridaOrganizationTypeExtension named organizationType 1..1 and
    FloridaRegionExtension named region 1..1 and
    FloridaManagedCareExtension named managedCare 0..*

* type 1..*
* type from FloridaOrganizationTypesValueSet (extensible)

// Florida Organization Type Extension
Extension: FloridaOrganizationTypeExtension
Id: florida-organization-type-extension
Title: "Florida Organization Type Extension"
Description: "Extension for Florida-specific organization types"
* ^url = "http://medicaid.fl.gov/fhir/StructureDefinition/florida-organization-type-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Organization"

* value[x] only CodeableConcept
* valueCodeableConcept from FloridaOrganizationTypesValueSet (required)

// Florida Region Extension
Extension: FloridaRegionExtension
Id: florida-region-extension
Title: "Florida Region Extension"
Description: "Extension for Florida Medicaid regions"
* ^url = "http://medicaid.fl.gov/fhir/StructureDefinition/florida-region-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Organization"
* ^context[1].type = #element
* ^context[1].expression = "Location"

* value[x] only CodeableConcept
* valueCodeableConcept from FloridaRegionsValueSet (required)

// Florida Managed Care Extension
Extension: FloridaManagedCareExtension
Id: florida-managed-care-extension
Title: "Florida Managed Care Extension"
Description: "Extension for Florida Managed Care participation"
* ^url = "http://medicaid.fl.gov/fhir/StructureDefinition/florida-managed-care-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "Organization"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"

* extension contains
    planId 1..1 and
    planType 1..1 and
    contractNumber 1..1 and
    effectiveDate 1..1 and
    terminationDate 0..1 and
    status 1..1

* extension[planId].url = "planId"
* extension[planId].value[x] only string
* extension[planId].valueString 1..1

* extension[planType].url = "planType"
* extension[planType].value[x] only CodeableConcept
* extension[planType].valueCodeableConcept from FloridaPlanTypesValueSet (required)

* extension[contractNumber].url = "contractNumber"
* extension[contractNumber].value[x] only string
* extension[contractNumber].valueString 1..1

* extension[effectiveDate].url = "effectiveDate"
* extension[effectiveDate].value[x] only date
* extension[effectiveDate].valueDate 1..1

* extension[terminationDate].url = "terminationDate"
* extension[terminationDate].value[x] only date
* extension[terminationDate].valueDate 0..1

* extension[status].url = "status"
* extension[status].value[x] only CodeableConcept
* extension[status].valueCodeableConcept from FloridaPlanStatusValueSet (required)

// ===== MICHIGAN EXAMPLES =====

// Michigan-specific HealthcareService Profile
Profile: MichiganMedicaidHealthcareService
Parent: MedicaidHealthcareService
Id: michigan-medicaid-healthcare-service
Title: "Michigan Medicaid Healthcare Service"
Description: "Profile for healthcare services in Michigan Medicaid"
* ^url = "http://medicaid.mi.gov/fhir/StructureDefinition/michigan-medicaid-healthcare-service"
* ^status = #active
* ^date = "2025-06-17"
* ^publisher = "Michigan Department of Health and Human Services"
* ^contact.name = "Michigan DHHS"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.michigan.gov/mdhhs"

* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    miServiceId 1..1

* identifier[miServiceId].system = "http://medicaid.mi.gov/service-id"
* identifier[miServiceId].value 1..1

* extension contains
    MichiganServiceTypeExtension named serviceType 1..1 and
    MichiganWaiverProgramExtension named waiverProgram 0..* and
    MichiganServiceRegionExtension named serviceRegion 1..*

* providedBy only Reference(MichiganMedicaidOrganization)
* location only Reference(MichiganMedicaidLocation)

* type 1..*
* type from MichiganServiceTypesValueSet (extensible)
* specialty 0..*
* specialty from MichiganServiceSpecialtiesValueSet (extensible)

// Michigan Service Type Extension
Extension: MichiganServiceTypeExtension
Id: michigan-service-type-extension
Title: "Michigan Service Type Extension"
Description: "Extension for Michigan-specific healthcare service types"
* ^url = "http://medicaid.mi.gov/fhir/StructureDefinition/michigan-service-type-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "HealthcareService"

* value[x] only CodeableConcept
* valueCodeableConcept from MichiganServiceTypesValueSet (required)

// Michigan Waiver Program Extension
Extension: MichiganWaiverProgramExtension
Id: michigan-waiver-program-extension
Title: "Michigan Waiver Program Extension"
Description: "Extension for Michigan Medicaid waiver program participation"
* ^url = "http://medicaid.mi.gov/fhir/StructureDefinition/michigan-waiver-program-extension"
* ^status = #active
* ^date = "2025-06-17"
* ^context[0].type = #element
* ^context[0].expression = "HealthcareService"
* ^context[1].type = #element
* ^context[1].expression = "PractitionerRole"
* ^context[2].type = #element
* ^context[2].expression = "Organization"
