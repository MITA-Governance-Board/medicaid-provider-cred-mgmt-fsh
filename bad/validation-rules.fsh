// Validation Rules for Critical Data Elements
// This file defines specific validation rules for critical data elements in the
// Medicaid Provider Credentialing and Enrollment Implementation Guide.

// ===== INVARIANT DEFINITIONS =====

// NPI Validation
Invariant: npi-check
Description: "NPI must be 10 digits and pass the check digit algorithm"
Expression: "matches('^\\d{10}$') and (((substring(0,1).toInteger()*2) + substring(1,1).toInteger() + ((substring(2,1).toInteger())*2) + substring(3,1).toInteger() + ((substring(4,1).toInteger())*2) + substring(5,1).toInteger() + ((substring(6,1).toInteger())*2) + substring(7,1).toInteger() + ((substring(8,1).toInteger())*2) + substring(9,1).toInteger()) mod 10 = 0)"
Severity: #error

// Taxonomy Code Validation
Invariant: taxonomy-code-check
Description: "Taxonomy code must be 10 characters in the format of 10 alphanumeric characters"
Expression: "matches('^[0-9][0-9A-Z]{9}X?$')"
Severity: #error

// Medicaid ID Format Validation
Invariant: medicaid-id-format
Description: "Medicaid ID must follow the state-specific format"
Expression: "true" // This is a placeholder - each state would define their specific format
Severity: #error

// Enrollment Date Validation
Invariant: enrollment-date-check
Description: "Enrollment date must not be in the future"
Expression: "hasValue().not() or ($this <= today())"
Severity: #error

// License Period Validation
Invariant: license-period-check
Description: "License end date must be after license start date"
Expression: "end.empty() or (start.empty().not() and end >= start)"
Severity: #error

// Address Validation
Invariant: us-address-check
Description: "US address must have state and ZIP code"
Expression: "country = 'USA' or country = 'US' implies (state.exists() and postalCode.exists())"
Severity: #error

// Phone Number Validation
Invariant: us-phone-check
Description: "US phone numbers must be in a valid format"
Expression: "matches('^\\+1([2-9][0-9]{2})[2-9][0-9]{2}[0-9]{4}$') or matches('^([2-9][0-9]{2})[2-9][0-9]{2}[0-9]{4}$')"
Severity: #warning

// Email Validation
Invariant: email-check
Description: "Email must be in a valid format"
Expression: "matches('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')"
Severity: #warning

// Specialty Validation
Invariant: specialty-required-check
Description: "At least one specialty must be provided for a practitioner role"
Expression: "specialty.count() > 0"
Severity: #error

// Enrollment Status Validation
Invariant: enrollment-status-transition
Description: "Enrollment status transitions must follow allowed paths"
Expression: "true" // This is a placeholder - would be implemented with business rules
Severity: #error

// ===== PROFILE APPLICATIONS =====

// Apply invariants to MedicaidPractitioner profile
Profile: ValidatedMedicaidPractitioner
Parent: MedicaidPractitioner
Id: validated-medicaid-practitioner
Title: "Validated Medicaid Practitioner"
Description: "MedicaidPractitioner profile with additional validation rules"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner"
* ^status = #active
* ^date = "2025-06-17"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    npi 1..1 and
    medicaidId 0..*

* identifier[npi].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[npi].value 1..1
* identifier[npi].value obeys npi-check

* identifier[medicaidId].value obeys medicaid-id-format

* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom ^slicing.description = "Slice based on telecom system"

* telecom contains
    phone 0..* and
    email 0..*

* telecom[phone].system = #phone
* telecom[phone].value obeys us-phone-check

* telecom[email].system = #email
* telecom[email].value obeys email-check

* address obeys us-address-check

* qualification.period obeys license-period-check

// Apply invariants to MedicaidPractitionerRole profile
Profile: ValidatedMedicaidPractitionerRole
Parent: MedicaidPractitionerRole
Id: validated-medicaid-practitioner-role
Title: "Validated Medicaid Practitioner Role"
Description: "MedicaidPractitionerRole profile with additional validation rules"
* ^url = "http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role"
* ^status = #active
* ^date = "2025-06-17"

* specialty 1..*
* specialty obeys specialty-required-check

* extension contains
    http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/medicaid-enrollment-status named enrollmentStatus 1..1

* extension[enrollmentStatus].valueCodeableConcept.coding.code obeys enrollment-status-transition

* period.start obeys enrollment-date-check

// ===== IMPLEMENTATION EXAMPLES =====

// The following sections provide examples of how to implement these validation rules
// in different technical contexts.

// ===== FHIR SERVER VALIDATION =====

// Example: HAPI FHIR Server Validation Configuration (Java)
/*
```java
// Configure HAPI FHIR validation support
ValidationSupportChain validationSupport = new ValidationSupportChain();

// Add IG validation support
NpmPackageValidationSupport npmValidationSupport = new NpmPackageValidationSupport();
npmValidationSupport.loadPackageFromClasspath("hl7.fhir.us.medicaid-provider-credentialing");
validationSupport.addValidationSupport(npmValidationSupport);

// Add terminology validation support
validationSupport.addValidationSupport(new DefaultTerminologyServiceValidationSupport(fhirContext));
validationSupport.addValidationSupport(new CommonCodeSystemsTerminologyService(fhirContext));

// Add in-memory terminology server
InMemoryTerminologyServerValidationSupport terminologySupport = new InMemoryTerminologyServerValidationSupport(fhirContext);
validationSupport.addValidationSupport(terminologySupport);

// Create validator
FhirInstanceValidator instanceValidator = new FhirInstanceValidator(validationSupport);

// Configure validation settings
ValidationOptions options = new ValidationOptions();
options.addProfileForValidation("http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner");
options.addProfileForValidation("http://hl7.org/fhir/us/medicaid-provider-credentialing/StructureDefinition/validated-medicaid-practitioner-role");

// Create validator module
RequestValidatingInterceptor validatingInterceptor = new RequestValidatingInterceptor();
validatingInterceptor.setValidatorModules(Collections.singletonList(instanceValidator));
validatingInterceptor.setOptions(options);

// Add interceptor to FHIR server
fhirServer.registerInterceptor(validatingInterceptor);
```
*/

// ===== CLIENT-SIDE VALIDATION =====

// Example: JavaScript Client Validation
/*
```javascript
// NPI validation function
function validateNPI(npi) {
  // Check if NPI is 10 digits
  if (!/^\d{10}$/.test(npi)) {
    return false;
  }
  
  // Apply NPI check digit algorithm
  let sum = 0;
  for (let i = 0; i < 9; i++) {
    let digit = parseInt(npi.charAt(i));
    if (i % 2 === 0) {
      digit *= 2;
      if (digit > 9) {
        digit = Math.floor(digit / 10) + (digit % 10);
      }
    }
    sum += digit;
  }
  
  const checkDigit = (10 - (sum % 10)) % 10;
  return parseInt(npi.charAt(9)) === checkDigit;
}

// US Phone validation function
function validateUSPhone(phone) {
  // Remove any non-digit characters
  const digitsOnly = phone.replace(/\D/g, '');
  
  // Check if it's a valid US phone (10 digits, or 11 digits starting with 1)
  if (digitsOnly.length === 10) {
    return /^[2-9]\d{2}[2-9]\d{6}$/.test(digitsOnly);
  } else if (digitsOnly.length === 11 && digitsOnly.charAt(0) === '1') {
    return /^1[2-9]\d{2}[2-9]\d{6}$/.test(digitsOnly);
  }
  
  return false;
}

// Email validation function
function validateEmail(email) {
  return /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/.test(email);
}

// US Address validation function
function validateUSAddress(address) {
  if (address.country === 'US' || address.country === 'USA') {
    return address.state && address.postalCode;
  }
  return true;
}

// Validate practitioner data before submission
function validatePractitioner(practitioner) {
  const errors = [];
  
  // Validate NPI
  const npi = practitioner.identifier.find(id => id.system === 'http://hl7.org/fhir/sid/us-npi')?.value;
  if (!npi || !validateNPI(npi)) {
    errors.push('Invalid NPI number');
  }
  
  // Validate phone
  const phone = practitioner.telecom.find(t => t.system === 'phone')?.value;
  if (phone && !validateUSPhone(phone)) {
    errors.push('Invalid US phone number format');
  }
  
  // Validate email
  const email = practitioner.telecom.find(t => t.system === 'email')?.value;
  if (email && !validateEmail(email)) {
    errors.push('Invalid email format');
  }
  
  // Validate address
  if (practitioner.address && !validateUSAddress(practitioner.address[0])) {
    errors.push('US address must include state and ZIP code');
  }
  
  return errors;
}
```
*/

// ===== DATABASE VALIDATION =====

// Example: SQL Database Constraints
/*
```sql
-- Create table with validation constraints
CREATE TABLE practitioner (
  id VARCHAR(64) PRIMARY KEY,
  npi VARCHAR(10) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  address_line1 VARCHAR(100),
  address_city VARCHAR(100),
  address_state VARCHAR(2),
  address_zip VARCHAR(10),
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  -- Validation constraints
  CONSTRAINT check_npi_format CHECK (npi REGEXP '^[0-9]{10}$'),
  CONSTRAINT check_email_format CHECK (email IS NULL OR email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  CONSTRAINT check_phone_format CHECK (phone IS NULL OR phone REGEXP '^\\+?1?[2-9][0-9]{2}[2-9][0-9]{2}[0-9]{4}$'),
  CONSTRAINT check_us_address CHECK (
    (address_line1 IS NULL) OR 
    (address_line1 IS NOT NULL AND address_city IS NOT NULL AND address_state IS NOT NULL AND address_zip IS NOT NULL)
  )
);

-- Create table for practitioner roles with validation
CREATE TABLE practitioner_role (
  id VARCHAR(64) PRIMARY KEY,
  practitioner_id VARCHAR(64) NOT NULL,
  organization_id VARCHAR(64),
  specialty_code VARCHAR(20) NOT NULL,
  specialty_system VARCHAR(100) NOT NULL,
  enrollment_status VARCHAR(20) NOT NULL,
  period_start DATE NOT NULL,
  period_end DATE,
  
  -- Foreign keys
  FOREIGN KEY (practitioner_id) REFERENCES practitioner(id),
  FOREIGN KEY (organization_id) REFERENCES organization(id),
  
  -- Validation constraints
  CONSTRAINT check_enrollment_date CHECK (period_start <= CURRENT_DATE),
  CONSTRAINT check_period CHECK (period_end IS NULL OR period_end >= period_start),
  CONSTRAINT check_enrollment_status CHECK (
    enrollment_status IN ('pending', 'enrolled', 'suspended', 'terminated', 'revalidation-required', 'denied')
  )
);

-- Create trigger for NPI check digit validation
DELIMITER //
CREATE TRIGGER validate_npi BEFORE INSERT ON practitioner
FOR EACH ROW
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE sum INT DEFAULT 0;
  DECLARE digit INT;
  DECLARE check_digit INT;
  
  -- Calculate sum for check digit algorithm
  WHILE i < 9 DO
    SET digit = SUBSTRING(NEW.npi, i+1, 1);
    IF i % 2 = 0 THEN
      SET digit = digit * 2;
      IF digit > 9 THEN
        SET digit = FLOOR(digit / 10) + (digit % 10);
      END IF;
    END IF;
    SET sum = sum + digit;
    SET i = i + 1;
  END WHILE;
  
  -- Calculate check digit
  SET check_digit = (10 - (sum % 10)) % 10;
  
  -- Validate check digit
  IF check_digit != SUBSTRING(NEW.npi, 10, 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid NPI check digit';
  END IF;
END //
DELIMITER ;
```
*/

// ===== API VALIDATION =====

// Example: C# ASP.NET API Validation
/*
```csharp
// NPI Validator
public class NPIValidator
{
    public static bool Validate(string npi)
    {
        // Check if NPI is 10 digits
        if (!Regex.IsMatch(npi, @"^\d{10}$"))
            return false;
        
        // Apply NPI check digit algorithm
        int sum = 0;
        for (int i = 0; i < 9; i++)
        {
            int digit = int.Parse(npi[i].ToString());
            if (i % 2 == 0)
            {
                digit *= 2;
                if (digit > 9)
                    digit = digit / 10 + digit % 10;
            }
            sum += digit;
        }
        
        int checkDigit = (10 - (sum % 10)) % 10;
        return int.Parse(npi[9].ToString()) == checkDigit;
    }
}

// Practitioner Model with Validation Attributes
public class Practitioner
{
    [Required]
    public string Id { get; set; }
    
    [Required]
    [RegularExpression(@"^\d{10}$", ErrorMessage = "NPI must be 10 digits")]
    [CustomValidation(typeof(NPIValidator), "Validate", ErrorMessage = "Invalid NPI check digit")]
    public string NPI { get; set; }
    
    [Required]
    public string FirstName { get; set; }
    
    [Required]
    public string LastName { get; set; }
    
    [EmailAddress]
    public string Email { get; set; }
    
    [RegularExpression(@"^\+?1?[2-9]\d{2}[2-9]\d{2}\d{4}$", ErrorMessage = "Invalid US phone number format")]
    public string Phone { get; set; }
    
    public Address Address { get; set; }
    
    public List<Qualification> Qualifications { get; set; }
}

// Address Model with Validation
public class Address
{
    public string Line1 { get; set; }
    public string Line2 { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string PostalCode { get; set; }
    public string Country { get; set; } = "US";
    
    // Custom validation for US addresses
    public bool IsValid()
    {
        if (Country == "US" || Country == "USA")
        {
            return !string.IsNullOrEmpty(State) && !string.IsNullOrEmpty(PostalCode);
        }
        return true;
    }
}

// Qualification Model with Validation
public class Qualification
{
    [Required]
    public string Code { get; set; }
    
    [Required]
    public string System { get; set; }
    
    [Required]
    public string Value { get; set; }
    
    [Required]
    public DateTime StartDate { get; set; }
    
    public DateTime? EndDate { get; set; }
    
    // Custom validation for period
    public bool IsValid()
    {
        if (EndDate.HasValue)
        {
            return EndDate.Value >= StartDate;
        }
        return true;
    }
}

// API Controller with Validation
[ApiController]
[Route("api/[controller]")]
public class PractitionersController : ControllerBase
{
    private readonly IPractitionerService _service;
    
    public PractitionersController(IPractitionerService service)
    {
        _service = service;
    }
    
    [HttpPost]
    public async Task<IActionResult> Create(Practitioner practitioner)
    {
        // ModelState validation happens automatically due to [ApiController]
        
        // Additional custom validation
        if (practitioner.Address != null && !practitioner.Address.IsValid())
        {
            ModelState.AddModelError("Address", "US address must include state and ZIP code");
        }
        
        if (practitioner.Qualifications != null)
        {
            foreach (var qualification in practitioner.Qualifications)
            {
                if (!qualification.IsValid())
                {
                    ModelState.AddModelError("Qualifications", "Qualification end date must be after start date");
                }
            }
        }
        
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }
        
        var result = await _service.CreatePractitionerAsync(practitioner);
        return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
    }
    
    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(string id)
    {
        var practitioner = await _service.GetPractitionerByIdAsync(id);
        if (practitioner == null)
        {
            return NotFound();
        }
        
        return Ok(practitioner);
    }
}
```
*/

// ===== PYTHON VALIDATION =====

// Example: Python Validation with Pydantic
/*
```python
from pydantic import BaseModel, Field, EmailStr, validator
from typing import List, Optional
from datetime import date
import re

# NPI validation function
def validate_npi(npi: str) -> bool:
    # Check if NPI is 10 digits
    if not re.match(r'^\d{10}$', npi):
        return False
    
    # Apply NPI check digit algorithm
    sum_val = 0
    for i in range(9):
        digit = int(npi[i])
        if i % 2 == 0:
            digit *= 2
            if digit > 9:
                digit = digit // 10 + digit % 10
        sum_val += digit
    
    check_digit = (10 - (sum_val % 10)) % 10
    return int(npi[9]) == check_digit

# Address model with validation
class Address(BaseModel):
    line1: str
    line2: Optional[str] = None
    city: str
    state: Optional[str] = None
    postal_code: Optional[str] = None
    country: str = "US"
    
    @validator('state', 'postal_code')
    def validate_us_address(cls, v, values):
        if 'country' in values and (values['country'] == 'US' or values['country'] == 'USA'):
            if v is None:
                raise ValueError('US address must include state and ZIP code')
        return v

# Qualification model with validation
class Qualification(BaseModel):
    code: str
    system: str
    value: str
    start_date: date
    end_date: Optional[date] = None
    
    @validator('end_date')
    def validate_period(cls, v, values):
        if v is not None and 'start_date' in values and v < values['start_date']:
            raise ValueError('End date must be after start date')
        return v

# Identifier model
class Identifier(BaseModel):
    system: str
    value: str

# Practitioner model with validation
class Practitioner(BaseModel):
    id: Optional[str] = None
    identifiers: List[Identifier]
    first_name: str
    last_name: str
    email: Optional[EmailStr] = None
    phone: Optional[str] = None
    address: Optional[Address] = None
    qualifications: Optional[List[Qualification]] = None
    active: bool = True
    
    @validator('identifiers')
    def validate_npi(cls, v):
        npi_identifiers = [i for i in v if i.system == 'http://hl7.org/fhir/sid/us-npi']
        if not npi_identifiers:
            raise ValueError('NPI identifier is required')
        
        npi = npi_identifiers[0].value
        if not validate_npi(npi):
            raise ValueError('Invalid NPI check digit')
        
        return v
    
    @validator('phone')
    def validate_phone(cls, v):
        if v is not None:
            # Remove any non-digit characters
            digits_only = re.sub(r'\D', '', v)
            
            # Check if it's a valid US phone
            if len(digits_only) == 10:
                if not re.match(r'^[2-9]\d{2}[2-9]\d{6}$', digits_only):
                    raise ValueError('Invalid US phone number format')
            elif len(digits_only) == 11 and digits_only[0] == '1':
                if not re.match(r'^1[2-9]\d{2}[2-9]\d{6}$', digits_only):
                    raise ValueError('Invalid US phone number format')
            else:
                raise ValueError('Invalid US phone number format')
        
        return v

# Example usage
def validate_practitioner_data(data: dict):
    try:
        practitioner = Practitioner(**data)
        return True, practitioner
    except Exception as e:
        return False, str(e)

# API endpoint example
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.post("/practitioners/")
async def create_practitioner(practitioner: Practitioner):
    # Validation happens automatically with Pydantic
    # Additional business logic here
    return {"id": "new-id", "message": "Practitioner created successfully"}
```
*/

// ===== BATCH VALIDATION =====

// Example: Batch Validation with Apache Spark (Scala)
/*
```scala
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types._

// Create Spark session
val spark = SparkSession.builder()
  .appName("Provider Data Validation")
  .getOrCreate()

// Define validation functions
val validateNPI = udf((npi: String) => {
  if (npi == null || !npi.matches("\\d{10}")) {
    false
  } else {
    // Check digit algorithm
    var sum = 0
    for (i <- 0 until 9) {
      var digit = npi.charAt(i).toString.toInt
      if (i % 2 == 0) {
        digit *= 2
        if (digit > 9) {
          digit = digit / 10 + digit % 10
        }
      }
      sum += digit
    }
    val checkDigit = (10 - (sum % 10)) % 10
    npi.charAt(9).toString.toInt == checkDigit
  }
})

val validateEmail = udf((email: String) => {
  if (email == null) true
  else email.matches("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
})

val validatePhone = udf((phone: String) => {
  if (phone == null) true
  else {
    val digitsOnly = phone.replaceAll("\\D", "")
    if (digitsOnly.length == 10) {
      digitsOnly.matches("[2-9]\\d{2}[2-9]\\d{6}")
    } else if (digitsOnly.length == 11 && digitsOnly.charAt(0) == '1') {
      digitsOnly.matches("1[2-9]\\d{2}[2-9]\\d{6}")
    } else {
      false
    }
  }
})

val validateUSAddress = udf((country: String, state: String, zip: String) => {
  if (country == null || (country != "US" && country != "USA")) true
  else state != null && zip != null
})

val validatePeriod = udf((start: java.sql.Date, end: java.sql.Date) => {
  if (end == null) true
  else start == null || end.after(start) || end.equals(start)
})

// Load provider data
val providers = spark.read.parquet("/path/to/providers")

// Validate data
val validatedProviders = providers
  .withColumn("valid_npi", validateNPI(col("npi")))
  .withColumn("valid_email", validateEmail(col("email")))
  .withColumn("valid_phone", validatePhone(col("phone")))
  .withColumn("valid_address", validateUSAddress(col("country"), col("state"), col("zip")))
  .withColumn("valid_period", validatePeriod(col("license_start_date"), col("license_end_date")))
  .withColumn("is_valid", 
    col("valid_npi") && 
    col("valid_email") && 
    col("valid_phone") && 
    col("valid_address") && 
    col("valid_period")
  )

// Filter invalid records
val invalidProviders = validatedProviders.filter(!col("is_valid"))

// Generate validation report
val validationReport = validatedProviders
  .groupBy("is_valid")
  .agg(
    count("*").as("record_count"),
    sum(when(col("valid_npi") === false, 1).otherwise(0)).as("invalid_npi_count"),
    sum(when(col("valid_email") === false, 1).otherwise(0)).as("invalid_email_count"),
    sum(when(col("valid_phone") === false, 1).otherwise(0)).as("invalid_phone_count"),
    sum(when(col("valid_address") === false, 1).otherwise(0)).as("invalid_address_count"),
    sum(when(col("valid_period") === false, 1).otherwise(0)).as("invalid_period_count")
  )

// Save validation results
validationReport.write.csv("/path/to/validation_report")
invalidProviders.write.parquet("/path/to/invalid_providers")
```
*/
