*** Need help translating this to perl6. I will pay for working hours. Please contact leszek at dubiel dot pl first.  ***

# lists-and-trees

This program is used to store structural data based on numbers, names (identifiers) and freeform text. It is
used in business computations so numbers format is restricted. Structure is expressed with parenthesis `(`,
`)`. 


## Numbers

Zero must be expressed as `0.0` (zero, dot, zero). Nonzero __numbers__ must always start with sign `-` or `+`,
then set of digits, dot `.`, another set of digits. 

These are valid __numbers__: `+1.0`, `-0.5123`, `+12312312.0`. 

Extra zeros at the start or end of __number__ are not allowed. These are invalid __numbers__: `+1.000` (extra
zeros at the end), `-010.5` (extra zero at the beginning), `234.4` (missing sign) `123` (no sign, no
decimals), `.123`, `+.23`, `+0.0` (signed zero). 

Perl uses 8 bytes to store floating point number, so there are 15 significant digits. Thus the smallest and
the biggest possible positive numbers are `+0.00000000000001` and `+99999999999999.9`. 


## Names 

Identifier, also called __name__, is unquoted text consisting of alphanumerics and underscore. First character
must be a letter. Last character must not be an underscore. Underscores are not allowed to be on consecutive
positions. __Name__ matches regular expression `^[[:alpha:]](_?[[:alnum:]])*$`. 

These are valid __names__: `Alfa_123`, `betaX123z`. 

These are invalid __names__: `_alfa` (underscore first), `alfa__beta` (two underscores in a row), `alfa-a`
(non alphanumeric char), `1alfa` (digit not allowed as first char). 


## Texts 

__Texts__ are sequences of unicode charactes enclosed in double quotes `"`. Only printable chars are allowed.
Only four backslash escape sequences are allowed: `\\` (backslash itself), `\"` (for double quote in
__text__), `\t` (tab), `\n` (new line). 

Valid __texts__: `"Print \"Hello World\"!"`, `"Hate using backslashes \\ \\ \\ ..."`. 

Invalid __texts__: `"Alfa \' Beta"` (wrong escape sequence), texts that contain control chars, `"alfa"beta"`
(unquted `"`). 


## Parameters

__Parameters__ are associative arrays, sets of __name__-__values__, can be nested. __Paramters__ definition
consists of left paren `(`, list of __name__-__value__ pairs, right parenthesis `)`. __Name__ is as described
above, and value is __number__, __name__, __text__ or another list of parameters. 

Empty list of __parameters__: `()`. 

Simple set of name-values:   `( First_Name John   Address "Wall Street 123, USA"  Balance -123.99  )`. 

Nested __parameters__:   `(  Login alfa  Valid_Until (Year "2019" Month "02" Day "20")  Permissions  (Read Yes
Write No   Touch ( Always No   Remarks "only when file nonexistent")  ) )`. 

More complicated, not pretty printed: 

```
	(
		Order_Number "PN/123/90"
		Order_Date (
			Year "2009"
			Month "12"
			Day "24"
		)
		Client "Metron Tech"
		Client_Data (                # comment on this line 
			Name "Metron_Tech"
			Address (
				Country "Poland"
				City "Krakow"
				Street "Podhalanska 242s"
				Post (
					Code "34-700"
					Name "Poczta Rabka"
				)
			)
			TaxId "7223-1123-132"          # pleas check that info 
			Remarks "Other name could be \"Metron Technology\"..."
		)
	)
```

## Lists 

__List__ is an ordered set of __names__ with __parameters__ assigned to these __names__. Lists is made of left paren `(`,
sequence of pairs, right paren `)`. Every pair is __name__ and __parameters__. 

Example of list: 

```
(
	Oranges  (Qty +5.0) 
	Bananas  (Qty +1.0) 
	Eggs     (Qty +10.0)
	Flour    (Qty +2.5 Unit kg Remarks "type 500") 
	Oranges  (Qty -2.0   Info "actually three will do" )
	Omni	(Qty -45.0 Who "Kowlaski Sp. z o.o" Anum +123.988732)
	Atos	(Qty -4.0)
	Pluton	(Znum 0.0 Qty -9.0 When "2009-12-31")
	Helios	(Qty -1.0)
)
```
   
## Trees

Finally __trees__ are similar to lists, but have one more element -- subtree, or child nodes that come as a
third element of every node. __Tree__ definition starts with `(`, then goes sequence of tripples __name__ plus
__parameters__ plus subtree, finally ends with `)`. Subtree is identical to __tree__: left paren, sequence of
tripples, right paren. Here is an example: 

```
(
	Section_1   (Pages "2-12"  Author "Kowalski")  (
		Chapter_1_1  (Pages "2-8") (
		)
		Chapter_1_2  (Pages "9-12") ( 
		)
	)
	Section_2   (Pages "13-20"   Inof "Many authors-- see below"  Page_Count +6.0) (
		Chapter_2_1   (Pages "13-18" Author "Nowak" Title "Perl5 solution") (
		)
		Chapter_2_2   (Pages "19-20"  Author "Alfa"   Title "Discussion on Perl5") (
		)
	)
)
```

Another tree, empty subtrees collapsed to `()`, more compact representation:

```
	(
 		A (Info "this is node A") (
 			B (Info "This is node B, parent is A") ()
 			C (Info "This is node C, has 3 children") (
 				D (X +4.5 Y -5.0) ()
 				E (X +4.9 Y -9.0) ()
 				F (X +2.1 Y -12.0) ()
 			)
 			G (Info "This is child G of node A") ()
 		)
 		B (Info "This is node B") ()
 		A (Info "this is another with name A") (
 			X () ()
 			Y () ()
 		)	
 	)
```



