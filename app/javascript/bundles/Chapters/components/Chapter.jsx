import React from 'react'
import Paper from './Paper'

const Chapter = props => (
    <div className="chapter-center">
    <div className="bb-custom-wrapper">
    <div id="bb-bookblock" className="bb-bookblock">
         {
           props.content.map((p, index) => {
            return <Paper key={index} page={p} index={index} totalPages={props.content.length}/>
            })
        }
    </div>
    <nav>
        <a id="bb-nav-first" href="#" className="bb-custom-icon bb-custom-icon-first">First page</a>
        <a id="bb-nav-prev" href="#" className="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
        <a id="bb-nav-next" href="#" className="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
        <a id="bb-nav-last" href="#" className="bb-custom-icon bb-custom-icon-last">Last page</a>
    </nav>
    </div>
    </div>

)

export default Chapter
