import React from 'react';

class Pagination extends React.Component {
  render() {
    const { count } = this.props;
    return (
      <div className={Pagination.css}>
        <button
          className="btn btn-success btn-block" >
          Previous
        </button>
        <button
          className="btn btn-success btn-block" >
          Next
        </button>
      </div>
    );
  }
}
export default Pagination;
