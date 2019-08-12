import 'package:fish_redux/fish_redux.dart';

import '../../../models/video.dart';
import 'view.dart';


class SectionGridComponent extends Component<List<Video>> {
  SectionGridComponent() : super(view: buildView);
}
