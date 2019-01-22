import React from 'react'

const Search = props => (
  <div className="book-search">
    <input
      id="term"
      type="search"
      autoComplete="off"
      placeholder="Search"
      className= "book-search-input"
      onChange={ props.handleSearch }
      value={ props.searchTerm }
    />
  </div>
)

export default Search
