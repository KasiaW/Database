--data source: http://www.summitpost.org, http://www.peakware.com

INSERT INTO state(state_name)
VALUES ('Albania'),('Andorra'),('Austria'),('Belarus'),('Belgium'),('Bosnia and Herzegovina'),('Bulgaria'),('Croatia'), ('Cyprus'),('Czech Republic'),('Denmark'), ('Estonia'), ('Finland'),
 ('France'), ('Germany'), ('Greece'), ('Hungary'), ('Iceland'), ('Ireland'),('Italy'), ('Latvia'), ('Liechtenstein'), ('Lithuania'),
 ('Luxembourg'), ('Macedonia'), ('Malta'), ('Moldavia'), ('Monaco'), ('Montenegro'), ('Netherlands'),
 ('Norway'), ('Poland') , ('Portugal'), ('Romania'),('Russia'), ('San Marino'), ('Serbia'), ('Slovakia'), ('Slovenia'), ('Spain'),
 ('Sweden'), ('Switzerland'), ('Turkey'), ('Turkey'), ('Ukraine'), ('United Kingdom'), ('Vatican City');

INSERT INTO point(point_name, elevation, difficulty, description, routes, point_access)
VALUES( 'Coma Pedrosa', 2946, 'Walk up', 
'This mountain is the highest top of Andorra. Coma Pedrosa is a large mountain, that rises more than 1.500 meters above the village of Arinsal, situated at the bottom of a narrow valley. In winter and spring, snow and ice cover the summit and surroundings, and then it’s the best opportunity to use the skies, ice-axe and crampons or even the snowshoes.',
'No permits or fees are required to climb Coma Pedrosa. It’s important to advise that in ski season can be complicated to find place to park the car at the end of the road that gets to the Arinsal ski resort, where starts the normal route to climb Coma Pedrosa. So you’ll need to get up early.
To climb this mountain from the French or Spanish side you’ll have to cross the border, located in high mountain areas. This isn’t a problem at all. Only in the border of the main roads you will find customs. ',
'by car, by coach, by train'),
('Mont Blanc', 4808, 'Basic Snow/Ice Climb',
'Mont Blanc is a massif composed of many peaks and spires, each with their own routes. The massif straddles the French-Italian border. Sources vary as to what is the precise border between Italy and France. Fact sheets consistently list Monte Bianco di Courmayeur, a summit not far from Mont Blanc, as  highest point of Italy and French and Swiss maps also show this to be the border. However, most insist that the border crosses Mont Blanc itself. This is informational only. See a more complete explanation in the History section below. Unless some fool decides to build something there, the politcal line is merely a human construction which should not detract from the beauty of the place and its spectacular views. The summit belongs to climbers who are willing to make the effort to visit this windswept place! ',
 'There are so many routes that embrace every degree of difficulty!Noraml, Northern, Southern, Eastern, Western',
 'Mont Blanc is reached either from Chamonix in the Savoy valley in France or from Courmayeur in the Val da Aosta in Italy. The valleys on the Italian side form a T, with the NW-SE trending Val da Aosta forming its vertical leg. At Entreves at the NW end of Val da Aosta, Val Veny splits off to the SW and Val Ferret splits off to the NE. Both public transportation and private car will easily reach these destinations. Chamonix (N506) and Courmayeur (E21B) lie along major highways and major rail lines. If coming from Switzerland and points east, Chamonix is reached by way of Martigny, Switzerland. One can continue through Chamonix and the Mont Blanc tunnel to reach Val da Aosta or one can continue south from Martigny, over St. Bernard Pass to Aosta and then NW to Courmayeur.
Traveling between the French and Italian sides of the mountain has been made faster and simpler by the 11.6 km long Mont Blanc tunnel, which is a major route across the Alps.');
INSERT INTO point (point_name, elevation)
VALUES ('Rysy', 2499),
('Elbrus', 5633),('Narodnaja', 1895),
('Mahya Dagi', 1018), ('Ararat', 5137),
('Maja e Korabit', 2764), ('Grossglockner', 3798),
('Signal de Botrange', 694), ('Dzerzhinsky', 346),
('Musala', 2925)

INSERT INTO proper_point(p_state_id, p_point_id)
VALUES (2,1), (3,2), (4,5),(5,3),(6,6);

INSERT INTO alternative_point (a_state_id, a_point_id)
VALUES (3,4), (6,7);

INSERT INTO member (login, member_password, mail, birthday)
VALUES ('kiki','dh2193jsj','kiwppl', '1988-07-04'),
 ('ueni','dhrra2193jsj','bencom', '1980-09-14'),
 ('lucy','ddaa193jsj','lucglcom', NULL); 

INSERT INTO private_messagge (msg_title,msg_content, addressee, sender)
VALUES ('hey', 'when do you want to come?','kiki','ueni'),
 ('hi', 'how long did you go there?', 'ueni','lucy');

INSERT INTO expedition(exped_start, exped_end, exped_result, exped_login, exped_aim)
VALUES ('2012-07-12','2012-07-15', true, 'kiki', 1),
 ('2012-08-12','2012-08-15', true, 'kiki', 2),
 ('2012-07-11','2012-07-11', false, 'kiki', 1),
 ('2012-09-12','2012-09-16', true, 'ueni', 6),
 ('2012-09-18','2012-09-20', true, 'ueni', 7),
 ('2012-10-01','2012-10-01', true, 'lucy', 3);

INSERT INTO post (category, post_content)
VALUES ('tip', 'Brenva Spur - the easiest and safer route from the Brenva side - only 1 critical point : the last ice wall, changing during the season
- one negative point : coming out from the Spur you loose the willing to go to the summit ... too far and of "less level" so, normally climbers turn to the right and come back to Aiguille du Midi (crossing the slops of Maudit and Tacul)'),
('report', 'The road eventually changed into a normal trail, and after 1.5 hours I reached the edge of treeline in a huge meadow. I had been feeling really slow and tired, and thought it was probably due to a lack of sleep on the train the previous night, but I felt better when I pulled out my guide and realized I had still shaved an hour off the book time for this location. At the edge of this meadow was the Refugi de Coma Pedrosa, a little lodge you could stay at to break up the long climb. It was swarming with people, and I decided to keep my distance from it.
Past the lodge there were fewer people, probably because everyone had started much earlier than me and were already done for the day. I crossed the meadow and started climbing higher until I reached huge patch of snow on the edge of a little pond – Estany Negre. The Andorran snow tasted about the same as any other snow, and I looked forward to glissading back down on my descent.
At the top of the snow the trail veered onto a steep rocky ridge that required some scrambling once in a while – it was pretty fun. To the right the mountain dropped sharply away all the way to Arinsal, and to the left it dropped into a big bowl with an icy pond in the middle. ');

INSERT INTO member_experience(exper_exped, exper_post)
VALUES (2,1),
 (1,2);


INSERT INTO member_comment (comment_content, comment_author)
VALUES (1,'ueni');


INSERT INTO plan(plan_login, plan_point, readiness)
VALUES ('kiki',3,'prepered'),
('kiki',5, 'companions_need'),
('ueni',1, 'prepered'),
('lucy',6,NULL);


INSERT INTO plan (plan_login, plan_point, readiness, plan_desc)
VALUES ('lucy',2,'companions_need', 'I and my two friends want to climb Mont Blanc in July. If you want to jont to our team, feel free');



