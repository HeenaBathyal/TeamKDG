import '../models/roommate.dart';

class MatchService {
  static double calculateCompatibility(Map<String, dynamic> user, Roommate r) {
    double score = 50; // base score

    if (user['eating'] != null && r.description.contains(user['eating'])) score += 10;
    if (user['sleep'] != null && r.description.contains(user['sleep'])) score += 10;
    if (user['cleaning'] == 'Clean Freak' && r.description.contains('Clean Freak')) score += 10;
    if (user['personality'] != null && r.description.contains(user['personality'])) score += 10;

    if (score > 100) score = 100;
    return score;
  }

  static List<Roommate> getDummyMatches(Map<String, dynamic> user) {
    return [
      Roommate(
          name: 'Ananya',
          age: 24,
          city: 'Delhi',
          gender: 'Female',
          rent: 8000,
          compatibility: calculateCompatibility(user,
              Roommate(name: 'Ananya', age: 24, city: 'Delhi', gender: 'Female', rent: 8000, compatibility: 0, description: 'Veg | Night Owl | Clean Freak | Introvert')),
          description: 'Veg | Night Owl | Clean Freak | Introvert'),
      Roommate(
          name: 'Riya',
          age: 26,
          city: 'Mumbai',
          gender: 'Female',
          rent: 9500,
          compatibility: calculateCompatibility(user,
              Roommate(name: 'Riya', age: 26, city: 'Mumbai', gender: 'Female', rent: 9500, compatibility: 0, description: 'Non-Veg | Early Bird | Moderate | Extrovert')),
          description: 'Non-Veg | Early Bird | Moderate | Extrovert'),
      Roommate(
          name: 'Neha',
          age: 23,
          city: 'Bangalore',
          gender: 'Female',
          rent: 10000,
          compatibility: calculateCompatibility(user,
              Roommate(name: 'Neha', age: 23, city: 'Bangalore', gender: 'Female', rent: 10000, compatibility: 0, description: 'Veg | Night Owl | Clean Freak | Extrovert')),
          description: 'Veg | Night Owl | Clean Freak | Extrovert'),
    ];
  }
}
