*** Settings ***
Documentation    Conformité de la page de connexion
...
...              Ce test vérifie que la page de connexion du site Cats Club contient bien 
...              tous les éléments attendus (Un champ identifiant, un champ mot de passe, 
...              deux boutons : connexion et mot de passe oublié...)
Metadata         ID                           1
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Conformité de la page de connexion
    [Documentation]    Conformité de la page de connexion

    Given Je suis sur le site
    And Je suis sur la page de connexion
    Then Je vois un champ Identifiant au-dessus d'un champ Mot de passe, chaque champ est précédé d'une icône
    And En dessous des deux champs, il y a deux boutons côte à côte : Connexion et Mot de passe oublié


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_1_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_1_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_1_SETUP_VALUE} =    Get Variable Value    ${TEST_1_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_1_SETUP_VALUE is not None
        Run Keyword    ${TEST_1_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_1_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_1_TEARDOWN}.

    ${TEST_1_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_1_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_1_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_1_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
