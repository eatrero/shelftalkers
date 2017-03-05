import React from 'react';

class PrintButton extends React.Component {
  render() {
    const { selected } = this.props;
    return (
      <div className={PrintButton.css}>
      <form action='/api/pdf' method="get">
      <input type='hidden' name='selections' value={selected.join(',')} />
      <button
        className="btn btn-success btn-block"
        type="submit"
        disabled={!this.props.selected.length } >
        Print
      </button>
      </form>
      </div>
    );
  }
}
export default PrintButton;
