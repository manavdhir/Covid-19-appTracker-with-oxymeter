import 'package:covid_19_tracker/models/featuredSymptom.dart';
import 'package:covid_19_tracker/models/symptom.dart';

final symp = FeaturedSymptom(scrollableFeaturedSymptom: [
  Symptom(
      lottieUrl:
          'https://github.com/manavdhir/covid19_tracker/blob/master/3635773.jpg?raw=true',
      name: 'Fever',
      type: 'A fever is a temporary increase in your body temperature'),
  Symptom(
      lottieUrl:
          'https://github.com/manavdhir/covid19_tracker/blob/master/3340511.jpg?raw=true',
      name: 'Cold',
      type: 'The common coldis a disease of the upper respiratory tract'),
  Symptom(
      lottieUrl:
          'https://github.com/manavdhir/covid19_tracker/blob/master/3609669.jpg?raw=true',
      name: 'Cough',
      type: 'A cough is a voluntary act that clears the throat '),
]);
