import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _countryCodes.length,
      itemBuilder: (BuildContext context, int index) {
        final countryCode = _countryCodes[index];

        return CountryItem(countryCode: countryCode);
      },
    );
  }
}

class CountryItem extends StatelessWidget {
  const CountryItem({
    required this.countryCode,
  });

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CountryDetails(countrycode: countryCode);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff2941b8ea),
        ),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: CountryFlag.fromCountryCode(countryCode, width: 40),
                ),
                Text(
                  countryNames[countryCode] ?? 'unknown name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.forward,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, String> countryNames = {
  'af': 'Afghanistan',
  'al': 'Albania',
  'dz': 'Algeria',
  'as': 'American Samoa',
  'ad': 'Andorra',
  'ao': 'Angola',
  'ai': 'Anguilla',
  'aq': 'Antarctica',
  'ag': 'Antigua and Barbuda',
  'ar': 'Argentina',
  'am': 'Armenia',
  'aw': 'Aruba',
  'au': 'Australia',
  'at': 'Austria',
  'az': 'Azerbaijan',
  'bs': 'Bahamas',
  'bh': 'Bahrain',
  'bd': 'Bangladesh',
  'bb': 'Barbados',
  'by': 'Belarus',
  'be': 'Belgium',
  'bz': 'Belize',
  'bj': 'Benin',
  'bm': 'Bermuda',
  'bt': 'Bhutan',
  'bo': 'Bolivia',
  'bq': 'Bonaire and Saba',
  'ba': 'Bosnia and Herzegovina',
  'bw': 'Botswana',
  'bv': 'Bouvet Island',
  'br': 'Brazil',
  'io': 'British Indian Ocean',
  'bn': 'Brunei Darussalam',
  'bg': 'Bulgaria',
  'bf': 'Burkina Faso',
  'bi': 'Burundi',
  'cv': 'Cabo Verde',
  'kh': 'Cambodia',
  'cm': 'Cameroon',
  'ca': 'Canada',
  'ky': 'Cayman Islands',
  'cf': 'Central African Republic',
  'td': 'Chad',
  'cl': 'Chile',
  'cn': 'China',
  'cx': 'Christmas Island',
  'cc': 'Cocos (Keeling) Islands',
  'co': 'Colombia',
  'km': 'Comoros',
  'cd': 'Congo (DRC)',
  'cg': 'Congo',
  'ck': 'Cook Islands',
  'cr': 'Costa Rica',
  'hr': 'Croatia',
  'cu': 'Cuba',
  'cw': 'Curaçao',
  'cy': 'Cyprus',
  'cz': 'Czech Republic',
  'ci': "Côte d'Ivoire",
  'dk': 'Denmark',
  'dj': 'Djibouti',
  'dm': 'Dominica',
  'do': 'Dominican Republic',
  'ec': 'Ecuador',
  'eg': 'Egypt',
  'sv': 'El Salvador',
  'gq': 'Equatorial Guinea',
  'er': 'Eritrea',
  'ee': 'Estonia',
  'sz': 'Eswatini',
  'et': 'Ethiopia',
  'fk': 'Falkland Islands',
  'fo': 'Faroe Islands',
  'fj': 'Fiji',
  'fi': 'Finland',
  'fr': 'France',
  'gf': 'French Guiana',
  'pf': 'French Polynesia',
  'tf': 'French Sout Territories',
  'ga': 'Gabon',
  'gm': 'Gambia',
  'ge': 'Georgia',
  'de': 'Germany',
  'gh': 'Ghana',
  'gi': 'Gibraltar',
  'gr': 'Greece',
  'gl': 'Greenland',
  'gd': 'Grenada',
  'gp': 'Guadeloupe',
  'gu': 'Guam',
  'gt': 'Guatemala',
  'gg': 'Guernsey',
  'gn': 'Guinea',
  'gw': 'Guinea-Bissau',
  'gy': 'Guyana',
  'ht': 'Haiti',
  'hm': 'Heard  McDonald Islands',
  'va': 'Holy See',
  'hn': 'Honduras',
  'hk': 'Hong Kong',
  'hu': 'Hungary',
  'is': 'Iceland',
  'in': 'India',
  'id': 'Indonesia',
  'ir': 'Iran (Islamic Republic of)',
  'iq': 'Iraq',
  'ie': 'Ireland',
  'im': 'Isle of Man',
  'il': 'Israel',
  'it': 'Italy',
  'jm': 'Jamaica',
  'jp': 'Japan',
  'je': 'Jersey',
  'jo': 'Jordan',
  'kz': 'Kazakhstan',
  'ke': 'Kenya',
  'ki': 'Kiribati',
  'kp': 'Korea (DPR)',
  'kr': 'Korea (Republic of)',
  'kw': 'Kuwait',
  'kg': 'Kyrgyzstan',
  'la': 'Lao (PDR)',
  'lv': 'Latvia',
  'lb': 'Lebanon',
  'ls': 'Lesotho',
  'lr': 'Liberia',
  'ly': 'Libya',
  'li': 'Liechtenstein',
  'lt': 'Lithuania',
  'lu': 'Luxembourg',
  'mo': 'Macao',
  'mg': 'Madagascar',
  'mw': 'Malawi',
  'my': 'Malaysia',
  'mv': 'Maldives',
  'ml': 'Mali',
  'mt': 'Malta',
  'mh': 'Marshall Islands',
  'mq': 'Martinique',
  'mr': 'Mauritania',
  'mu': 'Mauritius',
  'yt': 'Mayotte',
  'mx': 'Mexico',
  'fm': 'Micronesia',
  'md': 'Moldova',
  'mc': 'Monaco',
  'mn': 'Mongolia',
  'me': 'Montenegro',
  'ms': 'Montserrat',
  'ma': 'Morocco',
  'mz': 'Mozambique',
  'mm': 'Myanmar',
  'na': 'Namibia',
  'nr': 'Nauru',
  'np': 'Nepal',
  'nl': 'Netherlands',
  'nc': 'New Caledonia',
  'nz': 'New Zealand',
  'ni': 'Nicaragua',
  'ne': 'Niger',
  'ng': 'Nigeria',
  'nu': 'Niue',
  'nf': 'Norfolk Island',
  'mp': 'Northern Mariana Islands',
  'no': 'Norway',
  'om': 'Oman',
  'pk': 'Pakistan',
  'pw': 'Palau',
  'ps': 'Palestine',
  'pa': 'Panama',
  'pg': 'Papua New Guinea',
  'py': 'Paraguay',
  'pe': 'Peru',
  'ph': 'Philippines',
  'pn': 'Pitcairn',
  'pl': 'Poland',
  'pt': 'Portugal',
  'pr': 'Puerto Rico',
  'qa': 'Qatar',
  'mk': 'North Macedonia',
  'ro': 'Romania',
  'ru': 'Russian Federation',
  'rw': 'Rwanda',
  're': 'Réunion',
  'bl': 'Saint Barthélemy',
  'sh': 'Saint Helena ',
  'kn': 'Saint Kitts and Nevis',
  'lc': 'Saint Lucia',
  'mf': 'Saint Martin ',
  'pm': 'Saint Pierre ',
  'vc': 'Saint Vincent',
  'ws': 'Samoa',
  'sm': 'San Marino',
  'st': 'Sao Tome and Principe',
  'sa': 'Saudi Arabia',
  'sn': 'Senegal',
  'rs': 'Serbia',
  'sc': 'Seychelles',
  'sl': 'Sierra Leone',
  'sg': 'Singapore',
  'sx': 'Sint Maarten ',
  'sk': 'Slovakia',
  'si': 'Slovenia',
  'sb': 'Solomon Islands',
  'so': 'Somalia',
  'za': 'South Africa',
  'gs': 'South Sandwich Islands',
  'ss': 'South Sudan',
  'es': 'Spain',
  'lk': 'Sri Lanka',
  'sd': 'Sudan',
  'sr': 'Suriname',
  'sj': 'Svalbard and Jan Mayen',
  'se': 'Sweden',
  'ch': 'Switzerland',
  'sy': 'Syrian Arab Republic',
  'tw': 'Taiwan',
  'tj': 'Tajikistan',
  'tz': 'Tanzania,Republic of',
  'th': 'Thailand',
  'tl': 'Timor-Leste',
  'tg': 'Togo',
  'tk': 'Tokelau',
  'to': 'Tonga',
  'tt': 'Trinidad and Tobago',
  'tn': 'Tunisia',
  'tr': 'Turkey',
  'tm': 'Turkmenistan',
  'tc': 'Turks and Caicos Islands',
  'tv': 'Tuvalu',
  'ug': 'Uganda',
  'ua': 'Ukraine',
  'ae': 'United Arab Emirates',
  'gb': 'United Kingdom',
  'um': 'United States Minor',
  'us': 'United States of America',
  'uy': 'Uruguay',
  'uz': 'Uzbekistan',
  'vu': 'Vanuatu',
  've': 'Venezuela',
  'vn': 'Viet Nam',
  'vg': 'Virgin Islands (British)',
  'vi': 'Virgin Islands (U.S.)',
  'wf': 'Wallis and Futuna',
  'eh': 'Western Sahara',
  'ye': 'Yemen',
  'zm': 'Zambia',
  'zw': 'Zimbabwe',
  'ax': 'Åland Islands',
};

const List<String> _countryCodes = [
  'af',
  'al',
  'dz',
  'as',
  'ad',
  'ao',
  'ai',
  'aq',
  'ag',
  'ar',
  'am',
  'aw',
  'au',
  'at',
  'az',
  'bs',
  'bh',
  'bd',
  'bb',
  'by',
  'be',
  'bz',
  'bj',
  'bm',
  'bt',
  'bo',
  'bq',
  'ba',
  'bw',
  'bv',
  'br',
  'io',
  'bn',
  'bg',
  'bf',
  'bi',
  'cv',
  'kh',
  'cm',
  'ca',
  'ky',
  'cf',
  'td',
  'cl',
  'cn',
  'cx',
  'cc',
  'co',
  'km',
  'cd',
  'cg',
  'ck',
  'cr',
  'hr',
  'cu',
  'cw',
  'cy',
  'cz',
  'ci',
  'dk',
  'dj',
  'dm',
  'do',
  'ec',
  'eg',
  'sv',
  'gq',
  'er',
  'ee',
  'sz',
  'et',
  'fk',
  'fo',
  'fj',
  'fi',
  'fr',
  'gf',
  'pf',
  'tf',
  'ga',
  'gm',
  'ge',
  'de',
  'gh',
  'gi',
  'gr',
  'gl',
  'gd',
  'gp',
  'gu',
  'gt',
  'gg',
  'gn',
  'gw',
  'gy',
  'ht',
  'hm',
  'va',
  'hn',
  'hk',
  'hu',
  'is',
  'in',
  'id',
  'ir',
  'iq',
  'ie',
  'im',
  'il',
  'it',
  'jm',
  'jp',
  'je',
  'jo',
  'kz',
  'ke',
  'ki',
  'kp',
  'kr',
  'kw',
  'kg',
  'la',
  'lv',
  'lb',
  'ls',
  'lr',
  'ly',
  'li',
  'lt',
  'lu',
  'mo',
  'mg',
  'mw',
  'my',
  'mv',
  'ml',
  'mt',
  'mh',
  'mq',
  'mr',
  'mu',
  'yt',
  'mx',
  'fm',
  'md',
  'mc',
  'mn',
  'me',
  'ms',
  'ma',
  'mz',
  'mm',
  'na',
  'nr',
  'np',
  'nl',
  'nc',
  'nz',
  'ni',
  'ne',
  'ng',
  'nu',
  'nf',
  'mp',
  'no',
  'om',
  'pk',
  'pw',
  'ps',
  'pa',
  'pg',
  'py',
  'pe',
  'ph',
  'pn',
  'pl',
  'pt',
  'pr',
  'qa',
  'mk',
  'ro',
  'ru',
  'rw',
  're',
  'bl',
  'sh',
  'kn',
  'lc',
  'mf',
  'pm',
  'vc',
  'ws',
  'sm',
  'st',
  'sa',
  'sn',
  'rs',
  'sc',
  'sl',
  'sg',
  'sx',
  'sk',
  'si',
  'sb',
  'so',
  'za',
  'gs',
  'ss',
  'es',
  'lk',
  'sd',
  'sr',
  'sj',
  'se',
  'ch',
  'sy',
  'tw',
  'tj',
  'tz',
  'th',
  'tl',
  'tg',
  'tk',
  'to',
  'tt',
  'tn',
  'tr',
  'tm',
  'tc',
  'tv',
  'ug',
  'ua',
  'ae',
  'gb',
  'um',
  'us',
  'uy',
  'uz',
  'vu',
  've',
  'vn',
  'vg',
  'vi',
  'wf',
  'eh',
  'ye',
  'zm',
  'zw',
  'ax',
];
