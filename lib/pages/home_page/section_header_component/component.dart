import 'package:fish_redux/fish_redux.dart';
import 'view.dart';

class SectionHeaderComponent extends Component<String> {
  SectionHeaderComponent()
      : super(
          view: buildView,
        );
}
