export const formatDateString = (date: Date): string => {
  const year: number = date.getFullYear()
  const month: string = String(date.getMonth() + 1).padStart(2, '0')
  const day: string = String(date.getDate()).padStart(2, '0')

  return `${year}-${month}-${day}`
}

export const formatTimeString = (date: Date): string => {
  const hours: string = String(date.getHours()).padStart(2, '0')
  const minutes: string = String(date.getMinutes()).padStart(2, '0')

  return `${hours}:${minutes}`
}

export const createDateFromStrings = (dateStr: string, timeStr: string): Date => {
  const [year, month, day] = dateStr.split('-').map(Number)
  const [hours, minutes] = timeStr.split(':').map(Number)
  return new Date(year, month - 1, day, hours, minutes)
}

export const getHumanDateString = (timestamp: string): string => {
  return new Date(timestamp).toLocaleDateString()
}

export const getHumanTimeString = (timestamp: string): string => {
  return new Date(timestamp).toLocaleTimeString()
}
