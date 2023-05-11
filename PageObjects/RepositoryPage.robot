*** Settings ***
Documentation           Page Objects for Login Keywords
...                     Author: Rae Azcueta
Library                 SeleniumLibrary
Variables               ../ConfigEnvironment.py

*** Variables ***
${repository_tab}               xpath://fdx-main-nav-item[contains(@ng-if,"!item.component")]//div[contains(@class,"has-sub-menu")]
${repo_studies_menu}            xpath://li[@id="menuMdbStudies"]/span/span
${tech_study_options}           css:#fdxMdbContainerListItem0MenuToggle
${tech_view_menu}               xpath://li[@id="fdxMdbContainerListItem0View"][contains(.,"View")]
${tech_edit_menu}               xpath://li[@id="fdxMdbContainerListItem0Edit"][contains(.,"Edit")]
${tech_remove_study_menu}       xpath://li[@id="fdxMdbContainerListItem0Delete"][contains(.,"Remove this study")]
${tech_transition_study_menu}   xpath://li[@id="fdxMdbContainerListItem0Transition"][contains(.,"Transition this study")]
${data_acquisition}             id:ViewAssetGroupdataAcquisition
${asset_form}                   id:FORMTypeView
${medical_history_form}         xpath://span[@class="itemTitle"]//span[contains(.,"Medical History")]
${edit_form_btn}                id:switchEditMode
${edit_form_description}        id:assetLocaleEditTextTextareadescriptionen
${medical_his_description}      id:assetLocaleEditTextTextareadescriptionen
${save_asset_btn}               id:saveAsset

*** Keywords ***
Navigate To Repository
    Wait Until Element Is Visible   ${repository_tab}
    Mouse Over                      ${repository_tab}

Open Studies
    Wait Until Element Is Visible   ${repo_studies_menu}
    Click Element                   ${repo_studies_menu}

Open Tech Study Menu
    Wait Until Element Is Visible   ${tech_study_options}
    Click Element                   ${tech_study_options}

View Tech Study
    Click Element   ${tech_view_menu}

Open Data Acquisition
    Wait Until Element Is Visible   ${data_acquisition}
    Click Element                   ${data_acquisition}

Open Forms
    Wait Until Element Is Visible   ${asset_form}
    Click Element                   ${asset_form}

Open Medical History
    Wait Until Element Is Visible   ${medical_history_form}
    Click Element                   ${medical_history_form}

Edit Medical History Description
    [Arguments]                     &{RepositoryPage}
    Wait Until Element Is Visible   ${edit_form_btn}
    Click Button                    ${edit_form_btn}
    Clear Element Text              ${edit_form_description}
    Input Text                      ${edit_form_description}    ${RepositoryPage}[medicalHistoryDescription]

Save Asset
    Wait Until Element Is Enabled   ${save_asset_btn}
    Click Button                    ${save_asset_btn}

Validate Medical Form Description
    [Arguments]                     &{RepositoryPage}
    Wait Until Element Is Visible   xpath://span[@id="formDescription"]//span[contains(.,"${RepositoryPage}[medicalHistoryDescription]")]

End Test Case
    Close Browser
