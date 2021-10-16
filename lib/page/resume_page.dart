import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FractionallySizedBox(
        widthFactor: 0.66,
        child: Column(
          children: [
            buildMapItem(context, "姓名", "区辛"),
            buildMapItem(context, "坐标", "中国 · 河南"),
            buildMapItem(context, "年龄", "90 后"),
            buildMapItem(context, "工作", "Android 开发者（Flutter）"),
            Padding(
              padding: EdgeInsets.only(top: 52.0),
              child: Text(
                "在一天中我会变化。 醒来时是一个人，睡觉时却明明是另一个人。",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 52.0),
              child: Text(
                "探险家人格类型的人是真正的艺术家，这并不是说他们是通常意义上的兴高采烈到郊外画几棵小树的画家。 但他们通常都精于此道。 他们会运用审美，设计，甚至选择和行动来打破社会常规。 探险家人格类型的人喜欢用美感和行为方面的实验来颠覆传统的期望。很有可能他们已经说过不止一次 “不要控制我！”",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black26),
              ),
            ),
            ...buildTitleContentItem(context, "很满意自己的身份", '''
              “探险家” 们生活在一个多彩感性的世界，与人们和想法的联系会让他们深受启发。 他们乐于重新解读这些联系，利用自身和新的视角重新实验和发明。 没有人比他们更喜欢用这种方式去探索和体验。 这营造出一种自发性，使 “探险家” 们看起来变化莫测，甚至对亲密的朋友和所爱的人也是如此。

即便这样，“探险家” 们却是不折不扣的内向型，在他们退到幕后独自养精蓄锐的时候，会让朋友们大吃一惊。 不过虽然在独处，不代表他们闲坐着，他们利用这样的时间自省，审查并重新评判自己的信条。 与纠结于过去或未来相比，他们更愿意思考此时此刻的自己。 然后摇身一变，从他们退隐的地方归来。

“探险家” 们喜欢找各种方式来释放自己的激情。 他们比别的人格类型更容易参与有风险的行为，比如赌博和极限运动。 幸运的是，他们与周围环境的协调使他们比别人更擅长这些。 “探险家” 们也喜欢与人交往，有种很难抗拒的魅力。

他们总会凭借赞美之词软化内心，从即将不负责任鲁莽冒险的边缘拉回来。

但是，如果被批评伤害到，结果会很糟糕。 一些 “探险家” 可以承受措辞友善的评价，把它当作另一个视角，帮助自己把激情指往新的方向。 但如果这些评价刻既刻薄又经不起推敲，他们就会大发雷霆。

“探险家” 对旁人的感受很敏感且重视和谐。 在面对批评时，他们很难做到走到一边冷静下来远离 “风暴中心”。 但活在当下也有其好处，一旦从争论中冷静下来，他们也通常可以不计前嫌，继续前进就当没发生过。
              '''),
            ...buildTitleContentItem(context, "意义存在于生命的每个角落", '''
            “探险家” 面对的最大挑战是计划未来。 找到支持其目标的建设性想法，规划可以制定积极原则的目标，对他们来说并非易事。 与其他人格类型不同的是，“探险家” 们不会从资产和退休两个方面去规划未来。 他们通过计划行动和行为来塑造自己的身份，建立由人生体验而不是股票组成的投资组合。

如果这些计划和信条是高尚的，“探险家” 的行为可以非常无私。但他们也可能建立一个更以自我为中心的身份，行为自私，控制欲强且专门利己毫不利人。 时刻谨记，主动成长为自己想成为的人，这一点至关重要。 培养和维持一个新的习惯可能很不容易，但每天花些时间来理解自己的动机将使 “探险家” 们能够运用自己的优势来追求任何渴望的事物。
            '''),
            Padding(
              padding: EdgeInsets.only(top: 125.0),
              child: Text(
                "-- 后记 --",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 52.0, top: 25.0),
              child: Text(
                "我觉得人应该冲动，一为奋不顾身的爱情，一为说走就走的旅行。而一张火车票，一个背包，一个相机，开始一场说走就走的旅行，也许就是我一直所追求的那股冲动。但不是为了走而走，即如生活一般，不是为了生活而生活。走，为了远方的风景，为了找寻生活中久违的感动，更为了明确自己生活的意义，也许还有其他。",
                style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.black26),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildMapItem(BuildContext context, String key, String values) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Row(
        children: [
          Text("$key："),
          Text(values, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }

  buildTitleContentItem(BuildContext context, String title, String content) {
    return [
      Padding(
        padding: EdgeInsets.only(top: 52.0, bottom: 25.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 0.0),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black26),
        ),
      ),
    ];
  }
}
