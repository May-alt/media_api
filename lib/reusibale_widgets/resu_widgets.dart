import 'package:flutter/material.dart';
import 'package:yummly/ui/screnns/page_views/page_view_screnn.dart';
import 'package:yummly/ui/screnns/search/search_screens.dart';

Widget Reuspadding({
  required Widget? child,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: child,
    );

Widget ReusDivider() => Divider(
      height: 4,
      color: Colors.grey,
    );

Widget buildArticalItems(article, context) => InkWell(
  onTap: (){
    ReusNavigationToPage(context, PageViewScrenn(url: "${article['url']}"));
  },
  child: Container(
    height: 140,
    child: Row(
      children: [
        Container(
          height: 140,
          width: 130,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("${article['urlToImage']}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Reuspadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    // "Devialet's ${"790 Portable Speaker Will Automatically Optimize Its Sound Based on Where You're Using It"}",
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ),
);


 ReusNavigationToPage(context, Widgets) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Widgets;
      }),
    );


 ReusTextFormFiled({
  required TextEditingController? controller,
   required String? hintText,
   required Widget? prefixIcon,
   required void Function(String)? onChanged,
    String? Function(String?)? validator,
}) =>TextFormField(
   validator: validator,
   onChanged: onChanged,
   controller: controller,
   maxLines: 1,
   decoration: InputDecoration(
     contentPadding: EdgeInsets.all(10.0),
     hintText: hintText,
     prefixIcon: prefixIcon,
     border: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.grey),),
     focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.grey),),
   ),
 );