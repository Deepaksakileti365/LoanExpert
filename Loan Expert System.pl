:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
	
		
		interface2.
		
    gettingloan(Applicant,greaterthan_fiveteen) :- verify(Applicant," has no previous loans (y/n) ?").
 
    gettingloan(Applicant,employement_experience_greaterthan_three) :- verify(Applicant," has been in job for atleast 3 yrs (y/n) ?").
  
     gettingloan(Applicant,downpayment_greaterthan_totalpercentage) :- verify(Applicant," does down payment is 15 percent of total property (y/n) ?").

     gettingloan(Applicant,has_surity) :- verify(Applicant," Do you have surity  (y/n) ?").
    
     gettingloan(Applicant,college) :- verify(Applicant," Do you want to apply for colleges (y/n) ?").
    
     gettingloan(Applicant,house_site) :- verify(Applicant," Do you want to apply for houses (y/n) ?").
	
     gettingloan(Applicant,has_government_assured_medical_certificate) :- verify(Applicant," Do you want for medical purpose (y/n) ?").
 
     gettingloan(Applicant,gold_pure_or_not) :- verify(Applicant," Do you want to apply on Gold (y/n) ?").
   
     gettingloan(Applicant,loan_safe_or_not) :- verify(Applicant," Do you have any other Loan (y/n) ?").
  

        
    hypothesis(Applicant,educationloan) :-
         gettingloan(Applicant,greaterthan_fiveteen),
         gettingloan(Applicant,employement_experience_greaterthan_three),
         gettingloan(Applicant,downpayment_greaterthan_totalpercentage),
         gettingloan(Applicant,college),
        gettingloan(Applicant,has_surity).
    
    hypothesis(Applicant,homeloan) :-
         gettingloan(Applicant,greaterthan_fiveteen),
         gettingloan(Applicant,employement_experience_greaterthan_three),
         gettingloan(Applicant,downpayment_greaterthan_totalpercentage),
         gettingloan(Applicant,has_surity),
		 gettingloan(Applicant,house_site).
        
    hypothesis(Applicant,medicalloan) :-
         gettingloan(Applicant,greaterthan_fiveteen),
         gettingloan(Applicant,employement_experience_greaterthan_three),
         gettingloan(Applicant,downpayment_greaterthan_totalpercentage),
         gettingloan(Applicant,has_surity),
         gettingloan(Applicant,has_government_assured_medical_certificate).
            
        
    hypothesis(Applicant,goldloan) :-
         gettingloan(Applicant,greaterthan_fiveteen),
         gettingloan(Applicant,employement_experience_greaterthan_three),
         gettingloan(Applicant,downpayment_greaterthan_totalpercentage),
         gettingloan(Applicant,has_surity),
         gettingloan(Applicant,gold_pure_or_not).
        
    hypothesis(Applicant,otherloan) :-
         gettingloan(Applicant,greaterthan_fiveteen),
         gettingloan(Applicant,employement_experience_greaterthan_three),
		 gettingloan(Applicant,downpayment_greaterthan_totalpercentage),
		 gettingloan(Applicant,has_surity),
		 gettingloan(Applicant,loan_safe_or_not).
        
	hypothesis(_,"not Getting Loan,I'm Sorry,Try to keep all the accounts clear").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.
		
ask(Applicant,Question) :-
	write(Applicant),write(', do you'),write(Question),
	interface(', do you',Applicant,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt(Applicant):- 

		hypothesis(Applicant,Disease),
		interface3(Applicant,', you have high probably to get ',Disease,'.'),
        write(Applicant),write(', you have high probably to get '),write(Disease),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl.
		

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LOAN EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LOAN EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hi. How are you? First of all tell me your name please'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Hi. How are you? First of all tell me your name please : "),write(N),nl,pt(N)
	).
	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LOAN EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	
help :- write("To start the expert system please type 'start.' and press Enter key").