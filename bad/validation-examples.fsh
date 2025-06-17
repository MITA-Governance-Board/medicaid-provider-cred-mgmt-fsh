// Medicaid Provider Credentialing Validation Examples

// Example demonstrating all required elements for MedicaidPractitioner
Instance: MedicaidPractitionerValidationExample
InstanceOf: MedicaidPractitioner
Title: "Medicaid Practitioner Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Practitioner"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "1122334455"
* active = true
* name.family = "Johnson"
* name.given[0] = "Robert"
* name.prefix = "Dr."
* telecom[0].system = #phone
* telecom[0].value = "555-111-2222"
* telecom[0].use = #work
* address.line[0] = "100 Healthcare Avenue"
* address.city = "Metropolis"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* gender = #male
* birthDate = "1970-04-25"
* qualification[0].identifier.system = "http://example.org/state-medical-board"
* qualification[0].identifier.value = "IL-MD-54321"
* qualification[0].code = http://terminology.hl7.org/CodeSystem/v2-0360#MD "Doctor of Medicine"
* qualification[0].period.start = "2000-06-01"
* qualification[0].issuer.display = "Illinois State Medical Board"
* qualification[0].extension[boardCertification].extension[boardName].valueString = "American Board of Family Medicine"
* qualification[0].extension[boardCertification].extension[certificationDate].valueDate = "2005-07-15"
* qualification[0].extension[boardCertification].extension[expirationDate].valueDate = "2025-07-15"
* qualification[0].extension[boardCertification].extension[certificationNumber].valueString = "ABFM-54321"
* extension[medicaidProviderId].valueString = "IL-MCAID-54321"

// Example demonstrating all required elements for MedicaidPractitionerRole
Instance: MedicaidPractitionerRoleValidationExample
InstanceOf: MedicaidPractitionerRole
Title: "Medicaid Practitioner Role Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Practitioner Role"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"
* extension[enrollmentStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status#enrolled "Enrolled"
* extension[credentialingStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status#credentialed "Credentialed"
* identifier[0].system = "urn:oid:2.16.840.1.113883.4.642.40.42.3"
* identifier[0].value = "PR-54321"
* active = true
* period.start = "2023-01-15"
* practitioner = Reference(MedicaidPractitionerValidationExample)
* organization = Reference(MedicaidOrganizationValidationExample)
* code = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* specialty = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* location = Reference(MedicaidLocationValidationExample)
* telecom[0].system = #phone
* telecom[0].value = "555-111-2222"
* telecom[0].use = #work

// Example demonstrating all required elements for MedicaidOrganization
Instance: MedicaidOrganizationValidationExample
InstanceOf: MedicaidOrganization
Title: "Medicaid Organization Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Organization"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization"
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value = "9988776655"
* identifier[medicaidId].system = "urn:oid:2.16.840.1.113883.4.642.40.42.1"
* identifier[medicaidId].value = "ORG-54321"
* identifier[tin].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[tin].value = "12-3456789"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Metropolis Medical Group"
* telecom[0].system = #phone
* telecom[0].value = "555-333-4444"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "info@metropolismedical.com"
* telecom[1].use = #work
* address.line[0] = "100 Healthcare Avenue"
* address.city = "Metropolis"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"

// Example demonstrating all required elements for MedicaidLocation
Instance: MedicaidLocationValidationExample
InstanceOf: MedicaidLocation
Title: "Medicaid Location Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Location"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-location"
* status = #active
* name = "Metropolis Medical Group - Main Office"
* description = "Primary care services location"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#OUTPHARM "Outpatient Pharmacy"
* telecom[0].system = #phone
* telecom[0].value = "555-333-4444"
* telecom[0].use = #work
* address.line[0] = "100 Healthcare Avenue"
* address.city = "Metropolis"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu "Building"
* managingOrganization = Reference(MedicaidOrganizationValidationExample)

// Example demonstrating all required elements for MedicaidVerificationResult
Instance: MedicaidVerificationResultValidationExample
InstanceOf: MedicaidVerificationResult
Title: "Medicaid Verification Result Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Verification Result"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"
* target = Reference(MedicaidPractitionerValidationExample)
* status = #validated
* statusDate = "2023-06-15"
* validationType = http://terminology.hl7.org/CodeSystem/validation-type#primary "Primary Source"
* validationProcess = http://terminology.hl7.org/CodeSystem/validation-process#edit-check "Edit Check"
* primarySource.who.display = "Illinois State Medical Board"
* primarySource.validationStatus = http://hl7.org/fhir/CodeSystem/validation-status#successful "Successful"
* primarySource.validationDate = "2023-06-15"

// Example demonstrating all required elements for MedicaidHealthcareService
Instance: MedicaidHealthcareServiceValidationExample
InstanceOf: MedicaidHealthcareService
Title: "Medicaid Healthcare Service Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Healthcare Service"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-healthcare-service"
* active = true
* providedBy = Reference(MedicaidOrganizationValidationExample)
* category = http://terminology.hl7.org/CodeSystem/service-category#17 "Primary Care"
* type = http://terminology.hl7.org/CodeSystem/service-type#124 "General Practice"
* specialty = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* location = Reference(MedicaidLocationValidationExample)
* name = "Primary Care Services"
* telecom[0].system = #phone
* telecom[0].value = "555-333-4444"
* telecom[0].use = #work
* payloadType = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any "Any"

// Example demonstrating all required elements for MedicaidEndpoint
Instance: MedicaidEndpointValidationExample
InstanceOf: MedicaidEndpoint
Title: "Medicaid Endpoint Validation Example"
Description: "Example demonstrating all required elements and constraints for a Medicaid Endpoint"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-endpoint"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest "HL7 FHIR REST"
* payloadType = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any "Any"
* address = "https://fhir.metropolismedical.com/r4"

// Example demonstrating a provider with exclusion/sanction
Instance: MedicaidExcludedProviderExample
InstanceOf: MedicaidPractitioner
Title: "Medicaid Excluded Provider Example"
Description: "Example of a practitioner who has been excluded from Medicaid participation"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "5566778899"
* active = true
* name.family = "Williams"
* name.given[0] = "Thomas"
* name.prefix = "Dr."
* telecom[0].system = #phone
* telecom[0].value = "555-999-8888"
* telecom[0].use = #work
* address.line[0] = "200 Medical Plaza"
* address.city = "Metropolis"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* gender = #male
* birthDate = "1965-08-12"
* qualification[0].identifier.system = "http://example.org/state-medical-board"
* qualification[0].identifier.value = "IL-MD-99999"
* qualification[0].code = http://terminology.hl7.org/CodeSystem/v2-0360#MD "Doctor of Medicine"
* qualification[0].period.start = "1995-06-01"
* qualification[0].issuer.display = "Illinois State Medical Board"

// Example demonstrating a suspended practitioner role
Instance: MedicaidSuspendedPractitionerRoleExample
InstanceOf: MedicaidPractitionerRole
Title: "Medicaid Suspended Practitioner Role Example"
Description: "Example of a practitioner role that has been suspended in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"
* extension[enrollmentStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status#suspended "Suspended"
* extension[credentialingStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status#credentialed "Credentialed"
* identifier[0].system = "urn:oid:2.16.840.1.113883.4.642.40.42.3"
* identifier[0].value = "PR-99999"
* active = true
* period.start = "2020-01-15"
* period.end = "2023-05-01"
* practitioner = Reference(MedicaidExcludedProviderExample)
* organization = Reference(MedicaidOrganizationValidationExample)
* code = http://nucc.org/provider-taxonomy#207R00000X "Internal Medicine"
* specialty = http://nucc.org/provider-taxonomy#207R00000X "Internal Medicine"
* telecom[0].system = #phone
* telecom[0].value = "555-999-8888"
* telecom[0].use = #work

// Example demonstrating exclusion verification result
Instance: MedicaidExclusionVerificationExample
InstanceOf: MedicaidVerificationResult
Title: "Medicaid Exclusion Verification Example"
Description: "Example of verification result showing provider exclusion"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"
* target = Reference(MedicaidExcludedProviderExample)
* status = #validated
* statusDate = "2023-05-01"
* validationType = http://terminology.hl7.org/CodeSystem/validation-type#primary "Primary Source"
* validationProcess = http://terminology.hl7.org/CodeSystem/validation-process#edit-check "Edit Check"
* failureAction = http://terminology.hl7.org/CodeSystem/failure-action#suspend "Suspend"
* primarySource.who.display = "Office of Inspector General"
* primarySource.type = http://terminology.hl7.org/CodeSystem/primary-source-type#lic-board "License Board"
* primarySource.validationStatus = http://hl7.org/fhir/CodeSystem/validation-status#failed "Failed"
* primarySource.validationDate = "2023-05-01"
