// ./src/components/App.js
import React from 'react';
import styles from './App.css';
import {observer} from 'mobx-react';
import ShelfTalkerView from './ShelfTalkerView';

@observer
class ShelfTalkerListView extends React.Component {
  constructor() {
    super(...arguments);
  }

  render() {
    const { shelfTalkers, offset, size } = this.props.store;
    const { TableHeader } = this;

    const start = size*offset;
    const end = start + size - 1;

    return (
      <div>
        <div className="row">
          { shelfTalkers.slice(start, end).map((talker, idx) => {
            return (
              <ShelfTalkerView talker={talker} key={idx}/>
            );
          })
          }
        </div>
      </div>
    );
  }
}

export default ShelfTalkerListView;
