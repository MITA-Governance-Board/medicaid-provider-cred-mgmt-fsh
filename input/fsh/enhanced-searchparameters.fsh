// Enhanced Medicaid Provider Credentialing Search Parameters

// Provider Address Search Parameters
Instance: MedicaidProviderAddressCitySearchParameter
InstanceOf: SearchParameter
Title: "Search by Provider City"
Description: "Search for practitioners by city"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-address-city"
* version = "0.1.0"
* name = "MedicaidProviderAddressCitySearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by city"
* code = #address-city
* base[0] = #Practitioner
* base[+] = #PractitionerRole
* type = #string
* expression = "Practitioner.address.city | PractitionerRole.practitioner.resolve().address.city"
* xpath = "f:Practitioner/f:address/f:city | f:PractitionerRole/f:practitioner/resolve()/f:address/f:city"
* xpathUsage = #normal

Instance: MedicaidProviderAddressStateSearchParameter
InstanceOf: SearchParameter
Title: "Search by Provider State"
Description: "Search for practitioners by state"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-address-state"
* version = "0.1.0"
* name = "MedicaidProviderAddressStateSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by state"
* code = #address-state
* base[0] = #Practitioner
* base[+] = #PractitionerRole
* type = #string
* expression = "Practitioner.address.state | PractitionerRole.practitioner.resolve().address.state"
* xpath = "f:Practitioner/f:address/f:state | f:PractitionerRole/f:practitioner/resolve()/f:address/f:state"
* xpathUsage = #normal

Instance: MedicaidProviderAddressPostalCodeSearchParameter
InstanceOf: SearchParameter
Title: "Search by Provider Postal Code"
Description: "Search for practitioners by postal code"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-address-postalcode"
* version = "0.1.0"
* name = "MedicaidProviderAddressPostalCodeSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by postal code"
* code = #address-postalcode
* base[0] = #Practitioner
* base[+] = #PractitionerRole
* type = #string
* expression = "Practitioner.address.postalCode | PractitionerRole.practitioner.resolve().address.postalCode"
* xpath = "f:Practitioner/f:address/f:postalCode | f:PractitionerRole/f:practitioner/resolve()/f:address/f:postalCode"
* xpathUsage = #normal

// Provider Active Status Search Parameter
Instance: MedicaidProviderActiveSearchParameter
InstanceOf: SearchParameter
Title: "Search by Provider Active Status"
Description: "Search for practitioners by active status"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-active"
* version = "0.1.0"
* name = "MedicaidProviderActiveSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by active status"
* code = #active
* base[0] = #Practitioner
* base[+] = #PractitionerRole
* type = #token
* expression = "Practitioner.active | PractitionerRole.active"
* xpath = "f:Practitioner/f:active | f:PractitionerRole/f:active"
* xpathUsage = #normal

// Provider Type Search Parameter
Instance: MedicaidProviderTypeSearchParameter
InstanceOf: SearchParameter
Title: "Search by Provider Type"
Description: "Search for practitioners by provider type"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-type"
* version = "0.1.0"
* name = "MedicaidProviderTypeSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by provider type"
* code = #provider-type
* base = #PractitionerRole
* type = #token
* expression = "PractitionerRole.code"
* xpath = "f:PractitionerRole/f:code"
* xpathUsage = #normal

// Organization Type Search Parameter
Instance: MedicaidOrganizationTypeSearchParameter
InstanceOf: SearchParameter
Title: "Search by Organization Type"
Description: "Search for organizations by type"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-organization-type"
* version = "0.1.0"
* name = "MedicaidOrganizationTypeSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for organizations by type"
* code = #organization-type
* base = #Organization
* type = #token
* expression = "Organization.type"
* xpath = "f:Organization/f:type"
* xpathUsage = #normal

// Verification Date Range Search Parameters
Instance: MedicaidVerificationLastPerformedSearchParameter
InstanceOf: SearchParameter
Title: "Search by Verification Last Performed Date"
Description: "Search for verification results by last performed date"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-verification-last-performed"
* version = "0.1.0"
* name = "MedicaidVerificationLastPerformedSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for verification results by last performed date"
* code = #last-performed
* base = #VerificationResult
* type = #date
* expression = "VerificationResult.lastPerformed"
* xpath = "f:VerificationResult/f:lastPerformed"
* xpathUsage = #normal

Instance: MedicaidVerificationNextScheduledSearchParameter
InstanceOf: SearchParameter
Title: "Search by Verification Next Scheduled Date"
Description: "Search for verification results by next scheduled date"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-verification-next-scheduled"
* version = "0.1.0"
* name = "MedicaidVerificationNextScheduledSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for verification results by next scheduled date"
* code = #next-scheduled
* base = #VerificationResult
* type = #date
* expression = "VerificationResult.nextScheduled"
* xpath = "f:VerificationResult/f:nextScheduled"
* xpathUsage = #normal

// Healthcare Service Type Search Parameter
Instance: MedicaidHealthcareServiceTypeSearchParameter
InstanceOf: SearchParameter
Title: "Search by Healthcare Service Type"
Description: "Search for healthcare services by type"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-healthcare-service-type"
* version = "0.1.0"
* name = "MedicaidHealthcareServiceTypeSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for healthcare services by type"
* code = #service-type
* base = #HealthcareService
* type = #token
* expression = "HealthcareService.type"
* xpath = "f:HealthcareService/f:type"
* xpathUsage = #normal

// Combined Provider Search Parameter
Instance: MedicaidCombinedProviderSearchParameter
InstanceOf: SearchParameter
Title: "Combined Provider Search"
Description: "Search for practitioners by name across both Practitioner and PractitionerRole resources"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-combined-provider-name"
* version = "0.1.0"
* name = "MedicaidCombinedProviderSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-17"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by name across both Practitioner and PractitionerRole resources"
* code = #provider-name
* base[0] = #Practitioner
* base[+] = #PractitionerRole
* type = #string
* expression = "Practitioner.name | PractitionerRole.practitioner.resolve().name"
* xpath = "f:Practitioner/f:name | f:PractitionerRole/f:practitioner/resolve()/f:name"
* xpathUsage = #normal
