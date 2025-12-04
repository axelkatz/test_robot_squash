# language: en
Feature: Format du formulaire

	Scenario: Format du formulaire
		Given Je suis sur la page de CatsClub
		When je clique sur l'onglet "Connexion"
		Then L'input de login est présent
		Then L'input de mot de passe est présent
		Then le bouton de connexion est présent
		Then le bouton de mot de passe oublié est présent