*** Settings ***
Documentation    Connexion Cas Passant
Metadata         ID                           4
Metadata         Reference                    01
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Connexion Cas Passant
    [Documentation]    Connexion Cas Passant

    Given Je suis sur la page de CatsClub
    When je clique sur l'onglet "Connexion"
    And Je saisis la valeur "a" dans l'élément "Login"
    And Je saisis la valeur "a" dans l'élément "Mdp"
    And Je clique sur le bouton Connexion
    Then Je suis connecté en tant que "Enrico Pallazzo"


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
