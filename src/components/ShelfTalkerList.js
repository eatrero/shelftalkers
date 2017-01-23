import {observable, computed} from 'mobx';
import ShelfTalker from './ShelfTalker';

class ShelfTalkerList {
  @observable shelfTalkers = [];
  
  @computed get selectedShelfTalkersCount() {
    return this.shelfTalkers.filter(
      shelfTalker => shelfTalker.checked === true
    ).length;
  }

  @computed get selectedShelfTalkersIds() {
    return this.shelfTalkers.filter(
      shelfTalker => shelfTalker.checked === true
    ).map(shelfTalker => shelfTalker.talker.id);
  }

  addShelfTalker(shelfTalker) {
    this.shelfTalkers.push(new ShelfTalker(shelfTalker));
  }
}

export default ShelfTalkerList;