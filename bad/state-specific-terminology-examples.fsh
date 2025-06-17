// State-Specific Terminology Examples
// This file provides examples of state-specific code systems and value sets
// that states can use as templates when implementing their own terminology.

// ===== CALIFORNIA EXAMPLES =====

// California Provider Type Code System
CodeSystem: CaliforniaProviderTypes
Id: california-provider-types
Title: "California Provider Types"
Description: "California-specific provider type codes used in Medi-Cal"
* ^url = "http://medicaid.ca.gov/fhir/CodeSystem/california-provider-types"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #chcf "Community Health Center (Federally Qualified)" "Federally Qualified Health Center in California"
* #chcs "Community Health Center (State)" "State-funded Community Health Center"
* #mcmc-plan "Medi-Cal Managed Care Plan" "Organization contracted to provide Medi-Cal managed care services"
* #ihp "Indian Health Program" "Indian Health Service, Tribal, or Urban Indian Organization Program"
* #snf-ab1629 "SNF AB1629" "Skilled Nursing Facility under AB1629 reimbursement methodology"
* #fqhc-lookalike "FQHC Look-Alike" "Federally Qualified Health Center Look-Alike"
* #rural-clinic "Rural Health Clinic" "California Rural Health Clinic"
* #specialist-medi-cal "Medi-Cal Specialist" "Specialist provider enrolled in Medi-Cal fee-for-service"

// California Provider Types Value Set
ValueSet: CaliforniaMedicaidProviderTypes
Id: california-medicaid-provider-types
Title: "California Medicaid Provider Types"
Description: "Provider types recognized by California Medicaid (Medi-Cal)"
* ^url = "http://medicaid.ca.gov/fhir/ValueSet/california-medicaid-provider-types"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept descends from #1 "Provider Type"
* include codes from system http://medicaid.ca.gov/fhir/CodeSystem/california-provider-types

// California Enrollment Status Code System
CodeSystem: CaliforniaEnrollmentStatus
Id: california-enrollment-status
Title: "California Enrollment Status"
Description: "California-specific enrollment status codes used in Medi-Cal"
* ^url = "http://medicaid.ca.gov/fhir/CodeSystem/california-enrollment-status"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #pending-review "Pending Review" "Application is pending review by Medi-Cal enrollment staff"
* #pending-site-visit "Pending Site Visit" "Application is pending site visit verification"
* #pending-background "Pending Background Check" "Application is pending background check completion"
* #pending-provider-response "Pending Provider Response" "Application is pending additional information from provider"
* #approved-provisional "Provisionally Approved" "Provider is provisionally approved pending final verification"
* #approved-full "Fully Approved" "Provider is fully approved for Medi-Cal participation"
* #denied-incomplete "Denied - Incomplete" "Application denied due to incomplete information"
* #denied-ineligible "Denied - Ineligible" "Application denied due to provider ineligibility"
* #suspended-investigation "Suspended - Under Investigation" "Provider suspended pending investigation"
* #suspended-payment "Suspended - Payment Hold" "Provider payments suspended but can still provide services"
* #terminated-voluntary "Terminated - Voluntary" "Provider voluntarily terminated from Medi-Cal"
* #terminated-involuntary "Terminated - Involuntary" "Provider involuntarily terminated from Medi-Cal"

// ===== NEW YORK EXAMPLES =====

// New York Credentialing Status Code System
CodeSystem: NewYorkCredentialingStatus
Id: new-york-credentialing-status
Title: "New York Credentialing Status"
Description: "New York-specific credentialing status codes"
* ^url = "http://medicaid.ny.gov/fhir/CodeSystem/new-york-credentialing-status"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #pending-opmc "Pending OPMC Verification" "Pending Office of Professional Medical Conduct verification"
* #pending-npdb "Pending NPDB Check" "Pending National Practitioner Data Bank check"
* #pending-site-visit "Pending Site Visit" "Pending site visit verification"
* #pending-committee "Pending Committee Review" "Pending credentialing committee review"
* #approved-provisional "Provisionally Approved" "Provisionally approved pending final verification"
* #approved-expedited "Expedited Approval" "Approved through expedited credentialing process"
* #approved-reciprocal "Reciprocal Approval" "Approved based on reciprocity with another credentialing entity"
* #approved-full "Fully Approved" "Fully approved through standard credentialing process"
* #denied-education "Denied - Education" "Denied due to education requirements not met"
* #denied-experience "Denied - Experience" "Denied due to experience requirements not met"
* #denied-license "Denied - License" "Denied due to license issues"
* #denied-background "Denied - Background" "Denied due to background check issues"
* #suspended-temporary "Suspended - Temporary" "Temporarily suspended pending investigation"
* #suspended-permanent "Suspended - Permanent" "Permanently suspended from network"

// New York Provider Category Code System
CodeSystem: NewYorkProviderCategory
Id: new-york-provider-category
Title: "New York Provider Category"
Description: "New York-specific provider category codes"
* ^url = "http://medicaid.ny.gov/fhir/CodeSystem/new-york-provider-category"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #mmcp "Managed Medicaid Care Provider" "Provider participating in NY Managed Medicaid Care"
* #harp "HARP Provider" "Provider participating in Health and Recovery Plan"
* #mltc "MLTC Provider" "Provider participating in Managed Long Term Care"
* #fida "FIDA Provider" "Provider participating in Fully Integrated Duals Advantage program"
* #hcbs "HCBS Provider" "Provider of Home and Community Based Services"
* #bhcc "BHCC Provider" "Provider participating in Behavioral Health Care Collaborative"
* #dsrip "DSRIP Provider" "Provider participating in Delivery System Reform Incentive Payment program"
* #ffs "Fee-For-Service Provider" "Provider participating in traditional Fee-For-Service Medicaid"

// New York Provider Category Value Set
ValueSet: NewYorkProviderCategories
Id: new-york-provider-categories
Title: "New York Provider Categories"
Description: "Provider categories recognized by New York Medicaid"
* ^url = "http://medicaid.ny.gov/fhir/ValueSet/new-york-provider-categories"
* ^status = #active
* include codes from system http://medicaid.ny.gov/fhir/CodeSystem/new-york-provider-category

// ===== TEXAS EXAMPLES =====

// Texas Provider Type Code System
CodeSystem: TexasProviderTypes
Id: texas-provider-types
Title: "Texas Provider Types"
Description: "Texas-specific provider type codes used in Texas Medicaid"
* ^url = "http://medicaid.tx.gov/fhir/CodeSystem/texas-provider-types"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #acute-care "Acute Care Hospital" "Acute Care Hospital enrolled in Texas Medicaid"
* #ambulatory-surgical "Ambulatory Surgical Center" "Ambulatory Surgical Center enrolled in Texas Medicaid"
* #birthing-center "Birthing Center" "Birthing Center enrolled in Texas Medicaid"
* #case-management "Case Management Provider" "Provider of Case Management services"
* #chemical-dependency "Chemical Dependency Treatment Facility" "Chemical Dependency Treatment Facility"
* #cmhc "Community Mental Health Center" "Community Mental Health Center"
* #crna "Certified Registered Nurse Anesthetist" "Certified Registered Nurse Anesthetist"
* #dental-group "Dental Group" "Dental Group Practice"
* #dentist "Dentist" "Individual Dentist"
* #dme "DME Provider" "Durable Medical Equipment Provider"
* #ems "Emergency Medical Service" "Emergency Medical Service Provider"
* #fqhc "Federally Qualified Health Center" "Federally Qualified Health Center"
* #home-health "Home Health Agency" "Home Health Agency"
* #hospice "Hospice" "Hospice Provider"
* #hospital-based-clinic "Hospital Based Clinic" "Hospital Based Clinic"
* #icf-iid "ICF/IID" "Intermediate Care Facility for Individuals with Intellectual Disabilities"
* #laboratory "Laboratory" "Clinical Laboratory"
* #mco "Managed Care Organization" "Managed Care Organization"
* #mental-health "Mental Health Provider" "Mental Health Provider"
* #nurse-practitioner "Nurse Practitioner" "Nurse Practitioner"
* #nursing-facility "Nursing Facility" "Nursing Facility"
* #optometrist "Optometrist" "Optometrist"
* #pharmacy "Pharmacy" "Pharmacy"
* #physician "Physician" "Individual Physician"
* #physician-assistant "Physician Assistant" "Physician Assistant"
* #physician-group "Physician Group" "Physician Group Practice"
* #radiology "Radiology Provider" "Radiology Provider"
* #rural-health-clinic "Rural Health Clinic" "Rural Health Clinic"
* #therapy-group "Therapy Group" "Therapy Group Practice"
* #therapy-individual "Therapy Individual" "Individual Therapy Provider"

// Texas Medicaid Provider Types Value Set
ValueSet: TexasMedicaidProviderTypes
Id: texas-medicaid-provider-types
Title: "Texas Medicaid Provider Types"
Description: "Provider types recognized by Texas Medicaid"
* ^url = "http://medicaid.tx.gov/fhir/ValueSet/texas-medicaid-provider-types"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept descends from #1 "Provider Type"
* include codes from system http://medicaid.tx.gov/fhir/CodeSystem/texas-provider-types

// ===== FLORIDA EXAMPLES =====

// Florida Specialty Code System
CodeSystem: FloridaSpecialtyCodes
Id: florida-specialty-codes
Title: "Florida Specialty Codes"
Description: "Florida-specific specialty codes used in Florida Medicaid"
* ^url = "http://medicaid.fl.gov/fhir/CodeSystem/florida-specialty-codes"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #behavior-analysis "Behavior Analysis" "Provider of Behavior Analysis services"
* #community-behavioral "Community Behavioral Health" "Community Behavioral Health Provider"
* #early-intervention "Early Intervention" "Early Intervention Provider"
* #hearing "Hearing Services" "Hearing Services Provider"
* #medical-foster-care "Medical Foster Care" "Medical Foster Care Provider"
* #prescribed-pediatric "Prescribed Pediatric Extended Care" "Prescribed Pediatric Extended Care Provider"
* #regional-perinatal "Regional Perinatal Intensive Care Center" "Regional Perinatal Intensive Care Center"
* #visual "Visual Services" "Visual Services Provider"
* #statewide-inpatient "Statewide Inpatient Psychiatric Program" "Statewide Inpatient Psychiatric Program Provider"
* #targeted-case-management "Targeted Case Management" "Targeted Case Management Provider"

// Florida Medicaid Specialty Value Set
ValueSet: FloridaMedicaidSpecialties
Id: florida-medicaid-specialties
Title: "Florida Medicaid Specialties"
Description: "Specialty codes recognized by Florida Medicaid"
* ^url = "http://medicaid.fl.gov/fhir/ValueSet/florida-medicaid-specialties"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept descends from #2 "Specialty"
* include codes from system http://medicaid.fl.gov/fhir/CodeSystem/florida-specialty-codes

// ===== MICHIGAN EXAMPLES =====

// Michigan Provider Type Code System
CodeSystem: MichiganProviderTypes
Id: michigan-provider-types-cs
Title: "Michigan Provider Types Code System"
Description: "Michigan-specific provider type codes used in Michigan Medicaid"
* ^url = "http://medicaid.mi.gov/fhir/CodeSystem/michigan-provider-types"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #mi-health-link "MI Health Link Provider" "Provider participating in MI Health Link program"
* #chw "Community Health Worker" "Community Health Worker"
* #hmp "Healthy Michigan Plan Provider" "Provider participating in Healthy Michigan Plan"
* #mdhhs-clinic "MDHHS Clinic" "Michigan Department of Health and Human Services Clinic"
* #tribal-health-center "Tribal Health Center" "Tribal Health Center"
* #pace "PACE Provider" "Program of All-inclusive Care for the Elderly Provider"
* #mi-choice "MI Choice Provider" "MI Choice Waiver Provider"
* #habilitation "Habilitation Supports Waiver Provider" "Habilitation Supports Waiver Provider"
* #childrens-waiver "Children's Waiver Provider" "Children's Waiver Program Provider"

// Michigan Provider Types Value Set
ValueSet: MichiganProviderTypes
Id: michigan-provider-types
Title: "Michigan Provider Types"
Description: "Provider types recognized by Michigan Medicaid"
* ^url = "http://medicaid.mi.gov/fhir/ValueSet/michigan-provider-types"
* ^status = #active
* include codes from valueset http://hl7.org/fhir/us/medicaid-provider-credentialing/ValueSet/medicaid-provider-types
* include codes from system http://medicaid.mi.gov/fhir/CodeSystem/michigan-provider-types

// ===== CONCEPT MAPS =====

// Illinois Provider Type Mapping
ConceptMap: IllinoisProviderTypeMap
Id: illinois-provider-type-map
Title: "Illinois Provider Type Mapping"
Description: "Mapping between Illinois provider types and standard NUCC taxonomy codes"
* ^url = "http://medicaid.il.gov/fhir/ConceptMap/illinois-provider-type-map"
* ^status = #active
* sourceUri = "http://medicaid.il.gov/fhir/CodeSystem/illinois-provider-types"
* targetUri = "http://nucc.org/provider-taxonomy"
* group[0].source = "http://medicaid.il.gov/fhir/CodeSystem/illinois-provider-types"
* group[0].target = "http://nucc.org/provider-taxonomy"
* group[0].element[0].code = #010 "Physician"
* group[0].element[0].target[0].code = #208D00000X
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #020 "Hospital"
* group[0].element[1].target[0].code = #282N00000X
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[2].code = #030 "Dentist"
* group[0].element[2].target[0].code = #122300000X
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[3].code = #040 "Pharmacy"
* group[0].element[3].target[0].code = #183500000X
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[4].code = #050 "Home Health Agency"
* group[0].element[4].target[0].code = #251E00000X
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[5].code = #060 "Nursing Facility"
* group[0].element[5].target[0].code = #314000000X
* group[0].element[5].target[0].equivalence = #equivalent
* group[0].element[6].code = #070 "Optometrist"
* group[0].element[6].target[0].code = #152W00000X
* group[0].element[6].target[0].equivalence = #equivalent
* group[0].element[7].code = #080 "Podiatrist"
* group[0].element[7].target[0].code = #213E00000X
* group[0].element[7].target[0].equivalence = #equivalent
* group[0].element[8].code = #090 "Chiropractor"
* group[0].element[8].target[0].code = #111N00000X
* group[0].element[8].target[0].equivalence = #equivalent
* group[0].element[9].code = #100 "Advanced Practice Nurse"
* group[0].element[9].target[0].code = #363L00000X
* group[0].element[9].target[0].equivalence = #equivalent

// Oregon Enrollment Status Mapping
ConceptMap: OregonEnrollmentStatusMap
Id: oregon-enrollment-status-map
Title: "Oregon Enrollment Status Mapping"
Description: "Mapping between Oregon-specific enrollment status codes and standard Medicaid enrollment status codes"
* ^url = "http://medicaid.or.gov/fhir/ConceptMap/oregon-enrollment-status-map"
* ^status = #active
* sourceUri = "http://medicaid.or.gov/fhir/CodeSystem/oregon-enrollment-status"
* targetUri = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status"
* group[0].source = "http://medicaid.or.gov/fhir/CodeSystem/oregon-enrollment-status"
* group[0].target = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status"
* group[0].element[0].code = #app-received "Application Received"
* group[0].element[0].target[0].code = #pending
* group[0].element[0].target[0].equivalence = #wider
* group[0].element[1].code = #app-processing "Application Processing"
* group[0].element[1].target[0].code = #pending
* group[0].element[1].target[0].equivalence = #wider
* group[0].element[2].code = #app-additional-info "Additional Information Requested"
* group[0].element[2].target[0].code = #pending
* group[0].element[2].target[0].equivalence = #wider
* group[0].element[3].code = #app-approved "Application Approved"
* group[0].element[3].target[0].code = #enrolled
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[4].code = #app-denied "Application Denied"
* group[0].element[4].target[0].code = #denied
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[5].code = #enrolled-active "Enrolled Active"
* group[0].element[5].target[0].code = #enrolled
* group[0].element[5].target[0].equivalence = #equivalent
* group[0].element[6].code = #enrolled-suspended "Enrolled Suspended"
* group[0].element[6].target[0].code = #suspended
* group[0].element[6].target[0].equivalence = #equivalent
* group[0].element[7].code = #enrolled-terminated "Enrolled Terminated"
* group[0].element[7].target[0].code = #terminated
* group[0].element[7].target[0].equivalence = #equivalent
* group[0].element[8].code = #revalidation-due "Revalidation Due"
* group[0].element[8].target[0].code = #revalidation-required
* group[0].element[8].target[0].equivalence = #equivalent
