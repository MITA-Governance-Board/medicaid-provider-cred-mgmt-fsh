// Medicaid Provider Credentialing Examples

// Example Medicaid Practitioner
Instance: MedicaidPractitionerExample
InstanceOf: MedicaidPractitioner
Title: "Example Medicaid Practitioner"
Description: "Example of a practitioner enrolled in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner"
* extension[medicaidProviderId].valueString = "MD12345"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "1234567890"
* identifier[1].system = "urn:oid:2.16.840.1.113883.4.642.40.42.2"
* identifier[1].value = "MD12345"
* active = true
* name.family = "Smith"
* name.given[0] = "John"
* name.given[1] = "Michael"
* name.prefix = "Dr."
* telecom[0].system = #phone
* telecom[0].value = "555-123-4567"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "john.smith@example.com"
* telecom[1].use = #work
* address.line[0] = "123 Medical Center Drive"
* address.line[1] = "Suite 100"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* gender = #male
* birthDate = "1975-03-15"
* qualification[0].identifier.system = "http://example.org/state-medical-board"
* qualification[0].identifier.value = "IL-MD-12345"
* qualification[0].code = http://terminology.hl7.org/CodeSystem/v2-0360#MD "Doctor of Medicine"
* qualification[0].period.start = "2005-06-01"
* qualification[0].issuer.display = "Illinois State Medical Board"
* qualification[0].extension[boardCertification].extension[boardName].valueString = "American Board of Internal Medicine"
* qualification[0].extension[boardCertification].extension[certificationDate].valueDate = "2008-07-15"
* qualification[0].extension[boardCertification].extension[expirationDate].valueDate = "2028-07-15"
* qualification[0].extension[boardCertification].extension[certificationNumber].valueString = "ABIM-12345"

// Example Medicaid Practitioner Role
Instance: MedicaidPractitionerRoleExample
InstanceOf: MedicaidPractitionerRole
Title: "Example Medicaid Practitioner Role"
Description: "Example of a practitioner role in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"
* extension[enrollmentStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status#enrolled "Enrolled"
* extension[credentialingStatus].valueCodeableConcept = http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status#credentialed "Credentialed"
* identifier.system = "urn:oid:2.16.840.1.113883.4.642.40.42.3"
* identifier.value = "PR-12345"
* active = true
* period.start = "2023-01-01"
* practitioner = Reference(MedicaidPractitionerExample)
* organization = Reference(MedicaidOrganizationExample)
* code = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* specialty = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* location = Reference(MedicaidLocationExample)
* healthcareService = Reference(MedicaidHealthcareServiceExample)
* telecom[0].system = #phone
* telecom[0].value = "555-123-4567"
* telecom[0].use = #work
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #tue
* availableTime[0].daysOfWeek[2] = #wed
* availableTime[0].daysOfWeek[3] = #thu
* availableTime[0].daysOfWeek[4] = #fri
* availableTime[0].availableStartTime = "08:00:00"
* availableTime[0].availableEndTime = "17:00:00"
* endpoint = Reference(MedicaidEndpointExample)

// Example Medicaid Organization
Instance: MedicaidOrganizationExample
InstanceOf: MedicaidOrganization
Title: "Example Medicaid Organization"
Description: "Example of an organization participating in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization"
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value = "1234567891"
* identifier[medicaidId].system = "urn:oid:2.16.840.1.113883.4.642.40.42.1"
* identifier[medicaidId].value = "ORG-12345"
* identifier[tin].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[tin].value = "12-3456789"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Springfield Medical Center"
* alias = "SMC"
* telecom[0].system = #phone
* telecom[0].value = "555-123-4500"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "info@springfieldmedical.com"
* telecom[1].use = #work
* address.line[0] = "123 Medical Center Drive"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* contact.purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN "Administrative"
* contact.name.family = "Johnson"
* contact.name.given = "Mary"
* contact.telecom.system = #phone
* contact.telecom.value = "555-123-4501"
* endpoint = Reference(MedicaidEndpointExample)

// Example Medicaid Location
Instance: MedicaidLocationExample
InstanceOf: MedicaidLocation
Title: "Example Medicaid Location"
Description: "Example of a location where Medicaid services are provided"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-location"
* identifier.system = "urn:oid:2.16.840.1.113883.4.642.40.42.4"
* identifier.value = "LOC-12345"
* status = #active
* name = "Springfield Medical Center - Main Campus"
* alias = "SMC Main"
* description = "Primary care and specialty services location"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP "Hospital"
* telecom[0].system = #phone
* telecom[0].value = "555-123-4567"
* telecom[0].use = #work
* address.line[0] = "123 Medical Center Drive"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "US"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu "Building"
* position.longitude = -89.6501
* position.latitude = 39.7817
* managingOrganization = Reference(MedicaidOrganizationExample)
* hoursOfOperation[0].daysOfWeek[0] = #mon
* hoursOfOperation[0].daysOfWeek[1] = #tue
* hoursOfOperation[0].daysOfWeek[2] = #wed
* hoursOfOperation[0].daysOfWeek[3] = #thu
* hoursOfOperation[0].daysOfWeek[4] = #fri
* hoursOfOperation[0].openingTime = "08:00:00"
* hoursOfOperation[0].closingTime = "17:00:00"
* endpoint = Reference(MedicaidEndpointExample)

// Example Medicaid Healthcare Service
Instance: MedicaidHealthcareServiceExample
InstanceOf: MedicaidHealthcareService
Title: "Example Medicaid Healthcare Service"
Description: "Example of a healthcare service covered by Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-healthcare-service"
* identifier.system = "urn:oid:2.16.840.1.113883.4.642.40.42.5"
* identifier.value = "SVC-12345"
* active = true
* providedBy = Reference(MedicaidOrganizationExample)
* category = http://terminology.hl7.org/CodeSystem/service-category#1 "Adoption"
* type = http://terminology.hl7.org/CodeSystem/service-type#1 "Adoption/Permanent Care Info/Support"
* specialty = http://nucc.org/provider-taxonomy#207Q00000X "Family Medicine"
* location = Reference(MedicaidLocationExample)
* name = "Primary Care Services"
* comment = "Comprehensive primary care services for Medicaid beneficiaries"
* telecom[0].system = #phone
* telecom[0].value = "555-123-4567"
* telecom[0].use = #work
* serviceProvisionCode = http://terminology.hl7.org/CodeSystem/service-provision-conditions#free "Free"
* eligibility[0].code = http://terminology.hl7.org/CodeSystem/service-eligibility#medicaid "Medicaid"
* eligibility[0].comment = "Must be enrolled in Medicaid"
* program = http://terminology.hl7.org/CodeSystem/program#medicaid "Medicaid"
* characteristic = http://terminology.hl7.org/CodeSystem/service-characteristic#wheelchair "Wheelchair accessible"
* communication = urn:ietf:bcp:47#en "English"
* referralMethod = http://terminology.hl7.org/CodeSystem/service-referral-method#phone "Phone"
* appointmentRequired = true
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #tue
* availableTime[0].daysOfWeek[2] = #wed
* availableTime[0].daysOfWeek[3] = #thu
* availableTime[0].daysOfWeek[4] = #fri
* availableTime[0].availableStartTime = "08:00:00"
* availableTime[0].availableEndTime = "17:00:00"
* endpoint = Reference(MedicaidEndpointExample)

// Example Medicaid Endpoint
Instance: MedicaidEndpointExample
InstanceOf: MedicaidEndpoint
Title: "Example Medicaid Endpoint"
Description: "Example of a technical endpoint for Medicaid data exchange"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-endpoint"
* identifier.system = "urn:oid:2.16.840.1.113883.4.642.40.42.6"
* identifier.value = "EP-12345"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest "HL7 FHIR"
* name = "Springfield Medical Center FHIR Endpoint"
* managingOrganization = Reference(MedicaidOrganizationExample)
* contact.system = #email
* contact.value = "fhir-admin@springfieldmedical.com"
* period.start = "2023-01-01"
* payloadType = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#hl7-fhir-r4 "HL7 FHIR R4"
* payloadMimeType = #json
* address = "https://fhir.springfieldmedical.com/r4"
* header = "Authorization: Bearer {token}"

// Example Medicaid Verification Result
Instance: MedicaidVerificationResultExample
InstanceOf: MedicaidVerificationResult
Title: "Example Medicaid Verification Result"
Description: "Example of verification result for Medicaid provider credentialing"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"
* target = Reference(MedicaidPractitionerExample)
* need = http://terminology.hl7.org/CodeSystem/verificationresult-need#periodic "Periodic"
* status = #validated
* statusDate = "2023-06-15"
* validationType = http://terminology.hl7.org/CodeSystem/verificationresult-validation-type#primary "Primary Source"
* validationProcess[0] = http://terminology.hl7.org/CodeSystem/verificationresult-validation-process#edit-check "Edit check"
* validationProcess[1] = http://terminology.hl7.org/CodeSystem/verificationresult-validation-process#primary-source "Primary source"
* lastPerformed = "2023-06-15"
* nextScheduled = "2024-06-15"
* failureAction = http://terminology.hl7.org/CodeSystem/verificationresult-failure-action#suspend "Suspend"
* primarySource[0].who = Reference(MedicaidOrganizationExample)
* primarySource[0].type = http://terminology.hl7.org/CodeSystem/verificationresult-primary-source-type#lic-board "License Board"
* primarySource[0].communicationMethod[0] = http://terminology.hl7.org/CodeSystem/verificationresult-communication-method#manual "Manual"
* primarySource[0].validationStatus = #successful
* primarySource[0].validationDate = "2023-06-15"
* primarySource[0].canPushUpdates = http://terminology.hl7.org/CodeSystem/verificationresult-can-push-updates#yes "Yes"
* primarySource[0].pushTypeAvailable[0] = http://terminology.hl7.org/CodeSystem/verificationresult-push-type-available#specific "Specific requested changes"
* attestation.who = Reference(MedicaidPractitionerExample)
* attestation.communicationMethod = http://terminology.hl7.org/CodeSystem/verificationresult-communication-method#portal "Portal"
* attestation.date = "2023-06-01"
* validator[0].organization = Reference(MedicaidOrganizationExample)

// Example Nurse Practitioner
Instance: MedicaidNursePractitionerExample
InstanceOf: MedicaidPractitioner
Title: "Example Medicaid Nurse Practitioner"
Description: "Example of a nurse practitioner enrolled in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner"
* extension[medicaidProviderId].valueString = "NP67890"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "9876543210"
* identifier[1].system = "urn:oid:2.16.840.1.113883.4.642.40.42.2"
* identifier[1].value = "NP67890"
* active = true
* name.family = "Davis"
* name.given[0] = "Sarah"
* name.given[1] = "Elizabeth"
* name.prefix = "Ms."
* name.suffix = "NP"
* telecom[0].system = #phone
* telecom[0].value = "555-987-6543"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "sarah.davis@example.com"
* telecom[1].use = #work
* address.line[0] = "456 Healthcare Plaza"
* address.line[1] = "Suite 200"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62702"
* address.country = "US"
* gender = #female
* birthDate = "1980-09-22"
* qualification[0].identifier.system = "http://example.org/state-nursing-board"
* qualification[0].identifier.value = "IL-RN-67890"
* qualification[0].code = http://terminology.hl7.org/CodeSystem/v2-0360#RN "Registered Nurse"
* qualification[0].period.start = "2010-05-15"
* qualification[0].issuer.display = "Illinois Department of Financial and Professional Regulation"
* qualification[1].identifier.system = "http://example.org/np-certification"
* qualification[1].identifier.value = "ANCC-FNP-67890"
* qualification[1].code = http://terminology.hl7.org/CodeSystem/v2-0360#NP "Nurse Practitioner"
* qualification[1].period.start = "2015-08-01"
* qualification[1].issuer.display = "American Nurses Credentialing Center"

// Example Specialty Clinic Organization
Instance: MedicaidSpecialtyClinicExample
InstanceOf: MedicaidOrganization
Title: "Example Medicaid Specialty Clinic"
Description: "Example of a specialty clinic participating in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization"
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value = "1234567892"
* identifier[medicaidId].system = "urn:oid:2.16.840.1.113883.4.642.40.42.1"
* identifier[medicaidId].value = "SPEC-54321"
* identifier[tin].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[tin].value = "98-7654321"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Springfield Cardiology Associates"
* alias = "SCA"
* telecom[0].system = #phone
* telecom[0].value = "555-234-5678"
* telecom[0].use = #work
* telecom[1].system = #fax
* telecom[1].value = "555-234-5679"
* telecom[1].use = #work
* telecom[2].system = #email
* telecom[2].value = "info@springfieldcardio.com"
* telecom[2].use = #work
* address.line[0] = "789 Specialty Drive"
* address.line[1] = "Building B"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62703"
* address.country = "US"
* partOf = Reference(MedicaidOrganizationExample)
* contact.purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#BILL "Billing"
* contact.name.family = "Thompson"
* contact.name.given = "Robert"
* contact.telecom.system = #phone
* contact.telecom.value = "555-234-5680"
* endpoint = Reference(MedicaidEndpointExample)

// Example Verification Result for License Check
Instance: MedicaidLicenseVerificationExample
InstanceOf: MedicaidVerificationResult
Title: "Example Medicaid License Verification"
Description: "Example of license verification for Medicaid provider"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"
* target = Reference(MedicaidPractitionerExample)
* need = http://terminology.hl7.org/CodeSystem/verificationresult-need#initial "Initial"
* status = #validated
* statusDate = "2023-01-15"
* validationType = http://terminology.hl7.org/CodeSystem/verificationresult-validation-type#primary "Primary Source"
* validationProcess[0] = http://terminology.hl7.org/CodeSystem/verificationresult-validation-process#primary-source "Primary source"
* lastPerformed = "2023-01-15"
* nextScheduled = "2024-01-15"
* failureAction = http://terminology.hl7.org/CodeSystem/verificationresult-failure-action#suspend "Suspend"
* primarySource[0].who.display = "Illinois Department of Financial and Professional Regulation"
* primarySource[0].type = http://terminology.hl7.org/CodeSystem/verificationresult-primary-source-type#lic-board "License Board"
* primarySource[0].communicationMethod[0] = http://terminology.hl7.org/CodeSystem/verificationresult-communication-method#api "API"
* primarySource[0].validationStatus = #successful
* primarySource[0].validationDate = "2023-01-15"
* primarySource[0].canPushUpdates = http://terminology.hl7.org/CodeSystem/verificationresult-can-push-updates#yes "Yes"
* primarySource[0].pushTypeAvailable[0] = http://terminology.hl7.org/CodeSystem/verificationresult-push-type-available#any "Any changes"
* validator[0].organization.display = "Illinois Medicaid Provider Enrollment Unit"

// Example Rural Health Clinic
Instance: MedicaidRuralHealthClinicExample
InstanceOf: MedicaidOrganization
Title: "Example Medicaid Rural Health Clinic"
Description: "Example of a rural health clinic participating in Medicaid"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization"
* identifier[medicaidId].system = "urn:oid:2.16.840.1.113883.4.642.40.42.1"
* identifier[medicaidId].value = "RHC-11111"
* identifier[tin].system = "urn:oid:2.16.840.1.113883.4.4"
* identifier[tin].value = "11-1111111"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Prairie View Rural Health Clinic"
* alias = "PVRHC"
* telecom[0].system = #phone
* telecom[0].value = "555-345-6789"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "info@prairieviewrhc.com"
* telecom[1].use = #work
* address.line[0] = "100 Main Street"
* address.city = "Prairie View"
* address.state = "IL"
* address.postalCode = "62999"
* address.country = "US"
* contact.purpose = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN "Administrative"
* contact.name.family = "Wilson"
* contact.name.given = "Jennifer"
* contact.telecom.system = #phone
* contact.telecom.value = "555-345-6790"
