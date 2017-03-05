import {observable, computed} from 'mobx';
import ShelfTalker from './ShelfTalker';

class ShelfTalkerList {
  @observable shelfTalkers = [];

  constructor() {
    this.size = 20;
    this.offset = 0;
    this.count = 0;
  }
  
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

  clear() {
    this.shelfTalkers = [];
  }

  setCount(count) {
    this.count = count;
  }

  getCount() {
    return this.count;
  }
}

export default ShelfTalkerList;