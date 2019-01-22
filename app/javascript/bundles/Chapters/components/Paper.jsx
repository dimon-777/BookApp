import React, { Component } from 'react'

  class Paper extends Component {
    
    render(){
      return(
        <div className="bb-item">
                <div className="inner-chapter" id="just">
                    <div id="col" dangerouslySetInnerHTML={{ __html: this.props.page }} />
                    <ul className="actions">
                     <li>Page {this.props.index+1} of {this.props.totalPages}</li>	
                    </ul>	
                </div>
        </div> 
      )
    }
  }

export default Paper
