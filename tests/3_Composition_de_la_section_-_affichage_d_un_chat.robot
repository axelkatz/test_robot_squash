*** Settings ***
Documentation    Composition de la section - affichage d'un chat
Metadata         ID                           3
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Composition de la section - affichage d'un chat
    [Documentation]    Composition de la section - affichage d'un chat

    Given Je suis connecté avec l'id: a et le mot de passe : a
    And je clique sur la section "Mon espace"
    When Dans la section Mes chats : Je clique sur le premier chat de la liste
    Then un cadre présentant le chat sélectionné avec son nom, sa race, sa date de naissance et une image sur la partie droite


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_3_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_3_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_3_SETUP_VALUE} =    Get Variable Value    ${TEST_3_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_3_SETUP_VALUE is not None
        Run Keyword    ${TEST_3_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_3_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_3_TEARDOWN}.

    ${TEST_3_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_3_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_3_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_3_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
