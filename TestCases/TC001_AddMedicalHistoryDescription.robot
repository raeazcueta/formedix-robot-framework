*** Settings ***
Documentation       TC001 Add Medical History Description
...                 Author: Rae Azcueta
Resource            ../PageObjects/LoginPage.robot
Resource            ../PageObjects/RepositoryPage.robot

Suite Setup         LoginPage.Start Test Case
Suite Teardown      LoginPage.End Test Case

*** Variables ***
&{RepositoryPage}   medicalHistoryDescription=This is a sample description created 5/11/2023

*** Test Cases ***
Step 1: Login
    LoginPage.Load User Credentials and Log In

Step 2: Navigate to Repository → Studies
    RepositoryPage.Navigate To Repository
    RepositoryPage.Open Studies

Step 3: Verify Tech Study Menu Options
    RepositoryPage.Open Tech Study Menu
    Wait Until Element Is Visible       ${tech_view_menu}
    Wait Until Element Is Visible       ${tech_edit_menu}
    Wait Until Element Is Visible       ${tech_remove_study_menu}
    Wait Until Element Is Visible       ${tech_transition_study_menu}

Step 4: Open Tech Test Study View
    RepositoryPage.View Tech Study

Step 5: Open Data Acquisition Asset Group View
    RepositoryPage.Open Data Acquisition

Step 6: Edit Medical History Form Description
    RepositoryPage.Open Forms
    RepositoryPage.Open Medical History
    RepositoryPage.Edit Medical History Description     &{RepositoryPage}
    RepositoryPage.Save Asset

Step 7: Verify User Update in Property Panel and Main Form View
    Textarea Should Contain                                 ${medical_his_description}
    ...                                                     ${RepositoryPage}[medicalHistoryDescription]
    RepositoryPage.Validate Medical Form Description        &{RepositoryPage}

Step 8: Logout
    LoginPage.Logout
