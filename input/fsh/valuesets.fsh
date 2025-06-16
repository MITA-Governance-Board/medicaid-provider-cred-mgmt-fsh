// Medicaid Provider Credentialing Value Sets

ValueSet: MedicaidProviderTypes
Id: medicaid-provider-types
Title: "Medicaid Provider Types"
Description: "Types of providers that can participate in Medicaid programs"
* ^status = #active
* ^experimental = false
* ^copyright = "This value set includes content from NUCC Health Care Provider Taxonomy Code Set for providers which is copyright © 2021+ American Medical Association. For commercial use, including sales or licensing, a license must be obtained."
* include codes from system http://nucc.org/provider-taxonomy
* include codes from system http://terminology.hl7.org/CodeSystem/practitioner-role
* ^compose.include[+].system = "http://terminology.hl7.org/CodeSystem/practitioner-role"
* ^compose.include[=].concept[0].code = #doctor
* ^compose.include[=].concept[=].display = "Doctor"
* ^compose.include[=].concept[+].code = #nurse
* ^compose.include[=].concept[=].display = "Nurse"
* ^compose.include[=].concept[+].code = #pharmacist
* ^compose.include[=].concept[=].display = "Pharmacist"
* ^compose.include[=].concept[+].code = #researcher
* ^compose.include[=].concept[=].display = "Researcher"
* ^compose.include[=].concept[+].code = #teacher
* ^compose.include[=].concept[=].display = "Teacher/educator"
* ^compose.include[=].concept[+].code = #ict
* ^compose.include[=].concept[=].display = "ICT professional"

ValueSet: MedicaidEnrollmentStatuses
Id: medicaid-enrollment-statuses
Title: "Medicaid Enrollment Statuses"
Description: "Status values for Medicaid provider enrollment"
* ^status = #active
* ^experimental = false
* include codes from system http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status

ValueSet: MedicaidCredentialingStatuses
Id: medicaid-credentialing-statuses
Title: "Medicaid Credentialing Statuses"
Description: "Status values for Medicaid provider credentialing"
* ^status = #active
* ^experimental = false
* include codes from system http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status

ValueSet: MedicaidSpecialtyCodes
Id: medicaid-specialty-codes
Title: "Medicaid Specialty Codes"
Description: "Specialty codes for Medicaid providers"
* ^status = #active
* ^experimental = false
* ^copyright = "This value set includes content from NUCC Health Care Provider Taxonomy Code Set for providers which is copyright © 2021+ American Medical Association. For commercial use, including sales or licensing, a license must be obtained."
* include codes from system http://nucc.org/provider-taxonomy
* ^compose.include[+].system = "http://nucc.org/provider-taxonomy"
* ^compose.include[=].concept[0].code = #207Q00000X
* ^compose.include[=].concept[=].display = "Family Medicine"
* ^compose.include[=].concept[+].code = #208D00000X
* ^compose.include[=].concept[=].display = "General Practice"
* ^compose.include[=].concept[+].code = #207R00000X
* ^compose.include[=].concept[=].display = "Internal Medicine"
* ^compose.include[=].concept[+].code = #207T00000X
* ^compose.include[=].concept[=].display = "Neurological Surgery"
* ^compose.include[=].concept[+].code = #208000000X
* ^compose.include[=].concept[=].display = "Pediatrics"

ValueSet: MedicaidVerificationStatuses
Id: medicaid-verification-statuses
Title: "Medicaid Verification Statuses"
Description: "Status values for verification activities in Medicaid provider credentialing"
* ^status = #active
* ^experimental = false
* include codes from system http://hl7.org/fhir/CodeSystem/verificationresult-status
* include codes from system http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-verification-status

ValueSet: MedicaidQualificationTypes
Id: medicaid-qualification-types
Title: "Medicaid Qualification Types"
Description: "Types of qualifications for Medicaid providers"
* ^status = #active
* ^experimental = false
* include codes from system http://terminology.hl7.org/CodeSystem/v2-0360
* include codes from system http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-qualification-type
