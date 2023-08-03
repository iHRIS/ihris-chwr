Profile:        IhrisBasicFunction
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-function
Title:          "Function Information"
Description:    "iHRIS Profile of the Basic resource for Function."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisFunction named function 1..1 MS
* extension[function].extension[function].valueCoding ^label = "Function"
* extension[function].extension[function].valueCoding 1..1 MS
* extension[function].extension[organization].valueCoding ^label = "Organization that is supporting"
* extension[function].extension[organization].valueCoding 0..1 MS
* extension[function].extension[comment].valueString ^label = "Comment"
* extension[function].extension[comment].valueString 1..1 MS


Extension:      IhrisFunction
Id:             ihris-function
Title:          "Function details"
* extension contains
      function 1..1 MS and
      organization 0..1 MS and
      comment 1..1 MS
* extension[function].value[x] only Coding
* extension[function].valueCoding ^label = "Function"
* extension[function].valueCoding from IhrisFunctionValueSet (required)
* extension[organization].value[x] only Coding
* extension[organization].valueCoding ^label = "Organization that supported"
* extension[organization].valueCoding from IhrisOrganizationValueSet (required)
* extension[comment].value[x] only string
* extension[comment].valueString ^label = "Comment"

CodeSystem:      IhrisFunction
Id:              ihris-function
Title:           "Function"
* ^date = "2020-09-29T08:41:04.362Z"
* #assisting "Assisting at Health Centres" "Assisting at Health Centres"
* #followUp "Client follow up" "Client follow up"
* #counselling "Counselling" "Counselling"
* #distribution "Distribution of drugs/commodities" "Distribution of drugs/commodities"
* #he "Health Education" "Health Education"
* #hfl "Health facility linkage" "Health facility linkage"
* #mobilization "Mobilization" "Mobilization"
* #referrals "Referrals" "Referrals"
* #reporting "Reporting" "Reporting"
* #sensitization "Sensitization" "Sensitization"
* #training "Training" "Training"

ValueSet:         IhrisFunctionValueSet
Id:               ihris-function-valueset
Title:            "iHRIS Function ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisFunction


Instance:       IhrisPractitionerWorkflowFunction
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Function Workflow"
* description = "iHRIS workflow to record a Function"
* id = "ihris-function"
* url = "http://ihris.org/fhir/Questionnaire/ihris-function"
* name = "ihris-function"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Function information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-function#Basic.id"
* item[0].text = "Function"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-function#Basic.extension:function.extension:function.value[x]:valueCoding"
* item[0].item[0].text = "Function"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-function-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-function#Basic.extension:function.extension:organization.value[x]:valueCoding"
* item[0].item[1].text = "Organization that supported"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-organization-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-function#Basic.extension:function.extension:comment.value[x]:valueString"
* item[0].item[2].text = "Comment"
* item[0].item[2].type = #string
* item[0].item[2].required = false
* item[0].item[2].repeats = false

Instance:       ihris-page-basic-function
InstanceOf:     IhrisPage
Title:          "Function"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-function)
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/basic-function/FIELD?edit=true"
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
* extension[display].extension[link][2].extension[url].valueUrl = "/questionnaire/ihris-function/basic-function?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Function|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-function').extension.where(url='function').valueCoding.display"
* extension[section][0].extension[title].valueString = "Function"
* extension[section][0].extension[description].valueString = "Function details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:function.extension:function.value[x]:valueCoding.display"
* extension[section][0].extension[field][2].valueString = "extension:function.extension:organization.value[x]:valueCoding.display"
* extension[section][0].extension[field][3].valueString = "extension:function.extension:comment.value[x]:valueString"

Instance:       ihris-page-function
InstanceOf:     IhrisPage
Title:          "iHRIS Function CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-function)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Function"
* extension[section][0].extension[description].valueString = "Function"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"