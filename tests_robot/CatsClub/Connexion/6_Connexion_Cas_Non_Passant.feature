# language: en
Feature: Connexion Cas Non Passant

	Scenario: Connexion Cas Non Passant
		Given Je suis sur la page de CatsClub
		When je clique sur l'onglet "Connexion"
		And Je saisis la valeur "login" dans l'élément "Login"
		And Je saisis la valeur "pwd" dans l'élément "Mdp"
		And Je clique sur le bouton Connexion
		Then Un message d'erreur s'affiche : "Identifiant et/ou mot de passe incorrect(s)"