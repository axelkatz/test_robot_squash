*** Keywords ***

Given J'ai un "${dataset}[item]" dans le panier
    Log To Console     ${dataset}[item]

When Je clique sur la corbeille en face de l'"${dataset}[item]" dans le panier
    Log To Console     ${dataset}[item]

Then Le panier ne contient plus l'"${dataset}[item]"
    Log To Console     ${dataset}[item]
