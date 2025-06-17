This implementation guide supports compliance with federal regulations governing Medicaid provider enrollment and credentialing. The primary regulatory framework is established in [Title 42 of the Code of Federal Regulations (CFR)](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455), specifically Part 455 - Program Integrity: Medicaid.

> **Note:** All regulatory citations in this document reference the [Electronic Code of Federal Regulations (eCFR)](https://www.ecfr.gov/), which is the official source for federal regulations maintained by the U.S. Government Publishing Office.

### Key Regulatory Requirements

#### [42 CFR 455.410](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.410) - Enrollment and Screening of Providers

##### Provider Enrollment Requirements
All providers must enroll in Medicaid before submitting claims for reimbursement. The regulation establishes specific requirements for provider enrollment:

- **Regulatory Text**:
  > *"ยง 455.410 Enrollment and screening of providers.*
  > 
  > *(a) The State Medicaid agency must require all providers to be screened under to this subpart.*
  > 
  > *(b) The State Medicaid agency must require all ordering or referring physicians or other professionals providing services under the State plan or under a waiver of the plan to be enrolled as participating providers.*
  > 
  > *(c) The State Medicaid agency may rely on the results of the provider screening performed by any of the following:*
  > 
  > *(1) Medicare contractors.*
  > 
  > *(2) Medicaid agencies or Children's Health Insurance Programs of other States.*
  > 
  > *(d) The State Medicaid agency must allow enrollment of all Medicare-enrolled providers and suppliers for purposes of processing claims to determine Medicare cost-sharing (as defined in section 1905(p)(3) of the Act) if the providers or suppliers meet all Federal Medicaid enrollment requirements, including, but not limited to, all applicable provisions of 42 CFR part 455, subparts B and E. This paragraph (d) applies even if the Medicare-enrolled provider or supplier is of a type not recognized by the State Medicaid Agency."*

- **Key Requirements**:
  - **Mandatory Screening**: All providers must be screened according to federal requirements
  - **Ordering/Referring Providers**: All ordering or referring physicians or professionals must be enrolled
  - **Screening Reciprocity**: States may rely on screening performed by Medicare contractors or other state Medicaid programs
  - **Medicare Provider Enrollment**: States must allow enrollment of Medicare-enrolled providers for cost-sharing claims processing

- **Enrollment Process Components**:
  - **Application Submission**: Providers must submit complete enrollment applications
  - **Disclosure Requirements**: Providers must disclose ownership, control, and financial relationships
  - **Background Screening**: All providers are subject to screening requirements based on risk level
  - **Revalidation**: Providers must revalidate enrollment periodically

**FHIR Mapping**: 
- `MedicaidPractitioner` and `MedicaidOrganization` profiles capture enrollment data
- `MedicaidEnrollmentStatusExtension` tracks enrollment status
- `MedicaidVerificationResult` documents screening results
- `MedicaidScreeningSource` extension documents the source of screening (Medicare, other state)
- `MedicaidProviderType` code system identifies ordering/referring provider status
- `MedicaidMedicareEnrollmentStatus` extension tracks Medicare enrollment for cost-sharing purposes

#### [42 CFR 455.450](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.450) - Screening Requirements

##### Risk-Based Provider Categorization
Providers are categorized into three risk levels with corresponding screening requirements as defined in 42 CFR 455.450:

> *"If a provider could fit within more than one risk level described in this section, the highest level of screening is applicable."*

###### Limited Risk Category
- **Regulatory Text**: 
  > *"(a) Screening for providers designated as limited categorical risk. When the State Medicaid agency designates a provider as a limited categorical risk, the State Medicaid agency must do all of the following:*
  > 
  > *(1) Verify that a provider meets any applicable Federal regulations, or State requirements for the provider type prior to making an enrollment determination.*
  > 
  > *(2) Conduct license verifications, including State licensure verifications in States other than where the provider is enrolling, in accordance with ยง 455.412.*
  > 
  > *(3) Conduct database checks on a pre- and post-enrollment basis to ensure that providers continue to meet the enrollment criteria for their provider type, in accordance with ยง 455.436."*

- **Criteria**: Physicians, non-physician practitioners with low risk of fraud
- **Screening Requirements**: 
  - Verification of provider meets applicable Federal/State requirements
  - License verification (including in other states)
  - Database checks (pre- and post-enrollment)
- **FHIR Mapping**: 
  - `MedicaidProviderRiskCategory` code system value "low"
  - `MedicaidVerificationResult` resources document verification of Federal/State requirements
  - `PractitionerRole.qualification` captures license verification results
  - `MedicaidDatabaseCheckResult` extension documents database check outcomes

###### Moderate Risk Category  
- **Regulatory Text**:
  > *"(b) Screening for providers designated as moderate categorical risk. When the State Medicaid agency designates a provider as a "moderate" categorical risk, a State Medicaid agency must do both of the following:*
  > 
  > *(1) Perform the "limited" screening requirements described in paragraph (a) of this section.*
  > 
  > *(2) Conduct on-site visits in accordance with ยง 455.432."*

- **Criteria**: Durable medical equipment suppliers, home health agencies
- **Screening Requirements**: 
  - All limited risk screening requirements, plus:
  - On-site visits in accordance with ยง 455.432
- **FHIR Mapping**: 
  - `MedicaidProviderRiskCategory` code system value "moderate"
  - All limited risk FHIR mappings, plus:
  - `MedicaidSiteVisitResult` extension documents on-site visit outcomes
  - `Provenance` resources track verification sources and methods

###### High Risk Category
- **Regulatory Text**:
  > *"(c) Screening for providers designated as high categorical risk. When the State Medicaid agency designates a provider as a "high" categorical risk, a State Medicaid agency must do both of the following:*
  > 
  > *(1) Perform the "limited" and "moderate" screening requirements described in paragraphs (a) and (b) of this section.*
  > 
  > *(2)(i) Conduct a criminal background check; and*
  > 
  > *(ii) Require the submission of a set of fingerprints in accordance with ยง 455.434."*

- **Criteria**: Providers with prior sanctions, new provider types with high fraud risk
- **Screening Requirements**: 
  - All limited and moderate risk screening requirements, plus:
  - Criminal background check
  - Fingerprint submission in accordance with ยง 455.434
- **FHIR Mapping**: 
  - `MedicaidProviderRiskCategory` code system value "high"
  - All limited and moderate risk FHIR mappings, plus:
  - `MedicaidBackgroundCheckResult` extension documents criminal background check results
  - `MedicaidFingerprintVerification` extension tracks fingerprint submission and verification

##### Adjustment of Risk Level
- **Regulatory Text**:
  > *"(e) Adjustment of risk level. The State agency must adjust the categorical risk level from "limited" or "moderate" to "high" when any of the following occurs:*
  > 
  > *(1) The State Medicaid agency imposes a payment suspension on a provider based on credible allegation of fraud, waste or abuse, the provider has an existing Medicaid overpayment, or the provider has been excluded by the OIG or another State's Medicaid program within the previous 10 years.*
  > 
  > *(2) The State Medicaid agency or CMS in the previous 6 months lifted a temporary moratorium for the particular provider type and a provider that was prevented from enrolling based on the moratorium applies for enrollment as a provider at any time within 6 months from the date the moratorium was lifted."*

- **FHIR Mapping**:
  - `MedicaidRiskLevelAdjustment` extension documents risk level changes
  - `MedicaidRiskAdjustmentReason` code system captures reasons for adjustment
  - `AuditEvent` resources track risk level adjustment history

#### [42 CFR 455.416](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.416) - Termination or Denial of Enrollment

##### Mandatory Denial Criteria
States must deny enrollment or terminate the enrollment of providers under specific circumstances as defined in 42 CFR 455.416:

- **Regulatory Text**:
  > *"ยง 455.416 Termination or denial of enrollment.*
  > 
  > *(b) Must deny enrollment or terminate the enrollment of any provider where any person with a 5 percent or greater direct or indirect ownership interest in the provider has been convicted of a criminal offense related to that person's involvement with the Medicare, Medicaid, or title XXI program in the last 10 years, unless the State Medicaid agency determines that denial or termination of enrollment is not in the best interests of the Medicaid program and the State Medicaid agency documents that determination in writing.*
  > 
  > *(c) Must deny enrollment or terminate the enrollment of any provider that is terminated on or after January 1, 2011, under title XVIII of the Act and under the Medicaid program or CHIP of any other State, and is currently included in the termination database under ยง 455.417.*
  > 
  > *(d) Must terminate the provider's enrollment or deny enrollment of the provider if the provider or a person with an ownership or control interest or who is an agent or managing employee of the provider fails to submit timely or accurate information, unless the State Medicaid agency determines that termination or denial of enrollment is not in the best interests of the Medicaid program and the State Medicaid agency documents that determination in writing.*
  > 
  > *(f) Must terminate or deny enrollment if the provider fails to permit access to provider locations for any site visits under ยง 455.432, unless the State Medicaid agency determines that termination or denial of enrollment is not in the best interests of the Medicaid program and the State Medicaid agency documents that determination in writing.*
  > 
  > *(g) May terminate or deny the provider's enrollment if CMS or the State Medicaid agencyโ��*
  > 
  > *(1) Determines that the provider has falsified any information provided on the application; or*
  > 
  > *(2) Cannot verify the identity of any provider applicant."*

- **Mandatory Denial/Termination Criteria**:
  1. **Criminal Convictions**: When a person with 5% or greater ownership interest has been convicted of a criminal offense related to Medicare, Medicaid, or CHIP in the last 10 years
  2. **Termination in Other Programs**: When a provider has been terminated from Medicare or another state's Medicaid/CHIP program after January 1, 2011
  3. **Information Submission Failures**: When a provider or person with ownership/control interest fails to submit timely or accurate information
  4. **Site Visit Restrictions**: When a provider fails to permit access for site visits

- **Discretionary Denial/Termination Criteria**:
  1. **False Information**: When a provider has falsified information on the application
  2. **Identity Verification**: When the identity of a provider applicant cannot be verified

**FHIR Mapping**:
- `MedicaidEnrollmentStatus` code "denied" or "terminated" with specific reason codes
- `MedicaidVerificationResult` documents verification failures with detailed reason codes
- `VerificationResult.primarySource` tracks verification sources
- `MedicaidTerminationReason` code system captures specific termination reasons
- `MedicaidTerminationDate` extension documents when termination occurred
- `MedicaidDenialReason` code system captures specific denial reasons

#### [42 CFR 455.470](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.470) - Temporary Moratoria

##### Moratorium Authority
The regulation establishes authority for both CMS and state Medicaid agencies to impose temporary moratoria on enrollment of new providers under specific circumstances:

- **Regulatory Text**:
  > *"§ 455.470 Temporary moratoria.*
  > 
  > *(b)(1) A State Medicaid agency may impose temporary moratoria on enrollment of new providers, or impose numerical caps or other limits that the State Medicaid agency identifies as having a significant potential for fraud, waste, or abuse and the Secretary has identified as being at high risk for fraud, waste, or abuse.*
  > 
  > *(2) The State Medicaid agency will impose temporary moratoria on enrollment of new providers or impose numerical caps or other limits that the State Medicaid agency identifies as having a significant potential for fraud, waste, or abuse and the Secretary has identified as being at high risk for fraud, waste, or abuse.*
  > 
  > *(3)(i) The State Medicaid agency is not required to impose such a moratorium if the State Medicaid agency determines that imposition of a temporary moratorium would adversely affect beneficiaries' access to medical assistance.*
  > 
  > *(ii) If a State Medicaid agency makes such a determination, the State Medicaid agency must notify the Secretary in writing.*
  > 
  > *(c)(1) The State Medicaid agency must impose the moratorium for an initial period of 6 months.*
  > 
  > *(2) If the State Medicaid agency determines that it is necessary, the State Medicaid agency may extend the moratorium in 6-month increments.*
  > 
  > *(3) Each time, the State Medicaid agency must document in writing the necessity for extending the moratorium."*

- **Key Requirements**:
  - **Authority**: Both CMS and state Medicaid agencies can impose temporary moratoria
  - **Target Providers**: Providers identified as having significant potential for fraud, waste, or abuse
  - **Duration**: Initial period of 6 months, with possible 6-month extensions
  - **Documentation**: States must document in writing the necessity for extending moratoria
  - **Beneficiary Access Exception**: States may choose not to impose moratoria if it would adversely affect beneficiaries' access to medical assistance

- **Implementation Requirements**:
  - States must notify the Secretary in writing if they determine a moratorium would adversely affect beneficiary access
  - States must document the necessity for extending moratoria beyond the initial 6-month period
  - States must obtain the Secretary's concurrence with imposition of moratoria

**FHIR Mapping**:
- `MedicaidApplicationStatus` code "on-hold" for moratorium periods
- `MedicaidMoratoriumReason` code system captures specific reasons for moratoria
- `MedicaidMoratoriumPeriod` extension documents the duration of moratoria
- `MedicaidMoratoriumExtension` extension tracks moratorium extensions with documentation
- `MedicaidBeneficiaryAccessDetermination` extension documents access determinations
- `AuditEvent` resources track moratorium implementation and extensions

#### [42 CFR 455.104](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-B/section-455.104) - Disclosure Requirements

##### Ownership and Control Disclosures
The regulation establishes specific requirements for disclosure of ownership and control information by Medicaid providers, fiscal agents, and managed care entities:

- **Regulatory Text**:
  > *"§ 455.104 Disclosure by Medicaid providers and fiscal agents: Information on ownership and control.*
  > 
  > *(b) What disclosures must be provided. The Medicaid agency must require that disclosing entities, fiscal agents, and managed care entities provide the following disclosures:*
  > 
  > *(1)(i) The name and address of any person (individual or corporation) with an ownership or control interest in the disclosing entity, fiscal agent, or managed care entity. The address for corporate entities must include as applicable primary business address, every business location, and P.O. Box address.*
  > 
  > *(ii) Date of birth and Social Security Number (in the case of an individual).*
  > 
  > *(iii) Other tax identification number (in the case of a corporation) with an ownership or control interest in the disclosing entity (or fiscal agent or managed care entity) or in any subcontractor in which the disclosing entity (or fiscal agent or managed care entity) has a 5 percent or more interest.*
  > 
  > *(2) Whether the person (individual or corporation) with an ownership or control interest in the disclosing entity (or fiscal agent or managed care entity) is related to another person with ownership or control interest in the disclosing entity as a spouse, parent, child, or sibling; or whether the person (individual or corporation) with an ownership or control interest in any subcontractor in which the disclosing entity (or fiscal agent or managed care entity) has a 5 percent or more interest is related to another person with ownership or control interest in the disclosing entity as a spouse, parent, child, or sibling.*
  > 
  > *(3) The name of any other disclosing entity (or fiscal agent or managed care entity) in which an owner of the disclosing entity (or fiscal agent or managed care entity) has an ownership or control interest.*
  > 
  > *(4) The name, address, date of birth, and Social Security Number of any managing employee of the disclosing entity (or fiscal agent or managed care entity).*
  > 
  > *(c) When the disclosures must be provided—(1) Disclosures from providers or disclosing entities. Disclosure from any provider or disclosing entity is due at any of the following times:*
  > 
  > *(i) Upon the provider or disclosing entity submitting the provider application.*
  > 
  > *(ii) Upon the provider or disclosing entity executing the provider agreement.*
  > 
  > *(iii) Upon request of the Medicaid agency during the re-validation of enrollment process under § 455.414.*
  > 
  > *(iv) Within 35 days after any change in ownership of the disclosing entity."*

- **Required Disclosures**:
  1. **Ownership Information**: 
     - Names and addresses of persons with ownership or control interest
     - Date of birth and Social Security Number (for individuals)
     - Tax identification numbers (for corporations)
     - Business addresses including all locations and P.O. Box addresses
  
  2. **Relationship Information**:
     - Family relationships (spouse, parent, child, sibling) between persons with ownership/control interest
     - Relationships between persons with ownership/control interest in the entity and in any subcontractor
  
  3. **Other Entity Ownership**:
     - Information about ownership in other disclosing entities, fiscal agents, or managed care entities
  
  4. **Managing Employee Information**:
     - Name, address, date of birth, and Social Security Number of any managing employee

- **Disclosure Timing Requirements**:
  - Upon submitting provider application
  - Upon executing provider agreement
  - During re-validation of enrollment
  - Within 35 days after any change in ownership

**FHIR Mapping**:
- `Organization.contact` for ownership and control persons
- `Organization.partOf` for organizational relationships
- `MedicaidOwnershipInterest` extension captures ownership percentages
- `MedicaidRelationshipType` code system for family and business relationships
- `MedicaidOwnershipDisclosure` extension tracks disclosure timing and content
- `MedicaidManagingEmployeeRelationship` extension links managing employees to organizations
- `MedicaidSubcontractorRelationship` extension documents subcontractor relationships
- `AuditEvent` resources track disclosure submissions and updates

#### [42 CFR 455.414](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.414) - Revalidation Requirements

##### Revalidation Cycle
The regulation establishes specific requirements for the revalidation of provider enrollment:

- **Regulatory Text**:
  > *"§ 455.414 Revalidation of enrollment.*
  > 
  > *The State Medicaid agency must revalidate the enrollment of all providers regardless of provider type at least every 5 years."*

- **Key Requirements**:
  - **Universal Application**: Applies to all providers regardless of provider type
  - **Minimum Frequency**: Revalidation must occur at least every 5 years
  - **State Responsibility**: The State Medicaid agency is responsible for ensuring revalidation occurs

- **Implementation Considerations**:
  - **Standard Revalidation**: Regular 5-year cycle for all providers
  - **Risk-Based Approach**: Many states implement more frequent revalidation for high-risk providers
  - **Triggered Revalidation**: Additional revalidation may be triggered by specific events or concerns
  - **Screening Requirements**: During revalidation, providers must undergo screening appropriate to their risk category as specified in § 455.450
  - **Disclosure Requirements**: Providers must submit updated disclosure information during revalidation as specified in § 455.104

**FHIR Mapping**:
- `MedicaidRevalidationCycle` extension documents the standard 5-year cycle
- `MedicaidRevalidationReason` code system for revalidation triggers (standard cycle, risk-based, event-triggered)
- `PractitionerRole.period` to track enrollment periods and revalidation dates
- `MedicaidVerificationResult` resources document revalidation screening results
- `MedicaidRevalidationStatus` tracks the current status of revalidation efforts
- `AuditEvent` resources provide audit trail of revalidation activities

### State-Specific Requirements

#### State Plan Amendments (SPAs)
States may implement additional requirements through SPAs:

- **Enhanced Screening**: Additional screening beyond federal minimums
- **Provider Types**: State-specific provider type definitions
- **Documentation**: Additional documentation requirements
- **Timelines**: Modified processing timelines

**FHIR Mapping**:
- State-specific extensions and profiles
- Configurable value sets for state requirements
- State customization framework in implementation guidance

#### Waiver Programs
States with approved waivers may have modified requirements:

- **1115 Waivers**: Demonstration waivers with alternative approaches
- **1915 Waivers**: Home and community-based services waivers
- **1932 Waivers**: Managed care waivers

**FHIR Mapping**:
- Waiver-specific profiles and extensions
- Program-specific identifiers and classifications

### Compliance Monitoring

#### Ongoing Monitoring Requirements ([42 CFR 455.436](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455/subpart-E/section-455.436))
States must implement ongoing monitoring as specified in 42 CFR 455.436:

- **Regulatory Text**:
  > *"ยง 455.436 Federal database checks.*
  > 
  > *The State Medicaid agency must do all of the following:*
  > 
  > *(a) Confirm the identity and determine the exclusion status of providers and any person with an ownership or control interest or who is an agent or managing employee of the provider through routine checks of Federal databases.*
  > 
  > *(b) Check the Social Security Administration's Death Master File, the National Plan and Provider Enumeration System (NPPES), the List of Excluded Individuals/Entities (LEIE), the Excluded Parties List System (EPLS), and any such other databases as the Secretary may prescribe.*
  > 
  > *(c)(1) Consult appropriate databases to confirm identity upon enrollment and reenrollment; and*
  > 
  > *(2) Check the LEIE and EPLS no less frequently than monthly."*

- **Required Database Checks**:
  - Social Security Administration's Death Master File
  - National Plan and Provider Enumeration System (NPPES)
  - List of Excluded Individuals/Entities (LEIE)
  - Excluded Parties List System (EPLS) (now part of SAM.gov)
  - Other databases as prescribed by the Secretary

- **Frequency Requirements**:
  - Upon enrollment and reenrollment: Confirm identity through database checks
  - Monthly (minimum): Check LEIE and EPLS/SAM.gov

- **Additional Monitoring Activities**:
  - Claims Analysis: Review of billing patterns and outliers
  - Site Visits: On-site inspections of provider facilities
  - Beneficiary Complaints: Investigation of beneficiary complaints

**FHIR Mapping**:
- `MedicaidVerificationResult` resources document each verification activity
- `MedicaidDatabaseCheckSchedule` extension tracks verification frequency
- `MedicaidDatabaseCheckResult` extension captures specific database check outcomes
- `AuditEvent` resources provide audit trail of all monitoring activities
- `MedicaidMonitoringFrequency` extension documents required monitoring schedule

#### Reporting Requirements
States must report to CMS on:

- **Enrollment Statistics**: Number of providers enrolled by type and risk category
- **Screening Results**: Results of screening activities
- **Denials and Terminations**: Reasons for enrollment denials and terminations
- **Program Integrity**: Fraud detection and prevention activities

**FHIR Mapping**:
- Measure resources for reporting metrics
- Aggregated data through FHIR reporting mechanisms

### Data Quality and Integrity

#### Data Validation Requirements
- **Real-time Validation**: Immediate validation of submitted data
- **Cross-system Verification**: Verification against external databases
- **Data Completeness**: Ensuring all required fields are populated
- **Data Accuracy**: Verification of submitted information

**FHIR Mapping**:
- FHIR validation rules and constraints
- OperationOutcome for validation results
- Provenance tracking for data sources

#### Audit Trail Requirements
- **Complete Audit Trail**: All system activities must be logged
- **Data Integrity**: Protection against unauthorized modifications
- **Access Controls**: Role-based access to sensitive data
- **Retention Requirements**: Long-term retention of audit logs

**FHIR Mapping**:
- AuditEvent resources for all system activities
- Provenance resources for data lineage
- Security labels for access control

### Privacy and Security

#### HIPAA Compliance
- **Administrative Safeguards**: Policies and procedures for data protection
- **Physical Safeguards**: Protection of physical systems and media
- **Technical Safeguards**: Access controls, encryption, and audit logs

**FHIR Mapping**:
- Security labels on FHIR resources
- OAuth 2.0 for authentication and authorization
- Encryption for data at rest and in transit

#### State Privacy Laws
- **Additional Privacy Requirements**: State-specific privacy protections
- **Consent Management**: Provider consent for data sharing
- **Data Minimization**: Limiting data collection to necessary information

**FHIR Mapping**:
- Consent resources for data sharing agreements
- Security labels for state-specific requirements

### Implementation Considerations

#### System Requirements
- **Scalability**: Support for large numbers of providers
- **Performance**: Sub-second response times for critical operations
- **Availability**: 99.9% uptime for enrollment systems
- **Disaster Recovery**: Backup and recovery procedures

#### Integration Requirements
- **External Systems**: Integration with licensing boards, exclusion databases
- **Real-time Processing**: Immediate processing of critical updates
- **Batch Processing**: Efficient processing of large data volumes
- **Error Handling**: Robust error handling and recovery

#### Testing and Validation
- **Compliance Testing**: Verification of regulatory compliance
- **Performance Testing**: Load and stress testing
- **Security Testing**: Penetration testing and vulnerability assessment
- **User Acceptance Testing**: Validation by end users

### Regulatory Updates

#### Monitoring Regulatory Changes
- **Federal Register**: Monitoring for new regulations and updates
- **CMS Guidance**: Implementation of new CMS guidance documents
- **State Notifications**: Tracking state-specific regulatory changes
- **Industry Updates**: Staying current with industry best practices

#### Change Management
- **Impact Assessment**: Evaluating impact of regulatory changes
- **Implementation Planning**: Planning for system updates
- **Testing and Validation**: Ensuring compliance with new requirements
- **Communication**: Notifying stakeholders of changes

### Conclusion

This FHIR implementation guide provides a comprehensive framework for compliance with federal and state Medicaid provider enrollment and credentialing regulations. By mapping regulatory requirements to FHIR resources and profiles, the guide enables states to implement compliant systems while maintaining flexibility for state-specific requirements.

The implementation supports:
- Complete regulatory compliance with [42 CFR Part 455](https://www.ecfr.gov/current/title-42/chapter-IV/subchapter-C/part-455)
- Flexible state customization capabilities
- Robust audit and monitoring capabilities
- Integration with external verification systems
- Scalable and secure system architecture

### Additional Resources

- [Centers for Medicare & Medicaid Services (CMS)](https://www.cms.gov/)
- [Medicaid.gov - Program Integrity](https://www.medicaid.gov/medicaid/program-integrity/index.html)
- [Electronic Code of Federal Regulations (eCFR)](https://www.ecfr.gov/)
- [CMS Provider Enrollment & Oversight Group](https://www.cms.gov/Medicare/Provider-Enrollment-and-Certification/MedicareProviderSupEnroll)
- [Office of Inspector General (OIG) Exclusion Program](https://oig.hhs.gov/exclusions/)
