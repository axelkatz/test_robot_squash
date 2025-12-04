# language: en
Feature: Connexion Cas Passant

	Scenario: Connexion Cas Passant
		Given Je suis sur la page de CatsClub
		When je clique sur l'onglet "Connexion"
		And Je saisis la valeur "a" dans l'élément "Login"
		And Je saisis la valeur "a" dans l'élément "Mdp"
		And Je clique sur le bouton Connexion
		Then Je suis connecté en tant que "Enrico Pallazzo"