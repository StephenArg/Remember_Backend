import React from 'react'
 
const HeaderLinks = props => {

  const handleClick = () => {
    if (window.location.pathname === '/') {
      window.location.href = '/calendar'
    } else {
      window.location.pathname = '/'
    }
  }

  const handleBackupClick = () => {
    window.location.href = '/backup'
  }

  const handleLogOut = () => {
    localStorage.removeItem("token")
    window.location.href = '/'
  }

  return (
    <div>
      {props.onBackup ? null : <strong id='calendar-link' style={{position:"absolute", top: "87px", right:"290px" }} onClick={handleBackupClick}>Backup/Restore</strong> }
      {props.onHome ? <strong id='calendar-link' style={{position:"absolute", top: "87px", right:"147px" }} onClick={handleClick}>Search</strong> :
      <strong id='calendar-link' style={{position:"absolute", top: "87px", right:"155px" }} onClick={handleClick}>Home</strong> }
      <strong id='calendar-link' style={{position:"absolute", top: "87px", right:"10px" }} onClick={handleLogOut}>Log out</strong>
    </div>
  )
}
 
export default HeaderLinks