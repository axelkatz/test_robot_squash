*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}        http://localhost:8080
${browser}    firefox

*** Keywords ***

Je suis sur la page de CatsClub
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    2
    Page Should Contain     Cats Club

je clique sur l'onglet "Connexion"
    Click Element    xpath=//a[@href='connection.html']

Je saisis la valeur "a" dans l'élément "Login"
    Input Text    id:loginInput    a

Je saisis la valeur "login" dans l'élément "Login"
    Input Text    id:loginInput    login

Je saisis la valeur "a" dans l'élément "Mdp"
    Input Text    id:passwordInput     a

Je saisis la valeur "pwd" dans l'élément "Mdp"
    Input Text    id:passwordInput     pwd

Je clique sur le bouton Connexion
    Click Button     id:connectionButton
    Sleep    2

Je suis connecté en tant que "Enrico Pallazzo"
    Page Should Contain    Enrico Pallazzo

Un message d'erreur s'affiche : "Identifiant et/ou mot de passe incorrect(s)"
    Page Should Contain     Identifiant et/ou mot de passe incorrect(s)
    
L'input de login est présent
    Page Should Contain    Identifiant

L'input de mot de passe est présent
    Page Should Contain    Mot de passe

le bouton de connexion est présent
    Page Should Contain Button    id:connectionButton

le bouton de mot de passe oublié est présent
    Page Should Contain Button    xpath=//input[@value='Mot de passe oublié']
