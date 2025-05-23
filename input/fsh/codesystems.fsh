// Medicaid Provider Credentialing Code Systems

CodeSystem: MedicaidEnrollmentStatus
Id: medicaid-enrollment-status
Title: "Medicaid Enrollment Status"
Description: "Status codes for Medicaid provider enrollment"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 6
* #enrolled "Enrolled" "Provider is actively enrolled in the Medicaid program"
* #pending "Pending" "Provider enrollment application is pending review"
* #suspended "Suspended" "Provider enrollment is temporarily suspended"
* #terminated "Terminated" "Provider enrollment has been terminated"
* #denied "Denied" "Provider enrollment application was denied"
* #revalidation-required "Revalidation Required" "Provider must complete revalidation process"

CodeSystem: MedicaidCredentialingStatus
Id: medicaid-credentialing-status
Title: "Medicaid Credentialing Status"
Description: "Status codes for Medicaid provider credentialing"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 7
* #credentialed "Credentialed" "Provider has completed credentialing process"
* #in-process "In Process" "Credentialing process is in progress"
* #incomplete "Incomplete" "Credentialing application is incomplete"
* #denied "Denied" "Credentialing application was denied"
* #expired "Expired" "Credentialing has expired and requires renewal"
* #provisional "Provisional" "Provider has provisional credentialing status"
* #recredentialing "Recredentialing" "Provider is undergoing recredentialing process"

CodeSystem: MedicaidVerificationStatus
Id: medicaid-verification-status
Title: "Medicaid Verification Status"
Description: "Status codes for verification activities in Medicaid provider credentialing"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-verification-status"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 5
* #verified "Verified" "Information has been successfully verified"
* #failed "Failed" "Verification failed"
* #pending "Pending" "Verification is pending"
* #expired "Expired" "Verification has expired"
* #not-required "Not Required" "Verification is not required for this provider type"

CodeSystem: MedicaidQualificationType
Id: medicaid-qualification-type
Title: "Medicaid Qualification Type"
Description: "Types of qualifications for Medicaid providers"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-qualification-type"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 10
* #medical-license "Medical License" "State medical license"
* #nursing-license "Nursing License" "State nursing license"
* #board-certification "Board Certification" "Medical specialty board certification"
* #dea-registration "DEA Registration" "Drug Enforcement Administration registration"
* #cds-registration "CDS Registration" "Controlled Dangerous Substance registration"
* #malpractice-insurance "Malpractice Insurance" "Professional liability insurance"
* #education-degree "Education Degree" "Educational degree or diploma"
* #residency-training "Residency Training" "Medical residency training completion"
* #fellowship-training "Fellowship Training" "Medical fellowship training completion"
* #continuing-education "Continuing Education" "Continuing medical education credits"

CodeSystem: MedicaidProviderSpecialtyBoard
Id: medicaid-provider-specialty-board
Title: "Medicaid Provider Specialty Board"
Description: "Medical specialty boards recognized for Medicaid provider credentialing"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-provider-specialty-board"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 24
* #abms "American Board of Medical Specialties" "ABMS member boards"
* #abfm "American Board of Family Medicine" "Board certification in family medicine"
* #abim "American Board of Internal Medicine" "Board certification in internal medicine"
* #abp "American Board of Pediatrics" "Board certification in pediatrics"
* #abog "American Board of Obstetrics and Gynecology" "Board certification in obstetrics and gynecology"
* #abs "American Board of Surgery" "Board certification in surgery"
* #abpn "American Board of Psychiatry and Neurology" "Board certification in psychiatry and neurology"
* #abr "American Board of Radiology" "Board certification in radiology"
* #abo "American Board of Ophthalmology" "Board certification in ophthalmology"
* #aboto "American Board of Otolaryngology" "Board certification in otolaryngology"
* #abpm "American Board of Preventive Medicine" "Board certification in preventive medicine"
* #abpath "American Board of Pathology" "Board certification in pathology"
* #abanes "American Board of Anesthesiology" "Board certification in anesthesiology"
* #abem "American Board of Emergency Medicine" "Board certification in emergency medicine"
* #abpmr "American Board of Physical Medicine and Rehabilitation" "Board certification in physical medicine and rehabilitation"
* #abns "American Board of Neurological Surgery" "Board certification in neurological surgery"
* #abts "American Board of Thoracic Surgery" "Board certification in thoracic surgery"
* #abu "American Board of Urology" "Board certification in urology"
* #abps "American Board of Plastic Surgery" "Board certification in plastic surgery"
* #abos "American Board of Orthopaedic Surgery" "Board certification in orthopaedic surgery"
* #abms-moc "ABMS Maintenance of Certification" "Ongoing certification maintenance"
* #aoa "American Osteopathic Association" "AOA board certification"
* #aobfp "American Osteopathic Board of Family Physicians" "AOA family medicine certification"
* #other "Other Board" "Other recognized specialty board"

CodeSystem: MedicaidApplicationStatus
Id: medicaid-application-status
Title: "Medicaid Application Status"
Description: "Status codes for Medicaid provider applications"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-application-status"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 8
* #submitted "Submitted" "Application has been submitted"
* #under-review "Under Review" "Application is being reviewed"
* #additional-info-required "Additional Information Required" "Additional information is required to process the application"
* #approved "Approved" "Application has been approved"
* #denied "Denied" "Application has been denied"
* #withdrawn "Withdrawn" "Application has been withdrawn by the applicant"
* #expired "Expired" "Application has expired"
* #on-hold "On Hold" "Application processing is on hold"

CodeSystem: MedicaidRevalidationReason
Id: medicaid-revalidation-reason
Title: "Medicaid Revalidation Reason"
Description: "Reasons for Medicaid provider revalidation"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-revalidation-reason"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 6
* #periodic "Periodic Revalidation" "Routine periodic revalidation"
* #change-ownership "Change in Ownership" "Revalidation due to change in ownership"
* #change-location "Change in Location" "Revalidation due to change in practice location"
* #compliance-issue "Compliance Issue" "Revalidation due to compliance concerns"
* #quality-concern "Quality Concern" "Revalidation due to quality of care concerns"
* #fraud-investigation "Fraud Investigation" "Revalidation due to fraud investigation"

CodeSystem: MedicaidScreeningLevel
Id: medicaid-screening-level
Title: "Medicaid Screening Level"
Description: "Screening levels for Medicaid provider enrollment"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-screening-level"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 3
* #limited "Limited Screening" "Basic screening requirements"
* #moderate "Moderate Screening" "Enhanced screening with additional requirements"
* #high "High Screening" "Comprehensive screening with extensive requirements"

CodeSystem: MedicaidProviderRiskCategory
Id: medicaid-provider-risk-category
Title: "Medicaid Provider Risk Category"
Description: "Risk categories for Medicaid providers"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-provider-risk-category"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^count = 4
* #low "Low Risk" "Low risk provider category"
* #moderate "Moderate Risk" "Moderate risk provider category"
* #high "High Risk" "High risk provider category"
* #provisional "Provisional" "Provisional risk category pending full assessment"
