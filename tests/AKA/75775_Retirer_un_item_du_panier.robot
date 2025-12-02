*** Settings ***
Documentation    Retirer un item du panier
Metadata         ID                           75775
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Retirer un item du panier
    [Documentation]    Retirer un item du panier

    &{dataset} =    Retrieve Dataset

    Given J'ai un "${dataset}[item]" dans le panier
    When Je clique sur la corbeille en face de l'"${dataset}[item]" dans le panier
    Then Le panier ne contient plus l'"${dataset}[item]"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_75775_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_75775_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =          Get Variable Value    ${TEST_SETUP}
    ${TEST_75775_SETUP_VALUE} =    Get Variable Value    ${TEST_75775_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_75775_SETUP_VALUE is not None
        Run Keyword    ${TEST_75775_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_75775_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_75775_TEARDOWN}.

    ${TEST_75775_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_75775_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =          Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_75775_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_75775_TEARDOWN}
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

    ${item} =    Get Test Param    DS_item

    &{dataset} =    Create Dictionary    item=${item}

    RETURN    &{dataset}
