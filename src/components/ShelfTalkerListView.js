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

  TableHeader() {
    return (
      <thead>
      <tr>
      <th></th>
      <th>Brewer</th>
      <th>Style</th>
      <th>Name</th>
      <th>Description</th>
      <th>Abv</th>
      <th>Rating</th>

      <th></th>
      </tr>
      </thead>
    );
  }

  render() {
    const { shelfTalkers } = this.props.store;
    const { TableHeader } = this;

    return (
      <div>
      <table className="table">
      <TableHeader />
      <tbody>
        { shelfTalkers.map((talker, idx) => {
          console.log(talker)
          return (
            <ShelfTalkerView talker={talker} key={idx} />
          );
        })
        }
      </tbody>
      </table>
      </div>
    );
  }
}

export default ShelfTalkerListView;
