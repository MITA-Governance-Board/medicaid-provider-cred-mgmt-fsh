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
- **Must have NPI**: All practitioners must have a National Provider Identifier (NPI) as their primary identifier. The NPI is a unique 10-digit identification number issued to healthcare providers by the Centers for Medicare and Medicaid Services (CMS) and is essential for all Medicaid transactions and claims processing.
- **Medicaid ID**: State-specific Medicaid provider identifier that is assigned by the state Medicaid agency upon successful enrollment. This identifier is used for state-level tracking and may follow different formats depending on the state's requirements.
- **Complete Demographics**: Name, contact information, address, gender, and birth date are required to ensure accurate identification and communication. This includes full legal name, all practice locations, multiple contact methods (phone, email), and demographic details needed for verification purposes.
- **Qualifications**: At least one qualification (license, certification, etc.) is required to demonstrate the practitioner's authority to practice. This includes state medical licenses, DEA registrations, specialty certifications, and educational credentials with their respective issuing authorities and validity periods.
- **Board Certifications**: Specialty board certifications can be captured using extensions to document a practitioner's specialized training and expertise. These certifications must include the certifying board name, certification date, expiration date, and certification number for verification purposes.

##### Must Support Elements:
- `identifier` (NPI and Medicaid ID): Systems must support both the nationally standardized NPI and state-specific Medicaid ID identifiers. The NPI must follow the 10-digit format and be validated against the NPPES registry, while Medicaid IDs must conform to state-specific formatting requirements.
- `name`: Systems must support the practitioner's full legal name, including prefix, given names, family name, suffix, and period of use. Name changes must be tracked with appropriate periods to maintain historical accuracy.
- `telecom`: Systems must support multiple telecommunication contact points including phone numbers (office, mobile, fax) and email addresses, with appropriate use codes and preferred contact flags to facilitate efficient communication.
- `address`: Systems must support multiple address types including practice locations, mailing addresses, and billing addresses. Addresses must include all components (line, city, state, postal code, country) and be validated for accuracy.
- `gender`: Systems must support the practitioner's administrative gender as part of demographic information, which may be used for identification verification and reporting purposes.
- `birthDate`: Systems must support the practitioner's date of birth for identity verification purposes, with appropriate privacy protections and access controls in place to protect this sensitive information.
- `qualification`: Systems must support comprehensive qualification information including licenses, certifications, and educational credentials with their respective identifiers, issuing organizations, validity periods, and verification status.

##### Extensions:
- **Medicaid Provider ID**: State-specific provider identifier extension that captures the unique identifier assigned by a state Medicaid program. This extension includes the state code, identifier value, and period of validity to support cross-state provider participation and historical tracking of provider identifiers across multiple states.

#### Medicaid Practitioner Role

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-practitioner-role`

**Base Profile:** Da Vinci PDex Plan-Net PractitionerRole

**Description:** A practitioner's role within the Medicaid program, including enrollment and credentialing status.

##### Key Requirements:
- **Enrollment Status**: Current enrollment status in Medicaid program must be explicitly documented using the Medicaid Enrollment Status extension. This includes statuses such as "pending," "enrolled," "suspended," or "terminated," along with the effective date of the status and any applicable end dates for temporary statuses.
- **Credentialing Status**: Current credentialing status must be tracked to indicate where the provider is in the credentialing workflow. This includes statuses such as "in progress," "credentialed," "recredentialing," or "denied," with appropriate timestamps for tracking the credentialing lifecycle.
- **Active Period**: Must specify when the role became active within the Medicaid program, including the start date and, if applicable, the end date. This period information is critical for determining eligibility for claim payments and service authorizations within specific timeframes.
- **Provider Type**: Must specify the type of provider according to Medicaid provider taxonomy, which determines the services they are authorized to provide and the reimbursement rates applicable to their services. This classification is essential for program integrity and appropriate service delivery.
- **Specialty**: Must specify at least one specialty that defines the practitioner's area of expertise and the specific services they are qualified to provide. Multiple specialties can be listed for practitioners who practice in multiple areas, with primary specialty designation when applicable.

##### Must Support Elements:
- `active`: Systems must support the boolean indicator of whether the practitioner role is currently active. This flag affects service eligibility, claim processing, and directory listings, and must be promptly updated when status changes occur.
- `period`: Systems must support the time period during which the practitioner role is or was valid, with precise start and end dates to ensure accurate determination of eligibility for service provision and claims processing during specific time periods.
- `practitioner`: Systems must support the reference to the Medicaid Practitioner profile that this role applies to, maintaining the relationship between the individual provider and their specific role within the Medicaid program.
- `organization`: Systems must support the reference to the Medicaid Organization profile with which the practitioner is affiliated in this role. This establishes the organizational context for the practitioner's services and supports appropriate billing relationships.
- `code` (provider type): Systems must support the codified classification of the provider according to Medicaid provider type taxonomies. This determines service authorization, billing privileges, and reimbursement rates applicable to the provider.
- `specialty`: Systems must support one or more specialties that define the practitioner's areas of expertise, using standard specialty code systems. Primary and secondary specialty designations should be supported to accurately reflect the practitioner's practice areas.
- `location`: Systems must support references to one or more Medicaid Location profiles where the practitioner performs services in this role. This information is essential for network adequacy assessment and member accessibility to services.
- `telecom`: Systems must support contact information specific to the practitioner in this role, which may differ from their personal contact information and be specific to the context of this particular role or practice location.

##### Extensions:
- **Medicaid Enrollment Status**: Current enrollment status extension that captures the provider's standing within the Medicaid program. This includes a coded status value (enrolled, pending, suspended, terminated), the effective date of the status, reason for the current status (when applicable), and any relevant documentation references supporting the status determination.
- **Medicaid Credentialing Status**: Current credentialing status extension that tracks where the provider is in the credentialing or recredentialing workflow. This includes the status code (in progress, credentialed, denied), the date of the status determination, the next review date for recredentialing purposes, and the credentialing entity responsible for the determination.

#### Medicaid Organization

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization`

**Base Profile:** Da Vinci PDex Plan-Net Organization

**Description:** An organization participating in the Medicaid program.

##### Key Requirements:
- **Medicaid ID**: State-specific Medicaid organization identifier (required) that uniquely identifies the organization within the state Medicaid program. This identifier is assigned during the enrollment process and is used for all Medicaid transactions, claims, and administrative communications specific to that state's program.
- **NPI**: National Provider Identifier (optional for organizations) that provides a standard, unique identifier for the organization at the national level. While some organization types may not be eligible for or required to have an NPI, it is strongly recommended for those that are eligible to facilitate cross-program interoperability.
- **TIN**: Tax Identification Number (optional) that identifies the organization for tax purposes. This may be an Employer Identification Number (EIN) or Social Security Number (SSN) for sole proprietorships, and is used for tax reporting and financial transactions.
- **Organization Type**: Must specify the type of organization using standard classification systems to identify whether it is a hospital, group practice, home health agency, pharmacy, or other provider type. This classification determines applicable requirements, services, and reimbursement methodologies.
- **Contact Information**: Phone and address information required to facilitate communication with the organization. This must include primary business phone, fax numbers, email contacts, physical location address, and mailing address if different from the physical location.

##### Must Support Elements:
- `identifier` (Medicaid ID, NPI, TIN): Systems must support multiple identifier types for organizations, including the mandatory state-specific Medicaid ID, the National Provider Identifier when applicable, and the Tax Identification Number. Each identifier must include the appropriate system URI to distinguish the identifier type.
- `active`: Systems must support the boolean indicator of whether the organization is currently active in the Medicaid program. This status affects service eligibility, claim processing, and provider directory listings, and must be promptly updated when changes occur.
- `type`: Systems must support the classification of the organization according to standard healthcare facility/organization type codes. Multiple types may be supported for organizations that serve in multiple capacities (e.g., a hospital that also operates a home health agency).
- `name`: Systems must support the official registered name of the organization as well as any doing-business-as (DBA) names that may be used in different contexts. Historical names should be maintained with appropriate period information when name changes occur.
- `telecom`: Systems must support multiple telecommunication contact points including main phone numbers, department-specific extensions, fax numbers, and email addresses, with appropriate use codes to indicate the purpose of each contact method.
- `address`: Systems must support multiple address types including physical locations, mailing addresses, and billing addresses. Each address must include all components (line, city, state, postal code, country) and be validated for accuracy and completeness.

#### Medicaid Location

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-location`

**Base Profile:** Da Vinci PDex Plan-Net Location

**Description:** A location where Medicaid services are provided.

##### Key Requirements:
- **Managing Organization**: Must reference a Medicaid Organization that is responsible for the administration and operation of this location. This establishes the organizational hierarchy and accountability for services provided at the location, and links the location to the appropriate billing entity.
- **Location Type**: Must specify the type of location using standard facility type codes to indicate whether it is a hospital, clinic, office, pharmacy, laboratory, or other facility type. This classification determines applicable requirements, services, and accessibility standards for the location.
- **Contact Information**: Phone and address information required to enable patients and other providers to contact and locate the facility. This must include the main phone number, fax number, physical street address with all components, and geolocation coordinates when available to support mapping and distance calculations.
- **Hours of Operation**: Operating hours should be specified for each day of the week, including any variations for different services offered at the location. Special scheduling instructions, holiday closures, and after-hours contact procedures should also be documented to facilitate appropriate access to care.

##### Must Support Elements:
- `identifier`: Systems must support location-specific identifiers that may include internal facility codes, state licensing numbers, CMS Certification Numbers (CCN), or other location-specific identification systems used by the Medicaid program or other healthcare entities.
- `status`: Systems must support the operational status of the location (active, suspended, inactive) to indicate whether it is currently providing services. This status affects provider directory listings and service availability information provided to members.
- `name`: Systems must support the public-facing name of the location, which may differ from the parent organization name. This name is used in provider directories and should reflect what patients would recognize when seeking care at this location.
- `type`: Systems must support the classification of the location according to standard healthcare facility type codes. This determines the services that can be provided at the location and the applicable regulatory requirements and standards.
- `telecom`: Systems must support location-specific telecommunication contact points including main reception phone, department-specific extensions, fax numbers, and email addresses, with appropriate use codes to indicate the purpose of each contact method.
- `address`: Systems must support the physical address of the location with all components (line, city, state, postal code, country) and geolocation coordinates when available. Address validation should be performed to ensure accuracy for provider directories and member navigation.
- `managingOrganization`: Systems must support the reference to the Medicaid Organization profile that manages this location. This establishes the organizational context for the location and supports appropriate administrative and billing relationships.

#### Medicaid Healthcare Service

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-healthcare-service`

**Base Profile:** Da Vinci PDex Plan-Net HealthcareService

**Description:** A healthcare service covered by Medicaid.

##### Key Requirements:
- **Provided By**: Must reference a Medicaid Organization that is responsible for delivering and billing for the healthcare service. This establishes accountability for the service and links it to the appropriate enrolled provider organization within the Medicaid program.
- **Service Category**: Must specify the category of service using standard healthcare service categorization codes to broadly classify the service (e.g., primary care, specialty care, inpatient, diagnostic, preventive). This high-level categorization supports service discovery and network adequacy assessment.
- **Service Type**: Must specify the type of service using more granular service type codes to precisely define the specific healthcare services being offered (e.g., cardiology, pediatric dentistry, physical therapy). This detailed classification enables accurate service matching for referrals and member service needs.
- **Location**: Must reference at least one Medicaid Location where the service is provided to establish the physical context for service delivery. Multiple locations may be referenced for services available at multiple facilities, with appropriate scheduling and availability information for each location.

##### Must Support Elements:
- `identifier`: Systems must support service-specific identifiers that may include internal service codes, program-specific service identifiers, or other identification systems used by the Medicaid program to track specific service offerings.
- `active`: Systems must support the boolean indicator of whether the healthcare service is currently being offered. This status affects service availability in provider directories and service authorization systems, and must be promptly updated when changes occur.
- `providedBy`: Systems must support the reference to the Medicaid Organization profile that is responsible for providing this service. This establishes the organizational accountability for the service and supports appropriate billing relationships.
- `category`: Systems must support the high-level categorization of the service using standard healthcare service category codes. This classification facilitates service discovery and supports network adequacy assessment by service category.
- `type`: Systems must support the detailed specification of the service type using standard healthcare service type codes. This granular classification enables precise matching of services to member needs and supports accurate service authorization and referral processes.
- `location`: Systems must support references to one or more Medicaid Location profiles where the service is provided. For each location, availability information should be included to indicate when and how the service can be accessed at that location.
- `name`: Systems must support the public-facing name of the service as it would be presented to members in service directories or benefit descriptions. This should be in patient-friendly language while accurately representing the clinical nature of the service.
- `telecom`: Systems must support service-specific contact information for scheduling, referrals, or service-specific inquiries. This may include dedicated phone lines, scheduling systems, or service-specific email contacts that differ from the general organization or location contact information.

#### Medicaid Endpoint

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-endpoint`

**Base Profile:** Da Vinci PDex Plan-Net Endpoint

**Description:** Technical endpoint for Medicaid data exchange.

##### Key Requirements:
- **Managing Organization**: Must reference a Medicaid Organization that is responsible for maintaining and operating the technical endpoint. This establishes accountability for the endpoint's availability, security, and compliance with interoperability standards required by the Medicaid program.
- **Connection Type**: Must specify the type of connection using standard connection type codes to indicate the protocol or standard being used (e.g., HL7 FHIR, HL7v2, DICOM, XDS). This information is essential for systems attempting to connect to the endpoint to determine compatibility.
- **Payload Type**: Must specify supported payload types to indicate what kind of content can be exchanged through this endpoint (e.g., clinical documents, claims, prior authorizations, referrals). This defines the functional purpose of the endpoint and the business processes it supports.
- **Address**: Must provide the endpoint address as a URL or other appropriate address format based on the connection type. This address is used by connecting systems to establish communication with the endpoint and must be properly formatted according to the requirements of the specified connection type.

##### Must Support Elements:
- `identifier`: Systems must support endpoint-specific identifiers that may include internal system identifiers, directory registration identifiers, or other identification systems used to uniquely identify the endpoint within technical ecosystems.
- `status`: Systems must support the operational status of the endpoint (active, suspended, error, off) to indicate whether it is currently available for use. This status affects system integration capabilities and should be monitored and updated promptly when changes occur.
- `connectionType`: Systems must support the specification of the connection protocol or standard using appropriate terminology. This defines how systems should connect to the endpoint and what standards govern the interaction.
- `name`: Systems must support a human-readable name for the endpoint that describes its purpose or function. This helps administrators and technical staff identify the appropriate endpoint for specific integration needs.
- `managingOrganization`: Systems must support the reference to the Medicaid Organization profile responsible for this endpoint. This establishes organizational accountability for the endpoint's operation and provides contact information for technical support.
- `payloadType`: Systems must support the specification of what content can be exchanged through this endpoint using standard content type codes. Multiple payload types may be supported for endpoints that serve multiple functions.
- `address`: Systems must support the technical address of the endpoint in the appropriate format for the connection type. This must be properly formatted and validated to ensure it can be used by connecting systems to establish communication.

#### Medicaid Verification Result

**Profile URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-verification-result`

**Base Profile:** FHIR R4 VerificationResult

**Description:** Result of verification activities for Medicaid provider credentialing.

##### Key Requirements:
- **Target**: Must reference the practitioner or organization being verified to establish the subject of the verification activity. This creates a direct link between the verification result and the provider entity whose credentials or qualifications are being assessed.
- **Status**: Must specify the verification status using standard verification result codes (e.g., attested, validated, in-process, requires) to indicate the current state of the verification process. This status determines whether the verified information can be relied upon for credentialing decisions.
- **Status Date**: Must specify when the status was determined to establish the timeline of verification activities. This date is critical for determining when re-verification is needed and for tracking the currency of verified information in compliance with credentialing standards.
- **Primary Source**: Should include information about primary sources used for verification, including the organization or authority consulted, the verification method used, the date of verification, and the outcome. This documentation supports the credibility of the verification result and provides an audit trail for credentialing decisions.

##### Must Support Elements:
- `target`: Systems must support the reference to the Practitioner, PractitionerRole, Organization, or other resource that is the subject of the verification. This establishes the entity whose credentials or qualifications are being verified and links the verification result to the appropriate provider record.
- `status`: Systems must support the verification status code that indicates the current state of the verification process. This status drives workflow decisions in the credentialing process and determines whether the verified information meets the standards required for provider participation.
- `statusDate`: Systems must support the date when the verification status was determined. This timestamp is essential for tracking verification currency and determining when re-verification is required according to credentialing program standards.
- `validationType`: Systems must support the type of validation performed using standard validation type codes. This indicates what aspect of the provider's information was verified (e.g., license, education, DEA registration) and helps organize verification results by credential type.
- `primarySource`: Systems must support information about the authoritative source consulted for verification, including the organization name, contact information, verification method, and date. This documentation establishes the credibility of the verification and supports audit requirements for credentialing programs.

### Extensions

#### Medicaid Provider ID

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id`

**Context:** Practitioner

**Description:** State-specific Medicaid provider identifier assigned by a state Medicaid program to uniquely identify the provider within that state's system. This identifier is used for claims processing, service authorization, and administrative communications specific to that state's Medicaid program. The extension includes the state code to support providers who participate in multiple state Medicaid programs and may have different identifiers in each state.

**Data Type:** string

#### Medicaid Enrollment Status

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status`

**Context:** PractitionerRole

**Description:** Current enrollment status in the Medicaid program that indicates the provider's standing and eligibility to provide and bill for services. This status is determined through the enrollment process and may change based on administrative actions, provider requests, or program integrity findings. The extension includes the status code, effective date, reason for the current status (when applicable), and references to supporting documentation or determination notices.

**Data Type:** CodeableConcept

**Value Set:** [Medicaid Enrollment Statuses](ValueSet-medicaid-enrollment-statuses.html)

#### Medicaid Credentialing Status

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status`

**Context:** PractitionerRole

**Description:** Current credentialing status for Medicaid participation that indicates where the provider is in the credentialing or recredentialing workflow. This status tracks the progress of credential verification, committee review, and final determination processes. The extension includes the status code, determination date, next review date for recredentialing purposes, the credentialing entity responsible for the determination, and any applicable credentialing decision notes.

**Data Type:** CodeableConcept

**Value Set:** [Medicaid Credentialing Statuses](ValueSet-medicaid-credentialing-statuses.html)

#### Medicaid Specialty Board Certification

**Extension URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-specialty-board-certification`

**Context:** Practitioner.qualification

**Description:** Board certification information for specialty practice that documents a practitioner's specialized training and expertise as recognized by a medical specialty board. This certification represents additional qualifications beyond basic licensure and may qualify the provider for specific service authorizations or enhanced reimbursement rates for specialty services. The extension captures comprehensive information about the certification to support verification and tracking of specialty credentials.

**Structure:**
- `boardName` (string, required): Name of the certifying board that issued the specialty certification, such as "American Board of Internal Medicine" or "American Board of Pediatrics." This must be the official name of a recognized specialty certification board.
- `certificationDate` (date, optional): Date of certification when the specialty credential was initially awarded to the practitioner. This establishes the beginning of the certification period and may be used to calculate experience in the specialty area.
- `expirationDate` (date, optional): Expiration date of certification when the credential will need to be renewed or recertified. This date is critical for tracking certification currency and ensuring timely recertification to maintain specialty qualifications.
- `certificationNumber` (string, optional): Certification number or identifier assigned by the certifying board that uniquely identifies this credential. This identifier can be used for primary source verification with the certifying board to confirm the certification's validity.

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

- **Validation Rules**: Implement validation rules to ensure data quality by creating comprehensive data validation logic that checks for completeness, consistency, and accuracy of provider data. This includes cross-field validations (e.g., ensuring specialties align with provider types), temporal validations (e.g., ensuring license periods don't have gaps), and relationship validations (e.g., ensuring practitioners are associated with valid organizations).
- **Required Fields**: Enforce required field constraints at the application level by implementing both front-end and back-end validation that prevents submission of incomplete data. Critical fields such as identifiers, names, contact information, and credentials should be validated before data is persisted, with clear error messages to guide users in providing complete information.
- **Format Validation**: Validate data formats (e.g., NPI format, phone number format) using regular expressions and format-specific validation algorithms. NPIs should be validated using the check-digit algorithm, phone numbers should conform to standard formats with appropriate country codes, and addresses should be validated against postal service databases when possible to ensure deliverability.

#### Performance

- **Indexing**: Create appropriate database indexes for frequently queried fields to optimize search performance. This includes creating indexes on identifiers (NPI, Medicaid ID), names, locations (including geospatial indexes for proximity searches), specialties, and enrollment status fields that are commonly used in provider directory searches and credentialing workflows.
- **Caching**: Implement caching strategies for frequently accessed data to reduce database load and improve response times. Provider directory information, which is read frequently but updated relatively infrequently, is an ideal candidate for caching with appropriate cache invalidation strategies when updates occur.
- **Pagination**: Use pagination for large result sets to improve performance and user experience. Provider searches can return large numbers of results, especially in densely populated areas or for common specialties. Implementing cursor-based pagination with configurable page sizes allows for efficient retrieval and display of results without overwhelming the system or the user interface.

#### Security

- **Access Controls**: Implement appropriate access controls for sensitive data using role-based access control (RBAC) and attribute-based access control (ABAC) mechanisms. Different user roles (administrators, credentialing staff, providers, members) should have carefully defined permissions that limit access to sensitive provider information such as Social Security Numbers, dates of birth, and credentialing documentation based on their legitimate need to access this information.
- **Audit Logging**: Log all access to provider information with detailed audit trails that capture who accessed what information, when it was accessed, from what location or system, and for what purpose. These logs should be tamper-resistant, regularly reviewed for suspicious activity, and retained according to regulatory requirements to support compliance and security incident investigations.
- **Data Encryption**: Encrypt sensitive data at rest and in transit using industry-standard encryption algorithms and key management practices. All provider data should be encrypted in the database using column-level or tablespace encryption for sensitive fields, and all API communications should use TLS 1.2 or higher with strong cipher suites to protect data during transmission between systems.

#### Interoperability

- **Standard Identifiers**: Use standard identifier systems (NPI, TIN, etc.) consistently throughout all systems and interfaces. NPIs should be represented with the standard URI `http://hl7.org/fhir/sid/us-npi`, TINs with `http://hl7.org/fhir/sid/us-tin`, and state-specific identifiers with appropriate URIs that include the state code. This consistent identification enables reliable cross-system linking of provider records and supports accurate data exchange between Medicaid agencies, managed care organizations, and other healthcare entities.
