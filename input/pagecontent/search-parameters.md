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

1. **Indexing**: Ensure that all searchable fields are properly indexed in your database to significantly improve search performance. Create database indexes on all fields used in search parameters, particularly those frequently used in queries. For complex search parameters that reference extensions or nested elements, consider creating specialized indexes or denormalized tables to optimize query execution. Regularly analyze query performance and adjust indexing strategies based on actual usage patterns. Be mindful of the trade-off between query performance and write performance, as excessive indexing can slow down data modifications. For search parameters that support multiple data types or reference resolution, implement appropriate indexing strategies for each supported path. Monitor index usage and performance over time, and consider rebuilding or reorganizing indexes periodically to maintain optimal performance as data volumes grow.

2. **Pagination**: Use the `_count` parameter to limit the number of results returned in a single request, improving response times and reducing server load. Implement server-side pagination for all search endpoints, with a reasonable default page size (typically 10-50 items depending on resource complexity). Support the standard FHIR pagination parameters including `_count` (page size), `_offset` (starting position), and page navigation links through Bundle.link elements with relation types (first, previous, next, last). Ensure that pagination is implemented consistently across all search endpoints, with clear documentation on default and maximum page sizes. Consider implementing cursor-based pagination for large datasets or frequently accessed searches to improve performance and consistency. Provide clear feedback to clients when result sets are truncated due to server limits, and include total count information when feasible to help clients understand the complete result set size.

3. **Includes**: Use the `_include` parameter to retrieve related resources in a single request, reducing the number of API calls needed and improving application performance. Implement support for both `_include` (for referenced resources) and `_revinclude` (for resources that reference the primary search results) to enable efficient retrieval of related data. Define and document which include paths are supported for each resource type, considering common usage patterns in provider enrollment and credentialing workflows. Optimize database queries to efficiently retrieve included resources, potentially using joins or batch retrieval strategies rather than individual lookups. Consider implementing recursive includes (`_include:recurse`) for hierarchical relationships like organizational structures, but with appropriate depth limits to prevent performance issues. Monitor the performance impact of complex include patterns and consider implementing server-side limits on the number of includes or the depth of recursive includes to prevent excessive resource consumption.

4. **Caching**: Implement appropriate caching strategies for frequently used searches to reduce database load and improve response times. Consider implementing multiple caching layers, including application-level caches for frequently accessed resources, query result caches for common search patterns, and HTTP-level caching using standard cache control headers. Define appropriate cache invalidation strategies based on resource update patterns, with shorter TTLs (Time To Live) for frequently changing data like enrollment status and longer TTLs for relatively static data like provider demographics. Implement cache versioning or resource-specific ETag mechanisms to support conditional requests, allowing clients to efficiently determine if their cached data is still valid. For search results that are expensive to compute but change infrequently (such as complex queries involving multiple joins or reference resolution), consider implementing background refresh strategies to maintain cache freshness without impacting user response times. Monitor cache hit rates and adjust caching strategies based on actual usage patterns and data change frequencies.

#### Security Considerations

When implementing search functionality:

1. **Authorization**: Ensure that users can only search for resources they are authorized to view by implementing comprehensive access control mechanisms at multiple levels. Integrate with enterprise authentication systems (such as OAuth 2.0, SMART on FHIR, or OpenID Connect) to verify user identity and obtain appropriate authorization tokens. Implement role-based access control (RBAC) with fine-grained permissions for different resource types and operations, allowing administrators to precisely define which users can search for which types of provider information. Consider attribute-based access control (ABAC) for complex scenarios where access depends on resource attributes, user context, or environmental factors. Implement compartment-based access restrictions to limit users to resources within their organizational scope or jurisdiction. Apply consistent authorization checks across all search endpoints, including composite searches and chained parameter searches that might traverse multiple resources. Ensure that authorization mechanisms account for included resources (`_include` parameter), applying appropriate access controls to both primary and included resources. Regularly audit authorization configurations and perform penetration testing to identify potential security gaps in search access controls.

2. **Audit Logging**: Log all search requests for audit purposes, capturing comprehensive information about who accessed what data and when. Implement detailed audit logging that captures the authenticated user identity, timestamp, client application, search parameters used, number of results returned, and other contextually relevant information. Structure audit logs to support efficient querying for compliance reporting and security investigations, potentially using standardized formats like FHIR AuditEvent resources. Implement tamper-evident logging mechanisms to prevent modification of audit records, ensuring the integrity of the audit trail. Consider implementing different levels of audit detail based on the sensitivity of the data being accessed, with more detailed logging for searches involving protected health information or other sensitive provider data. Establish appropriate retention policies for audit logs based on regulatory requirements and organizational policies, typically ranging from 6 years to 10 years for healthcare data. Implement automated monitoring of audit logs to detect unusual search patterns that might indicate unauthorized access attempts or potential data breaches, with appropriate alerting mechanisms for security personnel.

3. **Rate Limiting**: Implement rate limiting to prevent abuse of search endpoints and ensure system stability under load. Define appropriate rate limits based on user roles, client applications, and resource types, with different thresholds for authenticated versus unauthenticated requests. Implement graduated response mechanisms for rate limit violations, starting with throttling (delayed responses) before progressing to temporary blocks for persistent violations. Provide clear feedback to clients when rate limits are approached or exceeded, including appropriate HTTP status codes (429 Too Many Requests) and headers indicating current usage and limits. Consider implementing token bucket algorithms or similar mechanisms that allow for occasional bursts of activity while maintaining long-term rate control. Monitor rate limit events and adjust thresholds based on observed usage patterns and system capacity. Implement bypass mechanisms for critical system functions that should not be subject to standard rate limits, but with appropriate safeguards to prevent abuse of these exceptions. Document rate limit policies clearly in API documentation, including limits, consequences of exceeding limits, and any available options for requesting higher limits for legitimate high-volume use cases.

4. **Data Filtering**: Apply appropriate data filtering based on user roles and permissions to ensure that search results only include authorized data. Implement data-level security that filters search results to include only resources the user is authorized to view, even when the search query itself would match additional resources. Consider implementing field-level security for sensitive data elements, potentially redacting or excluding certain fields from search results based on user permissions. Ensure that filtering is applied consistently across all search endpoints, including when resources are retrieved through reference resolution or `_include` parameters. Implement data segmentation strategies for multi-tenant systems or systems serving multiple jurisdictions, ensuring that users can only access data within their authorized scope. Consider implementing purpose-of-use restrictions that limit access to certain data elements based on the declared purpose of the search operation. Regularly test filtering mechanisms to verify that unauthorized data is not inadvertently exposed through search results, particularly when implementing complex search parameters or chained searches that traverse multiple resources. Document data filtering policies clearly to help users understand what data they can expect to access and why certain resources might be excluded from their search results.

### Testing Search Parameters

To ensure that search parameters function correctly:

1. **Validation**: Validate that search parameters are correctly defined in the CapabilityStatement to ensure they are properly exposed to clients. This validation should include verifying that each search parameter is correctly registered with the appropriate resource type, data type, and expression path. Use the FHIR validator to check the syntactic correctness of search parameter definitions, ensuring they follow the FHIR specification requirements. Verify that the search parameter URLs are consistent with the implementation guide's namespace and follow the recommended naming conventions. Confirm that the descriptions accurately reflect the parameter's purpose and usage. For complex search parameters that reference extensions or chained resources, validate that the FHIRPath expressions are correctly formed and resolve to the intended elements. Test that the CapabilityStatement accurately reflects all supported search parameters, including any implementation-specific behavior such as modifiers or special handling. Consider using automated tooling to verify consistency between the CapabilityStatement, the published SearchParameter resources, and the actual server implementation to prevent documentation-implementation mismatches.

2. **Functional Testing**: Test each search parameter with various inputs to verify correct behavior across different usage scenarios. Develop comprehensive test cases that cover the full range of expected inputs, including different data types, formats, and values. Test exact matches, partial matches, and pattern matching for string parameters, verifying that they behave as expected with case sensitivity, accent sensitivity, and whitespace handling. For token parameters, test both system-and-code searches and code-only searches, verifying that system matching works correctly. For date parameters, test various date formats, precision levels (year, month, day), and comparison operators (eq, gt, lt, ge, le). For reference parameters, test both relative and absolute references, as well as chained and reverse chained parameters if supported. Verify that composite parameters correctly implement the specified combination logic. Test that modifiers (such as :exact, :contains, :missing) work as expected when applicable. Implement automated test suites that can be run regularly to verify ongoing functionality, particularly after system updates or data model changes. Document test results and maintain a regression test suite to prevent reintroduction of fixed issues.

3. **Edge Cases**: Test with special characters, empty values, and boundary conditions to ensure robust handling of unusual inputs. Verify correct behavior with special characters in search parameters, including URL-reserved characters, Unicode characters, and potential injection vectors. Test with extremely long input values to ensure the system handles them gracefully without truncation or errors. Verify behavior with empty or null values, ensuring the system responds appropriately rather than failing. Test boundary conditions such as date range boundaries (e.g., searching exactly at midnight between days), minimum/maximum numeric values, and resource reference boundaries (e.g., references that exist but point to unauthorized resources). Verify handling of malformed inputs, ensuring the system provides clear error messages rather than silent failures or unexpected behavior. Test with inputs that require escaping or encoding, ensuring the system correctly interprets them. Verify behavior with extremely large result sets that approach or exceed system limits, ensuring appropriate pagination and error handling. Document any identified limitations or special handling requirements for edge cases to guide client implementations. Consider implementing fuzzy matching or error correction for common input mistakes to improve usability.

4. **Performance Testing**: Test with large datasets to ensure acceptable performance under realistic conditions. Develop performance test scenarios that simulate expected production loads, including both typical and peak usage patterns. Measure response times for different types of searches, from simple single-parameter queries to complex multi-parameter searches with chaining and includes. Test with progressively larger datasets to identify scaling issues and performance degradation points. Analyze query execution plans and database performance to identify and optimize inefficient search implementations. Implement performance benchmarks for key search operations and monitor them over time to detect performance regressions. Test concurrent search operations to verify system behavior under load, including potential locking or resource contention issues. Verify that performance optimizations like caching and indexing are working effectively by comparing performance with and without these features enabled. Test the impact of complex searches on system resources, including CPU, memory, disk I/O, and network utilization. Establish performance requirements and service level agreements (SLAs) for different types of searches, and verify that the implementation meets these requirements. Document performance characteristics and limitations to guide implementers on optimal search strategies.

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
