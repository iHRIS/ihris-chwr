const isEmpty = require("is-empty");
const {v4: uuidv4} = require("uuid");

const validateDate = (input) => {
    return new Date(input).toString() !== 'Invalid Date';
}
const userDataValidation = (userData) => {
    const validation = {
        isValid: true,
        data: "",
        message: [],
    };

    userData.map((user, index) => {
        let errors = [];
        let oldKeys = Object.keys(user);
        let newKeys = Object.keys(user).map((ol) => ol.split(" ").join("_"));
        /*if (user.practitionerIsExist === true) {
            validation.isValid = false;
            errors.push(`User at row ${index + 2}  is already exist in the system`);
        }*/
        for (let i = 0; i < oldKeys.length; i++) {
            user[newKeys[i]] = user[oldKeys[i]];
            if (newKeys[i] === oldKeys[i]) {
              continue;
            } else {
                delete user[oldKeys[i]];
            }
        }

        let reference = [
          {Gender: "genderCoding"},
          {Nationality: "nationalityCoding"},
          {JobTitle: "jobCoding"},
          {EmploymentTerms: "empTermsCoding"},
          {Facility: "facilityId"},
          {HighestEducationLevel: "educationCoding"}
        ];

        /*let dateType = [
            "BirthDate",
        ]

        dateType.forEach((key, index) => {
          if(user[`${key}`] != null ){
            if (!validateDate(user[`${key}`])) {
              console.log(user[`${key}`])
              validation.isValid = false;
              errors.push(`${key} is not a valid date please enter in MM/DD/YY format`);
            } else {
                user[`${key}`] = new Date(user[`${key}`])
                user[`${key}`].setDate(user[`${key}`].getDate())
            }
          }
        })*/

        reference.forEach((data, index) => {
            if (
                !isEmpty(user[`${Object.keys(data)[0]}`]) &&
                user[`${Object.values(data)[0]}`] === undefined
            ) {
                validation.isValid = false;
                user.index = index + 1;
                validation.data = user;
                errors.push(
                    `Please check if ${Object.values(data)[0]} ${
                        user[`${Object.keys(data)[0]}`]
                    } exists in a system or check the spelling.`
                );
            }
        });

        /* let requiredFieldKeys = [
            "PMIS",
            "FileNumber",
            "FirstName",
            "FatherName",
            "Grand_Father_Name",
            "Sex",
            "Date_of_Birth",
            "Marital_Status",
        ];

        requiredFieldKeys.forEach((key, index) => {
            if (isEmpty(user[`${key}`])) {
                validation.isValid = false;
                user.index = index + 1;
                validation.data = user;
                errors.push(`user ${key} is missing`);
            }
        });*/

        if (errors.length > 0) {
            validation.message.push({
                index: index + 2,
                errors: errors,
            });
        }
    });
    return validation;
};

let bundle = {
    resourceType: "Bundle",
    type: "transaction",
    entry: [],
};

const template = async (users) => {
    let bundleData = [];

    users.map(async (user) => {
        let userId = uuidv4();
        let oldKeys = Object.keys(user);
        let newKeys = Object.keys(user).map((ol) => ol.split(" ").join("_"));

        for (let i = 0; i < oldKeys.length; i++) {
            user[newKeys[i]] = user[oldKeys[i]];
            if (newKeys[i] === oldKeys[i]) {
              continue;
            } else {
                delete user[oldKeys[i]];
            }
        }

        bundleData = [
            ...bundleData,
            {
                resource: {
                    resourceType: "Practitioner",
                    meta: {
                        profile: [
                            "http://ihris.org/fhir/StructureDefinition/ihris-practitioner",
                        ],
                    },
                    extension: [
                        {
                          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality",
                          valueCoding: user["nationalityCoding"]
                        },
                        {
                            url: "http://ihris.org/fhir/StructureDefinition/ihris-related-group",
                            extension: [
                                {
                                    url: "practitioner",
                                    valueString: `Practitioner/${userId}`,
                                },
                                ...user["relatedGroup"],
                            ],
                        },
                    ],
                    identifier: [
                        {
                            type: {
                                coding: [
                                    {
                                        system:
                                            "http://ihris.org/fhir/CodeSystem/ihris-identifier",
                                        code: "nationalIN",
                                    },
                                ],
                            },
                            value: user["NationalID"],
                        },
                        {
                            type: {
                                coding: [
                                    {
                                        system:
                                            "http://ihris.org/fhir/CodeSystem/ihris-identifier",
                                        code: "passport",
                                    },
                                ],
                            },
                            value: user["Passport"],
                        },
                        {
                          type: {
                              coding: [
                                  {
                                      system:
                                          "http://ihris.org/fhir/CodeSystem/ihris-identifier",
                                      code: "employeeId",
                                  },
                              ],
                          },
                          value: user["EmployeeNumber"],
                      }
                    ],
                    telecom: [
                      {
                          use: "work" ,
                          system : "phone",
                          value: "+" + user["PhoneNumber"],
                      },
                      {
                        use: "work" ,
                        system : "email",
                        value: user["Email"],
                      }, 
                    ],
                    address: [
                      {
                          use: "home" ,
                          line : user["StreetAddress"],
                          city: user["Town"],
                          district: user["District"],
                          state: user["Province"],
                      },
                    ],
                    active: true,
                    name: [
                        {
                            use: "official",
                            text: user["GivenName"] + " " + user["Surname"] + " " + user["MaidenName"],
                            given: [user["LastNames"], user["MaidenName"] ],
                            family: user["Surname"],
                            prefix: user["Prefix"],
                        }
                    ],
                    gender: user["genderCoding"].code,
                    birthDate: user["BirthDate"],
                },
                request: {
                    method: "PUT",
                    url: `Practitioner/${userId}`,
                },
            },
            {
              resource: {
                resourceType: "PractitionerRole",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-terms",
                    valueCoding: user["empTermsCoding"]
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary",
                    valueMoney: { value : user["Salary"] , currency : "USD" }
                  }
                ],
                period: {
                  start: user["StartDate"],
                  end: user["EndDate"]
                },
                practitioner: {
                  reference: `Practitioner/${userId}`
                },
                location: [
                  {
                    reference: `Location/${user["facilityId"]}`
                  }
                ],
                active: true,
                code: [
                  {
                    coding: [
                      user["jobCoding"]
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "PractitionerRole",
              }
            },
            {
              resource: {
                resourceType: "Basic",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                    valueReference: {
                      reference: `Practitioner/${userId}`,
                    },
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-education-history",
                    extension: [
                      {
                        url: "level",
                        valueCoding: user["educationalCoding"]
                      }
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "Basic",
              }
            }
        ];
    });
    return bundleData;
};

function processJobs(usersData) {
    return new Promise((resolve, reject) => {
        const validation = userDataValidation(usersData);
        if (!validation.isValid) {
            resolve(validation);
        } else {
            template(usersData)
                .then((practitionerDetails) => {
                    bundle.entry = practitionerDetails
                })
                .then(() => {
                    validation.isValid = true;
                    validation.data = {bundle};
                })
                .then(() => {
                    resolve(validation);
                });
        }
    });
}

module.exports = processJobs; 