This page provides guidance on terminology binding strengths used in this Implementation Guide and how to handle extensions to value sets.

> **Note:** This implementation guide references standard terminologies and code systems maintained by various organizations. Links to official resources are provided throughout this document.

### Binding Strength Definitions

This IG uses the following binding strengths as defined by [FHIR Terminology](https://www.hl7.org/fhir/terminologies.html):

#### Required Binding (Conformance Level: SHALL)

A required binding means that implementations **SHALL** use a code from the specified value set.

- **Definition**: Implementations **SHALL** use a code from the specified value set. This is the strictest binding strength and indicates that the value set contains all possible valid codes for the element. Required bindings are used when the set of possible values is fixed and well-defined, and when consistency across implementations is critical for interoperability. In the context of Medicaid provider enrollment and credentialing, required bindings are typically used for status codes and other administrative values where standardization is essential for consistent processing and reporting.

- **Validation**: Instance data **SHALL** contain a code from the value set. Validation engines must reject instances where the coded element contains a code not found in the specified value set. This strict validation ensures that all implementations use the same set of codes, which is particularly important for elements that drive business logic or workflow decisions. For example, enrollment status codes drive eligibility determinations and claims processing rules, making standardization critical.

- **Example**: `MedicaidEnrollmentStatuses` and `MedicaidCredentialingStatuses` are required bindings in this IG. These value sets define the complete set of valid status codes for provider enrollment and credentialing processes. Using codes outside these value sets would create inconsistencies in how provider status is represented and interpreted across different systems and states, potentially leading to incorrect eligibility determinations or improper claims processing.

- **Reference**: [FHIR Binding Strengths](https://www.hl7.org/fhir/terminologies.html#strength)

#### Extensible Binding (Conformance Level: SHOULD)

An extensible binding means that implementations **SHOULD** use a code from the specified value set if a suitable code exists, but **MAY** use another code if a suitable code does not exist in the value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set if a suitable code exists. Extensible bindings provide a balance between standardization and flexibility, recognizing that in healthcare, it's often impossible to enumerate all possible valid values in advance. This binding strength is particularly appropriate for elements like provider types and specialties, where the base value set covers common scenarios but may not encompass all possible variations, especially those specific to individual states or specialized practice areas.

- **Validation**: Instance data **SHOULD** contain a code from the value set if a suitable code exists. Validation engines should issue warnings (not errors) when encountering codes outside the specified value set, prompting implementers to verify that the extension is appropriate. This approach encourages standardization while accommodating legitimate needs for extension. During implementation, systems should first attempt to map local codes to the standard value set before resorting to extensions, ensuring maximum interoperability.

- **Extension Rules**: If a suitable code does not exist in the value set, implementations **MAY** use another code, following these rules:
  1. First, check if the concept exists in a standard terminology (e.g., [SNOMED CT](https://www.snomed.org/), [LOINC](https://loinc.org/)). Using established standard terminologies for extensions maintains a level of interoperability even when going beyond the specified value set. For provider types and specialties, the full [NUCC taxonomy](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40) should be consulted before creating custom codes, as it contains a comprehensive hierarchy of healthcare provider classifications that may include specialized categories not included in the base value set.
  
  2. If using a code outside the value set, document the reason and the source of the alternative code. Documentation should include a clear explanation of why existing codes were insufficient, the authoritative source of the alternative code, and how the alternative code relates to the concepts in the standard value set. This documentation is essential for other systems to correctly interpret the extended codes and potentially map them to their own local codes or standards.
  
  3. Consider submitting the concept for inclusion in future versions of the value set. This feedback loop helps the value sets evolve to better meet implementation needs over time. When submitting concepts for inclusion, provide clear definitions, use cases, and relationships to existing concepts to facilitate evaluation by terminology stewards. This collaborative approach helps ensure that extensions eventually become part of the standard, improving interoperability for all implementations.

- **Example**: `MedicaidProviderTypes`, `MedicaidSpecialtyCodes`, and standard FHIR value sets like `service-category` are extensible bindings in this IG. These value sets cover common provider types, specialties, and service categories, but recognize that states may have unique provider classifications or specialized service categories that aren't represented in the standard value sets. For instance, a state might have a specialized provider type for school-based health centers with specific credentialing requirements that doesn't fit neatly into the standard provider type categories.

- **Reference**: [FHIR Extensible Binding](https://www.hl7.org/fhir/terminologies.html#extensible)

#### Preferred Binding (Conformance Level: SHOULD)

A preferred binding means that implementations **SHOULD** use a code from the specified value set.

- **Definition**: Implementations **SHOULD** use a code from the specified value set. Preferred bindings indicate a strong recommendation to use codes from the specified value set, but without the extension rules and validation expectations of extensible bindings. This binding strength is appropriate when there is a well-established set of codes that covers most use cases, but where there may be legitimate reasons to use alternative coding systems based on local requirements or specific implementation contexts. Preferred bindings encourage consistency while acknowledging that different implementations may have valid reasons for using different code systems.

- **Validation**: Instance data **SHOULD** contain a code from the value set. Validation engines may issue informational messages (not warnings or errors) when encountering codes outside the specified value set. This light validation approach recognizes that while the specified value set represents a community consensus on preferred codes, there may be equally valid alternative coding approaches for certain implementations. Systems receiving data with codes outside preferred value sets should be prepared to handle these alternative codes appropriately, potentially through mapping or translation services.

- **Note**: This IG does not currently use preferred bindings. All bindings in this IG are either required (for status codes and other administrative values where standardization is essential) or extensible (for provider types, specialties, and other elements where flexibility is needed to accommodate state-specific variations). This approach provides clear guidance on when extensions are permitted and when strict adherence to standard codes is required, simplifying implementation decisions and validation processes.

#### Example Binding (Conformance Level: MAY)

An example binding means that implementations **MAY** use a code from the specified value set.

- **Definition**: The value set is provided as an example only. Example bindings represent the weakest form of binding, where the value set is provided purely for illustrative purposes to help implementers understand the kinds of values that might be appropriate. This binding strength is typically used when the element needs to be coded, but the specific coding system or values are entirely at the discretion of the implementer. Example bindings might be appropriate for highly localized concepts or for elements where standardization provides minimal interoperability benefit. In these cases, the example value set serves as a starting point or reference implementation rather than a normative recommendation.

- **Validation**: Instance data **MAY** contain a code from the value set. No validation warnings or errors should be generated when codes outside the value set are encountered. Systems should be prepared to handle any codes for elements with example bindings, potentially through configuration, mapping tables, or runtime interpretation. Since no validation is performed against example value sets, implementations should ensure they have appropriate processes for managing and interpreting the diverse codes that might be used for these elements.

- **Note**: This IG does not currently use example bindings. All terminology bindings in this IG provide stronger guidance (required or extensible) to promote interoperability in the Medicaid provider enrollment and credentialing domain. This approach reflects the importance of terminology standardization in this domain, where consistent interpretation of provider types, specialties, and status codes is essential for proper program administration, reporting, and cross-state data exchange. Future versions of the IG might introduce example bindings if appropriate use cases are identified where complete implementation flexibility is warranted.

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

1. **First, check the bound value set**: Always check if a suitable code exists in the specified value set. This is the primary source of codes and should be thoroughly reviewed before considering extensions. The bound value sets in this IG have been carefully curated to cover common scenarios in Medicaid provider enrollment and credentialing, with particular attention to federal reporting requirements and cross-state interoperability needs. When evaluating codes in the bound value set, consider not just exact matches but also parent or related concepts that might adequately represent the intended meaning. In some cases, a more general code with additional descriptive text might be preferable to extending beyond the value set. Implementation guides should include tooling or processes to facilitate searching and browsing of bound value sets to make this step as straightforward as possible.

2. **If no suitable code exists**:
   - For provider types and specialties, check the full [NUCC taxonomy](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40). The NUCC taxonomy is a comprehensive hierarchical classification of healthcare providers that includes detailed specialties and subspecialties. The taxonomy is regularly updated to reflect changes in healthcare delivery models and specialization patterns. When searching the NUCC taxonomy, consider both the specific provider category and related categories that might apply. The taxonomy's hierarchical structure can help identify the most appropriate code when an exact match isn't available. For state-specific provider types, consider mapping to the closest NUCC category and using additional qualifiers or extensions to capture state-specific attributes.
   
   - For service categories and types, check the full [FHIR value sets](https://www.hl7.org/fhir/terminologies-valuesets.html). FHIR defines a rich set of value sets for healthcare services that extend beyond the subsets bound in this IG. These value sets draw from standard terminologies like SNOMED CT and are designed to support a wide range of healthcare service descriptions. When searching these value sets, consider the service context, delivery model, and clinical domain to identify the most appropriate code. For specialized services unique to Medicaid programs, look for codes that capture the essential characteristics of the service, even if they don't perfectly match state-specific terminology.
   
   - For verification statuses, consider standard workflow status values. Many workflow and process management standards define status values that might be applicable to verification processes. Standards like BPMN (Business Process Model and Notation) and workflow patterns from other healthcare domains can provide established status values with well-defined semantics. When selecting status values, consider the complete lifecycle of the verification process, including exceptional paths and edge cases, to ensure the selected codes can represent all possible states.

3. **Document extensions**:
   - When using a code outside the specified value set, document:
     - The code system and code used, including the specific version of the code system, the code value, display text, and any relevant hierarchy information. For codes from standard terminologies, include the official URI for the code system and the formal code definition. For locally defined codes, provide a complete definition including the concept's meaning, scope, and relationships to other concepts.
     
     - The reason why a code from the specified value set was not suitable, including a detailed explanation of what aspects of the concept could not be adequately represented using the bound value set. This explanation should reference specific characteristics or requirements that necessitated the extension, rather than simply stating that no suitable code was found. The documentation should demonstrate that a thorough search of the bound value set and recommended alternative terminologies was conducted before extending.
     
     - The source of the alternative code, including the authority responsible for the code system, its recognition in the healthcare community, and its stability and maintenance processes. For locally defined codes, document the governance process used to create and manage the code, including how new codes are approved, how existing codes are updated or deprecated, and how the code system is versioned. This information helps recipients assess the reliability and meaning of the extended codes.

4. **Feedback mechanism**:
   - If you frequently need to use codes outside the specified value sets, consider submitting feedback to the IG maintainers for potential inclusion in future versions. Feedback should include comprehensive information about the missing concepts, including:
     - Detailed concept definitions and relationships to existing concepts
     - Use cases demonstrating the need for the new codes
     - Implementation experience with the extended codes
     - Prevalence of the concept in real-world implementations
     - Potential impact on interoperability if the concept is not standardized
     - Suggested placement within the existing value set structure
   
   This feedback is essential for the continuous improvement of the IG's terminology resources. The IG maintenance process includes regular review of implementation feedback to identify common extensions that should be incorporated into the standard value sets. By contributing your implementation experience, you help ensure that future versions of the IG better meet the needs of the Medicaid provider enrollment and credentialing community.

### State-Specific Terminology

States implementing this IG will need to handle state-specific terminology requirements. This section provides comprehensive guidance on creating and managing state-specific code systems and value sets.

#### State-Specific Code Systems

States should create formal code systems for state-specific concepts that cannot be represented using standard terminologies. These code systems should follow FHIR best practices and be properly documented.

##### Code System Naming Conventions

- **URI Pattern**: `http://medicaid.[state].gov/fhir/CodeSystem/[name]` - This URI pattern establishes a consistent, predictable namespace for state-specific code systems, following FHIR best practices for URI construction. The pattern incorporates the state's domain (`medicaid.[state].gov`), the FHIR resource type (`fhir/CodeSystem`), and a descriptive name for the specific code system. This approach ensures global uniqueness while clearly identifying the code system as belonging to a particular state's Medicaid program. When implementing this pattern, states should use their official two-letter postal code in lowercase (e.g., `ca` for California, `ny` for New York) to maintain consistency. The name component should be concise but descriptive, using kebab-case (hyphen-separated lowercase words) for readability and compatibility with URL standards. For example, `http://medicaid.ca.gov/fhir/CodeSystem/provider-types` clearly identifies a California Medicaid code system for provider types. Consistent URI patterns facilitate automated discovery, cataloging, and reference of terminology resources across the Medicaid ecosystem.
- **ID Pattern**: `[state]-[concept]-codes` - This ID pattern creates a concise, human-readable logical identifier for state-specific code systems that clearly indicates both the state and the concept domain. The pattern uses the state's two-letter postal code in lowercase, followed by a descriptive concept name, and ending with "codes" to indicate that this is a code system resource. This consistent pattern makes code systems easily identifiable in implementation guides, FSH definitions, and resource references. The concept component should use kebab-case for readability and consistency with FHIR naming conventions. For example, `ca-provider-types-codes` clearly identifies a California-specific code system for provider types. When implementing this pattern, ensure that IDs remain stable over time, as changing IDs can break references in profiles, value sets, and instances. This ID pattern complements the URI pattern, providing both a formal namespace identifier (URI) and a concise logical identifier (ID) for each code system.
- **Title Pattern**: `[State] [Concept] Codes` - This title pattern creates a human-readable, descriptive name for state-specific code systems that clearly communicates both the state jurisdiction and the concept domain. The pattern uses the state's full name followed by a descriptive concept name and ending with "Codes" to indicate that this is a code system resource. This consistent pattern makes code systems easily identifiable in user interfaces, documentation, and implementation guides. The concept component should use Title Case for readability and professional presentation. For example, "California Provider Type Codes" clearly identifies a California-specific code system for provider types. When implementing this pattern, ensure that titles are descriptive enough to distinguish between similar code systems while remaining concise enough for display in user interfaces. This title pattern complements the URI and ID patterns, providing a formal namespace (URI), a logical identifier (ID), and a human-readable name (title) for each code system.

##### Code System Documentation Requirements

- **Formal definition in FSH format**: A complete, machine-readable representation of the code system using FHIR Shorthand (FSH), a domain-specific language designed for defining FHIR artifacts. The FSH definition should include all required CodeSystem resource elements including URL, version, status, content mode, and complete code definitions. Each code definition should include the code value, display text, and description, along with any applicable properties or designations. The FSH format enables automated validation, publication, and incorporation of code systems into FHIR servers and implementation guides. States should maintain these FSH definitions in version-controlled repositories to track changes over time and ensure reproducibility of published artifacts. The FSH definitions should follow consistent formatting and naming conventions to facilitate maintenance and understanding by implementers. Example tools for working with FSH include SUSHI (the official FSH compiler), Visual Studio Code with the FSH extension, and online FSH editors that provide syntax highlighting and validation.
- **Clear descriptions for the code system and each code**: Comprehensive, unambiguous definitions that explain the precise meaning and intended use of both the code system as a whole and each individual code within it. The code system description should include its purpose, scope, intended use cases, relationship to other terminologies, and any constraints or assumptions. Each code description should go beyond simple display text to include detailed explanations of the concept represented, its scope and boundaries, inclusion and exclusion criteria, and relationships to other codes. For codes representing provider types or specialties, descriptions should include qualification requirements, scope of practice considerations, and regulatory context. For status codes or administrative concepts, descriptions should include business process implications, valid state transitions, and operational significance. These detailed descriptions are essential for ensuring consistent interpretation and application of codes across different systems and organizations. Descriptions should be written in clear, concise language accessible to both technical and non-technical users, avoiding ambiguity and jargon where possible.
- **Version information**: Comprehensive metadata about the code system's version, including version number, release date, status, and relationship to previous versions. Version information should follow a consistent, predictable pattern such as semantic versioning (major.minor.patch), with clear criteria for incrementing each component based on the nature and impact of changes. Major version increments typically indicate breaking changes that might require implementation updates, minor versions indicate non-breaking additions or enhancements, and patch versions indicate bug fixes or minor corrections. Version information should be embedded in both the code system's formal metadata (using the `version` element in the CodeSystem resource) and in its URI (typically as a path component or parameter). The version information should include effective dates indicating when the version becomes active and, if applicable, when it is scheduled to be deprecated or retired. For code systems that align with external standards or regulations, version information should include references to the corresponding versions of those standards or regulations. This comprehensive version information enables implementers to manage dependencies, ensure compatibility, and plan for transitions between versions.
- **Maintenance process documentation**: Comprehensive documentation of the formal procedures for managing code system evolution over time, ensuring that terminology resources remain current, relevant, and consistently applied. This documentation should include governance structures (committees, authorities, stakeholders) responsible for terminology decisions, clearly defining roles, responsibilities, and decision-making processes. It should outline review and approval workflows for adding, modifying, or retiring codes, including submission templates, evaluation criteria, and approval thresholds. The documentation should specify publication schedules and notification mechanisms for updates, balancing the need for currency with stability requirements of production systems. Version control practices should be detailed, including version numbering schemes (e.g., semantic versioning), backward compatibility policies, and deprecation strategies. The documentation should address how code system changes are coordinated with related artifacts such as value sets and profiles to maintain consistency across the terminology ecosystem. It should explain how historical versions are preserved and accessed, ensuring that data recorded using previous versions can still be correctly interpreted. Finally, it should provide guidance for implementers on handling transitions between versions, including migration strategies, mapping approaches, and testing recommendations. This comprehensive maintenance documentation ensures transparency, predictability, and reliability in terminology management, supporting both operational needs and long-term interoperability.

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

- **URI Pattern**: `http://medicaid.[state].gov/fhir/ValueSet/[name]` - This URI pattern establishes a consistent, predictable namespace for state-specific value sets, following FHIR best practices for URI construction. The pattern incorporates the state's domain (`medicaid.[state].gov`), the FHIR resource type (`fhir/ValueSet`), and a descriptive name for the specific value set. This approach ensures global uniqueness while clearly identifying the value set as belonging to a particular state's Medicaid program. When implementing this pattern, states should use their official two-letter postal code in lowercase (e.g., `ca` for California, `ny` for New York) to maintain consistency. The name component should be concise but descriptive, using kebab-case (hyphen-separated lowercase words) for readability and compatibility with URL standards. For example, `http://medicaid.ca.gov/fhir/ValueSet/active-provider-types` clearly identifies a California Medicaid value set for active provider types. Consistent URI patterns facilitate automated discovery, cataloging, and reference of terminology resources across the Medicaid ecosystem, and enable reliable binding of value sets to profile elements.
- **ID Pattern**: `[state]-[concept]` - This ID pattern creates a concise, human-readable logical identifier for state-specific value sets that clearly indicates both the state and the concept domain. The pattern uses the state's two-letter postal code in lowercase, followed by a descriptive concept name. Unlike code system IDs, value set IDs typically omit the "-codes" suffix, reflecting the distinction between code systems (which define codes) and value sets (which select codes from code systems). This consistent pattern makes value sets easily identifiable in implementation guides, FSH definitions, and resource references. The concept component should use kebab-case for readability and consistency with FHIR naming conventions. For example, `ca-active-provider-types` clearly identifies a California-specific value set for active provider types. When implementing this pattern, ensure that IDs remain stable over time, as changing IDs can break references in profiles and instances. This ID pattern complements the URI pattern, providing both a formal namespace identifier (URI) and a concise logical identifier (ID) for each value set.
- **Title Pattern**: `[State] [Concept]` - This title pattern creates a human-readable, descriptive name for state-specific value sets that clearly communicates both the state jurisdiction and the concept domain. The pattern uses the state's full name followed by a descriptive concept name. Unlike code system titles, value set titles typically omit the "Codes" suffix, reflecting the distinction between code systems (which define codes) and value sets (which select codes from code systems). This consistent pattern makes value sets easily identifiable in user interfaces, documentation, and implementation guides. The concept component should use Title Case for readability and professional presentation. For example, "California Active Provider Types" clearly identifies a California-specific value set for active provider types. When implementing this pattern, ensure that titles are descriptive enough to distinguish between similar value sets while remaining concise enough for display in user interfaces. This title pattern complements the URI and ID patterns, providing a formal namespace (URI), a logical identifier (ID), and a human-readable name (title) for each value set.

##### Value Set Documentation Requirements

- **Formal definition in FSH format**: A complete, machine-readable representation of the value set using FHIR Shorthand (FSH), a domain-specific language designed for defining FHIR artifacts. The FSH definition should include all required ValueSet resource elements including URL, version, status, and complete inclusion and exclusion criteria that precisely define the value set's content. The definition should use FHIR's compositional grammar to express complex value set composition rules, such as including codes from multiple code systems, including codes based on hierarchical relationships (is-a, descends-from), or excluding specific codes from broader inclusions. The FSH format enables automated validation, publication, and incorporation of value sets into FHIR servers and implementation guides. States should maintain these FSH definitions in version-controlled repositories to track changes over time and ensure reproducibility of published artifacts. The FSH definitions should follow consistent formatting and naming conventions to facilitate maintenance and understanding by implementers. Example tools for working with FSH include SUSHI (the official FSH compiler), Visual Studio Code with the FSH extension, and online FSH editors that provide syntax highlighting and validation.
- **Clear description of the value set purpose**: A comprehensive explanation of the value set's intended use, scope, and significance within the Medicaid provider enrollment and credentialing domain. This description should clearly articulate what the value set represents, the specific business contexts where it should be used, and the rationale for its composition. The description should identify the specific data elements or extensions where the value set is intended to be bound, with explanations of how the codes support the semantic meaning of those elements. For value sets that implement regulatory requirements, the description should reference the specific regulations or policies that the value set addresses, explaining how the included codes satisfy those requirements. For value sets that represent state-specific concepts, the description should explain the relationship to standard terminologies, including any mappings or extensions. The description should also address any limitations or constraints on the value set's use, such as applicability to specific provider types, enrollment pathways, or program components. This comprehensive purpose statement helps implementers understand not just what codes are included in the value set, but why they were selected and how they should be used in different contexts.
- **Documentation of included code systems**: A comprehensive inventory of all code systems referenced in the value set, with detailed information about each code system's origin, authority, and implementation considerations. This documentation should identify each code system by its canonical URI, version, and publishing organization, with links to authoritative documentation. For standard code systems like SNOMED CT or NUCC, the documentation should include licensing requirements, access mechanisms, and version update frequency. For state-specific code systems, the documentation should reference the formal definitions and governance processes described elsewhere in the implementation guide. The documentation should explain the rationale for including each code system, particularly when multiple code systems are combined in a single value set. For value sets that implement filtering or hierarchical selection criteria, the documentation should explain how these criteria interact with the code system's structure and relationships. This comprehensive code system documentation helps implementers understand the origin and authority of the codes included in the value set, supporting proper implementation and maintenance as code systems evolve over time.
- **Binding strength recommendations**: Clear guidance on how strictly the value set should be applied in different contexts, providing implementers with the information they need to properly enforce terminology constraints. These recommendations should specify the appropriate binding strength (required, extensible, preferred, or example) for each context where the value set is used, with detailed justification for the recommended strength based on interoperability requirements, regulatory considerations, and implementation flexibility needs. For required bindings, the documentation should explain why strict conformance is necessary, typically referencing specific regulatory requirements, critical business processes, or essential interoperability scenarios that depend on consistent code usage. For extensible bindings, the documentation should include specific guidance on acceptable extension approaches, preferred alternative terminologies to consider when extending, and documentation requirements for extensions to ensure transparency and potential future standardization. For preferred or example bindings, the documentation should clarify the rationale for the more flexible approach, potentially referencing the evolving nature of the domain or the diversity of implementation contexts. The binding recommendations should consider different usage scenarios, potentially recommending different binding strengths for different contexts (e.g., required for federal reporting elements but extensible for state-specific extensions). These comprehensive binding recommendations help implementers understand how to properly apply value sets in their systems while balancing standardization with local requirements, ensuring appropriate validation behavior and supporting long-term terminology governance.

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
   - **Complete FSH definitions for all code systems**, providing formal, machine-readable representations of state-specific code systems that conform to FHIR standards. These FSH definitions should include all required metadata such as URL, version, publisher, and content mode, as well as complete code definitions with both code values and display text. The FSH format ensures that code systems can be properly validated, published, and incorporated into FHIR servers and validation tools. States should maintain these definitions in version-controlled repositories to track changes over time and ensure reproducibility of published artifacts. The FSH definitions should be included in state-specific implementation guides and made available to implementers through both human-readable documentation and computable artifacts.

   - **Clear descriptions for each code**, providing comprehensive, unambiguous definitions that explain the precise meaning and intended use of each code. These descriptions should go beyond simple display text to include detailed explanations of the concept represented by the code, its scope and boundaries, inclusion and exclusion criteria, and relationships to other codes. For codes representing provider types or specialties, descriptions should include qualification requirements, scope of practice considerations, and regulatory context. For status codes or administrative concepts, descriptions should include business process implications, valid state transitions, and operational significance. These detailed descriptions are essential for ensuring consistent interpretation and application of codes across different systems and organizations.

   - **Maintenance and versioning processes**, documenting the formal procedures for managing code system evolution over time. This documentation should include governance structures (committees, authorities, stakeholders), review and approval workflows for adding, modifying, or retiring codes, publication schedules and notification mechanisms for updates, and version control practices including version numbering schemes and backward compatibility policies. The documentation should address how code system changes are coordinated with related artifacts such as value sets and profiles, how historical versions are preserved and accessed, and how implementers should handle transitions between versions. Clear maintenance processes ensure that terminology resources remain current, relevant, and consistently applied across the Medicaid enterprise.

2. **Value Set Documentation**:
   - **Complete FSH definitions for all value sets**, providing formal, machine-readable representations of state-specific value sets that conform to FHIR standards. These FSH definitions should include all required metadata such as URL, version, publisher, and purpose, as well as complete inclusion and exclusion criteria that precisely define the value set's content. The definitions should use FHIR's compositional grammar to express complex value set composition rules, such as including codes from multiple code systems, including codes based on hierarchical relationships, or excluding specific codes from broader inclusions. The FSH format ensures that value sets can be properly expanded, validated, and incorporated into FHIR servers and validation tools. States should maintain these definitions in version-controlled repositories and make them available through both human-readable documentation and computable artifacts.

   - **Binding strength recommendations**, providing clear guidance on how strictly the value set should be applied in different contexts. These recommendations should specify the appropriate binding strength (required, extensible, preferred, or example) for each context where the value set is used, with justification for the recommended strength based on interoperability requirements, regulatory considerations, and implementation flexibility needs. For extensible bindings, the documentation should include specific guidance on acceptable extension approaches, preferred alternative terminologies, and documentation requirements for extensions. These binding recommendations help implementers understand how to properly apply value sets in their systems while balancing standardization with local requirements.

   - **Usage context and constraints**, documenting the specific scenarios, elements, and profiles where the value set should be applied. This documentation should include the FHIR elements or extensions where the value set is intended to be bound, the profiles or implementation guides that reference the value set, and any constraints or conditions that affect value set application. For value sets with complex inclusion logic or context-dependent interpretation, the documentation should include examples and explanations that illustrate proper usage. The documentation should also address any interdependencies between value sets or between value sets and other artifacts such as profiles or extensions. This contextual information helps implementers understand not just what codes are included in the value set, but when and how the value set should be used in their implementations.

3. **Mapping Documentation**:
   - **ConceptMap resources for mappings to standard codes**, providing formal, machine-readable representations of the relationships between state-specific codes and standard terminologies. These ConceptMap resources should include comprehensive metadata such as URL, version, source and target value sets or code systems, and purpose. The mappings should cover all codes in the source terminology, with appropriate equivalence indicators (equivalent, wider, narrower, inexact) that accurately represent the semantic relationship between source and target concepts. For complex mappings where a single source code maps to multiple target codes or where context affects the mapping, the ConceptMap should include detailed comments explaining the mapping logic and usage guidance. These formal mapping resources enable automated translation between terminologies, supporting interoperability between state-specific systems and standard-based systems.

   - **Equivalence documentation**, providing detailed explanations of the semantic relationships between mapped concepts and the implications of these relationships for data interpretation and processing. This documentation should explain the meaning of each equivalence type used in the mappings (equivalent, wider, narrower, inexact), with examples illustrating how these relationships affect data interpretation. For inexact mappings, the documentation should explain the nature and significance of the semantic differences between source and target concepts, helping implementers understand the limitations of the mapping. For mappings with complex rules or context dependencies, the documentation should include decision trees or logic tables that guide proper mapping application. This detailed equivalence documentation helps implementers understand not just the mappings themselves, but their implications for data quality and semantic precision.

   - **Usage guidance for implementers**, providing clear instructions on how to apply the mappings in different scenarios and contexts. This guidance should address when mappings should be applied (during data entry, exchange, or analysis), how to handle mapping ambiguities or failures, and what additional information should be preserved when translating between terminologies. The guidance should include recommendations for validation and quality assurance of mapped data, strategies for handling terminology version changes that affect mappings, and approaches for monitoring and improving mapping accuracy over time. For mappings used in automated processes, the guidance should include performance considerations, error handling strategies, and logging recommendations. This practical guidance helps implementers effectively integrate terminology mappings into their systems and processes, ensuring consistent and appropriate application of the mappings across the Medicaid enterprise.

##### Terminology Server Requirements

States should consider providing terminology services:

1. **FHIR Terminology Server**:
   - **Hosting state-specific code systems and value sets** on a standards-compliant FHIR terminology server that provides centralized, authoritative access to all state-specific terminology resources. This server should implement the FHIR Terminology Module capabilities, including support for CodeSystem, ValueSet, ConceptMap, and NamingSystem resources. The server should provide a stable, high-availability platform with appropriate security controls, including authentication, authorization, and audit logging. Performance considerations should include caching strategies for frequently accessed resources, optimization for value set expansion operations, and scalability to handle peak loads during implementation cycles or reporting periods. The terminology server should be integrated with the state's broader FHIR infrastructure, potentially including shared authentication mechanisms, consistent metadata approaches, and coordinated versioning strategies. This centralized terminology service enables consistent terminology application across the Medicaid enterprise, simplifies terminology maintenance, and provides a single source of truth for terminology resources.

   - **Supporting standard FHIR terminology operations** as defined in the FHIR specification, ensuring that implementers can interact with terminology resources using standardized, well-documented APIs. These operations should include, at minimum, the core terminology operations such as ValueSet $expand, CodeSystem $lookup, CodeSystem $validate-code, ValueSet $validate-code, and ConceptMap $translate. The server should also support the standard RESTful operations for terminology resources, including create, read, update, search, and history operations with appropriate security controls. Advanced terminology operations such as ValueSet $validate-code with context-based validation, CodeSystem $subsumes for hierarchy testing, and batch/transaction processing should be considered based on implementation needs. The server should provide comprehensive documentation of its supported operations, including examples, error handling guidance, and performance characteristics. By supporting standard operations, the terminology server enables implementers to use existing FHIR tools and libraries to interact with state-specific terminology resources.

   - **Providing value set expansion capabilities** that efficiently generate complete lists of codes included in value sets based on their compositional definitions. These expansion capabilities should handle complex value set inclusion and exclusion criteria, including hierarchical relationships (is-a, descends-from), value set references, and filter criteria. The expansion engine should support parameters such as expansion date, language, and include designations to customize the expansion results for different use cases. Performance optimizations should include caching of frequently used expansions, incremental expansion updates when underlying code systems change, and pagination for large expansions. The server should provide both synchronous expansion for interactive use cases and potentially asynchronous expansion for very large value sets. Expansion results should include metadata such as expansion parameters, timestamp, and included code system versions to ensure reproducibility and traceability. These robust expansion capabilities ensure that implementers have access to complete, accurate code lists for validation, user interface population, and data analysis.

2. **Terminology Distribution**:
   - **Regular publication of terminology updates** according to a well-defined schedule that balances the need for currency with the stability requirements of production systems. This publication schedule should include both routine updates (e.g., quarterly releases for normal maintenance) and mechanisms for urgent updates when necessary (e.g., for regulatory changes or critical corrections). The publication process should include appropriate quality assurance steps, including validation of terminology resources, verification of backward compatibility or impact assessment for breaking changes, and testing in representative environments before production release. Each publication should include both human-readable documentation and machine-readable artifacts in standard formats (FSH, JSON, XML). The publication schedule should be communicated to all stakeholders well in advance, with appropriate notifications when updates are available. This regular, predictable publication process ensures that implementers have access to current terminology while allowing them to plan for and manage updates to their systems.

   - **Change logs for terminology changes** that provide detailed, structured documentation of all modifications to terminology resources between versions. These change logs should identify each affected resource (CodeSystem, ValueSet, ConceptMap) by URL and version, and categorize changes by type (addition, modification, deprecation, retirement). For code systems, the change log should document new codes, changes to existing code descriptions or properties, status changes (active to deprecated), and code retirements. For value sets, the change log should document changes to inclusion or exclusion criteria, changes to metadata or binding recommendations, and implications for value set expansion results. For concept maps, the change log should document new mappings, changed equivalence relationships, and removed mappings. The change logs should include both technical details for implementers and business context explaining the rationale for changes. These comprehensive change logs help implementers understand the impact of terminology updates on their systems and data, supporting impact assessment and migration planning.

   - **Versioning strategy for terminology artifacts** that ensures stability, traceability, and appropriate evolution of terminology resources over time. This strategy should define version numbering schemes (e.g., semantic versioning with major.minor.patch components) with clear criteria for incrementing each version component based on the nature and impact of changes. The strategy should address both internal development versions and published releases, with appropriate lifecycle states (draft, review, approved, published, deprecated, retired). Version identifiers should be embedded in resource metadata, resource URLs, and file names to ensure clear identification of resource versions. The strategy should include policies for version retention, including how long historical versions remain available and through what mechanisms. For value sets with extensional definitions (explicit code lists), the strategy should address how to handle value set expansion over time, potentially including expansion parameters for specific dates or version snapshots. This comprehensive versioning strategy ensures that terminology resources can evolve to meet changing needs while maintaining stability and backward compatibility for existing implementations.

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
   - For required bindings, reject instance data with codes outside the value set. Validation should be implemented at multiple levels, including API endpoints, data import processes, and user interfaces, to ensure consistent enforcement of required bindings. Error messages should clearly indicate which element contains an invalid code, what value set is expected, and where to find valid codes. Consider providing tooling that helps users select valid codes during data entry, such as searchable dropdown lists populated from the bound value sets. For system-to-system interfaces, provide clear documentation of validation rules and testing tools that verify conformance before production deployment.
   
   - For extensible bindings, warn about codes outside the value set but do not reject. Warnings should be informative rather than blocking, providing guidance on preferred codes while allowing the transaction to proceed. Consider implementing a review process for frequently used extensions to identify patterns that might inform value set updates or local extensions. Logging and analytics on warning frequency can help identify areas where the standard value sets might need enhancement. User interfaces should clearly distinguish between standard codes and extensions, potentially using visual cues or explicit labeling to indicate when non-standard codes are being used.

2. **Display**: Ensure systems can display both standard codes and extended codes.
   - Include display text for all codes, ensuring that the displayed text accurately represents the code's meaning in a user-friendly format. For standard codes, use the official display text from the code system to maintain consistency across implementations. For extended codes, develop clear naming conventions that convey the code's meaning while distinguishing it from standard codes. Consider the display needs of different user types, potentially providing both technical codes and user-friendly descriptions depending on the context and user role.
   
   - Consider including the source of the code (e.g., "NUCC", "State-specific") in displays to help users understand the origin and authority of the code. This source information can be particularly important when displaying data received from external systems, as it provides context for interpreting the code. Visual indicators such as icons, color coding, or explicit labels can help users quickly distinguish between standard codes and extensions. For reporting and analysis purposes, the ability to filter or group by code source can help identify patterns in code usage across the system.

3. **Interoperability**: Consider how extended codes will affect interoperability.
   - Document extensions in implementation guides, providing comprehensive information about extended codes to facilitate correct interpretation by receiving systems. This documentation should include not just the codes themselves but also their definitions, relationships to standard codes, usage context, and governance processes. Consider publishing formal FHIR CodeSystem and ValueSet resources for your extensions, following the patterns described in the State-Specific Terminology section of this guide. These formal definitions enable automated processing and validation of extended codes.
   
   - Consider mapping to standard codes when exchanging data with external systems, especially when those systems may not understand your extended codes. Implement formal ConceptMap resources that define the relationships between your extended codes and standard codes, with appropriate equivalence indicators (equivalent, wider, narrower, inexact) to convey the precision of the mapping. These mappings can be used for automated translation during data exchange, enabling systems to convert between local and standard codes as needed. For codes that cannot be adequately mapped to standards, ensure that sufficient context and definition information is included in the exchange to enable correct interpretation.

4. **Versioning**: Be aware of value set versioning.
   - Document which version of each value set is being used in your implementation, including both the version of the IG and the specific versions of referenced external terminologies. This documentation should be included in system metadata, implementation guides, and interface specifications to ensure clear communication about terminology expectations. Consider implementing version indicators in your data model, particularly for long-lived data where the interpretation might change as terminologies evolve.
   
   - Consider how to handle value set updates, developing clear policies and procedures for terminology maintenance. These procedures should address how and when new versions of standard terminologies are adopted, how local extensions are updated to align with terminology changes, and how data migration or translation is handled during terminology transitions. Versioning strategies should consider both backward compatibility (ability to correctly interpret historical data) and forward compatibility (ability to accommodate future terminology changes with minimal disruption). Testing procedures should verify correct handling of both current and historical codes, with particular attention to codes that have been deprecated, split, or redefined across versions.

### Standard Terminology Resources

This implementation guide references the following standard terminology resources:

#### Code Systems

- **[SNOMED CT](https://www.snomed.org/)** - Systematized Nomenclature of Medicine Clinical Terms, a comprehensive, multilingual clinical healthcare terminology developed by SNOMED International. SNOMED CT provides a standardized way to represent clinical phrases captured by clinicians and enables automatic interpretation of these phrases. It is particularly valuable for provider credentialing as it contains detailed hierarchies for provider specialties, procedures, and qualifications. SNOMED CT is distributed through the National Library of Medicine's Unified Medical Language System (UMLS) in the United States and requires a license for use, though this license is available at no cost to US-based users through the NLM. When implementing SNOMED CT, consider using the US Edition, which includes US-specific extensions and refinements to the International Edition. SNOMED CT's concept model, with its defined relationships between concepts, enables sophisticated reasoning capabilities that can support advanced validation and decision support in provider enrollment systems.

- **[LOINC](https://loinc.org/)** - Logical Observation Identifiers Names and Codes, a common language for identifying health measurements, observations, and documents. Developed and maintained by the Regenstrief Institute, LOINC is particularly useful in provider credentialing for standardizing the representation of credentials, certifications, and qualification documentation. LOINC's document ontology provides codes for various types of provider documentation, such as license certificates, board certifications, and educational diplomas. The LOINC terminology is freely available and does not require a license for use, making it accessible for all implementations. When using LOINC in provider enrollment systems, focus on the document ontology section for credential documentation types and the clinical observation codes for any relevant provider assessments or screenings.

- **[NUCC Taxonomy](https://www.nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40)** - National Uniform Claim Committee Provider Taxonomy, a hierarchical code set that categorizes healthcare providers by their primary specialty, area of specialization, and provider type. This taxonomy is the primary standard for provider classification in the United States and is particularly important for Medicaid provider enrollment and credentialing. The NUCC Taxonomy is updated twice yearly (January and July) and is freely available for download from the NUCC website. The taxonomy includes detailed classifications for both individual providers (physicians, nurses, therapists, etc.) and organizational providers (hospitals, group practices, suppliers, etc.). When implementing the NUCC Taxonomy, consider the hierarchical relationships between codes, as these can be leveraged for flexible searching and reporting. The taxonomy's three-level hierarchy (provider type, classification, specialization) enables both broad and specific categorization of providers, supporting various business needs from general provider type reporting to specialty-specific network adequacy analysis.

- **[CPT](https://www.ama-assn.org/practice-management/cpt)** - Current Procedural Terminology, a medical code set maintained by the American Medical Association (AMA) that describes medical, surgical, and diagnostic services. While primarily used for billing and claims processing, CPT codes are relevant to provider credentialing as they can define a provider's scope of practice and service capabilities. CPT codes are particularly useful for defining the specific procedures that different provider types are authorized to perform, supporting service-level credentialing and privileging processes. The CPT code set is copyrighted by the AMA and requires a license for use, with various licensing options available based on implementation needs. When using CPT in provider enrollment systems, consider focusing on the code ranges most relevant to scope of practice definitions and service authorization, rather than implementing the complete code set if not needed for billing purposes.

- **[ICD-10](https://www.cdc.gov/nchs/icd/icd10.htm)** - International Classification of Diseases, 10th Revision, a medical classification list by the World Health Organization (WHO) that contains codes for diseases, signs and symptoms, abnormal findings, complaints, social circumstances, and external causes of injury or diseases. In provider credentialing, ICD-10 codes can be relevant for defining clinical specialties and areas of expertise, particularly for specialists who focus on specific conditions or disease categories. The US uses a clinical modification (ICD-10-CM) for diagnosis coding and a procedure coding system (ICD-10-PCS) for inpatient procedures. These code sets are freely available from the Centers for Disease Control and Prevention (CDC) and the Centers for Medicare & Medicaid Services (CMS) websites. When implementing ICD-10 in provider enrollment systems, consider focusing on the high-level categories that define broad specialty areas rather than the detailed codes used for specific diagnoses, unless detailed clinical specialty definition is required.

- **[HCPCS](https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo)** - Healthcare Common Procedure Coding System, a set of health care procedure codes based on the American Medical Association's Current Procedural Terminology (CPT). HCPCS Level II codes, maintained by CMS, cover products, supplies, and services not included in CPT, such as ambulance services, durable medical equipment, and certain drugs. In provider credentialing, HCPCS codes can help define the specific services and supplies that providers are authorized to deliver, particularly for non-physician practitioners and suppliers. HCPCS codes are freely available from the CMS website and are updated quarterly. When implementing HCPCS in provider enrollment systems, focus on the code ranges relevant to the provider types being credentialed, such as durable medical equipment codes for DME suppliers or prosthetic/orthotic codes for relevant specialists.

#### Value Set Resources

- **[FHIR Terminology Service](https://terminology.hl7.org/)** - HL7 FHIR Terminology Service, a publicly accessible reference implementation of the FHIR terminology service specification that provides access to standard FHIR terminology resources. This service supports key terminology operations such as value set expansion, code lookup, and concept validation, enabling implementers to test and validate their terminology implementations against a standard reference. The service includes many of the core FHIR value sets and code systems, though it does not contain all possible terminologies due to licensing restrictions on some code systems. Implementers can use this service during development and testing to ensure their systems correctly implement FHIR terminology capabilities, though production implementations should consider deploying their own terminology servers with complete sets of required terminologies. The service supports both interactive web-based access for human users and API access for automated systems, making it valuable for both development reference and automated testing.

- **[Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/)** - National Library of Medicine Value Set Authority Center, a repository for value sets created by external groups and used in quality measures and other health IT applications. VSAC is particularly valuable for provider credentialing as it contains standardized value sets for provider types, specialties, and credentials that have been vetted and approved by authoritative bodies. The repository includes value sets from various standards development organizations, federal agencies, and clinical professional groups, providing a comprehensive source of standardized terminology resources. Access to VSAC requires a free UMLS account, which also provides access to many of the underlying code systems like SNOMED CT. VSAC provides both human-readable web interfaces for browsing and searching value sets and machine-readable downloads and APIs for system integration. When implementing provider enrollment systems, consider leveraging VSAC's provider-related value sets for standard provider categorization and credential representation.

- **[CMS Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/valueset/expansions?pr=cms)** - CMS-specific value sets within the National Library of Medicine's VSAC platform, focusing on value sets authored or endorsed by the Centers for Medicare & Medicaid Services. These value sets are particularly relevant for Medicaid provider enrollment and credentialing as they represent CMS's standardized terminology for various aspects of healthcare delivery and administration. The CMS value sets include provider taxonomies, specialty designations, and service categories that align with CMS reporting requirements and program specifications. These value sets are regularly updated to reflect changes in CMS programs and policies, making them an authoritative source for terminology that will be compatible with CMS systems and reporting mechanisms. When implementing Medicaid provider enrollment systems, prioritize these CMS-specific value sets to ensure alignment with federal reporting requirements and to facilitate interoperability with other CMS systems.

#### Medicaid-Specific Resources

- **[T-MSIS Coding Blog](https://www.medicaid.gov/medicaid/data-systems/macbis/transformed-medicaid-statistical-information-system-t-msis/t-msis-coding-blog/index.html)** - Transformed Medicaid Statistical Information System Coding Blog, a CMS resource that provides guidance on coding and reporting for T-MSIS, the federal system that collects Medicaid and CHIP operational data. This blog is particularly valuable for provider enrollment implementations as it includes specific guidance on provider taxonomy coding, enrollment status representation, and other provider-related data elements that states must report to CMS. The blog regularly publishes updates on coding requirements, clarifications on ambiguous scenarios, and responses to state questions, making it an essential resource for staying current with federal reporting expectations. Content is organized by topic area, including dedicated sections for provider data elements, making it easy to find relevant information. When implementing provider enrollment systems, regularly review this blog to ensure alignment with current T-MSIS reporting requirements and to understand how CMS interprets various provider data scenarios.

- **[CMS Medicaid Data](https://www.medicaid.gov/medicaid/data-systems/index.html)** - Medicaid Data Systems information, a comprehensive resource on CMS's Medicaid data systems, including technical specifications, data dictionaries, and implementation guides. This resource is essential for provider enrollment implementations as it defines the data structures and formats required for federal reporting, including detailed specifications for provider-related data elements. The site includes technical documentation for various Medicaid data systems, including T-MSIS, MACPro, and other systems that interact with provider data. Documentation typically includes data dictionaries, validation rules, submission formats, and implementation timelines. When implementing provider enrollment systems, use these resources to ensure that your data model captures all federally required provider elements in formats compatible with CMS systems, facilitating accurate and efficient federal reporting.

- **[Medicaid Provider Enrollment Compendium (MPEC)](https://www.medicaid.gov/medicaid/program-integrity/affordable-care-act-program-integrity-provisions/index.html)** - Guidance on Medicaid provider enrollment, a CMS document that consolidates and interprets the various federal regulations governing Medicaid provider enrollment. This compendium is an authoritative source for understanding the regulatory requirements that provider enrollment systems must support, including screening levels, verification requirements, and enrollment process specifications. The MPEC includes detailed guidance on implementing specific regulatory provisions, clarifications on ambiguous requirements, and best practices for effective provider screening and enrollment. It is periodically updated to reflect new regulations, policy interpretations, and emerging program integrity concerns. When implementing provider enrollment systems, use the MPEC as a primary reference for understanding the business requirements and processes that the system must support to ensure compliance with federal regulations. The compendium can help translate regulatory language into specific system requirements and validation rules.
