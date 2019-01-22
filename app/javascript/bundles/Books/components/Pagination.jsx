import React from 'react'
 
const Pagination = props => (
  <div className="book-pagination" role="toolbar">
      <div className="bookpage-buttons">
      <button
        className='button-pages'
        onClick={ (e) => { props.changePage(1) } }
        rel="first"
      >
        First
      </button>
      <button
        className='button-pages'
        onClick={ (e) => { props.changePage(props.page - 1) } }
        disabled={ props.page === 1 }
        rel="prev"
      >
        Prev
      </button>
      <button
        className='button-pages'
        onClick={ (e) => { props.changePage(props.page + 1) } }
        disabled={ props.page === props.totalPages }
        rel="next"
      >
        Next
      </button>
      <button
        className='button-pages'
        onClick={ (e) => { props.changePage(props.totalPages) } }
        rel="last"
      >
        Last
      </button>
      </div>
      <br></br>
    <div className="pages">
      <div style={{margin: '.375 rem'}}>
        Page {props.page} of {props.totalPages}
      </div>
    </div>
  </div>
)

export default Pagination
