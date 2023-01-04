% Expert system for booking a flight

% rules for the expert system
flight(london, paris, 'British Airways', 100).
flight(london, new_york, 'British Airs', 200).
flight(paris, london, 'Air France', 100).
flight(paris, new_york, 'Air Fra', 150).
flight(new_york, london, 'United Airlines', 250).
flight(new_york, paris, 'United Air', 200).

% to check if a flight is available
available(From, To, Airline, Price) :-
    flight(From, To, Airline, Price).

% Predicate to book a flight
book(From, To, Airline, Price) :-
    available(From, To, Airline, Price),
    write('Booking flight from '),
    write(From),
    write(' to '),
    write(To),
    write(' with '),
    write(Airline),
    write(' for $'),
    write(Price),
    nl.

% to check if a flight is not available
not_available(From, To) :-
    \+ available(From, To, _, _),
    write('Sorry, no flights are available from '),
    write(From),
    write(' to '),
    write(To),
    nl.

% Run the expert system
start :-
    write('Enter the departure city: '),
    read(From),
    write('Enter the destination city: '),
    read(To),
    (available(From, To, Airline, Price) -> book(From, To, Airline,
    Price); not_available(From, To)).


