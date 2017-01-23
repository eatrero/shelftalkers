import {observable, computed} from 'mobx';

class ShelfTalker {
  @observable checked = false;
  @observable talker;
  constructor(talker) {
    this.talker = talker;
  }
}

export default ShelfTalker;