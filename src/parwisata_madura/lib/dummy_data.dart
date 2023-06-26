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
      author: 'ghafur',
      category: 'P1',
      image:
          "https://portalwisata.co.id/wp-content/uploads/2019/07/pantai-jumiang.jpg",
      price: 50000),
  Places(
      id: 'A7',
      name: 'Pantai Camplong',
      description:
          'Pantai Camplong terletak di Desa Dharma Camplong, Kabupaten Sampang, Madura, Jawa Timur. Pantai yang terletak 9 kilometer dari pusat Kota Sampang ini landai dan memiliki permukaan berwarna cokelat.',
      author: 'ghafur',
      category: 'P1',
      image:
          "https://merahputih.com/media/35/69/e4/3569e4b689441f0d55a17f543b4c5fda.jpg",
      price: 15000),
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
  Places(
      id: 'A4',
      name: 'Topak Ladeh, kuliner khas lebaran',
      description:
          'Jika sudah terbiasa dengan opor ayam saat lebaran, tidak ada salahnya mencoba alternatif lain, seperti kuliner khas Madura, Topak Ladeh. ‘Penampakannya’ memang mirip, namun Topak Ladeh dibumbui dengan pedas dan kuahnya berwarna merah pekat. Isian di dalamnya juga bukan ayam, melainkan daging sapi dan lontong. Sensasi rasanya cukup kuat, tapi tetap lezat. Kuliner ini bisa kamu dapatkan hampir di setiap rumah warga Madura saat lebaran. Kuliner ini juga paling asyik dimakan dengan kerupuk. Hm, yummy!, persaingan, ketertiban, dan sportivitas. Hal ini tercermin dalam proses merawat dan melatih sapi. Supaya menjadi sapi yang kuat dan tangkas perlu adanya kerja keras, ketekunan, dan kesabaran',
      author: 'ghafur',
      category: 'P4',
      image:
          "https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2019/01/050501013636/1-TopakLadeh-By-maulina_saleh.jpg",
      price: 10000),
  Places(
      id: 'A5',
      name: 'Kaldu Kokot yang bikin melotot',
      description:
          'Bukan melotot karena marah, tapi karena kenikmatan yang tiada tara. Bayangkan, kamu akan menikmati menu khas Madura dengan kacang hijau yang dimasak dengan kaldu daging dan sumsum atau kikil sapi beserta tulangnya. Dari aromanya, kamu bisa menikmati betapa gurihnya masakan ini. Belum tampilan tulang sapi beserta sumsumnya yang memikat hati. Dengan kuah kaldu berlemak, kental dan berasa nikmat, ditambah daging dengan tekstur lembut yang sedap, kamu tidak akan bisa melupakan masakan ini. Ingin mencobanya, kamu bisa menuju ke Depot Kaldu Al Ghazali di Jalan Diponegoro, Sampang, yang seporsinya dihargai mulai dari 40,000 IDR.',
      author: 'ghafur',
      category: 'P4',
      image:
          "https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2019/01/050501014040/2-KalduKokot-By-radenajengfetyfatimah.jpg",
      price: 20000),
  Places(
      id: 'A6',
      name: 'Syikhona Kholil',
      description:
          'Syaikhona Kholil atau yang kerap kali dipanggil Mbah Kholil adalah seorang ulama mashyur asal Bangkalan, yang memberikan jasa besar dalam perlawanan melawan kolonialisme dan konstruksi Islam Nusantara. Tak heran, hingga kini usulan tentang pemberian gelar pahlawan nasional kepada Mbah Kolil masih kerap disuarakan.Selain itu, ulama yang masih memiliki darah keturunan Sunan Gunung Jati ini juga terkenal memiliki kesaktian dan karya-karya tulisannya yang luar biasa. Berikut biografi singkat Syaikhona Kholil al-Bangkalani, dilansir dari berbagai sumber',
      author: 'ghafur',
      category: 'P5',
      image:
          "https://cdn.idntimes.com/content-images/community/2022/04/fromandroid-a36a54bbb616193b6b83e4f04af2159a.jpg",
      price: 0),
];
