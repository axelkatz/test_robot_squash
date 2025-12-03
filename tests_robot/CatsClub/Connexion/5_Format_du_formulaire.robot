*** Settings ***
Documentation    Format du formulaire
Metadata         ID                           5
Metadata         Reference                    03
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Format du formulaire
    [Documentation]    Format du formulaire

    Given Je suis sur la page de CatsClub
    When je clique sur l'onglet "Connexion"
    Then L'input de login est présent
    Then L'input de mot de passe est présent
    Then le bouton de connexion est présent
    Then le bouton de mot de passe oublié est présent


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_5_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_5_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_5_SETUP_VALUE} =    Get Variable Value    ${TEST_5_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_5_SETUP_VALUE is not None
        Run Keyword    ${TEST_5_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_5_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_5_TEARDOWN}.

    ${TEST_5_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_5_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_5_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_5_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
