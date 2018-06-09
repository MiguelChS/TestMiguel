%cañeria
precio(caño(Longitud,_),Precio):-
  Precio is Longitud * 3.

precio(codo(_),5).

precio(canilla(triangular,_,_),20).

precio(canilla(Tipo,_,Ancho),12):-
  Tipo \= triangular,
  Ancho =<  5.

precio(canilla(Tipo,_,Ancho),15):-
    Tipo \= triangular,
    Ancho >  5.

precio([],0).

precio([Pieza | Resto],Precio):-
  precio(Resto,PrecioResto),
  precio(Pieza,PrecioPieza),
  Precio is PrecioPieza + PrecioResto.

%puedo Enchufar

puedoEnchufar(P1,P2):-
  color(P1,C1),
  color(P2,C2),
  coloresEnchafables(C1,C2).

coloresEnchafables(C,C).
coloresEnchafables(azul,rojo).
coloresEnchafables(rojo,negro).

color(caño(_,Color),Color).
color(codo(Color),Color).
color(canilla(_,Color,_),Color).

/* Test
  puedoEnchufar(codo(azul),codo(rojo)).

  */
