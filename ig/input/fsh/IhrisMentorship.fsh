Profile:        IhrisBasicMentorship
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-mentorship
Title:          "Mentorship Information"
Description:    "iHRIS Profile of the Basic resource for Mentorship."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisMentorship named mentorship 1..1 MS
* extension[mentorship].extension[mentorship].valueCoding ^label = "Mentorship Area/Topic"
* extension[mentorship].extension[mentorship].valueCoding 1..1 MS
* extension[mentorship].extension[organization].valueCoding ^label = "By Organization/Partner"
* extension[mentorship].extension[organization].valueCoding 0..1 MS
* extension[mentorship].extension[date].valueDate ^label = "Date"
* extension[mentorship].extension[date].valueDate 0..1 MS


Extension:      IhrisMentorship
Id:             ihris-mentorship
Title:          "Mentorship details"
* extension contains
      mentorship 1..1 MS and
      organization 0..1 MS and
      date 0..1 MS
* extension[mentorship].value[x] only Coding
* extension[mentorship].valueCoding ^label = "Mentorship Area/Topic"
* extension[mentorship].valueCoding from IhrisMentorshipValueSet (required)
* extension[organization].value[x] only Coding
* extension[organization].valueCoding ^label = "Organization/Partner"
* extension[organization].valueCoding from IhrisOrganizationValueSet (required)
* extension[date].value[x] only date
* extension[date].valueDate ^label = "Date"

CodeSystem:      IhrisMentorship
Id:              ihris-mentorship
Title:           "Mentorship Area"
* ^date = "2020-09-29T08:41:04.362Z"
* #hes "Hygiene and environmental sanitation" "Hygiene and environmental sanitation"
* #iccm "ICCM" "ICCM"
* #nutrition "Nutrition" "Nutrition"
* #fp "Family Planning" "Family Planning"
* #vhtrt "VHT reporting tools" "VHT reporting tools"
* #hcd "Health Commodity distribution" "Health Commodity distribution"
* #bdr "Birth and death registration" "Birth and death registration"
* #mda "Maternal death audit" "Maternal death audit"
* #counselling "Counselling" "Counselling"

ValueSet:         IhrisMentorshipValueSet
Id:               ihris-mentorship-valueset
Title:            "iHRIS Mentorship ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisMentorship

Instance:       IhrisPractitionerWorkflowMentorship
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Mentorship Workflow"
* description = "iHRIS workflow to record a Mentorship"
* id = "ihris-mentorship"
* url = "http://ihris.org/fhir/Questionnaire/ihris-mentorship"
* name = "ihris-mentorship"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Mentorship information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-mentorship"
* item[0].text = "Mentorship "
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-mentorship#Basic.extension:mentorship.extension:mentorship.value[x]:valueCoding"
* item[0].item[0].text = "Mentorship Area/Topic"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-mentorship-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-mentorship#Basic.extension:mentorship.extension:organization.value[x]:valueCoding"
* item[0].item[1].text = "Organization/Partner that Trained"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-organization-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-mentorship#Basic.extension:mentorship.extension:date.value[x]:valueDate"
* item[0].item[2].text = "Date"
* item[0].item[2].type = #date
* item[0].item[2].required = false
* item[0].item[2].repeats = false

Instance:       ihris-page-basic-mentorship
InstanceOf:     IhrisPage
Title:          "Mentorship"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-mentorship)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Mentorship|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-mentorship').extension.where(url='mentorship').valueCoding.display"
* extension[section][0].extension[title].valueString = "Mentorship"
* extension[section][0].extension[description].valueString = "Mentorship details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:mentorship.extension:mentorship.value[x]:valueCoding.display"
* extension[section][0].extension[field][2].valueString = "extension:mentorship.extension:organization.value[x]:valueCoding.display"
* extension[section][0].extension[field][3].valueString = "extension:mentorship.extension:date.value[x]:valueDate"

Instance:       ihris-page-mentorship
InstanceOf:     IhrisPage
Title:          "iHRIS Mentorship CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-mentorship)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Mentorship Area"
* extension[section][0].extension[description].valueString = "Mentorship"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"