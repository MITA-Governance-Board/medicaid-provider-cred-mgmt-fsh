This page outlines the process for providing feedback on this Implementation Guide (IG). Feedback from implementers is essential for improving the IG and ensuring it meets the needs of the Medicaid provider credentialing and enrollment community.

### Feedback Channels

#### GitHub Issues

The primary channel for providing feedback is through GitHub issues in the IG repository.

**Repository URL**: [https://github.com/HL7/fhir-us-medicaid-provider-credentialing](https://github.com/HL7/fhir-us-medicaid-provider-credentialing)

##### How to Submit an Issue

1. Navigate to the [Issues tab](https://github.com/HL7/fhir-us-medicaid-provider-credentialing/issues) in the repository
2. Click the "New Issue" button
3. Select the appropriate issue template:
   - **Bug Report**: For errors or inconsistencies in the IG
   - **Feature Request**: For suggestions to enhance the IG
   - **Implementation Experience**: For sharing implementation experiences
   - **Question**: For general questions about the IG
4. Fill out the template with as much detail as possible
5. Submit the issue

##### Issue Lifecycle

1. **Triage**: New issues are triaged by the IG maintainers within 5 business days
2. **Discussion**: The community discusses the issue and potential solutions
3. **Resolution**: The issue is resolved through one of the following:
   - Implementation in a future version of the IG
   - Clarification in the IG documentation
   - Closure with explanation if not applicable
4. **Notification**: The submitter is notified of the resolution

#### HL7 FHIR Implementation Support Forum

For questions and discussions about implementing this IG, you can use the HL7 FHIR Implementation Support Forum.

**Forum URL**: [https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Medicaid.20Provider.20Credentialing](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Medicaid.20Provider.20Credentialing)

##### How to Use the Forum

1. Create an account on chat.fhir.org if you don't already have one
2. Navigate to the Medicaid Provider Credentialing topic
3. Post your question or feedback
4. Monitor the topic for responses

#### Email Feedback

For organizations that cannot use GitHub or the FHIR forum, email feedback is accepted.

**Email Address**: [medicaid-provider-credentialing@hl7.org](mailto:medicaid-provider-credentialing@hl7.org)

##### Email Feedback Process

1. Send your feedback to the email address above
2. Include a clear subject line indicating the nature of the feedback
3. Provide as much detail as possible in the email body
4. The IG maintainers will acknowledge receipt within 5 business days
5. Your feedback will be converted to a GitHub issue for tracking
6. You will be notified of the issue number and resolution

### Feedback Categories

When providing feedback, please categorize it according to the following:

#### Technical Corrections

- Errors in profiles, extensions, or value sets
- Incorrect references or links
- Technical inconsistencies
- Validation issues

#### Content Enhancements

- Suggestions for additional guidance
- Requests for clarification
- Recommendations for additional examples
- Proposals for new profiles or extensions

#### Implementation Experience

- Challenges encountered during implementation
- Success stories and best practices
- Integration with existing systems
- Performance considerations

#### Usability Feedback

- Navigation and organization of the IG
- Clarity of documentation
- Completeness of examples
- Accessibility concerns

### Feedback Submission Template

Whether submitting via GitHub, forum, or email, please include the following information:

```
## Feedback Type
[Technical Correction | Content Enhancement | Implementation Experience | Usability Feedback]

## IG Section/Page
[URL or section reference]

## Description
[Detailed description of the issue or suggestion]

## Impact
[How this affects implementation or usage of the IG]

## Proposed Solution (if applicable)
[Your suggested solution or change]

## Implementation Context (if applicable)
- Organization Type: [State Medicaid | MCO | Vendor | Other]
- Implementation Stage: [Planning | Development | Testing | Production]
- Technical Environment: [Technologies in use]
```

### Feedback Review Process

#### Regular Review Cycle

The IG maintainers follow a regular review cycle for processing feedback:

1. **Weekly Triage**: New feedback is reviewed weekly
2. **Monthly Prioritization**: Feedback is prioritized monthly for inclusion in future releases
3. **Quarterly Work Planning**: Work is planned quarterly for implementing accepted feedback

#### Connectathon Feedback

Feedback from FHIR Connectathons is given special consideration:

1. Connectathon participants are encouraged to submit feedback during and after the event
2. Connectathon feedback is reviewed within 2 weeks of the event
3. Critical issues identified during Connectathons may be addressed in expedited releases

#### State Implementation Feedback

Feedback from state Medicaid agencies implementing the IG is particularly valuable:

1. States are encouraged to share their implementation experiences
2. State-specific requirements that may benefit other states are considered for inclusion in the IG
3. Regular calls with implementing states are scheduled to gather feedback

### Feedback Incorporation

#### Release Cycle

Feedback is incorporated into the IG according to the following release cycle:

1. **Patch Releases** (e.g., 1.0.1): Technical corrections and clarifications
   - Released as needed, typically monthly
   - Focus on bug fixes and minor clarifications

2. **Minor Releases** (e.g., 1.1.0): Content enhancements and new examples
   - Released quarterly
   - Include new examples, additional guidance, and non-breaking changes

3. **Major Releases** (e.g., 2.0.0): Significant changes and new functionality
   - Released annually
   - Include breaking changes, new profiles, and major enhancements

#### Publication Process

The process for incorporating feedback into published releases:

1. Accepted feedback is assigned to a specific release
2. Changes are implemented in the development branch
3. Changes undergo technical QA and content review
4. A ballot version is published for community review (for major releases)
5. Ballot feedback is addressed
6. The new version is published

### Feedback Status Tracking

#### Public Feedback Tracker

All feedback and its status are publicly tracked:

**Tracker URL**: [https://github.com/HL7/fhir-us-medicaid-provider-credentialing/projects/1](https://github.com/HL7/fhir-us-medicaid-provider-credentialing/projects/1)

The tracker categorizes feedback by:
- Status (New, Under Review, Accepted, Rejected, Implemented)
- Type (Technical Correction, Content Enhancement, etc.)
- Priority (Critical, High, Medium, Low)
- Target Release

#### Status Notifications

Feedback submitters receive notifications when:
- Their feedback is received
- The status changes
- Additional information is requested
- The feedback is resolved

### Community Engagement

#### Work Group Calls

The HL7 Financial Management Work Group holds regular calls to discuss feedback and IG development:

- **Schedule**: Every other Wednesday at 2:00 PM Eastern Time
- **Call Information**: [https://www.hl7.org/Special/committees/fm/index.cfm](https://www.hl7.org/Special/committees/fm/index.cfm)
- **Agenda**: Published one week before each call
- **Minutes**: Published within one week after each call

#### Implementation Community Calls

Separate calls focused specifically on implementation experiences:

- **Schedule**: Monthly on the first Tuesday at 1:00 PM Eastern Time
- **Registration**: [https://www.hl7.org/events/](https://www.hl7.org/events/)
- **Focus**: Implementation experiences, challenges, and solutions

#### Annual Implementer Survey

An annual survey is conducted to gather structured feedback:

- **Timing**: Distributed in January each year
- **Focus**: Implementation status, challenges, and priorities
- **Results**: Published in March each year
- **Impact**: Directly informs the annual work plan

### Feedback Recognition

Contributors who provide valuable feedback are recognized in the following ways:

1. **Acknowledgments Page**: Contributors are listed in the IG acknowledgments
2. **Release Notes**: Significant contributions are highlighted in release notes
3. **Community Spotlights**: Implementer stories are featured in HL7 newsletters
4. **Contributor Badge**: Digital badge for recognized contributors

### Feedback Examples

#### Example 1: Technical Correction

```
## Feedback Type
Technical Correction

## IG Section/Page
http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner

## Description
The invariant "npi-check" has an incorrect FHIRPath expression that fails to properly validate the NPI check digit algorithm.

## Impact
Implementations using this invariant will incorrectly validate NPIs, potentially allowing invalid NPIs to be accepted.

## Proposed Solution
Update the FHIRPath expression to correctly implement the check digit algorithm:

"matches('^\\d{10}$') and (((substring(0,1).toInteger()*2) + substring(1,1).toInteger() + ((substring(2,1).toInteger())*2) + substring(3,1).toInteger() + ((substring(4,1).toInteger())*2) + substring(5,1).toInteger() + ((substring(6,1).toInteger())*2) + substring(7,1).toInteger() + ((substring(8,1).toInteger())*2) + substring(9,1).toInteger()) mod 10 = 0)"
```

#### Example 2: Content Enhancement

```
## Feedback Type
Content Enhancement

## IG Section/Page
http://hl7.org/fhir/us/medicaid-provider-credentialing/state-customization.html

## Description
The state customization page lacks concrete examples of how states can extend the base profiles for state-specific requirements. Specifically, it would be helpful to have examples of how to add state-specific provider types and enrollment status codes.

## Impact
States implementing this IG are struggling to understand how to properly extend the base profiles for their specific requirements, leading to inconsistent implementations.

## Proposed Solution
Add FSH examples showing:
1. How to create a state-specific provider type code system
2. How to create a value set that includes both standard and state-specific codes
3. How to create a state-specific profile that extends the base profile
4. How to create a ConceptMap to map between state-specific and standard codes
```

#### Example 3: Implementation Experience

```
## Feedback Type
Implementation Experience

## IG Section/Page
General implementation feedback

## Description
Our state has implemented the provider enrollment workflow as described in the IG. We found that the verification process works well for individual providers but has challenges for organizational providers. Specifically, the verification of organizational relationships (parent/child, ownership) is not well addressed in the current IG.

## Impact
We had to create custom extensions and workflows to handle organizational relationships, which may not be interoperable with other implementations.

## Implementation Context
- Organization Type: State Medicaid
- Implementation Stage: Production
- Technical Environment: HAPI FHIR server, Java microservices, React frontend

## Proposed Solution
Enhance the IG to include:
1. Extensions for organizational relationships
2. Workflow patterns for organizational verification
3. Examples showing how to represent complex organizational structures
```

### Contact Information

For questions about the feedback process, please contact:

**IG Maintainer**: John Smith  
**Email**: [john.smith@hl7.org](mailto:john.smith@hl7.org)  
**Phone**: (123) 456-7890

**Work Group Chair**: Jane Doe  
**Email**: [jane.doe@hl7.org](mailto:jane.doe@hl7.org)  
**Phone**: (987) 654-3210
