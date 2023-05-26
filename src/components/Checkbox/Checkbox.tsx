import React from 'react'
import './Checkbox.scss'
import Checkbox from '@mui/material/Checkbox'

interface CheckboxProps {
  label: string
}

const CBox: React.FC<CheckboxProps> = ({ label }: CheckboxProps) => {
  return (
    <div className="checkbox">
      <Checkbox />
      {label}
    </div>
  )
}

export default CBox
