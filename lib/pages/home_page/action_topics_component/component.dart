import 'package:fish_redux/fish_redux.dart';

import 'view.dart';
import '../../../models/home.dart';

class TopicHorizontalComponent extends Component<List<Topic>> {
  TopicHorizontalComponent() : super(view: buildView);
}
