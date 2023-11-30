import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:provider/provider.dart';

class SupWorld extends StatefulWidget {
  const SupWorld({Key? key}) : super(key: key);

  @override
  _SupWorldState createState() => _SupWorldState();
}

class _SupWorldState extends State<SupWorld> {
  TextEditingController inputCountry = TextEditingController();
  late List<String> filteredCountries;

  @override
  void initState() {
    super.initState();
    // Initialize filteredCountries with the entire list of supported countries
    final prov = Provider.of<Manager_Provider>(context, listen: false);
    filteredCountries = prov.wRegion;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);
    prov.fetchAndStoreWorldData();
    prov.setworlddata();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    ),
                  ),
                  SizedBox(
                    width: 0.2 * MediaQuery.of(context).size.width,
                  ),
                  Text(
                    'Supported Countries',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: inputCountry,
                onChanged: (query) {
                  setState(() {
                    // Pass the provider to the function
                    updateSearchResultsLocally(query, prov);
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search supported countries',
                  contentPadding: EdgeInsets.symmetric(vertical: 6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: getCountryList(filteredCountries),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateSearchResultsLocally(String query, Manager_Provider prov) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show all countries
        filteredCountries = prov.wRegion;
      } else {
        // Filter countries based on the search query
        filteredCountries = prov.wRegion
            .where((countryCode) => countryNames[countryCode]!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget getCountryList(List<String> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (BuildContext context, int index) {
        final countryCode = countries[index]; // Keep it as uppercase
        final countryName = countryNames.containsKey(countryCode.toLowerCase())
            ? countryNames[countryCode.toLowerCase()]!
            : null;

        if (countryName != null) {
          return Container(
            padding: EdgeInsets.all(2),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff2941b8ea),
            ),
            margin: EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child:
                          CountryFlag.fromCountryCode(countryCode, width: 40),
                    ),
                    Text(
                      countryName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          // Add debugging statements
          print("Unexpected null value: countryCode=$countryCode");
          print("countryNames: $countryNames");

          // Handle the case where the country name is null
          return SizedBox.shrink(); // or any other fallback UI
        }
      },
    );
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
}
