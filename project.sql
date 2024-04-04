-- Table : Study Details
CREATE TABLE  IF NOT EXISTS Study (
    NCTID TEXT PRIMARY KEY,
    OrgFullName TEXT,
    BriefTitle CHAR(300),
    Title CHAR(600),
    StudyType TEXT CHECK(StudyType IN ('Interventional', 'Observational', 'Expanded Access', 'Patient Registry')),
    Status TEXT CHECK(Status IN ('Not yet Recruiting', 'Recruiting', 'Active, Not Recruiting', 'Completed', 'Withdrawn', 'Terminated', 'Suspended')),
    StartDate DATE,
    PrimaryCompletionDate DATE,
    StudyCompletionDate DATE,
    IsDeleted BOOLEAN DEFAULT 0 -- Enabling Soft Deletions
);

-- Table : Medical Condition
CREATE TABLE  IF NOT EXISTS Condition (
    Name TEXT PRIMARY KEY,
    IsDeleted BOOLEAN DEFAULT 0 -- Enabling Soft Deletions
);

-- Table : Study Condition Details
CREATE TABLE  IF NOT EXISTS StudyCondition (
    StudyNCTID TEXT,
    ConditionName TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    PRIMARY KEY (StudyNCTID, ConditionName),
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID),
    FOREIGN KEY (ConditionName) REFERENCES Condition(Name)
);

-- Optimisation : On Study Condition
CREATE INDEX IF NOT EXISTS  Index_StudyCondition_StudyNCTID ON StudyCondition(StudyNCTID);
CREATE INDEX IF NOT EXISTS Index_StudyCondition_ConditionName ON StudyCondition(ConditionName);

-- Table : Intervention Details
CREATE TABLE  IF NOT EXISTS Intervention (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    StudyNCTID TEXT,
    Type TEXT CHECK(Type IN ('Drug', 'Procedure', 'Diagnostic Test', 'Other', 'Biological', 'Device', 'Behavioral', 'Radiation', 'Genetic', 'Combination Product')),
    Description TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID)
);

-- Table : Intervention Group
CREATE TABLE  IF NOT EXISTS InterventionGroup (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    InterventionID INTEGER,
    Type TEXT CHECK(Type IN ('Experimental', 'Control')),
    Name TEXT,
    Description TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    FOREIGN KEY (InterventionID) REFERENCES Intervention(ID)
);

-- Table : Eligibility Conditions
CREATE TABLE  IF NOT EXISTS Eligibility (
    StudyNCTID TEXT PRIMARY KEY,
    InclusionCriteria TEXT,
    ExclusionCriteria TEXT,
    HealthyVolunteers BOOLEAN,
    Sex CHAR(1) CHECK(Sex IN ('M', 'F', 'All')),
    MinimumAge INTEGER CHECK(MinimumAge >= 0 AND MinimumAge <= 100),
    MaximumAge INTEGER CHECK(MaximumAge >= 0 AND MaximumAge <= 100),
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID)
);

-- Table : Study Outcomes
CREATE TABLE  IF NOT EXISTS Outcome (
    StudyNCTID TEXT PRIMARY KEY,
    PRIMARYOutcomeMeasure VARCHAR(255),
    PrimaryOutcomeTimeFrame INTEGER,
    PrimaryOutcomeTimeFrameUnit TEXT CHECK(PrimaryOutcomeTimeFrameUnit IN ('Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years')),
    SecondaryOutcomeMeasure VARCHAR(255),
    SecondaryOutcomeTimeFrame INTEGER,
    SecondaryOutcomeTimeFrameUnit TEXT CHECK(SecondaryOutcomeTimeFrameUnit IN ('Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years')),
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID)
);

-- Table : Study Location
CREATE TABLE IF NOT EXISTS Location(
    LocationID INTEGER PRIMARY KEY AUTOINCREMENT,
	StudyNCTID TEXT,
	LocationName TEXT,
	City TEXT,
	State TEXT,
	Country	TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
	FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID)
);

-- Table : Study Investigating Organisation
CREATE TABLE  IF NOT EXISTS Organisation (
    OrgFullName TEXT PRIMARY KEY,
    OrgClass TEXT CHECK(OrgClass IN ('NIH', 'FED', 'OTHER_GOV', 'INDIV', 'INDUSTRY', 'NETWORK', 'AMBIG', 'UNKNOWN')),
    IsDeleted BOOLEAN DEFAULT 0 -- Enabling Soft Deletions
);

-- Table : Study Organisation
CREATE TABLE IF NOT EXISTS StudyOrganisation (
    OrgFullName TEXT,
    StudyNCTID TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    PRIMARY KEY (StudyNCTID, OrgFullName),
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID),
    FOREIGN KEY (OrgFullName) REFERENCES Organisation(OrgFullName)
);

-- Table : Study Principle Investigator
CREATE TABLE IF NOT EXISTS Investigator (
    InvestigatorName TEXT PRIMARY KEY,
    Affiliation TEXT,
    Role TEXT CHECK(Role IN ('STUDY_CHAIR', 'STUDY_DIRECTOR', 'PRINCIPAL_INVESTIGATOR', 'SUB_INVESTIGATOR', 'CONTACT')),
    IsDeleted BOOLEAN DEFAULT 0 -- Enabling Soft Deletions
);

-- Table : Study Investigator
CREATE TABLE IF NOT EXISTS StudyInvestigator (
    StudyNCTID TEXT,
    InvestigatorName TEXT,
    IsDeleted BOOLEAN DEFAULT 0, -- Enabling Soft Deletions
    PRIMARY KEY (StudyNCTID, InvestigatorName),
    FOREIGN KEY (StudyNCTID) REFERENCES Study(NCTID),
    FOREIGN KEY (InvestigatorName) REFERENCES Investigator(InvestigatorName)
);


-- VIEWS
-- View 1: Active Studies with Organizations
CREATE VIEW IF NOT EXISTS ActiveStudiesWithOrganizations AS
SELECT s.NCTID, s.OrgFullName, s.BriefTitle, s.Title, s.StudyType, s.Status,
       s.StartDate, s.PrimaryCompletionDate, s.StudyCompletionDate, o.OrgClass
FROM Study s
JOIN StudyOrganisation so ON s.NCTID = so.StudyNCTID
JOIN Organisation o ON so.OrgFullName = o.OrgFullName
WHERE s.Status = 'Active, Not Recruiting';

-- View 2: Total Number of Studies Conducted by Each Organization
CREATE VIEW IF NOT EXISTS TotalStudiesByOrganization AS
SELECT OrgFullName, COUNT(*) AS TotalStudies
FROM StudyOrganisation
GROUP BY OrgFullName;

-- View 3: Interventions with Corresponding Study Titles
CREATE VIEW IF NOT EXISTS InterventionsWithStudyTitles AS
SELECT i.*, s.Title
FROM Intervention i
JOIN Study s ON i.StudyNCTID = s.NCTID;

-- View 4: Studies with Outcomes and Primary Investigators
CREATE VIEW IF NOT EXISTS StudiesWithOutcomesAndInvestigators AS
SELECT s.*, o.PRIMARYOutcomeMeasure, o.SecondaryOutcomeMeasure, i.InvestigatorName
FROM Study s
JOIN Outcome o ON s.NCTID = o.StudyNCTID
JOIN StudyInvestigator si ON s.NCTID = si.StudyNCTID
JOIN Investigator i ON si.InvestigatorName = i.InvestigatorName;

-- View 5: Studies with Eligibility Criteria and Conditions
CREATE VIEW IF NOT EXISTS StudiesWithEligibilityAndConditions AS
SELECT s.*, e.InclusionCriteria, e.ExclusionCriteria, c.Name AS Condition
FROM Study s
JOIN Eligibility e ON s.NCTID = e.StudyNCTID
JOIN StudyCondition sc ON s.NCTID = sc.StudyNCTID
JOIN Condition c ON sc.ConditionName = c.Name;

-- INDEXES
CREATE INDEX IF NOT EXISTS idx_study_type ON Study(StudyType);
CREATE INDEX IF NOT EXISTS idx_study_status ON Study(Status);
CREATE INDEX IF NOT EXISTS idx_study_org ON Study(OrgFullName);
CREATE INDEX IF NOT EXISTS idx_eligibility_study_id ON Eligibility(StudyNCTID);
CREATE INDEX IF NOT EXISTS idx_study_condition_study_id ON StudyCondition(StudyNCTID);
CREATE INDEX IF NOT EXISTS idx_study_condition_condition_name ON StudyCondition(ConditionName);
CREATE INDEX IF NOT EXISTS idx_outcome_study_id ON Outcome(StudyNCTID);
CREATE INDEX IF NOT EXISTS idx_study_investigator_study_id ON StudyInvestigator(StudyNCTID);
CREATE INDEX IF NOT EXISTS idx_location_country ON Location(Country);

-- Trigger for soft deletion from Study to related tables
CREATE TRIGGER IF NOT EXISTS Trigger_Study_Cascade_Soft_Deletion
INSTEAD OF DELETE ON "ActiveStudiesWithOrganizations"
FOR EACH ROW
BEGIN
    UPDATE Study
    SET IsDeleted = 1
    WHERE NCTID = OLD.NCTID;

    -- Update StudyCondition
    UPDATE StudyCondition
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update Intervention
    UPDATE Intervention
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update Eligibility
    UPDATE Eligibility
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update Outcome
    UPDATE Outcome
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update Location
    UPDATE Location
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update StudyOrganisation
    UPDATE StudyOrganisation
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;

    -- Update StudyInvestigator
    UPDATE StudyInvestigator
    SET IsDeleted = 1
    WHERE StudyNCTID = OLD.NCTID;
END;
