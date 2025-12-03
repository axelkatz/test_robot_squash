*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}        http://localhost:8080/index.html
${browser}    firefox

*** Keywords ***

Je suis sur la page de CatsClub
    Open Browser    ${url}    ${browser}
    Sleep    2
    Page Should Contain     Cats Club

je clique sur l'onglet "Connexion"
    Click Element    xpath=//a[@href='connection.html']

Je saisis la valeur "${dataset}[login]" dans l'élément "Login"
    Input Text    id:loginInput    ${dataset}[login]

Je saisis la valeur "${dataset}[pwd]" dans l'élément "Mdp"
    Input Text    id:passwordInput     ${dataset}[pwd]
Je clique sur le bouton Connexion
    Click Button     id:connectionButton

Le resultat est : "${dataset}[resultat]"
    