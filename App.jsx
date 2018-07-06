import React from 'react';
import ReactDOM from 'react-dom';

class MyComponent extends React.Component {
   render() {
      return (
          <div>
        <img  src="./images/logo.jpg" alt="logo" height="100" width="100"></img>
        </div>
    );
   }
}
ReactDOM.render(<MyComponent/>, document.getElementById('content'));