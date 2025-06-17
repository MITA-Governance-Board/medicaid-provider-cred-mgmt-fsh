This page provides concrete mappings between the [Medicaid Information Technology Architecture (MITA) 3.0](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/index.html) business processes and [FHIR resources](https://www.hl7.org/fhir/resourcelist.html) defined in this Implementation Guide. These mappings are designed to help implementers align their FHIR implementations with MITA requirements.

> **Note:** This implementation guide references official MITA documentation maintained by the Centers for Medicare & Medicaid Services (CMS) and FHIR resources defined by HL7. Links to official resources are provided throughout this document.

### MITA Business Process to FHIR Resource Mappings

The following tables map [MITA 3.0 business processes](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-30/index.html) related to provider management to specific FHIR resources, profiles, and operations defined in this Implementation Guide.

#### Provider Management Business Area

##### PM01: Enroll Provider ([MITA Business Process](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-30/index.html))

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM01.01: Determine Provider Eligibility | [`MedicaidPractitioner`](StructureDefinition-medicaid-practitioner.html), [`MedicaidOrganization`](StructureDefinition-medicaid-organization.html) | Use these profiles to capture provider information during eligibility determination. |
| PM01.02: Enroll Provider | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidEnrollmentStatusExtension` | Create a PractitionerRole resource with enrollment status extension set to "pending" initially. |
| PM01.03: Disenroll Provider | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidEnrollmentStatusExtension` | Update the enrollment status extension to "terminated" and set end date in the period element. |
| PM01.04: Inquire Provider Information | [`SearchParameter/MedicaidProviderIdSearchParameter`](SearchParameter-MedicaidProviderIdSearchParameter.html), [`SearchParameter/MedicaidOrganizationIdSearchParameter`](SearchParameter-MedicaidOrganizationIdSearchParameter.html) | Use these search parameters to query provider information. |
| PM01.05: Manage Provider Communication | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage communication endpoints for providers. |
| PM01.06: Manage Provider Information | [`MedicaidPractitioner`](StructureDefinition-medicaid-practitioner.html), [`MedicaidOrganization`](StructureDefinition-medicaid-organization.html), [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) | Use these profiles to manage provider information throughout the lifecycle. |

##### PM02: Provider Support

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM02.01: Manage Provider Grievance and Appeal | [`MedicaidVerificationResult`](StructureDefinition-medicaid-verification-result.html) | Use this profile to document grievance and appeal processes. |
| PM02.02: Manage Provider Information | [`MedicaidPractitioner`](StructureDefinition-medicaid-practitioner.html), [`MedicaidOrganization`](StructureDefinition-medicaid-organization.html) | Use these profiles to update provider information based on support requests. |
| PM02.03: Perform Provider Outreach | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage communication channels for provider outreach. |

##### PM03: Manage Provider Information

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM03.01: Manage Provider Information | [`MedicaidPractitioner`](StructureDefinition-medicaid-practitioner.html), [`MedicaidOrganization`](StructureDefinition-medicaid-organization.html), [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) | Use these profiles to manage comprehensive provider information. |
| PM03.02: Manage Provider Communication | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage provider communication preferences and channels. |
| PM03.03: Maintain Provider Roster | [Bundle](https://www.hl7.org/fhir/bundle.html) of [`MedicaidPractitioner`](StructureDefinition-medicaid-practitioner.html), [`MedicaidOrganization`](StructureDefinition-medicaid-organization.html), [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) resources | Use FHIR Bundles to maintain and exchange provider roster information. |

##### PM04: Terminate Provider

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM04.01: Terminate Provider | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidEnrollmentStatusExtension` | Update enrollment status to "terminated" and set end date in period element. |
| PM04.02: Notify Provider of Termination | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage communication regarding termination. |

##### PM05: Provider Credentialing

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM05.01: Perform Provider Credentialing | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidCredentialingStatusExtension`, [`MedicaidVerificationResult`](StructureDefinition-medicaid-verification-result.html) | Use these profiles to track credentialing status and verification activities. |
| PM05.02: Manage Credentialing Information | [`MedicaidPractitioner.qualification`](StructureDefinition-medicaid-practitioner.html#Practitioner.qualification), `MedicaidSpecialtyBoardCertificationExtension` | Use these elements to manage detailed credentialing information. |
| PM05.03: Perform Provider Screening | [`MedicaidVerificationResult`](StructureDefinition-medicaid-verification-result.html) | Use this profile to document screening results with appropriate validation types. |
| PM05.04: Manage Site Visit | [`MedicaidVerificationResult`](StructureDefinition-medicaid-verification-result.html) with validationType = "in-person" | Use this profile to document site visit results. |

##### PM06: Provider Sanctions

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM06.01: Manage Provider Sanction | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidEnrollmentStatusExtension` set to "suspended" | Use this pattern to implement provider sanctions. |
| PM06.02: Notify Provider of Sanction | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage communication regarding sanctions. |

##### PM07: Provider Revalidation

| MITA Business Process | FHIR Resources/Profiles | Implementation Pattern |
|------------------------|-------------------------|------------------------|
| PM07.01: Manage Provider Revalidation | [`MedicaidPractitionerRole`](StructureDefinition-medicaid-practitioner-role.html) with `MedicaidEnrollmentStatusExtension`, [`MedicaidVerificationResult`](StructureDefinition-medicaid-verification-result.html) | Use these profiles to track revalidation status and verification activities. |
| PM07.02: Notify Provider of Revalidation | [`MedicaidEndpoint`](StructureDefinition-medicaid-endpoint.html) | Use this profile to manage communication regarding revalidation. |

### MITA Business Capability Matrix to FHIR Implementation Levels

The following table maps [MITA maturity levels](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-maturity-model/index.html) for provider management capabilities to corresponding FHIR implementation patterns.

| MITA Capability | Level 1 (Initial) | Level 2 (Managed) | Level 3 (Defined) | Level 4 (Measured) | Level 5 (Optimized) |
|-----------------|-------------------|-------------------|-------------------|-------------------|---------------------|
| Provider Enrollment | Basic `MedicaidPractitioner` and `MedicaidOrganization` resources with manual processing | `MedicaidPractitionerRole` with `MedicaidEnrollmentStatusExtension` and basic workflow | Full implementation of all profiles with defined state transitions | Implementation of all search parameters with metrics collection | Advanced analytics using FHIR Measure resources |
| Provider Screening | Manual verification recorded in `MedicaidVerificationResult` | Basic automated verification with `MedicaidVerificationResult` | Comprehensive verification with multiple primary sources | Real-time verification with external systems | Predictive screening using historical data |
| Provider Information Management | Basic `MedicaidPractitioner` and `MedicaidOrganization` data | Structured data with defined extensions | Complete implementation with terminology bindings | Real-time updates with subscription notifications | Advanced data quality monitoring |
| Provider Communication | Basic contact information in resources | `MedicaidEndpoint` with defined communication channels | Structured communication with defined protocols | Automated communication based on status changes | Personalized communication based on provider preferences |

### FHIR API Implementation for MITA Business Processes

The following table provides guidance on implementing [FHIR API operations](https://www.hl7.org/fhir/http.html) to support MITA business processes.

| MITA Business Process | FHIR API Operations | Implementation Notes |
|------------------------|---------------------|----------------------|
| Provider Enrollment | [`POST [base]/Practitioner`](https://www.hl7.org/fhir/http.html#create)<br>[`POST [base]/Organization`](https://www.hl7.org/fhir/http.html#create)<br>[`POST [base]/PractitionerRole`](https://www.hl7.org/fhir/http.html#create) | Create resources in sequence, linking them with appropriate references. |
| Provider Information Update | [`PUT [base]/Practitioner/[id]`](https://www.hl7.org/fhir/http.html#update)<br>[`PUT [base]/Organization/[id]`](https://www.hl7.org/fhir/http.html#update)<br>[`PUT [base]/PractitionerRole/[id]`](https://www.hl7.org/fhir/http.html#update) | Update resources while maintaining consistency across related resources. |
| Provider Search | [`GET [base]/Practitioner?identifier=[system]|[value]`](https://www.hl7.org/fhir/http.html#search)<br>[`GET [base]/PractitionerRole?specialty=[code]`](https://www.hl7.org/fhir/http.html#search) | Use defined search parameters to implement search operations. |
| Provider Verification | [`POST [base]/VerificationResult`](https://www.hl7.org/fhir/http.html#create) | Create verification results linked to the appropriate target resources. |
| Provider Termination | [`PUT [base]/PractitionerRole/[id]`](https://www.hl7.org/fhir/http.html#update) | Update the PractitionerRole with appropriate status and end date. |

### MITA Data Architecture to FHIR Resource Mapping

The following table maps [MITA data architecture](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-30/index.html) concepts to [FHIR resource elements](https://www.hl7.org/fhir/resourcelist.html).

| MITA Data Concept | FHIR Resource Element | Implementation Notes |
|-------------------|------------------------|----------------------|
| Provider Identifier | `MedicaidPractitioner.identifier`<br>`MedicaidOrganization.identifier` | Use sliced identifiers with appropriate systems. |
| Provider Demographics | `MedicaidPractitioner.name`<br>`MedicaidPractitioner.telecom`<br>`MedicaidPractitioner.address` | Capture comprehensive demographic information. |
| Provider Specialty | `MedicaidPractitionerRole.specialty` | Use codes from `MedicaidSpecialtyCodes` value set. |
| Provider Type | `MedicaidPractitionerRole.code` | Use codes from `MedicaidProviderTypes` value set. |
| Provider Status | `MedicaidPractitionerRole.active`<br>`MedicaidEnrollmentStatusExtension`<br>`MedicaidCredentialingStatusExtension` | Use combination of active flag and status extensions. |
| Provider Location | `MedicaidLocation`<br>`MedicaidPractitionerRole.location` | Link practitioners to locations through PractitionerRole. |
| Provider Service | `MedicaidHealthcareService`<br>`MedicaidPractitionerRole.healthcareService` | Link practitioners to services through PractitionerRole. |
| Provider Credential | `MedicaidPractitioner.qualification`<br>`MedicaidSpecialtyBoardCertificationExtension` | Capture detailed credential information. |
| Provider Verification | `MedicaidVerificationResult` | Document verification activities and results. |

### MITA Technical Architecture to FHIR Implementation

The following table maps [MITA technical architecture patterns](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-30/index.html) to [FHIR implementation patterns](https://www.hl7.org/fhir/implementationguide.html).

| MITA Technical Pattern | FHIR Implementation Pattern | Implementation Notes |
|------------------------|------------------------------|----------------------|
| Service-Oriented Architecture | [FHIR RESTful API](https://www.hl7.org/fhir/http.html) | Implement standard FHIR API operations for each resource. |
| Enterprise Service Bus | [FHIR Messaging](https://www.hl7.org/fhir/messaging.html) | Use FHIR messaging with [MessageHeader](https://www.hl7.org/fhir/messageheader.html) resources for asynchronous communication. |
| Master Data Management | [FHIR Resources with References](https://www.hl7.org/fhir/references.html) | Use consistent references between resources to maintain data integrity. |
| Business Rules Engine | [FHIR PlanDefinition](https://www.hl7.org/fhir/plandefinition.html) and [ActivityDefinition](https://www.hl7.org/fhir/activitydefinition.html) | Define business rules using FHIR workflow resources. |
| Identity Management | [FHIR IdentitySystem](https://www.hl7.org/fhir/identifier-registry.html) and [Identifier](https://www.hl7.org/fhir/datatypes.html#Identifier) | Use consistent identifier systems with appropriate validation. |
| Access Control | [FHIR Consent](https://www.hl7.org/fhir/consent.html) and [Security Labels](https://www.hl7.org/fhir/security-labels.html) | Implement appropriate security controls using FHIR security mechanisms. |

### Implementation Examples

#### Example 1: Provider Enrollment Process

```
// Step 1: Create Practitioner
POST [base]/Practitioner
{
  "resourceType": "Practitioner",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner"]
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id",
      "valueString": "MD12345"
    }
  ],
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    }
  ],
  "name": [
    {
      "family": "Smith",
      "given": ["John"]
    }
  ],
  "qualification": [
    {
      "code": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0360",
            "code": "MD",
            "display": "Doctor of Medicine"
          }
        ]
      },
      "extension": [
        {
          "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-specialty-board-certification",
          "extension": [
            {
              "url": "boardName",
              "valueString": "American Board of Internal Medicine"
            },
            {
              "url": "certificationDate",
              "valueDate": "2020-01-15"
            }
          ]
        }
      ]
    }
  ]
}

// Step 2: Create PractitionerRole with enrollment status
POST [base]/PractitionerRole
{
  "resourceType": "PractitionerRole",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"]
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "pending",
            "display": "Pending"
          }
        ]
      }
    },
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status",
            "code": "in-process",
            "display": "In Process"
          }
        ]
      }
    }
  ],
  "practitioner": {
    "reference": "Practitioner/[id]"
  },
  "specialty": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207R00000X",
          "display": "Internal Medicine"
        }
      ]
    }
  ]
}

// Step 3: Create VerificationResult for license verification
POST [base]/VerificationResult
{
  "resourceType": "VerificationResult",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"]
  },
  "target": [
    {
      "reference": "Practitioner/[id]"
    }
  ],
  "status": "validated",
  "statusDate": "2025-06-15",
  "validationType": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/verificationresult-validation-type",
        "code": "primary",
        "display": "Primary Source"
      }
    ]
  },
  "primarySource": [
    {
      "who": {
        "display": "State Medical Board"
      },
      "type": [
        {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/verificationresult-primary-source-type",
              "code": "lic-board",
              "display": "License Board"
            }
          ]
        }
      ],
      "validationStatus": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-verification-status",
            "code": "verified",
            "display": "Verified"
          }
        ]
      }
    }
  ]
}

// Step 4: Update PractitionerRole with enrollment status
PUT [base]/PractitionerRole/[id]
{
  "resourceType": "PractitionerRole",
  "id": "[id]",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"]
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "enrolled",
            "display": "Enrolled"
          }
        ]
      }
    },
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-credentialing-status",
            "code": "credentialed",
            "display": "Credentialed"
          }
        ]
      }
    }
  ],
  "active": true,
  "period": {
    "start": "2025-06-15"
  },
  "practitioner": {
    "reference": "Practitioner/[id]"
  },
  "specialty": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207R00000X",
          "display": "Internal Medicine"
        }
      ]
    }
  ]
}
```

#### Example 2: Provider Revalidation Process

```
// Step 1: Update PractitionerRole with revalidation status
PUT [base]/PractitionerRole/[id]
{
  "resourceType": "PractitionerRole",
  "id": "[id]",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"]
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "revalidation-required",
            "display": "Revalidation Required"
          }
        ]
      }
    }
  ]
}

// Step 2: Create VerificationResult for revalidation
POST [base]/VerificationResult
{
  "resourceType": "VerificationResult",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result"]
  },
  "target": [
    {
      "reference": "Practitioner/[id]"
    }
  ],
  "status": "validated",
  "statusDate": "2025-06-15",
  "validationType": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/verificationresult-validation-type",
        "code": "primary",
        "display": "Primary Source"
      }
    ]
  },
  "need": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/verificationresult-need",
        "code": "periodic",
        "display": "Periodic"
      }
    ]
  }
}

// Step 3: Update PractitionerRole with revalidated status
PUT [base]/PractitionerRole/[id]
{
  "resourceType": "PractitionerRole",
  "id": "[id]",
  "meta": {
    "profile": ["http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role"]
  },
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "enrolled",
            "display": "Enrolled"
          }
        ]
      }
    }
  ]
}
```

### MITA to FHIR Implementation Roadmap

The following roadmap provides guidance on implementing FHIR resources to achieve [MITA maturity levels](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-maturity-model/index.html).

#### Level 1: Initial Implementation

1. Implement basic `MedicaidPractitioner` and `MedicaidOrganization` profiles
2. Capture basic provider information
3. Implement manual processes for enrollment and credentialing

#### Level 2: Managed Implementation

1. Implement `MedicaidPractitionerRole` with status extensions
2. Implement `MedicaidVerificationResult` for basic verification
3. Implement basic FHIR API operations for provider management

#### Level 3: Defined Implementation

1. Implement all profiles with proper references
2. Implement all extensions with appropriate terminology bindings
3. Implement standard workflows for provider management processes

#### Level 4: Measured Implementation

1. Implement all search parameters for efficient querying
2. Implement metrics collection using FHIR Measure resources
3. Implement real-time verification with external systems

#### Level 5: Optimized Implementation

1. Implement advanced analytics for provider management
2. Implement predictive screening using historical data
3. Implement personalized communication based on provider preferences

### Additional Resources

#### MITA Resources

- [MITA Framework 3.0](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/index.html) - Official CMS documentation for MITA
- [MITA Maturity Model](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-maturity-model/index.html) - Information about MITA maturity levels
- [MITA Business Process Model](https://www.medicaid.gov/medicaid/data-systems/medicaid-information-technology-architecture/medicaid-information-technology-architecture-framework/mita-30/index.html) - Documentation of MITA business processes
- [CMS Medicaid Enterprise Certification](https://www.medicaid.gov/medicaid/data-systems/certification/index.html) - Information about Medicaid system certification

#### FHIR Resources

- [FHIR Specification](https://www.hl7.org/fhir/) - Official HL7 FHIR specification
- [FHIR Resource List](https://www.hl7.org/fhir/resourcelist.html) - Complete list of FHIR resources
- [FHIR RESTful API](https://www.hl7.org/fhir/http.html) - Documentation for FHIR RESTful API operations
- [FHIR US Core Implementation Guide](https://www.hl7.org/fhir/us/core/) - US Core profiles that form the basis for many Medicaid profiles
- [FHIR Terminology](https://www.hl7.org/fhir/terminologies.html) - FHIR terminology resources and binding strengths
