This page documents the search parameters defined in this implementation guide for querying Medicaid provider credentialing and enrollment resources. These search parameters enable efficient retrieval of provider information for various use cases.

### Defined Search Parameters

The following search parameters are defined in this implementation guide:

#### Practitioner Search Parameters

| Name | Type | Description | Expression |
|------|------|-------------|------------|
| [medicaid-provider-id](SearchParameter-MedicaidProviderIdSearchParameter.html) | string | Search for practitioners by their state-specific Medicaid provider identifier | `Practitioner.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-provider-id').value` |
| [address-city](SearchParameter-MedicaidProviderAddressCitySearchParameter.html) | string | Search for practitioners by city | `Practitioner.address.city \| PractitionerRole.practitioner.resolve().address.city` |
| [address-state](SearchParameter-MedicaidProviderAddressStateSearchParameter.html) | string | Search for practitioners by state | `Practitioner.address.state \| PractitionerRole.practitioner.resolve().address.state` |
| [address-postalcode](SearchParameter-MedicaidProviderAddressPostalCodeSearchParameter.html) | string | Search for practitioners by postal code | `Practitioner.address.postalCode \| PractitionerRole.practitioner.resolve().address.postalCode` |
| [active](SearchParameter-MedicaidProviderActiveSearchParameter.html) | token | Search for practitioners by active status | `Practitioner.active \| PractitionerRole.active` |
| [provider-name](SearchParameter-MedicaidCombinedProviderSearchParameter.html) | string | Search for practitioners by name across both Practitioner and PractitionerRole resources | `Practitioner.name \| PractitionerRole.practitioner.resolve().name` |

#### PractitionerRole Search Parameters

| Name | Type | Description | Expression |
|------|------|-------------|------------|
| [medicaid-enrollment-status](SearchParameter-MedicaidEnrollmentStatusSearchParameter.html) | token | Search for practitioner roles by their current Medicaid enrollment status | `PractitionerRole.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status').value` |
| [medicaid-credentialing-status](SearchParameter-MedicaidCredentialingStatusSearchParameter.html) | token | Search for practitioner roles by their current Medicaid credentialing status | `PractitionerRole.extension.where(url='http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-credentialing-status').value` |
| [medicaid-specialty](SearchParameter-MedicaidSpecialtySearchParameter.html) | token | Search for practitioners by their specialty | `PractitionerRole.specialty` |
| [provider-type](SearchParameter-MedicaidProviderTypeSearchParameter.html) | token | Search for practitioners by provider type | `PractitionerRole.code` |
| [active](SearchParameter-MedicaidProviderActiveSearchParameter.html) | token | Search for practitioner roles by active status | `Practitioner.active \| PractitionerRole.active` |
| [provider-name](SearchParameter-MedicaidCombinedProviderSearchParameter.html) | string | Search for practitioners by name across both Practitioner and PractitionerRole resources | `Practitioner.name \| PractitionerRole.practitioner.resolve().name` |

#### Organization Search Parameters

| Name | Type | Description | Expression |
|------|------|-------------|------------|
| [medicaid-organization-id](SearchParameter-MedicaidOrganizationIdSearchParameter.html) | token | Search for organizations by their state-specific Medicaid organization identifier | `Organization.identifier.where(system='urn:oid:2.16.840.1.113883.4.642.40.42.1')` |
| [organization-type](SearchParameter-MedicaidOrganizationTypeSearchParameter.html) | token | Search for organizations by type | `Organization.type` |

#### HealthcareService Search Parameters

| Name | Type | Description | Expression |
|------|------|-------------|------------|
| [medicaid-location](SearchParameter-MedicaidLocationSearchParameter.html) | reference | Search for healthcare services by their location | `HealthcareService.location` |
| [service-type](SearchParameter-MedicaidHealthcareServiceTypeSearchParameter.html) | token | Search for healthcare services by type | `HealthcareService.type` |

#### VerificationResult Search Parameters

| Name | Type | Description | Expression |
|------|------|-------------|------------|
| [verification-target](SearchParameter-VerificationTargetSearchParameter.html) | reference | Search for verification results by the practitioner or organization being verified | `VerificationResult.target` |
| [medicaid-verification-status](SearchParameter-MedicaidVerificationStatusSearchParameter.html) | token | Search for verification results by their status | `VerificationResult.status` |
| [last-performed](SearchParameter-MedicaidVerificationLastPerformedSearchParameter.html) | date | Search for verification results by last performed date | `VerificationResult.lastPerformed` |
| [next-scheduled](SearchParameter-MedicaidVerificationNextScheduledSearchParameter.html) | date | Search for verification results by next scheduled date | `VerificationResult.nextScheduled` |

### Common Search Use Cases

This section provides examples of common search scenarios and how to implement them using the defined search parameters.

#### Finding Providers by Enrollment Status

To find all providers with a specific enrollment status (e.g., enrolled, suspended, terminated):

```
GET [base]/PractitionerRole?medicaid-enrollment-status=enrolled
```

This returns all PractitionerRole resources where the enrollment status is "enrolled". Other possible values include:
- `pending`: Providers with pending applications
- `suspended`: Providers with suspended enrollment
- `terminated`: Providers with terminated enrollment
- `revalidation-required`: Providers requiring revalidation

#### Finding Providers by Specialty

To find all providers with a specific specialty:

```
GET [base]/PractitionerRole?medicaid-specialty=http://nucc.org/provider-taxonomy|207Q00000X
```

This returns all PractitionerRole resources where the specialty is "Family Medicine" (code 207Q00000X from the NUCC taxonomy).

#### Finding Providers by Location

To find all healthcare services at a specific location:

```
GET [base]/HealthcareService?medicaid-location=Location/MedicaidLocationExample
```

This returns all HealthcareService resources associated with the specified location.

#### Finding Providers by Credentialing Status

To find all providers with a specific credentialing status:

```
GET [base]/PractitionerRole?medicaid-credentialing-status=credentialed
```

This returns all PractitionerRole resources where the credentialing status is "credentialed". Other possible values include:
- `in-process`: Providers in the credentialing process
- `incomplete`: Providers with incomplete credentialing
- `denied`: Providers with denied credentialing
- `expired`: Providers with expired credentialing
- `recredentialing`: Providers in the recredentialing process

#### Finding Verification Results for a Provider

To find all verification results for a specific provider:

```
GET [base]/VerificationResult?verification-target=Practitioner/MedicaidPractitionerExample
```

This returns all VerificationResult resources where the target is the specified practitioner.

#### Finding Providers by Medicaid ID

To find a practitioner by their Medicaid provider ID:

```
GET [base]/Practitioner?medicaid-provider-id=MD12345
```

This returns the Practitioner resource with the specified Medicaid provider ID.

#### Finding Organizations by Medicaid ID

To find an organization by its Medicaid organization ID:

```
GET [base]/Organization?medicaid-organization-id=urn:oid:2.16.840.1.113883.4.642.40.42.1|ORG-12345
```

This returns the Organization resource with the specified Medicaid organization ID.

### Advanced Search Strategies

#### Combining Search Parameters

Multiple search parameters can be combined to create more specific queries:

```
GET [base]/PractitionerRole?medicaid-enrollment-status=enrolled&medicaid-specialty=http://nucc.org/provider-taxonomy|207Q00000X
```

This returns all enrolled providers with the specialty "Family Medicine".

#### Searching for Providers in a Specific Area

To find providers in a specific geographic area, combine the location search with address parameters:

```
GET [base]/Location?address-city=Springfield&address-state=IL
GET [base]/HealthcareService?medicaid-location.address-city=Springfield&medicaid-location.address-state=IL
```

The first query returns all locations in Springfield, IL. The second query returns all healthcare services at locations in Springfield, IL.

#### Finding Providers with Recent Verification

To find providers with recent verification results:

```
GET [base]/VerificationResult?medicaid-verification-status=validated&last-performed=gt2023-01-01
```

This returns all successful verification results performed after January 1, 2023.

You can also find providers with failed verification:

```
GET [base]/VerificationResult?medicaid-verification-status=failed&last-performed=gt2023-01-01
```

This returns all failed verification results performed after January 1, 2023.

#### Finding Providers Due for Revalidation

To find providers due for revalidation:

```
GET [base]/VerificationResult?next-scheduled=le2023-12-31
```

This returns all verification results with revalidation scheduled before or on December 31, 2023.

To find providers due for revalidation in a specific time period:

```
GET [base]/VerificationResult?next-scheduled=ge2023-01-01&next-scheduled=le2023-12-31
```

This returns all verification results with revalidation scheduled during the 2023 calendar year.

#### Finding Providers with Specific Qualifications

To find providers with specific qualifications:

```
GET [base]/Practitioner?qualification.code=http://terminology.hl7.org/CodeSystem/v2-0360|MD
```

This returns all practitioners with an MD qualification.

### Implementation Considerations

#### Performance Optimization

When implementing these search parameters, consider the following performance optimizations:

1. **Indexing**: Ensure that all searchable fields are properly indexed in your database
2. **Pagination**: Use the `_count` parameter to limit the number of results returned in a single request
3. **Includes**: Use the `_include` parameter to retrieve related resources in a single request
4. **Caching**: Implement appropriate caching strategies for frequently used searches

#### Security Considerations

When implementing search functionality:

1. **Authorization**: Ensure that users can only search for resources they are authorized to view
2. **Audit Logging**: Log all search requests for audit purposes
3. **Rate Limiting**: Implement rate limiting to prevent abuse of search endpoints
4. **Data Filtering**: Apply appropriate data filtering based on user roles and permissions

### Testing Search Parameters

To ensure that search parameters function correctly:

1. **Validation**: Validate that search parameters are correctly defined in the CapabilityStatement
2. **Functional Testing**: Test each search parameter with various inputs
3. **Edge Cases**: Test with special characters, empty values, and boundary conditions
4. **Performance Testing**: Test with large datasets to ensure acceptable performance

### Examples

#### Example 1: Finding All Enrolled Family Medicine Physicians

```
GET [base]/PractitionerRole?medicaid-enrollment-status=enrolled&medicaid-specialty=http://nucc.org/provider-taxonomy|207Q00000X
```

Expected result:
- All PractitionerRole resources with enrollment status "enrolled" and specialty "Family Medicine"
- Example: [MedicaidPractitionerRoleExample](PractitionerRole-MedicaidPractitionerRoleExample.html)

#### Example 2: Finding All Providers Requiring Revalidation

```
GET [base]/PractitionerRole?medicaid-enrollment-status=revalidation-required
```

Expected result:
- All PractitionerRole resources with enrollment status "revalidation-required"

#### Example 3: Finding All Suspended Providers

```
GET [base]/PractitionerRole?medicaid-enrollment-status=suspended
```

Expected result:
- All PractitionerRole resources with enrollment status "suspended"
- Example: [MedicaidSuspendedPractitionerRoleExample](PractitionerRole-MedicaidSuspendedPractitionerRoleExample.html)

#### Example 4: Finding All Verification Results for a Provider

```
GET [base]/VerificationResult?verification-target=Practitioner/MedicaidPractitionerExample
```

Expected result:
- All VerificationResult resources targeting the specified practitioner
- Example: [MedicaidVerificationResultExample](VerificationResult-MedicaidVerificationResultExample.html)

#### Example 5: Finding Healthcare Services at a Location

```
GET [base]/HealthcareService?medicaid-location=Location/MedicaidLocationExample
```

Expected result:
- All HealthcareService resources at the specified location
- Example: [MedicaidHealthcareServiceExample](HealthcareService-MedicaidHealthcareServiceExample.html)

#### Example 6: Finding Providers by Type

```
GET [base]/PractitionerRole?provider-type=http://nucc.org/provider-taxonomy|207R00000X
```

Expected result:
- All PractitionerRole resources with provider type "Internal Medicine"
- Example: [MedicaidSuspendedPractitionerRoleExample](PractitionerRole-MedicaidSuspendedPractitionerRoleExample.html)

#### Example 7: Finding Organizations by Type

```
GET [base]/Organization?organization-type=http://terminology.hl7.org/CodeSystem/organization-type|prov
```

Expected result:
- All Organization resources with type "Healthcare Provider"
- Example: [MedicaidOrganizationExample](Organization-MedicaidOrganizationExample.html)

#### Example 8: Finding Healthcare Services by Type

```
GET [base]/HealthcareService?service-type=http://terminology.hl7.org/CodeSystem/service-type|124
```

Expected result:
- All HealthcareService resources with type "General Practice"
- Example: [MedicaidHealthcareServiceExample](HealthcareService-MedicaidHealthcareServiceExample.html)

#### Example 9: Finding Providers in a Geographic Area

```
GET [base]/Practitioner?address-city=Springfield&address-state=IL
```

Expected result:
- All Practitioner resources with an address in Springfield, IL
- Example: [MedicaidPractitionerExample](Practitioner-MedicaidPractitionerExample.html)

#### Example 10: Finding Providers Due for Revalidation in a Specific Period

```
GET [base]/VerificationResult?next-scheduled=ge2023-01-01&next-scheduled=le2023-12-31
```

Expected result:
- All VerificationResult resources with revalidation scheduled during the 2023 calendar year
- Example: [MedicaidVerificationResultExample](VerificationResult-MedicaidVerificationResultExample.html)
