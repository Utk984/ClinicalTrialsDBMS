INSERT INTO Study (NCTID, OrgFullName, BriefTitle, Title, StudyType, Status, StartDate, PrimaryCompletionDate, StudyCompletionDate)
VALUES
('NCT01110954', 'Photonamic GmbH & Co. KG', 'Fluorescence-guided Resection in Breast Cancer', 'Evaluation of the Suitability of PD L 506 for Intraoperative Visualisation of Palpable and Nonpalpable Breast Cancer Tissue', 'Interventional', 'Terminated', '2010-05-31', '2012-07-19 ', '2012-12-20'),
('NCT01522300', 'Centre Jean Perrin', 'Etude Tomos- Apport de la Tomosynthèse Dans le Bilan dExtension locorégional préthérapeutique dUne Tumeur du Sein : Recherche de multicentricité Tomos Study- Contribution of Tomosynthesis In Locoregional Pretherapeutic Staging of a Breast Tumor: Multicentricity Search', 'Etude Tomos- Apport de la Tomosynthèse Dans le Bilan dExtension locorégional préthérapeutique dUne Tumeur du Sein : Recherche de multicentricité', 'Interventional', 'Terminated', '2012-01', '2013-08', '2013-08'),
('NCT03777852', 'University of Sao Paulo', 'Emotional Evaluation and Reconstructed Breast Satisfaction', 'Emotional Evaluation and Reconstructed Breast Satisfaction After Breast Cancer Treatment: Breast Q Questionary', 'Interventional', 'Terminated', '2019-07-01', '2021-02-28', '2022-02-28'),
('NCT02060643', 'Royal Marsden NHS Foundation Trust', 'A Cross-sectional Study Looking at the Effect of Radiotherapy on Carotid Intima-medial Thickness in Head and Neck Cancer', 'A Cross-sectional Study Looking at the Effect of Radiotherapy on Carotid Intima-medial Thickness in Head and Neck Cancer', 'Observational', 'Completed', '2011-10', '2013-11', '2013-11'),
('NCT02069964', 'Royal Marsden NHS Foundation Trust', 'A Prospective Longitudinal Cohort Study Looking at the Difference in Carotid Intima-medial Thickness Between Irradiated and Unirradiated Carotid Arteries in Patients With Head and Neck Cancer', 'A Prospective Longitudinal Cohort Study Looking at the Difference in Carotid Intima-medial Thickness Between Irradiated and Unirradiated Carotid Arteries in Patients With Head and Neck Cancer', 'Observational', 'Completed', '2011-10', '2017-10', '2017-10'),
('NCT00381225', 'Johns Hopkins University', 'Feasibility of Ultra-sound Guided Radiofrequency Ablation in the Management of Head and Neck Neoplasia.', 'Feasibility of Ultra-sound Guided Radiofrequency Ablation in the Management of Head and Neck Neoplasia.', 'Interventional', 'Withdrawn', '2006-11', '2008-03-18', '2008-03-18'),
('NCT02967965', 'EZUS-LYON 1', 'CARdioprotection in Myocardial Infarction', 'CARIM Cohort (CARdioprotection in Myocardial Infarction)', 'Observational', 'Active, Not Recruiting', '2013-11-30', '2022-12-31', '2024-12-31'),
('NCT01007279', 'University of Roma La Sapienza', 'Rosuvastatin in Preventing Myonecrosis in Elective Percutaneous Coronary Interventions (PCIs)', 'ROsuvastatin Pretreatment in Patients Undergoing Elective PCI to Reduce the Incidence of MyocArdial Periprocedural Necrosis', 'Interventional', 'Completed', '2010-03', '2011-09', '2011-09'),
('NCT02376244', 'Liverpool Heart and Chest Hospital NHS Foundation Trust', 'The Health Impact of High Intensity Exercise Training With Intervals During Cardiac Rehabilitation', 'A Randomised Controlled Trial on the Efficacy of High Intensity Interval Training Compared With Moderate Intensity Interval Training for Patients Undergoing Cardiac Rehabilitation', 'Interventional', 'Completed', '2015-09', '2016-03', '2016-03');


INSERT INTO Condition (Name) VALUES
('Breast Tumour'),
('Mammary Tumor'),
('Malignant Neoplasm of the Breast'),
('Head Tumour'),
('Neck Tumour'),
('Head and Neck Neoplasia'),
('Myocardial Infarct'),
('Periprocedural Myocardial Necrosis'),
('Heart Disease'),
('Heart Attacks');


INSERT INTO StudyCondition (StudyNCTID, ConditionName) VALUES
('NCT01110954', 'Breast Tumour'),
('NCT01522300', 'Mammary Tumor'),
('NCT03777852', 'Malignant Neoplasm of the Breast'),
('NCT02060643', 'Head Tumour'),
('NCT02060643', 'Neck Tumour'),
('NCT02069964', 'Head Tumour'),
('NCT02069964', 'Neck Tumour'),
('NCT00381225', 'Head and Neck Neoplasia'),
('NCT02967965', 'Myocardial Infarct'),
('NCT01007279', 'Periprocedural Myocardial Necrosis'),
('NCT02376244', 'Heart Disease'),
('NCT02376244', 'Heart Attacks');

INSERT INTO Intervention (StudyNCTID, Type, Description) VALUES
('NCT01110954', 'Drug', 'PD L 506'),
('NCT01522300', 'Other', 'Evaluation of the Tomosynthesis'),
('NCT01522300', 'Other', 'Evaluation of a medical device: the tomosynthesis'),
('NCT03777852', 'Diagnostic Test', 'First Questionnaire application'),
('NCT03777852', 'Diagnostic Test', 'Second Questionnaire application'),
('NCT00381225', 'Procedure', 'Ultra-sound guided radio-frequency ablation'),
('NCT02967965', 'Other', 'Imagery'),
('NCT01007279', 'Drug', 'ROSUVASTATIN'),
('NCT02376244', 'Other', 'High intensity interval training (HIIT)'),
('NCT02376244', 'Other', 'Standard care');


INSERT INTO InterventionGroup (InterventionID, Type, Name, Description) VALUES
(1, 'Experimental', 'PD L 506 Administration Group', 'Patients receiving PD L 506 for intraoperative visualization'),
(1, 'Control', 'Standard Surgery Group', 'Patients undergoing standard surgery without PD L 506 administration'),
(2, 'Experimental', 'Tomosynthesis Evaluation Group', 'Patients undergoing evaluation with tomosynthesis'),
(2, 'Control', 'Conventional Imaging Group', 'Patients undergoing conventional imaging without tomosynthesis'),
(4, 'Experimental', 'First Questionnaire Group', 'Patients undergoing the first questionnaire application'),
(5, 'Experimental', 'Second Questionnaire Group', 'Patients undergoing the second questionnaire application'),
(6, 'Experimental', 'Radiofrequency Ablation Group', 'Patients undergoing ultrasound-guided radiofrequency ablation'),
(7, 'Experimental', 'Imagery Group', 'Patients undergoing imagery for cardiac evaluation'),
(8, 'Experimental', 'Rosuvastatin Administration Group', 'Patients receiving rosuvastatin as pretreatment for PCI'),
(9, 'Experimental', 'High Intensity Interval Training (HIIT) Group', 'Patients undergoing high intensity interval training during cardiac rehabilitation'),
(9, 'Control', 'Standard Care Group', 'Patients undergoing standard care during cardiac rehabilitation');

INSERT INTO Eligibility (StudyNCTID, InclusionCriteria, ExclusionCriteria, HealthyVolunteers, Sex, MinimumAge, MaximumAge)
VALUES
('NCT01110954', 'Written informed consent; Caucasian female postmenopausal patients; Patients with histologically confirmed primary palpable and nonpalpable breast cancer sized up to 5 cm (T1 - T2)', 'Suspicious lymphogenic metastases (cN1-3); Acute or chronic hepatic diseases; Manifest renal diseases with renal dysfunction; Relevant cardiac disease; Preceding therapy of breast tumour under investigation; Patients with multiple attempts of hook-wire placement in preparation of surgery; Dementia or psychic condition that might interfere with the ability to understand the study and thus give a written informed consent; Simultaneous participation in another clinical study or participation in another clinical study in the 30 days directly preceding treatment', 0, 'F', 18, 100),
('NCT01522300', 'Age> 18 years.; Patients with a breast tumor, regardless of the stage and size; Compulsory affiliation to a social security system.; Obtaining informed consent in writing, signed and dated.', 'Patients with cognitive or psychiatric disorders.; Patient deprived of liberty by a court or administrative.; Patients with indications against the achievement of MRI, mammography and tomosynthesis; Pregnant Women', 0, 'F', 18, 100),
('NCT03777852', 'women over eighteen years of age; women with proven histological diagnosis of breast cancer; women who have an indication of mastectomy as part of their treatment; women who have breast reconstruction, regardless of the technique used, as part of their treatment; women under 70 years of age at the time of the reconstructive surgery', 'women diagnosed with breast cancer and treated with conservative surgeries; women who refuse reconstruction as part of treatment; women who refused surgery as part of the treatment for breast cancer', 0, 'F', 18, 70),
('NCT02060643', 'Be 18 years or older; Histologically confirmed cancer or benign tumours of the head and neck area treated with hemi-neck radiotherapy to ≥ 50Gy; Received radiotherapy to the neck area more than 24 months previously; Intervening neck dissection allowed; Be able to provide written informed consent', 'Patients who have active head and neck cancer; Patients with a prior history of carotid endarterectomy or carotid angioplasty and stenting', 0, 'All', 18, 100),
('NCT02069964', 'Be 18 years or older; Histologically confirmed cancer or benign tumours of the head and neck area requiring ≥ 50Gy to one side of the neck (conventional or intensity modulated RT); Prior or subsequent neck dissection allowed (irradiated and/or unirradiated side); Be able to provide written informed consent', 'Patients with bulky nodal neck disease that may interfere with acquisition of ultrasound images; Patients with a prior history of carotid endarterectomy or carotid angioplasty and stenting', 0, 'All', 18, 100),
('NCT00381225', 'Patients with head and neck neoplasia.', 'When the patient does not meet the inclusion criteria.; When the patient has a contra-indication of surgery or anesthesia.; If the patient refuses involvement in the study.', 0, 'All', 18, 90),
('NCT02967965', 'Any patient hospitalized in the cardiology department of the participating centers: Who have signed the Informed Consent Form.; Patient having health insurance.; Requiring PCI for reperfusion.; With a diagnosis of a first MI.; With ST segment elevation and/or Q wave at admission.; With troponin elevation.; Seen within the first 12 hours after symptom onset.; Aged between 18 and 90 years.', 'Refusal of the patient.; In case of poor echogenicity, the participation of the patient will be stopped.; Patient with diagnosis of previous MI, or hypertrophic or dilated cardiomyopathy, or significant valvular heart disease, or chronic atrial fibrillation, or pace maker or any permanent implanted device susceptible to interfere with LV remodeling.; Patient with preexisting heart failure.; Patient with any previous cardiac surgery.; Patient with previous chemotherapy susceptible to induce LV remodeling (anthracyclines).; Patient with an associated short-time life-threatening disease.; Pregnant or breast-feeding patient.; Contra-indication to MRI (claustrophobia, pacemaker or any other metallic implants, creatinin clearance < 30mL/min/1.73m2 MDRD).', 0, 'All', 18, 90),
('NCT01007279', 'Patients with stable angina', 'Baseline myocardial enzyme rise', 0, 'All', 18, 100),
('NCT02376244', 'History of acute coronary syndromes, had a recent revascularization procedure; History of stable heart failure or stable angina', 'Unstable angina; Systolic blood pressure of >200 mm Hg, or diastolic blood pressure >110 mm Hg (should be assessed on a case-by-case basis); Orthostatic blood pressure drop of >20 mm Hg with symptoms; May have had the implantation of cardiac defibrillators (ICD); Synchronization devices or ventricular assist devices; Have had a heart valve repair/replacement, a heart transplant, or grown-up congenital heart disease, critical aortic stenosis, acute systemic illness or fever, -; Uncontrolled atrial or ventricular arrhythmias, acute pericarditis or myocarditis; Recent embolism, thrombophlebitis, resting S-T segment depression (>2 mm), uncontrolled diabetes (should be assessed in accordance with local protocol and on a case-by-case basis); Severe orthopedic conditions that would prohibit exercise; Other metabolic conditions, such as acute thyroiditis, hypokalemia or hyperkalemia, hypovolemia, severe rejection (cardiac transplant recipients), triple A >4.5 cm (if under surveillance will need confirmation from vascular surgeon as long as blood pressure remains stable); Tachycardia >100 beats per minute at rest, or cataracts (may commence exercise after 6 weeks)', 0, 'All', 0, 100);

INSERT INTO Outcome (StudyNCTID, PRIMARYOutcomeMeasure, PrimaryOutcomeTimeFrame, PrimaryOutcomeTimeFrameUnit, SecondaryOutcomeMeasure, SecondaryOutcomeTimeFrame, SecondaryOutcomeTimeFrameUnit)
VALUES
('NCT01110954', 'Fluorescence intensity in breast cancer tissue', 3, 'Hours', 'Laboratory data and adverse events', 14, 'Days'),
('NCT01522300', 'To calculate the sensitivity and specificity of both types of imaging (mammography and Tomosynthesis) with respect to number of tumors multicentric and multifocal identified through MRI.', 1, 'Months', NULL, NULL, NULL),
('NCT03777852', 'Comparison of results between the first and the second Breast Q score. This score represents questionnaries about diferents domains and each question has four possible dimensions. The values of these dimensions varies from 1 to 4 (Likert Scale). The sum of each domain raw score scale will be plotted in the Breast Q Conversion Table to convert the summed domain score to a Equivalent Rasch Transformed Score with values ranging from 0 (worst) to 100 (best).', 6, 'Months', NULL, NULL, NULL),
('NCT02060643', 'The difference in mean IMT between irradiated and unirradiated carotid arteries.', 2, 'Years', 'The prevalence of carotid artery stenosis in irradiated carotid arteries compared to unirradiated carotid arteries.', 2, 'Years'),
('NCT02069964', 'The difference in mean carotid IMT at one year after radiotherapy between irradiated and unirradiated carotid arteries', 1, 'Years', 'The difference in mean carotid IMT at 2 and 5 years after radiotherapy between irradiated and unirradiated carotid arteries.', 2, 'Years'),
('NCT00381225', 'Technical success is defined as the ability to successfully enter the thyroid nodule via ultrasound guidance and apply the RFA. Assessed via surgeon self report', 1, 'Hours', NULL, NULL, NULL),
('NCT02967965', 'Determinants of myocardial infarct injury', 5, 'Years', NULL, NULL, NULL),
('NCT01007279', 'Myocardial enzymes arise', 24, 'Hours', 'MACE', 9, 'Months'),
('NCT02376244', 'Changes in Heart Rate Variability (as measured by a hemodynamic monitoring system)', 8, 'Weeks', 'Changes in Baroreflex Sensitivity', 8, 'Weeks');

INSERT INTO Location (StudyNCTID, LocationName, City, State, Country) VALUES 
('NCT01110954','Munich, Germany', 'Munich', 'Bavaria', 'Germany'),
('NCT01522300','Clermont Ferrand, France, 63011 Centre Jean Perrin', 'Clermont Ferrand', NULL, 'France'),
('NCT03777852','Ribeirão Preto, SP, Brazil, 14048900 Hospital das Clínicas de Ribeirão Preto', 'Ribeirão Preto', 'SP', 'Brazil'),
('NCT02060643','Location not provided', NULL, NULL, NULL),
('NCT02069964','London, United Kingdom, SW3 6JJ Royal Marsden Hospital', 'London', NULL, 'United Kingdom'),
('NCT00381225','Baltimore, Maryland, United States, 21287 Johns Hopkins University School of Medicine, Department of Otolaryngology-Head and Neck Surgery', 'Baltimore', 'Maryland', 'United States'),
('NCT02967965','Tours, Indre Et Loire, France, 37044 CHRU de Tours', 'Tours', 'Indre Et Loire', 'France'),
('NCT01007279','Rome, Italy, 00166 Policlinico Umberto I', 'Rome', NULL, 'Italy'),
('NCT02376244','Liverpool, United Kingdom, L14 3PE Liverpool Heart and Chest Hospital', 'Liverpool', NULL, 'United Kingdom');

INSERT INTO Organisation (OrgFullName, OrgClass) VALUES 
('photonamic GmbH & Co. KG', 'INDUSTRY'),
('Centre Jean Perrin', 'OTHER_GOV'),
('Helio Carrara', 'INDIV'),
('University of Sao Paulo', 'OTHER_GOV'),
('Royal Marsden NHS Foundation Trust', 'OTHER_GOV'),
('Johns Hopkins University', 'OTHER_GOV'),
('EZUS-LYON 1', 'FED'),
('University of Roma La Sapienza', 'INDUSTRY'),
('Liverpool Heart and Chest Hospital', 'OTHER_GOV'),
('NHS Foundation Trust', 'INDIV'),
('Edge Hill University', 'NIH');

INSERT INTO StudyOrganisation (OrgFullName, StudyNCTID) VALUES 
('photonamic GmbH & Co. KG', 'NCT01110954'),
('Centre Jean Perrin', 'NCT01522300'),
('University of Sao Paulo', 'NCT03777852'),
('Royal Marsden NHS Foundation Trust', 'NCT02060643'),
('Royal Marsden NHS Foundation Trust', 'NCT02069964'),
('Johns Hopkins University', 'NCT00381225'),
('EZUS-LYON 1', 'NCT02967965'),
('University of Roma La Sapienza', 'NCT01007279'),
('Liverpool Heart and Chest Hospital', 'NCT02376244'),
('Edge Hill University', 'NCT02376244');

INSERT INTO Investigator (InvestigatorName, Affiliation, Role) VALUES
('Helio HA Carrara', 'University of Sao Paulo', 'PRINCIPAL_INVESTIGATOR'),
('Genevieve DERUMEAUX', 'Centre Jean Perrin', 'PRINCIPAL_INVESTIGATOR'),
('Felipe Cunha', 'University of Sao Paulo', 'PRINCIPAL_INVESTIGATOR'),
('Christopher M Nutting', 'Royal Marsden NHS Foundation Trust', 'PRINCIPAL_INVESTIGATOR'),
('Kieran Murphy', 'Royal Marsden NHS Foundation Trust', 'SUB_INVESTIGATOR'),
('Adrian Roose', 'Johns Hopkins University', 'PRINCIPAL_INVESTIGATOR'),
('Joseph Mills', 'EZUS-LYON 1', 'PRINCIPAL_INVESTIGATOR'),
('Adrian Midgley', 'University of Roma La Sapienza', 'PRINCIPAL_INVESTIGATOR'),
('Alison C Welsh', 'Liverpool Heart and Chest Hospital', 'PRINCIPAL_INVESTIGATOR'),
('Bashir Matata', 'Liverpool Heart and Chest Hospital', 'SUB_INVESTIGATOR');

INSERT INTO StudyInvestigator (StudyNCTID, InvestigatorName) VALUES 
('NCT01110954', 'Helio HA Carrara'),
('NCT01522300', 'Genevieve DERUMEAUX'),
('NCT03777852', 'Felipe Cunha'),
('NCT02060643', 'Christopher M Nutting'),
('NCT02060643', 'Kieran Murphy'),
('NCT00381225', 'Adrian Roose'),
('NCT02967965', 'Joseph Mills'),
('NCT01007279', 'Adrian Midgley'),
('NCT02376244', 'Alison C Welsh'),
('NCT02376244', 'Bashir Matata');
