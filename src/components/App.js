import React from 'react';
import styles from './App.css';
import {observable, computed} from 'mobx';
import {observer} from 'mobx-react';
import 'whatwg-fetch';
import ShelfTalkerList from './ShelfTalkerList';
import ShelfTalkerListView from './ShelfTalkerListView';
import PrintButton from './PrintButton';
//import Pagination from './Pagination';
import ShelfTalkerAPI from './ShelfTalkerAPI';
import Pagination from "react-js-pagination";

const store = new ShelfTalkerList();
const api = new ShelfTalkerAPI();

@observer
class App extends React.Component {
  constructor() {
    super(...arguments);
    this.state = { activePage: 1, count: 0 }
  }

  componentDidMount(){
    api.fetchByOffset(this.state.count)
    .then((json) => {
      //       this.setState({shelfTalkers: json.talkers})
      store.clear();
      json.talkers.map((talker) => {
        store.addShelfTalker(talker);
        store.setCount(json.count);        
      });
    }).catch((ex) => {
      console.log('parsing failed', ex)
    });
  }

  handlePageChange(page) {
    console.log('handlePageClick', store, page, this)
    this.setState({ activePage: page, count: 20 * (page - 1) })
    api.fetchByOffset(20 * (page - 1))
    .then((json) => {
      //       this.setState({shelfTalkers: json.talkers})
      store.clear();
      json.talkers.map((talker) => {
        store.addShelfTalker(talker);
        store.setCount(json.count);        
      });
    }).catch((ex) => {
      console.log('parsing failed', ex)
    });
  }

  render(){
    return (
      <div>
        <section className={styles.sideBar}>
          <h1>Shelf Talkers</h1>
          <PrintButton selected={ store.selectedShelfTalkersIds } />
          <a href="/talkers/new"><button className="btn btn-primary btn-block" >New Shelf Talker</button></a>
        </section> 
        <section className={styles.mainContent}>
          <Pagination
            activePage={this.state.activePage}
            itemsCountPerPage={store.size}
            totalItemsCount={store.count}
            pageRangeDisplayed={9}
            onChange={this.handlePageChange.bind(this)} />        
          <ShelfTalkerListView store={store}/>

          <div className='button-row'>
          </div>
        </section>
      </div>
    );
  }
}

export default App;
