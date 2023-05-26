import type { Meta, StoryObj } from '@storybook/react'
import Checkbox from '.'

const meta: Meta<typeof Checkbox> = {
  component: Checkbox,
}

export default meta

export const SomeCheckbox: StoryObj<typeof Checkbox> = {
  args: {
    label: 'check me',
  },
}
