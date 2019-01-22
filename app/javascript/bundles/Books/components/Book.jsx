import React from 'react';

export default class Book extends React.Component {
    bookClick = () => {
        document.location.href = `/books/${this.props.id}`
    }
    
    render() {
        return ( 
            <li onClick={this.bookClick} style={{cursor: "pointer"}}>
                <div className="card">
                    <div className="card-image">
                        <figure className="image">
                        <img src={this.props.cover} className="img-border-book"/>
                        </figure>
                    </div>
                    <div className="card-content">
                        <div className="book-title-list">
                            {this.props.name}
                        </div>
                    </div>
                </div>
            </li>
        );
    }
}