% City information
city_info(karachi, urban, affordable, 4, hot, moderate, local_cuisine, urdu, ['Mazar-e-Quaid', 'Clifton Beach', 'Mohatta Palace']).
city_info(lahore, cultural, affordable, 4, hot, moderate, local_cuisine, punjabi, ['Badshahi Mosque', 'Lahore Fort', 'Shalimar Gardens']).
city_info(islamabad, nature, moderate, 3, mild, moderate, local_cuisine, urdu, ['Faisal Mosque', 'Daman-e-Koh', 'Rawal Lake']).
city_info(paris, cultural, expensive, 4, mild, high, gourmet, french, ['Eiffel Tower', 'Louvre Museum', 'Notre-Dame Cathedral']).
city_info(barcelona, cultural, moderate, 3, mild, moderate, local_cuisine, spanish, ['Sagrada Familia', 'Park Güell', 'La Rambla']).
city_info(doha, urban, expensive, 4, hot, high, gourmet, arabic, ['Museum of Islamic Art', 'Souq Waqif', 'Katara Cultural Village']).
city_info(beirut, cultural, moderate, 3, mild, moderate, local_cuisine, arabic, ['Beirut Souks', 'Pigeon Rocks', 'National Museum of Beirut']).
city_info(damascus, historical, affordable, 4, mild, moderate, local_cuisine, arabic, ['Umayyad Mosque', 'Azm Palace', 'Souq al-Hamidiyya']).
city_info(new_york, cultural, expensive, 3, moderate, high, international_cuisine, english, ['Statue of Liberty', 'Central Park', 'Times Square']).
city_info(cairo, historical, affordable, 5, hot, moderate, local_cuisine, arabic, ['Pyramids of Giza', 'Egyptian Museum', 'Khan el-Khalili']).
city_info(bangkok, beaches, moderate, 5, hot, low, street_food, thai, ['Grand Palace', 'Wat Arun', 'Chatuchak Market']).
city_info(sydney, beaches, expensive, 4, mild, high, international_cuisine, english, ['Sydney Opera House', 'Bondi Beach', 'Sydney Harbour Bridge']).
city_info(cape_town, nature, affordable, 5, mild, moderate, local_cuisine, english, ['Table Mountain', 'V&A Waterfront', 'Robben Island']).
city_info(vancouver, outdoor, expensive, 4, moderate, high, international_cuisine, english, ['Stanley Park', 'Granville Island', 'Capilano Suspension Bridge']).
city_info(rio_de_janeiro, beaches, moderate, 5, hot, moderate, street_food, portuguese, ['Christ the Redeemer', 'Copacabana Beach', 'Sugarloaf Mountain']).
city_info(dubai, luxury, expensive, 5, hot, high, gourmet, arabic, ['Burj Khalifa', 'Dubai Mall', 'Palm Jumeirah']).
city_info(amsterdam, cultural, moderate, 3, mild, high, international_cuisine, dutch, ['Rijksmuseum', 'Anne Frank House', 'Van Gogh Museum']).
city_info(hong_kong, urban, expensive, 4, hot, high, street_food, chinese, ['Victoria Peak', 'Tsim Sha Tsui Promenade', 'Disneyland Hong Kong']).
city_info(san_francisco, outdoor, expensive, 3, moderate, high, gourmet, english, ['Golden Gate Bridge', 'Alcatraz Island', 'Fisherman\'s Wharf']).
city_info(mexico_city, cultural, affordable, 4, mild, moderate, street_food, spanish, ['Zócalo', 'Frida Kahlo Museum', 'Chapultepec Park']).
city_info(seoul, cultural, expensive, 3, cold, high, street_food, korean, ['Gyeongbokgung Palace', 'Bukchon Hanok Village', 'N Seoul Tower']).
city_info(auckland, nature, expensive, 4, mild, high, local_cuisine, english, ['Sky Tower', 'Waiheke Island', 'Auckland War Memorial Museum']).
city_info(marrakech, historical, affordable, 5, hot, low, local_cuisine, arabic, ['Jemaa el-Fnaa', 'Bahia Palace', 'Majorelle Garden']).
city_info(istanbul, historical, moderate, 4, mild, moderate, street_food, turkish, ['Hagia Sophia', 'Topkapi Palace', 'Grand Bazaar']).
city_info(berlin, cultural, affordable, 3, cold, high, street_food, german, ['Brandenburg Gate', 'Berlin Wall', 'Museum Island']).
city_info(singapore, urban, expensive, 4, hot, high, street_food, english, ['Marina Bay Sands', 'Gardens by the Bay', 'Sentosa Island']).
city_info(bora_bora, nature, expensive, 5, hot, high, gourmet, french, ['Matira Beach', 'Mount Otemanu', 'Coral Gardens']).
city_info(new_delhi, cultural, affordable, 4, hot, moderate, street_food, hindi, ['Red Fort', 'India Gate', 'Qutub Minar']).
city_info(venice, historical, expensive, 3, hot, high, gourmet, italian, ['St. Mark\'s Basilica', 'Grand Canal', 'Rialto Bridge']).
city_info(athens, historical, moderate, 4, hot, moderate, local_cuisine, greek, ['Acropolis', 'Parthenon', 'Plaka']).
city_info(tokyo, urban, expensive, 4, mild, high, international_cuisine, japanese, ['Tokyo Tower', 'Meiji Shrine', 'Shibuya Crossing']).
city_info(prague, cultural, moderate, 3, cold, moderate, local_cuisine, czech, ['Prague Castle', 'Charles Bridge', 'Old Town Square']).
city_info(budapest, historical, affordable, 4, cold, moderate, local_cuisine, hungarian, ['Buda Castle', 'Chain Bridge', 'Parliament Building']).
city_info(sao_paulo, urban, affordable, 3, hot, moderate, local_cuisine, portuguese, ['Ibirapuera Park', 'Paulista Avenue', 'Municipal Market']).
city_info(kyoto, cultural, expensive, 4, mild, moderate, local_cuisine, japanese, ['Kinkaku-ji', 'Fushimi Inari Shrine', 'Arashiyama Bamboo Grove']).

% Declare user_preference/2 as a dynamic predicate
:- dynamic user_preference/2.

% User interface
get_user_preferences :-
    nl, write('Enter your Preferences!'), nl,
    get_preference(climate, 'What type of climate do you prefer? (hot, mild, cold, moderate) ', valid_climate),
    get_preference(budget, 'What is your budget range? (affordable, moderate, expensive) ', valid_budget),
    get_preference(activity, 'What type of activities do you enjoy - choose one? (cultural, historical, beaches, nature, outdoor, luxury, urban) ', valid_activity),
    get_preference(safety, 'What level of safety do you prefer? (high, moderate, low) ', valid_safety),
    get_preference(food, 'What type of food do you enjoy? (local_cuisine, international_cuisine, street_food, gourmet) ', valid_food),
    get_preference(language, 'What language do you prefer? (english, spanish, french, arabic, chinese, japanese, urdu, punjabi, hindi) ', valid_language).

get_preference(Preference, Prompt, Validation) :-
    write(Prompt), read_line(Value),
    (call(Validation, Value) -> assert(user_preference(Preference, Value));
    write('Invalid input, please try again.'), nl, get_preference(Preference, Prompt, Validation)).

% Validation of inputs
valid_climate(Weather) :-
    member(Weather, [hot, mild, cold, moderate]).

valid_budget(Budget) :-
    member(Budget, [affordable, moderate, expensive]).

valid_activity(Activity) :-
    member(Activity, [cultural, historical, beaches, nature, outdoor, luxury, urban]).

valid_safety(Safety) :-
    member(Safety, [high, moderate, low]).

valid_food(Food) :-
    member(Food, [local_cuisine, international_cuisine, street_food, gourmet]).

valid_language(Language) :-
    member(Language, [english, spanish, french, arabic, chinese, japanese, urdu, punjabi, hindi]).

% Read a line of input and remove trailing newline character
read_line(X) :-
    prompt(_, ''),
    read_line_to_string(user_input, String),
    string_chars(String, Chars),
    remove_trailing_newline(Chars, TrimmedChars),
    atom_chars(X, TrimmedChars).

% Remove trailing newline character from a list of characters
remove_trailing_newline([], []).
remove_trailing_newline(['\n'], []).
remove_trailing_newline([H|T], [H|Trimmed]) :-
    remove_trailing_newline(T, Trimmed).

% Recommendation logic
recommend_destination(City) :-
    user_preference(climate, Weather),
    user_preference(budget, Budget),
    user_preference(activity, Activity),
    user_preference(safety, Safety),
    user_preference(food, Food),
    user_preference(language, Language),
    city_info(City, Activity, Budget, _, Weather, Safety, Food, Language, _).

get_travel_recommendations :-
    retractall(user_preference(_, _)),
    get_user_preferences,
    findall(City, recommend_destination(City), Recommendations),
    (Recommendations \= [] -> display_recommendations(Recommendations); 
    write('No exact match found for your preferences. Finding closest matches...'), nl,
    find_closest_matches).

display_recommendations([]) :- !.
display_recommendations([H | T]) :-
    write('Recommended destination: '), write(H), nl,
    display_sightseeing_spots(H),
    display_recommendations(T).

display_sightseeing_spots(City) :-
    city_info(City, _, _, _, _, _, _, _, Spots),
    write('Best sightseeing spots in '), write(City), write(': '), write(Spots), nl.

% Finding closest matches
find_closest_matches :-
    findall(City, city_info(City, _, _, _, _, _, _, _, _), Cities),
    score_cities(Cities, ScoredCities),
    include(min_score(3), ScoredCities, FilteredCities),
    (FilteredCities \= [] -> (
        keysort(FilteredCities, SortedCities),
        reverse(SortedCities, DescendingCities),
        top_n(3, DescendingCities, TopCities),
        display_closest_recommendations(TopCities)
    ); write('No suitable matches found based on your preferences.'), nl).

min_score(MinScore, Score-_) :-
    Score >= MinScore.

score_cities([], []).
score_cities([City | Rest], [Score-City | ScoredRest]) :-
    city_info(City, Activity, Budget, _, Weather, Safety, Food, Language, _),
    findall(1, (
        (user_preference(climate, Weather));
        (user_preference(budget, Budget));
        (user_preference(activity, Activity));
        (user_preference(safety, Safety));
        (user_preference(food, Food));
        (user_preference(language, Language))
    ), Matches),
    length(Matches, Score),
    score_cities(Rest, ScoredRest).

top_n(0, _, []) :- !.
top_n(_, [], []) :- !.
top_n(N, [H | T], [H | NT]) :-
    N1 is N - 1,
    top_n(N1, T, NT).

display_closest_recommendations([]) :- !.
display_closest_recommendations([Score-City | T]) :-
    write('Recommended destination: '), write(City), write(' - matches: '), write(Score), nl,
    write_preferences_matched(City), nl,
    display_closest_recommendations(T).

write_preferences_matched(City) :-
    city_info(City, Activity, Budget, _, Weather, Safety, Food, Language, _),
    findall(P, (
        (user_preference(climate, Weather), P = 'climate');
        (user_preference(budget, Budget), P = 'budget');
        (user_preference(activity, Activity), P = 'activity');
        (user_preference(safety, Safety), P = 'safety');
        (user_preference(food, Food), P = 'food');
        (user_preference(language, Language), P = 'language')
    ), Preferences),
    write('You will find here: '), write(Preferences).

% Ask if user wants to find another destination or is done
ask_for_next_action :-
    nl,
    write('Do you want to look for another travel destination? (yes/no) '),
    read_line(Response),
    normalize_response(Response, Normalized),
    process_response(Normalized).

normalize_response(Response, Normalized) :-
    downcase_atom(Response, Normalized).

process_response(yes) :-
    get_travel_recommendations,
    ask_for_next_action.
process_response(no) :-
    nl, write('Thank you.'), nl.
process_response(_) :-
    write('Invalid response. Please enter yes or no.'), nl,
    ask_for_next_action.

% Main predicate to start the program
main :-
    get_travel_recommendations,
    ask_for_next_action.
