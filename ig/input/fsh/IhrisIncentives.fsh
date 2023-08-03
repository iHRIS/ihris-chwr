Profile:        IhrisBasicIncentive
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-incentive
Title:          "Incentive Information"
Description:    "iHRIS Profile of the Basic resource for Incentive."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisIncentive named incentive 1..1 MS
* extension[incentive].extension[incentive].valueCoding ^label = "Incentive"
* extension[incentive].extension[incentive].valueCoding 1..1 MS
* extension[incentive].extension[organization].valueCoding ^label = "Organization that supported"
* extension[incentive].extension[organization].valueCoding 0..1 MS
* extension[incentive].extension[date].valueDate ^label = "Date"
* extension[incentive].extension[date].valueDate 0..1 MS
* extension[incentive].extension[functional].valueBoolean ^label = "Functional"
* extension[incentive].extension[functional].valueBoolean 1..1 MS


Extension:      IhrisIncentive
Id:             ihris-incentive
Title:          "Incentive details"
* extension contains
      incentive 1..1 MS and
      organization 0..1 MS and
      date 0..1 MS and
      functional 1..1 MS
* extension[incentive].value[x] only Coding
* extension[incentive].valueCoding ^label = "Incentive"
* extension[incentive].valueCoding from IhrisIncentiveValueSet (required)
* extension[organization].value[x] only Coding
* extension[organization].valueCoding ^label = "Organization that supported"
* extension[organization].valueCoding from IhrisOrganizationValueSet (required)
* extension[date].value[x] only date
* extension[date].valueDate ^label = "Date"
* extension[functional].value[x] only boolean
* extension[functional].valueBoolean ^label = "Functional"

CodeSystem:      IhrisIncentive
Id:              ihris-incentive
Title:           "Incentive"
* ^date = "2020-09-29T08:41:04.362Z"
* #bicycle "Bicycle" "Bicycle"
* #motorbike "Motor Bike" "Motor Bike"
* #phone "Smart phone/phone" "Smart phone/phone"
* #uniform "Uniform" "Uniform"
* #training "Training" "Training"
* #financial "Financial Incentive" "Financial Incentive"
* #other "other" "other"

ValueSet:         IhrisIncentiveValueSet
Id:               ihris-incentive-valueset
Title:            "iHRIS Incentive ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisIncentive

CodeSystem:      IhrisOrganization
Id:              ihris-organization
Title:           "Organization"
* ^date = "2020-09-29T08:41:04.362Z"

ValueSet:         IhrisOrganizationValueSet
Id:               ihris-organization-valueset
Title:            "iHRIS Organization ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisOrganization


Instance:       IhrisPractitionerWorkflowIncentive
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Incentive Workflow"
* description = "iHRIS workflow to record a Incentive"
* id = "ihris-incentive"
* url = "http://ihris.org/fhir/Questionnaire/ihris-incentive"
* name = "ihris-incentive"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Incentive information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-incentive#Basic.id"
* item[0].text = "Incentive"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-incentive#Basic.extension:incentive.extension:incentive.value[x]:valueCoding"
* item[0].item[0].text = "Incentive"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-incentive-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-incentive#Basic.extension:incentive.extension:organization.value[x]:valueCoding"
* item[0].item[1].text = "Organization that supported"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-organization-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-incentive#Basic.extension:incentive.extension:date.value[x]:valueDate"
* item[0].item[2].text = "Date"
* item[0].item[2].type = #date
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-incentive#Basic.extension:incentive.extension:functional.value[x]:valueBoolean"
* item[0].item[3].text = "Functional"
* item[0].item[3].type = #boolean
* item[0].item[3].required = false
* item[0].item[3].repeats = false

Instance:       ihris-page-basic-incentive
InstanceOf:     IhrisPage
Title:          "Incentive"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-incentive)
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/basic-incentive/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Basic.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "secondary"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][2].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][2].extension[text].valueString = "Add Another"
* extension[display].extension[link][2].extension[button].valueBoolean = true
* extension[display].extension[link][2].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][2].extension[url].valueUrl = "/questionnaire/ihris-incentive/basic-incentive?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Incentive|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-incentive').extension.where(url='incentive').valueCoding.display"
* extension[section][0].extension[title].valueString = "Incentive"
* extension[section][0].extension[description].valueString = "Incentive details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:incentive.extension:incentive.value[x]:valueCoding.display"
* extension[section][0].extension[field][2].valueString = "extension:incentive.extension:organization.value[x]:valueCoding.display"
* extension[section][0].extension[field][3].valueString = "extension:incentive.extension:date.value[x]:valueDate"
* extension[section][0].extension[field][4].valueString = "extension:incentive.extension:functional.value[x]:valueBoolean"

Instance:       ihris-page-incentive
InstanceOf:     IhrisPage
Title:          "iHRIS Incentive CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-incentive)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Incentive"
* extension[section][0].extension[description].valueString = "Incentive"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-organization
InstanceOf:     IhrisPage
Title:          "iHRIS Organization CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-organization)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Organization"
* extension[section][0].extension[description].valueString = "Organization"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"