*** Settings ***
Documentation    Connexion Cas Non Passant
Metadata         ID                           6
Metadata         Reference                    02
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
#Test Setup       Test Setup
Test Teardown    Close Browser


*** Test Cases ***
Connexion Cas Non Passant
    [Documentation]    Connexion Cas Non Passant

    Given Je suis sur la page de CatsClub
    When je clique sur l'onglet "Connexion"
    And Je saisis la valeur "login" dans l'élément "Login"
    And Je saisis la valeur "pwd" dans l'élément "Mdp"
    And Je clique sur le bouton Connexion
    Then Un message d'erreur s'affiche : "Identifiant et/ou mot de passe incorrect(s)"

    [Teardown]    Test Teardown

*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_6_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_6_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_6_SETUP_VALUE} =    Get Variable Value    ${TEST_6_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_6_SETUP_VALUE is not None
        Run Keyword    ${TEST_6_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_6_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_6_TEARDOWN}.

    ${TEST_6_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_6_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_6_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_6_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
