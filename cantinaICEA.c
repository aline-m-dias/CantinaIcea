#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
void exibeCardapio()
{

    system("cls");
    printf("*********CARDAPIO*********\n\n");
    printf("Codigo \t Produto  \t Preco\n");
    printf ("1 \t Pao de queijo \t 2.00 \n");
    printf ("2 \t Coxinha       \t 2.00\n");
    printf ("3 \t Pizza         \t 4.00\n");
    printf ("4 \t Bolo          \t 5.00\n");
    printf ("5 \t Cafe          \t 2.00\n");
    printf ("6 \t Refrigerante  \t 3.00\n");


}
int main()
{
    setlocale (LC_ALL, "Portuguese");

    exibeCardapio();

    int produtoDesejado;
    int valorCompra=0;
    int valorPago=0;


    while(produtoDesejado!=0)
    {

        printf("\n\n Digite o produto desejado pelo cliente:");
        scanf("%d", &produtoDesejado);

        switch(produtoDesejado)
        {
        case 0:
            printf ("\n\n FINALIZANDO PEDIDO.");
            printf ("\n\n VALOR TOTAL DO PEDIDO: %d REAIS", valorCompra);
            printf ("\n\n INFORME O  VALOR PAGO PELO CLIENTE:");
            scanf  ("%d", &valorPago);
            printf ("\n\n TROCO DO CLIENTE: %d REAIS", (valorPago - valorCompra));
            break;
        case 1:
            valorCompra = valorCompra +2;
            break;

        case 2:

            valorCompra = valorCompra +2;
            break;
        case 3:
            valorCompra = valorCompra +4;
            break;
        case 4:
            valorCompra = valorCompra +5;
            break;
        case 5:
            valorCompra = valorCompra +2;
            break;
        case 6:
            valorCompra = valorCompra +3;
            break;
        default:
            printf("\n\nCODIGO DO PRODUTO INVALIDO.");
            printf("\n\nDIGITE NOVAMENTE O PRODUTO QUE VOCÊ DESEJA.");
        }
    }


    return 0;
}
