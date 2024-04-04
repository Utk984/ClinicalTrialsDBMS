# Clinical Trials Database

## Scope

### Purpose

The purpose of this database is to store and manage data related to clinical studies, including details about the studies themselves, medical conditions, interventions, outcomes, eligibility criteria, locations, organizations, and investigators involved.

### In Scope

- Information about medical studies, including study type, status, start and completion dates, and outcomes.
- Organizations conducting the studies, including their names and classification.
- Interventions being studied, including their types and descriptions.
- Eligibility criteria for participants in the studies, including inclusion and exclusion criteria, age, sex, and whether healthy volunteers are accepted.
- Locations where the studies are conducted, including the name, city, state, and country.

### Out of Scope

- Detailed patient data, such as medical records and personal information.
- Financial information related to the studies, such as budgets and expenses.
- Regulatory compliance data, such as approvals and certifications.
- Medical equipment data, such as specifications and usage logs.
- Detailed information about organizations beyond their names and classifications.

## Functional Requirements

### User Capabilities:

- Users should be able to query and retrieve information about medical studies, organizations, interventions, eligibility criteria, outcomes, and locations.
- Users should be able to filter and search for specific studies based on various criteria, such as study type, status, and location.
- Users should be able to understand the eligibility criteria for participating in each study.
- Users should be able to view the outcomes of the studies and understand their implications.
- Users should be able to locate where the studies are being conducted and understand the geographical distribution of research activities.

### Beyond the Scope:

- Direct management or updating of study data (the database is designed for reporting and analysis purposes).
- Tracking of individual participant data or study progress.
- Integration with external systems or databases.
- Users should not be able to modify the data directly in the database, as it should be managed by authorized personnel.
- Users should not be able to access sensitive patient information to ensure privacy and compliance with regulations.

## Representation

### Entities

- `Study`: Represents a clinical study with attributes such as study ID, title, type, status, and dates. Chosen to uniquely identify and store essential details about each study.
- `Condition`: Represents a medical condition with a name. Chosen to store and categorize the conditions being studied.
- `Intervention`: Represents an intervention (drug, procedure, device, etc.) with attributes such as type and description. Chosen to store details about the interventions used in studies.
- `InterventionGroup`: Represents experimental and control groups associated with an intervention, including their names and descriptions.
- `Eligibility`: Represents the eligibility criteria for a study, including inclusion/exclusion criteria, gender, and age ranges.
- `Outcome`: Represents the primary and secondary outcome measures and their time frames for a study.
- `Location`: Represents the locations where studies are conducted, including name, city, state, and country.
- `Organisation`: Represents an organization involved in a study, including its name and classification (e.g., NIH, industry, etc.).
- `Investigator`: Represents an investigator involved in a study, including their name, affiliation, and role (principal investigator, sub-investigator, etc.).

### Entity Relationship Diagram

### Relationships

A study can have multiple conditions, and a condition can be associated with multiple studies (many-to-many relationship between Study and Condition via the StudyCondition table).
A study can have multiple interventions, and an intervention can be associated with multiple studies (one-to-many relationship between Study and Intervention).
An intervention can have multiple intervention groups (one-to-many relationship between Intervention and InterventionGroup).
A study can have one eligibility record (one-to-one relationship between Study and Eligibility).
A study can have one outcome record (one-to-one relationship between Study and Outcome).
A study can be conducted at multiple locations, and a location can host multiple studies (many-to-many relationship between Study and Location).
A study can be associated with multiple organizations, and an organization can be involved in multiple studies (many-to-many relationship between Study and Organisation via the StudyOrganisation table).
A study can have multiple investigators, and an investigator can be involved in multiple studies (many-to-many relationship between Study and Investigator via the StudyInvestigator table).

## Optimizations

### Indexes:

These indexes will help improve the performance of queries and joins involving the specified columns.

- `idx_study_type` on the `Study` table for optimizing searches and joins on the `StudyType` column.
- `idx_study_status` on the `Study` table for optimizing searches and joins on the `Status` column.
- `idx_study_org` on the `Study` table for optimizing searches and joins on the `OrgFullName` column.
- `idx_eligibility_study_id` on the `Eligibility` table for optimizing searches and joins on the `StudyNCTID` column.
- `idx_study_condition_study_id` on the `StudyCondition` table for optimizing searches and joins on the `StudyNCTID` column.
- `idx_study_condition_condition_name` on the `StudyCondition` table for optimizing searches and joins on the `ConditionName` column.
- `idx_outcome_study_id` on the `Outcome` table for optimizing searches and joins on the `StudyNCTID` column.
- `idx_study_investigator_study_id` on the `StudyInvestigator` table for optimizing searches and joins on the `StudyNCTID` column.
- `idx_location_country` on the `Location` table for optimizing searches and joins on the `Country` column.

### Views:

- `ActiveStudiesWithOrganizations`: This view retrieves active studies along with their organization details, enabling efficient queries for active studies and their associated organizations.
- `TotalStudiesByOrganization`: This view calculates the total number of studies conducted by each organization, facilitating queries related to organization-level study counts.
- `InterventionsWithStudyTitles`: This view displays interventions along with their corresponding study titles, allowing for easy retrieval of intervention details and associated study information.
- `StudiesWithOutcomesAndInvestigators`: This view retrieves studies along with their outcome measures and primary investigators, allowing for efficient queries involving study outcomes and investigator information.
- `StudiesWithEligibilityAndConditions`: This view retrieves studies along with their eligibility criteria and medical conditions, enabling queries that combine study, eligibility, and condition information.

## Limitations

- Limited Patient Data: The database does not store detailed patient information, such as individual participant data or medical records. It only includes eligibility criteria and age ranges for participants.
- No Study Protocol Details: The database does not store detailed study protocols, documentation, or specific procedural information related to the studies.
- Limited Organizational Information: The database stores minimal information about organizations, such as their names and classifications, but does not include other details like contact information, financial data, or organizational structures.
- Static Data: The database is designed to store and analyze static data related to clinical studies. It does not support dynamic updates or tracking of study progress or participant enrollment over time.
- No External Integration: The database is a standalone system and does not integrate with external systems or databases, such as electronic health record (EHR) systems or regulatory databases.
- Limited Data Granularity: Some data elements, such as outcome measures and eligibility criteria, are stored as text fields, which may limit the ability to perform detailed analysis or querying based on specific criteria within those fields.
