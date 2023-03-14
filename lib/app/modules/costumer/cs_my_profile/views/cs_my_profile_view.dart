import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../theme.dart';
import '../controllers/cs_my_profile_controller.dart';

class CsMyProfileView extends GetView<CsMyProfileController> {
  const CsMyProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    PreferredSize header(){
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          title: Text(
                'Profile Saya',
                style: textWhiteStyle.copyWith(
                  fontSize: 19,
                  fontWeight: semiBold
                ),
              )
          ),
        );
    }

    Widget content(){
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            padding: EdgeInsets.all(20),
            height: 310,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.5,
                  color: textGreyColor
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/dokter.png',
                        width: 80,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thomas Patrey',
                          style: textStyleBlack.copyWith(
                            fontSize: 19,
                            fontWeight: semiBold
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '085-993-223-443',
                          style: textStyleGrey.copyWith(
                            fontSize: 13
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'thomaspatrey@gmail.com',
                          style: textStyleGrey.copyWith(
                            fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                    Divider(
                      thickness: 2,
                      color: textGreyColor,
                    ),
                  SizedBox(height: 15),
                  Text(
                    'Tanggal Lahir',
                    style: textStyleGrey.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '01 Januari 2001',
                    style: textStyleBlack.copyWith(
                      fontSize: 13
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Jenis Kelamin',
                    style: textStyleGrey.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Laki - Laki',
                    style: textStyleBlack.copyWith(
                      fontSize: 13
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Kota/Kabupaten',
                    style: textStyleGrey.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Makassar',
                    style: textStyleBlack.copyWith(
                      fontSize: 13
                    ),
                  ),
            
              ],
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'profilEdit');
            }, 
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 165
              ),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            child: Text(
              'Ubah',
              style: textWhiteStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold
              ),
            )
            )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      body: content(),
    );

  }
}
