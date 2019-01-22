import React from 'react'

const Titles = props => (
            <li><a onClick={() => {props.selectChapter(props.index); }}>{props.name}</a></li>

)

export default Titles
