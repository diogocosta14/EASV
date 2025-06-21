USE [HandsomeKoalas_ExamProject]

CREATE TABLE UserType
(
		userTypeID INT IDENTITY(1,1) NOT NULL,
		typeOfUser NVARCHAR(50) NOT NULL,

		PRIMARY KEY (userTypeID)
)

CREATE TABLE School
(
		schoolID INT IDENTITY(1,1) NOT NULL,
		school NVARCHAR(100) NOT NULL,

		PRIMARY KEY (schoolID)
)

CREATE TABLE UserData
(
		userID	INT IDENTITY(1,1) NOT NULL,
		typeOfUser	INT NOT NULL,
		school	INT NOT NULL,
		name	NVARCHAR(100) NOT NULL,
		username	NVARCHAR(50) NOT NULL,
		password	NVARCHAR(50) NOT NULL,

		PRIMARY KEY (userID),
		FOREIGN KEY (typeOfUser) REFERENCES UserType(userTypeID) ON DELETE CASCADE,
		FOREIGN KEY (school) REFERENCES School(schoolID) ON DELETE CASCADE
)		

CREATE TABLE CitizenTemplate
(
		citizenTemplateID INT IDENTITY(1,1) NOT NULL,
		school INT NOT NULL,
		citizenTemplateName  NVARCHAR(100) NOT NULL UNIQUE,

		PRIMARY KEY (citizenTemplateID),
		FOREIGN KEY (school) REFERENCES School(schoolID) ON DELETE CASCADE,
)

		

CREATE TABLE Citizen
(
		citizenID INT IDENTITY(1,1) NOT NULL,
		citizenTemplateID INT,
		citizenName NVARCHAR(100) NOT NULL,

		PRIMARY KEY (citizenID),
		FOREIGN KEY (citizenTemplateID) REFERENCES CitizenTemplate(citizenTemplateID) ON DELETE SET NULL,
)
	

CREATE TABLE HealthConditionsCitizenTemplate
(
		healthConditionsCitizenTemplateID INT IDENTITY(1,1) NOT NULL,
		healthConditionsCitizenTemplateCategory NVARCHAR(100) NOT NULL,
		healthConditionsCitizenTemplateSubCategory NVARCHAR(100) NOT NULL,
		healthConditionsCitizenTemplateColor NVARCHAR(50) NOT NULL,
		healthConditionsCitizenTemplateProfessionalNote NVARCHAR(1000),
		healthConditionsCitizenTemplateAssessmentNote NVARCHAR(1000),
		healthConditionsCitizenTemplateExpectedLevel NVARCHAR(100),
		healthConditionsCitizenTemplateObservableNote NVARCHAR(1000),
		healthConditionsCitizenTemplateDate DATE,
		citizenTemplateID INT NOT NULL,

		PRIMARY KEY (healthConditionsCitizenTemplateID),
		FOREIGN KEY (citizenTemplateID) REFERENCES CitizenTemplate(citizenTemplateID) ON DELETE CASCADE
)
				
		
CREATE TABLE HealthConditionsCitizen
(
		healthConditionsCitizenID INT IDENTITY(1,1) NOT NULL,
		healthConditionsCitizenCategory NVARCHAR(100) NOT NULL,
		healthConditionsCitizenSubCategory NVARCHAR(100) NOT NULL,
		healthConditionsCitizenColor NVARCHAR(50) NOT NULL,
		healthConditionsCitizenProfessionalNote NVARCHAR(1000),
		healthConditionsCitizenAssessmentNote NVARCHAR(1000),
		healthConditionsCitizenExpectedLevel NVARCHAR(100),
		healthConditionsCitizenObservableNote NVARCHAR(1000),
		healthConditionsCitizenDate DATE,
		citizenID INT NOT NULL,

		PRIMARY KEY (healthConditionsCitizenID),
		FOREIGN KEY (citizenID) REFERENCES Citizen(citizenID) ON DELETE CASCADE
)


CREATE TABLE FunctionalAbilitiesCitizenTemplate
(
		functionalAbilitiesCitizenTemplateID INT IDENTITY(1,1) NOT NULL,
		functionalAbilitiesCitizenTemplateCategoryName NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenTemplateSubCategoryName NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenTemplateScore INT NOT NULL,
		functionalAbilitiesCitizenTemplateExpectedScore INT NOT NULL,
		functionalAbilitiesCitizenTemplateProfessionalNote NVARCHAR(1000),
		functionalAbilitiesCitizenTemplatePerformance NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenTemplateLimitation NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenTemplateGoalsNote NVARCHAR(1000),
		functionalAbilitiesCitizenTemplateObservationNote NVARCHAR(1000),
		functionalAbilitiesCitizenTemplateDate DATE,
		citizenTemplateID INT NOT NULL,

		PRIMARY KEY (functionalAbilitiesCitizenTemplateID),
		FOREIGN KEY (citizenTemplateID) REFERENCES CitizenTemplate(citizenTemplateID) ON DELETE CASCADE
)


CREATE TABLE FunctionalAbilitiesCitizen
(
		functionalAbilitiesCitizenID INT IDENTITY(1,1) NOT NULL,
		functionalAbilitiesCitizenCategoryName NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenSubCategoryName NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenScore INT NOT NULL,
		functionalAbilitiesCitizenExpectedScore INT NOT NULL,
		functionalAbilitiesCitizenProfessionalNote NVARCHAR(1000),
		functionalAbilitiesCitizenPerformance NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenLimitation NVARCHAR(100) NOT NULL,
		functionalAbilitiesCitizenGoalsNote NVARCHAR(1000),
		functionalAbilitiesCitizenObservationNote NVARCHAR(1000),
		functionalAbilitiesCitizenTemplateDate DATE,
		citizenID INT NOT NULL,

		PRIMARY KEY (functionalAbilitiesCitizenID),
		FOREIGN KEY (citizenID) REFERENCES Citizen(citizenID) ON DELETE CASCADE
)

CREATE TABLE GeneralInformationCitizenTemplate
(
		generalInformationCitizenTemplateID INT IDENTITY(1,1) NOT NULL,
		generalInformationCitizenTemplateName NVARCHAR(100) NOT NULL,
		generalInformationCitizenTemplateExplanation NVARCHAR(1000) NOT NULL,
		generalInformationCitizenTemplateEditable NVARCHAR(1000) NOT NULL,
		citizenTemplateID INT NOT NULL,

		PRIMARY KEY (generalInformationCitizenTemplateID),
		FOREIGN KEY (citizenTemplateID) REFERENCES CitizenTemplate(citizenTemplateID) ON DELETE CASCADE
)	

CREATE TABLE GeneralInformationCitizen
(
		generalInformationCitizenID INT IDENTITY(1,1) NOT NULL,
		generalInformationCitizenName NVARCHAR(100) NOT NULL,
		generalInformationCitizenExplanation NVARCHAR(1000) NOT NULL,
		generalInformationCitizenEditable NVARCHAR(1000) NOT NULL,
		citizenID INT NOT NULL,

		PRIMARY KEY (generalInformationCitizenID),
		FOREIGN KEY (citizenID) REFERENCES Citizen(citizenID) ON DELETE CASCADE
)

CREATE TABLE StudentGetsCitizen
(
		studentID INT NOT NULL,
		citizenID INT NOT NULL,

		PRIMARY KEY (studentID, citizenID),
		FOREIGN KEY (studentID) REFERENCES UserData(UserID) ON DELETE CASCADE,
		FOREIGN KEY (citizenID) REFERENCES Citizen(citizenID) ON DELETE CASCADE
)

		
		

		

		

		

		


