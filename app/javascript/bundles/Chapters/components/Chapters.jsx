import React, { Component } from 'react'
import axios from 'axios'
import Chapter from './Chapter'
import Titles from './Titles'

 
export default class Chapters extends Component {
    
  state = {
    chapters: [{}],
    selected: []
  }
 
     
  fetchChapters = () => {
    axios.get(`/books/${this.props.id}/chapters.json`)
      .then(response => {
      const { chapters } = response.data
      let renderedChapter = chapters[0].content
      renderedChapter = this.setPages(renderedChapter)
      this.setState({ chapters: chapters, selected: renderedChapter })
      } )
  }  

  setPages = (str) => {
    let found = false
    let pageNumber = 1500
    let i = pageNumber
    let chapters = []
    let reminder 
    while (found == false){
      if (str[i] == ' '){
        chapters.push(str.substring(0, i))
        reminder = str.substr(i,str.length)
        if(reminder[pageNumber] !== undefined){
          str = reminder
          i = pageNumber
        }else{
          chapters.push(reminder)
          found = true
        }
      }else{
        i++
      }  
    }
   return chapters
  }

  selectChapter = (index) => {
    let renderedChapter = this.state.chapters[index].content
    renderedChapter = this.setPages(renderedChapter)
    this.setState({selected: renderedChapter })
  }

  render(){
    return(
      <div class="chapter-page">
          <div className="titles">
            <h2>Chapters:</h2>
            <ul>
              { this.state.chapters.map((p, index) => {
                  return <Titles key={index} index={index} name={p.name} selectChapter = {this.selectChapter} />
                  })
              }
            </ul>
          </div>
        <Chapter content = {this.state.selected} />
      </div>
    )
  }

  componentDidMount(){
    this.fetchChapters()
  }

  componentDidUpdate() {
    // Typical usage (don't forget to compare props):
    Page.init()
  }
}
