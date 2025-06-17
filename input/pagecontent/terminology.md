This page provides guidance on terminology binding strengths used in this Implementation Guide and how to handle extensions to value sets.

> **Note:** This implementation guide references standard terminologies and code systems maintained by various organizations. Links to official resources are provided throughout this document.

### Binding Strength Definitions

This IG uses the following binding strengths as defined by [FHIR Terminology](https://www.hl7.org/fhir/terminologies.html):

#### Required Binding (Conformance Level: SHALL)

A required binding means that implementations **SHALL** use a code from the specified value set.

- **Definition**: Implementations **SHALL** use a code from the specified value set.
- **Validation**: Instance data **SHALL** contain a code from the value set.
- **Example**: `MedicaidEnrollmentStatuses` and `MedicaidCredentialingStatuses` are required bindings in this IG.
- **Reference**: [FHIR Binding Strengths](https://www.hl7.org/fhir/terminologies.html#strength)

#### Extensible Binding (Conformance Level: SHOULD)

An extensible binding means that implementations **SHOULD** use a code from the specified value set if a suitable code exists, but **MAY** use another code if a suitable code does not exist in the value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set if a suitable code exists.
- **Validation**: Instance data **SHOULD** contain a code from the value set if a suitable code exists.
- **Extension Rules**: If a suitable code does not exist in the value set, implementations **MAY** use another code, following these rules:
  1. First, check if the concept exists in a standard terminology (e.g., [SNOMED CT](https://www.snomed.org/), [LOINC](https://loinc.org/)).
  2. If using a code outside the value set, document the reason and the source of the alternative code.
  3. Consider submitting the concept for inclusion in future versions of the value set.

- **Example**: `MedicaidProviderTypes`, `MedicaidSpecialtyCodes`, and standard FHIR value sets like `service-category` are extensible bindings in this IG.
- **Reference**: [FHIR Extensible Binding](https://www.hl7.org/fhir/terminologies.html#extensible)

#### Preferred Binding (Conformance Level: SHOULD)

A preferred binding means that implementations **SHOULD** use a code from the specified value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set.
- **Validation**: Instance data **SHOULD** contain a code from the value set.
- **Note**: This IG does not currently use preferred bindings.

#### Example Binding (Conformance Level: MAY)

An example binding means that implementations **MAY** use a code from the specified value set.

- **Definition**: The value set is provided as an example only.
- **Validation**: Instance data **MAY** contain a code from the value set.
- **Note**: This IG does not currently use example bindings.

### Value Set Binding Table

The following table summarizes the binding strengths for value sets used in this IG:

| Value Set | Binding Strength | Used In | Extension Guidance |
|-----------|------------------|---------|-------------------|
| MedicaidEnrollmentStatuses | Required | MedicaidEnrollmentStatusExtension | No extensions allowed. Must use codes from this value set. |
| MedicaidCredentialingStatuses | Required | MedicaidCredentialingStatusExtension | No extensions allowed. Must use codes from this value set. |
| MedicaidProviderTypes | Extensible | MedicaidPractitionerRole.code | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| MedicaidSpecialtyCodes | Extensible | MedicaidPractitionerRole.specialty, MedicaidHealthcareService.specialty | May use codes outside this value set if no suitable code exists. Prefer [NUCC taxonomy codes](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40) when available. |
| MedicaidVerificationStatuses | Extensible | Not directly bound | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| MedicaidQualificationTypes | Extensible | Not directly bound | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| [service-category](https://www.hl7.org/fhir/valueset-service-category.html) (FHIR core) | Extensible | MedicaidHealthcareService.category | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| [service-type](https://www.hl7.org/fhir/valueset-service-type.html) (FHIR core) | Extensible | MedicaidHealthcareService.type | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| [endpoint-connection-type](https://www.hl7.org/fhir/valueset-endpoint-connection-type.html) (FHIR core) | Extensible | MedicaidEndpoint.connectionType | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| [endpoint-payload-type](https://www.hl7.org/fhir/valueset-endpoint-payload-type.html) (FHIR core) | Extensible | MedicaidEndpoint.payloadType | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |

### Extension Rules for Extensible Value Sets

When using extensible value sets in this IG, follow these guidelines:

1. **First, check the bound value set**: Always check if a suitable code exists in the specified value set.

2. **If no suitable code exists**:
   - For provider types and specialties, check the full [NUCC taxonomy](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40).
   - For service categories and types, check the full [FHIR value sets](https://www.hl7.org/fhir/terminologies-valuesets.html).
   - For verification statuses, consider standard workflow status values.

3. **Document extensions**:
   - When using a code outside the specified value set, document:
     - The code system and code used
     - The reason why a code from the specified value set was not suitable
     - The source of the alternative code

4. **Feedback mechanism**:
   - If you frequently need to use codes outside the specified value sets, consider submitting feedback to the IG maintainers for potential inclusion in future versions.

### State-Specific Terminology

States implementing this IG will need to handle state-specific terminology requirements. This section provides comprehensive guidance on creating and managing state-specific code systems and value sets.

#### State-Specific Code Systems

States should create formal code systems for state-specific concepts that cannot be represented using standard terminologies. These code systems should follow FHIR best practices and be properly documented.

##### Code System Naming Conventions

- **URI Pattern**: `http://medicaid.[state].gov/fhir/CodeSystem/[name]`
- **ID Pattern**: `[state]-[concept]-codes`
- **Title Pattern**: `[State] [Concept] Codes`

##### Code System Documentation Requirements

- Formal definition in FSH format
- Clear descriptions for the code system and each code
- Version information
- Maintenance process documentation

##### Example: California Provider Type Code System

```fsh
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
```

##### Example: New York Credentialing Status Code System

```fsh
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
```

#### State-Specific Value Sets

States should create formal value sets that combine standard codes with state-specific codes when needed. These value sets should follow FHIR best practices and be properly documented.

##### Value Set Naming Conventions

- **URI Pattern**: `http://medicaid.[state].gov/fhir/ValueSet/[name]`
- **ID Pattern**: `[state]-[concept]`
- **Title Pattern**: `[State] [Concept]`

##### Value Set Documentation Requirements

- Formal definition in FSH format
- Clear description of the value set purpose
- Documentation of included code systems
- Binding strength recommendations

##### Example: Texas Medicaid Provider Types Value Set

```fsh
ValueSet: TexasMedicaidProviderTypes
Id: texas-medicaid-provider-types
Title: "Texas Medicaid Provider Types"
Description: "Provider types recognized by Texas Medicaid"
* ^url = "http://medicaid.tx.gov/fhir/ValueSet/texas-medicaid-provider-types"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept descends from #1 "Provider Type"
* include codes from system http://medicaid.tx.gov/fhir/CodeSystem/texas-provider-types
```

##### Example: Florida Medicaid Specialty Value Set

```fsh
ValueSet: FloridaMedicaidSpecialties
Id: florida-medicaid-specialties
Title: "Florida Medicaid Specialties"
Description: "Specialty codes recognized by Florida Medicaid"
* ^url = "http://medicaid.fl.gov/fhir/ValueSet/florida-medicaid-specialties"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept descends from #2 "Specialty"
* include codes from system http://medicaid.fl.gov/fhir/CodeSystem/florida-specialty-codes
```

#### Implementation Patterns for State-Specific Terminology

##### Pattern 1: State Extension of Standard Value Sets

This pattern extends standard value sets with state-specific codes:

```fsh
ValueSet: MichiganProviderTypes
Id: michigan-provider-types
Title: "Michigan Provider Types"
Description: "Provider types recognized by Michigan Medicaid"
* ^url = "http://medicaid.mi.gov/fhir/ValueSet/michigan-provider-types"
* ^status = #active
* include codes from valueset http://hl7.org/fhir/us/medicaid-provider-credentialing/ValueSet/medicaid-provider-types
* include codes from system http://medicaid.mi.gov/fhir/CodeSystem/michigan-provider-types
```

##### Pattern 2: State Subset of Standard Value Sets

This pattern creates a subset of standard value sets for state use:

```fsh
ValueSet: OregonProviderSpecialties
Id: oregon-provider-specialties
Title: "Oregon Provider Specialties"
Description: "Provider specialties recognized by Oregon Medicaid"
* ^url = "http://medicaid.or.gov/fhir/ValueSet/oregon-provider-specialties"
* ^status = #active
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #207Q00000X "Family Medicine"
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #207R00000X "Internal Medicine"
* include codes from system http://nucc.org/provider-taxonomy where concept is-a #208000000X "Pediatrics"
```

##### Pattern 3: State Mapping to Standard Codes

This pattern maps state-specific codes to standard codes:

```fsh
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
```

#### State-Specific Terminology Governance

##### Documentation Requirements

States must document any state-specific terminology in their implementation guides:

1. **Code System Documentation**:
   - Complete FSH definitions for all code systems
   - Clear descriptions for each code
   - Maintenance and versioning processes

2. **Value Set Documentation**:
   - Complete FSH definitions for all value sets
   - Binding strength recommendations
   - Usage context and constraints

3. **Mapping Documentation**:
   - ConceptMap resources for mappings to standard codes
   - Equivalence documentation
   - Usage guidance for implementers

##### Terminology Server Requirements

States should consider providing terminology services:

1. **FHIR Terminology Server**:
   - Hosting state-specific code systems and value sets
   - Supporting standard FHIR terminology operations
   - Providing value set expansion capabilities

2. **Terminology Distribution**:
   - Regular publication of terminology updates
   - Change logs for terminology changes
   - Versioning strategy for terminology artifacts

#### Examples of State-Specific Terminology Use Cases

##### Use Case 1: State Provider Enrollment System

A state Medicaid provider enrollment system needs to capture state-specific provider types:

```json
{
  "resourceType": "PractitionerRole",
  "id": "example-ca-provider-role",
  "practitioner": {
    "reference": "Practitioner/example-practitioner"
  },
  "organization": {
    "reference": "Organization/example-organization"
  },
  "code": [
    {
      "coding": [
        {
          "system": "http://medicaid.ca.gov/fhir/CodeSystem/california-provider-types",
          "code": "chcf",
          "display": "Community Health Center (Federally Qualified)"
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
  ]
}
```

##### Use Case 2: State-Specific Credentialing Status

A state Medicaid system needs to track state-specific credentialing statuses:

```json
{
  "resourceType": "PractitionerRole",
  "id": "example-ny-provider-role",
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://medicaid.ny.gov/fhir/CodeSystem/new-york-credentialing-status",
            "code": "pending-opmc",
            "display": "Pending OPMC Verification"
          }
        ]
      }
    }
  ],
  "practitioner": {
    "reference": "Practitioner/example-practitioner"
  }
}
```

### Implementation Considerations

When implementing systems that use these value sets, consider the following:

1. **Validation**: Implement validation rules according to the binding strength.
   - For required bindings, reject instance data with codes outside the value set.
   - For extensible bindings, warn about codes outside the value set but do not reject.

2. **Display**: Ensure systems can display both standard codes and extended codes.
   - Include display text for all codes.
   - Consider including the source of the code (e.g., "NUCC", "State-specific").

3. **Interoperability**: Consider how extended codes will affect interoperability.
   - Document extensions in implementation guides.
   - Consider mapping to standard codes when exchanging data with external systems.

4. **Versioning**: Be aware of value set versioning.
   - Document which version of each value set is being used.
   - Consider how to handle value set updates.

### Standard Terminology Resources

This implementation guide references the following standard terminology resources:

#### Code Systems

- [SNOMED CT](https://www.snomed.org/) - Systematized Nomenclature of Medicine Clinical Terms
- [LOINC](https://loinc.org/) - Logical Observation Identifiers Names and Codes
- [NUCC Taxonomy](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40) - National Uniform Claim Committee Provider Taxonomy
- [CPT](https://www.ama-assn.org/practice-management/cpt) - Current Procedural Terminology
- [ICD-10](https://www.cdc.gov/nchs/icd/icd10.htm) - International Classification of Diseases, 10th Revision
- [HCPCS](https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo) - Healthcare Common Procedure Coding System

#### Value Set Resources

- [FHIR Terminology Service](https://terminology.hl7.org/) - HL7 FHIR Terminology Service
- [Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/) - National Library of Medicine Value Set Authority Center
- [CMS Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/valueset/expansions?pr=cms) - CMS-specific value sets

#### Medicaid-Specific Resources

- [T-MSIS Coding Blog](https://www.medicaid.gov/medicaid/data-systems/macbis/transformed-medicaid-statistical-information-system-t-msis/t-msis-coding-blog/index.html) - Transformed Medicaid Statistical Information System Coding Blog
- [CMS Medicaid Data](https://www.medicaid.gov/medicaid/data-systems/index.html) - Medicaid Data Systems information
- [Medicaid Provider Enrollment Compendium (MPEC)](https://www.medicaid.gov/medicaid/program-integrity/affordable-care-act-program-integrity-provisions/index.html) - Guidance on Medicaid provider enrollment
