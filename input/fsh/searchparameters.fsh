// Medicaid Provider Credentialing Search Parameters

Instance: MedicaidProviderIdSearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Provider ID"
Description: "Search for practitioners by their Medicaid provider ID"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-provider-id"
* version = "0.1.0"
* name = "MedicaidProviderIdSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by their state-specific Medicaid provider identifier"
* code = #medicaid-provider-id
* base = #Practitioner
* type = #string
* expression = "Practitioner.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id').value"
* xpath = "f:Practitioner/f:extension[@url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id']/f:valueString/@value"
* xpathUsage = #normal

Instance: MedicaidEnrollmentStatusSearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Enrollment Status"
Description: "Search for practitioner roles by their Medicaid enrollment status"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-enrollment-status"
* version = "0.1.0"
* name = "MedicaidEnrollmentStatusSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioner roles by their current Medicaid enrollment status"
* code = #medicaid-enrollment-status
* base = #PractitionerRole
* type = #token
* expression = "PractitionerRole.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status').value"
* xpath = "f:PractitionerRole/f:extension[@url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status']/f:valueCodeableConcept"
* xpathUsage = #normal

Instance: MedicaidCredentialingStatusSearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Credentialing Status"
Description: "Search for practitioner roles by their Medicaid credentialing status"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-credentialing-status"
* version = "0.1.0"
* name = "MedicaidCredentialingStatusSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioner roles by their current Medicaid credentialing status"
* code = #medicaid-credentialing-status
* base = #PractitionerRole
* type = #token
* expression = "PractitionerRole.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status').value"
* xpath = "f:PractitionerRole/f:extension[@url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status']/f:valueCodeableConcept"
* xpathUsage = #normal

Instance: MedicaidOrganizationIdSearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Organization ID"
Description: "Search for organizations by their Medicaid organization ID"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-organization-id"
* version = "0.1.0"
* name = "MedicaidOrganizationIdSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for organizations by their state-specific Medicaid organization identifier"
* code = #medicaid-organization-id
* base = #Organization
* type = #token
* expression = "Organization.identifier.where(system='urn:oid:2.16.840.1.113883.4.642.40.42.1')"
* xpath = "f:Organization/f:identifier[f:system/@value='urn:oid:2.16.840.1.113883.4.642.40.42.1']"
* xpathUsage = #normal

Instance: VerificationTargetSearchParameter
InstanceOf: SearchParameter
Title: "Search by Verification Target"
Description: "Search for verification results by their target resource"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/verification-target"
* version = "0.1.0"
* name = "VerificationTargetSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for verification results by the practitioner or organization being verified"
* code = #verification-target
* base = #VerificationResult
* type = #reference
* expression = "VerificationResult.target"
* xpath = "f:VerificationResult/f:target"
* xpathUsage = #normal
* target[0] = #Practitioner
* target[+] = #Organization

Instance: MedicaidLocationSearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Location"
Description: "Search for healthcare services by location"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-location"
* version = "0.1.0"
* name = "MedicaidLocationSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for healthcare services by their location"
* code = #medicaid-location
* base = #HealthcareService
* type = #reference
* expression = "HealthcareService.location"
* xpath = "f:HealthcareService/f:location"
* xpathUsage = #normal
* target = #Location

Instance: MedicaidSpecialtySearchParameter
InstanceOf: SearchParameter
Title: "Search by Medicaid Specialty"
Description: "Search for practitioners by specialty"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-specialty"
* version = "0.1.0"
* name = "MedicaidSpecialtySearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for practitioners by their specialty"
* code = #medicaid-specialty
* base = #PractitionerRole
* type = #token
* expression = "PractitionerRole.specialty"
* xpath = "f:PractitionerRole/f:specialty"
* xpathUsage = #normal

Instance: MedicaidVerificationStatusSearchParameter
InstanceOf: SearchParameter
Title: "Search by Verification Status"
Description: "Search for verification results by status"
Usage: #definition
* url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/SearchParameter/medicaid-verification-status"
* version = "0.1.0"
* name = "MedicaidVerificationStatusSearchParameter"
* status = #active
* experimental = false
* date = "2025-06-16"
* publisher = "HL7 International - Financial Management Work Group"
* contact.name = "HL7 International - Financial Management Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/fm"
* description = "Search for verification results by their status"
* code = #medicaid-verification-status
* base = #VerificationResult
* type = #token
* expression = "VerificationResult.status"
* xpath = "f:VerificationResult/f:status"
* xpathUsage = #normal
