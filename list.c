#include <stdlib.h>
#include <stdio.h>
#include "list.h"
struct ListItem {
 int Value;
 struct ListItem* Next;
};
struct ListItem* Root;
void AddNode( int NewValue ){
 struct ListItem* Item;
 Item = (struct ListItem*) malloc( sizeof(struct ListItem) );
 Item->Value = NewValue;
 Item->Next = Root;
 Root = Item;
}
void CreateList(){
 printf(" Create a list.\n");
 Root = NULL;
 AddNode( 5 );
 AddNode( 4 );
 AddNode( 3 );
 AddNode( 2 );
 AddNode( 1 );
}
void ShowList(){
 struct ListItem* Item;
 printf(" List view.\n");
 Item = Root;
 while (Item != NULL) {
 printf("(%d), ",Item->Value);
 Item = Item->Next;
 }
 printf("\n");
}
void DestroyList(){
 struct ListItem *Item, *Item2;
 printf(" Deleting a list.\n");
 Item = Root;
 while (Item != NULL) {
 Item2 = Item->Next;
 free(Item);
 Item = Item2;
 }
 Root = NULL;
}
void ListFunction(){
 printf("Demonstration of work.\n");
 CreateList();
 ShowList();
 DestroyList();
 printf("\n");
}
