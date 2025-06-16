# CMS Regulations

## Overview

This implementation guide supports compliance with federal regulations governing Medicaid provider enrollment and credentialing. The primary regulatory framework is established in Title 42 of the Code of Federal Regulations (CFR), specifically Part 455 - Program Integrity: Medicaid.

## Key Regulatory Requirements

### 42 CFR 455.410 - Enrollment and Screening of Providers

#### Provider Enrollment Requirements
All providers must enroll in Medicaid before submitting claims for reimbursement. The enrollment process includes:

- **Application Submission**: Providers must submit complete enrollment applications
- **Disclosure Requirements**: Providers must disclose ownership, control, and financial relationships
- **Background Screening**: All providers are subject to screening requirements
- **Revalidation**: Providers must revalidate enrollment every 5 years

**FHIR Mapping**: 
- `MedicaidPractitioner` and `MedicaidOrganization` profiles capture enrollment data
- `MedicaidEnrollmentStatusExtension` tracks enrollment status
- `MedicaidVerificationResult` documents screening results

### 42 CFR 455.450 - Screening Requirements

#### Risk-Based Provider Categorization
Providers are categorized into three risk levels with corresponding screening requirements:

##### Limited Risk Category
- **Criteria**: Physicians, non-physician practitioners with low risk of fraud
- **Screening**: License verification, database checks
- **FHIR Mapping**: `MedicaidProviderRiskCategory` code system value "low"

##### Moderate Risk Category  
- **Criteria**: Durable medical equipment suppliers, home health agencies
- **Screening**: On-site visits, fingerprint-based criminal background checks
- **FHIR Mapping**: `MedicaidProviderRiskCategory` code system value "moderate"

##### High Risk Category
- **Criteria**: Providers with prior sanctions, new provider types with high fraud risk
- **Screening**: Enhanced screening including site visits, criminal background checks
- **FHIR Mapping**: `MedicaidProviderRiskCategory` code system value "high"

### 42 CFR 455.460 - Denial of Enrollment

#### Mandatory Denial Criteria
States must deny enrollment for providers who:

1. **Criminal Convictions**: Convicted of felony within 10 years
2. **Exclusions**: Currently excluded from Medicare, Medicaid, or CHIP
3. **License Issues**: License revoked or suspended
4. **False Information**: Submitted false or misleading information
5. **Unpaid Overpayments**: Have unpaid overpayments to Medicare or Medicaid

**FHIR Mapping**:
- `MedicaidEnrollmentStatus` code "denied" with reason codes
- `MedicaidVerificationResult` documents verification failures
- `VerificationResult.primarySource` tracks verification sources

### 42 CFR 455.470 - Temporary Moratoria

#### Moratorium Authority
CMS may impose temporary moratoria on enrollment of new providers when:

- **Fraud Risk**: High levels of fraud, waste, or abuse
- **Network Adequacy**: Sufficient providers already enrolled
- **Program Integrity**: Other program integrity concerns

**FHIR Mapping**:
- `MedicaidApplicationStatus` code "on-hold" for moratorium periods
- Extensions to capture moratorium reasons and duration

### 42 CFR 455.104 - Disclosure Requirements

#### Ownership and Control Disclosures
Providers must disclose:

1. **Ownership Information**: Names and addresses of persons with 5% or greater ownership
2. **Control Information**: Names of persons with operational or managerial control
3. **Financial Relationships**: Significant business transactions and relationships
4. **Subcontractor Information**: Information about significant subcontractors

**FHIR Mapping**:
- `Organization.contact` for ownership and control persons
- `Organization.partOf` for organizational relationships
- Extensions for detailed ownership percentages and relationships

### 42 CFR 455.436 - Revalidation Requirements

#### Revalidation Cycle
- **Standard Revalidation**: Every 5 years for all providers
- **High-Risk Revalidation**: More frequent revalidation for high-risk providers
- **Triggered Revalidation**: Based on specific events or concerns

**FHIR Mapping**:
- `MedicaidRevalidationReason` code system for revalidation triggers
- `PractitionerRole.period` to track enrollment periods
- `MedicaidVerificationResult` for revalidation documentation

## State-Specific Requirements

### State Plan Amendments (SPAs)
States may implement additional requirements through SPAs:

- **Enhanced Screening**: Additional screening beyond federal minimums
- **Provider Types**: State-specific provider type definitions
- **Documentation**: Additional documentation requirements
- **Timelines**: Modified processing timelines

**FHIR Mapping**:
- State-specific extensions and profiles
- Configurable value sets for state requirements
- State customization framework in implementation guidance

### Waiver Programs
States with approved waivers may have modified requirements:

- **1115 Waivers**: Demonstration waivers with alternative approaches
- **1915 Waivers**: Home and community-based services waivers
- **1932 Waivers**: Managed care waivers

**FHIR Mapping**:
- Waiver-specific profiles and extensions
- Program-specific identifiers and classifications

## Compliance Monitoring

### Ongoing Monitoring Requirements (42 CFR 455.450)
States must implement ongoing monitoring including:

- **Claims Analysis**: Review of billing patterns and outliers
- **Site Visits**: On-site inspections of provider facilities
- **Database Checks**: Regular checks against exclusion databases
- **Beneficiary Complaints**: Investigation of beneficiary complaints

**FHIR Mapping**:
- `MedicaidVerificationResult` for ongoing monitoring results
- Audit trail through FHIR AuditEvent resources
- Monitoring frequency in verification schedules

### Reporting Requirements
States must report to CMS on:

- **Enrollment Statistics**: Number of providers enrolled by type and risk category
- **Screening Results**: Results of screening activities
- **Denials and Terminations**: Reasons for enrollment denials and terminations
- **Program Integrity**: Fraud detection and prevention activities

**FHIR Mapping**:
- Measure resources for reporting metrics
- Aggregated data through FHIR reporting mechanisms

## Data Quality and Integrity

### Data Validation Requirements
- **Real-time Validation**: Immediate validation of submitted data
- **Cross-system Verification**: Verification against external databases
- **Data Completeness**: Ensuring all required fields are populated
- **Data Accuracy**: Verification of submitted information

**FHIR Mapping**:
- FHIR validation rules and constraints
- OperationOutcome for validation results
- Provenance tracking for data sources

### Audit Trail Requirements
- **Complete Audit Trail**: All system activities must be logged
- **Data Integrity**: Protection against unauthorized modifications
- **Access Controls**: Role-based access to sensitive data
- **Retention Requirements**: Long-term retention of audit logs

**FHIR Mapping**:
- AuditEvent resources for all system activities
- Provenance resources for data lineage
- Security labels for access control

## Privacy and Security

### HIPAA Compliance
- **Administrative Safeguards**: Policies and procedures for data protection
- **Physical Safeguards**: Protection of physical systems and media
- **Technical Safeguards**: Access controls, encryption, and audit logs

**FHIR Mapping**:
- Security labels on FHIR resources
- OAuth 2.0 for authentication and authorization
- Encryption for data at rest and in transit

### State Privacy Laws
- **Additional Privacy Requirements**: State-specific privacy protections
- **Consent Management**: Provider consent for data sharing
- **Data Minimization**: Limiting data collection to necessary information

**FHIR Mapping**:
- Consent resources for data sharing agreements
- Security labels for state-specific requirements

## Implementation Considerations

### System Requirements
- **Scalability**: Support for large numbers of providers
- **Performance**: Sub-second response times for critical operations
- **Availability**: 99.9% uptime for enrollment systems
- **Disaster Recovery**: Backup and recovery procedures

### Integration Requirements
- **External Systems**: Integration with licensing boards, exclusion databases
- **Real-time Processing**: Immediate processing of critical updates
- **Batch Processing**: Efficient processing of large data volumes
- **Error Handling**: Robust error handling and recovery

### Testing and Validation
- **Compliance Testing**: Verification of regulatory compliance
- **Performance Testing**: Load and stress testing
- **Security Testing**: Penetration testing and vulnerability assessment
- **User Acceptance Testing**: Validation by end users

## Regulatory Updates

### Monitoring Regulatory Changes
- **Federal Register**: Monitoring for new regulations and updates
- **CMS Guidance**: Implementation of new CMS guidance documents
- **State Notifications**: Tracking state-specific regulatory changes
- **Industry Updates**: Staying current with industry best practices

### Change Management
- **Impact Assessment**: Evaluating impact of regulatory changes
- **Implementation Planning**: Planning for system updates
- **Testing and Validation**: Ensuring compliance with new requirements
- **Communication**: Notifying stakeholders of changes

## Conclusion

This FHIR implementation guide provides a comprehensive framework for compliance with federal and state Medicaid provider enrollment and credentialing regulations. By mapping regulatory requirements to FHIR resources and profiles, the guide enables states to implement compliant systems while maintaining flexibility for state-specific requirements.

The implementation supports:
- Complete regulatory compliance with 42 CFR Part 455
- Flexible state customization capabilities
- Robust audit and monitoring capabilities
- Integration with external verification systems
- Scalable and secure system architecture

Regular updates to this guide will ensure continued compliance as regulations evolve and new requirements are established.
