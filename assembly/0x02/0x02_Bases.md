# Les registres x86

## Définition

- Emplacement de mémoire très rapide dans le processeur
- stockage de données et d'adresses durant l'execution d'un programme
## Les types de registre

- `Registre généraux` : 
	- AX, BX, CX, DX
	- pour des opérations :
		- Arithmétiques
		- Logiques
		- stockage de données
- `Registre d'index` :
	- SI, DI, BP, SP
	- utilisé pour de l'adressage de mémoire
- `Registre de segment` :
	- CS, DS, ES, SS
	- determine les segments de mémoire utilisés pour le code, les données et la pile
- `Registre d'instruction` :
	- IP
	- pointe sur la prochaine instruction a exécuter
- `Registre d'etat` :
	- FLAGS
	- contient l’état du processeur

> Les registres sont comme des variables mais en nombre limité et extrêmement rapide.
# Les instructions 

## Définition

Les instructions sont ce que le processeur va devoir exécuter.
## Les types d'instructions

- `Mouvement de données` :
	- mov : ajoute une valeur à un registre 
	- push : ajoute une valeur dans la pile
	- pop : supprime la dernière valeur de la pile
- `Opération arithmétique` :
	- add : ajoute une valeur a celle d'un registre
	- sub : soustrait une valeur a celle d'un registre
	- mul : multiplie une valeur a celle d'un registre
	- div : divise une valeur a celle d'un registre
- `Contrôle de flux` :
	- jmp, je, jne : permet d'aller a une adresse précise
	- call : appel une focntion précise
# Coder en assembleur :

## structure du fichier :

un fichier source est divisé en sections : 
- `.data` : contient des variables
- `.text` : point d'entré du programme comme `_start`
## exemple :

```asm
section .text
        global _start

_start:
        mov rax, 0x1
        mov rbx, 0x2

        xor rax, rbx
        xor rbx, rax
        xor rax, rbx

        mov rax, 60
        xor rdi, rdi
        syscall
```

## les boucles

