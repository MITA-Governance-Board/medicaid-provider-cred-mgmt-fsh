This section describes the FHIR profiles and extensions defined in this Implementation Guide for Medicaid provider credentialing and enrollment. These profiles build upon US Core 6.1.0, Da Vinci PDex Plan-Net, and FAST National Directory specifications to provide Medicaid-specific requirements and constraints.

### Profile Hierarchy

The profiles in this IG follow a hierarchical structure based on established FHIR standards:

```
US Core Practitioner
└── Medicaid Practitioner

Da Vinci PDex Plan-Net PractitionerRole
└── Medicaid Practitioner Role

Da Vinci PDex Plan-Net Organization
└── Medicaid Organization

Da Vinci PDex Plan-Net Location
└── Medicaid Location

Da Vinci PDex Plan-Net HealthcareService
└── Medicaid Healthcare Service

Da Vinci PDex Plan-Net Endpoint
└── Medicaid Endpoint

FHIR R4 VerificationResult
└── Medicaid Verification Result
```

### Core Profiles

#### Medicaid Practitioner

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner`

**Base Profile:** US Core Practitioner

**Description:** A practitioner participating in or applying to participate in the Medicaid program.

##### Key Requirements:
- **Must have NPI**: All practitioners must have a National Provider Identifier
- **Medicaid ID**: State-specific Medicaid provider identifier
- **Complete Demographics**: Name, contact information, address, gender, and birth date are required
- **Qualifications**: At least one qualification (license, certification, etc.) is required
- **Board Certifications**: Specialty board certifications can be captured using extensions

##### Must Support Elements:
- `identifier` (NPI and Medicaid ID)
- `name`
- `telecom`
- `address`
- `gender`
- `birthDate`
- `qualification`

##### Extensions:
- **Medicaid Provider ID**: State-specific provider identifier extension

#### Medicaid Practitioner Role

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role`

**Base Profile:** Da Vinci PDex Plan-Net PractitionerRole

**Description:** A practitioner's role within the Medicaid program, including enrollment and credentialing status.

##### Key Requirements:
- **Enrollment Status**: Current enrollment status in Medicaid program
- **Credentialing Status**: Current credentialing status
- **Active Period**: Must specify when the role became active
- **Provider Type**: Must specify the type of provider
- **Specialty**: Must specify at least one specialty

##### Must Support Elements:
- `active`
- `period`
- `practitioner`
- `organization`
- `code` (provider type)
- `specialty`
- `location`
- `telecom`

##### Extensions:
- **Medicaid Enrollment Status**: Current enrollment status
- **Medicaid Credentialing Status**: Current credentialing status

#### Medicaid Organization

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization`

**Base Profile:** Da Vinci PDex Plan-Net Organization

**Description:** An organization participating in the Medicaid program.

##### Key Requirements:
- **Medicaid ID**: State-specific Medicaid organization identifier (required)
- **NPI**: National Provider Identifier (optional for organizations)
- **TIN**: Tax Identification Number (optional)
- **Organization Type**: Must specify the type of organization
- **Contact Information**: Phone and address information required

##### Must Support Elements:
- `identifier` (Medicaid ID, NPI, TIN)
- `active`
- `type`
- `name`
- `telecom`
- `address`

#### Medicaid Location

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-location`

**Base Profile:** Da Vinci PDex Plan-Net Location

**Description:** A location where Medicaid services are provided.

##### Key Requirements:
- **Managing Organization**: Must reference a Medicaid Organization
- **Location Type**: Must specify the type of location
- **Contact Information**: Phone and address information required
- **Hours of Operation**: Operating hours should be specified

##### Must Support Elements:
- `identifier`
- `status`
- `name`
- `type`
- `telecom`
- `address`
- `managingOrganization`

#### Medicaid Healthcare Service

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-healthcare-service`

**Base Profile:** Da Vinci PDex Plan-Net HealthcareService

**Description:** A healthcare service covered by Medicaid.

##### Key Requirements:
- **Provided By**: Must reference a Medicaid Organization
- **Service Category**: Must specify the category of service
- **Service Type**: Must specify the type of service
- **Location**: Must reference at least one Medicaid Location

##### Must Support Elements:
- `identifier`
- `active`
- `providedBy`
- `category`
- `type`
- `location`
- `name`
- `telecom`

#### Medicaid Endpoint

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-endpoint`

**Base Profile:** Da Vinci PDex Plan-Net Endpoint

**Description:** Technical endpoint for Medicaid data exchange.

##### Key Requirements:
- **Managing Organization**: Must reference a Medicaid Organization
- **Connection Type**: Must specify the type of connection
- **Payload Type**: Must specify supported payload types
- **Address**: Must provide the endpoint address

##### Must Support Elements:
- `identifier`
- `status`
- `connectionType`
- `name`
- `managingOrganization`
- `payloadType`
- `address`

#### Medicaid Verification Result

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result`

**Base Profile:** FHIR R4 VerificationResult

**Description:** Result of verification activities for Medicaid provider credentialing.

##### Key Requirements:
- **Target**: Must reference the practitioner or organization being verified
- **Status**: Must specify the verification status
- **Status Date**: Must specify when the status was determined
- **Primary Source**: Should include information about primary sources used for verification

##### Must Support Elements:
- `target`
- `status`
- `statusDate`
- `validationType`
- `primarySource`

### Extensions

#### Medicaid Provider ID

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id`

**Context:** Practitioner

**Description:** State-specific Medicaid provider identifier.

**Data Type:** string

#### Medicaid Enrollment Status

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status`

**Context:** PractitionerRole

**Description:** Current enrollment status in the Medicaid program.

**Data Type:** CodeableConcept

**Value Set:** [Medicaid Enrollment Statuses](ValueSet-medicaid-enrollment-statuses.html)

#### Medicaid Credentialing Status

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status`

**Context:** PractitionerRole

**Description:** Current credentialing status for Medicaid participation.

**Data Type:** CodeableConcept

**Value Set:** [Medicaid Credentialing Statuses](ValueSet-medicaid-credentialing-statuses.html)

#### Medicaid Specialty Board Certification

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-specialty-board-certification`

**Context:** Practitioner.qualification

**Description:** Board certification information for specialty practice.

**Structure:**
- `boardName` (string, required): Name of the certifying board
- `certificationDate` (date, optional): Date of certification
- `expirationDate` (date, optional): Expiration date of certification
- `certificationNumber` (string, optional): Certification number or identifier

### Usage Patterns

#### Provider Enrollment Workflow

1. **Initial Application**: Create a Medicaid Practitioner with basic demographic information
2. **Qualification Verification**: Add qualification information with verification results
3. **Role Assignment**: Create a Medicaid Practitioner Role with enrollment status "pending"
4. **Credentialing Process**: Update credentialing status as the process progresses
5. **Final Approval**: Update enrollment status to "enrolled" and credentialing status to "credentialed"

#### Organization Registration

1. **Organization Creation**: Create a Medicaid Organization with required identifiers
2. **Location Setup**: Create Medicaid Locations for service delivery sites
3. **Service Definition**: Create Medicaid Healthcare Services offered at each location
4. **Endpoint Configuration**: Create Medicaid Endpoints for technical integration

#### Verification Tracking

1. **Verification Initiation**: Create Medicaid Verification Result with status "pending"
2. **Primary Source Verification**: Update with primary source information
3. **Verification Completion**: Update status to "validated" or "failed"
4. **Ongoing Monitoring**: Schedule periodic re-verification

### Conformance Requirements

#### Must Support

Elements marked as "Must Support" in the profiles have the following requirements:

1. **Senders**: Must be capable of providing the element if the information is available
2. **Receivers**: Must be capable of processing the element without error
3. **Storage**: Systems should store the information for future retrieval

#### Cardinality Constraints

The profiles define specific cardinality constraints that are more restrictive than the base resources:

- **Required Elements**: Elements with cardinality 1..* or 1..1 must be present
- **Optional Elements**: Elements with cardinality 0..* or 0..1 may be omitted
- **Conditional Requirements**: Some elements are required based on the presence of other elements

#### Terminology Bindings

The profiles use a combination of:

- **Required Bindings**: Must use codes from the specified value set
- **Extensible Bindings**: Should use codes from the specified value set, but may use other codes if necessary
- **Preferred Bindings**: Should use codes from the specified value set when possible

### Implementation Considerations

#### Data Quality

- **Validation Rules**: Implement validation rules to ensure data quality
- **Required Fields**: Enforce required field constraints at the application level
- **Format Validation**: Validate data formats (e.g., NPI format, phone number format)

#### Performance

- **Indexing**: Create appropriate database indexes for frequently queried fields
- **Caching**: Implement caching strategies for frequently accessed data
- **Pagination**: Use pagination for large result sets

#### Security

- **Access Controls**: Implement appropriate access controls for sensitive data
- **Audit Logging**: Log all access to provider information
- **Data Encryption**: Encrypt sensitive data at rest and in transit

#### Interoperability

- **Standard Identifiers**: Use standard identifier systems (NPI, TIN, etc.)
