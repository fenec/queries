import React from 'react'

export default class MyApp extends React.Component {o
  constructor(props) {
    super(props)
    this.state = {
      query: '',
      queries_count: props.query.count,
      queries_list: props.query.list
    }
  }

  handleChange = (e) => {
    this.setState({query: e.target.value})
  }

  clearForm = () => {
    this.setState({query: ''})
  }

  handleNewQuery = (result) => {
    this.setState(prevState => ({queries_list: [result.new_query, ...prevState.queries_list]}))
    this.setState({queries_count: result.queries_count})
  }

  submitForm = (e) => {
    e.preventDefault()
    let csrfToken = document.querySelector('meta[name="csrf-token"]').content

    fetch('/queries', {
      method: 'POST',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        query: this.state.query
      }),
      credentials: 'same-origin'
    }).then((response) => { return response.json() })
      .then((result) => {
        this.clearForm()
        this.handleNewQuery(result)
       })
  }

  render() {
    return <div className='container'>
      <div className='left'>
        <form onSubmit={this.submitForm}>
          <textarea name="query" value={this.state.query} onChange={this.handleChange}></textarea>
          <button type='submit' className="submit_button">Submit</button>
        </form>
      </div>
      <div className='right'>
        <span>{this.state.queries_count}</span>
        <div className='queries_list'>
          <ul>
            {
              this.state.queries_list.map((query) => (
                <li key={query.id}>{query.execution_time} - {query.query}</li>
              ))
            }
          </ul>
        </div>
      </div>
    </div>
  }
}
