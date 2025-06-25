# Medicaid Provider Credentialing and Enrollment FHIR Implementation Guide

[![FHIR Version](https://img.shields.io/badge/FHIR-4.0.1-blue.svg)](http://hl7.org/fhir/R4/)
[![IG Status](https://img.shields.io/badge/Status-Draft-yellow.svg)](http://hl7.org/fhir/us/medicaid-provider-credentialing)
[![License](https://img.shields.io/badge/License-CC0--1.0-green.svg)](LICENSE)

## Description

The Medicaid Provider Credentialing and Enrollment Implementation Guide provides a standardized FHIR-based approach for managing provider credentialing and enrollment processes within Medicaid programs. This IG is designed to align with the Medicaid Information Technology Architecture (MITA) 3.0 framework and leverages FHIR US Core 6.1.0 and Da Vinci PDex Plan-Net specifications to create a comprehensive, interoperable solution for state Medicaid agencies and their partners.

**Canonical URL:** `http://hl7.org/fhir/us/medicaid-provider-credentialing`  
**Version:** 0.1.0 (Draft)  
**FHIR Version:** 4.0.1

## Purpose

This Implementation Guide addresses the following key areas:

- **Provider Enrollment**: Standardized processes for enrolling healthcare providers in Medicaid programs, including initial enrollment, revalidation, and disenrollment workflows
- **Credentialing Workflows**: FHIR-based representation of provider credentialing activities, including primary source verification and ongoing monitoring
- **Data Exchange**: Interoperable data exchange between state Medicaid agencies, providers, credentialing organizations, and verification services
- **MITA Alignment**: Compliance with MITA business and technical architecture principles, supporting states in achieving higher MITA maturity levels
- **Quality Assurance**: Data quality frameworks and validation processes ensuring accurate provider information throughout the credentialing lifecycle

## Key Features

### FHIR Profiles

#### Core Provider Profiles
- **MedicaidPractitioner**: Individual healthcare providers participating in or applying to participate in the Medicaid program
- **MedicaidPractitionerRole**: A practitioner's role within the Medicaid program, including enrollment and credentialing status
- **MedicaidOrganization**: Healthcare organizations participating in the Medicaid program
- **MedicaidLocation**: Locations where Medicaid services are provided
- **MedicaidHealthcareService**: Healthcare services covered by Medicaid

#### Supporting Profiles
- **MedicaidEndpoint**: Technical endpoints for Medicaid data exchange
- **MedicaidVerificationResult**: Results of verification activities for Medicaid provider credentialing

### Extensions

- **MedicaidProviderIdExtension**: State-specific Medicaid provider identifier
- **MedicaidEnrollmentStatusExtension**: Current enrollment status in the Medicaid program
- **MedicaidCredentialingStatusExtension**: Current credentialing status for Medicaid participation
- **MedicaidSpecialtyBoardCertificationExtension**: Board certification information for specialty practice

### Value Sets

- **MedicaidProviderTypes**: Types of providers that can participate in Medicaid programs
- **MedicaidEnrollmentStatuses**: Status values for Medicaid provider enrollment
- **MedicaidCredentialingStatuses**: Status values for Medicaid provider credentialing
- **MedicaidSpecialtyCodes**: Specialty codes for Medicaid providers
- **MedicaidVerificationStatuses**: Status values for verification activities
- **MedicaidQualificationTypes**: Types of qualifications for Medicaid providers

### Code Systems

- **MedicaidEnrollmentStatus**: Status codes for Medicaid provider enrollment (enrolled, pending, suspended, terminated, denied, revalidation-required)
- **MedicaidCredentialingStatus**: Status codes for Medicaid provider credentialing (credentialed, in-process, incomplete, denied, expired, provisional, recredentialing)
- **MedicaidVerificationStatus**: Status codes for verification activities (verified, failed, pending, expired, not-required)
- **MedicaidQualificationType**: Types of qualifications (medical-license, nursing-license, board-certification, dea-registration, etc.)
- **MedicaidProviderSpecialtyBoard**: Medical specialty boards recognized for credentialing
- **MedicaidApplicationStatus**: Status codes for provider applications
- **MedicaidRevalidationReason**: Reasons for provider revalidation
- **MedicaidScreeningLevel**: Screening levels for provider enrollment (limited, moderate, high)
- **MedicaidProviderRiskCategory**: Risk categories for providers (low, moderate, high, provisional)

## Dependencies

This IG depends on the following specifications:

- **FHIR R4** (4.0.1): Base FHIR specification
- **US Core 6.1.0**: Foundation profiles for US healthcare data exchange
- **Da Vinci PDex Plan-Net 1.1.0**: Provider directory and network management capabilities

## Getting Started

### Prerequisites

- **FHIR Knowledge**: Understanding of FHIR R4 resource modeling and profiling
- **Medicaid Domain Knowledge**: Familiarity with Medicaid provider enrollment and credentialing processes
- **MITA Framework**: Basic knowledge of MITA framework (recommended)
- **Development Tools**: 
  - Node.js and npm for SUSHI (FHIR Shorthand)
  - Java 8+ for HL7 FHIR IG Publisher
  - Git for version control

### Building the Implementation Guide

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd medicaid-provider-cred-mgmt-fsh
   ```

2. **Install SUSHI (FHIR Shorthand)**
   ```bash
   npm install -g fsh-sushi
   ```

3. **Build the Implementation Guide**
   ```bash
   # Windows
   ./_genonce.bat
   
   # macOS/Linux
   ./_genonce.sh
   ```

4. **View the Generated IG**
   Open `output/index.html` in your browser to view the complete implementation guide.

### Project Structure

```
medicaid-provider-cred-mgmt-fsh/
├── input/
│   ├── fsh/                          # FHIR Shorthand definitions
│   │   ├── profiles.fsh              # FHIR profiles
│   │   ├── extensions.fsh            # Extensions
│   │   ├── valuesets.fsh             # Value sets
│   │   ├── codesystems.fsh           # Code systems
│   │   ├── examples.fsh              # Example resources
│   │   └── searchparameters.fsh      # Search parameters
│   └── pagecontent/                  # Implementation guide content
│       ├── index.md                  # Main page
│       ├── mita-overview.md          # MITA framework alignment
│       ├── profiles.md               # Profile documentation
│       ├── workflow-patterns.md      # Key workflows
│       ├── state-customization.md    # Customization guidance
│       ├── implementation-guidance.md # Implementation details
│       ├── security-privacy.md       # Security requirements
│       └── testing-framework.md      # Testing guidance
├── sushi-config.yaml                 # SUSHI configuration
├── ig.ini                           # IG Publisher configuration
└── _genonce.sh/.bat                 # Build scripts
```

## Implementation Guidance

### For State Medicaid Agencies

**Getting Started:**
1. Review the [MITA Overview](input/pagecontent/mita-overview.md) to understand framework alignment
2. Assess current systems using the [Transition Strategy](input/pagecontent/transition-strategy.md)
3. Plan state-specific customizations using the [State Customization Framework](input/pagecontent/state-customization.md)
4. Implement security controls per [Security and Privacy](input/pagecontent/security-privacy.md) guidance

**Key Implementation Areas:**
- **Data Migration**: Use TMSIS mapping guidance for transitioning from legacy systems
- **Workflow Configuration**: Adapt standard workflows to state-specific business processes
- **Integration**: Connect with existing MMIS and other state systems
- **Compliance**: Ensure MITA alignment and federal reporting requirements

### For Providers and MCOs

**Provider Implementation:**
- Understand data submission requirements through profile documentation
- Implement FHIR API interactions for enrollment and credentialing processes
- Plan for credential verification and ongoing monitoring workflows
- Ensure data quality and completeness for required elements

**MCO Implementation:**
- Implement delegated credentialing workflows using MedicaidVerificationResult
- Integrate with state systems for provider data exchange
- Support provider directory management using PDex Plan-Net alignment
- Implement network adequacy monitoring and reporting

### For Vendors

**System Development:**
- Build FHIR R4 compliant systems using the provided profiles and extensions
- Implement validation rules and business logic per the specification
- Support state customization through configurable extensions and value sets
- Ensure security and privacy controls meet HIPAA and state requirements

**Integration Considerations:**
- Support multiple state implementations with varying customizations
- Implement robust error handling and data quality validation
- Provide migration tools for transitioning from legacy systems
- Support real-time and batch processing patterns

## Use Cases

### Primary Use Cases

1. **Initial Provider Enrollment**
   - New providers applying to participate in Medicaid
   - Application submission, review, and approval workflows
   - Primary source verification of credentials

2. **Provider Revalidation**
   - Periodic renewal of provider enrollment status
   - Automated monitoring of credential expiration
   - Risk-based revalidation scheduling

3. **Credentialing Verification**
   - Primary source verification of provider credentials
   - Board certification validation
   - License and insurance verification

4. **Provider Directory Management**
   - Maintaining accurate provider directories
   - Supporting member access to care
   - Network adequacy monitoring

5. **Cross-State Provider Mobility**
   - Supporting providers practicing in multiple states
   - Interstate credential verification
   - Streamlined multi-state enrollment

### Advanced Use Cases

1. **Delegated Credentialing**
   - MCO-managed credentialing processes
   - State oversight and monitoring
   - Standardized credentialing data exchange

2. **Real-Time Monitoring**
   - Continuous monitoring of provider credentials
   - Automated alerts for credential changes
   - Proactive risk management

3. **Analytics and Reporting**
   - Provider network analysis
   - Credentialing performance metrics
   - Compliance and audit reporting

## Contributing

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Test your changes: `npm run build`
5. Commit your changes: `git commit -am 'Add some feature'`
6. Push to the branch: `git push origin feature/your-feature-name`
7. Test changes: `./_genonce.sh`
8. Submit a pull request with detailed description of changes

## Support

### Getting Help
- **FHIR Community**: [Join the #implementers stream](https://chat.fhir.org/#narrow/stream/179166-implementers)


