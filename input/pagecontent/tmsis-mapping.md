# TMSIS to FHIR Data Element Mapping

## Overview

This section provides detailed mapping between Transformed Medicaid Statistical Information System (TMSIS) data elements and FHIR resources for provider credentialing and enrollment. These mappings facilitate data exchange and interoperability between state Medicaid systems and FHIR-based implementations.

## TMSIS Provider File (PRV) Mappings

### Provider Demographics

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| SUBMTG_STATE_CD | Practitioner | identifier.system | State identifier system |
| PROV_IDENTIFIER | Practitioner | identifier.value | State-assigned provider ID |
| NPI | Practitioner | identifier[npi].value | National Provider Identifier |
| PROV_FIRST_NAME | Practitioner | name.given | Provider first name |
| PROV_MIDDLE_NAME | Practitioner | name.given | Provider middle name |
| PROV_LAST_NAME | Practitioner | name.family | Provider last name |
| PROV_ORG_NAME | Organization | name | Organization name |
| PROV_DOING_BUS_AS_NAME | Organization | alias | DBA name |
| PROV_TAX_ID | Organization | identifier[tin].value | Tax identification number |

### Provider Address Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| PROV_ADR_TYPE_CD | Practitioner/Organization | address.use | Address type (home, work, etc.) |
| PROV_ADR_LN1_TXT | Practitioner/Organization | address.line[0] | Address line 1 |
| PROV_ADR_LN2_TXT | Practitioner/Organization | address.line[1] | Address line 2 |
| PROV_ADR_CITY_NAME | Practitioner/Organization | address.city | City name |
| PROV_ADR_STATE_CD | Practitioner/Organization | address.state | State code |
| PROV_ADR_ZIP_CD | Practitioner/Organization | address.postalCode | ZIP code |
| PROV_ADR_CNTY_CD | Practitioner/Organization | address.district | County code |

### Provider Contact Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| PROV_PHONE_NUM | Practitioner/Organization | telecom[phone].value | Phone number |
| PROV_FAX_NUM | Practitioner/Organization | telecom[fax].value | Fax number |
| PROV_EMAIL_ADR | Practitioner/Organization | telecom[email].value | Email address |

### Provider Enrollment Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| PROV_ENRLMT_TYPE_CD | PractitionerRole | extension[enrollmentStatus] | Enrollment type |
| PROV_ENRLMT_STUS_CD | PractitionerRole | extension[enrollmentStatus] | Enrollment status |
| PROV_ENRLMT_EFF_DT | PractitionerRole | period.start | Enrollment effective date |
| PROV_ENRLMT_END_DT | PractitionerRole | period.end | Enrollment end date |
| PROV_ENRLMT_STUS_DT | PractitionerRole | extension[enrollmentStatus].valueCodeableConcept.extension[statusDate] | Status date |

### Provider Specialty Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| PROV_SPCLTY_CD | PractitionerRole | specialty.coding.code | Provider specialty code |
| PROV_SPCLTY_CD_SYS | PractitionerRole | specialty.coding.system | Specialty code system |
| PROV_SPCLTY_DESC | PractitionerRole | specialty.coding.display | Specialty description |

### Provider License Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| LIC_NUM | Practitioner | qualification.identifier.value | License number |
| LIC_TYPE_CD | Practitioner | qualification.code.coding.code | License type code |
| LIC_ISSG_STATE_CD | Practitioner | qualification.issuer.identifier.value | Issuing state |
| LIC_EFF_DT | Practitioner | qualification.period.start | License effective date |
| LIC_END_DT | Practitioner | qualification.period.end | License expiration date |

## TMSIS Provider Location File (PLO) Mappings

### Location Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| SUBMTG_STATE_CD | Location | identifier.system | State identifier system |
| PROV_IDENTIFIER | Location | managingOrganization.identifier | Provider identifier |
| PROV_LOC_ID | Location | identifier.value | Location identifier |
| PROV_LOC_ADR_TYPE_CD | Location | type.coding.code | Location address type |
| PROV_LOC_ADR_LN1_TXT | Location | address.line[0] | Location address line 1 |
| PROV_LOC_ADR_LN2_TXT | Location | address.line[1] | Location address line 2 |
| PROV_LOC_CITY_NAME | Location | address.city | Location city |
| PROV_LOC_STATE_CD | Location | address.state | Location state |
| PROV_LOC_ZIP_CD | Location | address.postalCode | Location ZIP code |

### Service Location Details

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| PROV_LOC_PHONE_NUM | Location | telecom[phone].value | Location phone |
| PROV_LOC_FAX_NUM | Location | telecom[fax].value | Location fax |
| PROV_LOC_EMAIL_ADR | Location | telecom[email].value | Location email |
| PROV_LOC_WEB_ADR | Location | telecom[url].value | Location website |

## TMSIS Provider Affiliated Group File (PAG) Mappings

### Group Affiliation Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| SUBMTG_STATE_CD | Organization | identifier.system | State identifier system |
| PROV_IDENTIFIER | PractitionerRole | practitioner.identifier | Provider identifier |
| AFLTD_GRP_NUM | Organization | identifier.value | Affiliated group number |
| AFLTD_GRP_NAME | Organization | name | Affiliated group name |
| AFLTD_GRP_NPI | Organization | identifier[npi].value | Group NPI |
| AFLTD_GRP_TAX_ID | Organization | identifier[tin].value | Group tax ID |

### Affiliation Details

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| AFLTD_EFF_DT | PractitionerRole | period.start | Affiliation effective date |
| AFLTD_END_DT | PractitionerRole | period.end | Affiliation end date |
| AFLTD_TYPE_CD | PractitionerRole | code.coding.code | Affiliation type |

## TMSIS Provider Taxonomy File (PTX) Mappings

### Taxonomy Information

| TMSIS Element | FHIR Resource | FHIR Element | Notes |
|---------------|---------------|--------------|-------|
| SUBMTG_STATE_CD | PractitionerRole | identifier.system | State identifier system |
| PROV_IDENTIFIER | PractitionerRole | practitioner.identifier | Provider identifier |
| TXNMY_CD | PractitionerRole | specialty.coding.code | Taxonomy code |
| TXNMY_CD_SYS | PractitionerRole | specialty.coding.system | Taxonomy code system |
| TXNMY_DESC | PractitionerRole | specialty.coding.display | Taxonomy description |
| PRMRY_TXNMY_IND | PractitionerRole | specialty.extension[primary] | Primary taxonomy indicator |

## Data Transformation Guidelines

### Data Type Conversions

#### Date Fields
- **TMSIS Format**: YYYY-MM-DD
- **FHIR Format**: date (YYYY-MM-DD)
- **Transformation**: Direct mapping, validate format

#### Code Fields
- **TMSIS Format**: State-specific codes
- **FHIR Format**: CodeableConcept with system and code
- **Transformation**: Map to appropriate code system

#### Identifier Fields
- **TMSIS Format**: String values
- **FHIR Format**: Identifier with system and value
- **Transformation**: Add appropriate system URI

### Data Quality Considerations

#### Required Field Validation
- Ensure all required FHIR elements are populated
- Validate data formats and ranges
- Check for missing or invalid values
- Implement business rule validation

#### Data Standardization
- Standardize name formats (proper case)
- Validate and format addresses
- Normalize phone numbers and email addresses
- Standardize code values

### Mapping Implementation

#### ETL Process Flow
1. **Extract**: Retrieve data from TMSIS files
2. **Transform**: Apply mapping rules and validations
3. **Load**: Create FHIR resources and validate
4. **Verify**: Confirm data integrity and completeness

#### Error Handling
- Log transformation errors and warnings
- Implement data quality reports
- Provide error correction workflows
- Maintain audit trails

## State-Specific Considerations

### Code System Mappings

#### Provider Type Codes
States may need to map local provider type codes to standard FHIR value sets:
- Map state codes to NUCC taxonomy codes
- Create custom code systems for state-specific types
- Maintain crosswalk tables for code translations

#### Specialty Codes
- Map state specialty codes to standard taxonomies
- Use NUCC taxonomy codes where possible
- Create extensions for state-specific specialties

#### Status Codes
- Map enrollment status codes to standard value sets
- Define state-specific status codes as needed
- Maintain consistent status definitions

### Data Extensions

#### State-Specific Data Elements
States may need to create extensions for data not covered by base FHIR:
- Additional identifier types
- State-specific enrollment information
- Local regulatory requirements
- Custom verification data

## Implementation Examples

### Provider Transformation Example

```json
{
  "resourceType": "Practitioner",
  "id": "example-provider",
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    },
    {
      "system": "http://medicaid.state.gov/provider-id",
      "value": "PROV123456"
    }
  ],
  "name": [
    {
      "family": "Smith",
      "given": ["John", "Michael"]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "555-123-4567",
      "use": "work"
    }
  ],
  "address": [
    {
      "line": ["123 Main Street"],
      "city": "Springfield",
      "state": "IL",
      "postalCode": "62701"
    }
  ]
}
```

### Organization Transformation Example

```json
{
  "resourceType": "Organization",
  "id": "example-organization",
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    },
    {
      "system": "http://terminology.hl7.org/NamingSystem/USEIN",
      "value": "12-3456789"
    }
  ],
  "name": "Springfield Medical Center",
  "telecom": [
    {
      "system": "phone",
      "value": "555-987-6543",
      "use": "work"
    }
  ],
  "address": [
    {
      "line": ["456 Hospital Drive"],
      "city": "Springfield",
      "state": "IL",
      "postalCode": "62701"
    }
  ]
}
```

## Validation and Testing

### Data Validation Rules
- Validate FHIR resource conformance
- Check business rule compliance
- Verify data completeness and accuracy
- Test transformation logic

### Testing Strategies
- Unit testing for individual mappings
- Integration testing for complete workflows
- Performance testing for large datasets
- User acceptance testing with state stakeholders

## Maintenance and Updates

### Ongoing Maintenance
- Monitor TMSIS file format changes
- Update mappings for new data elements
- Maintain code system crosswalks
- Provide technical support

### Version Management
- Track mapping version changes
- Maintain backward compatibility
- Document mapping updates
- Coordinate with state implementations
