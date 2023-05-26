import React from 'react'
import { render } from '@testing-library/react'
import Checkbox from '.'

describe('Checkbox', () => {
  test('renders the Checkbox component', () => {
    render(<Checkbox label="Hello world!" />)
  })
})
