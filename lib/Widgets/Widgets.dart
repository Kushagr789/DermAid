import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Search extends StatelessWidget{
  final String hint;

  const Search({super.key, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(left: 24,right: 24,bottom: 15,top: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
              ),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),

              child: TextField(
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(128, 119, 137, 1)
                ),
                decoration: InputDecoration(

                    hintText: hint,
                    border: InputBorder.none,

                    hintStyle: TextStyle(
                      color: Color.fromRGBO(128, 119, 137, 1),
                    )
                ),

              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 213, 205, 1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
              ),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            flex: 2,
          )
        ],

      ),
    );
  }


}

class DoctorCard extends StatelessWidget{
  final int index;
  final  size;
  final data;
  const DoctorCard({super.key, required this.index,required this.size,required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: size.height*0.15,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(249, 249, 249, 1),
          border: Border.all(color: Color.fromRGBO(247, 247, 247, 1),width: 1,strokeAlign: BorderSide.strokeAlignInside),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25)
            )
          ]
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 7),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data['imgUrl'].toString()),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(247, 247, 247, 1),width: 1,strokeAlign: BorderSide.strokeAlignInside)
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.only(top: 15,bottom: 15,right: 20,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data['name'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    data['spec'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(119, 128, 137, 1)
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Rating(rating: data['rating']),
                            Text(" "+data['rating'].toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(119, 128, 137, 1)
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(data['review'].toString()+" reviews",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(119, 128, 137, 1)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}

class Rating extends StatelessWidget{
  final   rating;

  const Rating({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      rating: rating,
      itemSize: 14,
      itemBuilder: (context,_)=>const Icon(
        Icons.star,
        color: Color.fromRGBO(255, 177, 0, 1),
      ),
    );
  }
}