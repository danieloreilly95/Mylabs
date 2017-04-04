#include <stdio.h> 
#include <unistd.h> 
 
 int main() 
 { 
     pid_t pid;
      
     
     int tmp = 10; 
     
     printf ( "The main program process ID is %d\n\n", getpid() ); 
     printf ( "Calling fork now\n\n" ); 
     
     pid = fork();
     printf ( "fork has been called, pid returned is %d\n", pid ); 
    
     if (pid == 0) 
    { 
    

            printf ( "I am the child, getpid is %d\n", getpid() );
            printf ( "The return value from fork is %d\n", pid );
            printf ( "The value of variable i is %d\n\n", tmp); 
        
    } 
    
     else if ( pid > 0 ) 
    { 

          printf ( "I am the parent, getid is %d\n", getpid() );
          printf ( "The return value from fork is %d\n", pid );
          printf ( "The value of variable i is %d\n\n", tmp);        
        
    } 
    else
    {
        printf ( "Fork failed, no child\n" ); 
    }
        return 0; 
}

