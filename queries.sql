-- Query 1 : List of all the studies that are interventional and their status along with the organisation class
SELECT s.NCTID, s.OrgFullName, s.Status, o.OrgClass
FROM Study s
JOIN StudyOrganisation so ON s.NCTID = so.StudyNCTID
JOIN Organisation o ON so.OrgFullName = o.OrgFullName
WHERE s.StudyType = "Interventional";

-- Query 2 : Retrieve Study IDs with Eligibility Criteria and Conditions
SELECT s.NCTID, e.InclusionCriteria, e.ExclusionCriteria, c.Name AS Condition
FROM Study s
JOIN Eligibility e ON s.NCTID = e.StudyNCTID
JOIN StudyCondition sc ON s.NCTID = sc.StudyNCTID
JOIN Condition c ON sc.ConditionName = c.Name;

-- Query 3 : Retrieve the top 5 organisations with the most number of studies
SELECT OrgFullName, COUNT(*) AS TotalStudies
FROM StudyOrganisation
GROUP BY OrgFullName
ORDER BY TotalStudies DESC
LIMIT 5;

-- Query 4 : Study IDs with their respective primary and secondary outcome measures and the investigator name
SELECT s.NCTID, o.PRIMARYOutcomeMeasure, o.SecondaryOutcomeMeasure, i.InvestigatorName
FROM Study s
JOIN Outcome o ON s.NCTID = o.StudyNCTID
JOIN StudyInvestigator si ON s.NCTID = si.StudyNCTID
JOIN Investigator i ON si.InvestigatorName = i.InvestigatorName;

-- Query 5 : Study IDs with their respective locations in the United Kingdom
SELECT s.NCTID, l.LocationName
FROM Study s
JOIN Location l ON s.NCTID = l.StudyNCTID
WHERE l.Country = 'United Kingdom';

-- Query 6 : Retrieve the study IDs and study type of the condition with the most number of studies
SELECT s.NCTID AS StudyID, c.Name AS ConditionName, s.StudyType, s.Status
FROM Condition c
JOIN StudyCondition sc ON c.Name = sc.ConditionName
JOIN Study s ON sc.StudyNCTID = s.NCTID
WHERE c.Name = (
    SELECT c.Name
    FROM Condition c
    JOIN StudyCondition sc ON c.Name = sc.ConditionName
    GROUP BY c.Name
    ORDER BY COUNT(sc.StudyNCTID) DESC
    LIMIT 1
);

-- Query 7: Select active studies with interventions of type 'Drug'
SELECT *
FROM ActiveStudiesWithOrganizations
WHERE NCTID IN (SELECT StudyNCTID FROM InterventionsWithStudyTitles WHERE Type = 'Drug');

-- Query 8: Find studies with outcomes and primary investigators where the primary outcome measure contains the term 'efficacy'
SELECT *
FROM StudiesWithOutcomesAndInvestigators
WHERE PRIMARYOutcomeMeasure LIKE '%efficacy%';

-- Query 9: Calculate the total number of studies conducted by organizations with the organization class 'NIH'
SELECT OrgFullName, TotalStudies
FROM TotalStudiesByOrganization
WHERE OrgFullName IN (
    SELECT OrgFullName
    FROM ActiveStudiesWithOrganizations
    WHERE OrgClass = 'NIH'
);

-- Query 10: Number of studies being conducted on each condition
WITH StudyCountPerCondition AS (
    SELECT c.Name AS ConditionName, COUNT(sc.StudyNCTID) AS StudyCount
    FROM Condition c
    LEFT JOIN StudyCondition sc ON c.Name = sc.ConditionName
    GROUP BY c.Name
)
SELECT *
FROM StudyCountPerCondition;

SELECT s.NCTID, s.OrgFullName, s.Status, o.OrgClass
FROM Study s
JOIN StudyOrganisation so ON s.NCTID = so.StudyNCTID
JOIN Organisation o ON so.OrgFullName = o.OrgFullName
WHERE s.StudyType = "Interventional";

-- Query 11: Number of studies on Diabetes Based on Inclusion Criteria
WITH MyCTE AS (
    SELECT * FROM StudiesWithEligibilityAndConditions
    WHERE InclusionCriteria LIKE '%diabetes%'
    ORDER BY StartDate DESC
)
SELECT * FROM MyCTE
LIMIT 10;
