import React from 'react'
import axios from 'axios'
import Book from '../../Books/components/Book'
import Search from '../../Books/components/Search'
import Pagination from '../../Books/components/Pagination'

export default class Favorites extends React.Component {
    state = {
        searchTerm: String(),
        page: 1,
        totalPages: 1,
        favorites: Object.values(this.props)
    }

    fetchBooks = (searchTerm, page) => {
        axios
            .get(`/favorites.json?searchTerm=${searchTerm}&page=${page}`)
            .then(response => {
                const { favorites, page, totalPages } = response.data;
                this.setState({ favorites, searchTerm, page, totalPages })
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
        const { favorites, searchTerm, page, totalPages } = this.state
        return (
            <div className="container">
                <Search
                    searchTerm={searchTerm}
                    handleSearch={this.handleSearch}
                />
                <div className="book-lists">
                    <ul>
                    {
                        favorites.map(x => (
                            <Book key={'book-' + x.id.toString()} name={x.name} genre={x.genre} id={x.id} cover={x.cover} />
                        ))
                    }
                    </ul>
                </div>
                <Pagination
                    page={page}
                    totalPages={totalPages}
                    changePage={this.changePage}
                />
            </div>
        )
    }
}
