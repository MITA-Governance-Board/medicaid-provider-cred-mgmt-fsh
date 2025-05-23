// Medicaid Provider Credentialing Value Sets

ValueSet: MedicaidProviderTypes
Id: medicaid-provider-types
Title: "Medicaid Provider Types"
Description: "Types of providers that can participate in Medicaid programs"
* ^status = #active
* ^experimental = false
* ^copyright = "This value set includes content from NUCC Health Care Provider Taxonomy Code Set for providers which is copyright © 2021+ American Medical Association. For commercial use, including sales or licensing, a license must be obtained."
* include codes from system http://nucc.org/provider-taxonomy
* include codes from valueset http://hl7.org/fhir/us/davinci-pdex-plan-net/ValueSet/ProviderRoleVS
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
* ^compose.include.system = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status"
* ^compose.include.concept[0].code = #enrolled
* ^compose.include.concept[=].display = "Enrolled"
* ^compose.include.concept[+].code = #pending
* ^compose.include.concept[=].display = "Pending"
* ^compose.include.concept[+].code = #suspended
* ^compose.include.concept[=].display = "Suspended"
* ^compose.include.concept[+].code = #terminated
* ^compose.include.concept[=].display = "Terminated"
* ^compose.include.concept[+].code = #denied
* ^compose.include.concept[=].display = "Denied"
* ^compose.include.concept[+].code = #revalidation-required
* ^compose.include.concept[=].display = "Revalidation Required"

ValueSet: MedicaidCredentialingStatuses
Id: medicaid-credentialing-statuses
Title: "Medicaid Credentialing Statuses"
Description: "Status values for Medicaid provider credentialing"
* ^status = #active
* ^experimental = false
* ^compose.include.system = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status"
* ^compose.include.concept[0].code = #credentialed
* ^compose.include.concept[=].display = "Credentialed"
* ^compose.include.concept[+].code = #in-process
* ^compose.include.concept[=].display = "In Process"
* ^compose.include.concept[+].code = #incomplete
* ^compose.include.concept[=].display = "Incomplete"
* ^compose.include.concept[+].code = #denied
* ^compose.include.concept[=].display = "Denied"
* ^compose.include.concept[+].code = #expired
* ^compose.include.concept[=].display = "Expired"
* ^compose.include.concept[+].code = #provisional
* ^compose.include.concept[=].display = "Provisional"
* ^compose.include.concept[+].code = #recredentialing
* ^compose.include.concept[=].display = "Recredentialing"

ValueSet: MedicaidSpecialtyCodes
Id: medicaid-specialty-codes
Title: "Medicaid Specialty Codes"
Description: "Specialty codes for Medicaid providers"
* ^status = #active
* ^experimental = false
* ^copyright = "This value set includes content from NUCC Health Care Provider Taxonomy Code Set for providers which is copyright © 2021+ American Medical Association. For commercial use, including sales or licensing, a license must be obtained."
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #207Q00000X
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #208D00000X
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #207R00000X
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #207T00000X
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #208000000X

ValueSet: MedicaidVerificationStatuses
Id: medicaid-verification-statuses
Title: "Medicaid Verification Statuses"
Description: "Status values for verification activities in Medicaid provider credentialing"
* ^status = #active
* ^experimental = false
* include codes from system http://hl7.org/fhir/CodeSystem/verificationresult-status
* ^compose.include[+].system = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-verification-status"
* ^compose.include[=].concept[0].code = #verified
* ^compose.include[=].concept[=].display = "Verified"
* ^compose.include[=].concept[+].code = #failed
* ^compose.include[=].concept[=].display = "Failed"
* ^compose.include[=].concept[+].code = #pending
* ^compose.include[=].concept[=].display = "Pending"
* ^compose.include[=].concept[+].code = #expired
* ^compose.include[=].concept[=].display = "Expired"
* ^compose.include[=].concept[+].code = #not-required
* ^compose.include[=].concept[=].display = "Not Required"

ValueSet: MedicaidQualificationTypes
Id: medicaid-qualification-types
Title: "Medicaid Qualification Types"
Description: "Types of qualifications for Medicaid providers"
* ^status = #active
* ^experimental = false
* include codes from valueset http://terminology.hl7.org/ValueSet/v2-2.7-0360
* ^compose.include[+].system = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-qualification-type"
* ^compose.include[=].concept[0].code = #medical-license
* ^compose.include[=].concept[=].display = "Medical License"
* ^compose.include[=].concept[+].code = #nursing-license
* ^compose.include[=].concept[=].display = "Nursing License"
* ^compose.include[=].concept[+].code = #board-certification
* ^compose.include[=].concept[=].display = "Board Certification"
* ^compose.include[=].concept[+].code = #dea-registration
* ^compose.include[=].concept[=].display = "DEA Registration"
* ^compose.include[=].concept[+].code = #cds-registration
* ^compose.include[=].concept[=].display = "CDS Registration"
* ^compose.include[=].concept[+].code = #malpractice-insurance
* ^compose.include[=].concept[=].display = "Malpractice Insurance"
* ^compose.include[=].concept[+].code = #education-degree
* ^compose.include[=].concept[=].display = "Education Degree"
* ^compose.include[=].concept[+].code = #residency-training
* ^compose.include[=].concept[=].display = "Residency Training"
* ^compose.include[=].concept[+].code = #fellowship-training
* ^compose.include[=].concept[=].display = "Fellowship Training"
* ^compose.include[=].concept[+].code = #continuing-education
* ^compose.include[=].concept[=].display = "Continuing Education"
