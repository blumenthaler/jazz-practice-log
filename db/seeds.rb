user_1 = User.create(username: "SmilesDavis", email: "iluvjazz@jazz.com", password: "nardis", instrument: "Trumpet")

user_2 = User.create(username: "TheRealMcCoy", email: "tyner@jazz.com", password: "bluebossa", instrument: "Piano")

user_3 = User.create(username: "PacoJastorius", email: "bass_god@bloatedego.com", password: "thechicken", instrument: "Bass")




standard_1 = JazzStandard.create(title: "Autumn Leaves", composer: "Joseph Kosma", recording: "Somethin' Else", performer: "Cannonball Adderley", tempo: 120, levels_of_knowledge: "melody, lyrics, chords", date_memorized: "March 20, 2015", notes: "Mellow tune, man", user_id: user_1.id)

standard_2 = JazzStandard.create(title: "I Love You", composer: "Cole Porter", recording: "Live at The Vanguard Vol. 1", performer: "Bill Evans", tempo: 150, levels_of_knowledge: "melody, lyrics, chords, bassline", date_memorized: "April 1, 2018", notes:"I love these chords", user_id: user_2.id)

standard_3 = JazzStandard.create(title: "Beautiful Love", composer: "Victor Young", recording: "Live Somewhere Else", performer: "Bill Evans", tempo: 130, levels_of_knowledge: "melody, lyrics, chords", date_memorized: "January 10, 2007", notes:"I should arrange this tune", user_id: user_2.id)

standard_4 = JazzStandard.create(title: "Blue Daniel", composer: "Frank Rosolino", recording: "Another Record", performer: "Cannonball Adderley", tempo: 130, levels_of_knowledge: "melody, chords, bassline", date_memorized: "February 10, 2019", notes:"Cannonball rippss through this one!!", user_id: user_1.id)

standard_5 = JazzStandard.create(title: "Anthropology", composer: "Charlie Parker", recording: "One of those Records Live", performer: "Charlie Parker", tempo: 140, levels_of_knowledge: "melody, chords, bassline", date_memorized: "March 20, 2015", notes:"Bird is king tho", user_id: user_3.id)

standard_6 = JazzStandard.create(title: "Confirmation", composer: "Charlie Parker", recording: "Some Record Live", performer: "Charlie Parker", tempo: 200, levels_of_knowledge: "melody, chords, bassline", date_memorized: "May 5, 2020", notes:"this melody took me forever to learn", user_id: user_3.id)

standard_7 = JazzStandard.create(title: "Autumn Leaves", composer: "Joseph Kosma", recording: "Somethin' Else", performer: "Cannonball Adderley", tempo: 120, levels_of_knowledge: "melody, chords", date_memorized: "July 4, 2020", notes:"I love jazz!!!!!", user_id: user_3.id)


