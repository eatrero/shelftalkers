import 'whatwg-fetch';
import * as _ from 'lodash';

class ShelfTalkerAPI {
  constructor() {
  }

  fetch(params) {
    const { buildParams } = this;

    const p = buildParams(params)
    const url = `/api/talkers${p}`
    console.log(url)
    return fetch(url)
      .then((resp) => {
        return resp.json()
    })
  }

  fetchByOffset(offset){
    return this.fetch({offset, size: 20})
  }

  buildParams(params) {
    const out = _.reduce(params, (a,v,k) => {
      return `${a}${k}=${v}&`;
    }, '?') || '';
    console.log('build params', out)
    return out;
  }
}

export default ShelfTalkerAPI;