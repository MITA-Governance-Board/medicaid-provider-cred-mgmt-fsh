// Medicaid Provider Credentialing and Enrollment Profiles

// Extensions
Extension: MedicaidProviderIdExtension
Id: medicaid-provider-id
Title: "Medicaid Provider ID"
Description: "State-specific Medicaid provider identifier"
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1

Extension: MedicaidEnrollmentStatusExtension
Id: medicaid-enrollment-status
Title: "Medicaid Enrollment Status"
Description: "Current enrollment status in the Medicaid program"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only CodeableConcept
* valueCodeableConcept from MedicaidEnrollmentStatuses (required)

Extension: MedicaidCredentialingStatusExtension
Id: medicaid-credentialing-status
Title: "Medicaid Credentialing Status"
Description: "Current credentialing status for Medicaid participation"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only CodeableConcept
* valueCodeableConcept from MedicaidCredentialingStatuses (required)

Extension: MedicaidSpecialtyBoardCertificationExtension
Id: medicaid-specialty-board-certification
Title: "Medicaid Specialty Board Certification"
Description: "Board certification information for specialty practice"
* ^context.type = #element
* ^context.expression = "Practitioner.qualification"
* extension contains
    boardName 1..1 and
    certificationDate 0..1 and
    expirationDate 0..1 and
    certificationNumber 0..1
* extension[boardName].value[x] only string
* extension[certificationDate].value[x] only date
* extension[expirationDate].value[x] only date
* extension[certificationNumber].value[x] only string

// Core Profiles
Profile: MedicaidPractitioner
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Id: medicaid-practitioner
Title: "Medicaid Practitioner"
Description: "A practitioner participating in or applying to participate in the Medicaid program"
* ^status = #active
* extension contains MedicaidProviderIdExtension named medicaidProviderId 0..1
* identifier 1..*
* name 1..*
* name.family 1..1
* name.given 1..*
* telecom 1..*
* address 1..*
* gender 1..1
* birthDate 1..1
* qualification 1..*
* qualification.code from http://terminology.hl7.org/ValueSet/v2-2.7-0360 (extensible)
* qualification.period 1..1
* qualification.issuer 1..1
* qualification.extension contains MedicaidSpecialtyBoardCertificationExtension named boardCertification 0..*

Profile: MedicaidPractitionerRole
Parent: PractitionerRole
Id: medicaid-practitioner-role
Title: "Medicaid Practitioner Role"
Description: "A practitioner's role within the Medicaid program"
* ^status = #active
* extension contains
    MedicaidEnrollmentStatusExtension named enrollmentStatus 1..1 and
    MedicaidCredentialingStatusExtension named credentialingStatus 1..1
* identifier 1..*
* active 1..1
* period 1..1
* period.start 1..1
* practitioner 1..1
* practitioner only Reference(MedicaidPractitioner)
* organization 0..1
* organization only Reference(MedicaidOrganization)
* code 1..*
* code from MedicaidProviderTypes (extensible)
* specialty 1..*
* specialty from MedicaidSpecialtyCodes (extensible)
* location 0..*
* location only Reference(MedicaidLocation)
* healthcareService 0..*
* healthcareService only Reference(MedicaidHealthcareService)
* telecom 1..*
* availableTime 0..*
* notAvailable 0..*
* availabilityExceptions 0..1
* endpoint 0..1
* endpoint only Reference(MedicaidEndpoint)

Profile: MedicaidOrganization
Parent: Organization
Id: medicaid-organization
Title: "Medicaid Organization"
Description: "An organization participating in the Medicaid program"
* ^status = #active
* identifier 1..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    npi 0..1 and
    medicaidId 1..1 and
    tin 0..1
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi" (exactly)
* identifier[medicaidId].system = "http://medicaid.state.gov/organization-id" (exactly)
* identifier[tin].system = "http://terminology.hl7.org/NamingSystem/USEIN" (exactly)
* active 1..1
* type 1..*
* name 1..1
* alias 0..*
* telecom 1..*
* address 1..*
* partOf 0..1
* partOf only Reference(MedicaidOrganization)
* contact 0..*
* endpoint 0..1
* endpoint only Reference(MedicaidEndpoint)

Profile: MedicaidLocation
Parent: Location
Id: medicaid-location
Title: "Medicaid Location"
Description: "A location where Medicaid services are provided"
* ^status = #active
* identifier 1..*
* status 1..1
* name 1..1
* alias 0..*
* description 0..1
* mode 0..1
* type 1..*
* type from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType (extensible)
* telecom 1..*
* address 1..1
* physicalType 0..1
* position 0..1
* managingOrganization 1..1
* managingOrganization only Reference(MedicaidOrganization)
* partOf 0..1
* partOf only Reference(MedicaidLocation)
* hoursOfOperation 0..*
* availabilityExceptions 0..1
* endpoint 0..1
* endpoint only Reference(MedicaidEndpoint)

Profile: MedicaidHealthcareService
Parent: HealthcareService
Id: medicaid-healthcare-service
Title: "Medicaid Healthcare Service"
Description: "A healthcare service covered by Medicaid"
* ^status = #active
* identifier 1..*
* active 1..1
* providedBy 1..1
* providedBy only Reference(MedicaidOrganization)
* category 1..*
* category from http://hl7.org/fhir/ValueSet/service-category (extensible)
* type 1..*
* type from http://hl7.org/fhir/ValueSet/service-type (extensible)
* specialty 0..*
* specialty from MedicaidSpecialtyCodes (extensible)
* location 0..*
* location only Reference(MedicaidLocation)
* name 1..1
* comment 0..1
* extraDetails 0..1
* photo 0..1
* telecom 1..*
* coverageArea 0..*
* serviceProvisionCode 0..*
* eligibility 0..*
* program 0..*
* characteristic 0..*
* communication 0..*
* referralMethod 0..*
* appointmentRequired 0..1
* availableTime 0..*
* notAvailable 0..*
* availabilityExceptions 0..1
* endpoint 0..1
* endpoint only Reference(MedicaidEndpoint)

Profile: MedicaidEndpoint
Parent: Endpoint
Id: medicaid-endpoint
Title: "Medicaid Endpoint"
Description: "Technical endpoint for Medicaid data exchange"
* ^status = #active
* identifier 1..*
* status 1..1
* connectionType 1..1
* connectionType from http://hl7.org/fhir/ValueSet/endpoint-connection-type (extensible)
* name 1..1
* managingOrganization 1..1
* managingOrganization only Reference(MedicaidOrganization)
* contact 0..*
* period 0..1
* payloadType 1..*
* payloadType from http://hl7.org/fhir/ValueSet/endpoint-payload-type (extensible)
* payloadMimeType 0..*
* address 1..1
* header 0..*

Profile: MedicaidVerificationResult
Parent: VerificationResult
Id: medicaid-verification-result
Title: "Medicaid Verification Result"
Description: "Result of verification activities for Medicaid provider credentialing"
* ^status = #active
* target 1..*
* target only Reference(MedicaidPractitioner or MedicaidOrganization)
* targetLocation 0..*
* need 0..1
* status 1..1
* statusDate 1..1
* validationType 0..1
* validationProcess 0..*
* frequency 0..1
* lastPerformed 0..1
* nextScheduled 0..1
* failureAction 0..1
* primarySource 0..*
* primarySource.who 0..1
* primarySource.type 0..*
* primarySource.communicationMethod 0..*
* primarySource.validationStatus 0..1
* primarySource.validationDate 0..1
* primarySource.canPushUpdates 0..1
* primarySource.pushTypeAvailable 0..*
* attestation 0..1
* attestation.who 0..1
* attestation.onBehalfOf 0..1
* attestation.communicationMethod 0..1
* attestation.date 0..1
* attestation.sourceIdentityCertificate 0..1
* attestation.proxyIdentityCertificate 0..1
* attestation.proxySignature 0..1
* attestation.sourceSignature 0..1
* validator 0..*
* validator.organization 1..1
* validator.identityCertificate 0..1
* validator.attestationSignature 0..1
