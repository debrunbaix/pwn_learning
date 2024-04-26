# structure :

## boucle :

pour former une boucle il faut une condition de boucle comme avec l'instruction :
- `cmp` : 
	- fait comme l'instruction sub sans changer les valeurs des registres
	- pour savoirsi registre 1 est plus grand que registre 2
en fonction de la réponse de `cmp`, nous utiliserons ensuite une instruction pour exécuter la boucle comme :
- `jg` : si 1 est plus grand que 2, l'instruction est executé
- `jle` : jump if less or equal
- etc....
## Procédures

sorte de fonction qui sont des blocs de code réutilisable à des fins d'optimisation

pour appeler une procédure :
- `call` -> `ret` : `call` stocke l'adresse de retour avant d'aller dans la procédure puis `ret` jump vers l'adresse stocké par call
