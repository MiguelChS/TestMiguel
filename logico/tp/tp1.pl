% ---------------- 1 Punto A: Quién mira qué ---------------------------
% Base : Quien mira que (Nombre,Serie)
mira(juan,himym).
mira(juan,futurama).
mira(juan,got).
mira(nico,starWars).
mira(nico,got).
mira(maiu,starWars).
mira(maiu,onePiece).
mira(maiu,got).
mira(gaston,hoc).

%Base : Son Polulares(Serie)
popular(hoc).
popular(got).
popular(himym).

%Base : Planea Ver (Nombre,Serie)
planeaVer(juan,hoc).
planeaVer(aye,got).
planeaVer(gaston,himym).

%Base : Cantidad de episodios por temporada (Serie,Episodio,Temporada)
cantEpisodio(got,12,3).
cantEpisodio(got,10,2).
cantEpisodio(himym,23,1).
cantEpisodio(drHouse,16,8).

%------------------ 2 Anexo: Lo que pasó, pasó ----------------------------

%paso(Serie, Temporada, Episodio, Lo que paso)
paso(futurama, 2, 3, muerte(seymourDiera)).
paso(starWars, 10, 9, muerte(emperor)).
paso(starWars, 1, 2, relacion(parentesco, anakin, rey)).
paso(starWars, 3, 2, relacion(parentesco, vader, luke)).
paso(himym, 1, 1, relacion(amorosa, ted, robin)).
paso(himym, 4, 3, relacion(amorosa, swarley, robin)).
paso(got, 4, 5, relacion(amistad, tyrion, dragon)).

%leDijo/4
leDijo(gaston, maiu, got, relacion(amistad, tyrion, dragon)).
leDijo(nico, maiu, starWars, relacion(parentesco, vader, luke)).
leDijo(nico, juan, got, muerte(tyrion)). 
leDijo(aye, juan, got, relacion(amistad, tyrion, john)).
leDijo(aye, maiu, got, relacion(amistad, tyrion, john)).
leDijo(aye, gaston, got, relacion(amistad, tyrion, dragon)).
leDijo(aye, juan, hoc, relacion(amistad, tyrion, dragon)).

% ------------------- 3 Punto B: Es spoiler ----------------------

esSpoiler(Serie,Evento):-
  paso(Serie,_,_,Evento).

% es de Tipo Puede hacerce ambas tanto individual como existencial 

% -------------------- 4 Punto C: Te pedí que no me lo dijeras ------------------------

leSpoileo(Persona1,Persona2,Serie):-
    planeaVer(Persona2,Serie),
    leDijo(Persona1,Persona2,Serie,Evento),
    esSpoiler(Serie,Evento).

leSpoileo(Persona1,Persona2,Serie):-
    mira(Persona2,Serie),
    leDijo(Persona1,Persona2,Serie,Evento),
    esSpoiler(Serie,Evento).

% es de Tipo Puede hacerce ambas tanto individual como existencial 

%---------------------- 5 Punto D: Responsable --------------------------------

televidenteResponsable(Persona1):-
  not(leSpoileo(Persona1,_,_)).

% investigen qsi es individual o existencial :P

%-------------------- 6 Punto E: Viene Zafando --------------------------------
vieneZafando(Persona1,Serie):-
  