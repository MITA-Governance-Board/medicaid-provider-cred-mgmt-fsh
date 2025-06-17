# Terminology Binding Guidance

This page provides guidance on terminology binding strengths used in this Implementation Guide and how to handle extensions to value sets.

## Binding Strength Definitions

This IG uses the following binding strengths as defined by FHIR:

### Required Binding (Conformance Level: SHALL)

A required binding means that implementations **SHALL** use a code from the specified value set.

- **Definition**: Implementations **SHALL** use a code from the specified value set.
- **Validation**: Instance data **SHALL** contain a code from the value set.
- **Example**: `MedicaidEnrollmentStatuses` and `MedicaidCredentialingStatuses` are required bindings in this IG.

### Extensible Binding (Conformance Level: SHOULD)

An extensible binding means that implementations **SHOULD** use a code from the specified value set if a suitable code exists, but **MAY** use another code if a suitable code does not exist in the value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set if a suitable code exists.
- **Validation**: Instance data **SHOULD** contain a code from the value set if a suitable code exists.
- **Extension Rules**: If a suitable code does not exist in the value set, implementations **MAY** use another code, following these rules:
  1. First, check if the concept exists in a standard terminology (e.g., SNOMED CT, LOINC).
  2. If using a code outside the value set, document the reason and the source of the alternative code.
  3. Consider submitting the concept for inclusion in future versions of the value set.

- **Example**: `MedicaidProviderTypes`, `MedicaidSpecialtyCodes`, and standard FHIR value sets like `service-category` are extensible bindings in this IG.

### Preferred Binding (Conformance Level: SHOULD)

A preferred binding means that implementations **SHOULD** use a code from the specified value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set.
- **Validation**: Instance data **SHOULD** contain a code from the value set.
- **Note**: This IG does not currently use preferred bindings.

### Example Binding (Conformance Level: MAY)

An example binding means that implementations **MAY** use a code from the specified value set.

- **Definition**: The value set is provided as an example only.
- **Validation**: Instance data **MAY** contain a code from the value set.
- **Note**: This IG does not currently use example bindings.

## Value Set Binding Table

The following table summarizes the binding strengths for value sets used in this IG:

| Value Set | Binding Strength | Used In | Extension Guidance |
|-----------|------------------|---------|-------------------|
| MedicaidEnrollmentStatuses | Required | MedicaidEnrollmentStatusExtension | No extensions allowed. Must use codes from this value set. |
| MedicaidCredentialingStatuses | Required | MedicaidCredentialingStatusExtension | No extensions allowed. Must use codes from this value set. |
| MedicaidProviderTypes | Extensible | MedicaidPractitionerRole.code | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| MedicaidSpecialtyCodes | Extensible | MedicaidPractitionerRole.specialty, MedicaidHealthcareService.specialty | May use codes outside this value set if no suitable code exists. Prefer NUCC taxonomy codes when available. |
| MedicaidVerificationStatuses | Extensible | Not directly bound | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| MedicaidQualificationTypes | Extensible | Not directly bound | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| service-category (FHIR core) | Extensible | MedicaidHealthcareService.category | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| service-type (FHIR core) | Extensible | MedicaidHealthcareService.type | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| endpoint-connection-type (FHIR core) | Extensible | MedicaidEndpoint.connectionType | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |
| endpoint-payload-type (FHIR core) | Extensible | MedicaidEndpoint.payloadType | May use codes outside this value set if no suitable code exists. Document the source of alternative codes. |

## Extension Rules for Extensible Value Sets

When using extensible value sets in this IG, follow these guidelines:

1. **First, check the bound value set**: Always check if a suitable code exists in the specified value set.

2. **If no suitable code exists**:
   - For provider types and specialties, check the full NUCC taxonomy.
   - For service categories and types, check the full FHIR value sets.
   - For verification statuses, consider standard workflow status values.

3. **Document extensions**:
   - When using a code outside the specified value set, document:
     - The code system and code used
     - The reason why a code from the specified value set was not suitable
     - The source of the alternative code

4. **Feedback mechanism**:
   - If you frequently need to use codes outside the specified value sets, consider submitting feedback to the IG maintainers for potential inclusion in future versions.

## State-Specific Extensions

States implementing this IG may need to extend value sets to accommodate state-specific requirements:

1. **State-specific code systems**:
   - States may define their own code systems for state-specific concepts.
   - These should be properly documented with a formal URI.
   - Example: `http://medicaid.[state].gov/fhir/CodeSystem/[name]`

2. **State-specific value sets**:
   - States may define their own value sets that include both standard codes and state-specific codes.
   - These should be properly documented with a formal URI.
   - Example: `http://medicaid.[state].gov/fhir/ValueSet/[name]`

3. **Documentation requirements**:
   - States must document any extensions to value sets in their implementation guides.
   - The documentation should include the binding strength and usage context.

## Implementation Considerations

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
