#!/bin/bash 



printf '\n\nThis is a list:\n' 
echo ' 

(
	Oranges  (Qty +5.0) Bananas  (Qty +1.0) Eggs     (Qty +10.0) Flour    (Qty +2.5 Unit kg Remarks "type 500") Oranges  (Qty -2.0   Info "actually three will do" )

	Omni	(Qty -45.0 Who "Kowlaski Sp. z o.o" Anum +123.988732) Atos	(Qty -4.0) Pluton	(Znum 0.0 Qty -9.0 When "2009-12-31") Helios	(Qty -1.0)
)

' | ./pretty_print_data list 
printf '\n\n' 




printf '\n\nThis is a tree:\n'
echo '
(

Section_1   (Pages "2-12"  Author "Kowalski")  ( Chapter_1_1  (Pages "2-8") () Chapter_1_2  (Pages "9-12") ( )) Section_2   (Pages "13-20"   Inof "Many authors-- see below"  Page_Count +6.0) ( Chapter_2_1   (Pages "13-18" Author "Nowak" Title "Perl5 solution") () Chapter_2_2   (Pages "19-20"  Author "Alfa"   Title "Discussion on Perl5") ())

A (Info "this is node A") ( B (Info "This is node B, parent is A") () C (Info "This is node C, has 3 children") ( D (X +4.5 Y -5.0) () E (X +4.9 Y -9.0) () F (X +2.1 Y -12.0) ()) G (Info "This is child G of node A") ()) B (Info "This is node B") () A (Info "this is another with name A") ( X () () Y () ())	

 	)

' | ./pretty_print_data tree
printf '\n\n' 



