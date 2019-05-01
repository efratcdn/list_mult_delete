* Title       : Delete multiple items from a list  
* Version     : 1.0
* Requires    : Specman {15.20...}
* Modified    : April 2019
* Description : 

[ More e code examples in https://github.com/efratcdn/spmn-e-utils ]


This utility deletes multiple items from a list in one action.


Syntax:

     <list>.mult_delete(exp)
   
  Will delete all items that match the expression
     

Usage examples:  
         
         my_list.mult_delete(it < 7);

         other_list.mult_delete(it.address > max_address);
  
  
Running the example:

  specman -c 'load delete_items_usage_example.e;test'

 
