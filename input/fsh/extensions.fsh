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
