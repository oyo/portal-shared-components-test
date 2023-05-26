import React from 'react'
import './Button.scss'
import Button from '@mui/material/Button'

export interface ButtonProps {
  label: string
  onClick?: (e: React.MouseEvent<HTMLElement>) => void
}

const CXButton: React.FC<ButtonProps> = ({ label, onClick }: ButtonProps) => {
  return (
    <div className="button>">
      <Button onClick={onClick}>{label}</Button>
    </div>
  )
}

export default CXButton
