import type { Meta, StoryObj } from '@storybook/react'
import Button from '.'

const meta: Meta<typeof Button> = {
  component: Button,
}

export default meta

export const ClickMe: StoryObj<typeof Button> = {
  args: {
    label: 'click me',
  },
}
