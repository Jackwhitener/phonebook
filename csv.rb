require 'csv'
def writetopage(row)
    CSV.open('book.csv', 'a+') do |csv|
        csv << row
    end
end
def readfrompage(array)
    CSV.foreach('book.csv') do |row|
        array << row
    end
    return array
end
def deletefrompage(row)
    CSV.open('book.csv', 'wb') do |csv|
        if csv.include?(row)
            csv = csv.delete(row)
        end
    end
end