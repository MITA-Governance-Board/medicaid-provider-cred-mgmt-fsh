This section provides comprehensive examples demonstrating the use of the Medicaid Provider Credentialing and Enrollment profiles. These examples illustrate real-world scenarios and show how the various profiles work together to support provider credentialing and enrollment workflows.

### Example Scenarios

#### Scenario 1: Primary Care Physician Enrollment

This scenario demonstrates the enrollment of a family medicine physician into a state Medicaid program.

##### Participants:
- **Dr. John Michael Smith**: Family medicine physician seeking Medicaid enrollment
- **Springfield Medical Center**: Hospital where Dr. Smith practices
- **Illinois Medicaid Program**: State Medicaid agency

##### Workflow:
1. Dr. Smith submits an application for Medicaid enrollment
2. The state verifies his medical license and board certification
3. Springfield Medical Center provides organizational information
4. Dr. Smith is approved and enrolled in the Medicaid program

##### FHIR Resources:

**[Medicaid Practitioner Example](Practitioner-MedicaidPractitionerExample.html)**
- Demonstrates a complete practitioner profile with NPI, Medicaid ID, and board certification
- Shows required demographic information and contact details
- Includes medical license and board certification qualifications

**[Medicaid Practitioner Role Example](PractitionerRole-MedicaidPractitionerRoleExample.html)**
- Shows the practitioner's role within the Medicaid program
- Demonstrates enrollment status "enrolled" and credentialing status "credentialed"
- Links to the organization, location, and services

**[Medicaid Organization Example](Organization-MedicaidOrganizationExample.html)**
- Represents Springfield Medical Center as a Medicaid participating organization
- Shows required identifiers (NPI, Medicaid ID, TIN)
- Includes contact information and organizational details

**[Medicaid Location Example](Location-MedicaidLocationExample.html)**
- Represents the physical location where services are provided
- Shows address, contact information, and hours of operation
- Links to the managing organization

#### Scenario 2: Nurse Practitioner Credentialing

This scenario shows the credentialing process for a nurse practitioner.

##### Participants:
- **Sarah Elizabeth Davis, NP**: Nurse practitioner applying for Medicaid participation
- **Healthcare Plaza Clinic**: Primary care clinic

##### Workflow:
1. Ms. Davis applies for Medicaid enrollment as a nurse practitioner
2. Her nursing license and nurse practitioner certification are verified
3. She is credentialed to provide primary care services
4. Her enrollment is approved with appropriate scope of practice

##### FHIR Resources:

**[Medicaid Nurse Practitioner Example](Practitioner-MedicaidNursePractitionerExample.html)**
- Shows a nurse practitioner with both RN license and NP certification
- Demonstrates multiple qualifications with different issuing organizations
- Includes appropriate naming conventions for nurse practitioners

#### Scenario 3: Specialty Clinic Registration

This scenario demonstrates the registration of a specialty clinic.

##### Participants:
- **Springfield Cardiology Associates**: Cardiology specialty practice
- **Multiple cardiologists**: Practitioners affiliated with the clinic

##### Workflow:
1. The specialty clinic applies for Medicaid participation
2. Organizational credentials and affiliations are verified
3. Individual practitioners are credentialed for specialty services
4. The clinic is approved to provide cardiology services

##### FHIR Resources:

**[Medicaid Specialty Clinic Example](Organization-MedicaidSpecialtyClinicExample.html)**
- Shows a specialty clinic as a provider group
- Demonstrates organizational hierarchy with parent organization
- Includes specialty-specific contact information

#### Scenario 4: Rural Health Clinic Enrollment

This scenario shows the enrollment of a rural health clinic.

##### Participants:
- **Prairie View Rural Health Clinic**: Rural health clinic serving underserved area

##### Workflow:
1. Rural health clinic applies for Medicaid participation
2. Special rural health clinic requirements are verified
3. Clinic is approved with appropriate rural health designations

##### FHIR Resources:

**[Medicaid Rural Health Clinic Example](Organization-MedicaidRuralHealthClinicExample.html)**
- Shows a rural health clinic without NPI (not required for all RHCs)
- Demonstrates minimal required identifiers
- Shows rural location characteristics

#### Scenario 5: License Verification Process

This scenario demonstrates the verification of provider credentials.

##### Participants:
- **Illinois Department of Financial and Professional Regulation**: State licensing board
- **Illinois Medicaid Provider Enrollment Unit**: State Medicaid verification unit

##### Workflow:
1. Provider license verification is initiated
2. Primary source verification is conducted with state licensing board
3. Verification results are documented
4. Ongoing monitoring is scheduled

##### FHIR Resources:

**[Medicaid Verification Result Example](VerificationResult-MedicaidVerificationResultExample.html)**
- Shows comprehensive verification result with primary source information
- Demonstrates verification status and dates
- Includes validator organization information

**[Medicaid License Verification Example](VerificationResult-MedicaidLicenseVerificationExample.html)**
- Shows specific license verification process
- Demonstrates API-based verification method
- Includes automatic update capabilities

### Technical Examples

#### Healthcare Service Configuration

**[Medicaid Healthcare Service Example](HealthcareService-MedicaidHealthcareServiceExample.html)**
- Shows primary care services offered at a Medicaid location
- Demonstrates service categories, types, and eligibility requirements
- Includes availability and appointment information

#### Technical Endpoint Setup

**[Medicaid Endpoint Example](Endpoint-MedicaidEndpointExample.html)**
- Shows FHIR endpoint configuration for data exchange
- Demonstrates connection type and payload specifications
- Includes security and authentication considerations

### Data Element Examples

#### Identifiers

```json
{
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    },
    {
      "system": "http://medicaid.state.gov/provider-id",
      "value": "MD12345"
    }
  ]
}
```

#### Extensions

```json
{
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

#### Board Certification Extension

```json
{
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
          "valueDate": "2008-07-15"
        },
        {
          "url": "expirationDate",
          "valueDate": "2028-07-15"
        },
        {
          "url": "certificationNumber",
          "valueString": "ABIM-12345"
        }
      ]
    }
  ]
}
```

### Common Patterns

#### Provider Enrollment Status Tracking

The following pattern shows how to track a provider's enrollment status over time:

1. **Initial Application**: Status = "pending"
2. **Under Review**: Status = "pending" (no change)
3. **Additional Information Required**: Status = "pending" with notes
4. **Approved**: Status = "enrolled"
5. **Revalidation Required**: Status = "revalidation-required"

#### Credentialing Workflow

The credentialing status follows this typical progression:

1. **Application Submitted**: Status = "incomplete"
2. **All Documents Received**: Status = "in-process"
3. **Verification Complete**: Status = "credentialed"
4. **Periodic Review**: Status = "recredentialing"
5. **Renewal Complete**: Status = "credentialed"

#### Multi-Location Providers

For providers practicing at multiple locations:

```json
{
  "resourceType": "PractitionerRole",
  "practitioner": {
    "reference": "Practitioner/MedicaidPractitionerExample"
  },
  "organization": {
    "reference": "Organization/MedicaidOrganizationExample"
  },
  "location": [
    {
      "reference": "Location/MedicaidLocationExample"
    },
    {
      "reference": "Location/MedicaidLocationExample2"
    }
  ]
}
```

#### Group Practice Representation

For group practices with multiple providers:

```json
{
  "resourceType": "Organization",
  "type": [
    {
      "coding": [
        {
          "system": "http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/OrgTypeCS",
          "code": "prvgrp",
          "display": "Provider Group"
        }
      ]
    }
  ],
  "partOf": {
    "reference": "Organization/ParentOrganization"
  }
}
```

### Validation Examples

#### Required Field Validation

All examples demonstrate compliance with required fields:

- **Practitioner**: NPI, name, telecom, address, gender, birthDate, qualification
- **PractitionerRole**: active, period.start, practitioner, code, specialty, telecom
- **Organization**: identifier (Medicaid ID), active, type, name, telecom, address

#### Terminology Validation

Examples use appropriate code systems:

- **Provider Types**: NUCC Provider Taxonomy
- **Specialties**: NUCC Provider Taxonomy
- **Enrollment Status**: Medicaid-specific code system
- **Credentialing Status**: Medicaid-specific code system

#### Reference Validation

All references in the examples point to valid resources:

- PractitionerRole references valid Practitioner and Organization
- Location references valid managing Organization
- HealthcareService references valid Organization and Location

### Error Handling Examples

#### Missing Required Fields

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "error",
      "code": "required",
      "details": {
        "text": "Practitioner.identifier[npi] is required"
      },
      "location": [
        "Practitioner.identifier"
      ]
    }
  ]
}
```

#### Invalid Code System

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "error",
      "code": "code-invalid",
      "details": {
        "text": "Invalid enrollment status code"
      },
      "location": [
        "PractitionerRole.extension[enrollmentStatus].valueCodeableConcept.coding[0].code"
      ]
    }
  ]
}
```

### Testing Scenarios

#### Positive Test Cases

1. **Complete Provider Enrollment**: All required fields present and valid
2. **Minimal Valid Resource**: Only required fields present
3. **Maximum Data**: All optional fields populated
4. **Multiple Qualifications**: Provider with multiple licenses/certifications

#### Negative Test Cases

1. **Missing NPI**: Practitioner without required NPI
2. **Invalid Status Code**: Using non-existent enrollment status
3. **Broken Reference**: PractitionerRole referencing non-existent Practitioner
4. **Invalid Date Format**: Using incorrect date format in qualification period

#### Edge Cases

1. **Expired Credentials**: Provider with expired license
2. **Suspended Enrollment**: Provider with suspended status
3. **Multiple Organizations**: Provider affiliated with multiple organizations
4. **Inactive Location**: Services at temporarily inactive location

### Implementation Notes

#### Resource Relationships

The examples demonstrate proper resource relationships:

- Practitioner ← PractitionerRole → Organization
- Organization → Location → HealthcareService
- Practitioner/Organization ← VerificationResult

#### Identifier Management

Examples show proper use of identifier systems:

- NPI: `http://hl7.org/fhir/sid/us-npi`
- Medicaid Provider ID: `http://medicaid.state.gov/provider-id`
- TIN: `http://terminology.hl7.org/NamingSystem/USEIN`

#### Extension Usage

Examples demonstrate proper extension usage:

- Context-appropriate extensions only
- Required vs. optional extension elements
- Proper data types for extension values

#### Search Parameters

Common search patterns demonstrated in examples:

- Find practitioners by NPI: `Practitioner?identifier=http://hl7.org/fhir/sid/us-npi|1234567890`
- Find by enrollment status: `PractitionerRole?enrollment-status=enrolled`
- Find by specialty: `PractitionerRole?specialty=207Q00000X`
