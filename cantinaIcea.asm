
 
.data 
	Cardapio: .Asciiz   " ****************CARDAPIO********************* \n\n\t  0 - FINALIZAR PEDIDO \n\n\t  1 - PÃO DE QUEIJO     VALOR R$ 2,00 \n\n\t  2 - COXINHA           VALOR R$ 2,00  \n\n\t  3 - PIZZA             VALOR R$ 4,00 \n\n\t  4 - BOLO              VALOR R$ 5,00 \n\n\t  5 - CAFÉ              VALOR R$ 2,00\n\n \t  6 - REFRIGERANTE      VALOR R$ 3,00 \n\n\n\n"
	
	ProdutoDesejado: .word  # cria uma variável produtoDesejado 
	ValorCompra:.word  0 # cria uma variável valorCompra de valor com valor 0
	ValorPago: .word  0  # cria uma variável de valorPago com valor 0
	ValorTroco: .word 0  # cria uma variável valorTroco de valor com valor 0
	
	Mensagem1: .asciiz  "\n\n Digite o produto desejado pelo cliente: "
	Mensagem2: .asciiz  "\n\n finalizando pedido... "
	Mensagem3: .asciiz  "\n\n Valor total do pedido: R$ "
	Mensagem4: .asciiz  "\n\n Informe o valor pago pelo cliente:  R$"
	Mensagem5: .asciiz  "\n\n Troco do cliente:  R$ "
	Mensagem6: .asciiz  "\n\n Codigo do produto invalido! "
	
	
.text 
   main:
   	#exibe o cardapio	
	li $v0, 4 #Syscall para  imprimir uma String
	la $a0, Cardapio
	syscall	
	
	lw $t0, ProdutoDesejado  #carrega a variavel ProdutoDesejado para o registrador t0
	 
	 
        lw $t1, ValorCompra  #carrega a variavel valor compra para o registrador t0
	 li $t1, 0  #atribuindo 0 no registrador t1
	
	 
	lw $t2, ValorPago #carrega a variavel valor pago para o registrador t2
	 
	lw $t3, ValorTroco
	                       
	exibeMensagem:
    
    		li $v0, 4 #Syscall para  imprimir uma String
    		la $a0, Mensagem1
    		syscall
    			
    		li $v0, 5 #Syscall para ler um inteiro e o valor estara em v0
    		syscall 
    			
    		move $t0, $v0 # copia para o registador t0(produto desejado) o valor digitado que estva armazenado em v0
    		
      while: #quando produto desejado = 0 termino meu laço
        	
    	          beq $t0, 0,case0 #valor digitado igual a 0 termina o programa
    	          beq $t0, 1,case1 #valor digitado igual a 1  va para a label case1
    	          beq $t0, 2,case2 #valor digitado igual a 2 va para a label case2
    	          beq $t0, 3,case3 #valor digitado igual a 3 va para a label case3
    	          beq $t0, 4,case4 #valor digitado igual a 4 va para a label case4
    	          beq $t0, 5,case5 #valor digitado igual a 5 va para a label case5
    	          beq $t0, 6,case6 #valor digitado igual a 6 va para a label case6
    	          bge $t0,7,default #valor digitado igual a 7  va para a label default
    	
    	#se não executar o while encerra o programa              
        saida: 
        	li $v0, 10
        	syscall
        	
    		
    	 
    	       	          case0:
       		
                                #exibe a mensagem 2
    				li $v0, 4 #Syscall para  imprimir uma String
    				la $a0, Mensagem2
    				syscall
    	
    			        #exibe a mensagem 3
    				li $v0, 4 #Syscall para  imprimir uma String
    				la $a0, Mensagem3
    				syscall
    	                        
    	                        #imprime o valor da compra
    				li $v0, 1 #Syscall para  imprimir um inteiro
				move $a0, $t1
				syscall
				
				#exibe a mensagem 4
				li $v0, 4 #Syscall para  imprimir uma String
    				la $a0, Mensagem4
    				syscall
	                        
	                        #digitar o valor pago pego cliente e armazenar em v0
    				li $v0, 5 #Syscall para ler um inteiro e o valor estara em v0
    		                syscall 
    		                
    		                move $t2, $v0  #move para t2 o valor pago pelo usuario
    		                
    		                #exibe a mensagem 5
    		           	li $v0, 4 #Syscall para  imprimir uma String
    				la $a0, Mensagem5
    				syscall
    				
    				#subtração para saber o valor do troco do cliente
    				sub $t4,$t2,$t1 #armazena em t4 o valor pago - valor compra
    				
    				#imprime o troco do cliente
    				li $v0, 1 #Syscall para  imprimir um inteiro (valor troco)
				move $a0, $t4 
				syscall
    				
    				#chamada para encerrar o programa
    				li $v0, 10
        			syscall
			
    		
      			  case1:  #ocorre a soma  valorCompra(t1) = valorCompra +2;
    				addi $t1, $t1,2
    				
    				j exibeMensagem #pula novamente para a mensagem
    				
    				
    			 case2:  
    				addi $t1, $t1,2
    				
    				j exibeMensagem
    				
    			case3: 
    				addi $t1, $t1,4
    				
    				j exibeMensagem
    			case4: 
    				addi $t1, $t1,5
    				
    				j exibeMensagem
    			case5: 
    				addi $t1, $t1,2
    				
    				j exibeMensagem
    			case6: 
    				addi $t1, $t1,3
    				
    				j exibeMensagem
    				
    			default:
    			        #exibe a mensagem 6
    				li $v0, 4 #Syscall para  imprimir uma String
    				la $a0, Mensagem6
    				syscall
    				
    				j exibeMensagem #volta para exibir  a mensagem
 
 
    
     
      
       
        
         
          
           
            
             
              
               
                
                 
                  
                   
                    
                     
                      
                       
                         
   
    
				
    		
    	
    
    	
    	
 
	
	
