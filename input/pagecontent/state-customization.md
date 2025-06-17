This framework provides guidance for states to customize the Medicaid Provider Credentialing and Enrollment Implementation Guide to meet their specific requirements while maintaining interoperability and compliance with federal regulations.

### Customization Principles

1. **Federal Compliance First**
- All customizations must comply with federal regulations
- Core CMS requirements cannot be modified
- Additional requirements may be added as needed
- State-specific regulations must be accommodated

2. **Interoperability Preservation**
- FHIR R4 base specifications must be maintained
- US Core profiles should be extended, not replaced
- Standard terminologies should be used where possible
- Custom extensions should follow FHIR guidelines

3. **Backward Compatibility**
- Changes should not break existing implementations
- Version management strategies must be employed
- Migration paths must be provided
- Deprecation policies should be established

### Customization Areas

#### Profile Extensions

##### State-Specific Extensions
States may create extensions for:
- Additional provider identifiers
- State-specific licensing requirements
- Local credentialing criteria
- Regional network requirements

##### Example: State Medical License Extension
```fsh
Extension: StateMedicalLicense
Id: state-medical-license
Title: "State Medical License"
Description: "State-specific medical license information"
* ^context.type = #element
* ^context.expression = "Practitioner.qualification"
* extension contains
    licenseNumber 1..1 and
    issuingState 1..1 and
    licenseType 0..1 and
    restrictions 0..*
```

##### Concrete Example: New York Enhanced Verification Extension
```fsh
Extension: NYEnhancedVerification
Id: ny-enhanced-verification
Title: "New York Enhanced Verification"
Description: "New York specific enhanced verification requirements"
* ^context.type = #element
* ^context.expression = "MedicaidVerificationResult"
* extension contains
    nysOPMCVerification 1..1 and
    nysMedicaidFraudCheck 1..1 and
    nysChildAbuseCheck 1..1 and
    nysNarcoticsEnforcementCheck 0..1
* extension[nysOPMCVerification].value[x] only boolean
* extension[nysMedicaidFraudCheck].value[x] only boolean
* extension[nysChildAbuseCheck].value[x] only boolean
* extension[nysNarcoticsEnforcementCheck].value[x] only boolean
```

##### Concrete Example: California Network Adequacy Extension
```fsh
Extension: CaliforniaNetworkAdequacy
Id: california-network-adequacy
Title: "California Network Adequacy"
Description: "California-specific network adequacy requirements"
* ^context.type = #element
* ^context.expression = "MedicaidOrganization"
* extension contains
    timeDriveStandard 1..1 and
    providerRatioStandard 1..1 and
    specialtyAccessStandard 1..1 and
    languageCapacityStandard 1..1
* extension[timeDriveStandard].value[x] only CodeableConcept
* extension[timeDriveStandard].valueCodeableConcept from CATimeDriveStandards (required)
* extension[providerRatioStandard].value[x] only boolean
* extension[specialtyAccessStandard].value[x] only boolean
* extension[languageCapacityStandard].value[x] only boolean
```

#### Value Set Customization

##### State-Specific Code Systems
States may define:
- Local provider types
- State-specific specialties
- Regional service categories
- Custom status codes

##### Example: State Provider Types
```fsh
CodeSystem: StateProviderTypes
Id: state-provider-types
Title: "State Provider Types"
Description: "State-specific provider type codes"
* ^caseSensitive = true
* #rural-health-clinic "Rural Health Clinic"
* #federally-qualified-health-center "Federally Qualified Health Center"
* #critical-access-hospital "Critical Access Hospital"
```

##### Concrete Example: Texas Medicaid Provider Types
```fsh
CodeSystem: TexasMedicaidProviderTypes
Id: texas-medicaid-provider-types
Title: "Texas Medicaid Provider Types"
Description: "Texas-specific Medicaid provider type codes"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/texas-medicaid-provider-types"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #thsteps-provider "Texas Health Steps Provider" "Provider participating in Texas Health Steps program"
* #star-provider "STAR Provider" "Provider participating in STAR managed care program"
* #star-plus-provider "STAR+PLUS Provider" "Provider participating in STAR+PLUS program for aged and disabled"
* #star-kids-provider "STAR Kids Provider" "Provider participating in STAR Kids program for children with disabilities"
* #rural-health-clinic-tx "Texas Rural Health Clinic" "Texas-specific rural health clinic designation"
* #fqhc-tx "Texas FQHC" "Texas-specific federally qualified health center designation"
* #cmhc-tx "Texas CMHC" "Texas-specific community mental health center"
* #ltss-provider "LTSS Provider" "Long-term services and supports provider"
```

##### Concrete Example: Florida Specialty Designations
```fsh
CodeSystem: FloridaMedicaidSpecialties
Id: florida-medicaid-specialties
Title: "Florida Medicaid Specialties"
Description: "Florida-specific Medicaid specialty designations"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/florida-medicaid-specialties"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #early-intervention "Early Intervention Provider" "Provider specializing in early intervention services"
* #medical-foster-care "Medical Foster Care Provider" "Provider of medical foster care services"
* #prescribed-pediatric-care "Prescribed Pediatric Extended Care Provider" "PPEC provider"
* #behavior-analysis "Behavior Analysis Provider" "Provider of behavior analysis services"
* #statewide-inpatient-psychiatric "Statewide Inpatient Psychiatric Provider" "SIPP provider"
* #childrens-medical-services "Children's Medical Services Provider" "CMS provider"
* #managed-medical-assistance "Managed Medical Assistance Provider" "MMA provider"
* #long-term-care "Long-term Care Provider" "LTC provider"
```

#### Workflow Customizations

##### State-Specific Processes
- Additional verification steps
- Enhanced screening requirements
- Custom approval workflows
- State-specific documentation

##### Credentialing Workflow Example
1. **Initial Application**
   - Standard FHIR Practitioner resource
   - State-specific extensions for additional data
   - Custom verification requirements

2. **Enhanced Screening**
   - Additional background checks
   - State-specific database queries
   - Local reference verification

3. **Approval Process**
   - State medical board verification
   - Local credentialing committee review
   - Custom approval criteria

##### Concrete Example: Michigan Medicaid Credentialing Workflow
1. **Initial Application**
   - Standard FHIR Practitioner resource with Michigan-specific extensions
   - Michigan provider enrollment system (CHAMPS) integration
   - Michigan-specific provider type categorization
   
   ```json
   {
     "resourceType": "Practitioner",
     "id": "michigan-practitioner-example",
     "extension": [
       {
         "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/michigan-provider-id",
         "valueString": "MI7654321"
       }
     ],
     "identifier": [
       {
         "system": "http://hl7.org/fhir/sid/us-npi",
         "value": "1234567890"
       },
       {
         "system": "http://michigan.gov/medicaid/provider",
         "value": "MI7654321"
       }
     ],
     "name": [
       {
         "family": "Smith",
         "given": ["John", "A"]
       }
     ],
     "qualification": [
       {
         "code": {
           "coding": [
             {
               "system": "http://michigan.gov/provider-qualification",
               "code": "mi-medical-license",
               "display": "Michigan Medical License"
             }
           ]
         },
         "identifier": {
           "system": "http://michigan.gov/medical-license",
           "value": "MILMD12345"
         },
         "period": {
           "start": "2020-01-01",
           "end": "2025-12-31"
         }
       }
     ]
   }
   ```

2. **Michigan-Specific Verification**
   - Michigan Automated Prescription System (MAPS) check
   - Michigan Department of Licensing and Regulatory Affairs (LARA) verification
   - Michigan Medicaid Sanctions database check
   
   ```json
   {
     "resourceType": "MedicaidVerificationResult",
     "id": "michigan-verification-example",
     "extension": [
       {
         "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/michigan-maps-check",
         "extension": [
           {
             "url": "verificationDate",
             "valueDate": "2023-06-15"
           },
           {
             "url": "verificationResult",
             "valueBoolean": true
           }
         ]
       }
     ],
     "status": "validated",
     "target": [
       {
         "reference": "Practitioner/michigan-practitioner-example"
       }
     ],
     "primarySource": [
       {
         "who": {
           "display": "Michigan Department of Licensing and Regulatory Affairs"
         },
         "type": [
           {
             "coding": [
               {
                 "system": "http://terminology.hl7.org/CodeSystem/validation-type",
                 "code": "primarysource",
                 "display": "Primary Source"
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
         },
         "validationDate": "2023-06-15"
       }
     ]
   }
   ```

3. **Michigan Approval Process**
   - Michigan Medicaid Provider Enrollment Committee review
   - Michigan-specific risk level assignment
   - Michigan Community Health Automated Medicaid Processing System (CHAMPS) registration
   
   ```json
   {
     "resourceType": "MedicaidPractitionerRole",
     "id": "michigan-practitioner-role-example",
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
         "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/michigan-risk-level",
         "valueCodeableConcept": {
           "coding": [
             {
               "system": "http://michigan.gov/medicaid/risk-level",
               "code": "moderate",
               "display": "Moderate Risk"
             }
           ]
         }
       }
     ],
     "practitioner": {
       "reference": "Practitioner/michigan-practitioner-example"
     },
     "organization": {
       "reference": "Organization/michigan-organization-example"
     },
     "code": [
       {
         "coding": [
           {
             "system": "http://michigan.gov/medicaid/provider-types",
             "code": "primary-care-physician",
             "display": "Primary Care Physician"
           }
         ]
       }
     ],
     "specialty": [
       {
         "coding": [
           {
             "system": "http://nucc.org/provider-taxonomy",
             "code": "207Q00000X",
             "display": "Family Medicine"
           }
         ]
       }
     ],
     "location": [
       {
         "reference": "Location/michigan-location-example"
       }
     ]
   }
   ```

#### Data Element Customizations

##### Required vs. Optional Elements
States may:
- Make optional elements required
- Add new required elements
- Define state-specific constraints
- Implement additional validation rules

##### Example: Enhanced Address Requirements
```fsh
Profile: StateEnhancedPractitioner
Parent: MedicaidPractitioner
Id: state-enhanced-practitioner
* address 1..*
* address.line 1..*
* address.city 1..1
* address.state 1..1
* address.postalCode 1..1
* address.country 1..1
```

##### Concrete Example: Minnesota Enhanced Practitioner Profile
```fsh
Profile: MinnesotaEnhancedPractitioner
Parent: MedicaidPractitioner
Id: minnesota-enhanced-practitioner
Title: "Minnesota Enhanced Practitioner"
Description: "Minnesota-specific enhanced practitioner profile with additional requirements"
* ^status = #active
* extension contains
    MinnesotaHealthServicesID named mnhsid 1..1 and
    MinnesotaTribalAffiliation named tribalAffiliation 0..1 and
    MinnesotaRuralProviderStatus named ruralProviderStatus 0..1
* identifier 2..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    npi 1..1 and
    mnMedicaidId 1..1
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi" (exactly)
* identifier[mnMedicaidId].system = "http://minnesota.gov/medicaid/provider" (exactly)
* name 1..*
* name.family 1..1
* name.given 1..*
* telecom 2..*
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains
    phone 1..1 and
    email 1..1
* telecom[phone].system = #phone (exactly)
* telecom[email].system = #email (exactly)
* address 1..*
* address.line 1..*
* address.city 1..1
* address.state 1..1
* address.postalCode 1..1
* address.country 1..1
* qualification 1..*
* qualification.extension contains
    MinnesotaLicenseVerification named mnLicenseVerification 1..1
```

##### Concrete Example: Oregon Medicaid Organization Profile
```fsh
Profile: OregonMedicaidOrganization
Parent: MedicaidOrganization
Id: oregon-medicaid-organization
Title: "Oregon Medicaid Organization"
Description: "Oregon-specific Medicaid organization profile with CCO requirements"
* ^status = #active
* extension contains
    OregonCCODesignation named ccoCertification 0..1 and
    OregonTribalStatus named tribalStatus 0..1 and
    OregonRuralHealthStatus named ruralHealthStatus 0..1
* identifier 2..*
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    npi 1..1 and
    orMedicaidId 1..1 and
    orTaxId 1..1
* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi" (exactly)
* identifier[orMedicaidId].system = "http://oregon.gov/medicaid/provider" (exactly)
* identifier[orTaxId].system = "urn:oid:2.16.840.1.113883.4.4" (exactly)
* active 1..1
* type 1..*
* type from OregonProviderOrganizationTypes (extensible)
* name 1..1
* telecom 2..*
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains
    phone 1..1 and
    email 1..1
* telecom[phone].system = #phone (exactly)
* telecom[email].system = #email (exactly)
* address 1..*
* address.line 1..*
* address.city 1..1
* address.state 1..1
* address.postalCode 1..1
* address.country 1..1
* contact 1..*
* contact.name 1..1
* contact.telecom 1..*
```

### Implementation Strategies

#### Layered Approach

##### Layer 1: Federal Base
- Core FHIR R4 specifications
- US Core profiles
- Federal regulatory requirements
- CMS mandated elements

##### Layer 2: State Additions
- State-specific extensions
- Additional value sets
- Enhanced constraints
- Local requirements

##### Layer 3: Local Customizations
- Regional variations
- Local policy implementations
- Organizational preferences
- Pilot program features

#### Configuration Management

##### Environment-Specific Configurations
- Development environment settings
- Testing environment parameters
- Production environment constraints
- Disaster recovery configurations

##### Feature Flags
- Enable/disable state-specific features
- Gradual rollout capabilities
- A/B testing support
- Emergency rollback options

### Technical Implementation

#### Extension Development

##### Best Practices
- Use descriptive extension names
- Provide comprehensive documentation
- Include usage examples
- Implement proper validation

##### Extension Registry
- Maintain central registry of extensions
- Version control for extensions
- Impact analysis for changes
- Reusability assessment

#### Profile Derivation

##### Inheritance Hierarchy
```
FHIR Base Resource
  ↓
US Core Profile
  ↓
Medicaid Base Profile
  ↓
State-Specific Profile
  ↓
Local Implementation Profile
```

##### Constraint Application
- Cardinality restrictions
- Value set bindings
- Data type constraints
- Business rule validation

#### API Customization

##### Endpoint Extensions
- State-specific search parameters
- Custom operation definitions
- Enhanced query capabilities
- Specialized workflows

##### Example: State Provider Search
```
GET /Practitioner?state-license=IL123456
GET /Practitioner?credentialing-status=pending
GET /Organization?network-region=chicago
```

### Governance Framework

#### Change Management

##### Change Request Process
1. **Requirement Identification**
   - Business need assessment
   - Regulatory requirement analysis
   - Stakeholder impact evaluation

2. **Technical Analysis**
   - FHIR compliance review
   - Interoperability impact assessment
   - Implementation complexity analysis

3. **Approval Workflow**
   - Technical review committee
   - Business stakeholder approval
   - Regulatory compliance verification

4. **Implementation Planning**
   - Development timeline
   - Testing strategy
   - Deployment approach
   - Training requirements

#### Version Management

##### Versioning Strategy
- Semantic versioning (Major.Minor.Patch)
- Backward compatibility maintenance
- Deprecation timeline management
- Migration support provision

##### Release Management
- Scheduled release cycles
- Emergency patch procedures
- Rollback capabilities
- Communication protocols

### Testing and Validation

#### Conformance Testing

##### Profile Validation
- FHIR validator integration
- Custom constraint testing
- Business rule validation
- Cross-profile consistency

##### Interoperability Testing
- Multi-state data exchange
- Federal reporting compliance
- Third-party system integration
- Performance impact assessment

#### User Acceptance Testing

##### State-Specific Scenarios
- Local workflow validation
- User interface customization
- Performance requirement verification
- Security compliance testing

### Documentation Requirements

#### Technical Documentation

##### Profile Documentation
- Detailed profile descriptions
- Usage examples and scenarios
- Implementation guidance
- Known limitations and constraints

##### API Documentation
- Endpoint specifications
- Request/response examples
- Error handling procedures
- Rate limiting policies

#### User Documentation

##### Implementation Guides
- Step-by-step setup instructions
- Configuration parameter descriptions
- Troubleshooting procedures
- Best practice recommendations

##### Training Materials
- User training guides
- Administrator documentation
- Developer resources
- Video tutorials and demos

### Support and Maintenance

#### Ongoing Support

##### Technical Support
- Help desk services
- Bug reporting procedures
- Enhancement request process
- Community support forums

##### Maintenance Activities
- Regular updates and patches
- Security vulnerability management
- Performance optimization
- Capacity planning

#### Community Engagement

##### State Collaboration
- Best practice sharing
- Common challenge discussion
- Joint development initiatives
- Resource pooling opportunities

##### Vendor Ecosystem
- Vendor certification programs
- Integration testing support
- Reference implementation provision
