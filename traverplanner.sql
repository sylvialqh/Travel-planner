/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.27 : Database - tripplanner
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tripplanner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tripplanner`;

/*Table structure for table `preference` */

DROP TABLE IF EXISTS `preference`;

-- CREATE TABLE `preference` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `group_size` int DEFAULT NULL,
--   `style` varchar(50) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- /*Data for the table `preference` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `age` int DEFAULT 18,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */
INSERT INTO tripplanner.user VALUES
(1, 'admin', 'admin', 'admin',
'123', 'img1', 40, 'admin@hotmail.com');

INSERT INTO tripplanner.user VALUES
(2, 'jack', 'jack', 'song',
'456', 'img1', 20, 'jacksong@hotmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*Table structure for table `things_todo` */

DROP TABLE IF EXISTS `things_todo`;

create table `things_todo` (
                               `id` int (11),
                               `name_` varchar (150),
                               `img_` varchar (1500),
                               `desc_` varchar (3000),
                               `address_` varchar (300),
                               `city_` varchar (60),
                               `type_` varchar (150),
                               `price_` varchar (30)
);
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('1','Sydney Opera House ','https://assets.atdw-online.com.au/images/082abec166a817adfae646daff53ad70.jpeg?rect=0%2C0%2C2048%2C1536&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjIzYzkyZDVmMTU2NTA0NWQ4MTBkMiIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','Whether you’re a local or a visitor, a first-timer or an aficionado, the Sydney Opera House has something for you.','Bennelong Point, Sydney NSW 2000','Sydney','Attraction','200');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('2','Sydney Zoo','https://assets.atdw-online.com.au/images/bad4c41c13080187fd69178289466861.jpeg?rect=226%2C0%2C3612%2C2709&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjVkZTQ3MDBjZTVjMGNkNjQ0MGYwMjhjMiIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','One of Sydney’s best animal attractions. The NEW Sydney Zoo in Western Sydney is home to over 4,000 native and exotic animals, 5 iconic precincts, an Aquarium and Australia’s largest Reptile and Nocturnal house.','700 Great Western Hwy, Minchinbury NSW 2770','Sydney','Attraction','50');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('3','SEA LIFE Sydney Aquarium','https://assets.atdw-online.com.au/images/be4ddfe20b7088a1b98c4cb418590e7b.jpeg?rect=165%2C0%2C2671%2C2003&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjIzZjkwYjA0MjM4NjI0NWQ0N2NkMiIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','Located in the heart of Darling Harbour, SEA LIFE Sydney Aquarium is an underwater journey of amazing discovery with nine extraordinary themed zones. Meander through the Jurassic Seas, Sydney Harbour and Dugong Island, then, immerse yourself in the underwater world of Shark Valley, the majestic ocean tunnel walk-through, next visit the penguins on Macquarie Island and end with the mesmerising Great Barrier Reef zone.','Aquarium Wharf Darling Harbour NSW 2000 Australia','Sydney','Attraction','125');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('4','Captain Cook Cruises','https://assets.atdw-online.com.au/images/505b359f5e7b175fcc6e01664511e825.jpeg?rect=418%2C0%2C6236%2C4677&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjIzZGJjYjA0MjM4NjI0NWQ0NTYyYiIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','For over five decades Captain Cook Cruises has proven to be a market leader and premier Sydney Harbour cruise line. Their fleet offers an exciting range of public cruises and private charters for two to 2,000 guests.','Majestic Water Taxis, 140 George St, Sydney NSW 2000','Sydney','Tour','20');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('5','BridgeClimb Sydney','https://assets.atdw-online.com.au/images/a63a066d400f217daa13212dd1cfd56b.jpeg?rect=139%2C0%2C2221%2C1666&w=745&h=559&&rot=360&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjIzZjEwMjY2MTQwNTk0NTY4MjZiMCIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','BridgeClimb Sydney is a quintessential Australian experience that takes you on a journey to the top of the nation’s most famous and celebrated structure – the Sydney Harbour Bridge.','Dawes Point, Sydney NSW 2000','Sydney','Tour','0');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('6','Lord Nelson Brewery','https://assets.atdw-online.com.au/images/eb9cb84ce1a896757be70072b5726d20.jpeg?rect=3%2C0%2C2048%2C1536&w=745&h=559&&q=eyJ0eXBlIjoibGlzdGluZyIsImxpc3RpbmdJZCI6IjU2YjI0NmIwYjA0MjM4NjI0NWQ0ZjU3ZCIsImRpc3RyaWJ1dG9ySWQiOiI1NmIxZWI5MzQ0ZmVjYTNkZjJlMzIwYzgiLCJhcGlrZXlJZCI6IjU2YjFlZTU5MGNmMjEzYWQyMGRjNTgxOSJ9','Today the Lord Nelson Brewery Hotel is Australia\'s oldest pub brewery, famous throughout the World for award-winning natural ales. Brewed with only malt, hops, yeast and water (no added sugars, preservatives or additives), ensuring 100 per cent natural beer.','19 Kent Street The Rocks NSW 2000 Australia','Sydney','Food And Drink','69');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('7','Melbourne Cricket Ground','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/e3/03/99/2019-preliminary-final.jpg?w=1200&h=-1&s=1','The Melbourne Cricket Ground (MCG) is Australia\'s largest, oldest and most popular sporting venue. The MCG has hosted plenty of international cricket, including the first-ever Test and the 1992 World Cup final, countless VFL/AFL Grand Finals, the 1956 Olympic Games and 2006 Commonwealth Games. It also hosted the final of ICC Cricket World Cup 2015. Other sporting spectacles include FIFA World Cup soccer qualifiers, rugby league home and away matches and State of Origin and international rugby union clashes. Apart from its sporting events, the MCG has also witnessed many blockbuster music concerts, and even Pope John Paul II held a mass there when he visited Melbourne in 1986. The MCG has a total capacity of 100,024 people, comprising 95,024 seats and 5000 standing room spaces. The stadium also houses the National Sports Museum, which includes some of the most priceless pieces of memorabilia in Australian sporting history.','Brunton Ave Yarra Park, Jolimont, Melbourne, Victoria 8002 Australia','Melbourne ','Attraction','350');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('8','Dandenong Ranges National Park','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/4b/b6/5c/dandenong-ranges.jpg?w=1200&h=-1&s=1','Dandenong Ranges National Park is a rainforest getaway on Melbourne\'s doorstep. This is a place of tranquil forest walks, quaint hilltop towns and charismatic animals. Conquer the famous 1000 Steps, discover Olinda Falls and enjoy stunning views over Melbourne and the Yarra Valley. Here you\'ll find steep volcanic hills covered in stands of the world\'s tallest flowering tree, the Mountain Ash. Living among the greenery are wallabies, lyrebirds, wombats and the Powerful Owl. Please ensure you leave your dogs at home to avoid disturbing the local wildlife. Take an energetic walk up the 1000 Steps from Ferntree Gully Picnic Area and learn about its poignant association with Australia\'s Second World War veterans and the Kokoda Track Campaign.','Mount Dandenong Tourist Rd Treemont, Melbourne, Victoria 3787 Australia','Melbourne ','Attraction','250');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('9','Eureka Skydeck','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/3b/3a/0d/88.jpg?w=1200&h=-1&s=1','Nothing you have ever experienced will prepare you for the awe inspiring view of Melbourne from the observation deck of the highest public vantage point in the Southern Hemisphere. Located at Level 88, Eureka Skydeck is Melbourne\'s new \'must-see\' attraction. Skydeck 88 is the only observation deck in the world that can thrill you with the Edge - a glass cube which projects 3 metres out from the building, with you in it!','7 Riverside Qy Southbank, Melbourne, Victoria 3006 Australia','Melbourne','Attraction','15');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('10','Melbourne Street Art Tour','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/71/52/1b.jpg','Melbourne is world-renowned for its cutting-edge street art. On this tour, walk Melbourne’s historic streets and laneways with a guide—and bona fide street artist—who shows you the most memorable murals and vibrant artworks, and offers a personal insight into the city’s street art scene. Finish with a tour of legendary Blender Studios and a chance to meet more of Melbourne’s artists.',NULL,'Melbourne','Tour','60');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('11','ArtVo Immersive Gallery Experience','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/8a/5b/ca.jpg','ArtVo is an art gallery with a difference—this immersive art space encourages people to touch, play, and interact with the art, and there are 11 themed zones to explore. Save time searching for cool photo opportunities in Melbourne, and benefit from a place that has lots of great backdrops, including angel wings, the canals of Venice, and the Taj Mahal.',NULL,'Melbourne','Tour','25');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('12','Queen Victoria Market Ultimate Foodie Tour','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/75/54/bb/queen-victoria-market.jpg?w=1200&h=-1&s=1','Get a real taste of Melbourne on this 2-hour walking tour of the famous Queen Victoria Market, which dates back to the 19th-century. With a small group of no more than 12 people per guide, you’ll enjoy a personalised experience with your local guide, as you browse the myriad stalls and mingle with the locals. Enjoy tastings of delicious seasonal delicacies (included). Tasting will depend on what is fresh on the day, but typically include Coffin Bay Oysters, grilled peppered kangaroo, pickled octopus, local goats’ milk cheese, fresh dolmades and Victorian olives. Your tour ends with a famous hot jam doughnut from the iconic American Doughnut Kitchen.',NULL,'Melbourne','Tour','75');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('13','South Bank Parklands','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/33/d1/da/south-bank-parklands.jpg?w=1200&h=-1&s=1','South Bank Parklands is Brisbane\'s premier lifestyle and cultural destination. Located on the southern banks of the Brisbane River, its 17 hectares of lush parklands, world-class eateries, stunning river views and hundreds of delightful events all year round make it the perfect place to relax and unwind.','South Bank, Brisbane, Queensland 4101 Australia','Brisbane','Attraction','99');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('14','Lone Pine Koala Sanctuary','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/74/e0/41/the-world-s-first-and.jpg?w=1200&h=-1&s=1','Discover over 70 species of Australian native animals in a beautiful, natural bush setting at the world\'s first and largest koala sanctuary. Meet a koala, hand-feed kangaroos, marvel at the playful platypus, and enjoy a full daily schedule of keeper talks and activities, including Sheep Dog Show and Wild Lorikeet Feeding. Amenities: free wiFi everywhere, parents\' rooms & cafes.','708 Jesmond Rd Fig Tree Pocket, Brisbane, Queensland 4069 Australia','Brisbane','Attraction','29');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('15','Roma Street Parkland','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/ec/cd/07/roma-street-parkland.jpg?w=1200&h=-1&s=1','Scenic park located right in the middle of the city features colorful subtropical gardens and Celebration Lawn, a green oasis for picnicking, flying kites or just relaxing.','1 Parkland Bvd, Brisbane, Queensland 4000 Australia','Brisbane','Attraction','129');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('16','Brisbane Kayak Tour','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/b8/40/e0.jpg','A riverside city, Brisbane was made for kayaking. See the city from the water on this kayak adventure, led by qualified instructors who can train even absolute beginners. See sights such as South Bank and Story Bridge without worrying about boat traffic or river rules and learn some kayak tricks along the way. Choose between daytime and night adventures—or share an Aussie meal with drinks on select weekend nights.',NULL,'Brisbane','Tour','45');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('17','Brisbane Dark Stories True Crime Tour','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/de/a2/01.jpg','Take a Walk on the Dark Side... Don’t be fooled by the bright lights and bustling city streets. This city has a past…a dark past… Enjoy a leisurely guided walking tour retracing the steps of the city\'s most infamous men. Transport yourself back in time to a seemingly lawless world of brawlers, fraudsters, and love triangles gone wrong. Uncover the dark secrets that lurk behind every historic building and alleyway. Wander the city streets with your tour guide and experience firsthand the rich history that once reigned supreme around every corner. Book your ticket now for a unique investigation into the criminal underbelly that once plagued this fine city. The glamour of current day Brisbane tried to hide its brutal and bloody past, but there is only so much the bright lights of Bris-Vegas can mask. Forget what you think you know about Brisbane and join us for a jaw-dropping trip down a memory lane you never knew existed. ...stories the city tried to forget...',NULL,'Brisbane','Tour','235');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('18','Hinterland Heritage Wine Tour','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/84/0f/cb.jpg','Many wine tours focus only on the great wine but on this tour you’ll also visit some of the most beautiful heritage buildings in the area, which happen to be wineries. On this tour you’ll be taken to four different estates, including a home that three previous Queensland premiers lived in. Learn about wine-making and local history while indulging in a tasty drop or two.',NULL,'Brisbane','Tour','179');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('19','Sydney Harbour Sunset Dinner Cruise','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/33/d2/47.jpg','Experience the casual elegance of this Sydney Harbour dinner cruise, which departs in the early evening so you don’t miss the sunset. Hop aboard the MV Sydney 2000, the most prestigious cruising restaurant on Sydney\'s waterways. Enjoy a relaxed atmosphere with first-class service, a delicious 3-course dinner, and outstanding views of the illuminated city skyline.',NULL,'Sydney','Food And Drink','39');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('20','Sydney Bike Tours','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/08/81/df/c1.jpg','Travel like a local around Sydney on this city cycling tour with four different itinerary options. Let your guide take care of the route and navigation while you focus on enjoying the scenery, passing landmarks such as Sydney Harbour Bridge, Sydney Opera House, and other highlights. Multiple tour lengths and focal points allow you to choose a bike tour that suits your schedule and budget.',NULL,'Sydney','Tour','10');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('21','Sydney Harbour Jet Boat Thrill Ride: 30 Minutes','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/34/b0/32.jpg','See Sydney\'s sights from the seat of a super-speed jet boat on this tour that\'s perfect for thrill-seekers and those who want to do something a little different on their Sydney vacation. Customize your own schedule with convenient tours that leave throughout the day. Hold your breath through daredevil maneuvers and then pull out your camera for photo ops of Sydney Harbour Bridge and the Sydney Opera House.',NULL,'Sydney','Water Sports','0');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('22','Highlights of Melbourne Cruise','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/89/3f/62.jpg','Get unique views of Melbourne from the Yarra River on this cruise. Take in vistas from both banks as you travel the river in both directions. Hear in-depth commentary while you ride, getting a full picture of Melbourne\'s history and modern existence. Choose between outdoor or indoor seating depending on the day’s weather, and enjoy a pick-me-up with provided tea or coffee.',NULL,'Melbourne','Tour','15');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('23','Yarra Valley Wine and Winery Tour from Melbourne','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/8e/2a/4b.jpg','Visit Yarra Valley wineries on a tour from Melbourne that includes tastings and a vineyard lunch. You’ll tour four beloved Yarra Valley wineries—Steels Gate Winery, Balgownie Estate, Yering Farm, and Greenstone Vineyards—while learning about the flavors and terroir of Yarra Valley wines. This wine tour is a great introduction to the picturesque Yarra Valley wine region, with transfers available from selected locations in Melbourne.',NULL,'Melbourne','Tour','120');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('24','Peninsula Hot Springs and Beach Boxes Day Trip','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/af/80/42.jpg','Get out of the city for a day and enjoy relaxing time in nature on this economical group tour to the Mornington Peninsula. After leaving Melbourne, your first stop will be the natural Peninsula Hot Springs, where you can soak away your stresses or add an optional spa treatment. Continue to Murrays Lookout to enjoy panoramic views of the mountainous landscape. End the day at the cute and totally Instagram-worthy bathing boxes on the beach to enjoy panoramic views of the mountainous landscape. End the day at the cute and totally Instagram-worthy bathing boxes on the beach.',NULL,'Melbourne','Tour','29');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('25','Cruise To Lunch Package','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/7b/23/6f.jpg','Enjoy a relaxing river cruise and delicious lunch on this half-day excursion in Brisbane. Sip tea, admire views of local landmarks, and learn about the region from an informative guide aboard the MV Neptune. Then, head to Breakfast Creek Hotel for a variety of mouth-watering meal choices, including lunch rump and Panko calamari, beer-battered flathead and quinoa croquette.',NULL,'Brisbane','Cruise','5');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('26','North Stradbroke Island Day Trip from Brisbane','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/3c/b7/49.jpg','Get a comprehensive experience at Stradbroke Island on this full-day trip from Brisbane. With all details taken care of and a curated list of island highlights, you\'ll surely see the best of the best without doing legwork and research. A small group of 21 people ensures personalized attention from your guide, as you search for native wildlife, take a short hike, visit historic towns, and swim in lakes and oceans.',NULL,'Brisbane','Tour','110');
insert into `things_todo` (`id`, `name_`, `img_`, `desc_`, `address_`, `city_`, `type_`, `price_`) values('27','Brisbane Kayak Tour','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/b8/40/e0.jpg','A riverside city, Brisbane was made for kayaking. See the city from the water on this kayak adventure, led by qualified instructors who can train even absolute beginners. See sights such as South Bank and Story Bridge without worrying about boat traffic or river rules and learn some kayak tricks along the way. Choose between daytime and night adventures—or share an Aussie meal with drinks on select weekend nights.',NULL,'Brisbane','Water Sports','49');

/* should update this table after user place an order*/
DROP TABLE IF EXISTS `orders`;
-- CREATE TABLE `orders` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
--   `from` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
--   `to` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
--   `flight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
--   `duration` int NOT NULL DEFAULT '1',
--   `price` int DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* current plan table */
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL,
  `des` varchar(50) NOT NULL,
  `plan` longtext NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`)
--   KEY `uid_idx` (`uid`),
--   CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







