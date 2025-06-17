This page provides detailed workflow patterns, sequence diagrams, sample API requests and responses, and implementation guidance for different technical platforms.

### Key Workflow Sequence Diagrams

#### Provider Enrollment Workflow

The following sequence diagram illustrates the provider enrollment workflow, showing the interactions between the provider, the enrollment system, and verification services.

```mermaid
sequenceDiagram
    participant Provider
    participant Portal as Provider Portal
    participant API as FHIR API
    participant Workflow as Workflow Engine
    participant Verification as Verification Services
    
    Provider->>Portal: Submit enrollment application
    Portal->>API: POST /Practitioner
    API->>API: Validate Practitioner resource
    API-->>Portal: Return Practitioner resource with ID
    
    Portal->>API: POST /Organization (if applicable)
    API->>API: Validate Organization resource
    API-->>Portal: Return Organization resource with ID
    
    Portal->>API: POST /PractitionerRole
    API->>API: Validate PractitionerRole resource
    API-->>Portal: Return PractitionerRole resource with ID
    
    Portal->>API: POST /Task (enrollment task)
    API->>API: Create enrollment task
    API-->>Portal: Return Task resource with ID
    
    Portal-->>Provider: Confirm application submission
    
    API->>Workflow: Trigger enrollment workflow
    Workflow->>Verification: Request NPI verification
    Verification-->>Workflow: Return NPI verification result
    
    Workflow->>Verification: Request license verification
    Verification-->>Workflow: Return license verification result
    
    Workflow->>Verification: Request OIG exclusion check
    Verification-->>Workflow: Return OIG exclusion result
    
    Workflow->>API: POST /VerificationResult (NPI)
    API-->>Workflow: Return VerificationResult resource with ID
    
    Workflow->>API: POST /VerificationResult (license)
    API-->>Workflow: Return VerificationResult resource with ID
    
    Workflow->>API: POST /VerificationResult (exclusion)
    API-->>Workflow: Return VerificationResult resource with ID
    
    Workflow->>API: PATCH /PractitionerRole (update status)
    API-->>Workflow: Return updated PractitionerRole
    
    Workflow->>API: PATCH /Task (update status)
    API-->>Workflow: Return updated Task
    
    API->>Portal: Send notification
    Portal-->>Provider: Notify enrollment status
```

#### Credentialing Verification Workflow

The following sequence diagram illustrates the credentialing verification workflow, showing the interactions between the verification system, primary sources, and the provider database.

```mermaid
sequenceDiagram
    participant Scheduler as Verification Scheduler
    participant API as FHIR API
    participant Verification as Verification Engine
    participant PrimarySources as Primary Sources
    participant Notification as Notification Service
    
    Scheduler->>API: GET /PractitionerRole?verification-due=true
    API-->>Scheduler: Return PractitionerRole resources
    
    loop For each PractitionerRole
        Scheduler->>Verification: Request verification
        
        Verification->>API: GET /Practitioner/{id}
        API-->>Verification: Return Practitioner resource
        
        Verification->>API: GET /Organization/{id}
        API-->>Verification: Return Organization resource
        
        Verification->>PrimarySources: Verify NPI
        PrimarySources-->>Verification: Return NPI verification result
        
        Verification->>PrimarySources: Verify license
        PrimarySources-->>Verification: Return license verification result
        
        Verification->>PrimarySources: Check OIG exclusion
        PrimarySources-->>Verification: Return OIG exclusion result
        
        Verification->>API: POST /VerificationResult (NPI)
        API-->>Verification: Return VerificationResult resource with ID
        
        Verification->>API: POST /VerificationResult (license)
        API-->>Verification: Return VerificationResult resource with ID
        
        Verification->>API: POST /VerificationResult (exclusion)
        API-->>Verification: Return VerificationResult resource with ID
        
        alt All verifications passed
            Verification->>API: PATCH /PractitionerRole (update status to verified)
            API-->>Verification: Return updated PractitionerRole
        else Verification failed
            Verification->>API: PATCH /PractitionerRole (update status to failed)
            API-->>Verification: Return updated PractitionerRole
            Verification->>Notification: Send verification failure notification
        end
    end
```

#### Provider Revalidation Workflow

The following sequence diagram illustrates the provider revalidation workflow, showing the interactions between the revalidation system, the provider, and verification services.

```mermaid
sequenceDiagram
    participant Scheduler as Revalidation Scheduler
    participant API as FHIR API
    participant Notification as Notification Service
    participant Provider
    participant Portal as Provider Portal
    participant Verification as Verification Services
    
    Scheduler->>API: GET /PractitionerRole?revalidation-due=true
    API-->>Scheduler: Return PractitionerRole resources
    
    loop For each PractitionerRole
        Scheduler->>API: POST /Task (revalidation task)
        API-->>Scheduler: Return Task resource with ID
        
        Scheduler->>Notification: Send revalidation notification
        Notification-->>Provider: Notify revalidation requirement
        
        Provider->>Portal: Access revalidation form
        
        Portal->>API: GET /Practitioner/{id}
        API-->>Portal: Return Practitioner resource
        
        Portal->>API: GET /Organization/{id}
        API-->>Portal: Return Organization resource
        
        Portal->>API: GET /PractitionerRole/{id}
        API-->>Portal: Return PractitionerRole resource
        
        Provider->>Portal: Update information and submit
        
        Portal->>API: PUT /Practitioner/{id}
        API-->>Portal: Return updated Practitioner
        
        Portal->>API: PUT /Organization/{id} (if applicable)
        API-->>Portal: Return updated Organization
        
        Portal->>API: PUT /PractitionerRole/{id}
        API-->>Portal: Return updated PractitionerRole
        
        Portal->>API: PATCH /Task/{id} (update status)
        API-->>Portal: Return updated Task
        
        API->>Verification: Trigger verification process
        
        Verification->>API: POST /VerificationResult (NPI)
        API-->>Verification: Return VerificationResult resource with ID
        
        Verification->>API: POST /VerificationResult (license)
        API-->>Verification: Return VerificationResult resource with ID
        
        Verification->>API: POST /VerificationResult (exclusion)
        API-->>Verification: Return VerificationResult resource with ID
        
        alt All verifications passed
            Verification->>API: PATCH /PractitionerRole (update status and revalidation date)
            API-->>Verification: Return updated PractitionerRole
            Verification->>Notification: Send revalidation approval notification
            Notification-->>Provider: Notify revalidation approval
        else Verification failed
            Verification->>API: PATCH /PractitionerRole (update status to failed)
            API-->>Verification: Return updated PractitionerRole
            Verification->>Notification: Send verification failure notification
            Notification-->>Provider: Notify verification failure
        end
    end
```

#### Provider Directory Search Workflow

The following sequence diagram illustrates the provider directory search workflow, showing the interactions between the client application and the FHIR API.

```mermaid
sequenceDiagram
    participant Client as Client Application
    participant API as FHIR API
    participant Auth as Authorization Server
    
    Client->>Auth: Request access token
    Auth-->>Client: Return access token
    
    Client->>API: GET /Practitioner?name=Smith&specialty=207R00000X
    API->>API: Validate search parameters
    API->>API: Execute search query
    API-->>Client: Return Bundle of Practitioner resources
    
    Client->>API: GET /PractitionerRole?practitioner.name=Smith&specialty=207R00000X
    API->>API: Validate search parameters
    API->>API: Execute search query
    API-->>Client: Return Bundle of PractitionerRole resources
    
    Client->>API: GET /PractitionerRole/{id}?_include=PractitionerRole:practitioner&_include=PractitionerRole:organization
    API->>API: Validate parameters
    API->>API: Execute query with includes
    API-->>Client: Return Bundle with PractitionerRole, Practitioner, and Organization
    
    Client->>API: GET /Organization?address-city=Springfield&type=prov
    API->>API: Validate search parameters
    API->>API: Execute search query
    API-->>Client: Return Bundle of Organization resources
```

#### Provider Sanction Workflow

The following sequence diagram illustrates the provider sanction workflow, showing the interactions between the program integrity system, the FHIR API, and notification services.

```mermaid
sequenceDiagram
    participant Integrity as Program Integrity System
    participant API as FHIR API
    participant Notification as Notification Service
    participant Provider
    
    Integrity->>API: GET /Practitioner/{id}
    API-->>Integrity: Return Practitioner resource
    
    Integrity->>API: GET /PractitionerRole?practitioner={id}
    API-->>Integrity: Return PractitionerRole resources
    
    Integrity->>API: POST /DetectedIssue
    API-->>Integrity: Return DetectedIssue resource with ID
    
    Integrity->>API: PATCH /PractitionerRole/{id} (update status to suspended)
    API-->>Integrity: Return updated PractitionerRole
    
    Integrity->>API: POST /Task (sanction review task)
    API-->>Integrity: Return Task resource with ID
    
    Integrity->>Notification: Send sanction notification
    Notification-->>Provider: Notify of sanction
    
    Integrity->>API: POST /AuditEvent (sanction applied)
    API-->>Integrity: Return AuditEvent resource with ID
```

### Sample API Requests and Responses

#### Provider Enrollment

##### Create Practitioner

**Request:**
```http
POST /fhir/Practitioner HTTP/1.1
Host: api.medicaid.state.gov
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/fhir+json
Accept: application/fhir+json

{
  "resourceType": "Practitioner",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner"
    ]
  },
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    }
  ],
  "active": true,
  "name": [
    {
      "family": "Smith",
      "given": ["John", "A"],
      "prefix": ["Dr."]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "555-123-4567",
      "use": "work"
    },
    {
      "system": "email",
      "value": "john.smith@example.com",
      "use": "work"
    }
  ],
  "address": [
    {
      "use": "work",
      "type": "both",
      "line": ["123 Main St", "Suite 400"],
      "city": "Springfield",
      "state": "IL",
      "postalCode": "62701",
      "country": "US"
    }
  ],
  "gender": "male",
  "birthDate": "1970-01-01",
  "qualification": [
    {
      "identifier": [
        {
          "system": "http://state.il.gov/license",
          "value": "MD12345"
        }
      ],
      "code": {
        "coding": [
          {
            "system": "http://state.il.gov/license-type",
            "code": "MD",
            "display": "Medical Doctor"
          }
        ]
      },
      "period": {
        "start": "2020-01-01",
        "end": "2025-12-31"
      },
      "issuer": {
        "display": "Illinois Department of Financial and Professional Regulation"
      }
    }
  ]
}
```

**Response:**
```http
HTTP/1.1 201 Created
Content-Type: application/fhir+json
Location: https://api.medicaid.state.gov/fhir/Practitioner/12345

{
  "resourceType": "Practitioner",
  "id": "12345",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2025-06-17T05:25:00.000Z",
    "profile": [
      "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner"
    ]
  },
  "identifier": [
    {
      "system": "http://hl7.org/fhir/sid/us-npi",
      "value": "1234567890"
    }
  ],
  "active": true,
  "name": [
    {
      "family": "Smith",
      "given": ["John", "A"],
      "prefix": ["Dr."]
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "555-123-4567",
      "use": "work"
    },
    {
      "system": "email",
      "value": "john.smith@example.com",
      "use": "work"
    }
  ],
  "address": [
    {
      "use": "work",
      "type": "both",
      "line": ["123 Main St", "Suite 400"],
      "city": "Springfield",
      "state": "IL",
      "postalCode": "62701",
      "country": "US"
    }
  ],
  "gender": "male",
  "birthDate": "1970-01-01",
  "qualification": [
    {
      "identifier": [
        {
          "system": "http://state.il.gov/license",
          "value": "MD12345"
        }
      ],
      "code": {
        "coding": [
          {
            "system": "http://state.il.gov/license-type",
            "code": "MD",
            "display": "Medical Doctor"
          }
        ]
      },
      "period": {
        "start": "2020-01-01",
        "end": "2025-12-31"
      },
      "issuer": {
        "display": "Illinois Department of Financial and Professional Regulation"
      }
    }
  ]
}
```

##### Create PractitionerRole

**Request:**
```http
POST /fhir/PractitionerRole HTTP/1.1
Host: api.medicaid.state.gov
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/fhir+json
Accept: application/fhir+json

{
  "resourceType": "PractitionerRole",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role"
    ]
  },
  "practitioner": {
    "reference": "Practitioner/12345"
  },
  "organization": {
    "reference": "Organization/67890"
  },
  "code": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207R00000X",
          "display": "Internal Medicine"
        }
      ]
    }
  ],
  "specialty": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207RC0000X",
          "display": "Cardiovascular Disease"
        }
      ]
    }
  ],
  "location": [
    {
      "reference": "Location/54321"
    }
  ],
  "healthcareService": [
    {
      "reference": "HealthcareService/98765"
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "555-987-6543",
      "use": "work"
    }
  ],
  "availableTime": [
    {
      "daysOfWeek": ["mon", "tue", "wed", "thu", "fri"],
      "availableStartTime": "09:00:00",
      "availableEndTime": "17:00:00"
    }
  ],
  "notAvailable": [
    {
      "description": "Dr. Smith is not available on public holidays",
      "during": {
        "start": "2025-07-04",
        "end": "2025-07-05"
      }
    }
  ],
  "endpoint": [
    {
      "reference": "Endpoint/12345"
    }
  ],
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "pending",
            "display": "Pending"
          }
        ]
      }
    }
  ]
}
```

**Response:**
```http
HTTP/1.1 201 Created
Content-Type: application/fhir+json
Location: https://api.medicaid.state.gov/fhir/PractitionerRole/54321

{
  "resourceType": "PractitionerRole",
  "id": "54321",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2025-06-17T05:26:00.000Z",
    "profile": [
      "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role"
    ]
  },
  "practitioner": {
    "reference": "Practitioner/12345"
  },
  "organization": {
    "reference": "Organization/67890"
  },
  "code": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207R00000X",
          "display": "Internal Medicine"
        }
      ]
    }
  ],
  "specialty": [
    {
      "coding": [
        {
          "system": "http://nucc.org/provider-taxonomy",
          "code": "207RC0000X",
          "display": "Cardiovascular Disease"
        }
      ]
    }
  ],
  "location": [
    {
      "reference": "Location/54321"
    }
  ],
  "healthcareService": [
    {
      "reference": "HealthcareService/98765"
    }
  ],
  "telecom": [
    {
      "system": "phone",
      "value": "555-987-6543",
      "use": "work"
    }
  ],
  "availableTime": [
    {
      "daysOfWeek": ["mon", "tue", "wed", "thu", "fri"],
      "availableStartTime": "09:00:00",
      "availableEndTime": "17:00:00"
    }
  ],
  "notAvailable": [
    {
      "description": "Dr. Smith is not available on public holidays",
      "during": {
        "start": "2025-07-04",
        "end": "2025-07-05"
      }
    }
  ],
  "endpoint": [
    {
      "reference": "Endpoint/12345"
    }
  ],
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
            "code": "pending",
            "display": "Pending"
          }
        ]
      }
    }
  ]
}
```

#### Provider Search

##### Search by Name and Specialty

**Request:**
```http
GET /fhir/PractitionerRole?practitioner.name=Smith&specialty=207RC0000X HTTP/1.1
Host: api.medicaid.state.gov
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
Accept: application/fhir+json
```

**Response:**
```http
HTTP/1.1 200 OK
Content-Type: application/fhir+json

{
  "resourceType": "Bundle",
  "id": "search-result",
  "meta": {
    "lastUpdated": "2025-06-17T05:27:00.000Z"
  },
  "type": "searchset",
  "total": 1,
  "link": [
    {
      "relation": "self",
      "url": "https://api.medicaid.state.gov/fhir/PractitionerRole?practitioner.name=Smith&specialty=207RC0000X"
    }
  ],
  "entry": [
    {
      "fullUrl": "https://api.medicaid.state.gov/fhir/PractitionerRole/54321",
      "resource": {
        "resourceType": "PractitionerRole",
        "id": "54321",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2025-06-17T05:26:00.000Z",
          "profile": [
            "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role"
          ]
        },
        "practitioner": {
          "reference": "Practitioner/12345",
          "display": "Dr. John A Smith"
        },
        "organization": {
          "reference": "Organization/67890",
          "display": "Springfield Medical Center"
        },
        "code": [
          {
            "coding": [
              {
                "system": "http://nucc.org/provider-taxonomy",
                "code": "207R00000X",
                "display": "Internal Medicine"
              }
            ]
          }
        ],
        "specialty": [
          {
            "coding": [
              {
                "system": "http://nucc.org/provider-taxonomy",
                "code": "207RC0000X",
                "display": "Cardiovascular Disease"
              }
            ]
          }
        ],
        "location": [
          {
            "reference": "Location/54321",
            "display": "Springfield Medical Center - Main Campus"
          }
        ],
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
                  "code": "enrolled",
                  "display": "Enrolled"
                }
              ]
            }
          }
        ]
      },
      "search": {
        "mode": "match",
        "score": 1.0
      }
    }
  ]
}
```

##### Search with _include

**Request:**
```http
GET /fhir/PractitionerRole?_id=54321&_include=PractitionerRole:practitioner&_include=PractitionerRole:organization HTTP/1.1
Host: api.medicaid.state.gov
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
Accept: application/fhir+json
```

**Response:**
```http
HTTP/1.1 200 OK
Content-Type: application/fhir+json

{
  "resourceType": "Bundle",
  "id": "search-result",
  "meta": {
    "lastUpdated": "2025-06-17T05:28:00.000Z"
  },
  "type": "searchset",
  "total": 1,
  "link": [
    {
      "relation": "self",
      "url": "https://api.medicaid.state.gov/fhir/PractitionerRole?_id=54321&_include=PractitionerRole:practitioner&_include=PractitionerRole:organization"
    }
  ],
  "entry": [
    {
      "fullUrl": "https://api.medicaid.state.gov/fhir/PractitionerRole/54321",
      "resource": {
        "resourceType": "PractitionerRole",
        "id": "54321",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2025-06-17T05:26:00.000Z",
          "profile": [
            "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role"
          ]
        },
        "practitioner": {
          "reference": "Practitioner/12345",
          "display": "Dr. John A Smith"
        },
        "organization": {
          "reference": "Organization/67890",
          "display": "Springfield Medical Center"
        },
        "code": [
          {
            "coding": [
              {
                "system": "http://nucc.org/provider-taxonomy",
                "code": "207R00000X",
                "display": "Internal Medicine"
              }
            ]
          }
        ],
        "specialty": [
          {
            "coding": [
              {
                "system": "http://nucc.org/provider-taxonomy",
                "code": "207RC0000X",
                "display": "Cardiovascular Disease"
              }
            ]
          }
        ],
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "http://hl7.org/fhir/us/medicaid-provider-credentialing/CodeSystem/medicaid-enrollment-status",
                  "code": "enrolled",
                  "display": "Enrolled"
                }
              ]
            }
          }
        ]
      },
      "search": {
        "mode": "match",
        "score": 1.0
      }
    },
    {
      "fullUrl": "https://api.medicaid.state.gov/fhir/Practitioner/12345",
      "resource": {
        "resourceType": "Practitioner",
        "id": "12345",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2025-06-17T05:25:00.000Z",
          "profile": [
            "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner"
          ]
        },
        "identifier": [
          {
            "system": "http://hl7.org/fhir/sid/us-npi",
            "value": "1234567890"
          }
        ],
        "active": true,
        "name": [
          {
            "family": "Smith",
            "given": ["John", "A"],
            "prefix": ["Dr."]
          }
        ],
        "telecom": [
          {
            "system": "phone",
            "value": "555-123-4567",
            "use": "work"
          },
          {
            "system": "email",
            "value": "john.smith@example.com",
            "use": "work"
          }
        ],
        "address": [
          {
            "use": "work",
            "type": "both",
            "line": ["123 Main St", "Suite 400"],
            "city": "Springfield",
            "state": "IL",
            "postalCode": "62701",
            "country": "US"
          }
        ]
      },
      "search": {
        "mode": "include"
      }
    },
    {
      "fullUrl": "https://api.medicaid.state.gov/fhir/Organization/67890",
      "resource": {
        "resourceType": "Organization",
        "id": "67890",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2025-06-17T05:24:00.000Z",
          "profile": [
            "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-organization"
          ]
        },
        "identifier": [
          {
            "system": "http://hl7.org/fhir/sid/us-npi",
            "value": "9876543210"
          }
        ],
        "active": true,
        "type": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/organization-type",
                "code": "prov",
                "display": "Healthcare Provider"
              }
            ]
          }
        ],
        "name": "Springfield Medical Center",
        "telecom": [
          {
            "system": "phone",
            "value": "555-789-0123",
            "use": "work"
          }
        ],
        "address": [
          {
            "use": "work",
            "type": "both",
            "line": ["456 Hospital Drive"],
            "city": "Springfield",
            "state": "IL",
            "postalCode": "62701",
            "country": "US"
          }
        ]
      },
      "search": {
        "mode": "include"
      }
    }
  ]
}
```

#### Verification Result

##### Create VerificationResult

**Request:**
```http
POST /fhir/VerificationResult HTTP/1.1
Host: api.medicaid.state.gov
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ
