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
    const { shelfTalkers } = this.props.store;
    const { TableHeader } = this;

    return (
      <div>
        <div className="row">
          { shelfTalkers.map((talker, idx) => {
            console.log(talker)
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
