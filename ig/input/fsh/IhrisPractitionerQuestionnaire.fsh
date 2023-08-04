Instance:       IhrisPractitionerQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Questionnaire"
* description = "iHRIS Practitioner initial data entry questionnaire."
* id = "ihris-practitioner"
* url = "http://ihris.org/fhir/Questionnaire/ihris-practitioner"
* name = "ihris-practitioner"
* status = #active
* date = 2020-06-22
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[0].text = "Health Worker|Individual Information"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.name[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name"
* item[0].item[0].text = "Name"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Practitioner.name[0].use"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.use"
* item[0].item[0].item[0].text = "Name Usage"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false
* item[0].item[0].item[0].readOnly = true
* item[0].item[0].item[0].answerOption.valueCoding = http://hl7.org/fhir/name-use#official
* item[0].item[0].item[0].answerOption.initialSelected = true

* item[0].item[0].item[1].linkId = "Practitioner.name[0].family"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.family"
* item[0].item[0].item[1].text = "Last Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Practitioner.name[0].given[0]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.given"
* item[0].item[0].item[2].text = "First/Middle/Other Names "
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = true

* item[0].item[0].item[3].linkId = "Practitioner.name[0].prefix[0]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.prefix"
* item[0].item[0].item[3].text = "Prefix"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = false
* item[0].item[0].item[3].repeats = true

* item[0].item[0].item[4].linkId = "Practitioner.identifier[0].value"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[0].item[0].item[4].text = "National Identification Number (NIN)"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].repeats = false
* item[0].item[0].item[4].required = true

* item[0].item[0].item[5].linkId = "Practitioner.identifier[0].type"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[0].item[0].item[5].text = "ID Type"
* item[0].item[0].item[5].type = #choice
* item[0].item[0].item[5].repeats = false
* item[0].item[0].item[5].readOnly = true
* item[0].item[0].item[5].required = true
* item[0].item[0].item[5].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-identifier#nationalIN
* item[0].item[0].item[5].answerOption.initialSelected = true

* item[0].item[1].linkId = "Practitioner.birthDate"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.birthDate"
* item[0].item[1].text = "Date of Birth"
* item[0].item[1].type = #date
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[1].linkId = "Practitioner.extension[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#.extension:age.value[x]:valuePositiveInt"
* item[0].item[1].text = "Age In years"
* item[0].item[1].type = #date
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Practitioner.gender"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.gender"
* item[0].item[2].text = "Gender/Sex"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.extension[1]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:residence.value[x]:valueReference"
* item[0].item[3].text = "CHW settlement of Residence"
* item[0].item[3].type = #reference
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Practitioner.active"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.active"
* item[0].item[4].text = "Active"
* item[0].item[4].type = #boolean
* item[0].item[4].required = true

* item[0].item[5].linkId = "Practitioner.extension[2]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:maritalStatus.value[x]:valueCoding"
* item[0].item[5].text = "Marital Status"
* item[0].item[5].type = #choice
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Practitioner.extension[3]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:nationality.value[x]:valueCoding"
* item[0].item[6].text = "Nationality"
* item[0].item[6].type = #choice
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[1].linkId = "__Practitioner:contact"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[1].text = "Contact Details|phone numbers"
* item[1].type = #group

* item[1].item[0].linkId = "Practitioner.extension[4]"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:phone.value[x]:valueString"
* item[1].item[0].text = "Mobile Phone"
* item[1].item[0].type = #string
* item[1].item[0].required = false
* item[1].item[0].repeats = false
* item[1].item[0].extension[constraint].extension[key].valueId = "ihris-phone-check"
* item[1].item[0].extension[constraint].extension[severity].valueCode = #error
* item[1].item[0].extension[constraint].extension[expression].valueString = "matches('^$|^(([+][0-9]{13})|([0-9]{10}))')"
* item[1].item[0].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[1].item[1].linkId = "Practitioner.extension[5]"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:altPhone.value[x]:valueString"
* item[1].item[1].text = "Alternate Phone"
* item[1].item[1].type = #string
* item[1].item[1].required = false
* item[1].item[1].repeats = false
* item[1].item[1].extension[constraint].extension[key].valueId = "ihris-phone-check"
* item[1].item[1].extension[constraint].extension[severity].valueCode = #error
* item[1].item[1].extension[constraint].extension[expression].valueString = "matches('^$|^(([+][0-9]{13})|([0-9]{10}))')"
* item[1].item[1].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[2].linkId = "PractitionerRole"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[2].text = "Position|Position the person holds"
* item[2].type = #group
* item[2].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[2].extension[constraint][0].extension[severity].valueCode = #error
* item[2].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime >= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[2].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."

* item[2].item[0].linkId = "PractitionerRole.practitioner"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.practitioner"
* item[2].item[0].text = "Practitioner"
* item[2].item[0].type = #string
* item[2].item[0].required = true
* item[2].item[0].repeats = false
* item[2].item[0].readOnly = true
* item[2].item[0].answerOption.valueString = "__REPLACE__Practitioner"
* item[2].item[0].answerOption.initialSelected = true

* item[2].item[1].linkId = "PractitionerRole.code"
* item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[2].item[1].text = "CHW Type"
* item[2].item[1].type = #choice
* item[2].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-chwr"
* item[2].item[1].required = true
* item[2].item[1].repeats = false

* item[2].item[2].linkId = "PractitionerRole.period.start"
* item[2].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[2].item[2].text = "Start Date"
* item[2].item[2].type = #dateTime
* item[2].item[2].required = true
* item[2].item[2].repeats = false

* item[2].item[3].linkId = "PractitionerRole.location"
* item[2].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[2].item[3].text = "Health Facility Attached to"
* item[2].item[3].type = #reference
* item[2].item[3].required = true
* item[2].item[3].repeats = false

* item[2].item[4].linkId = "PractitionerRole.extension[0]"
* item[2].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[2].item[4].text = "Employment Status"
* item[2].item[4].type = #choice
* item[2].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* item[2].item[4].required = true
* item[2].item[4].repeats = false

* item[3].linkId = "Basic"
* item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history"
* item[3].text = "Education Information|Education the person holds"
* item[3].type = #group

* item[3].item[0].linkId = "Basic.extension[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:practitioner.value[x]:valueReference"
* item[3].item[0].text = "Practitioner"
* item[3].item[0].type = #string
* item[3].item[0].required = true
* item[3].item[0].repeats = false
* item[3].item[0].readOnly = true
* item[3].item[0].answerOption.valueString = "__REPLACE__Practitioner"
* item[3].item[0].answerOption.initialSelected = true

* item[3].item[1].linkId = "Basic.extension[0].extension[0]"
* item[3].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:level.value[x]:valueCoding"
* item[3].item[1].text = "Highest Level of education"
* item[3].item[1].type = #choice
* item[3].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-level-valueset"
* item[3].item[1].required = false
* item[3].item[1].repeats = false