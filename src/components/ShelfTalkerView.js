import React from 'react';
import styles from './ShelfTalkerView.css';
import {observer} from 'mobx-react';

@observer
class ShelfTalkerView extends React.Component { 
  getDescriptionStyle(len) {
    if (len < 60) {
      return styles.talkerDescriptionShort;
    } else if (len < 120) {
      return styles.talkerDescriptionMed;      
    }
    return styles.talkerDescriptionLong;
  }

  render() { 
    const talker = this.props.talker;
    const descriptionStyle = this.getDescriptionStyle(talker.talker.description.length);
    console.log('length', talker.talker.description.length, descriptionStyle)

    return (
      <div className="col-sm-12 col-md-9 col-lg-6">
        <div className={styles.talkerWrapper}>
          <div className={styles.checkMarkWrapper}>
            <input 
              type="checkbox"
              checked={talker.checked}
              onChange={() => talker.checked = !talker.checked}
            />
          </div>
          <div key={talker.talker.id} className={styles.talkerCard}>
            <section className={styles.talkerHeader}>
              <div className={styles.talkerName}>{talker.talker.beer}</div>
              <div className={styles.headerInfo}>
                <div className={styles.talkerBrewer}>{talker.talker.brewer}</div>
                <div className={styles.talkerStyle}>{talker.talker.style}</div>
              </div>
            </section>
            <section className={styles.talkerBody}>
              <div className={descriptionStyle}>{talker.talker.description}</div>
            </section>
            <section className={styles.talkerFooter}>
              <div className={styles.talkerABV}>ABV: {talker.talker.abv}</div>
              <div className={styles.talkerRating}>RATE BEER: {talker.talker.rating}</div>
            </section>
          </div>
        </div>
      </div>
    );
  }
}

export default ShelfTalkerView;