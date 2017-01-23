import React from 'react';
import styles from './App.css';
import {observer} from 'mobx-react';

@observer
class ShelfTalkerView extends React.Component { 
  render() { 
    const talker = this.props.talker;
    console.log(talker)
    return (
      <tr key={talker.talker.id}>
      <td>
      <input 
        type="checkbox"
        checked={talker.checked}
        onChange={() => talker.checked = !talker.checked}
      />
      </td>
      <td>{talker.talker.brewer}</td>
      <td>{talker.talker.name}</td>
      <td>{talker.talker.style}</td>
      <td>{talker.talker.description}</td>
      <td>{talker.talker.abv}</td>
      <td>{talker.talker.rating}</td>
      <td><a href={'/talkers/' + talker.talker.id + '/edit'}><button className='btn btn-warning'>Edit</button></a></td>
      </tr>
    );
  }
}

export default ShelfTalkerView;