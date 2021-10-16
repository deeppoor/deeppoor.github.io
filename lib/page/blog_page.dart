import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// class BlogPage extends StatefulWidget {
//   @override
//   _BlogPageState createState() => _BlogPageState();
// }
//
// class _BlogPageState extends State<BlogPage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: DefaultAssetBundle.of(context).loadString("md/Compose_vs_Flutter.md"),
//         initialData: "",
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           String blogStr = snapshot.data;
//           return Theme(
//             data: ThemeData(primarySwatch: Colors.blue),
//             child: Markdown(data: blogStr),);
//         });
//   }
// }
class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return buildBlogItem(context, index);
        },
        childCount: 10,
      ),
    );
  }

  Widget buildBlogItem(BuildContext context, int index) {
    return FractionallySizedBox(
      widthFactor: 0.66,
      child: Column(
        children: [
          Divider(color: Colors.black26.withAlpha(125), height: 1.0,indent: 2.0,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 52.0),
            child: Text(
              "兰亭集序",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Image.network("https://pic.baike.soso.com/ugc/baikepic2/3512/20160719043107-462201403.jpg/800",fit: BoxFit.cover,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0),
            child: Text(
              '''
          永和九年，岁在癸丑，暮春之初，会于会 (kuài) 稽山阴之兰亭，修禊 (xì) 事也。群贤毕至，少长 (zhǎng) 咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右，引以为流觞 (shāng) 曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。

是日也，天朗气清，惠风和畅。仰观宇宙之大，俯察品类之盛，所以游目骋怀，足以极视听之娱，信可乐也。

夫人之相与，俯仰一世。或取诸怀抱，悟言一室之内；或因寄所托，放浪形骸之外。虽趣舍万殊，静躁不同，当其欣于所遇，暂得于己，快然自足，不知老之将至；及其所之既倦，情随事迁，感慨系之矣。向之所欣，俯仰之间，以为陈迹，犹不能不以之兴怀，况修短随化，终期于尽！古人云：“死生亦大矣”，岂不痛哉！

每览昔人兴感之由，若合一契，未尝不临文嗟悼 (jiē dào)，不能喻之于怀。固知一死生为虚诞，齐彭殇 (shāng) 为妄作。后之视今，亦犹今之视昔，悲夫！故列叙时人，录其所述，虽世殊事异，所以兴怀，其致一也。后之览者，亦将有感于斯文。
          ''',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 18.0),child: Text("-- Posted by 1993/01/22 --",style: Theme.of(context).textTheme.caption,),),
          Padding(padding: EdgeInsets.only(top: 15.0,bottom: 125.0),child: Text("#古文 #王羲之",style: Theme.of(context).textTheme.caption,),),
        ],
      ),
    );
  }
}
