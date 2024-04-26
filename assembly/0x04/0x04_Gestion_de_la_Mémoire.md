# La pile et le Tas

## La pile :

- En anglais la **stack**
- sous forme LIFO (dernier entré, premier sortis)
- structure de donnée pouvant stocker des variables et autre données temporaire
- géré automatiquement
- pour mettre quelque chose dans la pile `push`, pour enlever `pop`
```asm
mov rax, 0x5

;sauvegarder A dans la pile
push rax

; changement sur A
add rax, 0x5

; récupérer la valeur de base de A (5)
pop rax ; récupère la dernière valeur entré dans la pile donc A
```
## Le tas

- processus manuel contrairement à la pile
- le développeur doit préciser demander ou libérer de la mémoire
# Les pointeurs et les Tableaux

## Les pointeurs

- adresse de zone mémoires stocker dans des registres afin d'y faire des modifications
## Les tableaux

- suite de données consécutive dans la zone mémoire manipulé grace a des pointeurs
```asm
mov rax, address_of_array    ; RAX contient maintenant l'adresse du premier élément
add rax, 4                   ; RAX contient maintenant l'adresse du deuxième élément (4 octets plus loin)
```
# Exercices Pratiques

## **Exercice 1 : Manipulation de la Pile**

- Écrire un programme en assembleur qui utilise la pile pour inverser une chaîne de caractères. Utilisez `push` pour placer chaque caractère sur la pile, puis `pop` pour les retirer dans un nouvel ordre.
## **Exercice 2 : Allocation et Libération Dynamique**

- Créer un petit programme qui simule l'allocation et la libération de mémoire sur le tas. Bien que l'assembleur ne dispose pas de fonctions de haut niveau pour le tas, utilisez des instructions pour simuler cet effet en manipulant directement les adresses et les valeurs.
## **Exercice 3 : Sécurité des Pointeurs**

- Écrire un programme qui montre un exemple de dépassement de tampon (buffer overflow) avec un tableau. Montrez comment écrire au-delà des limites d'un tableau peut affecter d'autres variables en mémoire.