*** Settings ***
Documentation    Liste des propriétaires
Metadata         ID                           2
Metadata         Reference                    GAL01
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Liste des propriétaires
    [Documentation]    Liste des propriétaires

    Given Je suis connecté
    And Je suis sur la page d'accueil
    When Je clique sur le bouton Galerie
    Then Il existe une liste déroulante labélisé "Maître" de propriétaire de chat


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_2_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_2_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_2_SETUP_VALUE} =    Get Variable Value    ${TEST_2_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_2_SETUP_VALUE is not None
        Run Keyword    ${TEST_2_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_2_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_2_TEARDOWN}.

    ${TEST_2_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_2_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_2_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_2_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
