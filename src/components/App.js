import React from 'react';
import styles from './App.css';
import {observable, computed} from 'mobx';
import {observer} from 'mobx-react';
import 'whatwg-fetch';
import ShelfTalkerList from './ShelfTalkerList';
import ShelfTalkerListView from './ShelfTalkerListView';
import PrintButton from './PrintButton';

const store = new ShelfTalkerList();

@observer
class App extends React.Component {
  componentDidMount(){
    this.fetchShelfTalkers();
  }

  fetchShelfTalkers() {
    fetch('/api/talkers')
    .then((response) => {
      return response.json()
    }).then((json) => {
      console.log('parsed json', json)
      //       this.setState({shelfTalkers: json.talkers})
      json.talkers.map((talker) => {
        store.addShelfTalker(talker);
      });
    }).catch((ex) => {
      console.log('parsing failed', ex)
    });   
  }

  render(){
    return (
      <div>
        <section className="side-bar">
          <h1>Shelf Talkers</h1>
           <PrintButton selected={ store.selectedShelfTalkersIds } />
           <a href="/talkers/new"><button className="btn btn-primary btn-block" >New Shelf Talker</button></a>
        </section> 
        <section className="main-content">
          <ShelfTalkerListView store={store}/>

          <div className='button-row'>
          </div>
        </section>
      </div>
    );
  }
}

export default App;
