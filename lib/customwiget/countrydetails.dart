import 'package:flutter/material.dart';

import 'package:mobi_esim/customwiget/data.dart';
import 'package:mobi_esim/customwiget/fullplan.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navigate.dart';
import 'package:provider/provider.dart';

class CountryDetails extends StatefulWidget {
  final String countrycode;

  CountryDetails({required this.countrycode});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late bool isDataAvailable; // Add this variable

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    checker(widget.countrycode);
  }

  void checker(String code) {
    final prov = Provider.of<Manager_Provider>(context, listen: false);
    bool foundMatch = false; // Add this variable

    if (prov.myData != null && prov.myData!.data != null) {
      // Assuming prov.myData is not null, check each entry in the data list
      for (var entry in prov.myData!.data!) {
        if (entry.countryCode?.toUpperCase() == code.toUpperCase()) {
          // Found a match, you can now use the entry details
          print('Match found for country code: $code');
          print('Title: ${entry.title}');

          prov.setSelectedCountryData(entry);

          print('this is an instance of prov');

          print(prov.getSelectedCountryData().toString());
          // i wanna print setselected country data all value

          foundMatch = true; // Set the flag to true
          // If you only want to find the first match, you can break here
          break;
        } else {
          foundMatch = false;
        }
      }
    }
    isDataAvailable = foundMatch;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Navigate();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    )),
                SizedBox(
                  width: 0.2 * width,
                ),
                Text(
                  '${countryNames[widget.countrycode]}',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Container(
              height: 0.08 * height,
              width: width,
              child: Center(
                child: TabBar(
                    controller: controller,
                    isScrollable: true,
                    indicator: null,
                    tabs: [
                      Container(
                        height: 0.06 * height,
                        width: 0.4 * width,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(10)),
                        child: Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Data',
                              style: TextStyle(color: Color(0xff41b8ea)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 0.06 * height,
                        width: 0.4 * width,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(10)),
                        child: Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Data/calls/Text',
                              style: TextStyle(color: Color(0xff41b8ea)),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 0.8 * height,
              width: double.infinity,
              child: TabBarView(controller: controller, children: [
                isDataAvailable
                    ? Data(countrycode: widget.countrycode)
                    : Center(
                        child: Text('Sorry, this data is unavailable.'),
                      ),
                isDataAvailable
                    ? Center(
                        child: Text('Sorry, this data is unavailable.'),
                      )
                    : Center(
                        child: Text('Sorry, this data is unavailable.'),
                      ),
              ]),
            ),
          ],
        ),
      ),
    ));
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
