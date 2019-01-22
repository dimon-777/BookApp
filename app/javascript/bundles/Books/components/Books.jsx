import React from 'react';
import Book from './Book';
import Pagination from './Pagination'
import axios from 'axios'
import Search from './Search'

export default class Books extends React.Component {
    state = {
        searchTerm:       '',
        page:             1,
        totalPages:       1,
        genres:          Object.values(this.props)
      }

    fetchBooks = (searchTerm, page) => {
        axios.get(`/books.json?searchTerm=${searchTerm}&page=${page}`)
            .then(response => {
                const { genres, page, totalPages } = response.data
                this.setState({ genres, searchTerm, page, totalPages })
            })
        
    }

    componentDidMount() {
        const { searchTerm, page } = this.state
        this.fetchBooks(searchTerm, page);
    }

    handleSearch = event => {
        const searchTerm = event.target.value
        const page = 1
        this.fetchBooks(searchTerm, page)
      }

    changePage = page => {
        const { searchTerm } = this.state
        this.fetchBooks(searchTerm, page)
      }

    render() {
        const { genres, searchTerm, page, totalPages } = this.state
        return (
            <div className="container">
            <Search
                searchTerm={searchTerm}
                handleSearch={this.handleSearch}
                />
                <div class="book-wrapper">
                {
                    // Object.values(this.props).map(element => (
                    genres.map( element => (
                        <div className="book-lists" key={'genre-' + element.genre}>
                            <p className="genre">{element.genre}</p>
                            <ul>
                            {
                                element.books.map(x => (
                                    <Book key={'book-' + x.id.toString()} name={x.name} genre={x.genre} cover={x.cover} id={x.id} />
                                ))
                            }                            
                            </ul>
                        </div>
                    ))
                }
                </div>
                 
                <Pagination
                    page={page}
                    totalPages={totalPages}
                    changePage={this.changePage}
                    />
            </div>
        );
    }

}
