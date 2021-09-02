
import 'package:flutter/material.dart';
import 'login_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CircleAvatar(
        backgroundColor: Color(0XFFF5F6F9),
        child: Column(
          children: [
            Spacer(),
            Text('DiaryBook.', 
            style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 40,),
            Text('"Document your life"', style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black26
              ),),
              SizedBox(height: 40,),
              Container(
                width: 220,
                height: 40,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(Icons.login), 
                  label: Text('Sing to Get Started'),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(
                       
                     ),
                      )
                     );
                  }, 
                ),
              ),
              Spacer(),
          ],
        ),
      ),
    );
  }
}