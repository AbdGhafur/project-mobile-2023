import './models/category.dart';
import './models/places.dart';

const CATEGORIES_DUMMY_DATA = const [
  Category(
    id: 'P1',
    title: 'Pantai',
    description: '',
    image: 'http://pluspng.com/img-png/the-beach-png-black-and-white--952.png',
  ),
  Category(
    id: 'P3',
    title: 'Budaya',
    description: '',
    image: 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Drama-icon.png',
  ),
  Category(
    id: 'P4',
    title: 'Kuliner',
    description: '',
    image:
        'https://cdn3.iconfinder.com/data/icons/vacation-line-1/48/culinary_restaurant_food_vacatipn_traveling-512.png',
  ),
  Category(
    id: 'P5',
    title: 'Religi',
    description: '',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Religion_icon.svg/1138px-Religion_icon.svg.png',
  ),
];
const PLACES_DUMMY_DATA = const [
  Places(
      id: 'A1',
      name: 'Pantai Jumiang',
      description:
          'Pantai Jumiang memiliki keunikan serta berbeda dari pantai lainnya, karena selain berpasir putih, pantai ini terletak di dataran tinggi serta bertebing. Debur ombak yang menerobos di sela-sela karang, seakan menciptakan sensasi aquatic yang indah.',
      author: 'Nuge',
      category: 'P1',
      image:
          "https://portalwisata.co.id/wp-content/uploads/2019/07/pantai-jumiang.jpg",
      price: 50000),
  Places(
      id: 'A3',
      name: 'Kerapan Sapi',
      description:
          'Karapan sapi mengandung nilai budaya ,di antaranya adalah kerja keras, kerjasama, persaingan, ketertiban, dan sportivitas. Hal ini tercermin dalam proses merawat dan melatih sapi. Supaya menjadi sapi yang kuat dan tangkas perlu adanya kerja keras, ketekunan, dan kesabaran',
      author: 'ghafur',
      category: 'P3',
      image:
          "https://4.bp.blogspot.com/-7t7Zg1r9j24/XBE4gHHFv1I/AAAAAAAANdg/fmvmlJM_4_00tOPqPxDRVHyi2YArmPioQCLcBGAs/s1600/Asal%2BUsul%2BKerapan%2BSapi%2BMadura.jpg",
      price: 15000),
];
