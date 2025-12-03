*** Settings ***
Documentation    Connexion
Metadata         ID                           4
Metadata         Reference                    01
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Connexion
    [Documentation]    Connexion

    &{dataset} =    Retrieve Dataset

    Given Je suis sur la page de CatsClub
    When je clique sur l'onglet "Connexion"
    And Je saisis la valeur "${dataset}[login]" dans l'élément "Login"
    And Je saisis la valeur "${dataset}[pwd]" dans l'élément "Mdp"
    And Je clique sur le bouton Connexion
    Then Le resultat est : "${dataset}[resultat]"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_4_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_4_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_4_SETUP_VALUE} =    Get Variable Value    ${TEST_4_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_4_SETUP_VALUE is not None
        Run Keyword    ${TEST_4_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_4_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_4_TEARDOWN}.

    ${TEST_4_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_4_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_4_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_4_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Dataset
    [Documentation]    Retrieves Squash TM's datasets and stores them in a dictionary.
    ...
    ...                For instance, datasets containing 3 parameters "city", "country" and "currency"
    ...                have been defined in Squash TM.
    ...
    ...                First, this keyword retrieves parameter values from Squash TM
    ...                and stores them into variables, using the keyword 'Get Test Param':
    ...                ${city} =    Get Test Param    DS_city
    ...
    ...                Then, this keyword stores the parameters into the &{dataset} dictionary
    ...                with each parameter name as key, and each parameter value as value:
    ...                &{dataset} =    Create Dictionary    city=${city}    country=${country}    currency=${currency}

    ${login} =       Get Test Param    DS_login
    ${pwd} =         Get Test Param    DS_pwd
    ${resultat} =    Get Test Param    DS_resultat

    &{dataset} =    Create Dictionary    login=${login}    pwd=${pwd}    resultat=${resultat}

    RETURN    &{dataset}
