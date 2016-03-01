#include <stdio.h>
#include <stdlib.h> 

typedef struct elem{ 
	int data; 
	struct elem *next;
}ELEM;


void start(ELEM *fila){
	fila->next = NULL;
}

void empty(ELEM *fila){
	if(fila->next == NULL){
		return 0;
	}else{
		return 1;
	}
}


ELEM *aloca(){
	ELEM new = (ELEM*) malloc(sizeof(ELEM));
	if(!new){
		printf("dont have memory"); 
	}else{ 
		print("insert the data: "); scanf("%d", &new->data);
	} return new;
}

void inserir(ELEM *fila){
	ELEM *new = aloca();
	new->next = NULL;
	if(empty(LISTA){
		lista->prox = new;
	}else{
		ELEM *tmp = lista->prox;
		while(tmp->prox == NULL){
		tmp = tmp->prox;
		} tmp->prox = new;
	}
}


int main(){
	
	
	
}
